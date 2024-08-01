---------- CODE START ----------

-- CICLO 1: Tablas

CREATE TABLE Usuarios (
    id VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(30) NOT NULL,
    correo VARCHAR2(50) NOT NULL,
    celular NUMBER(10) NOT NULL,
    direccion VARCHAR2(80) NOT NULL,
    registro DATE NOT NULL,
    estado VARCHAR2(1) NOT NULL
);

CREATE TABLE Vendedores (
    id VARCHAR2(10) NOT NULL,
    nit VARCHAR2(12),
    tipo VARCHAR2(10) NOT NULL
);

CREATE TABLE Ofrecimientos (
    vendedor VARCHAR2(10) NOT NULL,
    producto VARCHAR2(15) NOT NULL,
    precio NUMBER NOT NULL,
    cantidad NUMBER NOT NULL
);

CREATE TABLE Productos (
    id VARCHAR2(15) NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(200),
    condicion VARCHAR2(1) NOT NULL,
    imagen VARCHAR2(100) NOT NULL,
    disponibilidad VARCHAR2(1) NOT NULL
);

CREATE TABLE Claves (
    id VARCHAR2(15) NOT NULL,
    tipo VARCHAR2(15) NOT NULL,
    vencimiento DATE NOT NULL
);

CREATE TABLE Juegos (
    id VARCHAR2(15) NOT NULL,
    desarrollador VARCHAR2(20),
    lanzamiento DATE
);

CREATE TABLE Generos (
    genero VARCHAR2(20) NOT NULL
);

CREATE TABLE GenerosXProductos (
    genero VARCHAR2(20) NOT NULL,
    producto VARCHAR2(15) NOT NULL
);

CREATE TABLE Plataformas (
    plataforma VARCHAR2(12) NOT NULL
);

CREATE TABLE PlataformasXProductos (
    plataforma VARCHAR2(12) NOT NULL,
    producto VARCHAR2(15) NOT NULL

);

CREATE TABLE Compradores (
    id VARCHAR2(10) NOT NULL,
    experiencia VARCHAR2(15) NOT NULL
);

CREATE TABLE CompradoresXProductos (
    comprador VARCHAR2(10) NOT NULL,
    producto VARCHAR2(15) NOT NULL
);

CREATE TABLE WishLists (
    id VARCHAR2(10) NOT NULL,
    estado VARCHAR2(1) NOT NULL
);

CREATE TABLE WishListsXProductos (
    wishlist VARCHAR2(10) NOT NULL,
    producto VARCHAR2(15) NOT NULL,
    prioridad VARCHAR2(1) NOT NULL,
    cantidad NUMBER NOT NULL
);

CREATE TABLE Calificaciones (
    comprador VARCHAR2(10) NOT NULL,
    producto VARCHAR2(15) NOT NULL,
    estrellas NUMBER(1) NOT NULL,
    fecha DATE NOT NULL,
    comentario VARCHAR2(50)
);

CREATE TABLE Intercambios (
    id VARCHAR2(15) NOT NULL,
    estado VARCHAR2(12) NOT NULL,
    fecha DATE NOT NULL,
    comprador1 VARCHAR2(10) NOT NULL,
    producto1 VARCHAR2(15) NOT NULL,
    cantidad1 NUMBER NOT NULL,
    costo1 NUMBER NOT NULL,
    comprador2 VARCHAR2(10) NOT NULL, 
    producto2 VARCHAR2(15) NOT NULL,
    cantidad2 NUMBER NOT NULL,
    costo2 NUMBER NOT NULL
);

CREATE TABLE Pagos (
    id VARCHAR2(20) NOT NULL,
    metodo VARCHAR2(15) NOT NULL,
    total NUMBER NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR2(12) NOT NULL,
    intercambio VARCHAR2(15) NOT NULL
);
COMMIT;



-- CICLO 1: Atributos

-- Booleano

ALTER TABLE Productos ADD CONSTRAINT CK_PRODUCTOS_DISPONIBILIDAD
CHECK (disponibilidad IN ('T', 'F'));

-- Moneda

ALTER TABLE Ofrecimientos ADD CONSTRAINT CK_OFRECIMIENTOS_PRECIO
CHECK (precio > 0 AND MOD(precio, 100) = 0);
ALTER TABLE Intercambios ADD CONSTRAINT CK_INTERCAMBIOS_COSTO1
CHECK (costo1 > 0 AND MOD(costo1, 100) = 0);
ALTER TABLE Intercambios ADD CONSTRAINT CK_INTERCAMBIOS_COSTO2
CHECK (costo2 > 0 AND MOD(costo2, 100) = 0);
ALTER TABLE Pagos ADD CONSTRAINT CK_PAGOS_TOTAL
CHECK (total > 0 AND MOD(total, 100) = 0);

