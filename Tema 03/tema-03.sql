USE BD_TRAVEL
GO

-- VISUALIZAR SCHEMAS
SELECT * FROM sys.schemas
GO

-- CREANDO SCHEMA MKT

CREATE SCHEMA MKT
GO

-- PRIMARY KEY CLUSTERED
-- AL CREAR UNA TABLA

CREATE TABLE MKT.PAIS (
  ID_PAIS   INT         NOT NULL,
  NOM_PAIS  VARCHAR(50) NOT NULL,
  CONSTRAINT PK_PAIS PRIMARY KEY(ID_PAIS)
)
GO

-- PRIMARY KEY NONCLUSTERED
-- SOBRE UNA TABLA EXISTENTE

CREATE TABLE MKT.TIENDA (
  ID_TIENDA   INT           NOT NULL,
  NOM_TIENDA  VARCHAR(50)   NOT NULL,
  DIR_TIENDA  VARCHAR(60)   NOT NULL
)
GO

ALTER TABLE MKT.TIENDA
  ADD CONSTRAINT PK_TIENDA
  PRIMARY KEY NONCLUSTERED (ID_TIENDA)
GO

-- FOREIGN KEY
-- AL CREAR UNA TABLA

CREATE TABLE MKT.CLIENTE (
  ID_CLI   CHAR(5)       NOT NULL,
  NOM_CLI  VARCHAR(50)   NOT NULL,
  ID_PAIS  INT           NOT NULL
  CONSTRAINT FK_PAIS_CLIENTE  FOREIGN KEY (ID_PAIS)
  REFERENCES MKT.PAIS
)
GO

-- FOREIGN KEY
-- AL CREAR UNA TABLA EXISTENTE
-- USANDO ELIMINACION EN CASCADA

CREATE TABLE MKT.PROVEEDOR (
  ID_PROVE   CHAR(5)       NOT NULL,
  NOM_PROVE  VARCHAR(40)   NOT NULL,
  ID_PAIS    INT           NULL
  CONSTRAINT FK_PAIS_PROVE  FOREIGN KEY (ID_PAIS)
  REFERENCES MKT.PAIS
  ON DELETE CASCADE -- Elimina registros dependientes
)
GO

