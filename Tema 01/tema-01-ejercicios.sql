
/*
	EJERCICIO 1

Se asignó la tarea de implementar una Base de datos a la
empresa Recobra con un datafile y un logfile ubicados en la
unidad C:\ carpeta Files, con tamaño inicial de 5MB hasta un
máximo de 50MB con un factor de crecimiento de 5MB, para
ambos archivos.

*/

USE master
GO

CREATE DATABASE BD_RECOBRA
ON (
  NAME = RECOBRA_DATA,
  FILENAME = 'C:\Files\RECOBRA_DATA.MDF',
  SIZE = 5MB,
  MAXSIZE = 50MB,
  FILEGROWTH = 5MB
)
LOG ON (
  NAME = RECOBRA_LOG,
  FILENAME = 'C:\Files\RECOBRA_LOG.LDF',
  SIZE = 5MB,
  MAXSIZE = 50MB,
  FILEGROWTH = 5MB
)
GO

SP_HELPDB BD_RECOBRA
GO

/*
	EJERCICIO 2

Adicione 01 Filegroup llamado Operaciones a la base de datos
creada.
Luego adicione un datafile a dicho Filegroup, indicando solo su
nombre y ubicación del archivo que será la misma carpeta
definida.

*/

USE BD_RECOBRA
GO

ALTER DATABASE BD_RECOBRA
  ADD FILEGROUP FG_OPERACIONES
GO

ALTER DATABASE BD_RECOBRA
ADD FILE(
  NAME = RECOBRA_DATA_OPERACIONES,
  FILENAME = 'C:\Files\RECOBRA_DATA_OPERACIONES.MDF'
) TO FILEGROUP FG_OPERACIONES
GO

SP_HELPDB BD_RECOBRA
GO