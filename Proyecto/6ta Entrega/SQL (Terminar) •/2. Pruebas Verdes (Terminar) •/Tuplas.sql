---------- CODE START ----------

-- CICLO 1: TuplasOK

-- 1. Validar que el comprador1 y el comprador2 no sean la misma persona.

INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('0384999124', 'Annemarie Whines', 'awhines2x@tumblr.com', '3008805906', '2261 Linden Plaza', '30-06-2018', 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('5796828566', 'Pepita De Biasi', 'pde2y@jigsy.com', '3002923421', '96850 Lukken Point', '29-10-2015', 'P');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('2366072125', 'Teodoro Cashley', 'tcashley2z@java.com', '3005251110', '03 Towne Way', '08-03-2019', 'E');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('5584098050', 'Archie Wabersich', 'awabersich30@wix.com', '3003072245', '22 Fremont Street', '28-09-2018', 'P');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('1079317986', 'Pattie Domek', 'pdomek31@feedburner.com', '3005154624', '5 Saint Paul Plaza', '28-03-2015', 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('5022866287', 'Somerset McIllrick', 'smcillrick32@google.pl', '3008921947', '1 Northwestern Way', '11-05-2019', 'E');

INSERT INTO Vendedores (id, nit, tipo) VALUES ('0384999124', '5394203743-6', 'Tienda');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('5796828566', '9167052351-2', 'Plataforma');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('2366072125', '2658813180-5', 'Tienda');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('5584098050', '5324203743-6', 'Tienda');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('1079317986', '9367052351-2', 'Plataforma');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('5022866287', '2657813180-5', 'Tienda');

INSERT INTO Compradores (id, experiencia) VALUES ('0384999124', 'Gamer');
INSERT INTO Compradores (id, experiencia) VALUES ('5796828566', 'Coleccionista');
INSERT INTO Compradores (id, experiencia) VALUES ('2366072125', 'Novato');
INSERT INTO Compradores (id, experiencia) VALUES ('5584098050', 'Gamer');
INSERT INTO Compradores (id, experiencia) VALUES ('1079317986', 'Coleccionista');
INSERT INTO Compradores (id, experiencia) VALUES ('5022866287', 'Novato');

INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, disponibilidad) VALUES ('PRD001', 'The Legend of Zelda: Breath of the Wild', 'Exploracion y misterio.', 'N', 'https://example.com/zelda.jpg', 'T');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, disponibilidad) VALUES ('PRD002', 'Cien años de soledad', 'Juego de aventura y fantasia', 'B', 'https://example.com/cien_anios_soledad.jpg', 'T');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, disponibilidad) VALUES ('PRD003', 'Nintendo Switch', 'Consola de videojuegos portátil', 'N', 'https://example.com/switch.jpg', 'T');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, disponibilidad) VALUES ('PRD004', 'FIFA 22', 'Videojuego de fútbol', 'B', 'https://example.com/fifa22.jpg', 'T');

INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('INT001', 'Pendiente', 20000, SYSDATE, '5584098050', '0384999124', 'PRD001', 'PRD002');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('INT002', 'Aprobado', 70000, SYSDATE, '1079317986', '5796828566', 'PRD002', 'PRD003');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('INT003', 'Rechazado', 85000, SYSDATE, '5022866287', '2366072125', 'PRD003', 'PRD004');

-- 2. Validar que la fecha de lanzamiento de los juegos esté entre 1970 y el año actual.

INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('WL001', 'A', 5, 'D');
INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('WL002', 'M', 3, 'D');
INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('WL003', 'B', 2, 'D');

INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('P001', 'Nintendo Switch', 'Consola de videojuegos híbrida', 'N', 'https://imagen.com/nintendo_switch.jpg', 300000, 'T', 'WL001');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('P002', 'PlayStation 5', 'Consola de última generación de Sony', 'N', 'https://imagen.com/ps5.jpg', 500000, 'T', 'WL002');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('P003', 'Xbox Series X', 'Consola de videojuegos de Microsoft', 'N', 'https://imagen.com/xbox_series_x.jpg', 450000, 'T', 'WL003');

