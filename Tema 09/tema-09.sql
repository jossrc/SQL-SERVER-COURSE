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

-- EJEMPLO 03
-- CURSORES ANIDADOS
DECLARE @vc_Idcli CHAR(5),
        @vc_NomCli VARCHAR(50),
        @vc_DirCli VARCHAR(50)
DECLARE cursor2 CURSOR FOR
  SELECT IdCliente, NomCliente, DirCliente
  FROM Ventas.clientes
OPEN cursor2
FETCH cursor2 INTO @vc_Idcli, @vc_NomCli, @vc_DirCli
  PRINT SPACE(25) + 'REPORTE DE CLIENTES'
  PRINT SPACE(25) + REPLICATE('*', 25)
WHILE @@FETCH_STATUS = 0
  BEGIN
    PRINT 'Nombre del Cliente: ' + @vc_Idcli
    PRINT 'Dirección Cliente : '  + @vc_DirCli
    PRINT ''
    DECLARE cursorAnil CURSOR FOR
      SELECT IdPedido, FechaPedido 
      FROM Ventas.pedidoscabe
    WHERE IdCliente = @vc_Idcli
    DECLARE @vc_IdPed INT, @vc_FecPed DATE
    OPEN cursorAnil
    FETCH cursorAnil INTO @vc_IdPed, @vc_FecPed
    WHILE @@FETCH_STATUS = 0
      BEGIN
        PRINT SPACE(20) + LTRIM(@vc_IdPed) + SPACE(20) + CONVERT(VARCHAR(16), @vc_FecPed, 6)
        PRINT SPACE(20) + REPLICATE('-', 25)
        FETCH cursorAnil INTO @vc_IdPed, @vc_FecPed
      END
    CLOSE cursorAnil
    DEALLOCATE cursorAnil
    FETCH cursor2 INTO @vc_Idcli, @vc_NomCli, @vc_DirCli
  END
PRINT REPLICATE('*', 50)
CLOSE cursor2
DEALLOCATE cursor2
GO

