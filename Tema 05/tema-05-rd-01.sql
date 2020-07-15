
-- CONSULTA SIMPLE

SELECT * FROM Negocios.Ventas.clientes
GO

-- MOSTRAR CIERTOS CAMPOS

SELECT NomCliente, DirCliente
  FROM Negocios.Ventas.clientes
GO

-- USANDO ALIAS EN CONSULTAS

SELECT NomCliente AS [Nombre del CLiente],
       DirCliente AS [Direcci�n]
  FROM Negocios.Ventas.clientes
GO

-- ORDENAR EL RESULTADO DE LA CONSULTA

SELECT NomCliente AS [Nombre del Cliente],
       DirCliente AS [Direcci�n]
FROM Negocios.Ventas.clientes
ORDER BY NomCliente DESC, DirCliente ASC
GO

-- PREDICADO TOP

SELECT TOP 2 NomCliente
FROM Negocios.Ventas.clientes
GO

SELECT TOP 5 *
FROM Negocios.Compras.productos
ORDER BY PrecioUnidad ASC
GO
