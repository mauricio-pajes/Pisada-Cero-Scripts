USE PisadaCero;

BEGIN TRAN;
GO

-- 1. Tablas base sin dependencias
PRINT 'Insertando en CategoriaHuella...';
INSERT INTO CategoriaHuella (Cat_Id, Cat_Nombre, Cat_Descripcion, Cat_UnidadBase, Cat_Icono, Cat_Orden, Cat_ColorHex)
VALUES
('CAT000001','Transporte Personal','Huella por desplazamientos diarios','km','icono-transporte.png',1,'#1ABC9C'),
('CAT000002','Alimentacion','Huella de consumo de alimentos','kg alimento','icono-alimentacion.png',2,'#F39C12'),
('CAT000003','Energia Hogar','Consumo electrico y gas del hogar','kWh','icono-energia.png',3,'#E74C3C'),
('CAT000004','Residuos','Gestion de residuos y reciclaje','kg','icono-residuos.png',4,'#2ECC71'),
('CAT000005','Agua','Consumo de agua potable','m3','icono-agua.png',5,'#3498DB'),
('CAT000006','Compras','Huella de bienes y servicios adquiridos','unidad','icono-compras.png',6,'#9B59B6'),
('CAT000007','Viajes Aereos','Vuelos corporativos y personales','km','icono-viajes.png',7,'#34495E'),
('CAT000008','Trabajo Remoto','Uso de herramientas digitales','hora','icono-remoto.png',8,'#16A085'),
('CAT000009','Educacion','Actividades educativas presenciales','hora','icono-educacion.png',9,'#C0392B'),
('CAT000010','Salud','Servicios y desplazamientos medicos','visita','icono-salud.png',10,'#7F8C8D');
GO

PRINT 'Insertando en Departamento...';
INSERT INTO Departamento (Dep_Id, Dep_CodigoReniec, Dep_Nombre, Dep_Abreviatura)
VALUES
('DEP000001','150000','Lima','LIM'),
('DEP000002','040000','Arequipa','ARE'),
('DEP000003','010000','Amazonas','AMA'),
('DEP000004','080000','Cusco','CUS'),
('DEP000005','130000','La Libertad','LLI'),
('DEP000006','090000','Huancavelica','HUV'),
('DEP000007','020000','Ancash','ANC'),
('DEP000008','120000','Junin','JUN'),
('DEP000009','060000','Cajamarca','CAJ'),
('DEP000010','070000','Callao','CAL');
GO

PRINT 'Insertando en Provincia...';
INSERT INTO Provincia (Pro_Id, Pro_CodigoReniec, Pro_Nombre, Dep_Id)
VALUES
('PRO000001','150100','Lima','DEP000001'),
('PRO000002','040100','Arequipa','DEP000002'),
('PRO000003','010100','Chachapoyas','DEP000003'),
('PRO000004','080100','Cusco','DEP000004'),
('PRO000005','130100','Trujillo','DEP000005'),
('PRO000006','090100','Huancavelica','DEP000006'),
('PRO000007','020100','Huaraz','DEP000007'),
('PRO000008','120100','Huancayo','DEP000008'),
('PRO000009','060100','Cajamarca','DEP000009'),
('PRO000010','070100','Callao','DEP000010');
GO

PRINT 'Insertando en Distrito...';
INSERT INTO Distrito (Dis_Id, Dis_Nombre, Dis_CodigoUbigeo, Dis_ZonaClimatica, Dis_Altitud, Pro_Id)
VALUES
('DIS000001','Miraflores','150122','Costa',79,'PRO000001'),
('DIS000002','San Isidro','150131','Costa',65,'PRO000001'),
('DIS000003','Yanahuara','040126','Sierra',2335,'PRO000002'),
('DIS000004','Cayma','040103','Sierra',2403,'PRO000002'),
('DIS000005','Trujillo Centro','130101','Costa',34,'PRO000005'),
('DIS000006','San Jeronimo','080104','Sierra',3300,'PRO000004'),
('DIS000007','Chachapoyas','010101','Selva',2330,'PRO000003'),
('DIS000008','Huancayo','120101','Sierra',3259,'PRO000008'),
('DIS000009','Bellavista','070102','Costa',5,'PRO000010'),
('DIS000010','Banos del Inca','060104','Sierra',2670,'PRO000009');
GO

PRINT 'Insertando en TipoInstitucion...';
INSERT INTO TipoInstitucion (Tin_Id, Tin_Nombre, Tin_Descripcion)
VALUES
('TIN000001','ONG Ambiental','Organizaciones enfocadas en sostenibilidad ciudadana'),
('TIN000002','Universidad','Centros de educacion superior y posgrado'),
('TIN000003','Municipalidad','Gobiernos locales y alcaldias'),
('TIN000004','Empresa Privada','Companias de servicios y productos'),
('TIN000005','Cooperativa','Cooperativas de ahorro y consumo'),
('TIN000006','Gobierno Regional','Unidades administrativas regionales'),
('TIN000007','Startup Social','Empresas tecnologicas de impacto'),
('TIN000008','Centro de Investigacion','Laboratorios y hubs de innovacion'),
('TIN000009','Colegio','Instituciones educativas escolares'),
('TIN000010','Consultora','Firmas de consultoria especializada');
GO

PRINT 'Insertando en FuenteFactor...';
INSERT INTO FuenteFactor (Fuf_Id, Fuf_Nombre, Fuf_InstitucionEmisora, Fuf_ReferenciaDocumental, Fuf_FechaPublicacion, Fuf_Enlace, Fuf_Licencia)
VALUES
('FUF000001','IPCC 2023','IPCC','AR6 Capitulo 5','2023-03-01','https://ipcc.int/ar6','CC-BY-4.0'),
('FUF000002','MINAM Transporte','MINAM','Guia movilidad baja en carbono','2022-11-10','https://minam.gob.pe/movilidad','CC-BY'),
('FUF000003','FAO Alimentacion','FAO','Indicadores alimentarios 2022','2022-08-20','https://fao.org/indicadores','CC-BY-4.0'),
('FUF000004','IEA Energia','IEA','Energy Outlook 2023','2023-05-15','https://iea.org/outlook','CC-BY-4.0'),
('FUF000005','ANA Agua','ANA','Boletin hidrico nacional','2023-02-18','https://ana.gob.pe/boletin','Open'),
('FUF000006','ONU Residuos','ONU Ambiente','Reporte residuos solidos','2022-12-12','https://unep.org/residuos','CC-BY-NC'),
('FUF000007','ICAO Vuelos','ICAO','Manual emisiones aviacion','2021-09-09','https://icao.int/emisiones','Open'),
('FUF000008','MIT Digital','MIT','Paper eficiencia digital','2023-01-22','https://mit.edu/digital','CC-BY'),
('FUF000009','UNESCO Educacion','UNESCO','Guia campus sostenible','2022-10-01','https://unesco.org/green','CC-BY-SA'),
('FUF000010','OMS Salud','OMS','Huella sector salud','2023-04-05','https://who.int/clima','CC-BY');
GO

