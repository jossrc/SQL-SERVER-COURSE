USE VENTASCIB
GO

-- 1. Liste los datos del cliente y el nombre de su distrito.

SELECT CL.*, D.NOM_DIS
FROM dbo.TB_CLIENTE AS CL
JOIN dbo.TB_DISTRITO AS D
  ON CL.COD_DIS = D.COD_DIS
GO

-- 2. Liste los números de factura y el total facturado.

SELECT F.NUM_FAC AS [FACTURA],
       SUM(DF.PRE_VEN) AS [TOTAL FACTURADO]
FROM dbo.TB_FACTURA AS F
JOIN dbo.TB_DETALLE_FACTURA AS DF
  ON F.NUM_FAC = DF.NUM_FAC
GROUP BY F.NUM_FAC
GO

-- 3. Liste el número de la orden de compra, fecha, razón social, dirección y el distrito.

SELECT OC.NUM_OCO AS [ORDEN DE COMPRA],
       OC.FEC_OCO AS [FECHA DE ORDEN],
       P.RAZ_SOC_PRV AS [RAZÓN SOCIAL],
       P.DIR_PRV AS [DIRECCIÓN],
       D.NOM_DIS AS [DISTRITO]
FROM dbo.TB_ORDEN_COMPRA AS OC
JOIN dbo.TB_PROVEEDOR AS P
  ON OC.COD_PRV = P.COD_PRV
JOIN dbo.TB_DISTRITO AS D
  ON P.COD_DIS = D.COD_DIS
GO

-- 4. Liste la cantidad vendida y producto comercializados en la factura FA009.

SELECT DF.CAN_VEN AS [CANTIDAD VENDIDA],
       P.DES_PRO AS [PRODUCTO]
FROM dbo.TB_DETALLE_FACTURA AS DF
JOIN dbo.TB_PRODUCTO AS P
  ON DF.COD_PRO = P.COD_PRO
WHERE DF.NUM_FAC = 'FA009'
GO

-- 5. Liste razón social, dirección, representante, precio de abastecimiento y distrito de
--    todos los proveedores que abastecen el producto P002.

SELECT P.RAZ_SOC_PRV AS [RAZÓN SOCIAL],
       P.DIR_PRV AS [DIRECCIÓN],
       P.REP_VEN AS [REPRESENTANTE],
       A.PRE_ABA AS [PRECIO DE ABASTECIMIENTO],
       D.NOM_DIS AS [DISTRITO]
FROM dbo.TB_DISTRITO AS D
JOIN dbo.TB_PROVEEDOR AS P
  ON D.COD_DIS = P.COD_DIS
JOIN dbo.TB_ABASTECIMIENTO AS A
  ON P.COD_PRV = A.COD_PRV
JOIN dbo.TB_PRODUCTO AS PR
  ON A.COD_PRO = PR.COD_PRO
WHERE PR.COD_PRO = 'P002'
GO

-- 6. Liste el código de cliente, razón social y distrito (incluir distritos donde no existen
--    clientes)


-- 7. Liste los distritos donde no existen clientes (utilice LEFT OUTER JOIN).


-- 8. Liste los distritos donde no existen clientes (utilice RIGHT OUTER JOIN).


-- 9. Liste los proveedores (razón social y dirección), sin órdenes de compra.


-- 10. Liste los clientes que no han generado facturas.


-- 11. Liste la cantidad de clientes sin facturas.

