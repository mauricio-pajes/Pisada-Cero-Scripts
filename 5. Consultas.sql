USE PisadaCero;
GO

CREATE PROCEDURE sp_ReporteImpactoInstitucional
    @PeriodoId CHAR(10) -- periodo a evaluar
AS
BEGIN
    SET NOCOUNT ON;

    -- Consolida CO₂e por institución, categoría y periodo
    SELECT
        CASE WHEN datos.Ins_Id IS NULL THEN 'SIN_INST' ELSE datos.Ins_Id END AS Ins_Id,
        CASE WHEN datos.Ins_RazonSocial IS NULL THEN 'Usuarios Individuales' ELSE datos.Ins_RazonSocial END AS Institucion,
        datos.Cat_Id,
        datos.Cat_Nombre,
        datos.Per_Id,
        datos.Per_Etiqueta,
        datos.TotalCo2e
    FROM (
        SELECT
            i.Ins_Id,
            i.Ins_RazonSocial,
            cat.Cat_Id,
            cat.Cat_Nombre,
            per.Per_Id,
            per.Per_Etiqueta,
            SUM(
                CASE
                    WHEN rea.Rea_Co2eCalculado IS NOT NULL THEN rea.Rea_Co2eCalculado
                    ELSE (CASE WHEN rea.Rea_Cantidad IS NULL THEN 0 ELSE rea.Rea_Cantidad END)
                         * (CASE WHEN fe.Fae_ValorFactor IS NULL THEN 0 ELSE fe.Fae_ValorFactor END)
                END
            ) AS TotalCo2e
        FROM PeriodoCalendario per
        INNER JOIN RegistroActividad rea ON rea.Rea_FechaActividad BETWEEN per.Per_FechaInicio AND per.Per_FechaFin
        INNER JOIN TipoActividad ta ON ta.Tip_Id  = rea.Tip_Id
        INNER JOIN CategoriaHuella cat ON cat.Cat_Id = ta.Cat_Id
        INNER JOIN Usuario u ON u.Usu_Id   = rea.Usu_Id
        LEFT  JOIN UsuarioInstitucion ui ON ui.Usu_Id = u.Usu_Id
                                          AND (ui.Uin_FechaInicio IS NULL OR ui.Uin_FechaInicio <= per.Per_FechaFin)
                                          AND (ui.Uin_FechaFin    IS NULL OR ui.Uin_FechaFin    >= per.Per_FechaInicio)
        LEFT  JOIN Institucion i ON i.Ins_Id = ui.Ins_Id
        LEFT  JOIN FactorEmision fe ON fe.Tip_Id = ta.Tip_Id
                                    AND fe.Per_Id = per.Per_Id
        WHERE per.Per_Id = @PeriodoId
        GROUP BY
            i.Ins_Id,
            i.Ins_RazonSocial,
            cat.Cat_Id,
            cat.Cat_Nombre,
            per.Per_Id,
            per.Per_Etiqueta
    ) AS datos
    ORDER BY datos.TotalCo2e DESC;
END;
GO