PRINT 'Insertando en PeriodoCalendario...';
INSERT INTO PeriodoCalendario (Per_Id, Per_TipoPeriodo, Per_FechaInicio, Per_FechaFin, Per_Etiqueta, Per_EsCerrado)
VALUES
('PER000001','Mensual','2023-01-01','2023-01-31','ENE-2023',1),
('PER000002','Mensual','2023-02-01','2023-02-28','FEB-2023',1),
('PER000003','Mensual','2023-03-01','2023-03-31','MAR-2023',1),
('PER000004','Mensual','2023-04-01','2023-04-30','ABR-2023',1),
('PER000005','Mensual','2023-05-01','2023-05-31','MAY-2023',1),
('PER000006','Mensual','2023-06-01','2023-06-30','JUN-2023',1),
('PER000007','Mensual','2023-07-01','2023-07-31','JUL-2023',0),
('PER000008','Mensual','2023-08-01','2023-08-31','AGO-2023',0),
('PER000009','Mensual','2023-09-01','2023-09-30','SEP-2023',0),
('PER000010','Mensual','2023-10-01','2023-10-31','OCT-2023',0);
GO

PRINT 'Insertando en PlantillaNotificacion...';
INSERT INTO PlantillaNotificacion (Pla_Id, Pla_Nombre, Pla_Canal, Pla_Titulo, Pla_Cuerpo, Pla_Prioridad, Pla_Idioma)
VALUES
('PLA000001','Recordatorio Diario','Push','Registra tu movilidad','Es momento de registrar tus kilometros recorridos',1,'es'),
('PLA000002','Resumen Semanal','Email','Tu resumen semanal','Te compartimos tu huella semanal',2,'es'),
('PLA000003','Meta alcanzada','Push','Felicitaciones','Acabas de cumplir una meta sostenible',1,'es'),
('PLA000004','Alerta consumo','SMS','Atencion al consumo','Superaste el promedio de energia',1,'es'),
('PLA000005','Tips sostenibles','Email','Nuevo tip eco','Involucra a tu equipo con este tip',3,'es'),
('PLA000006','Invitacion grupo','Push','Te invitaron a un grupo','Responde a la invitacion recibida',2,'es'),
('PLA000007','Reporte disponible','Email','Tu reporte esta listo','Descarga el reporte generado',2,'es'),
('PLA000008','Recordatorio agua','Push','Registra tu consumo de agua','Anota los m3 utilizados hoy',2,'es'),
('PLA000009','Actualiza perfil','Email','Actualiza tu perfil','Manten tu informacion actualizada',3,'es'),
('PLA000010','Novedades app','Push','Novedades de Pisada Cero','Descubre las nuevas funcionalidades',3,'es');
GO

PRINT 'Insertando en ParametroActividad...';
INSERT INTO ParametroActividad (Par_Id, Par_NombreParametro, Par_TipoDato, Par_Unidad, Par_ValorMinimo, Par_ValorMaximo, Par_Obligatorio)
VALUES
('PAR000001','Kilometros diarios','DECIMAL','km',0,120,1),
('PAR000002','Consumo electrico','DECIMAL','kWh',0,500,1),
('PAR000003','Consumo de agua','DECIMAL','m3',0,80,0),
('PAR000004','Horas teletrabajo','DECIMAL','hora',0,16,0),
('PAR000005','Numero de vuelos','INT','vuelo',0,10,0),
('PAR000006','Peso de residuos','DECIMAL','kg',0,200,1),
('PAR000007','Gasto en compras','DECIMAL','PEN',0,2000,0),
('PAR000008','Dias vegetarianos','INT','dia',0,7,0),
('PAR000009','Visitas medicas','INT','visita',0,8,0),
('PAR000010','Horas de estudio','DECIMAL','hora',0,60,0);
GO

PRINT 'Insertando en Logro...';
INSERT INTO Logro (Log_Id, Log_Nombre, Log_Descripcion, Log_Condicion, Log_PuntosOtorgados, Log_Icono, Log_Nivel)
VALUES
('LOG000001','Primer Registro','Registraste tu primera actividad','Registrar cualquier actividad',50,'logro-1.png',1),
('LOG000002','Semana Constante','Registraste actividades por 7 dias','Completar 7 registros continuos',80,'logro-2.png',1),
('LOG000003','Meta Alcanzada','Cumpliste tu primera meta','Cumplir una meta activa',120,'logro-3.png',2),
('LOG000004','Embajador Verde','Invitaste a cinco personas','Invitar a 5 usuarios',150,'logro-4.png',2),
('LOG000005','Planificador','Agendaste recordatorios mensuales','Crear 4 programaciones',90,'logro-5.png',1),
('LOG000006','Equipo Activo','Participaste en un grupo','Unirte a un grupo activo',70,'logro-6.png',1),
('LOG000007','Cazador de Emisiones','Reduciste 10 por ciento tu CO2','Reducir 10 por ciento vs mes anterior',200,'logro-7.png',3),
('LOG000008','Reportero','Generaste reportes mensuales','Generar 3 reportes',60,'logro-8.png',1),
('LOG000009','Compartir es Cuidar','Redimiste recompensas','Redimir 1 recompensa',100,'logro-9.png',2),
('LOG000010','Campeon Saludable','Registraste 5 visitas medicas','Registrar 5 eventos de salud',110,'logro-10.png',2);
GO

PRINT 'Insertando en ReclaRecomendacion...';
INSERT INTO ReclaRecomendacion (Rre_Id, Rre_DescripcionRegla, Rre_Condicion, Rre_MensajeBase, Rre_Prioridad, Rre_CanalSugerido, Rre_Activa)
VALUES
('RRE000001','Reducir transporte privado','Kilometros diarios > 40','Prueba rutas compartidas o bicicleta',1,'Push',1),
('RRE000002','Optimizar energia','Consumo electrico > 250','Ajusta tu consumo electrico esta semana',1,'Email',1),
('RRE000003','Recordatorio hidratacion','Consumo de agua < 5','Recuerda registrar tu consumo de agua',2,'Push',1),
('RRE000004','Plan de residuos','Peso residuos > 15','Evalua compostar y reciclar en casa',2,'Email',1),
('RRE000005','Compras conscientes','Gasto en compras > 800','Planea compras con impacto reducido',3,'Push',1),
('RRE000006','Vuelos frecuentes','Numero de vuelos > 2','Compensa las emisiones de tus vuelos',2,'Email',1),
('RRE000007','Metas sin actualizar','Metas vencidas','Revisa y actualiza tus metas sostenibles',3,'Push',1),
('RRE000008','Recordatorio salud','Visitas medicas = 0','Programa tu chequeo anual',3,'Email',1),
('RRE000009','Trabajo remoto intenso','Horas teletrabajo > 10','Descansa tu vista cada hora',4,'Push',1),
('RRE000010','Educacion continua','Horas de estudio < 4','Programa sesiones de aprendizaje verde',4,'Email',1);
GO

