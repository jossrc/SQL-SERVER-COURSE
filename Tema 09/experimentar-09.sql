USE VENTASCIB
GO

/* 
  01. Cree un curso que permita mostrar los datos del Proveedor 
      y el nombre de los productos y su precio que cada uno abastece.
      Crear 02 soluciones:
       a. Solución 2a: con consultas combinadas
       b. Solución 3b: con cursores anidados
*/

DECLARE @raz_sc VARCHAR(80),
        @desc_prod VARCHAR(50),
        @prec_prod MONEY
DECLARE cursorProv CURSOR FOR
  SELECT P.RAZ_SOC_PRV, PR.DES_PRO, PR.PRE_PRO FROM dbo.TB_PROVEEDOR AS [P]
  JOIN dbo.TB_ABASTECIMIENTO AS [A]
    ON P.COD_PRV = A.COD_PRV
  JOIN dbo.TB_PRODUCTO AS [PR]
    ON A.COD_PRO = PR.COD_PRO
OPEN cursorProv
FETCH cursorProv INTO @raz_sc, @desc_prod, @prec_prod
WHILE @@FETCH_STATUS = 0
  BEGIN
    PRINT 'PROVEEDOR : ' + @raz_sc
    PRINT 'PRODUCTO  : ' + @desc_prod
    PRINT 'PRECIO    : ' + STR(@prec_prod)
    PRINT '...........................'
    PRINT ''
    FETCH cursorProv INTO @raz_sc, @desc_prod, @prec_prod
  END
CLOSE cursorProv
DEALLOCATE cursorProv
GO

DECLARE @raz_sc VARCHAR(80),
        @cod_prv CHAR(5)
DECLARE cursorProv2 CURSOR FOR
  SELECT RAZ_SOC_PRV, COD_PRV FROM TB_PROVEEDOR
OPEN cursorProv2
FETCH cursorProv2 INTO @raz_sc, @cod_prv
  PRINT SPACE(25) + 'REPORTE DE PROVEEDORES Y PRODUCTOS'
  PRINT SPACE(25) + REPLICATE('*', 25)
WHILE @@FETCH_STATUS = 0
  BEGIN
    PRINT 'PROVEEDOR : ' + @raz_sc
    DECLARE @desc_prod VARCHAR(50),
            @prec_prod MONEY
    DECLARE cursorProd CURSOR FOR
      SELECT P.DES_PRO, P.PRE_PRO FROM TB_ABASTECIMIENTO AS [A]
      JOIN TB_PRODUCTO AS [P]
        ON A.COD_PRO = P.COD_PRO
      WHERE A.COD_PRV = @cod_prv
    OPEN cursorProd
    FETCH cursorProd INTO @desc_prod, @prec_prod
    WHILE @@FETCH_STATUS = 0
      BEGIN
        PRINT '  * PRODUCTO -> ' + @desc_prod
        PRINT '  * PRECIO   -> S/' + STR(@prec_prod)
        FETCH cursorProd INTO @desc_prod, @prec_prod
      END
    CLOSE cursorProd
    DEALLOCATE cursorProd
    FETCH cursorProv2 INTO @raz_sc, @cod_prv
    PRINT ''
  END
CLOSE cursorProv2
DEALLOCATE cursorProv2
GO

-- 02. Cree un cursor que genere un reporte que muestre el nombre del país
--   y el producto que más consumen, así como también el menos consumido.


-- 03. Cree un cursor que muestre el n° de factura, nombre de cliente,
--     nombre del vendedor, nombre del producto, cantidad, 
--     precio unitario, subtotal y total.

/*
   04. Cree un cursor que permita insertar el código, ruc, 
    monto de la deuda y mora de los clientes en la tabla Tb_Morosos
    (qué debe crearse previamente), considerar los siguientes criterios:
      + Si es menos a 200 soles será del 10% de la deuda.
      + Si es mayor igual a 200 y menos a 1000, será del 15% de la deuda.
      + Si es mayor a 1000 será del 20% de la deuda.
*/