-- TCelular

ALTER TABLE Usuarios ADD CONSTRAINT CK_USUARIOS_CELULAR
CHECK (SUBSTR(celular, 1, 3) IN ('300', '301', '302', '303', '304', '305', 
                                 '310', '311', '312', '313', '314', '315',
                                 '316', '317', '318', '319', '320', '321',
                                 '322', '323', '324', '333'));

-- TClave

ALTER TABLE Claves ADD CONSTRAINT CK_CLAVES_TIPO
CHECK (tipo IN ('Activacion', 'Acceso', 'Autenticacion', 'API', 'Licencia', 'Descuento', 'Por definir'));

-- TCondicion

ALTER TABLE Productos ADD CONSTRAINT CK_PRODUCTOS_CONDICION
CHECK (condicion IN ('N', 'B', 'P', 'U'));

-- TCorreo

ALTER TABLE Usuarios ADD CONSTRAINT CK_USUARIOS_CORREO
CHECK (correo LIKE '%@%.%');

-- TDireccion

ALTER TABLE Usuarios ADD CONSTRAINT CK_USUARIOS_DIRECCION
CHECK (LENGTH(direccion) >= 10);

-- TEstado

ALTER TABLE Intercambios ADD CONSTRAINT CK_INTERCAMBIOS_ESTADO
CHECK (estado IN ('Aprobado', 'Pendiente', 'Pendiente 1','Pendiente 2', 'Rechazado', 'Reembolsado'));
ALTER TABLE Pagos ADD CONSTRAINT CK_PAGOS_ESTADO
CHECK (estado IN ('Aprobado', 'Pendiente', 'Pendiente 1','Pendiente 2', 'Rechazado', 'Reembolsado'));

-- TEstadoU

ALTER TABLE Usuarios ADD CONSTRAINT CK_USUARIOS_ESTADO
CHECK (estado IN ('A', 'I', 'B', 'S', 'E', 'P'));

-- TEstadoW

ALTER TABLE WishLists ADD CONSTRAINT CK_WISHLISTS_ESTADO
CHECK (estado IN ('A', 'I'));

-- TEstrellas

ALTER TABLE Calificaciones ADD CONSTRAINT CK_CALIFICACIONES_ESTRELLAS
CHECK (estrellas BETWEEN 0 AND 5);

-- TExperiencia

ALTER TABLE Compradores ADD CONSTRAINT CK_COMPRADORES_EXPERIENCIA
CHECK (experiencia IN ('Entusiasta', 'Novato', 'Gamer', 'Coleccionista', 'Ninguna'));

-- TGenero

ALTER TABLE Generos ADD CONSTRAINT CK_GENEROS_GENERO
CHECK (genero IN ('Accion', 'Aprendizaje', 'Aventura', 'Battle Royale', 'Carreras', 'Crafteo', 'Deportes',
                  'Desarrollo Software', 'Diseño', 'Disparos', 'Edicion', 'Educacion', 'Entretenimiento',
                  'Estrategia', 'Horror', 'Juego', 'Lucha', 'Mundo Abierto', 'Multimedia', 'Musical',
                  'Navegador Web', 'Oficina', 'Productividad', 'Puzzle', 'Rol', 'Seguridad', 'Sigilo',
                  'Simulacion', 'Sistema Operativo', 'Survival', 'Ciencia Ficcion', 'Fantasia'));
ALTER TABLE GenerosXProductos ADD CONSTRAINT CK_GENEROSXPRODUCTOS_GENERO
CHECK (genero IN ('Accion', 'Aprendizaje', 'Aventura', 'Battle Royale', 'Carreras', 'Crafteo', 'Deportes',
                  'Desarrollo Software', 'Diseño', 'Disparos', 'Edicion', 'Educacion', 'Entretenimiento',
                  'Estrategia', 'Horror', 'Juego', 'Lucha', 'Mundo Abierto', 'Multimedia', 'Musical',
                  'Navegador Web', 'Oficina', 'Productividad', 'Puzzle', 'Rol', 'Seguridad', 'Sigilo',
                  'Simulacion', 'Sistema Operativo', 'Survival', 'Ciencia Ficcion', 'Fantasia'));

-- TImagen

ALTER TABLE Productos ADD CONSTRAINT CK_PRODUCTOS_IMAGEN
CHECK (imagen LIKE 'https://%.%.jpg');

-- TMetodo