PRINT 'Insertando en Recompensa...';
INSERT INTO Recompensa (Rco_Id, Rco_Nombre, Rco_Descripcion, Rco_PuntosRequeridos, Rco_Proveedor, Rco_CuposDisponibles, Rco_FechaInicio, Rco_FechaFin, Rco_Condiciones, Rco_Activo)
VALUES
('RCO000001','Cupon de movilidad','30 por ciento en rides sostenibles',300,'RideGreen',50,'2024-01-01','2024-06-30','Solo usuarios activos',1),
('RCO000002','Kit reutilizable','Pack de productos eco',450,'EcoKit',40,'2024-02-01','2024-12-31','Entrega nacional',1),
('RCO000003','Membresia gimnasio','1 mes en gimnasio eco',600,'FitPlanet',25,'2024-01-15','2024-09-30','Sujeto a disponibilidad',1),
('RCO000004','Asesoria energetica','Sesion virtual personalizada',500,'EnerSmart',30,'2024-03-01','2024-08-31','Incluye reporte PDF',1),
('RCO000005','Arbol plantado','Certificado de reforestacion',200,'BosqueAndes',150,'2024-01-10','2024-12-31','Un arbol por canje',1),
('RCO000006','Curso online','Curso eficiencia energetica',350,'CampusEco',60,'2024-04-01','2024-11-30','Incluye certificado',1),
('RCO000007','Bicicleta urbana','Descuento en bicicletas',800,'MoviBike',15,'2024-05-01','2024-10-31','Valido en Lima y Arequipa',1),
('RCO000008','Huerto en casa','Kit de cultivo urbano',400,'UrbanFarm',35,'2024-02-15','2024-09-15','Incluye soporte virtual',1),
('RCO000009','Seguro medico verde','Cobertura telemedicina',550,'SaludEco',20,'2024-03-20','2024-12-31','Aplican terminos del proveedor',1),
('RCO000010','Pasajes terrestres','Pasajes en buses electricos',650,'RutaCero',18,'2024-06-01','2024-12-01','Reservar con 10 dias de anticipacion',1);
GO

PRINT 'Insertando en Rol...';
INSERT INTO Rol (Rol_Id, Rol_Nombre, Rol_Descripcion, Rol_Nivel)
VALUES
('ROL000001','Administrador','Gestion total de la plataforma',3),
('ROL000002','Gestor Sostenibilidad','Administra iniciativas de huella',2),
('ROL000003','Colaborador','Usuario final de registro',1),
('ROL000004','Analista Datos','Revisa indicadores y reportes',2),
('ROL000005','Coach Ambiental','Brinda acompanamiento a usuarios',2),
('ROL000006','Auditor','Revisa trazabilidad de datos',3),
('ROL000007','Lider Regional','Coordina equipos territoriales',2),
('ROL000008','Embajador','Promueve la comunidad',1),
('ROL000009','Invitado','Acceso temporal y limitado',0),
('ROL000010','Soporte','Gestiona consultas tecnicas',1);
GO

PRINT 'Insertando en SegmentoObjetivo...';
INSERT INTO SegmentoObjetivo (Seg_Id, Seg_Nombre, Seg_Descripcion, Seg_CriteriosDemograficos, Seg_CriteriosConductuales, Seg_FechaCreacion)
VALUES
('SEG000001','Movilidad Urbana','Usuarios que usan auto diariamente','25-45 urbano','Registros diarios de transporte','2023-01-05 09:00:00'),
('SEG000002','Oficina Remota','Profesionales remoto','25-50 remoto','Ingresan horas teletrabajo','2023-01-10 10:00:00'),
('SEG000003','Familias Eco','Hogares con hijos','30-55 con hijos','Reportan consumo electrico y agua','2023-01-15 11:00:00'),
('SEG000004','Viajeros Frecuentes','Ejecutivos que vuelan','28-55 viajeros','Registros de vuelos trimestrales','2023-01-20 12:00:00'),
('SEG000005','Estudiantes','Universitarios activos','18-28 estudiantes','Horas de estudio y eventos','2023-01-25 13:00:00'),
('SEG000006','Salud Preventiva','Usuarios enfocados en salud','30-60 mixto','Registros de salud y actividad','2023-02-01 14:00:00'),
('SEG000007','Retail Verde','Colaboradores retail','20-40 tiendas','Reportan compras y residuos','2023-02-05 10:30:00'),
('SEG000008','Campo Andino','Usuarios zonas andinas','25-60 andes','Actividades agricolas','2023-02-10 08:45:00'),
('SEG000009','Tecnologia','Equipos IT','22-45 tech','Reportan trabajo remoto','2023-02-15 09:15:00'),
('SEG000010','Liderazgo','Gerentes sostenibilidad','30-55 lideres','Consumo integral y reportes','2023-02-20 11:20:00');
GO

PRINT 'Insertando en Usuario...';
INSERT INTO Usuario (Usu_Id, Usu_Nombres, Usu_Apellidos, Usu_CorreoPrincipal, Usu_FechaNacimiento, Usu_Genero)
VALUES
('USU000001','Lucia','Gomez','lucia.gomez@demo.com','1990-05-12','Femenino'),
('USU000002','Mateo','Rojas','mateo.rojas@demo.com','1988-01-23','Masculino'),
('USU000003','Valeria','Quispe','valeria.quispe@demo.com','1995-11-02','Femenino'),
('USU000004','Carlos','Paredes','carlos.paredes@demo.com','1984-07-18','Masculino'),
('USU000005','Ana','Vargas','ana.vargas@demo.com','1992-03-30','Femenino'),
('USU000006','Diego','Soto','diego.soto@demo.com','1996-09-09','Masculino'),
('USU000007','Mariana','Lazo','mariana.lazo@demo.com','1991-12-15','Femenino'),
('USU000008','Jorge','Campos','jorge.campos@demo.com','1986-08-05','Masculino'),
('USU000009','Elena','Prado','elena.prado@demo.com','1993-06-21','Femenino'),
('USU000010','Gabriel','Salas','gabriel.salas@demo.com','1989-04-10','Masculino');
GO

-- 2. Tablas con dependencias de primer nivel
PRINT 'Insertando en TipoActividad...';
INSERT INTO TipoActividad (Tip_Id, Tip_Nombre, Tip_Descripcion, Tip_UnidadCaptura, Tip_EsEstimado, Cat_Id)
VALUES
('TIP000001','Viaje diario auto','Registro de viajes urbanos en auto','km',0,'CAT000001'),
('TIP000002','Almuerzo personal','Registro de menus diarios','porcion',1,'CAT000002'),
('TIP000003','Consumo electrico hogar','Kilovatios usados por dia','kWh',0,'CAT000003'),
('TIP000004','Reciclaje semanal','Peso de residuos separados','kg',0,'CAT000004'),
('TIP000005','Consumo de agua','Metros cubicos consumidos','m3',0,'CAT000005'),
('TIP000006','Compras esenciales','Monto mensual en productos','PEN',1,'CAT000006'),
('TIP000007','Vuelo corporativo','Registro de vuelos por trabajo','km',1,'CAT000007'),
('TIP000008','Horas conectadas','Horas de trabajo remoto','hora',0,'CAT000008'),
('TIP000009','Sesion educativa','Horas dedicadas a formacion','hora',0,'CAT000009'),
('TIP000010','Consulta medica','Visitas a servicios de salud','visita',0,'CAT000010');
GO

