USE Negocios
GO

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