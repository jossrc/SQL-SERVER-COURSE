USE Negocios
GO

/*
  01. Listar la cantidad de pedidos registrados por cada empleado y
      año, totalizando la cantidad de pedidos por cada año.
*/

SELECT ISNULL(E.NomEmpleado, 'SUBTOTAL') AS [EMPLEADO],
       YEAR(P.FechaPedido) AS [AÑO],
       COUNT(E.IdEmpleado) AS [PEDIDOS]
FROM Ventas.pedidoscabe AS P
JOIN RRHH.empleados AS E
  ON  P.IdEmpleado = E.IdEmpleado
GROUP BY YEAR(P.FechaPedido), E.NomEmpleado
WITH CUBE
ORDER BY 2,3
GO

/*
  02. Muestre los clientes que no realizaron pedido alguno.
*/