ALTER TABLE Pagos ADD CONSTRAINT CK_PAGOS_METODO
CHECK (metodo IN ('Efectivo', 'Tarjeta', 'Transaccion', 'Criptomonedas'));

-- TNit

ALTER TABLE Vendedores ADD CONSTRAINT CK_VENDEDORES_NIT
CHECK (REGEXP_LIKE(nit, '^\d{10}-\d$'));

-- TPlataforma

ALTER TABLE Plataformas ADD CONSTRAINT CK_PLATAFORMAS_PLATAFORMA
CHECK (plataforma IN ('PC', 'WII', 'XBOX', 'STEAM', 'NINTENDO', 'PLAY STATION', 'GAMECUBE', 'OCULUS', 'STADIA'));
ALTER TABLE PlataformasXProductos ADD CONSTRAINT CK_PLATAFORMASXPRODUCTOS_PLATAFORMA
CHECK (plataforma IN ('PC', 'WII', 'XBOX', 'STEAM', 'NINTENDO', 'PLAY STATION', 'GAMECUBE', 'OCULUS', 'STADIA'));

-- TPrioridad
ALTER TABLE WishListsXProductos ADD CONSTRAINT CK_WISHLISTSXPRODUCTOS_PRIORIDAD
CHECK (prioridad IN ('A', 'M', 'B', 'S', 'C'));

-- TVendedor
ALTER TABLE Vendedores ADD CONSTRAINT CK_VENDEDORES_TIPO
CHECK (tipo IN ('Tienda', 'Persona', 'Plataforma'));

COMMIT;



-- CICLO 1: Primarias

ALTER TABLE Usuarios
ADD CONSTRAINT PK_USUARIOS PRIMARY KEY (id);

ALTER TABLE Vendedores
ADD CONSTRAINT PK_VENDEDORES PRIMARY KEY (id);

ALTER TABLE Ofrecimientos
ADD CONSTRAINT PK_OFRECIMIENTOS PRIMARY KEY (vendedor, producto);

ALTER TABLE Productos
ADD CONSTRAINT PK_PRODUCTOS PRIMARY KEY (id);

ALTER TABLE Claves
ADD CONSTRAINT PK_CLAVES PRIMARY KEY (id);

ALTER TABLE Juegos
ADD CONSTRAINT PK_JUEGOS PRIMARY KEY (id);

ALTER TABLE Generos
ADD CONSTRAINT PK_GENEROS PRIMARY KEY (genero);

ALTER TABLE GenerosXProductos
ADD CONSTRAINT PK_GENEROSXPRODUCTOS PRIMARY KEY (genero, producto);

ALTER TABLE Plataformas
ADD CONSTRAINT PK_PLATAFORMAS PRIMARY KEY (plataforma);

ALTER TABLE PlataformasXProductos
ADD CONSTRAINT PK_PLATAFORMASXPRODUCTOS PRIMARY KEY (plataforma, producto);

ALTER TABLE Compradores
ADD CONSTRAINT PK_COMPRADORES PRIMARY KEY (id);

ALTER TABLE CompradoresXProductos
ADD CONSTRAINT PK_COMPRADORESXPRODUCTOS PRIMARY KEY (comprador, producto);

ALTER TABLE WishLists
ADD CONSTRAINT PK_WISHLISTS PRIMARY KEY (id);

ALTER TABLE WishListsXProductos
ADD CONSTRAINT PK_WISHLISTSXPRODUCTOS PRIMARY KEY (wishlist, producto);

ALTER TABLE Calificaciones
ADD CONSTRAINT PK_CALIFICACIONES PRIMARY KEY (comprador, producto);

ALTER TABLE Intercambios
ADD CONSTRAINT PK_INTERCAMBIOS PRIMARY KEY (id);

ALTER TABLE Pagos
ADD CONSTRAINT PK_PAGOS PRIMARY KEY (id);

COMMIT;



-- CICLO 1: Unicas

ALTER TABLE Usuarios
ADD (CONSTRAINT UK_USUARIOS_NOMBRE UNIQUE (nombre),
     CONSTRAINT UK_USUARIOS_CORREO UNIQUE (correo));

ALTER TABLE Vendedores
ADD CONSTRAINT UK_VENDEDORES_NIT UNIQUE (nit);

ALTER TABLE Productos
ADD (CONSTRAINT UK_PRODUCTOS_NOMBRE UNIQUE (nombre),
     CONSTRAINT UK_PRODUCTOS_IMAGEN UNIQUE (imagen));

COMMIT;



-- CICLO 1: Foráneas

ALTER TABLE Vendedores
ADD CONSTRAINT FK_VENDEDORES_USUARIOS FOREIGN KEY (id) REFERENCES Usuarios (id) ON DELETE CASCADE;

