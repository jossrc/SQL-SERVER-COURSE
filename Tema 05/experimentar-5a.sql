-- EXPERIMENTAR 5A
USE VENTASCIB
GO

-- 1. Liste el código, razón social y RUC de los clientes.

SELECT COD_CLI, RAZ_SOC_CLI, RUC_CLI
FROM dbo.TB_CLIENTE
GO

-- 2. Liste el código, descripción y el stock de los productos en orden descendente por
--    precio.

SELECT COD_PRO, DES_PRO, STK_ACT
FROM dbo.TB_PRODUCTO
ORDER BY PRE_PRO DESC
GO

-- 3. Modifique la consulta anterior para ordenar descendente por precio y ascendente
--    stock.

SELECT COD_PRO, DES_PRO, STK_ACT
FROM dbo.TB_PRODUCTO
ORDER BY PRE_PRO DESC, STK_ACT ASC
GO

-- 4. Liste el código y descripción de productos por el campo LIN_PRO con valor 1 o 3.

SELECT COD_PRO, DES_PRO
FROM dbo.TB_PRODUCTO
WHERE LIN_PRO = 1 OR LIN_PRO = 3
GO

-- 5. Modifique la consulta aplicando el operador IN.

SELECT COD_PRO, DES_PRO
FROM dbo.TB_PRODUCTO
WHERE LIN_PRO IN (1,3)
GO

-- 6. Liste la razón social y dirección de proveedores de los distritos D02, D04, D06 o
--    D09.

SELECT P.RAZ_SOC_PRV, P.DIR_PRV
FROM dbo.TB_PROVEEDOR AS P
WHERE P.COD_DIS IN ('D02','D04','D06', 'D09')
GO

-- 7. Liste la razón social y teléfonos de los clientes del distrito D02 del tipo 1.

SELECT C.RAZ_SOC_CLI, C.TLF_CLI
FROM dbo.TB_CLIENTE AS C
WHERE C.COD_DIS = 'D02' AND C.TIP_CLI = 1
GO

-- 8. Liste la descripción, precio y stock de productos con precio entre 10 y 20 o stock <
--    50.

SELECT PR.DES_PRO, PR.PRE_PRO, PR.STK_ACT
FROM dbo.TB_PRODUCTO AS PR
WHERE (PR.PRE_PRO BETWEEN 10 AND 20) OR 
       PR.STK_ACT < 50
GO

-- 9. Modifique la consulta, sin emplear BETWEEN.

SELECT PR.DES_PRO, PR.PRE_PRO, PR.STK_ACT
FROM dbo.TB_PRODUCTO AS PR
WHERE (PR.PRE_PRO >= 10 AND PR.PRE_PRO <= 20) OR
      PR.STK_ACT < 50
GO

-- 10. Liste el número de factura y fecha de facturación de las facturas generadas entre 2
--     fechas.

DECLARE @FEC1 DATE = '2013-05-01'
DECLARE @FEC2 DATE = '2013-08-02'

SELECT F.NUM_FAC, F.FEC_FAC
FROM dbo.TB_FACTURA AS F
WHERE F.FEC_FAC BETWEEN @FEC1 AND @FEC2
GO

-- 11. Liste razón social y dirección de proveedores con teléfono de la serie 445.


-- 12. Liste los productos donde segunda letra de descripción tenga una "A" o una "O".


-- 13. Modifique la consulta anterior para obtener los productos cuya descripción tenga
--    "AP".


-- 14. Liste las facturas cuya fecha de cancelación aun no se haya definido.


-- 15. Liste los números de factura, fecha de facturación y estado de facturas emitidas en
--     el 2010.


-- 16. Liste la razón social de clientes indicando su antiguedad en años.


-- 17. Modifique la consulta anterior para seleccionar clientes cuya antiguedad sea > a 8
--     años.


-- 18. Liste los clientes registrados en la primera quincena del último trimestre del 2005.


-- 19. Liste de manera única los códigos del vendedor que han generado ventas en el
--     2010.


-- 20. Liste la razón social y RUC de los 2 clientes más antiguos.

