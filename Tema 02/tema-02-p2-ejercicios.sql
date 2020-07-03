USE master
GO

/*

En la empresa Recobra, se decidió implementar una Tabla
particionada para almacenar sus solicitudes y poder optimizar
las consultas por trimestre de cualquier año, por un tema de
análisis comparativo.

*/

-- 1. Crear los filegroups.

ALTER DATABASE BD_RECOBRA
  ADD FILEGROUP FG_TRIMESTRE1
GO

ALTER DATABASE BD_RECOBRA
  ADD FILEGROUP FG_TRIMESTRE2
GO

ALTER DATABASE BD_RECOBRA
  ADD FILEGROUP FG_TRIMESTRE3
GO

ALTER DATABASE BD_RECOBRA
  ADD FILEGROUP FG_TRIMESTRE4
GO


-- 2. Adicionar los datafiles.



-- 3. Crear la Función de Partición.



-- 4. Crear el esquema de Partición.



-- 5. Crear la tabla Particionada

