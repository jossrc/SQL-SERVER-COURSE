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

-- CROSS JOIN

SELECT PR.NomProducto,
       PV.NomProveedor
FROM Compras.productos AS PR
CROSS JOIN Compras.proveedores AS PV
ORDER BY PR.NomProducto ASC, NomProveedor ASC
GO

-- UNION

SELECT NomCliente AS [Invitado],
       'Cliente'  AS [Tipo]
FROM Ventas.clientes
  UNION
SELECT NomProveedor AS [Invitado],
       'Proveedor'  AS [Tipo]
FROM Compras.proveedores
GO

-- CONSULTAS AGRUPADAS

  -- GROUP BY
SELECT C.NomCliente      AS [Nombre del Cliente],
       COUNT(P.IdPedido) AS [Cantidad de Pedidos]
FROM Ventas.clientes AS C
JOIN Ventas.pedidoscabe AS P
  ON C.IdCliente = P.IdCliente
GROUP BY C.NomCliente
GO

  -- HAVING
SELECT YEAR(P.FechaPedido) AS [AÑO],
       E.NomEmpleado       AS [EMPLEADO],
       C.NomCliente        AS [CLIENTE],
       COUNT(P.IdPedido)   AS [CANTIDAD DE PEDIDOS]
FROM Ventas.clientes AS C
JOIN Ventas.pedidoscabe AS P
  ON C.IdCliente = P.IdCliente
JOIN RRHH.empleados AS E
  ON P.IdEmpleado = E.IdEmpleado
GROUP BY YEAR(P.FechaPedido), E.NomEmpleado, C.NomCliente
HAVING COUNT(P.IdPedido) > 2
ORDER BY 1,2,3
GO