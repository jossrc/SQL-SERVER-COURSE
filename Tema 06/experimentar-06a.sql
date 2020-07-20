USE VENTASCIB
GO

-- 1. Liste la sumatoria de precios de los productos.

SELECT SUM(P.PRE_PRO) AS [SUMA TOTAL]
FROM dbo.TB_PRODUCTO AS P
GO

-- 2. Liste el máximo y mínimo valor del sueldo de vendedores de tipo “1”.

SELECT *
FROM TB_VENDEDOR
WHERE TIP_VEN = 1
GO

SELECT MAX(V.SUELDO_VEN) AS [MÁXIMO SUELDO],
       MIN(V.SUELDO_VEN) AS [MÍNIMO SUELDO]
FROM dbo.TB_VENDEDOR AS [V]
WHERE V.TIP_VEN = 1
GO

-- 3. Liste el promedio de antigüedad de los clientes.

SELECT AVG(DATEDIFF(YY, CL.FEC_REG, GETDATE())) AS [PROMEDIO DE ANTIGUEDAD DE LOS CLIENTES]
FROM dbo.TB_CLIENTE AS [CL]
GO

-- 4. Liste la cantidad de facturas pendientes.

SELECT COUNT(CL.COD_CLI) AS [FACTURAS PENDIENTES]
FROM dbo.TB_FACTURA AS [F]
FULL JOIN dbo.TB_CLIENTE AS [CL]
  ON F.COD_CLI = CL.COD_CLI
WHERE F.NUM_FAC IS NULL
GO

-- 5. Liste la cantidad de facturas generados por cliente.

SELECT F.COD_CLI AS [CODIGO DEL CLIENTE],
       COUNT(F.NUM_FAC) AS [CANTIDAD DE FACTURAS]
FROM dbo.TB_FACTURA AS [F]
GROUP BY F.COD_CLI
GO

-- 6. Liste, en base al ejercicio anterior, los clientes con más de una factura.

SELECT F.COD_CLI AS [CODIGO DEL CLIENTE],
       COUNT(F.NUM_FAC) AS [CANTIDAD DE FACTURAS]
FROM dbo.TB_FACTURA AS [F]
GROUP BY F.COD_CLI
HAVING COUNT(F.NUM_FAC) > 1
GO

-- 7. Liste en base al ejercicio anterior las facturas del año 2013.

SELECT F.COD_CLI AS [CODIGO DEL CLIENTE],
       COUNT(F.NUM_FAC) AS [CANTIDAD DE FACTURAS]
FROM dbo.TB_FACTURA AS [F]
WHERE YEAR(F.FEC_FAC) = 2013
GROUP BY F.COD_CLI
HAVING COUNT(F.NUM_FAC) > 1
GO

-- 8. Liste los códigos de proveedores que abastecen más de 2 productos.

SELECT A.COD_PRV AS [CODIGO DEL PROVEEDOR],
       COUNT(A.COD_PRO) AS [CANTIDAD DE PRODUCTOS]
FROM dbo.TB_ABASTECIMIENTO AS [A]
GROUP BY A.COD_PRV
HAVING COUNT(A.COD_PRO) > 2
GO

-- 9. Liste el promedio de tiempo de servicio y sueldos por cada tipo de vendedor.

SELECT V.TIP_VEN AS [TIPO VENDEDOR],
       CONCAT(CONVERT(varchar, AVG(DATEDIFF(YY, V.FEC_ING, GETDATE()))), ' años') AS [TIEMPO PROMEDIO],
       AVG(V.SUELDO_VEN) AS [SUELDO PROMEDIO]
FROM dbo.TB_VENDEDOR AS [V]
GROUP BY V.TIP_VEN
GO

-- 10. Liste la cantidad de facturas que han tardado más de 5 días en cancelarse.

SELECT COUNT(F.NUM_FAC) AS [CANTIDAD DE FACTURAS]
FROM dbo.TB_FACTURA AS [F]
WHERE DATEDIFF(DD, F.FEC_FAC, F.FEC_CAN) > 5
GO

-- 11. Liste la razón social y ruc de clientes con una antigüedad mayor a la antigüedad
--     promedio.

SELECT *
FROM dbo.TB_CLIENTE

SELECT AVG(DATEDIFF(YY, CL.FEC_REG, GETDATE())) AS [PROMEDIO DE ANTIGUEDAD DE LOS CLIENTES]
FROM dbo.TB_CLIENTE AS [CL]
GO

SELECT CL.RAZ_SOC_CLI AS [RAZÓN SOCIAL],
       CL.RUC_CLI     AS [RUC],
       DATEDIFF(YY, CL.FEC_REG, GETDATE()) AS [ANTIGUEDAD]
FROM dbo.TB_CLIENTE AS CL, dbo.TB_CLIENTE AS C
GROUP BY CL.RAZ_SOC_CLI, CL.RUC_CLI, DATEDIFF(YY, CL.FEC_REG, GETDATE())
HAVING AVG(DATEDIFF(YY,C.FEC_REG, GETDATE())) < DATEDIFF(YY, CL.FEC_REG, GETDATE())
GO

-- 12. Liste los nombres y apellidos de vendedores que no ha generado facturas.

SELECT *
FROM dbo.TB_VENDEDOR
GO

SELECT *
FROM dbo.TB_FACTURA
GO

SELECT V.NOM_VEN AS [NOMBRE],
       V.APE_VEN AS [APELLIDO]
FROM dbo.TB_FACTURA AS F
FULL JOIN dbo.TB_VENDEDOR AS V
  ON F.COD_VEN = V.COD_VEN
WHERE F.NUM_FAC IS NULL
GO

-- 13. Liste la cantidad de facturas generadas por los vendedores del distrito D09.

SELECT COUNT(F.NUM_FAC) AS [CANTIDAD DE FACTURAS]
FROM dbo.TB_DISTRITO AS D
JOIN dbo.TB_VENDEDOR AS V
  ON D.COD_DIS = V.COD_DIS
JOIN dbo.TB_FACTURA AS F
  ON V.COD_VEN = F.COD_VEN
WHERE V.COD_DIS = 'D09'
GROUP BY D.COD_DIS
GO

-- 14. Liste los productos comercializados en la factura FA002.

SELECT DF.NUM_FAC AS [FACTURA],
       P.DES_PRO AS [PRODUCTOS]
FROM dbo.TB_PRODUCTO AS P
JOIN dbo.TB_DETALLE_FACTURA AS DF
  ON P.COD_PRO = DF.COD_PRO
WHERE DF.NUM_FAC = 'FA002'
GROUP BY DF.NUM_FAC, P.DES_PRO
GO

SELECT *
FROM dbo.TB_DETALLE_FACTURA

-- 15. Liste la descripción y precio de los productos cuyo precio supera el precio
--     promedio.