PRINT 'Insertando en FactorEmision...';
INSERT INTO FactorEmision (Fae_Id, Fae_ValorFactor, Fae_UnidadFactor, Fae_NivelConfianza, Fae_FechaPublicacion, Fae_Vigente, Tip_Id, Fuf_Id, Per_Id)
VALUES
('FAE000001',0.250000,'kgCO2e/km','Alto','2023-03-15',1,'TIP000001','FUF000001','PER000001'),
('FAE000002',2.400000,'kgCO2e/porcion','Medio','2022-11-10',1,'TIP000002','FUF000003','PER000002'),
('FAE000003',0.550000,'kgCO2e/kWh','Alto','2023-05-15',1,'TIP000003','FUF000004','PER000003'),
('FAE000004',0.120000,'kgCO2e/kg','Medio','2022-12-12',1,'TIP000004','FUF000006','PER000004'),
('FAE000005',0.300000,'kgCO2e/m3','Medio','2023-02-18',1,'TIP000005','FUF000005','PER000005'),
('FAE000006',0.080000,'kgCO2e/PEN','Bajo','2023-01-22',1,'TIP000006','FUF000008','PER000006'),
('FAE000007',0.160000,'kgCO2e/km','Alto','2021-09-09',1,'TIP000007','FUF000007','PER000007'),
('FAE000008',0.050000,'kgCO2e/hora','Medio','2023-01-22',1,'TIP000008','FUF000008','PER000008'),
('FAE000009',0.020000,'kgCO2e/hora','Bajo','2022-10-01',1,'TIP000009','FUF000009','PER000009'),
('FAE000010',0.450000,'kgCO2e/visita','Medio','2023-04-05',1,'TIP000010','FUF000010','PER000010');
GO

PRINT 'Insertando en Institucion...';
INSERT INTO Institucion (Ins_Id, Ins_RazonSocial, Ins_Documento, Ins_Sector, Ins_CorreoContacto, Ins_TelefonoContacto, Ins_FechaRegistro, Tin_Id, Dis_Id)
VALUES
('INS000001','EcoTrans SAC','20567890121','Transporte','contacto@ecotrans.pe','014001001','2023-04-10','TIN000004','DIS000001'),
('INS000002','Universidad Verde','20123456789','Educacion','info@uverde.edu','014201202','2023-03-05','TIN000002','DIS000002'),
('INS000003','Municipalidad Miraflores','20111111110','Gobierno Local','gestion@miraflores.gob.pe','014301303','2023-02-20','TIN000003','DIS000001'),
('INS000004','Clinica Integral','20543218765','Salud','contacto@clinica-integral.pe','014401404','2023-01-25','TIN000010','DIS000009'),
('INS000005','Cooperativa Andina','20678943210','Financiero','servicios@coopandina.pe','064401505','2023-02-28','TIN000005','DIS000008'),
('INS000006','Gobierno Cusco','20100987654','Gobierno Regional','region@cusco.gob.pe','084601606','2023-03-18','TIN000006','DIS000006'),
('INS000007','StartGreen','20654321876','Tecnologia','hola@startgreen.io','017001707','2023-04-12','TIN000007','DIS000003'),
('INS000008','Centro Energia Andes','20566677788','Investigacion','energia@andeslab.org','084801808','2023-03-30','TIN000008','DIS000006'),
('INS000009','Colegio Horizonte','20122233344','Educacion','admision@horizonte.edu.pe','044901909','2023-01-15','TIN000009','DIS000005'),
('INS000010','ONG Aire Limpio','20533344455','Ambiental','impacto@airelimpio.org','014501010','2023-02-10','TIN000001','DIS000004');
GO

PRINT 'Insertando en UsuarioInstitucion...';
INSERT INTO UsuarioInstitucion (Ins_Id, Usu_Id, Uin_RolInstitucional, Uin_FechaInicio, Uin_FechaFin)
VALUES
('INS000001','USU000001','Coordinador de movilidad','2023-04-15',NULL),
('INS000002','USU000002','Profesor investigador','2023-03-10',NULL),
('INS000003','USU000003','Analista ambiental','2023-03-01',NULL),
('INS000004','USU000004','Medico ocupacional','2023-01-30',NULL),
('INS000005','USU000005','Gestor de beneficios','2023-02-28',NULL),
('INS000006','USU000006','Enlace regional','2023-03-20',NULL),
('INS000007','USU000007','Product Manager','2023-04-12',NULL),
('INS000008','USU000008','Investigador jefe','2023-03-30',NULL),
('INS000009','USU000009','Docente guia','2023-01-20','2024-01-19'),
('INS000010','USU000010','Director ONG','2023-02-12',NULL);
GO

PRINT 'Insertando en UsuarioRol...';
INSERT INTO UsuarioRol (Rol_Id, Usu_Id, Uro_FechaAsignacion, Uro_FechaCese)
VALUES
('ROL000001','USU000001','2023-01-05 09:00:00',NULL),
('ROL000002','USU000002','2023-01-05 09:00:00',NULL),
('ROL000003','USU000003','2023-01-06 09:00:00',NULL),
('ROL000004','USU000004','2023-01-06 09:00:00',NULL),
('ROL000005','USU000005','2023-01-07 09:00:00',NULL),
('ROL000006','USU000006','2023-01-07 09:00:00',NULL),
('ROL000007','USU000007','2023-01-08 09:00:00',NULL),
('ROL000008','USU000008','2023-01-08 09:00:00',NULL),
('ROL000009','USU000009','2023-01-09 09:00:00',NULL),
('ROL000010','USU000010','2023-01-09 09:00:00',NULL);
GO

PRINT 'Insertando en UsuarioSegmento...';
INSERT INTO UsuarioSegmento (Seg_Id, Usu_Id, Use_FechaAsignacion, Use_FechaFin, Use_Fuente)
VALUES
('SEG000001','USU000001','2023-02-01 08:00:00',NULL,'Auto encuesta'),
('SEG000002','USU000002','2023-02-02 08:00:00',NULL,'Auto encuesta'),
('SEG000003','USU000003','2023-02-03 08:00:00',NULL,'Campana interna'),
('SEG000004','USU000004','2023-02-04 08:00:00',NULL,'Campana interna'),
('SEG000005','USU000005','2023-02-05 08:00:00',NULL,'Auto encuesta'),
('SEG000006','USU000006','2023-02-06 08:00:00',NULL,'Campana salud'),
('SEG000007','USU000007','2023-02-07 08:00:00',NULL,'Campana retail'),
('SEG000008','USU000008','2023-02-08 08:00:00',NULL,'Auto encuesta'),
('SEG000009','USU000009','2023-02-09 08:00:00',NULL,'Campana tech'),
('SEG000010','USU000010','2023-02-10 08:00:00',NULL,'Comite directivo');
GO

