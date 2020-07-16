USE Negocios
GO

-- INNER JOIN

SELECT PR.IdProducto,
       PR.NomProducto,
       PV.NomProveedor,
       PR.PrecioUnidad
FROM Compras.proveedores AS PV
INNER JOIN Compras.productos AS PR
  ON PV.IdProveedor = PR.IdProveedor
GO

SELECT PR.IdProducto,
       PR.NomProducto,
       PV.NomProveedor,
       CA.NombreCategoria,
       PR.PrecioUnidad
FROM Compras.proveedores AS PV
INNER JOIN Compras.productos AS PR
  ON PV.IdProveedor = PR.IdProveedor
INNER JOIN Compras.categorias AS CA
  ON PR.IdCategoria = CA.IdCategoria
GO

SELECT PR.IdProducto,
       PR.NomProducto,
       PV.NomProveedor,
       CA.NombreCategoria,
       PR.PrecioUnidad
FROM Compras.proveedores AS PV
JOIN Compras.productos AS PR
  ON PV.IdProveedor = PR.IdProveedor
JOIN Compras.categorias AS CA
  ON PR.IdCategoria = CA.IdCategoria
GO

-- LEFT JOIN

SELECT CL.*,
       PC.*
FROM Ventas.clientes AS CL
LEFT JOIN Ventas.pedidoscabe AS PC
  ON CL.IdCliente = PC.IdCliente
GO

-- RIGHT JOIN

SELECT CL.*,
       PC.*
FROM Ventas.clientes AS CL
RIGHT JOIN Ventas.pedidoscabe AS PC
  ON CL.IdCliente = PC.IdCliente
GO

-- FULL JOIN

SELECT CL.*,
       PC.*
FROM Ventas.clientes AS CL
FULL JOIN Ventas.pedidoscabe AS PC
  ON CL.IdCliente = PC.IdCliente
GO
