USE VENTASCIB
GO

/*
  01. En la empresa Recobra, se pide implementar un cursor que
  permita insertar el código, nombre de cliente, monto de la
  deuda y mora de los clientes con factura pendiente de pago
  (estado de factura 2) en la tabla Tb_Morosos (qué debe crearse
  previamente), considerar los siguientes criterios:
  + Si es menos a 200 soles será del 10% de la deuda.  
  + Si es mayor igual a 200 y menos a 1000, será del 15% de la
    deuda.
  + Si es mayor o igual a 1000 será del 20% de la deuda.

*/

CREATE TABLE TB_MOROSOS (
  COD_CLI  CHAR(5),
  NOM_CLI  VARCHAR(30),
  MONTO   SMALLMONEY,
  MORA    SMALLMONEY
)
GO

DECLARE curClientePedido CURSOR FOR
  SELECT C.COD_CLI AS [CODIGO CLIENTE],
         C.RAZ_SOC_CLI AS [RAZON SOCIAL],
         SUM(D.CAN_VEN*D.PRE_VEN) AS [MONTO]
  FROM TB_CLIENTE AS C
  JOIN TB_FACTURA AS F
  ON C.COD_CLI = F.COD_CLI
  JOIN TB_DETALLE_FACTURA AS D
    ON F.NUM_FAC = D.NUM_FAC
  WHERE F.EST_FAC = '2'
  GROUP BY C.COD_CLI, C.RAZ_SOC_CLI
DECLARE @vc_cod CHAR(5),
        @vc_nomCli VARCHAR(30),
        @vc_monto SMALLMONEY,
        @vc_mora SMALLMONEY
OPEN curClientePedido
FETCH curClientePedido INTO @vc_cod, @vc_nomCli, @vc_monto
WHILE @@FETCH_STATUS = 0
  BEGIN
    IF @vc_monto < 200
      SET @vc_mora = 0.1 * @vc_monto
    ELSE IF @vc_monto < 1000
      SET @vc_mora = 0.15 * @vc_monto
    ELSE
      SET @vc_mora = 0.2 * @vc_monto
    INSERT INTO TB_MOROSOS VALUES
      (@vc_cod, @vc_nomCli, @vc_monto, @vc_mora)
    FETCH curClientePedido INTO @vc_cod, @vc_nomCli, @vc_monto
  END
CLOSE curClientePedido
DEALLOCATE curClientePedido
GO

SELECT * FROM TB_MOROSOS
GO