PRINT 'Insertando en CuentaAccceso...';
INSERT INTO CuentaAccceso (Cue_Id, Cue_CorreoLogin, Cue_HashContrasena, Cue_Estado, Cue_UltimoIngreso, Usu_Id)
VALUES
('CUE000001','lucia.gomez@demo.com','hash_pwd_001','Activo','2024-01-02 07:35:00','USU000001'),
('CUE000002','mateo.rojas@demo.com','hash_pwd_002','Activo','2024-01-03 08:15:00','USU000002'),
('CUE000003','valeria.quispe@demo.com','hash_pwd_003','Activo','2024-01-03 21:10:00','USU000003'),
('CUE000004','carlos.paredes@demo.com','hash_pwd_004','Activo','2024-01-04 06:50:00','USU000004'),
('CUE000005','ana.vargas@demo.com','hash_pwd_005','Activo','2024-01-04 09:25:00','USU000005'),
('CUE000006','diego.soto@demo.com','hash_pwd_006','Activo','2024-01-05 10:05:00','USU000006'),
('CUE000007','mariana.lazo@demo.com','hash_pwd_007','Activo','2024-01-05 11:40:00','USU000007'),
('CUE000008','jorge.campos@demo.com','hash_pwd_008','Activo','2024-01-05 21:15:00','USU000008'),
('CUE000009','elena.prado@demo.com','hash_pwd_009','Activo','2024-01-06 07:55:00','USU000009'),
('CUE000010','gabriel.salas@demo.com','hash_pwd_010','Bloqueado','2024-01-06 23:05:00','USU000010');
GO

PRINT 'Insertando en EventoAuditoria...';
INSERT INTO EventoAuditoria (Eve_Id, Eve_TipoEvento, Eve_FechaEvento, Eve_IpOrigen, Eve_Detalle, Cue_Id)
VALUES
('EVE000001','Login','2024-01-02 07:35:05','10.0.0.1','Ingreso exitoso desde app','CUE000001'),
('EVE000002','Actualizacion Perfil','2024-01-03 08:20:11','10.0.0.2','Usuario actualizo datos personales','CUE000002'),
('EVE000003','Registro Actividad','2024-01-03 21:15:40','10.0.0.3','Registro de viaje urbano','CUE000003'),
('EVE000004','Login','2024-01-04 06:51:10','10.0.0.4','Ingreso exitoso web','CUE000004'),
('EVE000005','Cambio Contrasena','2024-01-04 09:30:00','10.0.0.5','Actualizo credenciales por seguridad','CUE000005'),
('EVE000006','Login','2024-01-05 10:06:20','10.0.0.6','Ingreso exitoso desde mobile','CUE000006'),
('EVE000007','Registro Actividad','2024-01-05 11:43:05','10.0.0.7','Registro de residuos semanal','CUE000007'),
('EVE000008','Login','2024-01-05 21:16:33','10.0.0.8','Ingreso nocturno','CUE000008'),
('EVE000009','Login','2024-01-06 07:56:28','10.0.0.9','Ingreso exitoso','CUE000009'),
('EVE000010','Intento fallido','2024-01-06 23:06:12','10.0.0.10','Cuenta bloqueada por intentos fallidos','CUE000010');
GO

PRINT 'Insertando en PreferenciaUsuario...';
INSERT INTO PreferenciaUsuario (Pre_Id, Pre_Idioma, Pre_ZonaHoraria, Pre_ModoAccesible, Pre_RecordatoriosActivos, Usu_Id)
VALUES
('PRE000001','es','GMT-5',1,1,'USU000001'),
('PRE000002','es','GMT-5',0,1,'USU000002'),
('PRE000003','es','GMT-5',0,1,'USU000003'),
('PRE000004','es','GMT-5',0,0,'USU000004'),
('PRE000005','es','GMT-5',1,1,'USU000005'),
('PRE000006','es','GMT-5',0,1,'USU000006'),
('PRE000007','es','GMT-5',1,1,'USU000007'),
('PRE000008','es','GMT-5',0,0,'USU000008'),
('PRE000009','es','GMT-5',1,1,'USU000009'),
('PRE000010','es','GMT-5',0,0,'USU000010');
GO

PRINT 'Insertando en ConsentimientoUsuario...';
INSERT INTO ConsentimientoUsuario (Con_Id, Con_TipoConsentimiento, Con_VersionDocumento, Con_FechaRespuesta, Con_Estado, Usu_Id)
VALUES
('CON000001','Terminos servicio','v1.0','2023-12-01 09:00:00','Aceptado','USU000001'),
('CON000002','Privacidad datos','v1.0','2023-12-01 09:05:00','Aceptado','USU000002'),
('CON000003','Terminos servicio','v1.0','2023-12-02 08:00:00','Aceptado','USU000003'),
('CON000004','Privacidad datos','v1.0','2023-12-02 08:10:00','Aceptado','USU000004'),
('CON000005','Terminos servicio','v1.0','2023-12-03 10:00:00','Aceptado','USU000005'),
('CON000006','Privacidad datos','v1.0','2023-12-03 10:05:00','Aceptado','USU000006'),
('CON000007','Terminos servicio','v1.0','2023-12-04 07:45:00','Aceptado','USU000007'),
('CON000008','Privacidad datos','v1.0','2023-12-04 07:50:00','Aceptado','USU000008'),
('CON000009','Terminos servicio','v1.1','2023-12-05 09:15:00','Aceptado','USU000009'),
('CON000010','Privacidad datos','v1.1','2023-12-05 09:20:00','Pendiente','USU000010');
GO

PRINT 'Insertando en MetaUsuario...';
INSERT INTO MetaUsuario (Met_Id, Met_TipoMeta, Met_ValorObjetivo, Met_Estado, Met_FechaCumplimiento, Met_Descripcion, Usu_Id)
VALUES
('MET000001','Reducir viajes auto',30,'En progreso','2024-03-31','Limitar kilometros de auto a 30 semanales','USU000001'),
('MET000002','Menos carne roja',3,'En progreso','2024-04-15','Consumir maximo 3 porciones por semana','USU000002'),
('MET000003','Control electrico',180,'Cumplida','2024-02-28','Mantener consumo mensual menor a 180 kWh','USU000003'),
('MET000004','Reciclar',25,'En progreso','2024-05-01','Separar 25 kg de residuos','USU000004'),
('MET000005','Ahorrar agua',15,'En progreso','2024-03-15','Mantener consumo en 15 m3','USU000005'),
('MET000006','Horas remotas',35,'Cumplida','2024-01-31','Limitar teletrabajo a 35 horas','USU000006'),
('MET000007','Registrar estudios',10,'En progreso','2024-04-30','Registrar 10 horas de capacitacion','USU000007'),
('MET000008','Consultas medicas',4,'Pendiente','2024-06-30','Agendar 4 chequeos preventivos','USU000008'),
('MET000009','Reportes generados',3,'En progreso','2024-02-15','Generar 3 reportes ejecutivos','USU000009'),
('MET000010','Movilidad activa',40,'En progreso','2024-03-20','Acumular 40 km en bicicleta','USU000010');
GO