CREATE PROCEDURE sp_ReduccionMensualUsuarios
    @PeriodoActual CHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PeriodoPrevio CHAR(10);

    SELECT @PeriodoPrevio = MAX(Per_Id)
    FROM PeriodoCalendario
    WHERE Per_FechaFin < (
        SELECT Per_FechaInicio
        FROM PeriodoCalendario
        WHERE Per_Id = @PeriodoActual
    );

    SELECT
        u.Usu_Id,
        u.Usu_Nombres,
        u.Usu_Apellidos,
        ISNULL(actual.TotalCo2e, 0) AS Co2e_PeriodoActual,
        ISNULL(previo.TotalCo2e, 0) AS Co2e_PeriodoPrevio,
        ISNULL(previo.TotalCo2e, 0) - ISNULL(actual.TotalCo2e, 0) AS ReduccionAbsoluta,
        CASE
            WHEN ISNULL(previo.TotalCo2e, 0) = 0 THEN 0
            ELSE (ISNULL(previo.TotalCo2e, 0) - ISNULL(actual.TotalCo2e, 0)) / ISNULL(previo.TotalCo2e, 0)
        END AS ReduccionPorcentual,
        CASE
            WHEN ISNULL(previo.TotalCo2e, 0) = 0 AND ISNULL(actual.TotalCo2e, 0) = 0 THEN 'Sin datos'
            WHEN ISNULL(actual.TotalCo2e, 0) < ISNULL(previo.TotalCo2e, 0) THEN 'Mejora'
            WHEN ISNULL(actual.TotalCo2e, 0) = ISNULL(previo.TotalCo2e, 0) THEN 'Estable'
            ELSE 'Alza'
        END AS Tendencia
    FROM Usuario u
    LEFT JOIN (
        SELECT
            rea.Usu_Id,
            SUM(
                CASE
                    WHEN rea.Rea_Co2eCalculado IS NOT NULL THEN rea.Rea_Co2eCalculado
                    ELSE (CASE WHEN rea.Rea_Cantidad IS NULL THEN 0 ELSE rea.Rea_Cantidad END) *
                         (CASE WHEN fe.Fae_ValorFactor IS NULL THEN 0 ELSE fe.Fae_ValorFactor END)
                END
            ) AS TotalCo2e
        FROM PeriodoCalendario per
        INNER JOIN RegistroActividad rea ON rea.Rea_FechaActividad BETWEEN per.Per_FechaInicio AND per.Per_FechaFin
        INNER JOIN TipoActividad ta ON ta.Tip_Id = rea.Tip_Id
        LEFT  JOIN FactorEmision fe ON fe.Tip_Id = ta.Tip_Id AND fe.Per_Id = per.Per_Id
        WHERE per.Per_Id = @PeriodoActual
        GROUP BY rea.Usu_Id
    ) AS actual ON actual.Usu_Id = u.Usu_Id
    LEFT JOIN (
        SELECT
            rea.Usu_Id,
            SUM(
                CASE
                    WHEN rea.Rea_Co2eCalculado IS NOT NULL THEN rea.Rea_Co2eCalculado
                    ELSE (CASE WHEN rea.Rea_Cantidad IS NULL THEN 0 ELSE rea.Rea_Cantidad END) *
                         (CASE WHEN fe.Fae_ValorFactor IS NULL THEN 0 ELSE fe.Fae_ValorFactor END)
                END
            ) AS TotalCo2e
        FROM PeriodoCalendario per
        INNER JOIN RegistroActividad rea ON rea.Rea_FechaActividad BETWEEN per.Per_FechaInicio AND per.Per_FechaFin
        INNER JOIN TipoActividad ta ON ta.Tip_Id = rea.Tip_Id
        LEFT  JOIN FactorEmision fe ON fe.Tip_Id = ta.Tip_Id AND fe.Per_Id = per.Per_Id
        WHERE per.Per_Id = @PeriodoPrevio
        GROUP BY rea.Usu_Id
    ) AS previo ON previo.Usu_Id = u.Usu_Id
    ORDER BY ReduccionAbsoluta DESC;
END;
GO

CREATE PROCEDURE sp_AvanceMetasUsuarios
    @PeriodoId CHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        m.Met_Id,
        u.Usu_Id,
        u.Usu_Nombres,
        u.Usu_Apellidos,
        m.Met_TipoMeta,
        m.Met_ValorObjetivo,
        ISNULL(av.ValorReal,0) AS ValorRealPeriodo,
        m.Met_ValorObjetivo - ISNULL(av.ValorReal,0) AS GapVsObjetivo,
        CASE
            WHEN m.Met_ValorObjetivo=0 THEN 0
            ELSE ISNULL(av.ValorReal,0)/m.Met_ValorObjetivo
        END AS PorcentajeUsoObjetivo,
        CASE
            WHEN m.Met_ValorObjetivo=0 THEN 'Sin objetivo'
            WHEN ISNULL(av.ValorReal,0)<=m.Met_ValorObjetivo THEN 'En rango'
            WHEN ISNULL(av.ValorReal,0)<=m.Met_ValorObjetivo*1.1 THEN 'Alerta'
            ELSE 'Riesgo'
        END AS EstadoAlerta
    FROM MetaUsuario m
    INNER JOIN Usuario u ON u.Usu_Id=m.Usu_Id
    LEFT JOIN (
        SELECT
            rea.Usu_Id,
            SUM(
                CASE
                    WHEN rea.Rea_Co2eCalculado IS NOT NULL THEN rea.Rea_Co2eCalculado
                    ELSE (CASE WHEN rea.Rea_Cantidad IS NULL THEN 0 ELSE rea.Rea_Cantidad END)
                         * (CASE WHEN fe.Fae_ValorFactor IS NULL THEN 0 ELSE fe.Fae_ValorFactor END)
                END
            ) AS ValorReal
        FROM PeriodoCalendario per
        INNER JOIN RegistroActividad rea ON rea.Rea_FechaActividad BETWEEN per.Per_FechaInicio AND per.Per_FechaFin
        INNER JOIN TipoActividad ta ON ta.Tip_Id=rea.Tip_Id
        LEFT JOIN FactorEmision fe ON fe.Tip_Id=ta.Tip_Id AND fe.Per_Id=per.Per_Id
        WHERE per.Per_Id=@PeriodoId
        GROUP BY rea.Usu_Id
    ) AS av ON av.Usu_Id=m.Usu_Id
    ORDER BY EstadoAlerta DESC, PorcentajeUsoObjetivo DESC;
END;
GO
