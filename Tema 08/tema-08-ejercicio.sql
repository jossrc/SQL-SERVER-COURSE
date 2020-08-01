USE Negocios
GO

/* 
   Efectúe una transacción explícita para registrar nuevos
   Clientes, en caso el nombre del Cliente no se repita, se confirma
   la transacción, de lo contrario, genere un error de severidad
   grave, controlándolo con Try Catch y deshacer.

   Controle los errores de duplicidad de llave primaria y llave
   foránea..

 */

SET NOCOUNT ON
BEGIN TRY
  BEGIN TRANSACTION TR001
    DECLARE @v_IdCliente   CHAR(5)     = 'A000I'
    DECLARE @v_NomCliente  VARCHAR(40) = 'Alfredo Kimball'
    DECLARE @v_DirCliente  VARCHAR(60) = 'Ca Paujile 123'
    DECLARE @v_IdPais      CHAR(3)     = '001'
    DECLARE @v_FonoCliente VARCHAR(25) = '98765567'
    
    DECLARE @v_tabNom TABLE (
      nomClie VARCHAR(455)
    )
    
    INSERT INTO @v_tabNom
    SELECT NomCliente FROM Ventas.clientes
    
    INSERT INTO Ventas.clientes VALUES
      (@v_IdCliente, @v_NomCliente, @v_DirCliente, @v_IdPais, @v_FonoCliente)

    IF NOT EXISTS (
      SELECT * FROM @v_tabNom
      WHERE nomClie = @v_NomCliente
    )
      COMMIT TRANSACTION TR001
    ELSE
      RAISERROR ('Datos de nombre ya existe', 16, 1)
END TRY
BEGIN CATCH
  IF ERROR_NUMBER() = 2627
    PRINT 'Error de IdCliente Repetido'
  IF ERROR_NUMBER() = 547
    PRINT 'Error de NomCli no existe'
  ELSE
    BEGIN
      ROLLBACK TRAN TR001
      PRINT ERROR_MESSAGE()
    END
END CATCH
GO