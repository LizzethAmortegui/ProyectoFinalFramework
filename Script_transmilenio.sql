CREATE USER TRANSMILENIO IDENTIFIED BY 12345;
GRANT CONNECT , RESOURCE TO TRANSMILENIO;
GRANT CREATE TABLE TO TRANSMILENIO;
GRANT CREATE VIEW TO TRANSMILENIO;
GRANT ALL PRIVILEGES TO TRANSMILENIO;
GRANT UNLIMITED TABLESPACE TO TRANSMILENIO;
CONN TRANSMILENIO/12345;

CREATE TABLE TIPO_BUS(
ID_TIPO_BUS INTEGER NOT NULL,
NOMBRE_TIPO_BUS  VARCHAR(20) NOT NULL,
CAPACIDAD_TIPO_BUS NUMBER NOT NULL
);

CREATE TABLE TRONCAL(
ID_TRONCAL INTEGER NOT NULL,
NOMBRE_TRONCAL  VARCHAR(45) NOT NULL,
TIPO_SERVICIO_TRONCAL VARCHAR(45) NOT NULL,
ORIGEN_TRONCAL VARCHAR(45) NOT NULL,
DESTINO_TRONCAL VARCHAR(45) NOT NULL
);

CREATE TABLE RUTA(
ID_RUTA INTEGER NOT NULL,
NOMBRE_RUTA  VARCHAR(50) NOT NULL,
ESTADO_RUTA VARCHAR(25) NOT NULL,
LONGITUD_RUTA NUMBER(15) NOT NULL,
TIPO_SERVICIO_RUTA VARCHAR(20) NOT NULL
);

CREATE TABLE PORTAL(
ID_PORTAL INTEGER NOT NULL,
NOMBRE_PORTAL  VARCHAR(45) NOT NULL
);

CREATE TABLE ESTACION(
ID_ESTACION INTEGER NOT NULL,
ID_PORTAL INTEGER NOT NULL,
ID_TRONCAL INTEGER NOT NULL,
NOMBRE_ESTACION  VARCHAR(45) NOT NULL,
LONGITUD_ESTACION NUMBER NOT NULL,
LATITUD_ESTACION NUMBER NOT NULL
);

CREATE TABLE PLATAFORMA(
ID_PLATAFORMA INTEGER NOT NULL, 
ID_PORTAL INTEGER NOT NULL,
NOMBRE_PLATAFORMA  VARCHAR(45) NOT NULL
);

CREATE TABLE VAGON(
ID_VAGON INTEGER NOT NULL,
ID_ESTACION INTEGER NOT NULL,
NOMBRE_VAGON  VARCHAR(30) NOT NULL
);

CREATE TABLE PARADAS_RUTAS(
ID_PARADAS_RUTAS INTEGER NOT NULL,
ID_RUTA INTEGER NOT NULL,
ID_VAGON INTEGER NOT NULL,
NOMBRE_PARADAS_RUTAS  VARCHAR(60) NOT NULL,
POSICION_X NUMBER NOT NULL,
POSICION_Y NUMBER NOT NULL
);

CREATE TABLE HORARIO_RUTA(
ID_HORARIO INTEGER NOT NULL,
FECHA_HORARIO  DATE NOT NULL,
HORA_INICIO_HORARIO VARCHAR(20) NOT NULL,
HORA_FIN_HORARIO VARCHAR(20) NOT NULL
);

CREATE TABLE EMPRESA_OPERADORA(
ID_EMPRESA_OPERADORA INTEGER NOT NULL,
ID_ESTACION INTEGER NOT NULL,
NOMBRE_EMPRESA_OPERADORA  VARCHAR(20) NOT NULL
);

CREATE TABLE RUTA_ASIGNADA_BUS(
ID_RUTA INTEGER NOT NULL,
ID_TIPO_BUS INTEGER NOT NULL
);

CREATE TABLE CUMPLE_HORARIO(
ID_HORARIO INTEGER NOT NULL,
ID_RUTA INTEGER NOT NULL
);

ALTER TABLE TIPO_BUS ADD(CONSTRAINT TIPO_PK_ID PRIMARY KEY(ID_TIPO_BUS));

