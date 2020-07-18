-- EXPERIMENTAR 5B

USE VENTASCIB
GO

-- 1. ¿Cómo se halla la longitud de una cadena en un campo de una tabla?

PRINT LEN('HOLA') -- 4

SELECT CL.RAZ_SOC_CLI AS [RAZÓN SOCIAL],
       LEN(CL.RAZ_SOC_CLI) AS [LONGITUD]
FROM dbo.TB_CLIENTE AS CL
GO

-- 2. ¿Cómo se hallan los nombres de los vendedores con más de 4 letras?

SELECT V.NOM_VEN AS [VENDEDOR]
FROM dbo.TB_VENDEDOR AS V
WHERE LEN(V.NOM_VEN) > 4
GO

-- 3. ¿Cómo se hallan los vendedores cuyos apellidos finaliza en O, N o S?

SELECT *
FROM dbo.TB_VENDEDOR AS V
WHERE V.APE_VEN LIKE '%[ONS]'
GO

-- 4. ¿Cómo se lista el primer carácter del nombre y apellido de los vendedores?

PRINT SUBSTRING('HOLA', 1,1)
GO

SELECT SUBSTRING(V.NOM_VEN, 1, 1) AS [NOMBRE PRIMER CARACTER],
       SUBSTRING(V.APE_VEN, 1, 1) AS [APELLIDO PRIMER CARACTER]
FROM dbo.TB_VENDEDOR AS V
GO

-- 5. ¿Cómo se listan los productos, donde el tercer y cuarto carácter sea "PE"?

SELECT *
FROM dbo.TB_PRODUCTO AS P
WHERE P.DES_PRO LIKE '__PE%'
GO

-- 6. ¿Cómo se listan los clientes donde el cuarto y quinto carácter sea "02"?

SELECT *
FROM dbo.TB_CLIENTE AS CL
WHERE CL.RUC_CLI LIKE '___02%'
GO

-- 7. ¿Cómo se convierte una cadena en minúscula (descripción de producto)?

PRINT LOWER('HOLA')
GO

SELECT LOWER(P.DES_PRO) AS [DESCRIPCION]
FROM dbo.TB_PRODUCTO AS P
GO

-- 8. ¿Cómo se convierte una cadena en mayúscula (apellido del vendedor)?

PRINT UPPER('hola')
GO

SELECT UPPER(APE_VEN) AS [APELLIDO]
FROM dbo.TB_VENDEDOR
GO

-- 9. ¿Cómo se reemplaza una cadena por otra cadena?

PRINT REPLACE('hola', 'h', 'M')
GO

-- 10. ¿Cómo se reemplaza parte de una cadena y agrego otra?

DECLARE @TEXT VARCHAR(100) = 'Bienvenido a SQL'
PRINT REPLACE(@TEXT, 'Bienvenido', 'Hola')
GO

-- 11. ¿Cómo se muestra una cadena impresa al revés?

DECLARE @TEXT VARCHAR(100) = 'Aprendiendo Sql Server'
PRINT REVERSE(@TEXT)
GO

-- 12. ¿Cómo se repite varias veces una cadena?

PRINT REPLICATE('HOLA',5)
GO

-- 13. ¿Cómo se obtiene el absoluto de un número?

DECLARE @NUMBER INT = -10
PRINT ABS(@NUMBER)
GO

-- 14. ¿Cómo se eleva un número a una potencia?

DECLARE @NUMBER INT = 3
PRINT SQUARE(@NUMBER)
PRINT POWER(@NUMBER, 3)
GO

-- 15. ¿Cómo se redondea al número entero mayor más próximo?

PRINT CEILING(10.27)
PRINT CEILING(10.85)

-- 16. ¿Cómo se redondea al número entero menor más próximo?

PRINT FLOOR(10.27)
PRINT FLOOR(10.85)

-- 17. ¿Cómo se redondea un número indicándole la cantidad de decimales a
--      considerar?

PRINT ROUND(10.5852, 2)

-- 18. ¿Cómo se convierte un tipo de número con 8 decimales a otro, de 2?

PRINT ROUND(10.15545982, 2)

-- 19. ¿Cómo se imprime un mensaje en la consola del SQL Server 2014?

PRINT 'Bienvenido a la Consola'

-- 20. ¿Cómo se da formato DD/MM/YY al campo fecha de una tabla?


-- 21. ¿Cómo se da formato DD/MM/YYYY al campo fecha de una tabla?


-- 22. ¿Cómo se obtiene el día de la semana de hoy?


-- 23. ¿Cómo se obtiene el mes de hoy?


-- 24. ¿Cómo se obtiene el día de facturación?


-- 25. ¿Cómo se obtiene el día en que nací?


-- 26. ¿Cómo se obtienen los clientes registrados un lunes o viernes?


-- 27. ¿Cómo se obtiene el año de registro de los clientes?


-- 28. ¿Cómo se obtienen las órdenes de compra registradas entre enero y junio?


-- 29. ¿Cómo se obtiene el número del día de una fecha?


-- 30. ¿Cómo se obtienen las facturas emitidas un sábado del primer semestre del 2010?


-- 31. ¿Cómo se obtiene el día si le adiciono 25 días a la fecha actual?


-- 32. ¿Cómo se determina la cantidad de días transcurridos para la cancelación de una
--     factura?


