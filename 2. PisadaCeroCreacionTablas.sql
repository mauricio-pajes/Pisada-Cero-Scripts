Use PisadaCero

CREATE TABLE CategoriaHuella
(
    Cat_Id          CHAR(10)     NOT NULL,
    Cat_Nombre      VARCHAR(80)  NULL,
    Cat_Descripcion VARCHAR(120) NULL,
    Cat_UnidadBase  VARCHAR(40)  NULL,
    Cat_Icono       VARCHAR(120) NULL,
    Cat_Orden       SMALLINT     NULL,
    Cat_ColorHex    VARCHAR(7)   NULL,
    PRIMARY KEY (Cat_Id)
);

CREATE TABLE ConsentimientoUsuario
(
    Con_Id                 CHAR(10)    NOT NULL,
    Con_TipoConsentimiento VARCHAR(60) NULL,
    Con_VersionDocumento   VARCHAR(20) NULL,
    Con_FechaRespuesta     DATETIME    NULL,
    Con_Estado             VARCHAR(20) NULL,
    Usu_Id                 CHAR(10)    NOT NULL,
    PRIMARY KEY (Con_Id)
);

CREATE TABLE CuentaAccceso
(
    Cue_Id             CHAR(10)     NOT NULL,
    Cue_CorreoLogin    VARCHAR(150) NULL,
    Cue_HashContrasena VARCHAR(255) NULL,
    Cue_Estado         VARCHAR(30)  NULL,
    Cue_UltimoIngreso  DATETIME     NULL,
    Usu_Id             CHAR(10)     NOT NULL,
    PRIMARY KEY (Cue_Id)
);

CREATE TABLE Departamento
(
    Dep_Id           CHAR(10)    NOT NULL,
    Dep_CodigoReniec VARCHAR(6)  NULL,
    Dep_Nombre       VARCHAR(80) NULL,
    Dep_Abreviatura  VARCHAR(10) NULL,
    PRIMARY KEY (Dep_Id)
);

CREATE TABLE Distrito
(
    Dis_Id            CHAR(10)    NOT NULL,
    Dis_Nombre        VARCHAR(80) NULL,
    Dis_CodigoUbigeo  VARCHAR(6)  NULL,
    Dis_ZonaClimatica VARCHAR(40) NULL,
    Dis_Altitud       INT         NULL,
    Pro_Id            CHAR(10)    NOT NULL,
    PRIMARY KEY (Dis_Id)
);

CREATE TABLE EventoAuditoria
(
    Eve_Id          CHAR(10)     NOT NULL,
    Eve_TipoEvento  VARCHAR(60)  NULL,
    Eve_FechaEvento DATETIME     NULL,
    Eve_IpOrigen    VARCHAR(45)  NULL,
    Eve_Detalle     VARCHAR(299) NULL,
    Cue_Id          CHAR(10)     NOT NULL,
    PRIMARY KEY (Eve_Id)
);

CREATE TABLE FactorEmision
(
    Fae_Id               CHAR(10)      NOT NULL,
    Fae_ValorFactor      DECIMAL(14,6) NULL,
    Fae_UnidadFactor     VARCHAR(40)   NULL,
    Fae_NivelConfianza   VARCHAR(20)   NULL,
    Fae_FechaPublicacion DATETIME      NULL,
    Fae_Vigente          BIT           NULL,
    Tip_Id               CHAR(10)      NOT NULL,
    Fuf_Id               CHAR(10)      NOT NULL,
    Per_Id               CHAR(10)      NOT NULL,
    PRIMARY KEY (Fae_Id)
);

CREATE TABLE FuenteFactor
(
    Fuf_Id                   CHAR(10)     NOT NULL,
    Fuf_Nombre               VARCHAR(120) NULL,
    Fuf_InstitucionEmisora   VARCHAR(120) NULL,
    Fuf_ReferenciaDocumental VARCHAR(120) NULL,
    Fuf_FechaPublicacion     DATETIME     NULL,
    Fuf_Enlace               VARCHAR(255) NULL,
    Fuf_Licencia             VARCHAR(80)  NULL,
    PRIMARY KEY (Fuf_Id)
);

CREATE TABLE GrupoImpacto
(
    Cri_Id               CHAR(10)     NOT NULL,
    Gri_Nombre           VARCHAR(100) NULL,
    Gri_Proposito        VARCHAR(MAX) NULL,
    Gri_Privacidad       VARCHAR(20)  NULL,
    Gri_FechaCreacion    DATETIME     NULL,
    Gri_CodigoInvitacion VARCHAR(16)  NULL,
    Usu_Id               CHAR(10)     NOT NULL,
    PRIMARY KEY (Cri_Id)
);

