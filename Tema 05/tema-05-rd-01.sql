
-- CONSULTA SIMPLE

SELECT * FROM Negocios.Ventas.clientes
GO

-- MOSTRAR CIERTOS CAMPOS

SELECT NomCliente, DirCliente
  FROM Negocios.Ventas.clientes
GO

-- USANDO ALIAS EN CONSULTAS

SELECT NomCliente AS [Nombre del CLiente],
       DirCliente AS [Dirección]
  FROM Negocios.Ventas.clientes
GO

-- ORDENAR EL RESULTADO DE LA CONSULTA

SELECT NomCliente AS [Nombre del Cliente],
       DirCliente AS [Dirección]
FROM Negocios.Ventas.clientes
ORDER BY NomCliente DESC, DirCliente ASC
GO