USE master
GO

/*
   01. Cree la base de datos BDClinica con valores de propiedades predeterminadas,
      validando su existencia, eliminándola si existiera.
*/

IF DB_ID('BDClinica') IS NOT NULL
   DROP DATABASE BDClinica
GO

CREATE DATABASE BDClinica
GO

-- 02. Abrir la base de datos y crear los siguientes esquemas

USE BDClinica
GO

CREATE SCHEMA USUARIO
GO

CREATE SCHEMA SERVICIO
GO

-- 03. Crear las siguientes tablas, en los esquemas indicados

CREATE TABLE SERVICIO.TBMedico (
  idMed    CHAR(5)      NOT NULL,
  nomMed   VARCHAR(50)  NOT NULL,
  apMed    VARCHAR(50)  NOT NULL,
  espMed   VARCHAR(50)  NOT NULL,
  colMed   CHAR(12)     NOT NULL
)
GO

CREATE TABLE USUARIO.TBPaciente (
  idPac    CHAR(5)      NOT NULL,
  nomPac   VARCHAR(50)  NOT NULL,
  apPac    VARCHAR(50)  NOT NULL,
  fnaPac   DATE         NOT NULL,
  fonoPac  VARCHAR(10)  NOT NULL
)
GO

CREATE TABLE SERVICIO.TBReceta (
  numRec   INT      NOT NULL IDENTITY(1001,1),
  fecRec   DATE     NOT NULL,
  idPac    CHAR(5)  NOT NULL,
  idMed    CHAR(5)  NOT NULL
)
GO

CREATE TABLE SERVICIO.TBDetalleReceta (
  numRec       INT          NOT NULL,
  codMedicina  CHAR(5)      NOT NULL,
  canti        TINYINT      NOT NULL,
  dosis        VARCHAR(50)  NOT NULL,
  indica       VARCHAR(50)  NOT NULL
)
GO

-- 04. Crear las siguientes restricciones

ALTER TABLE SERVICIO.TBMedico
  ADD
  CONSTRAINT PK_idMed 
    PRIMARY KEY NONCLUSTERED (idMed),
  CONSTRAINT UQ_nomMed_apMed
    UNIQUE (nomMed, apMed),
  CONSTRAINT CK_espMed CHECK
    (espMed IN ('Pediatría','Ginecología','Cardiología') ),
  CONSTRAINT CK_colMed CHECK
    (colMed LIKE '%2' OR
	 colMed LIKE '%4' OR
	 colMed LIKE '%6' OR
	 colMed LIKE '%8')
GO

ALTER TABLE USUARIO.TBPaciente
  ADD
  CONSTRAINT PK_idPac 
    PRIMARY KEY NONCLUSTERED (idPac),
  CONSTRAINT CK_fnaPac  CHECK
    ( YEAR(fnaPac) >= 1950 ),
  CONSTRAINT CK_fonoPac CHECK
    ( fonoPac LIKE '9%' OR
	  fonoPac LIKE '5%' OR
	  fonoPac LIKE '4%' OR
	  fonoPac LIKE '3%' OR
	  fonoPac LIKE '2%')
GO

ALTER TABLE SERVICIO.TBReceta
  ADD
  CONSTRAINT PK_numRec
    PRIMARY KEY NONCLUSTERED (numRec),
  CONSTRAINT DF_fecRec
    DEFAULT GETDATE() FOR fecRec ,
  CONSTRAINT FK_idPac FOREIGN KEY
    (idPac) REFERENCES USUARIO.TBPaciente
	ON UPDATE CASCADE,
  CONSTRAINT FK_idMed FOREIGN KEY
    (idMed) REFERENCES SERVICIO.TBMedico
	ON DELETE CASCADE
GO

ALTER TABLE SERVICIO.TBDetalleReceta
  ADD
  CONSTRAINT PK_numRec_codMedicina
    PRIMARY KEY NONCLUSTERED (numRec, codMedicina),
  CONSTRAINT CK_Canti CHECK
    (canti > 0),
  CONSTRAINT FK_numRec FOREIGN KEY
    (numRec) REFERENCES SERVICIO.TBReceta
	ON DELETE CASCADE
GO

/*
   05. Crear los siguientes índices:
     a. Cree un Índice único compuesto (fecha y idpaciente de RECETA) ordenado
        de forma ascendente.
     b. Cree un Índice normal compuesto (nombre y apellidos del paciente)
        ordenado de forma descendente para ambos campos.
     c. Cree un Índice normal (apellido del médico), incluir el campo especialidad.
*/