INSERT INTO Juegos (id, desarrollador, lanzamiento) VALUES ('P001', 'Nintendo', '2020');
INSERT INTO Juegos (id, desarrollador, lanzamiento) VALUES ('P002', 'Naughty Dog', '2013');
INSERT INTO Juegos (id, desarrollador, lanzamiento) VALUES ('P003', 'Rockstar Games', '2018');

-- 3. Validar que la cantidad de productos ofrecidos sea mayor que cero.

INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('USRT001', 'Juan Pérez', 'juan@example.com', 3124567890, 'Calle 123 - 345', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('USRT002', 'María López', 'maria@example.com', 3176543210, 'Avenida 456', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('USRT003', 'Pedro Ramírez', 'pedro@example.com', 3215555555, 'Carrera 789- 984', TO_DATE('2024-04-29', 'YYYY-MM-DD'), 'A');

INSERT INTO Vendedores (id, nit, tipo) VALUES ('USRT001', '1234567898-1', 'Tienda');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('USRT002', '9876543218-2', 'Persona');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('USRT003', '5555555575-3', 'Plataforma');

INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('W001', 'A', 5, 'D');
INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('W002', 'B', 3, 'N');
INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('W003', 'M', 10, 'D');

INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('PRD001', 'Smartphone', 'Teléfono móvil', 'N', 'https://example.com/smartphone.jpg', 100000, 'T', 'W001');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('PRD002', 'Laptop', 'Computadora portátil', 'B', 'https://example.com/laptop.jpg', 1500000, 'T', 'W002');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('PRD003', 'Consola de Videojuegos', 'Consola de última generación', 'N', 'https://example.com/consola.jpg', 500000, 'T', 'W003');

INSERT INTO Ofrecimientos (vendedor, producto, precio, cantidad) VALUES ('USRT003', 'PRD001', 95000, 10);
INSERT INTO Ofrecimientos (vendedor, producto, precio, cantidad) VALUES ('USRT002', 'PRD002', 1450000, 5);
INSERT INTO Ofrecimientos (vendedor, producto, precio, cantidad) VALUES ('USRT003', 'PRD003', 450000, 8);



-- CICLO 1: TuplasNoOK

-- 1. Validar que el total de cada intercambio coincida con la suma de los precios de los productos intercambiados.

INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('7845023111', 'Javier Gómez', 'javier.gomez@example.com', '3001122334', 'Calle 123 #12-65', '12-05-2023', 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('8456023112', 'Juan Pérez', 'juan.perez@example.com', '3002233445', 'Carrera 456', '12-05-2023', 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('9067023113', 'María Rodríguez', 'maria.rodriguez@example.com', '3003344556', 'Avenida 789', '12-05-2023', 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('2314876952', 'Luisa Martínez', 'luisa.martinez@example.com', '3004455667', 'Calle 789 #12-54', '12-05-2023', 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('3625987043', 'Pedro Sánchez', 'pedro.sanchez@example.com', '3005566778', 'Carrera 123', '12-05-2023', 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('4936107134', 'Ana Gómez', 'ana.gomez@example.com', '3006677889', 'Avenida 456', '12-05-2023', 'A');

INSERT INTO Vendedores (id, nit, tipo) VALUES ('7845023111', '1234567893-0', 'Tienda');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('8456023112', '9876543231-0', 'Plataforma');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('9067023113', '2468013537-0', 'Tienda');

INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('4567890123', 'A', 20, 'D');
INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('5678901234', 'B', 30, 'N');
INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('6789012345', 'C', 40, 'D');

INSERT INTO Compradores (id, experiencia, wishlist) VALUES ('2314876952', 'Entusiasta', '4567890123');
INSERT INTO Compradores (id, experiencia, wishlist) VALUES ('3625987043', 'Gamer', '5678901234');
INSERT INTO Compradores (id, experiencia, wishlist) VALUES ('4936107134', 'Coleccionista', '6789012345');

INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('PRD005', 'PlayStation 5', 'Consola de última generación', 'N', 'https://example.com/ps5.jpg', 499000, 'T', '4567890123');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('PRD006', 'Xbox Series X', 'Consola de videojuegos de Microsoft', 'N', 'https://example.com/xbox_series_x.jpg', 499000, 'T', '5678901234');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('PRD007', 'Nintendo Switch', 'Consola de videojuegos portátil', 'N', 'https://example.com/nintendo_switch.jpg', 349000, 'T', '6789012345');

INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2) VALUES ('INT004', 'Pendiente', 300000, SYSDATE, '7845023111', '7845023111', 'PRD005', 'PRD006');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2) VALUES ('INT005', 'Aprobado', 800000, SYSDATE, '2314876952', '2314876952', 'PRD006', 'PRD007');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2) VALUES ('INT006', 'Rechazado', 1200000, SYSDATE, '9067023113', '9067023113', 'PRD007', 'PRD005');

-- 2. Validar que la fecha de lanzamiento de los juegos esté entre 1970 y el año actual.

INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('WL004', 'S', 1, 'D');
INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('WL005', 'C', 4, 'D');
INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('WL006', 'B', 2, 'N');

INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('P004', 'The Legend of Zelda: Breath of the Wild', 'Videojuego de aventuras desarrollado por Nintendo', 'B', 'https://imagen.com/zelda_botw.jpg', 60000, 'T', 'WL004');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('P005', 'The Last of Us Part II', 'Videojuego de acción y aventuras desarrollado por Naughty Dog', 'B', 'https://imagen.com/last_of_us_2.jpg', 80000, 'T', 'WL005');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('P006', 'Grand Theft Auto V', 'Videojuego de acción-aventura desarrollado por Rockstar North', 'B', 'https://imagen.com/gta_v.jpg', 70000, 'T', 'WL006');

INSERT INTO Juegos (id, desarrollador, lanzamiento) VALUES ('P004', 'Nintendo', '1969');
INSERT INTO Juegos (id, desarrollador, lanzamiento) VALUES ('P005', 'Naughty Dog', '2025');
INSERT INTO Juegos (id, desarrollador, lanzamiento) VALUES ('P006', 'Rockstar Games', '1496');

-- 3. Validar que la cantidad de productos ofrecidos sea mayor que cero.

INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('USRT004', 'Ana Martínez', 'ana@example.com', 3101234567, 'Calle 567 - 890', TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('USRT005', 'Carlos García', 'carlos@example.com', 3189876543, 'Avenida 901', TO_DATE('2024-05-02', 'YYYY-MM-DD'), 'A');
INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado) VALUES ('USRT006', 'Luisa Sánchez', 'luisa@example.com', 3205555555, 'Carrera 234 - 567', TO_DATE('2024-05-03', 'YYYY-MM-DD'), 'A');

INSERT INTO Vendedores (id, nit, tipo) VALUES ('USRT004', '1111111111-1', 'Tienda');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('USRT005', '2222222222-2', 'Persona');
INSERT INTO Vendedores (id, nit, tipo) VALUES ('USRT006', '3333333333-3', 'Plataforma');

INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('W004', 'A', 8, 'D');
INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('W005', 'B', 2, 'N');
INSERT INTO WishLists (id, prioridad, cantidad, estado) VALUES ('W006', 'M', 12, 'D');

INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('PRD004', 'Tablet', 'Tablet de alta resolución', 'N', 'https://example.com/tablet.jpg', 200000, 'T', 'W004');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('PRD005', 'Smartwatch', 'Reloj inteligente con seguimiento de actividad', 'B', 'https://example.com/smartwatch.jpg', 80000, 'T', 'W005');
INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, precio, disponibilidad, wishlist) VALUES ('PRD006', 'Audífonos', 'Audífonos inalámbricos con cancelación de ruido', 'N', 'https://example.com/audifonos.jpg', 120000, 'T', 'W006');

INSERT INTO Ofrecimientos (vendedor, producto, precio, cantidad) VALUES ('USRT006', 'PRD004', 180000, -4);
INSERT INTO Ofrecimientos (vendedor, producto, precio, cantidad) VALUES ('USRT005', 'PRD005', 75000, -3);
INSERT INTO Ofrecimientos (vendedor, producto, precio, cantidad) VALUES ('USRT006', 'PRD006', 100000, 0);

---------- CODE END ----------