ALTER TABLE Ofrecimientos
ADD (CONSTRAINT FK_OFRECIMIENTOS_VENDEDORES FOREIGN KEY (vendedor) REFERENCES Vendedores (id) ON DELETE CASCADE,
     CONSTRAINT FK_OFRECIMIENTOS_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id) ON DELETE CASCADE);

ALTER TABLE Claves
ADD CONSTRAINT FK_CLAVES_PRODUCTOS FOREIGN KEY (id) REFERENCES Productos (id) ON DELETE CASCADE;

ALTER TABLE Juegos
ADD CONSTRAINT FK_JUEGOS_PRODUCTOS FOREIGN KEY (id) REFERENCES Productos (id) ON DELETE CASCADE;

ALTER TABLE GenerosXProductos
ADD (CONSTRAINT FK_GENEROSXPRODUCTOS_GENEROS FOREIGN KEY (genero) REFERENCES Generos (genero),
     CONSTRAINT FK_GENEROSXPRODUCTOS_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id) ON DELETE CASCADE);

ALTER TABLE PlataformasXProductos
ADD (CONSTRAINT FK_PLATAFORMASXPRODUCTOS_PLATAFORMAS FOREIGN KEY (plataforma) REFERENCES Plataformas (plataforma),
     CONSTRAINT FK_PLATAFORMASXPRODUCTOS_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id) ON DELETE CASCADE);

ALTER TABLE Compradores 
ADD CONSTRAINT FK_COMPRADORES_USUARIOS FOREIGN KEY (id) REFERENCES Usuarios (id) ON DELETE CASCADE;

ALTER TABLE CompradoresXProductos
ADD (CONSTRAINT FK_COMPRADORESXPRODUCTOS_COMPRADORES FOREIGN KEY (comprador) REFERENCES Compradores (id) ON DELETE CASCADE,
     CONSTRAINT FK_COMPRADORESXPRODUCTOS_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id) ON DELETE CASCADE);

ALTER TABLE WishLists
ADD CONSTRAINT FK_WISHLISTS_COMPRADORES FOREIGN KEY (id) REFERENCES Compradores (id) ON DELETE CASCADE;

ALTER TABLE Calificaciones
ADD (CONSTRAINT FK_CALIFICACIONES_COMPRADORES FOREIGN KEY (comprador) REFERENCES Compradores (id) ON DELETE SET NULL,
     CONSTRAINT FK_CALIFICACIONES_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id) ON DELETE CASCADE);

ALTER TABLE Intercambios
ADD (CONSTRAINT FK_INTERCAMBIOS_COMPRADORES1 FOREIGN KEY (comprador1) REFERENCES Compradores (id) ON DELETE SET NULL,
     CONSTRAINT FK_INTERCAMBIOS_COMPRADORES2 FOREIGN KEY (comprador2) REFERENCES Compradores (id) ON DELETE SET NULL,
     CONSTRAINT FK_INTERCAMBIOS_PRODUCTO1 FOREIGN KEY (producto1) REFERENCES Productos (id),
     CONSTRAINT FK_Intercambios_PRODUCTO2 FOREIGN KEY (producto2) REFERENCES Productos (id));

ALTER TABLE Pagos
ADD CONSTRAINT FK_PAGOS_INTERCAMBIOS FOREIGN KEY (intercambio) REFERENCES Intercambios (id);

ALTER TABLE WishListsXProductos
ADD (CONSTRAINT FK_WISHLISTSXPRODUCTOS_WISHLISTS FOREIGN KEY (wishlist) REFERENCES WishLists (id),
     CONSTRAINT FK_WISHLISTSXPRODUCTOS_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id) ON DELETE CASCADE);

COMMIT;



-- CICLO 1: XTablas
/*
DROP TABLE Usuarios CASCADE CONSTRAINTS;
DROP TABLE Vendedores CASCADE CONSTRAINTS;
DROP TABLE Ofrecimientos CASCADE CONSTRAINTS;
DROP TABLE Productos CASCADE CONSTRAINTS;
DROP TABLE Claves CASCADE CONSTRAINTS;
DROP TABLE Juegos CASCADE CONSTRAINTS;
DROP TABLE Generos CASCADE CONSTRAINTS;
DROP TABLE GenerosXProductos CASCADE CONSTRAINTS;
DROP TABLE Plataformas CASCADE CONSTRAINTS;
DROP TABLE PlataformasXProductos CASCADE CONSTRAINTS;
DROP TABLE Compradores CASCADE CONSTRAINTS;
DROP TABLE CompradoresXProductos CASCADE CONSTRAINTS;
DROP TABLE WishLists CASCADE CONSTRAINTS;
DROP TABLE WishListsXProductos CASCADE CONSTRAINTS;
DROP TABLE Calificaciones CASCADE CONSTRAINTS;
DROP TABLE Intercambios CASCADE CONSTRAINTS;
DROP TABLE Pagos CASCADE CONSTRAINTS;
COMMIT;
*/


