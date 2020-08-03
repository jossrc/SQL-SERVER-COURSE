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

-- 7. Muestre la relación de facturas y una observación literal (dependiendo del valor del
--    campo EST_FAC: 1: Pendiente, 2: Cancelada y 3: Anulada). Utilice CASE.


-- 8. Muestre el código de cliente y una condición (Deudor o Sin Deudas) dependiendo si
--    tiene o no, facturas pendientes. Utilice CASE

/*
   9. Muestre la descripción de productos y una observación, ésta dependerá de la
      comparación entre el stock actual y el stock mínimo:
      + Si el stock actual es menor al stock mínimo, la observación deberá indicar
      'Abastecerse Urgente'
      + Si la diferencia es mayor que cero y menor o igual 500, la observación debe
      indicar 'Tome sus precauciones'
      + En caso contrario, la observación indicará 'Producto con stock suficiente'
*/

-- 10. Declare e Imprima la sumatoria de los números del 1 al 100.

/*
   11. Declare variables (precio promedio, nuevo precio, código de producto), luego realice
       lo siguiente:
      + Determine el precio promedio de productos Importados,
      + Actualice el precio de un determinado producto.
      + Confirme la transacción si el nuevo precio es menor al precio promedio
      + Caso contrario, deshacer la transacción.
*/

-- 12. Modifique el ejercicio anterior para generar un mensaje de error “Transacción
--     Anulada”, de severidad leve cuando la transacción no se confirme.


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

