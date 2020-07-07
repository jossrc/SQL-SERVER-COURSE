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

/*
   EJEMPLO
    Actualizar el precio de los productos incrementando
    10%, solo si han sido suministrados por proveedores de Colombia.
*/

SELECT Compras.productos.IdProducto, Compras.productos.NomProducto, Compras.productos.PrecioUnidad FROM Compras.productos
WHERE IdProveedor IN (
  SELECT IdProveedor FROM Compras.proveedores
  WHERE idpais IN (
    SELECT idpais FROM Ventas.paises
	WHERE NombrePais='Colombia'
  )
)

-- OR

SELECT Compras.productos.IdProducto, Compras.productos.NomProducto, Compras.productos.PrecioUnidad FROM Compras.productos
INNER JOIN Compras.proveedores
ON Compras.productos.IdProveedor = Compras.proveedores.IdProveedor
INNER JOIN Ventas.paises
ON Compras.proveedores.idpais = Ventas.paises.Idpais
  WHERE NombrePais = 'Colombia'
GO

UPDATE Compras.productos
SET PrecioUnidad = PrecioUnidad * 1.10
WHERE IdProveedor IN (
  SELECT IdProveedor FROM Compras.proveedores
  WHERE idpais IN (
    SELECT idpais FROM Ventas.paises
	WHERE NombrePais = 'Colombia'
  )
)
