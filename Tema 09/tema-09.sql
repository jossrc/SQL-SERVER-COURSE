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