PRINT 'Insertando en MovimientoPuntos...';
INSERT INTO MovimientoPuntos (Mov_Id, Mov_TipoMovimiento, Mov_Puntos, Mov_FechaMovimiento, Mov_ReferenciaOrigen, Mov_Descripcion, Mov_SaldoResultante, Usu_Id)
VALUES
('MOV000001','Ganado',120,'2024-01-05 08:00:00','Registro actividad','Bonificacion por primer registro',120,'USU000001'),
('MOV000002','Ganado',150,'2024-01-05 09:00:00','Meta cumplida','Cumpliste meta semanal',150,'USU000002'),
('MOV000003','Ganado',90,'2024-01-06 10:00:00','Registro actividad','Constancia en registros diarios',90,'USU000003'),
('MOV000004','Ganado',110,'2024-01-06 11:00:00','Reporte generado','Reporte mensual emitido',110,'USU000004'),
('MOV000005','Ganado',130,'2024-01-07 12:00:00','Grupo impacto','Lideraste reto comunitario',130,'USU000005'),
('MOV000006','Ganado',95,'2024-01-07 13:00:00','Registro actividad','Registro de residuos',95,'USU000006'),
('MOV000007','Ganado',140,'2024-01-08 14:00:00','Invitacion aceptada','Sumaste nuevos miembros',140,'USU000007'),
('MOV000008','Ganado',160,'2024-01-08 15:00:00','Redencion recompensa','Bono por canje responsable',160,'USU000008'),
('MOV000009','Ganado',100,'2024-01-09 16:00:00','Reporte generado','Reporte ejecutivo',100,'USU000009'),
('MOV000010','Ganado',125,'2024-01-09 17:00:00','Actividad saludable','Registro consulta medica',125,'USU000010');
GO

PRINT 'Insertando en RedencionRecompensa...';
INSERT INTO RedencionRecompensa (Red_Id, Red_FechaRedencion, Red_Estado, Red_FechaExpiracion, Red_CodigoCanje, Red_CanalCanje, Mov_Id, Rco_Id)
VALUES
('RED000001','2024-01-10 09:00:00','Confirmada','2024-06-30','CANJE-0001','App','MOV000001','RCO000001'),
('RED000002','2024-01-11 10:00:00','Confirmada','2024-12-31','CANJE-0002','Web','MOV000002','RCO000002'),
('RED000003','2024-01-12 11:00:00','Emitida','2024-09-30','CANJE-0003','App','MOV000003','RCO000003'),
('RED000004','2024-01-13 12:00:00','Emitida','2024-08-31','CANJE-0004','Web','MOV000004','RCO000004'),
('RED000005','2024-01-14 13:00:00','Confirmada','2024-12-31','CANJE-0005','App','MOV000005','RCO000005'),
('RED000006','2024-01-15 14:00:00','Emitida','2024-11-30','CANJE-0006','Web','MOV000006','RCO000006'),
('RED000007','2024-01-16 15:00:00','Pendiente','2024-10-31','CANJE-0007','App','MOV000007','RCO000007'),
('RED000008','2024-01-17 16:00:00','Confirmada','2024-09-15','CANJE-0008','App','MOV000008','RCO000008'),
('RED000009','2024-01-18 17:00:00','Emitida','2024-12-31','CANJE-0009','Web','MOV000009','RCO000009'),
('RED000010','2024-01-19 18:00:00','Pendiente','2024-12-01','CANJE-0010','App','MOV000010','RCO000010');
GO

PRINT 'Insertando en GrupoImpacto...';
INSERT INTO GrupoImpacto (Cri_Id, Gri_Nombre, Gri_Proposito, Gri_Privacidad, Gri_FechaCreacion, Gri_CodigoInvitacion)
VALUES
('GRI000001','Movilidad Cero','Reducir emisiones en traslados corporativos','Privado','2023-06-01 09:00:00','INVITA1'),
('GRI000002','Oficina Circular','Compartir acciones de reciclaje','Privado','2023-06-05 09:00:00','INVITA2'),
('GRI000003','Familias Eco','Buenas practicas en casa','Privado','2023-06-10 09:00:00','INVITA3'),
('GRI000004','Viajeros Conscientes','Ideas para viajes bajos en carbono','Publico','2023-06-15 09:00:00','INVITA4'),
('GRI000005','Agua Responsable','Retos de ahorro de agua','Privado','2023-06-20 09:00:00','INVITA5'),
('GRI000006','Tech Verde','Reducir huella digital','Publico','2023-06-22 09:00:00','INVITA6'),
('GRI000007','Salud Activa','Habitos saludables y movilidad','Privado','2023-06-25 09:00:00','INVITA7'),
('GRI000008','Educacion Sostenible','Ideas para escuelas verdes','Publico','2023-06-28 09:00:00','INVITA8'),
('GRI000009','Retail Responsable','Reducir impacto en cadenas retail','Privado','2023-07-01 09:00:00','INVITA9'),
('GRI000010','Salud Comunitaria','Cuidados preventivos con baja huella','Publico','2023-07-05 09:00:00','INVITA10');
GO

PRINT 'Insertando en GrupoMiembro...';
INSERT INTO GrupoMiembro (Usu_Id, Cri_Id, Grm_RolGrupo, Grm_FechaIngreso, Grm_FechaSalida, Grm_Estado)
VALUES
('USU000002','GRI000001','Miembro','2023-07-10 08:00:00',NULL,'Activo'),
('USU000003','GRI000002','Moderador','2023-07-11 08:00:00',NULL,'Activo'),
('USU000004','GRI000003','Miembro','2023-07-12 08:00:00',NULL,'Activo'),
('USU000005','GRI000004','Miembro','2023-07-13 08:00:00',NULL,'Activo'),
('USU000006','GRI000005','Miembro','2023-07-14 08:00:00',NULL,'Activo'),
('USU000007','GRI000006','Miembro','2023-07-15 08:00:00',NULL,'Activo'),
('USU000008','GRI000007','Miembro','2023-07-16 08:00:00',NULL,'Activo'),
('USU000009','GRI000008','Miembro','2023-07-17 08:00:00',NULL,'Activo'),
('USU000010','GRI000009','Miembro','2023-07-18 08:00:00',NULL,'Activo'),
('USU000001','GRI000010','Moderador','2023-07-19 08:00:00',NULL,'Activo');
GO

