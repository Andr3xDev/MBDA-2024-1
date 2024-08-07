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

EXECUTE PC_PRODUCTOS.INSERTAR_GENEROS('Fantasia');
EXECUTE PC_PRODUCTOS.INSERTAR_GENEROS('Ciencia Ficcion');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_GENEROS('Rol', 'Ciencia Ficcion');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_GENEROS('Estrategia', 'Fantasia');
EXECUTE PC_PRODUCTOS.CONSULTAR_GENERO(); 
EXECUTE PC_PRODUCTOS.ELIMINAR_GENERO('Estrategia');
EXECUTE PC_PRODUCTOS.ELIMINAR_GENERO('Rol');

-- 3. Paquetes de Plataformas

EXECUTE PC_PRODUCTOS.INSERTAR_PLATAFORMAS('OCULUS');
EXECUTE PC_PRODUCTOS.INSERTAR_PLATAFORMAS('GAMECUBE');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_PLATAFORMAS('OCULUS', 'STEAM');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_PLATAFORMAS('GAMECUBE', 'PC');
EXECUTE PC_PRODUCTOS.CONSULTAR_PLATAFORMAS(); 
EXECUTE PC_PRODUCTOS.ELIMINAR_PLATAFORMAS('STEAM');
EXECUTE PC_PRODUCTOS.ELIMINAR_PLATAFORMAS('PC');

-- 4. Paquete de Productos

