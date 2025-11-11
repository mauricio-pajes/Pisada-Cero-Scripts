Use PisadaCero

ALTER TABLE UsuarioSegmento
    ADD CONSTRAINT FK_SegmentoObjetivo_TO_UsuarioSegmento
        FOREIGN KEY (Seg_Id) REFERENCES SegmentoObjetivo (Seg_Id);

ALTER TABLE UsuarioSegmento
    ADD CONSTRAINT FK_Usuario_TO_UsuarioSegmento
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE UsuarioRol
    ADD CONSTRAINT FK_Rol_TO_UsuarioRol
        FOREIGN KEY (Rol_Id) REFERENCES Rol (Rol_Id);

ALTER TABLE UsuarioRol
    ADD CONSTRAINT FK_Usuario_TO_UsuarioRol
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE CuentaAccceso
    ADD CONSTRAINT FK_Usuario_TO_CuentaAccceso
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE EventoAuditoria
    ADD CONSTRAINT FK_CuentaAccceso_TO_EventoAuditoria
        FOREIGN KEY (Cue_Id) REFERENCES CuentaAccceso (Cue_Id);

ALTER TABLE PreferenciaUsuario
    ADD CONSTRAINT FK_Usuario_TO_PreferenciaUsuario
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE ConsentimientoUsuario
    ADD CONSTRAINT FK_Usuario_TO_ConsentimientoUsuario
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE UsuarioInstitucion
    ADD CONSTRAINT FK_Institucion_TO_UsuarioInstitucion
        FOREIGN KEY (Ins_Id) REFERENCES Institucion (Ins_Id);

ALTER TABLE UsuarioInstitucion
    ADD CONSTRAINT FK_Usuario_TO_UsuarioInstitucion
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE Institucion
    ADD CONSTRAINT FK_TipoInstitucion_TO_Institucion
        FOREIGN KEY (Tin_Id) REFERENCES TipoInstitucion (Tin_Id);

ALTER TABLE Institucion
    ADD CONSTRAINT FK_Distrito_TO_Institucion
        FOREIGN KEY (Dis_Id) REFERENCES Distrito (Dis_Id);

ALTER TABLE Distrito
    ADD CONSTRAINT FK_Provincia_TO_Distrito
        FOREIGN KEY (Pro_Id) REFERENCES Provincia (Pro_Id);

ALTER TABLE Provincia
    ADD CONSTRAINT FK_Departamento_TO_Provincia
        FOREIGN KEY (Dep_Id) REFERENCES Departamento (Dep_Id);

ALTER TABLE GrupoMiembro
    ADD CONSTRAINT FK_Usuario_TO_GrupoMiembro
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE GrupoMiembro
    ADD CONSTRAINT FK_GrupoImpacto_TO_GrupoMiembro
        FOREIGN KEY (Cri_Id) REFERENCES GrupoImpacto (Cri_Id);

ALTER TABLE InvitacionGrupo
    ADD CONSTRAINT FK_GrupoImpacto_TO_InvitacionGrupo
        FOREIGN KEY (Cri_Id) REFERENCES GrupoImpacto (Cri_Id);

ALTER TABLE LogroUsuario
    ADD CONSTRAINT FK_Usuario_TO_LogroUsuario
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE LogroUsuario
    ADD CONSTRAINT FK_Logro_TO_LogroUsuario
        FOREIGN KEY (Log_Id) REFERENCES Logro (Log_Id);

ALTER TABLE ResumenHuella
    ADD CONSTRAINT FK_Usuario_TO_ResumenHuella
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE ProgramacionNotificacion
    ADD CONSTRAINT FK_Usuario_TO_ProgramacionNotificacion
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE ProgramacionNotificacion
    ADD CONSTRAINT FK_PlantillaNotificacion_TO_ProgramacionNotificacion
        FOREIGN KEY (Pla_Id) REFERENCES PlantillaNotificacion (Pla_Id);

ALTER TABLE NotificacionEnviada
    ADD CONSTRAINT FK_ProgramacionNotificacion_TO_NotificacionEnviada
        FOREIGN KEY (Prn_Id) REFERENCES ProgramacionNotificacion (Prn_Id);

ALTER TABLE MovimientosPuntos
    ADD CONSTRAINT FK_Usuario_TO_MovimientosPuntos
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE RedencionRecompensa
    ADD CONSTRAINT FK_MovimientosPuntos_TO_RedencionRecompensa
        FOREIGN KEY (Mov_Id) REFERENCES MovimientosPuntos (Mov_Id);

ALTER TABLE RedencionRecompensa
    ADD CONSTRAINT FK_Recompensa_TO_RedencionRecompensa
        FOREIGN KEY (Rco_Id) REFERENCES Recompensa (Rco_Id);

ALTER TABLE MetaUsuario
    ADD CONSTRAINT FK_Usuario_TO_MetaUsuario
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE RecomendacionUsuario
    ADD CONSTRAINT FK_Usuario_TO_RecomendacionUsuario
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE RecomendacionUsuario
    ADD CONSTRAINT FK_ReclaRecomendacion_TO_RecomendacionUsuario
        FOREIGN KEY (Rre_Id) REFERENCES ReclaRecomendacion (Rre_Id);

ALTER TABLE ReporteGenerado
    ADD CONSTRAINT FK_Usuario_TO_ReporteGenerado
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE RegistroActividad
    ADD CONSTRAINT FK_Usuario_TO_RegistroActividad
        FOREIGN KEY (Usu_Id) REFERENCES Usuario (Usu_Id);

ALTER TABLE RegistroActividad
    ADD CONSTRAINT FK_TipoActividad_TO_RegistroActividad
        FOREIGN KEY (Tip_Id) REFERENCES TipoActividad (Tip_Id);

ALTER TABLE TipoActividad
    ADD CONSTRAINT FK_CategoriaHuella_TO_TipoActividad
        FOREIGN KEY (Cat_Id) REFERENCES CategoriaHuella (Cat_Id);

ALTER TABLE FactorEmision
    ADD CONSTRAINT FK_TipoActividad_TO_FactorEmision
        FOREIGN KEY (Tip_Id) REFERENCES TipoActividad (Tip_Id);

ALTER TABLE FactorEmision
    ADD CONSTRAINT FK_FuenteFactor_TO_FactorEmision
        FOREIGN KEY (Fuf_Id) REFERENCES FuenteFactor (Fuf_Id);

ALTER TABLE FactorEmision
    ADD CONSTRAINT FK_PeriodoCalendario_TO_FactorEmision
        FOREIGN KEY (Per_Id) REFERENCES PeriodoCalendario (Per_Id);

ALTER TABLE RegistroParametro
    ADD CONSTRAINT FK_RegistroActividad_TO_RegistroParametro
        FOREIGN KEY (Rea_Id) REFERENCES RegistroActividad (Rea_Id);

ALTER TABLE RegistroParametro
    ADD CONSTRAINT FK_ParametroActividad_TO_RegistroParametro
        FOREIGN KEY (Par_Id) REFERENCES ParametroActividad (Par_Id);