CREATE TABLE GrupoMiembro
(
    Usu_Id           CHAR(10)     NOT NULL,
    Cri_Id           CHAR(10)     NOT NULL,
    Grm_RolGrupo     VARCHAR(40)  NULL,
    Grm_FechaIngreso DATETIME     NULL,
    Grm_FechaSalida  DATETIME     NULL,
    Grm_Estado       VARCHAR(20)  NULL
);

CREATE TABLE Institucion
(
    Ins_Id               CHAR(10)     NOT NULL,
    Ins_RazonSocial      VARCHAR(150) NULL,
    Ins_Documento        VARCHAR(20)  NULL,
    Ins_Sector           VARCHAR(80)  NULL,
    Ins_CorreoContacto   VARCHAR(150) NULL,
    Ins_TelefonoContacto VARCHAR(20)  NULL,
    Ins_FechaRegistro    DATETIME     NULL,
    Tin_Id               CHAR(10)     NOT NULL,
    Dis_Id               CHAR(10)     NOT NULL,
    PRIMARY KEY (Ins_Id)
);

CREATE TABLE InvitacionGrupo
(
    Inv_Id             CHAR(10)     NOT NULL,
    Inv_Estado         VARCHAR(20)  NULL,
    Inv_FechaEnvio     DATETIME     NULL,
    Inv_FechaRespuesta DATETIME     NULL,
    Inv_Canal          VARCHAR(40)  NULL,
    Inv_Token          VARCHAR(120) NULL,
    Cri_Id             CHAR(10)     NOT NULL,
    PRIMARY KEY (Inv_Id)
);

CREATE TABLE Logro
(
    Log_Id              CHAR(10)     NOT NULL,
    Log_Nombre          VARCHAR(80)  NULL,
    Log_Descripcion     VARCHAR(120) NOT NULL,
    Log_Condicion       VARCHAR(120) NULL,
    Log_PuntosOtorgados INT          NULL,
    Log_Icono           VARCHAR(120) NULL,
    Log_Nivel           SMALLINT     NULL,
    PRIMARY KEY (Log_Id)
);

CREATE TABLE LogroUsuario
(
    Usu_Id             CHAR(10)     NOT NULL,
    Log_Id             CHAR(10)     NOT NULL,
    Lgu_FechaObtencion DATETIME     NULL,
    Lgu_Evidencia      VARCHAR(120) NULL,
    Lgu_Estado         VARCHAR(20)  NULL
);

CREATE TABLE MetaUsuario
(
    Met_Id                CHAR(10)     NOT NULL,
    Met_TipoMeta          VARCHAR(40)  NULL,
    Met_ValorObjetivo     FLOAT        NULL,
    Met_Estado            VARCHAR(20)  NULL,
    Met_FechaCumplimiento DATE         NULL,
    Met_Descripcion       VARCHAR(120) NULL,
    Usu_Id                CHAR(10)     NOT NULL,
    PRIMARY KEY (Met_Id)
);

CREATE TABLE MovimientoPuntos
(
    Mov_Id               CHAR(10)     NOT NULL,
    Mov_TipoMovimiento   VARCHAR(40)  NULL,
    Mov_Puntos           INT          NULL,
    Mov_FechaMovimiento  DATETIME     NULL,
    Mov_ReferenciaOrigen VARCHAR(80)  NULL,
    Mov_Descripcion      VARCHAR(120) NULL,
    Mov_SaldoResultante  INT          NULL,
    Usu_Id               CHAR(10)     NOT NULL,
    PRIMARY KEY (Mov_Id)
);

CREATE TABLE NotificacionEnviada
(
    Not_Id               CHAR(10)    NOT NULL,
    Not_FechaEnvio       DATETIME    NULL,
    Not_CanalUtilizado   VARCHAR(20) NULL,
    Not_ResultadoEnvio   VARCHAR(40) NULL,
    Not_RespuestaUsuario VARCHAR(60) NULL,
    Not_FechaInteraccion DATETIME    NULL,
    Prn_Id               CHAR(10)    NOT NULL,
    PRIMARY KEY (Not_Id)
);

CREATE TABLE ParametroActividad
(
    Par_Id              CHAR(10)    NOT NULL,
    Par_NombreParametro VARCHAR(80) NULL,
    Par_TipoDato        VARCHAR(40) NULL,
    Par_Unidad          VARCHAR(30) NULL,
    Par_ValorMinimo     FLOAT       NULL,
    Par_ValorMaximo     FLOAT       NULL,
    Par_Obligatorio     BIT         NULL,
    PRIMARY KEY (Par_Id)
);

CREATE TABLE PeriodoCalendario
(
    Per_Id          CHAR(10)    NOT NULL,
    Per_TipoPeriodo VARCHAR(20) NULL,
    Per_FechaInicio DATETIME    NULL,
    Per_FechaFin    DATETIME    NULL,
    Per_Etiqueta    VARCHAR(40) NULL,
    Per_EsCerrado   BIT         NULL,
    PRIMARY KEY (Per_Id)
);

