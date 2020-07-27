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


