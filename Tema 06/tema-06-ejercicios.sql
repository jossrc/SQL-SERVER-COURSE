USE Negocios
GO

/*
  01. Se requiere consultar los empleados con mas de 9 años de
      antigüedad, debiendo mostrar los campos nombre, apellidos,
      fecha de contratación. Utilice alias a los campos.
*/

SELECT NomEmpleado AS [Nombre del Empleado],
       ApeEmpleado AS [Apellido del Empleado],
       FecContrata AS [Fecha de contratación]
FROM RRHH.empleados
WHERE DATEDIFF(YY, FecContrata, GETDATE()) > 9
GO

/*
    02. Consultar los 02 productos de las categorías 1,3 y 5 con mayor
        unidades en existencia .
*/