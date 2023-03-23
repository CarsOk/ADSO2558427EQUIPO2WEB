<h1 align="center">Tablas normalizadas</h1>

## Tabla usuarios

  - ID_Usuario (clave primaria)
  - Primer nombre
  - Segundo nombre
  - Primer Apellido
  - Segundo Apellido
  - Correo electronico
  - Contraseña
  - Dirección
  - Ciudad
  - Numero de teléfono


## Tabla facturas

  - ID_Factura (clave primaria)
  - ID_Pago (clave foranea)
  - ID_Prestamo(clave foranea)
  - ID_Usuario(clave foranea)
  - Fecha de pagos


## Tabla Productos

  - ID_Producto (clave primaria)
  - Nombre del producto
  - Descripción
  - Precio
  - Cantidad disponible
  - Imagen

## Tabla Préstamos
  - ID_Préstamo (clave primaria)
  - ID_Usuario (clave foránea)
  - ID_Producto (clave foránea)
  - Fecha de inicio
  - Fecha de finalización
  - Monto del préstamo
  - Estado (en espera, aprobado, denegado)

## Tabla Pagos

  - ID_Pago (clave primaria)
  - ID_Préstamo (clave foránea)
  - Fecha de pago
  - Monto pagado
  - Saldo pendiente
