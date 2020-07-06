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


-- 04. Crear las siguientes restricciones


/*
   05. Crear los siguientes índices:
     a. Cree un Índice único compuesto (fecha y idpaciente de RECETA) ordenado
        de forma ascendente.
     b. Cree un Índice normal compuesto (nombre y apellidos del paciente)
        ordenado de forma descendente para ambos campos.
     c. Cree un Índice normal (apellido del médico), incluir el campo especialidad.
*/