CREATE TABLE PlantillaNotificacion
(
    Pla_Id        CHAR(10)     NOT NULL,
    Pla_Nombre    VARCHAR(80)  NULL,
    Pla_Canal     VARCHAR(20)  NULL,
    Pla_Titulo    VARCHAR(120) NULL,
    Pla_Cuerpo    VARCHAR(120) NULL,
    Pla_Prioridad SMALLINT     NULL,
    Pla_Idioma    VARCHAR(10)  NULL,
    PRIMARY KEY (Pla_Id)
);

CREATE TABLE PreferenciaUsuario
(
    Pre_Id                   CHAR(10)    NOT NULL,
    Pre_Idioma               VARCHAR(10) NULL,
    Pre_ZonaHoraria          VARCHAR(50) NULL,
    Pre_ModoAccesible        BIT         NULL,
    Pre_RecordatoriosActivos BIT         NULL,
    Usu_Id                   CHAR(10)    NOT NULL,
    PRIMARY KEY (Pre_Id)
);

CREATE TABLE ProgramacionNotificacion
(
    Prn_Id          CHAR(10)    NOT NULL,
    Prn_Frecuencia  VARCHAR(20) NULL,
    Prn_HoraEnvio   DATETIME    NULL,
    Prn_FechaInicio DATE        NULL,
    Prn_FechaFin    DATE        NULL,
    Prn_Habilitado  BIT         NULL,
    Prn_DiasSemana  VARCHAR(20) NULL,
    Usu_Id          CHAR(10)    NOT NULL,
    Pla_Id          CHAR(10)    NOT NULL,
    PRIMARY KEY (Prn_Id)
);

CREATE TABLE Provincia
(
    Pro_Id           CHAR(10)    NOT NULL,
    Pro_CodigoReniec VARCHAR(6)  NULL,
    Pro_Nombre       VARCHAR(80) NULL,
    Dep_Id           CHAR(10)    NOT NULL,
    PRIMARY KEY (Pro_Id)
);

CREATE TABLE ReclaRecomendacion
(
    Rre_Id               CHAR(10)     NOT NULL,
    Rre_DescripcionRegla VARCHAR(120) NULL,
    Rre_Condicion        VARCHAR(120) NULL,
    Rre_MensajeBase      VARCHAR(120) NULL,
    Rre_Prioridad        SMALLINT     NULL,
    Rre_CanalSugerido    VARCHAR(40)  NULL,
    Rre_Activa           BIT          NULL,
    PRIMARY KEY (Rre_Id)
);

CREATE TABLE RecomendacionUsuario
(
    Reu_Id              CHAR(10)     NOT NULL,
    Reu_FechaEnvio      DATETIME     NULL,
    Reu_Estado          VARCHAR(20)  NULL,
    Reu_FeedbackUsuario VARCHAR(120) NULL,
    Reu_FechaCierre     DATETIME     NULL,
    Usu_Id              CHAR(10)     NOT NULL,
    Rre_Id              CHAR(10)     NOT NULL,
    PRIMARY KEY (Reu_Id)
);

CREATE TABLE Recompensa
(
    Rco_Id               CHAR(10)     NOT NULL,
    Rco_Nombre           VARCHAR(80)  NULL,
    Rco_Descripcion      VARCHAR(120) NULL,
    Rco_PuntosRequeridos INT          NULL,
    Rco_Proveedor        VARCHAR(80)  NULL,
    Rco_CuposDisponibles INT          NULL,
    Rco_FechaInicio      DATE         NULL,
    Rco_FechaFin         DATE         NULL,
    Rco_Condiciones      VARCHAR(120) NULL,
    Rco_Activo           BIT          NULL,
    PRIMARY KEY (Rco_Id)
);

CREATE TABLE RedencionRecompensa
(
    Red_Id              CHAR(10)    NOT NULL,
    Red_FechaRedencion  DATETIME    NULL,
    Red_Estado          VARCHAR(20) NULL,
    Red_FechaExpiracion DATETIME    NULL,
    Red_CodigoCanje     VARCHAR(40) NULL,
    Red_CanalCanje      VARCHAR(40) NULL,
    Mov_Id              CHAR(10)    NOT NULL,
    Rco_Id              CHAR(10)    NOT NULL,
    PRIMARY KEY (Red_Id)
);

