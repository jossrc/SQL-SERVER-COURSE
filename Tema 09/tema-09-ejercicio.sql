USE BD_RECOBRA
GO

/*
  01. En la empresa Recobra, se pide implementar un cursor que
  permita insertar el código, nombre de cliente, monto de la
  deuda y mora de los clientes con factura pendiente de pago
  (estado de factura 2) en la tabla Tb_Morosos (qué debe crearse
  previamente), considerar los siguientes criterios:
  + Si es menos a 200 soles será del 10% de la deuda.  
  + Si es mayor igual a 200 y menos a 1000, será del 15% de la
    deuda.
  + Si es mayor o igual a 1000 será del 20% de la deuda.

*/