ALTER TABLE TRONCAL ADD(CONSTRAINT TRONCAL_PK_ID PRIMARY KEY(ID_TRONCAL));

ALTER TABLE RUTA ADD(CONSTRAINT RUTA_PK_ID PRIMARY KEY(ID_RUTA));

ALTER TABLE ESTACION ADD(CONSTRAINT ESTACION_PK_ID PRIMARY KEY(ID_ESTACION));

ALTER TABLE PORTAL ADD(CONSTRAINT PORTAL_PK_ID PRIMARY KEY(ID_PORTAL));

ALTER TABLE PLATAFORMA ADD(CONSTRAINT PLA_PK_ID PRIMARY KEY(ID_PLATAFORMA));

ALTER TABLE VAGON ADD(CONSTRAINT VAGON_PK_ID PRIMARY KEY(ID_VAGON));

ALTER TABLE PARADAS_RUTAS ADD(CONSTRAINT PARADAS_PK_ID PRIMARY KEY(ID_PARADAS_RUTAS));

ALTER TABLE HORARIO_RUTA ADD(CONSTRAINT HORARIO_PK_ID PRIMARY KEY(ID_HORARIO));

ALTER TABLE EMPRESA_OPERADORA ADD(CONSTRAINT EMPRESA_PK_ID PRIMARY KEY(ID_EMPRESA_OPERADORA));

ALTER TABLE RUTA_ASIGNADA_BUS ADD(CONSTRAINT RUTBUS_PK_ID PRIMARY KEY(ID_RUTA,ID_TIPO_BUS));

ALTER TABLE CUMPLE_HORARIO ADD(CONSTRAINT CUMHOR_PK_ID PRIMARY KEY(ID_HORARIO,ID_RUTA));

ALTER TABLE ESTACION ADD(CONSTRAINT EST_FK_POR_IDP FOREIGN KEY (ID_PORTAL) REFERENCES PORTAL(ID_PORTAL)); 
ALTER TABLE ESTACION ADD(CONSTRAINT EST_FK_TRO_IDT FOREIGN KEY (ID_TRONCAL) REFERENCES TRONCAL(ID_TRONCAL)); 
ALTER TABLE PLATAFORMA ADD(CONSTRAINT PLA_FK_POR_IDP FOREIGN KEY (ID_PORTAL) REFERENCES PORTAL(ID_PORTAL)); 
ALTER TABLE VAGON ADD(CONSTRAINT VAG_FK_EST_IDE FOREIGN KEY (ID_ESTACION) REFERENCES ESTACION(ID_ESTACION)); 
ALTER TABLE PARADAS_RUTAS ADD(CONSTRAINT PAR_FK_RUT_IDR FOREIGN KEY (ID_RUTA) REFERENCES RUTA(ID_RUTA)); 
ALTER TABLE PARADAS_RUTAS ADD(CONSTRAINT PAR_FK_VAG_IDV FOREIGN KEY (ID_VAGON) REFERENCES VAGON(ID_VAGON)); 
ALTER TABLE EMPRESA_OPERADORA ADD(CONSTRAINT EMP_FK_EST_IDE FOREIGN KEY (ID_ESTACION) REFERENCES ESTACION(ID_ESTACION)

ALTER TABLE RUTA_ASIGNADA_BUS ADD(CONSTRAINT RUTBUS_FK_RUT_IDRUT FOREIGN KEY (ID_RUTA) REFERENCES RUTA(ID_RUTA));
ALTER TABLE RUTA_ASIGNADA_BUS ADD(CONSTRAINT RUTBUS_FK_TIP_IDTIP FOREIGN KEY (ID_TIPO_BUS) REFERENCES TIPO_BUS(ID_TIPO_BUS));

ALTER TABLE CUMPLE_HORARIO ADD(CONSTRAINT CUMHOR_FK_HOR_IDHOR FOREIGN KEY (ID_HORARIO) REFERENCES HORARIO_RUTA(ID_HORARIO));
ALTER TABLE CUMPLE_HORARIO ADD(CONSTRAINT CUMHOR_FK_RUTA_IDRUTA FOREIGN KEY (ID_RUTA) REFERENCES RUTA(ID_RUTA));






