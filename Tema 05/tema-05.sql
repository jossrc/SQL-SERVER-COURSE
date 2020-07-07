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

-- ELIMINAR REGISTROS - TRUNCATE

CREATE TABLE dbo.Consumer (
  ID_CONS         INT IDENTITY,
  FULLNAME_CONST  VARCHAR(50)
)
GO

INSERT dbo.Consumer
  SELECT NomCliente FROM Ventas.clientes
GO

SELECT * FROM dbo.Consumer
GO

TRUNCATE TABLE dbo.Consumer
GO

-- UPDATE

UPDATE Ventas.clientes
SET  NomCliente = 'Bembos Burger',
     DirCliente = 'Las Begonias 444',
     idpais = '001',
     fonoCliente = '(51)12832474'
WHERE IdCliente = 'CACTU'
GO

SELECT * FROM Ventas.clientes
  WHERE IdCliente = 'CACTU'
GO