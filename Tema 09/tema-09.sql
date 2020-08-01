USE Negocios
GO

-- MANEJO DE CURSORES

-- 01. Declarar Cursor
DECLARE mi_cursor CURSOR SCROLL FOR
  SELECT * FROM Compras.productos
-- 02. Abrir cursor
OPEN mi_cursor
-- 03. Navegar los registros solicitados
FETCH FIRST FROM mi_cursor
FETCH ABSOLUTE 6 FROM mi_cursor
FETCH LAST FROM mi_cursor
-- 04. Cerrar el cursor
CLOSE mi_cursor
-- 05. Liberar el cursor
DEALLOCATE mi_cursor
GO

-- EJEMPLO 02

-- 01. Declarar variables de trabajo
DECLARE @id VARCHAR(5),
        @nombre VARCHAR(50),
        @pais VARCHAR(50)
-- 02. Declarar el cursor
DECLARE nuevo_cursor CURSOR FOR
  SELECT C.IdCliente, C.NomCliente, P.NombrePais
  FROM Ventas.clientes [C]
  JOIN Ventas.paises [P]
    ON c.idpais = p.Idpais
-- 03. Abrir
OPEN nuevo_cursor
-- 04. Leer el primer registro
FETCH nuevo_cursor INTO @id, @nombre, @pais
-- 05. Mientras pueda leer el registro
WHILE @@FETCH_STATUS = 0
  BEGIN
    -- Imprimir el registro
    PRINT @id + ', ' + @nombre + ', ' + @pais
    PRINT REPLICATE ('.', 50)
    -- Leer el registro siguiente
    FETCH nuevo_cursor INTO @id, @nombre, @pais
  END
-- 06. Cerrar
CLOSE nuevo_cursor
-- 07. Liberar
DEALLOCATE nuevo_cursor
GO
