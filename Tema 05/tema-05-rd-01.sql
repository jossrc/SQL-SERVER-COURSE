
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