PRINT 'Insertando en InvitacionGrupo...';
INSERT INTO InvitacionGrupo (Inv_Id, Inv_Estado, Inv_FechaEnvio, Inv_FechaRespuesta, Inv_Canal, Inv_Token, Cri_Id)
VALUES
('INV000001','Aceptada','2023-07-05 09:00:00','2023-07-06 10:00:00','Email','TOKENGRI1','GRI000001'),
('INV000002','Pendiente','2023-07-05 09:05:00',NULL,'Push','TOKENGRI2','GRI000002'),
('INV000003','Aceptada','2023-07-06 09:00:00','2023-07-06 12:00:00','Email','TOKENGRI3','GRI000003'),
('INV000004','Rechazada','2023-07-06 10:00:00','2023-07-07 08:00:00','SMS','TOKENGRI4','GRI000004'),
('INV000005','Aceptada','2023-07-07 09:00:00','2023-07-08 09:30:00','Email','TOKENGRI5','GRI000005'),
('INV000006','Pendiente','2023-07-08 09:00:00',NULL,'Push','TOKENGRI6','GRI000006'),
('INV000007','Aceptada','2023-07-08 10:00:00','2023-07-09 08:00:00','Email','TOKENGRI7','GRI000007'),
('INV000008','Aceptada','2023-07-09 09:00:00','2023-07-10 08:30:00','Email','TOKENGRI8','GRI000008'),
('INV000009','Pendiente','2023-07-10 09:00:00',NULL,'Push','TOKENGRI9','GRI000009'),
('INV000010','Aceptada','2023-07-11 09:00:00','2023-07-11 13:00:00','Email','TOKENGRI10','GRI000010');
GO

PRINT 'Insertando en ProgramacionNotificacion...';
INSERT INTO ProgramacionNotificacion (Prn_Id, Prn_Frecuencia, Prn_HoraEnvio, Prn_FechaInicio, Prn_FechaFin, Prn_Habilitado, Prn_DiasSemana, Usu_Id, Pla_Id)
VALUES
('PRN000001','Diaria','2024-01-01 07:30:00','2024-01-01','2024-12-31',1,'L-M-MI-J-V','USU000001','PLA000001'),
('PRN000002','Semanal','2024-01-02 08:00:00','2024-01-02','2024-12-31',1,'L','USU000002','PLA000002'),
('PRN000003','Evento','2024-01-03 09:00:00','2024-01-03','2024-06-30',1,'VI','USU000003','PLA000003'),
('PRN000004','Alerta','2024-01-04 10:00:00','2024-01-04','2024-12-31',1,'LU','USU000004','PLA000004'),
('PRN000005','Mensual','2024-01-05 08:30:00','2024-01-05','2024-12-31',1,'Primer Lunes','USU000005','PLA000005'),
('PRN000006','Semanal','2024-01-06 07:45:00','2024-01-06','2024-12-31',1,'Miercoles','USU000006','PLA000006'),
('PRN000007','Mensual','2024-01-07 09:15:00','2024-01-07','2024-12-31',1,'Dia 15','USU000007','PLA000007'),
('PRN000008','Diaria','2024-01-08 06:50:00','2024-01-08','2024-12-31',1,'L-M-MI-J-V','USU000008','PLA000008'),
('PRN000009','Trimestral','2024-01-09 11:00:00','2024-01-09','2024-12-31',1,'Inicio trimestre','USU000009','PLA000009'),
('PRN000010','Mensual','2024-01-10 12:00:00','2024-01-10','2024-12-31',0,'Ultimo dia','USU000010','PLA000010');
GO

PRINT 'Insertando en NotificacionEnviada...';
INSERT INTO NotificacionEnviada (Not_Id, Not_FechaEnvio, Not_CanalUtilizado, Not_ResultadoEnvio, Not_RespuestaUsuario, Not_FechaInteraccion, Prn_Id)
VALUES
('NOT000001','2024-01-05 07:30:00','Push','Enviado','OK','2024-01-05 07:45:00','PRN000001'),
('NOT000002','2024-01-06 08:00:00','Email','Abierto','Gracias','2024-01-06 08:30:00','PRN000002'),
('NOT000003','2024-01-07 09:00:00','Push','Enviado','Meta celebrada','2024-01-07 09:10:00','PRN000003'),
('NOT000004','2024-01-08 10:00:00','SMS','Entregado','OK','2024-01-08 10:05:00','PRN000004'),
('NOT000005','2024-01-09 08:30:00','Email','Enviado','Recibido','2024-01-09 09:00:00','PRN000005'),
('NOT000006','2024-01-10 07:45:00','Push','Enviado',NULL,'2024-01-10 07:50:00','PRN000006'),
('NOT000007','2024-01-11 09:15:00','Email','Abierto','Descargado','2024-01-11 09:40:00','PRN000007'),
('NOT000008','2024-01-12 06:50:00','Push','Enviado','OK','2024-01-12 07:00:00','PRN000008'),
('NOT000009','2024-01-13 11:00:00','Email','Rebotado',NULL,NULL,'PRN000009'),
('NOT000010','2024-01-14 12:00:00','Push','Suspendido',NULL,NULL,'PRN000010');
GO

PRINT 'Insertando en ResumenHuella...';
INSERT INTO ResumenHuella (Res_Id, Res_Co2eTotal, Res_VariacionVsPeriodoPrevio, Res_EquivalenciaArboles, Res_EquivalenciaAhorro, Res_Tendencia, Usu_Id)
VALUES
('RES000001',1.25,-0.12,5.4,45.0,'Mejora','USU000001'),
('RES000002',2.40,0.05,3.2,30.0,'Alza','USU000002'),
('RES000003',1.10,-0.08,6.1,52.0,'Mejora','USU000003'),
('RES000004',1.80,0.02,4.3,38.5,'Estable','USU000004'),
('RES000005',1.35,-0.10,5.0,41.0,'Mejora','USU000005'),
('RES000006',1.90,-0.03,3.8,33.0,'Mejora','USU000006'),
('RES000007',2.10,0.04,3.5,28.0,'Alza','USU000007'),
('RES000008',1.15,-0.06,6.4,55.0,'Mejora','USU000008'),
('RES000009',1.65,0.01,4.8,39.0,'Estable','USU000009'),
('RES000010',1.45,-0.02,5.2,42.5,'Mejora','USU000010');
GO

PRINT 'Insertando en RecomendacionUsuario...';
INSERT INTO RecomendacionUsuario (Reu_Id, Reu_FechaEnvio, Reu_Estado, Reu_FeedbackUsuario, Reu_FechaCierre, Usu_Id, Rre_Id)
VALUES
('REU000001','2024-01-05 09:00:00','Enviado','Aplicando carpool','2024-01-07 12:00:00','USU000001','RRE000001'),
('REU000002','2024-01-05 10:00:00','Cerrado','Ajuste de aire acondicionado','2024-01-08 12:00:00','USU000002','RRE000002'),
('REU000003','2024-01-06 09:00:00','En Proceso',NULL,NULL,'USU000003','RRE000003'),
('REU000004','2024-01-06 10:00:00','Cerrado','Reprogramado','2024-01-09 11:00:00','USU000004','RRE000004'),
('REU000005','2024-01-07 09:00:00','Enviado','Analizando presupuesto','2024-01-10 10:00:00','USU000005','RRE000005'),
('REU000006','2024-01-07 10:00:00','Pendiente',NULL,NULL,'USU000006','RRE000006'),
('REU000007','2024-01-08 09:00:00','Cerrado','Meta actualizada','2024-01-11 09:30:00','USU000007','RRE000007'),
('REU000008','2024-01-08 10:00:00','Enviado','Cita programada','2024-01-12 08:00:00','USU000008','RRE000008'),
('REU000009','2024-01-09 09:00:00','Pendiente',NULL,NULL,'USU000009','RRE000009'),
('REU000010','2024-01-09 10:00:00','En Proceso','Buscando cursos','2024-01-13 09:00:00','USU000010','RRE000010');
GO

