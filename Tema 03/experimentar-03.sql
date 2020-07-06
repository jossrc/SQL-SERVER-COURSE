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


/*
   05. Crear los siguientes índices:
     a. Cree un Índice único compuesto (fecha y idpaciente de RECETA) ordenado
        de forma ascendente.
     b. Cree un Índice normal compuesto (nombre y apellidos del paciente)
        ordenado de forma descendente para ambos campos.
     c. Cree un Índice normal (apellido del médico), incluir el campo especialidad.
*/