-- CICLO 1: XBaseDatos
/*
-- Eliminar Tablas + Índices
BEGIN
    FOR rec IN (SELECT table_name FROM user_tables) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || rec.table_name || ' CASCADE CONSTRAINTS';
    END LOOP;
END;
/

-- Eliminar Vistas
BEGIN
    FOR rec IN (SELECT view_name FROM user_views) LOOP
        EXECUTE IMMEDIATE 'DROP VIEW ' || rec.view_name;
    END LOOP;
END;
/

-- Eliminar Paquetes
BEGIN
    FOR rec IN (SELECT object_name FROM user_objects WHERE object_type = 'PACKAGE') LOOP
        EXECUTE IMMEDIATE 'DROP PACKAGE ' || rec.object_name;
    END LOOP;
END;
/

-- Eliminar Procedimientos
BEGIN
    FOR rec IN (SELECT object_name FROM user_objects WHERE object_type = 'PROCEDURE') LOOP
        EXECUTE IMMEDIATE 'DROP PROCEDURE ' || rec.object_name;
    END LOOP;
END;
/

-- Eliminar Funciones
BEGIN
    FOR rec IN (SELECT object_name FROM user_objects WHERE object_type = 'FUNCTION') LOOP
        EXECUTE IMMEDIATE 'DROP FUNCTION ' || rec.object_name;
    END LOOP;
END;
/

-- Eliminar Secuencias
BEGIN
    FOR rec IN (SELECT sequence_name FROM user_sequences) LOOP
        EXECUTE IMMEDIATE 'DROP SEQUENCE ' || rec.sequence_name;
    END LOOP;
END;
/
COMMIT;
*/


-- CICLO 1: Consultas
/*
-- 1. Obtener todos los productos ofertados con un precio mayor a $50.000:

SELECT *
FROM Ofrecimientos
WHERE precio > 50000;

-- 2. Obtener la cantidad total de productos ofrecidos por cada vendedor:

SELECT vendedor, COUNT(producto) AS cantidad_total_productos
FROM Ofrecimientos
GROUP BY vendedor;

-- 3. Obtener el nombre y la cantidad de usuarios que han realizado intercambios aprobados y pendientes:

SELECT 
    U.nombre,
    COUNT(DISTINCT I.id) AS cantidad_intercambios
FROM 
    Usuarios U
JOIN 
    Intercambios I ON U.id = I.comprador1 OR U.id = I.comprador2
WHERE 
    I.estado IN ('Aprobado', 'Pendiente', 'Pendiente 1', 'Pendiente 2')
GROUP BY 
    U.nombre;

-- 4. Obtener el nombre de los productos que han recibido calificaciones con más de 3 estrellas en el último mes:

SELECT 
    P.nombre AS nombre_producto
FROM 
    Productos P
JOIN 
    Calificaciones C ON P.id = C.producto
WHERE 
    C.estrellas > 3
    AND C.fecha >= ADD_MONTHS(SYSDATE, -1)
GROUP BY
    P.nombre;

-- 5. Obtener los nombres de los usuarios que han realizado transacciones de intercambio
--    y el total de transacciones que han realizado:

SELECT 
    U.nombre AS nombre_usuario,
    COUNT(I.id) AS total_transacciones
FROM 
    Usuarios U
JOIN 
    Intercambios I ON U.id = I.comprador1 OR U.id = I.comprador2
GROUP BY 
    U.nombre
ORDER BY 
    total_transacciones DESC;
*/


-- CICLO 1: XPoblar
/*
DELETE FROM GenerosXProductos;
DELETE FROM PlataformasXProductos;
DELETE FROM CompradoresXProductos;
DELETE FROM WishListsXProductos;
DELETE FROM Calificaciones;
DELETE FROM Intercambios;
DELETE FROM Pagos;
DELETE FROM Claves;
DELETE FROM Juegos;
DELETE FROM Ofrecimientos;
DELETE FROM Generos;
DELETE FROM Plataformas;
DELETE FROM WishLists;
DELETE FROM Compradores;
DELETE FROM Vendedores;
DELETE FROM Productos;
DELETE FROM Usuarios;
COMMIT;
*/
---------- CODE END ----------