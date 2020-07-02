-- EXPERIMENTAR 01
USE master
GO

-- 01. Visualice las bases de datos disponibles en su servidor de base de datos local
SELECT * FROM sys.databases
GO

-- 02. Crear una base de datos con valores predeterminados llamada BDClaro

CREATE DATABASE BDClaro
GO

-- 03. Visualice la estructura de la base de datos anterior

SP_HELPDB BDClaro
GO

-- 04. Modificar la base de datos anterior para adicionar un DataFile

USE BDClaro
GO

ALTER DATABASE BDClaro
ADD FILE(
  NAME = Claro_DataN1,
  FILENAME = 'C:\DataClaro\Claro_DataN1.NDF',
  SIZE = 10MB,
  MAXSIZE = 50MB,
  FILEGROWTH = 5MB
)
GO

-- 05. Modificar la base de datos para adicionar un LogFile

ALTER DATABASE BDClaro
ADD LOG FILE (
  NAME = Claro_Log2,
  FILENAME = 'C:\LogClaro\Claro_Log2.LDF',
  SIZE = 20MB,
  MAXSIZE = 150MB,
  FILEGROWTH = 10MB
)
GO

-- 06. Modificar de la base de datos creada, el archivo Claro_DataN1 para ampliar el
-- tamaño máximo a 200MB

ALTER DATABASE BDClaro
MODIFY FILE(
  NAME = Claro_DataN1,
  MAXSIZE = 200MB
)
GO
