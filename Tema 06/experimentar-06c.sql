USE VENTASCIB
GO

/*
**  Establezca una relación recursiva, es decir, una tabla relacionada 
    a sí misma.
*/

-- a) Cree una copia de la tabla Tb_Vendedor.

SELECT * INTO TB_VENDEDOR2
FROM dbo.TB_VENDEDOR
GO

ALTER TABLE TB_VENDEDOR2
  ADD PRIMARY KEY (COD_VEN)
GO

-- b) Agregue la columna Cod_Jefe a TB_Vendedor2.

ALTER TABLE TB_VENDEDOR2
  ADD COD_JEFE CHAR(3) NULL
GO

-- c) Establezca la relación recursiva, cod_jefe con PK de TB_Vendedor2 (Cod_Ven)

ALTER TABLE TB_VENDEDOR2
ADD CONSTRAINT FK_VENDEDOR_VENDEDOR
  FOREIGN KEY (COD_JEFE) REFERENCES TB_VENDEDOR2
GO

-- d) Actualice los códigos de jefes de los vendedores.

UPDATE TB_VENDEDOR2
SET COD_JEFE = 'V01'
WHERE COD_VEN IN ('V02','V03','V04','V05','V06','V07','V08','V09','V10')
GO

UPDATE TB_VENDEDOR2
SET COD_JEFE = 'V11'
WHERE COD_VEN IN ('V12','V13','V14','V15','V16','V17','V18','V19','V20')
GO

-- 1. Liste nombres y apellidos de vendedores con el nombre y apellido tengan o no
--    jefes.

SELECT V2.NOM_VEN, V2.APE_VEN
FROM dbo.TB_VENDEDOR2 AS V2
GO

-- 2. Liste nombres y apellidos de los empleados que no tienen jefe.

SELECT V2.NOM_VEN, V2.APE_VEN
FROM dbo.TB_VENDEDOR2 AS V2
WHERE V2.COD_JEFE IS NULL
GO
