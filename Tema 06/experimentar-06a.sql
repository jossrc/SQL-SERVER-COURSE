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


-- 7. Liste en base al ejercicio anterior las facturas del año 2010.


-- 8. Liste los códigos de proveedores que abastecen más de 2 productos.


-- 9. Liste el promedio de tiempo de servicio y sueldos por cada tipo de vendedor.


-- 10. Liste la cantidad de facturas que han tardado más de 5 días en cancelarse.


-- 11. Liste la razón social y ruc de clientes con una antigüedad mayor a la antigüedad
--     promedio.


-- 12. Liste los nombres y apellidos de vendedores que no ha generado facturas.


-- 13. Liste la cantidad de facturas generadas por los vendedores del distrito D09.


-- 14. Liste los productos comercializados en la factura FA002.


-- 15. Liste la descripción y precio de los productos cuyo precio supera el precio
--     promedio.



