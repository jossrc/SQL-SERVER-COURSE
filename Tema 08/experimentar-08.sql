USE VENTASCIB
GO

-- Resolver los siguientes requerimientos:
-- Utilizando variables locales:


-- 1. Declare, asigne un valor e imprima el valor de una variable de tipo numérico.

DECLARE @num INT
SET @num = 10
PRINT STR(@num)
GO

-- 2. Declare, asigne un valor e imprima la cantidad de Ordenes de Compra atendidas
--    por el proveedor 'PR05'.

DECLARE @codProvider VARCHAR(100),
        @count INT
SET @codProvider = 'PR05'
SELECT @count = COUNT(NUM_OCO)  FROM dbo.TB_ORDEN_COMPRA AS [OC]
WHERE OC.COD_PRV = @codProvider
PRINT 'Cantidad Vendida : ' + STR(@count)
GO

-- 3. Declare, asigne un valor e imprima la deuda de un cliente (almacene el código del
--    cliente) por concepto de facturas pendientes (estado de la factura = 1).

DECLARE @codClient CHAR(4),
        @debt SMALLMONEY
SET @codClient = 'C019'
SELECT @debt = SUM(DF.CAN_VEN * DF.PRE_VEN) FROM TB_FACTURA AS [F]
INNER JOIN TB_DETALLE_FACTURA  AS [DF]
  ON F.NUM_FAC = DF.NUM_FAC
WHERE F.EST_FAC = 1 AND F.COD_CLI = @codClient
GROUP BY F.COD_CLI, F.NUM_FAC
PRINT 'DEUDA TOTAL : S/' + STR(@debt)
GO

-- 4. Declare, calcule e imprima el promedio de antigüedad de los clientes, si es mayor a
--    8 años imprima 'Cliente Fiel', de lo contario ‘Cliente Nuevo'.

DECLARE @avg INT
SET @avg = 8
SELECT CL.RAZ_SOC_CLI AS [CLIENTE],
       'ANTIGUEDAD' = (
         CASE
           WHEN DATEDIFF(YY,CL.FEC_REG, GETDATE()) > @avg THEN 'CLIENTE FIEL'
           ELSE 'CLIENTE NUEVO'
         END
       )
FROM TB_CLIENTE AS [CL]
GO

-- 5. Modifique el ejercicio anterior para que se calcule e imprima el promedio de
--    antigüedad de los clientes, si es mayor de 8 años imprima 'Clientela Fiel' y su límite
--    de crédito será 2500 soles, pero de lo contario, imprima 'Clientela Nueva' con un
--    límite de crédito de 1000 soles.

DECLARE @avg INT
SET @avg = 8
SELECT CL.RAZ_SOC_CLI AS [CLIENTE],
       'ANTIGUEDAD' = (
        CASE
          WHEN DATEDIFF(YY,CL.FEC_REG, GETDATE()) > @avg AND
               SUM(DF.CAN_VEN * DF.PRE_VEN) > 2500
            THEN 'CLIENTELA FIEL'
          WHEN SUM(DF.CAN_VEN * DF.PRE_VEN) > 1000
            THEN 'CLIENTELA NUEVA'
        END
      )
FROM TB_CLIENTE AS [CL]
JOIN TB_FACTURA AS [F]
  ON CL.COD_CLI = F.COD_CLI
JOIN TB_DETALLE_FACTURA AS [DF]
  ON F.NUM_FAC = DF.NUM_FAC
GROUP BY CL.RAZ_SOC_CLI, DATEDIFF(YY,CL.FEC_REG, GETDATE())
GO

/*
   6. Declare, y determine la siguiente regla de negocios para una determinada factura:
     + Si se canceló en un tiempo menor o igual a 10 días y si el monto es menor a
      120, su descuento será del 10% del monto global, de lo contrario será de sólo
      un 12%
     + Si se canceló en más de 10 días no se aplica descuento.
*/

SELECT F.NUM_FAC AS [FACTURA],
       'DESCUENTO' = (
         CASE
           WHEN ABS(DATEDIFF(DD,F.FEC_FAC, F.FEC_CAN)) <= 10 AND
                SUM(DF.CAN_VEN * DF.PRE_VEN) < 120
             THEN 'S/' + STR(0.1 * SUM(DF.CAN_VEN * DF.PRE_VEN))
           WHEN ABS(DATEDIFF(DD,F.FEC_FAC, F.FEC_CAN)) <= 10 AND
                SUM(DF.CAN_VEN * DF.PRE_VEN) > 120
             THEN 'S/' + STR(0.12 * SUM(DF.CAN_VEN * DF.PRE_VEN))
           WHEN ABS(DATEDIFF(DD,F.FEC_FAC, F.FEC_CAN)) > 10
             THEN 'NO APLICA DESCUENTO'
         END       
       )
FROM dbo.TB_FACTURA AS [F]
INNER JOIN dbo.TB_DETALLE_FACTURA AS [DF]
  ON F.NUM_FAC = DF.NUM_FAC
GROUP BY F.NUM_FAC, DATEDIFF(DD,F.FEC_FAC, F.FEC_CAN)
GO

-- 7. Muestre la relación de facturas y una observación literal (dependiendo del valor del
--    campo EST_FAC: 1: Pendiente, 2: Cancelada y 3: Anulada). Utilice CASE.

