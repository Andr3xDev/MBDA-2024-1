---------- CODE START ----------

-- CICLO 1: CRUDOK

-- 1. Paquete de Usuarios

EXECUTE PC_USUARIOS.INSERTAR_USUARIO('Alvin Delgado','risus.donec@google.net',3211952764,'9415 Id Av.');
EXECUTE PC_USUARIOS.INSERTAR_USUARIO('Jose Atonio','risus.1@google.net',3211952554,'asdafq 401 apto 312');
EXECUTE PC_USUARIOS.ACTUALIZAR_USUARIO('Alvin Delgado','risusc@google.net',3211952764,'Id Av.Salomon');
EXECUTE PC_USUARIOS.ACTUALIZAR_USUARIO('Jose Atonio','risus.1@outlook.net',3211952564,'asdafq 401 apto 3111');
EXECUTE PC_USUARIOS.CONSULTAR_USUARIO('Alvin Delgado');
EXECUTE PC_USUARIOS.CONSULTAR_USUARIO('Jose Atonio');
EXECUTE PC_USUARIOS.MODIFICAR_VENDEDOR('Alvin Delgado','9849271791-1', 'Tienda');
EXECUTE PC_USUARIOS.MODIFICAR_VENDEDOR('Jose Atonio','9895071799-8', 'Persona');
EXECUTE PC_USUARIOS.CONSULTAR_COMPRADOR('Alvin Delgado');
EXECUTE PC_USUARIOS.CONSULTAR_COMPRADOR('Jose Atonio');
EXECUTE PC_USUARIOS.CONSULTAR_VENDEDOR('Alvin Delgado');
EXECUTE PC_USUARIOS.CONSULTAR_VENDEDOR('Jose Atonio');
EXECUTE PC_USUARIOS.ELIMINAR_USUARIO('Alvin Delgado');
EXECUTE PC_USUARIOS.ELIMINAR_USUARIO('Jose Atonio');

-- 2. Paquete de Generos

EXECUTE PC_GENEROS.INSERTAR_GENEROS('Fantasia');
EXECUTE PC_GENEROS.INSERTAR_GENEROS('Ciencia Ficcion');
EXECUTE PC_GENEROS.ACTUALIZAR_GENEROS('Horror', 'Ciencia Ficcion');
EXECUTE PC_GENEROS.ACTUALIZAR_GENEROS('Estrategia', 'Fantasia');
EXECUTE PC_GENEROS.CONSULTAR_GENERO(); 
EXECUTE PC_GENEROS.ELIMINAR_GENERO('Estrategia');
EXECUTE PC_GENEROS.ELIMINAR_GENERO('Horror');

-- 3. Paquetes de Plataformas

EXECUTE PC_PLATAFORMAS.INSERTAR_PLATAFORMAS('OCULUS');
EXECUTE PC_PLATAFORMAS.INSERTAR_PLATAFORMAS('GAMECUBE');
EXECUTE PC_PLATAFORMAS.ACTUALIZAR_PLATAFORMAS('PC', 'STADIA');
EXECUTE PC_PLATAFORMAS.ACTUALIZAR_PLATAFORMAS('XBOX', 'PC');
EXECUTE PC_PLATAFORMAS.CONSULTAR_PLATAFORMAS(); 
EXECUTE PC_PLATAFORMAS.ELIMINAR_PLATAFORMAS('STEAM');
EXECUTE PC_PLATAFORMAS.ELIMINAR_PLATAFORMAS('NINTENDO');

-- 4. Paquete de Productos

EXECUTE PC_PRODUCTOS.OFRECER_PRODUCTO('Alvin Delgado','Spider-Man','malesuada id,','B','https://asd.fasf.jpg','F', 10000, 1, 'Persona', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.OFRECER_PRODUCTO('Jose Atonio','GTA','malesuada id,','B','https://pos.fsf.jpg','F', 10000, 1, 'Persona', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_PRODUCTO('Alvin Delgado','Spider-Man','muASD ASDnita','B','https://asd.fasf.jpg','F', 10000, 1, 'Persona', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_PRODUCTO('Jose Atonio','GTA','maleASD id,','B','https://pos.fsf.jpg','F', 10000, 1, 'Persona', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.CONSULTAR_PRODUCTO('Spider-Man');
EXECUTE PC_PRODUCTOS.CONSULTAR_PRODUCTO('GTA');
EXECUTE PC_PRODUCTOS.ELIMINAR_PRODUCTO('Spider-Man');
EXECUTE PC_PRODUCTOS.ELIMINAR_PRODUCTO('GTA');

-- 5. Paquete de Wishlists

EXECUTE PC_WISHLIST.AGREGAR_PRODUCTO_WISHLIST('Alvin Delgado','GTA', 'A', 1);
EXECUTE PC_WISHLIST.ACTUALIZAR_WISHLIST('Alvin Delgado','GTA', 'B', 2);
EXECUTE PC_WISHLIST.ELIMINAR_WISHLIST('GTA', 'Alvin Delgado');
EXECUTE PC_WISHLIST.CONSULTAR_WISHLIST('Alvin Delgado');

-- 6. Paquete de Intercambios

EXECUTE PC_INTERCAMBIOS.INSERTAR_INTERCAMBIO('Alvin Delgado','Spider-Man', 1,'Jose Atonio','GTA',2);
EXECUTE PC_INTERCAMBIOS.ACTUALIZAR_INTERCAMBIO('Jose Atonio','Spider-Man', 2,'Jose Atonio','GTA',3);
EXECUTE PC_INTERCAMBIOS.CONSULTAR_COMPRADORESXPRODUCTOS('Alvin Delgado', 'GTA');
EXECUTE PC_INTERCAMBIOS.CONSULTAR_COMPRADORESXPRODUCTOS('Alvin Delgado', 'GTA');

-- 7. Paquete de Calificaciones

EXECUTE PC_CALIFICACIONES.INSERTAR_CALIFICACION();
EXECUTE PC_CALIFICACIONES.INSERTAR_CALIFICACION();
EXECUTE PC_CALIFICACIONES.INSERTAR_CALIFICACION();
EXECUTE PC_CALIFICACIONES.ACTUALIZAR_CALIFICACION();
EXECUTE PC_CALIFICACIONES.ACTUALIZAR_CALIFICACION();
EXECUTE PC_CALIFICACIONES.ACTUALIZAR_CALIFICACION();
EXECUTE PC_CALIFICACIONES.CONSULTAR_CALIFICACION();
EXECUTE PC_CALIFICACIONES.CONSULTAR_CALIFICACION();
EXECUTE PC_CALIFICACIONES.CONSULTAR_CALIFICACION();

-- 8. Paquete de pagos

EXECUTE PC_PAGOS.REALIZAR_PAGO_INTERCAMBIO('0000000001','Alvin Delgado');
EXECUTE PC_PAGOS.REALIZAR_PAGO_INTERCAMBIO('0000000001','Jose Atonio');
EXECUTE PC_PAGOS.CONSULTAR_PAGOS('0000000001');

---------- CODE END ----------