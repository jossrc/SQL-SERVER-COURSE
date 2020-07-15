USE Negocios
GO

-- USO DEL SELECT

SELECT 'HELLO WORLD'
GO

-- CONSULTANDO DATOS

SELECT *
FROM Ventas.clientes
GO

-- MOSTRAR CIERTOS CAMPOS CON ALIAS

SELECT IdCliente  AS 'Código',
       NomCliente AS 'Nombre del Cliente',
       DirCliente AS 'Dirección'
FROM Ventas.clientes
GO

-- ORDER BY

SELECT *
FROM Compras.productos
ORDER BY IdCategoria ASC
GO

SELECT *
FROM Compras.productos
ORDER BY IdCategoria ASC,
         IdProveedor DESC
GO

SELECT *
FROM Compras.productos
ORDER BY IdCategoria ASC,
         IdProveedor DESC,
         NomProducto ASC
GO

-- CONSULTAS CON PREDICADO

  -- ALL
SELECT ALL *
FROM Compras.productos
GO

  -- TOP
SELECT TOP 3 *
FROM Compras.productos
ORDER BY PrecioUnidad DESC
GO

SELECT TOP 20 PERCENT *
FROM Compras.productos
ORDER BY PrecioUnidad ASC
GO

  -- DISTINCT
SELECT DISTINCT IdCategoria
FROM Compras.productos
GO

-- OPERADORES DE COMPARACION

SELECT *
FROM Compras.productos
WHERE PrecioUnidad < 100
GO

SELECT *
FROM Compras.productos
WHERE PrecioUnidad = 20
GO

SELECT *
FROM Compras.productos
WHERE PrecioUnidad > 35
GO

SELECT *
FROM Compras.productos
WHERE IdCategoria <> 1
GO

SELECT *
FROM Compras.productos
WHERE IdCategoria != 1
GO