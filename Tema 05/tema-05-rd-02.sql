USE Negocios
GO

-- INNER JOIN

SELECT C.NomCliente, P.NomProveedor
FROM Ventas.clientes AS C
INNER JOIN Compras.proveedores AS P
  ON C.idpais = P.idpais
GO

SELECT PR.IdProducto, PR.NomProducto,
       PR.PrecioUnidad, PV.NomProveedor
FROM Compras.proveedores PV
JOIN Compras.productos PR
  ON PV.IdProveedor = PR.IdProveedor
GO

-- LEFT JOIN

SELECT CL.IdCliente, CL.NomCliente,
       PC.IdPedido, PC.FechaPedido
FROM Ventas.clientes AS CL
LEFT JOIN Ventas.pedidoscabe AS PC
  ON CL.IdCliente = PC.IdCliente
GO

-- RIGHT JOIN

SELECT CL.IdCliente, CL.NomCliente,
       PC.IdPedido, PC.FechaPedido
FROM Ventas.clientes AS CL
RIGHT JOIN Ventas.pedidoscabe AS PC
  ON CL.IdCliente = PC.IdCliente
GO

-- FULL JOIN

SELECT CL.IdCliente, CL.NomCliente,
       PC.IdPedido, PC.FechaPedido
FROM Ventas.clientes AS CL
FULL JOIN Ventas.pedidoscabe AS PC
  ON CL.IdCliente = PC.IdCliente
GO

-- CROSS JOIN

SELECT PR.NomProducto,
       PV.NomProveedor,
	   '_____________' AS Estado
FROM Compras.productos AS PR
CROSS JOIN Compras.proveedores AS PV
  ORDER BY PR.NomProducto
GO

-- UNION

SELECT NomCliente AS [Invitado],
       DirCliente AS [Dirección],
       'Cliente'  AS [Tipo]
FROM Ventas.clientes
  UNION
SELECT NomProveedor AS [Invitado],
       DirProveedor AS [Dirección],
       'Proveedor'  AS [Tipo]
FROM Compras.proveedores
GO