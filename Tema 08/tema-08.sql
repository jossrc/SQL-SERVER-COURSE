USE Negocios
GO

-- VARIABLES GLOBALES

  -- La versión del SQL Server
PRINT 'Versión: ' + @@version
  -- Lenguaje configurado en el Servidor
PRINT 'Lenguaje: ' + @@language
  -- Nombre del Servidor
PRINT 'Servidor: ' + @@servername
  -- Nro. de conexiones permitidas
PRINT 'Conexiones: ' + str(@@max_connections)
GO


