-- Crear la Base de Datos
Use Master
go

If DB_ID( 'BDInmobiliaria') is not null
	Drop Database BDInmobiliaria
go

Create Database BDInmobiliaria
Go

Use BDInmobiliaria
go

Create Schema Comercial
go

Create Schema Arquitectura
go
-- Crear las Tablas
CREATE TABLE Comercial.CONTRATO
(
        COD_CONT		char(6) 		NOT NULL,
        PROP_COD_USUA	char(6) 		NULL,
        INQ_COD_USUA	char(6) 		NULL,
        FEC_FIRMA		datetime		NOT NULL,
        REFERENCIA		varchar(100)	NULL,
        COD_EST			char(6)			NULL
)
 
CREATE TABLE Arquitectura.DEPARTAMENTOS (
        COD_EDIF			char(6) NOT NULL,
        COD_DEP				varchar(6) NOT NULL,
        AREA_TOTAL_DEP		int NOT NULL,
        AREA_CONSTRUIDA_DEP	int NULL,
        NUM_AMB_DEP			int NULL,
        PISO_DEP			int NULL,
        PRECIO_ALQXMES_DEP	decimal NULL,
        COD_EST				char(6) NULL
 )
 
CREATE TABLE Comercial.DETALLECONTRATO (
        COD_EDIF                            char(6) NOT NULL,
        COD_DEP                             varchar(6) NOT NULL,
        COD_CONT                          char(6) NOT NULL,
        FEC_INI_ALQ                       datetime NOT NULL,
        FEC_FIN_ALQ                      datetime NOT NULL
 )
 
CREATE TABLE Arquitectura.EDIFICIOS (
        COD_EDIF                            char(6) NOT NULL,
        NOM_EDIF                           varchar(60) NOT NULL,
        DIRECC_EDIF                      varchar(60) NOT NULL,
        CODPOSTAL_EDIF              varchar(4) NOT NULL,
        AREA_TOTAL_EDIF             int NOT NULL,
        AREA_CONSTRUIDA_EDIF int NULL,
        REFERENCIA_EDIF             varchar(100) NULL,
        COD_EST                              char(6) NULL
 )

CREATE TABLE Comercial.ESTADO (
        COD_EST                             char(6) NOT NULL,
        DESC_EST                           varchar(20) NOT NULL
 )
 
CREATE TABLE Comercial.FAMILIARES (
        COD_FAMI                            char(6) NOT NULL,
        COD_USUA                           char(6) NOT NULL,
        NOM_FAMI                            varchar(25) NOT NULL,
        APEPATER_FAMI                 varchar(25) NOT NULL,
        APEMATER_FAMI                 varchar(25) NOT NULL,
        GRADO_PARENTES_FAMI  varchar(50) NOT NULL
 )
 

CREATE TABLE Comercial.INQUILINO (
        COD_USUA                          char(6) NOT NULL,
        NOM_AVAL_INQ                  varchar(30) NOT NULL,
        APELL_AVAL                        char(30) NOT NULL,
        HABER_BAS_INQ                int NOT NULL,
        EST_CIVIL_INQ                   char(1) NULL,
        LUG_TRAB_INQ                  varchar(50) NULL
 )

CREATE TABLE Comercial.PROPIETARIO (
        COD_USUA                          char(6) NOT NULL,
        TIPO                                     varchar(30) NOT NULL
 )
 
CREATE TABLE Comercial.USUARIO (
        COD_USUA                         char(6) NOT NULL,
        NOM_USUA                         varchar(25) NOT NULL,
        APEPATER_USUA              varchar(25) NOT NULL,
        APEMATER_USUA             varchar(25) NOT NULL,
        FEC_NAC_USUA                datetime NULL,
        FEC_REG_USUA                datetime NULL,
        TIPO_DOC_USUA               varchar(20) NOT NULL,
        NUM_DOC_USUA               char(8) NOT NULL,
        COD_EST                            char(6) NULL
 )
 go
-- Agregando las llaves primarias a todas las tablas

ALTER TABLE Comercial.CONTRATO
        ADD PRIMARY KEY NONCLUSTERED (COD_CONT)

ALTER TABLE Arquitectura.DEPARTAMENTOS
        ADD PRIMARY KEY NONCLUSTERED (COD_EDIF, COD_DEP)

ALTER TABLE Comercial.DETALLECONTRATO
        ADD PRIMARY KEY NONCLUSTERED (COD_EDIF, COD_DEP, COD_CONT)

ALTER TABLE Arquitectura.EDIFICIOS
        ADD PRIMARY KEY NONCLUSTERED (COD_EDIF)

ALTER TABLE Comercial.ESTADO
        ADD PRIMARY KEY NONCLUSTERED (COD_EST)

ALTER TABLE Comercial.FAMILIARES
        ADD PRIMARY KEY NONCLUSTERED (COD_FAMI, COD_USUA)

ALTER TABLE Comercial.INQUILINO
        ADD PRIMARY KEY NONCLUSTERED (COD_USUA)

ALTER TABLE Comercial.PROPIETARIO
        ADD PRIMARY KEY NONCLUSTERED (COD_USUA)

ALTER TABLE Comercial.USUARIO
        ADD PRIMARY KEY NONCLUSTERED (COD_USUA)


-- Agregando llaves Foráneas y relacionando tablas

ALTER TABLE Comercial.CONTRATO
        ADD FOREIGN KEY (INQ_COD_USUA) REFERENCES Comercial.INQUILINO

ALTER TABLE Comercial.CONTRATO
        ADD FOREIGN KEY (PROP_COD_USUA) REFERENCES Comercial.PROPIETARIO

ALTER TABLE Comercial.CONTRATO
        ADD FOREIGN KEY (COD_EST) REFERENCES Comercial.ESTADO
 
ALTER TABLE Arquitectura.DEPARTAMENTOS
        ADD FOREIGN KEY (COD_EDIF) REFERENCES Arquitectura.EDIFICIOS

ALTER TABLE Arquitectura.DEPARTAMENTOS
        ADD FOREIGN KEY (COD_EST) REFERENCES Comercial.ESTADO

ALTER TABLE Comercial.DETALLECONTRATO
        ADD FOREIGN KEY (COD_CONT) REFERENCES Comercial.CONTRATO

ALTER TABLE Comercial.DETALLECONTRATO
        ADD FOREIGN KEY (COD_EDIF, COD_DEP) REFERENCES Arquitectura.DEPARTAMENTOS

ALTER TABLE Arquitectura.EDIFICIOS 
        ADD FOREIGN KEY (COD_EST) REFERENCES Comercial.ESTADO
 
ALTER TABLE Comercial.FAMILIARES
        ADD FOREIGN KEY (COD_USUA) REFERENCES Comercial.INQUILINO

ALTER TABLE Comercial.INQUILINO
        ADD FOREIGN KEY (COD_USUA) REFERENCES Comercial.USUARIO

ALTER TABLE Comercial.PROPIETARIO
        ADD FOREIGN KEY (COD_USUA) REFERENCES Comercial.USUARIO

ALTER TABLE Comercial.USUARIO
        ADD FOREIGN KEY (COD_EST) REFERENCES Comercial.ESTADO
GO