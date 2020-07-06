USE BD_RECOBRA
GO

/*

En la empresa Recobra, se decidió implementar restricciones a
la tabla Empleado que se creará en el schema RRHH.
   + Llave primaria NonClustered.
   + Nombre y apellidos debe ser únicos.
   + Sueldo no debe ser menor de 1000, ni tampoco exceder los
     15000.
   + Valor predeterminado fecha de ingreso con fecha actual del
     sistema.

*/

SELECT * FROM sys.schemas
GO

-- TABLA EMPLEADO

CREATE TABLE RRHH.EMPLEADO (
  ID_EMP   CHAR(8)      NOT NULL,
  NOM_EMP  VARCHAR(50)  NOT NULL,
  APE_EMP  VARCHAR(50)  NOT NULL,
  FNA_EMP  DATE         NOT NULL,
  FIN_EMP  DATE,
  SUE_EMP  SMALLMONEY
)
GO

-- IMPLEMENTANDO RESTRICCIONES A TABLA EMPLEADO

ALTER TABLE RRHH.EMPLEADO
  ADD
  CONSTRAINT PK_ID_EMP  
    PRIMARY KEY NONCLUSTERED (ID_EMP),
  CONSTRAINT UQ_NOM_APE_EMP
    UNIQUE (NOM_EMP, APE_EMP),
  CONSTRAINT CK_SUELDO CHECK
    (SUE_EMP BETWEEN 1000 AND 15000),
  CONSTRAINT DF_FIN_EMP
    DEFAULT GETDATE() FOR FIN_EMP
GO

SELECT * FROM sys.check_constraints   -- CHECK
SELECT * FROM sys.key_constraints     -- KEY - UQ
SELECT * FROM sys.default_constraints -- DEFAULT
GO