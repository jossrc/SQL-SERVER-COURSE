USE Negocios
GO

-- USO DEL SELECT

SELECT 'HELLO WORLD'
GO

-- CONSULTANDO DATOS

SELECT *
FROM Ventas.clientes
GO

-- MOSTRAR CIERTOS CAMPOS

SELECT IdCliente  AS 'Código',
       NomCliente AS 'Nombre del Cliente',
       DirCliente AS 'Dirección'
FROM Ventas.clientes
GO