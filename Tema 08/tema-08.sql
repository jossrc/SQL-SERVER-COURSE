USE Negocios
GO

-- VARIABLES GLOBALES

  -- La versión del SQL Server
PRINT 'Versión: ' + @@version
  -- Lenguaje configurado en el Servidor
PRINT 'Lenguaje: ' + @@language
  -- Nombre del Servidor
PRINT 'Servidor: ' + @@servername
  -- Nro. de conexiones permitidas
PRINT 'Conexiones: ' + str(@@max_connections)
GO

-- VARIABLES LOCALES

  -- Ejemplo 1
DECLARE @v_price DECIMAL
SET @v_price = 50

SELECT *
FROM Compras.productos AS P
WHERE P.PrecioUnidad > @v_price
GO

  -- Ejemplo 2
DECLARE @mx DECIMAL
SELECT @mx = MAX(P.PrecioUnidad)
FROM Compras.productos AS P

PRINT 'El Precio más alto es: ' + STR(@mx)
GO

  -- Ejemplo 3
DECLARE @v_mn DECIMAL
SELECT @v_mn = MIN(P.PrecioUnidad)
FROM Compras.productos AS P

PRINT 'El precio más bajo es: ' + STR(@v_mn)
GO

-- ESTRUCTURA DE CONTROL "IF"

DECLARE @idemp INT, @cantidad INT
SET @idemp = 6

SELECT @cantidad = COUNT(*)
FROM Ventas.pedidoscabe AS P
WHERE P.IdEmpleado = @idemp

IF @cantidad = 0
  PRINT 'El empleado no ha realizado algún pedido'
ELSE IF @cantidad = 1
  PRINT 'Ha registrado 1 pedido, continúe trabajando'
ELSE
  PRINT 'Ha registrado muchos pedidos'
GO

-- ESTRUCTURA DE CONTROL "CASE"

  -- Evaluando valores
BEGIN
  DECLARE @v_numMessage TINYINT = 1
  DECLARE @v_txtMessage VARCHAR(MAX) -- Máxima longitud permitida por SQL
    SET @v_txtMessage = 
      CASE @v_numMessage
        WHEN 1 THEN 'Hello World'
        WHEN 2 THEN 'Vas a lograrlo'
        WHEN 3 THEN 'Eres un Campeón'
        ELSE 'Mensaje no implementado'
      END
  PRINT @v_txtMessage
END
GO

  -- Evaluando resultado de una expresión de comparación
BEGIN
  SET DATEFORMAT DMY
  DECLARE @v_fna DATE = '10/04/90'
  DECLARE @v_edad SMALLINT
  DECLARE @v_etapaGeneracional VARCHAR(50)
    SET @v_edad = DATEDIFF(YY, @v_fna, GETDATE())
    SET @v_etapaGeneracional =
      CASE
        WHEN @v_edad < 1   THEN 'Bebé'
        WHEN @v_edad <= 5  THEN 'Infante'
        WHEN @v_edad <= 12 THEN 'Niño'
        WHEN @v_edad <= 14 THEN 'Puber'
        WHEN @v_edad < 18  THEN 'Adolescente'
        WHEN @v_edad < 30  THEN 'Joven'
        WHEN @v_edad < 65  THEN 'Adulto'
        ELSE 'Adulto Mayor'
      END
  PRINT 'La etapa generacional es: ' + @v_etapaGeneracional
END
GO

  -- Utilizando CASE dentro de un SELECT
SELECT P.IdPedido,
       P.FechaPedido,
       P.Destinatario,
       CASE P.EnvioPedido
         WHEN 0 THEN 'Envío Pendiente'
         WHEN 1 THEN 'Ya Enviado'
       END AS [Estado del Envío]
FROM Ventas.pedidoscabe AS P
GO

DECLARE @stock INT
SET @stock = 100
SELECT NomProducto,
       PrecioUnidad,
       UnidadesEnExistencia,
       'Estado' = (
          CASE
            WHEN UnidadesEnExistencia > @stock THEN 'Stockeado'
            WHEN UnidadesEnExistencia = @stock THEN 'Limite'
            WHEN UnidadesEnExistencia < @stock THEN 'Haga una solicitud'
          END
       )
FROM Compras.productos
GO

-- ESTRUCTURA DE CONTROL "WHILE"

  -- Ejemplo 01
BEGIN
  SET DATEFORMAT DMY
  DECLARE @v_fechaInicial DATE = '01/01/95'
  DECLARE @v_fechaFinal DATE = '31/12/00'
  WHILE @v_fechaInicial <= @v_fechaFinal
    BEGIN
      PRINT @v_fechaInicial
      SET @v_fechaInicial = DATEADD(DD, 1, @v_fechaInicial)
    END
END
GO

  -- Ejemplo 02
BEGIN
  SET DATEFORMAT DMY
  DECLARE @v_fechaInicial DATE = '01/01/90'
  DECLARE @v_fechaFinal DATE = '31/12/00'
  DECLARE @v_Flag BIT = 1
  WHILE @v_Flag = 1
    BEGIN
      PRINT @v_fechaInicial
      SET @v_fechaInicial = DATEADD(DD, 1, @v_fechaInicial)
      IF @v_fechaInicial > @v_fechaFinal
        BREAK -- Termina
      ELSE
        CONTINUE -- Salta
    END
END
GO

-- CONTROL DE ERRORES

  -- Error
DELETE FROM Ventas.clientes
WHERE IdCliente = 'ALFKI'
GO
  
  -- Manejando excepción de errores
BEGIN TRY
  DELETE FROM Ventas.clientes
  WHERE IdCliente = 'ALFKI'
END TRY
BEGIN CATCH
  PRINT 'Error excepcionado'
END CATCH
GO

  -- Manejando excepción de errores usando "@@Error"
BEGIN TRY
  DELETE FROM Ventas.clientes
  WHERE IdCliente = 'ALFKI'
END TRY
BEGIN CATCH
  IF @@error = 547
    PRINT 'No se puede eliminar por integridad referencial'
END CATCH
GO

/* 
  Funciones especiales de errores :
  * ERROR_NUMBER()    -- Devuelve el número de error
  * ERROR_SEVERITY()  -- Devuelve la severidad del error
  * ERROR_STATE()     -- Devuelve el estado del error
  * ERROR_PROCEDURE() -- Devuelve el nombre del SP que provoca el error
  * ERROR_LINE()      -- Devuelve el número de linea donde se encuentra el error
  * ERROR_MESSAGE()   -- Devuelve el mensaje de error
*/