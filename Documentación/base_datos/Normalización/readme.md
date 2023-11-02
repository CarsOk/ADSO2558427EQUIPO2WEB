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
  - imagen


## Tabla admin_user

  - ID_admin_user (clave primaria)
  - first_name       
  - second_name      
  - last_name_1      
  - last_name_2      
  - identification   
  - address
  - email


## Tabla Productos

  - ID_Producto (clave primaria)
  - Nombre del producto
  - Descripción
  - Precio
  - Cantidad disponible
  - Imagen

## Tabla Pedidos
  - pedidos     

  - id (PK)         
  - user_id (FK)     
  -  producto_id (FK)     
  -  comentarios      
  -  metodo_pago 

## Tabla Categorias

  - id (PK)         
  - nombre           
  - imagen           
  