PRINT 'Insertando en ReporteGenerado...';
INSERT INTO ReporteGenerado (Rge_Id, Rge_TipoReporte, Rge_Formato, Rge_Destino, Rge_FechaGeneracion, Rge_HashDescarga, Usu_Id)
VALUES
('RGE000001','Resumen mensual','PDF','lucia.gomez@demo.com','2024-01-05 09:30:00','00112233445566778899AABBCCDDEEFF00112233445566778899AABBCCDDEEFF','USU000001'),
('RGE000002','Resumen mensual','PDF','mateo.rojas@demo.com','2024-01-05 10:00:00','111122223333444455556666777788889999AAAABBBBCCCCDDDDEEEEFFFF0000','USU000002'),
('RGE000003','Huella detalle','XLSX','valeria.quispe@demo.com','2024-01-06 08:30:00','ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789','USU000003'),
('RGE000004','Huella detalle','PDF','carlos.paredes@demo.com','2024-01-06 09:15:00','1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF','USU000004'),
('RGE000005','Dashboard','PDF','ana.vargas@demo.com','2024-01-06 10:20:00','FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210','USU000005'),
('RGE000006','Reporte salud','PDF','diego.soto@demo.com','2024-01-07 08:40:00','0F0E0D0C0B0A090807060504030201FF0F0E0D0C0B0A090807060504030201FF','USU000006'),
('RGE000007','Reporte incentivos','XLSX','mariana.lazo@demo.com','2024-01-07 09:50:00','AAAABBBBCCCCDDDDEEEEFFFF00001111AAAABBBBCCCCDDDDEEEEFFFF00001111','USU000007'),
('RGE000008','Resumen bienestar','PDF','jorge.campos@demo.com','2024-01-08 07:20:00','13579BDF2468ACE013579BDF2468ACE013579BDF2468ACE013579BDF2468ACE0','USU000008'),
('RGE000009','Huella trimestral','PDF','elena.prado@demo.com','2024-01-08 08:10:00','89ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF01234567','USU000009'),
('RGE000010','Huella integral','XLSX','gabriel.salas@demo.com','2024-01-09 09:40:00','5566778899AABBCCDDEEFF00112233445566778899AABBCCDDEEFF0011223344','USU000010');
GO

PRINT 'Insertando en LogroUsuario...';
INSERT INTO LogroUsuario (Usu_Id, Log_Id, Lgu_FechaObtencion, Lgu_Evidencia, Lgu_Estado)
VALUES
('USU000001','LOG000001','2024-01-05 08:10:00','captura_registro.png','Validado'),
('USU000002','LOG000002','2024-01-06 09:20:00','reporte_semana.png','Validado'),
('USU000003','LOG000003','2024-01-07 10:30:00','meta_cumplida.pdf','Validado'),
('USU000004','LOG000004','2024-01-08 11:00:00','invitos.png','En revision'),
('USU000005','LOG000005','2024-01-09 12:00:00','agenda.png','Validado'),
('USU000006','LOG000006','2024-01-10 13:00:00','grupo.png','Validado'),
('USU000007','LOG000007','2024-01-11 14:00:00','reduccion.png','En revision'),
('USU000008','LOG000008','2024-01-12 15:00:00','reporte.png','Validado'),
('USU000009','LOG000009','2024-01-13 16:00:00','canje.png','Validado'),
('USU000010','LOG000010','2024-01-14 17:00:00','salud.png','Pendiente');
GO

PRINT 'Insertando en RegistroActividad...';
INSERT INTO RegistroActividad (Rea_Id, Rea_FechaRegistro, Rea_FechaActividad, Rea_Cantidad, Rea_Co2eCalculado, Rea_ModoCaptura, Rea_Observaciones, Usu_Id, Tip_Id)
VALUES
('REA000001','2023-01-05 07:00:00','2023-01-04 18:00:00',32.5,8.12,'Manual','Viaje ida y vuelta al trabajo','USU000001','TIP000001'),
('REA000002','2023-02-05 12:00:00','2023-02-05 12:30:00',1.0,0.48,'Manual','Almuerzo vegetariano','USU000002','TIP000002'),
('REA000003','2023-03-05 21:00:00','2023-03-05 20:00:00',15.0,8.25,'Automatico','Lectura de medidor','USU000003','TIP000003'),
('REA000004','2023-04-06 09:30:00','2023-04-06 08:30:00',6.5,0.78,'Manual','Reciclaje semanal','USU000004','TIP000004'),
('REA000005','2023-05-06 10:15:00','2023-05-06 07:00:00',12.0,3.60,'Manual','Uso moderado de agua','USU000005','TIP000005'),
('REA000006','2023-06-07 08:45:00','2023-06-06 19:00:00',450.0,36.00,'Manual','Compras mensuales','USU000006','TIP000006'),
('REA000007','2023-07-07 11:20:00','2023-07-06 23:00:00',800.0,128.00,'Manual','Vuelo a Cusco','USU000007','TIP000007'),
('REA000008','2023-08-07 18:00:00','2023-08-07 17:00:00',6.0,0.30,'Automatico','Horas conectadas plataforma','USU000008','TIP000008'),
('REA000009','2023-09-08 20:30:00','2023-09-08 19:00:00',3.0,0.06,'Manual','Taller virtual','USU000009','TIP000009'),
('REA000010','2023-10-09 09:10:00','2023-10-08 09:00:00',1.0,0.45,'Manual','Chequeo anual','USU000010','TIP000010');
GO

PRINT 'Insertando en RegistroParametro...';
INSERT INTO RegistroParametro (Rea_Id, Par_Id, Rep_ValorCapturado, Rep_UnidadPersonalizada, Rep_FuenteDato)
VALUES
('REA000001','PAR000001','32.5','km','App movil'),
('REA000003','PAR000002','15.0','kWh','Medidor inteligente'),
('REA000005','PAR000003','12.0','m3','Lectura manual'),
('REA000008','PAR000004','6.0','hora','Sincronizacion calendario'),
('REA000007','PAR000005','1','vuelo','Carga manual'),
('REA000004','PAR000006','6.5','kg','Formulario web'),
('REA000006','PAR000007','450','PEN','Carga manual'),
('REA000002','PAR000008','1','dia','Auto declaracion'),
('REA000010','PAR000009','1','visita','Agenda medica'),
('REA000009','PAR000010','3','hora','Registro campus');
GO

COMMIT TRAN;
GO

PRINT '* Insercion de datos completada exitosamente *';