EXECUTE PC_PRODUCTOS.OFRECER_PRODUCTO('Alvin Delgado','Spider-Man','malesuada id,','B','https://asd.fasf.jpg','T', 10000, 1, 'Juego', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.OFRECER_PRODUCTO('Jose Atonio','GTA','malesuada id,','B','https://pos.fsf.jpg','F', 10000, 1, 'Juego', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_PRODUCTO('Alvin Delgado','Spider-Man','muASD ASDnita','B','https://asd.fasf.jpg','T', 10000, 1, 'Juego', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_PRODUCTO('Jose Atonio','GTA','maleASD id,','B','https://pos.fsf.jpg','T', 20000, 1, 'Juego', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.CONSULTAR_PRODUCTO('Spider-Man');
EXECUTE PC_PRODUCTOS.CONSULTAR_PRODUCTO('GTA');
EXECUTE PC_PRODUCTOS.ELIMINAR_PRODUCTO('Spider-Man');
EXECUTE PC_PRODUCTOS.ELIMINAR_PRODUCTO('GTA');

-- 5. Paquete de Wishlists

EXECUTE PC_WISHLIST.AGREGAR_PRODUCTO_WISHLIST('Alvin Delgado','GTA', 'A', 1);
EXECUTE PC_WISHLIST.ACTUALIZAR_WISHLIST('Alvin Delgado','GTA', 'B', 2);
EXECUTE PC_WISHLIST.CONSULTAR_WISHLIST('Alvin Delgado');
EXECUTE PC_WISHLIST.ELIMINAR_WISHLIST('GTA', 'Alvin Delgado');

-- 6. Paquete de Intercambios

EXECUTE PC_INTERCAMBIOS.INSERTAR_INTERCAMBIO('Alvin Delgado','Spider-Man', 1,'Jose Atonio','GTA',2);
EXECUTE PC_INTERCAMBIOS.ACTUALIZAR_INTERCAMBIO('0000000001', 'Spider-Man', 2, 'GTA',3);
EXECUTE PC_INTERCAMBIOS.CONSULTAR_COMPRADORESXPRODUCTOS('Alvin Delgado', 'GTA');
EXECUTE PC_INTERCAMBIOS.CONSULTAR_INTERCAMBIOS('0000000001');

-- 7. Paquete de pagos

EXECUTE PC_PAGOS.REALIZAR_PAGO_INTERCAMBIO('0000000001','Alvin Delgado');
EXECUTE PC_PAGOS.REALIZAR_PAGO_INTERCAMBIO('0000000001','Jose Atonio');
EXECUTE PC_PAGOS.CONSULTAR_PAGOS('0000000001');
EXECUTE PC_PAGOS.MODIFICAR_PAGOS('0000000001','Tarjeta');

-- 8. Paquete de Calificaciones

EXECUTE PC_CALIFICACIONES.INSERTAR_CALIFICACION('Alvin Delgado','GTA', 5, 'Excelente');
EXECUTE PC_CALIFICACIONES.ACTUALIZAR_CALIFICACION('Alvin Delgado','GTA','Excelente, pero un poco rayado');
EXECUTE PC_CALIFICACIONES.CONSULTAR_CALIFICACION('Alvin Delgado','GTA');





-- CICLO 1: CRUDNoOK

-- 1. Paquete de Usuarios

EXECUTE PC_USUARIOS.INSERTAR_USUARIO(1203012,'risus.donec@google.net',3211952764,'9415 Id Av.');
EXECUTE PC_USUARIOS.INSERTAR_USUARIO('Jose Atonio','risgoogle.net',321195254,'asdafq 401 apto 312');
EXECUTE PC_USUARIOS.ACTUALIZAR_USUARIO('Alvin Delgado',NULL,0,123123123);
EXECUTE PC_USUARIOS.ACTUALIZAR_USUARIO(NULL,'risus.1@outlook.net',1312312312313,'asdafq 401 apto 3111');
EXECUTE PC_USUARIOS.CONSULTAR_USUARIO(132123123);
EXECUTE PC_USUARIOS.CONSULTAR_USUARIO(12312312);
EXECUTE PC_USUARIOS.MODIFICAR_VENDEDOR(123123, '9849271791-1', 'Multimillonario');
EXECUTE PC_USUARIOS.MODIFICAR_VENDEDOR('Jose Atonio','Que es eso', 'Persona');
EXECUTE PC_USUARIOS.CONSULTAR_COMPRADOR(15281427);
EXECUTE PC_USUARIOS.CONSULTAR_COMPRADOR(124412);
EXECUTE PC_USUARIOS.CONSULTAR_VENDEDOR(12312);
EXECUTE PC_USUARIOS.CONSULTAR_VENDEDOR(1984719);
EXECUTE PC_USUARIOS.ELIMINAR_USUARIO(NULL);
EXECUTE PC_USUARIOS.ELIMINAR_USUARIO(NULL);

-- 2. Paquete de Generos

EXECUTE PC_PRODUCTOS.INSERTAR_GENEROS(1231203);
EXECUTE PC_PRODUCTOS.ACTUALIZAR_GENEROS(1231231232, 'Ciencia Ficcion');
EXECUTE PC_PRODUCTOS.CONSULTAR_GENERO(019); 
EXECUTE PC_PRODUCTOS.ELIMINAR_GENERO('Esto no lo crean');

-- 3. Paquetes de Plataformas

EXECUTE PC_PRODUCTOS.INSERTAR_PLATAFORMAS('OCULUS');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_PLATAFORMAS('GAMECUBE', 'PC');
EXECUTE PC_PRODUCTOS.CONSULTAR_PLATAFORMAS(123123123); 
EXECUTE PC_PRODUCTOS.ELIMINAR_PLATAFORMAS(23);

-- 4. Paquete de Productos

EXECUTE PC_PRODUCTOS.OFRECER_PRODUCTO('Alvin Delgado','Spider-Man','malesuada id,','B','https://asd.fasf.jpg','T', 10000, 1, 'Juego', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.OFRECER_PRODUCTO('Jose Atonio','GTA','malesuada id,','B','https://pos.fsf.jpg','F', 10000, 1, 'Juego', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_PRODUCTO('Alvin Delgado','Spider-Man','muASD ASDnita','B','https://asd.fasf.jpg','T', 10000, 1, 'Juego', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.ACTUALIZAR_PRODUCTO('Jose Atonio','GTA','maleASD id,','B','https://pos.fsf.jpg','T', 20000, 1, 'Juego', 'Rol', 'PC');
EXECUTE PC_PRODUCTOS.CONSULTAR_PRODUCTO('Spider-Man');
EXECUTE PC_PRODUCTOS.CONSULTAR_PRODUCTO('GTA');
EXECUTE PC_PRODUCTOS.ELIMINAR_PRODUCTO('Spider-Man');
EXECUTE PC_PRODUCTOS.ELIMINAR_PRODUCTO(312378213);

-- 5. Paquete de Wishlists

EXECUTE PC_WISHLIST.AGREGAR_PRODUCTO_WISHLIST('Alvin Delgado',12309120937, 'Altisima calidad', 1);
EXECUTE PC_WISHLIST.ACTUALIZAR_WISHLIST('Alvin Delgado'||13,'GTA', 'Bunenisimo 0 KM', 'Dos');
EXECUTE PC_WISHLIST.CONSULTAR_WISHLIST(183927912879812);
EXECUTE PC_WISHLIST.ELIMINAR_WISHLIST(2300313312, 'Alvin Delgado');

-- 6. Paquete de Intercambios

EXECUTE PC_INTERCAMBIOS.INSERTAR_INTERCAMBIO('Alvin Delgado Mala paga','Spider-pan', -1,'Jose Atonio',Null, -2);
EXECUTE PC_INTERCAMBIOS.ACTUALIZAR_INTERCAMBIO('0000000001', 'Spider-Man', -2, 'GTA Panadero', 3);
EXECUTE PC_INTERCAMBIOS.CONSULTAR_COMPRADORESXPRODUCTOS('Alvin Delgado', 'GTA no es lo que vendo');
EXECUTE PC_INTERCAMBIOS.CONSULTAR_INTERCAMBIOS('0000000000');

-- 7. Paquete de pagos

EXECUTE PC_PAGOS.REALIZAR_PAGO_INTERCAMBIO('0000000000',109238019238);
EXECUTE PC_PAGOS.REALIZAR_PAGO_INTERCAMBIO('0000000000','Jose Atonio No existe :c');
EXECUTE PC_PAGOS.CONSULTAR_PAGOS('0000000000');
EXECUTE PC_PAGOS.MODIFICAR_PAGOS('0000000000','Regalado');

-- 8. Paquete de Calificaciones

EXECUTE PC_CALIFICACIONES.INSERTAR_CALIFICACION('Alvin No existe','GTA no existe', 5, 100);
EXECUTE PC_CALIFICACIONES.ACTUALIZAR_CALIFICACION('Alvin No existe',30127,'Excelente, pero un poco rayado');
EXECUTE PC_CALIFICACIONES.CONSULTAR_CALIFICACION('Alvin Delgado','GTA no existe'|| 81738917239812738912739128739821739218739182739128739);

COMMIT;
---------- CODE END ----------