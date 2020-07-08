USE BDInmobiliaria
GO

-- 01. Ingrese los siguientes registros:

INSERT INTO Comercial.ESTADO (COD_EST, DESC_EST) VALUES
  ('EST001','OCUPADO'),
  ('EST002','DESOCUPADO'),
  ('EST003','VIGENTE'),
  ('EST004','VENCIDO'),
  ('EST005','HABILITADO'),
  ('EST006','DESHABILITADO')
GO

INSERT INTO Arquitectura.EDIFICIOS (COD_EDIF, NOM_EDIF,DIRECC_EDIF,CODPOSTAL_EDIF,AREA_TOTAL_EDIF,COD_EST) VALUES
  ('EDF001','La Posadera','Jr. Lima 123','L-01', 450 ,'EST005'),
  ('EDF002','El Corralito','Av. Saenz Peña 357','L-14',178 ,'EST006'),
  ('EDF003','Los Alamos','Av. Del Río 666','L-21',246 ,'EST005'),
  ('EDF004','El Aguajal','Jr. Urdanivia 875','L-21',285 ,'EST006'),
  ('EDF005','Los Cupisnique','Av. La Mar 966','L-14', 178,'EST005'),
  ('EDF006','El Indice','Av. Las Dromelias 777','L-01', 246,'EST006'),
  ('EDF007','Los Guerreros Moche','Av. De los acá','L-17', 246,'EST006')
GO

/*
   02. La Inmobiliaria acaba de recibir una lista de Edificios en Flat File, deberá ingresar
       a la tabla Edificios utilizando BULK INSERT. (En Experimentar se encuentra el
       archivo NuevosEdificios.TXT)
*/

BULK INSERT Arquitectura.EDIFICIOS
FROM 'C:\NuevosEdificios.txt'
WITH (FIRSTROW=1, FIELDTERMINATOR=',', ROWTERMINATOR='\n')
GO

SELECT * FROM Arquitectura.EDIFICIOS
GO

/*
   03. Inserte registros a la tabla Departamentos desde la Tabla TBDEPA ubicada en la
       Base de Datos BDCONSTRUCCION.
*/




/*
   04. Inserte registros a las tablas: Usuario, Propietario, Inquilino y Familiares, desde las
       tablas ubicadas en la Base de Datos BDADMISION.

*/




/*
   05. La Inmobiliaria acaba de recibir del departamento legal una lista de contratos en
       Flat File, deberá ingresar a la tabla Contratos utilizando BULK INSERT. (En
       Experimentar se encuentra el archivo Contratos.TXT)
*/




/*
   06. Así mismo, tiene una lista con todos los detalles de contrato, deberá ingresar a la
       tabla DETALLECONTRATOS utilizando BUK INSERT (En experimentar se
       encuentra el archivo DetalleContrato.TXT)
*/



/*
   07. Actualizar el precio de alquiler de los departamentos ubicados en el primer piso,
       incrementando en 25%.
*/




/*
   08. Actualizar los detalles de contrato perteneciente a los edificios ubicados en el
       código postal L-01, ampliando la fecha fin de alquiler en tres meses.
*/




/*
   09. Actualizar los contratos retrasando 2 semanas las fechas de firma de contrato
       perteneciente a los propietarios cuyo apellido inicie con consonante.
*/




-- 10. Cree una tabla TBContratosVencidos



/*
   11. Utilizando las tablas CONTRATO y TBCONTRATOSVENCIDOS realice las
       siguientes operaciones: (INSERT o UPDATE)
         + Insertar en la tabla TBCONTRATOSVENCIDOS si la comparación de códigos
           no coincide. (NOT MATCHED)
         + Actualizar en la tabla TBCONTRATOSVENCIDOS la fecha de contrato por la
           fecha actual si la comparación de códigos coincide (MATCHED).
           Utilizar el comando MERGE.
*/