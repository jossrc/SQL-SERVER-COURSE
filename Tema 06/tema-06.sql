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