SELECT F.NUM_FAC AS [FACTURA],
       F.EST_FAC AS [ESTADO],
       'OBSERVACIÓN' = (
         CASE
           WHEN F.EST_FAC = 1 THEN 'PENDIENTE'
           WHEN F.EST_FAC = 2 THEN 'CANCELADA'
           WHEN F.EST_FAC = 3 THEN 'ANULADA'
         END
       )
FROM TB_FACTURA AS [F]
GO

-- 8. Muestre el código de cliente y una condición (Deudor o Sin Deudas) dependiendo si
--    tiene o no, facturas pendientes. Utilice CASE

SELECT CL.COD_CLI AS [CÓDIGO],
       'CONDICIÓN' = (
         CASE
           WHEN F.EST_FAC = 1 THEN 'DEUDOR'
           ELSE 'SIN DEUDAS'
         END
       )
FROM TB_CLIENTE AS [CL]
JOIN TB_FACTURA AS [F]
  ON CL.COD_CLI = F.COD_CLI
GO

/*
   9. Muestre la descripción de productos y una observación, ésta dependerá de la
      comparación entre el stock actual y el stock mínimo:
      + Si el stock actual es menor al stock mínimo, la observación deberá indicar
      'Abastecerse Urgente'
      + Si la diferencia es mayor que cero y menor o igual 500, la observación debe
      indicar 'Tome sus precauciones'
      + En caso contrario, la observación indicará 'Producto con stock suficiente'
*/

SELECT P.DES_PRO AS [PRODUCTO],
       'OBSERVACIÓN' = (
         CASE
           WHEN P.STK_ACT < P.STK_MIN
             THEN 'ABASTECERSE URGENTE'
           WHEN (P.STK_ACT - P.STK_MIN) BETWEEN 1 AND 500
             THEN 'TOME SUS PRECAUCIONES'
           ELSE 'PRODUCTO CON STOCK SUFICIENTE'
         END
       )
FROM TB_PRODUCTO AS [P]
GO

-- 10. Declare e Imprima la sumatoria de los números del 1 al 100.

DECLARE @counter INT,
        @sum INT
SET @counter = 0
SET @sum = 0
WHILE @counter <= 100
  BEGIN
    SET @sum += @counter
    SET @counter += 1
  END
PRINT 'SUMA DEL 1 AL 100 : ' + STR(@sum)
GO

/*
   11. Declare variables (precio promedio, nuevo precio, código de producto), luego realice
       lo siguiente:
      + Determine el precio promedio de productos Importados,
      + Actualice el precio de un determinado producto.
      + Confirme la transacción si el nuevo precio es menor al precio promedio
      + Caso contrario, deshacer la transacción.
*/

SELECT * FROM TB_PRODUCTO
GO

DECLARE @avgPrice MONEY,
        @newPrice MONEY,
        @codProd  CHAR(5)
SET @newPrice = 12
BEGIN TRAN TR01
  SELECT @avgPrice = AVG(P.PRE_PRO)
  FROM TB_PRODUCTO AS P
  WHERE P.IMPORTADO = 'V'

  PRINT 'PRECIO PROMEDIO : ' + STR(@avgPrice)

  UPDATE TB_PRODUCTO
  SET PRE_PRO = @newPrice
  WHERE COD_PRO = 'P001'

  IF @newPrice < @avgPrice
    COMMIT TRAN TR01
  ELSE
    ROLLBACK TRAN TR01
GO

-- 12. Modifique el ejercicio anterior para generar un mensaje de error “Transacción
--     Anulada”, de severidad leve cuando la transacción no se confirme.

DECLARE @avgPrice MONEY,
        @newPrice MONEY,
        @codProd  CHAR(5)
SET @newPrice = 36
BEGIN TRAN TR01
  SELECT @avgPrice = AVG(P.PRE_PRO)
  FROM TB_PRODUCTO AS P
  WHERE P.IMPORTADO = 'V'

  PRINT 'PRECIO PROMEDIO : ' + STR(@avgPrice)

  UPDATE TB_PRODUCTO
  SET PRE_PRO = @newPrice
  WHERE COD_PRO = 'P001'

  IF @newPrice < @avgPrice
    COMMIT TRAN TR01
  ELSE
    BEGIN
      RAISERROR('Transacción Anulada', 10, 1)
      ROLLBACK TRAN TR01
    END
GO

-- 13. Declare variables (similares a campos de la tabla orden de compra), asigne valores,
--     luego inserte el registro. Deberá controlar el error mostrando el mensaje respectivo
--     según el error producido (por ejemplo, llaves duplicadas, llaves foráneas
--     inexistentes, datos incompatibles, etc.).


/*
   14. Declare variables (similares a campos de la tabla factura), asigne valores e inserte
   el registro, luego considere las siguientes reglas de negocio:
     + El valor del código del cliente al igual que el código de vendedor deben existir en
       sus respectivas tablas.
     + La fecha de cancelación debe ser mayor a la fecha de facturación y no debe
       exceder los 15 días.
     + Si se cumple con todas las reglas, confirmar la transacción, caso contrario,
       generar mensaje de error por cada caso con severidad fuerte.
     + Controlar los errores con Try / Catch, mostrando el mensaje respectivo
       deshaciendo la transacción.
*/

