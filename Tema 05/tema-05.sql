USE Negocios
GO

-- INSERCIÓN INDIVIDUAL DE UNA FILA

INSERT Compras.categorias (IdCategoria, NombreCategoria) 
  VALUES (99, 'Cereales')
GO

-- INSERCIÓN MÚLTIPLES FILAS

INSERT INTO Compras.categorias (IdCategoria, NombreCategoria)
  SELECT CategoryID, CategoryName FROM Northwind.dbo.Categories
GO

SELECT * FROM Compras.categorias
GO

-- BULK INSERT

BULK INSERT Ventas.Clientes
FROM 'C:\Clientes.txt'
WITH (FIELDTERMINATOR=',')
GO

SELECT * FROM Ventas.clientes
GO

-- DELETE

DELETE FROM Ventas.clientes
WHERE IdCliente LIKE 'C0%'
GO

SELECT * FROM Ventas.clientes
GO