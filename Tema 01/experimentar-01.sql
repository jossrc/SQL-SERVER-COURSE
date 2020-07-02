-- EXPERIMENTAR 01
USE master
GO

-- 01. Visualice las bases de datos disponibles en su servidor de base de datos local
SELECT * FROM sys.databases
GO

SELECT name, user_access_desc, is_read_only, state_desc, recovery_model_desc  
FROM sys.databases;
