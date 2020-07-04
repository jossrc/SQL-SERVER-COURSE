USE master
GO

/*
  01. Cree la base de datos BDArcor con valores de propiedades predeterminadas,
      validando su existencia, eliminándola si existiera.
*/

IF DB_ID('BD_ARCOR') IS NOT NULL
	DROP DATABASE BD_ARCOR
GO

CREATE DATABASE BD_ARCOR
GO

-- 02. Abrir la base de datos y crear los siguientes esquemas:

SP_HELPDB BD_ARCOR
GO

USE BD_ARCOR
GO

CREATE SCHEMA SCH_ACAD
GO

CREATE SCHEMA SCH_ADMIN
GO

CREATE SCHEMA SCH_FINANCE
GO

/*
  03. En la base de datos, crear los siguientes tipos de datos definidos por el usuario
      utilizando el comando CREATE TYPE
*/

CREATE TYPE UDTIdNum FROM SMALLINT NOT NULL
GO

CREATE TYPE UDTIdCad FROM CHAR(8) NOT NULL
GO

CREATE TYPE UDTCad FROM VARCHAR(50) NOT NULL
GO

CREATE TYPE UDTTiempo FROM DATETIME NOT NULL
GO

CREATE TYPE UDTMonto FROM SMALLMONEY NOT NULL
GO

/*
  04. Crear las siguientes tablas, en los esquemas indicados y utilizando los tipos de
      datos creados previamente
*/



/*
  05. Abrir la BD Master y modificar la base de datos BDArcor para adicionar 03
      filegroups: FG1000, FG2000 y FG3000
*/



/*
  06. Modifique la base de datos BDArcor para adicionar un DataFile en cada filegroup
      creado recientemente. Los Datafiles estarán ubicados en la carpeta C:\ArcorData
      con valores predeterminados.
*/



/*
  07. Abrir la base de datos BDArcor y crear una función de partición utilizando Range
      Left
*/




-- 08. Crear un esquema de partición usando la función de partición creada




-- 09. Crear una tabla particionada por el campo NRO_FACT