CREATE TABLE RegistroActividad
(
    Rea_Id             CHAR(10)     NOT NULL,
    Rea_FechaRegistro  DATETIME     NULL,
    Rea_FechaActividad DATETIME     NULL,
    Rea_Cantidad       FLOAT        NULL,
    Rea_Co2eCalculado  FLOAT        NULL,
    Rea_ModoCaptura    VARCHAR(30)  NULL,
    Rea_Observaciones  VARCHAR(150) NULL,
    Usu_Id             CHAR(10)     NOT NULL,
    Tip_Id             CHAR(10)     NOT NULL,
    PRIMARY KEY (Rea_Id)
);

CREATE TABLE RegistroParametro
(
    Rea_Id                  CHAR(10)     NOT NULL,
    Par_Id                  CHAR(10)     NOT NULL,
    Rep_ValorCapturado      VARCHAR(120) NULL,
    Rep_UnidadPersonalizada VARCHAR(30)  NULL,
    Rep_FuenteDato          VARCHAR(60)  NULL
);

CREATE TABLE ReporteGenerado
(
    Rge_Id              CHAR(10)     NOT NULL,
    Rge_TipoReporte     VARCHAR(40)  NULL,
    Rge_Formato         VARCHAR(20)  NULL,
    Rge_Destino         VARCHAR(150) NULL,
    Rge_FechaGeneracion DATETIME     NULL,
    Rge_HashDescarga    VARCHAR(64)  NULL,
    Usu_Id              CHAR(10)     NOT NULL,
    PRIMARY KEY (Rge_Id)
);

CREATE TABLE ResumenHuella
(
    Res_Id                       CHAR(10)    NOT NULL,
    Res_Co2eTotal                FLOAT       NULL,
    Res_VariacionVsPeriodoPrevio FLOAT       NULL,
    Res_EquivalenciaArboles      FLOAT       NULL,
    Res_EquivalenciaAhorro       FLOAT       NULL,
    Res_Tendencia                VARCHAR(30) NULL,
    Usu_Id                       CHAR(10)    NOT NULL,
    PRIMARY KEY (Res_Id)
);

CREATE TABLE Rol
(
    Rol_Id          CHAR(10)     NOT NULL,
    Rol_Nombre      VARCHAR(60)  NULL,
    Rol_Descripcion VARCHAR(255) NULL,
    Rol_Nivel       INT          NULL,
    PRIMARY KEY (Rol_Id)
);

CREATE TABLE SegmentoObjetivo
(
    Seg_Id                    CHAR(10)     NOT NULL,
    Seg_Nombre                VARCHAR(100) NULL,
    Seg_Descripcion           VARCHAR(500) NULL,
    Seg_CriteriosDemograficos VARCHAR(200) NULL,
    Seg_CriteriosConductuales VARCHAR(200) NULL,
    Seg_FechaCreacion         DATETIME     NULL,
    PRIMARY KEY (Seg_Id)
);

CREATE TABLE TipoActividad
(
    Tip_Id            CHAR(10)     NOT NULL,
    Tip_Nombre        VARCHAR(80)  NULL,
    Tip_Descripcion   VARCHAR(150) NULL,
    Tip_UnidadCaptura VARCHAR(40)  NULL,
    Tip_EsEstimado    BIT          NULL,
    Cat_Id            CHAR(10)     NOT NULL,
    PRIMARY KEY (Tip_Id)
);

CREATE TABLE TipoInstitucion
(
    Tin_Id          CHAR(10)     NOT NULL,
    Tin_Nombre      VARCHAR(80)  NULL,
    Tin_Descripcion VARCHAR(300) NULL,
    PRIMARY KEY (Tin_Id)
);

CREATE TABLE Usuario
(
    Usu_Id              CHAR(10)     NOT NULL,
    Usu_Nombres         CHAR(100)    NULL,
    Usu_Apellidos       CHAR(100)    NULL,
    Usu_CorreoPrincipal VARCHAR(150) NULL,
    Usu_FechaNacimiento DATE         NULL,
    Usu_Genero          VARCHAR(20)  NULL,
    PRIMARY KEY (Usu_Id)
);

CREATE TABLE UsuarioInstitucion
(
    Ins_Id               CHAR(10)    NOT NULL,
    Usu_Id               CHAR(10)    NOT NULL,
    Uin_RolInstitucional VARCHAR(60) NULL,
    Uin_FechaInicio      DATE        NULL,
    Uin_FechaFin         DATE        NULL
);

CREATE TABLE UsuarioRol
(
    Rol_Id              CHAR(10) NOT NULL,
    Usu_Id              CHAR(10) NOT NULL,
    Uro_FechaAsignacion DATETIME NULL,
    Uro_FechaCese       DATETIME NULL
);

CREATE TABLE UsuarioSegmento
(
    Seg_Id              CHAR(10)    NOT NULL,
    Usu_Id              CHAR(10)    NOT NULL,
    Use_FechaAsignacion DATETIME    NULL,
    Use_FechaFin        DATETIME    NULL,
    Use_Fuente          VARCHAR(60) NULL
);
