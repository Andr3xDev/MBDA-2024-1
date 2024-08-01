---------- CODE START ----------

-- CICLO 1: Tablas

CREATE TABLE Usuarios (
    id VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(30) NOT NULL,
    correo VARCHAR2(50) NOT NULL,
    celular NUMBER(10) NOT NULL,
    direccion VARCHAR2(30) NOT NULL,
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
    precio NUMBER NOT NULL,
    disponibilidad VARCHAR2(1) NOT NULL,
    wishlist VARCHAR2(10) NOT NULL
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
    experiencia VARCHAR2(15) NOT NULL,
    wishlist VARCHAR2(10) NOT NULL
);

CREATE TABLE CompradoresXProductos (
    comprador VARCHAR2(10) NOT NULL,
    producto VARCHAR2(15) NOT NULL
);

CREATE TABLE WishLists (
    id VARCHAR2(10) NOT NULL,
    prioridad NUMBER(1) NOT NULL,
    cantidad NUMBER NOT NULL,
    estado VARCHAR2(1) NOT NULL
);

CREATE TABLE Calificaciones (
    comprador VARCHAR2(10) NOT NULL,
    producto VARCHAR2(15) NOT NULL,
    estrellas NUMBER(1) NOT NULL,
    fecha DATE NOT NULL,
    comentario VARCHAR2(50)
);

CREATE TABLE Intercambios (
    id VARCHAR2(10) NOT NULL,
    estado VARCHAR2(12) NOT NULL,
    total NUMBER NOT NULL,
    fecha DATE NOT NULL,
    comprador VARCHAR2(10) NOT NULL,
    vendedor VARCHAR2(10) NOT NULL,
    producto1 VARCHAR2(15) NOT NULL,
    producto2 VARCHAR2(15) NOT NULL
);

CREATE TABLE Pagos (
    id VARCHAR2(50) NOT NULL,
    metodo VARCHAR2(15) NOT NULL,
    total NUMBER NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR2(12) NOT NULL,
    intercambio VARCHAR2(10) NOT NULL
);



-- CICLO 1: Atributos

-- Booleano

ALTER TABLE Productos ADD CONSTRAINT CK_PRODUCTOS_DISPONIBILIDAD
CHECK (disponibilidad IN ('T', 'F'));

-- Moneda

ALTER TABLE Productos ADD CONSTRAINT CK_PRODUCTOS_PRECIO
CHECK (precio > 0 AND MOD(precio, 100) = 0);
ALTER TABLE Ofrecimientos ADD CONSTRAINT CK_OFRECIMIENTOS_PRECIO
CHECK (precio > 0 AND MOD(precio, 100) = 0);
ALTER TABLE Intercambios ADD CONSTRAINT CK_INTERCAMBIOS_TOTAL
CHECK (total > 0 AND MOD(total, 100) = 0);
ALTER TABLE Pagos ADD CONSTRAINT CK_PAGOS_TOTAL
CHECK (total > 0 AND MOD(total, 100) = 0);

-- TCelular

ALTER TABLE Usuarios ADD CONSTRAINT CK_USUARIOS_CELULAR
CHECK (SUBSTR(celular, 1, 3) IN ('300', '317', '310', '310', '311', '312', '313', '314', '320', '321', '322', '323', '315', '316', '317', '318', '319', '305', '302', '323', '324', '324', '319'));

-- TClave

ALTER TABLE Claves ADD CONSTRAINT CK_CLAVES_TIPO
CHECK (tipo IN ('Activacion', 'Acceso', 'Autenticacion', 'API', 'Licencia', 'Descuento'));

-- TCondicion

ALTER TABLE Productos ADD CONSTRAINT CK_PRODUCTOS_CONDICION
CHECK (condicion IN ('N', 'B', 'P', 'U'));

-- Tcorreo
ALTER TABLE Usuarios ADD CONSTRAINT CK_USUARIOS_CORREO
CHECK (correo LIKE '%@%.%');

-- TDireccion

ALTER TABLE Usuarios ADD CONSTRAINT CK_USUARIOS_DIRECCION
CHECK (LENGTH(direccion) >= 10);

-- TEstado

ALTER TABLE Intercambios ADD CONSTRAINT CK_INTERCAMBIOS_ESTADO
CHECK (estado IN ('Aprobado', 'Pendiente', 'Rechazado', 'Reembolsado'));
ALTER TABLE Pagos ADD CONSTRAINT CK_PAGOS_ESTADO
CHECK (estado IN ('Aprobado', 'Pendiente', 'Rechazado', 'Reembolsado'));

-- TEstadoU

ALTER TABLE Usuarios ADD CONSTRAINT CK_USUARIOS_ESTADO
CHECK (estado IN ('A', 'I', 'B', 'S', 'E', 'P'));

-- TEstadoW

ALTER TABLE WishLists ADD CONSTRAINT CK_WISHLISTS_ESTADO
CHECK (estado IN ('D', 'N'));

-- TEstrellas

ALTER TABLE Calificaciones ADD CONSTRAINT CK_CALIFICACIONES_ESTRELLAS
CHECK (estrellas BETWEEN 0 AND 5);

-- TExperiencia

ALTER TABLE Compradores ADD CONSTRAINT CK_COMPRADORES_EXPERIENCIA
CHECK (experiencia IN ('Entusiasta', 'Novato', 'Gamer', 'Coleccionista'));

-- TGenero

ALTER TABLE Generos ADD CONSTRAINT CK_GENEROS_GENERO
CHECK (genero IN ('Accion', 'Aprendizaje', 'Aventura', 'Battle Royale', 'Carreras', 'Crafteo', 'Deportes',
                  'Desarrollo Software', 'Diseño', 'Disparos', 'Edicion', 'Educacion', 'Entretenimiento',
                  'Estrategia', 'Horror', 'Juego', 'Lucha', 'Mundo Abierto', 'Multimedia', 'Musical',
                  'Navegador Web', 'Oficina', 'Productividad', 'Puzzle', 'Rol', 'Seguridad', 'Sigilo',
                  'Simulacion', 'Sistema Operativo', 'Survival'));

-- TImagen

ALTER TABLE Productos ADD CONSTRAINT CK_PRODUCTOS_IMAGEN
CHECK (imagen LIKE 'https://%.%.jpg');

-- TMetodo

ALTER TABLE Pagos ADD CONSTRAINT CK_PAGOS_METODO
CHECK (metodo IN ('Efectivo', 'Tarjeta', 'Transaccion', 'Criptomonedas'));

-- TNit

ALTER TABLE Vendedores ADD CONSTRAINT CK_VENDEDORES_NIT
CHECK (REGEXP_LIKE(nit, '%-[1-9]$'));

-- TPlataforma

ALTER TABLE Plataformas ADD CONSTRAINT CK_PLATAFORMAS_PLATAFORMA
CHECK (plataforma IN ('PC', 'WII', 'XBOX', 'STEAM', 'NINTENDO', 'PLAY STATION'));

-- TPrioridad
ALTER TABLE WishLists ADD CONSTRAINT CK_WISHLISTS_PRIORIDAD
CHECK (prioridad IN ('A', 'M', 'B', 'S', 'C'));

-- TVendedor
ALTER TABLE Vendedores ADD CONSTRAINT CK_VENDEDORES_TIPO
CHECK (tipo IN ('Tienda', 'Persona', 'Plataforma'));



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
ADD CONSTRAINT PKS_GENEROSXPRODUCTOS PRIMARY KEY (genero, producto);

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

ALTER TABLE Calificaciones
ADD CONSTRAINT PK_CALIFICACIONES PRIMARY KEY (comprador, producto);

ALTER TABLE Intercambios
ADD CONSTRAINT PK_INTERCAMBIOS PRIMARY KEY (id);

ALTER TABLE Pagos
ADD CONSTRAINT PK_PAGOS PRIMARY KEY (id);



-- CICLO 1: Unicas

ALTER TABLE Usuarios
ADD CONSTRAINT UK_USUARIOS UNIQUE (nombre, correo);

ALTER TABLE Vendedores
ADD CONSTRAINT UK_VENDEDORES UNIQUE (nit);

ALTER TABLE Productos
ADD CONSTRAINT UK_PRODUCTOS UNIQUE (nombre, imagen);

ALTER TABLE Compradores
ADD CONSTRAINT UK_COMPRADORES UNIQUE (wishlist);

ALTER TABLE Intercambios
ADD CONSTRAINT UK_INTERCAMBIOS UNIQUE (producto1, producto2);



-- CICLO 1: Foraneas

ALTER TABLE Vendedores
ADD CONSTRAINT FK_VENDEDORES_USUARIOS FOREIGN KEY (id) REFERENCES Usuarios (id);

ALTER TABLE Ofrecimientos
ADD (CONSTRAINT FK_OFRECIMIENTOS_VENDEDORES FOREIGN KEY (vendedor) REFERENCES Vendedores (id),
     CONSTRAINT FK_OFRECIMIENTOS_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id));

ALTER TABLE Productos
ADD CONSTRAINT FK_PRODUCTOS_WISHLISTS FOREIGN KEY (wishlist) REFERENCES Wishlists (id);

ALTER TABLE Claves
ADD CONSTRAINT FK_CLAVES_PRODUCTOS FOREIGN KEY (id) REFERENCES Productos (id);

ALTER TABLE Juegos
ADD CONSTRAINT FK_JUEGOS_PRODUCTOS FOREIGN KEY (id) REFERENCES Productos (id);

ALTER TABLE GenerosXProductos
ADD (CONSTRAINT FK_GENEROSXPRODUCTOSs_GENEROS FOREIGN KEY (genero) REFERENCES Generos (genero),
     CONSTRAINT FK_GENEROSXPRODUCTOS_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id));

ALTER TABLE PlataformasXProductos
ADD (CONSTRAINT FK_PLATAFORMASXPRODUCTOS_PLATAFORMAS FOREIGN KEY (plataforma) REFERENCES Plataformas (plataforma),
     CONSTRAINT FK_PLATAFORMASXPRODUCTOS_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id));

ALTER TABLE Compradores
ADD (CONSTRAINT FK_COMPRADORES_USUARIOS FOREIGN KEY (id) REFERENCES Usuarios (id),
     CONSTRAINT FK_COMPRADORES_WISHLISTS FOREIGN KEY (wishlist) REFERENCES WishLists (id));

ALTER TABLE CompradoresXProductos
ADD (CONSTRAINT FK_COMPRADORESXPRODUCTOS_COMPRADORES FOREIGN KEY (comprador) REFERENCES Compradores (id),
     CONSTRAINT FK_COMPRADORESXPRODUCTOS_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id));

ALTER TABLE Calificaciones
ADD (CONSTRAINT FK_CALIFICACIONES_COMPRADORES FOREIGN KEY (comprador) REFERENCES Compradores (id),
     CONSTRAINT FK_CALIFICACIONES_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id));

ALTER TABLE Intercambios
ADD (CONSTRAINT FK_INTERCAMBIOS_COMPRADORES FOREIGN KEY (comprador) REFERENCES Compradores (id),
     CONSTRAINT FK_INTERCAMBIOS_VENDEDORES FOREIGN KEY (vendedor) REFERENCES Vendedores (id),
     CONSTRAINT FK_INTERCAMBIOS_PRODUCTO1 FOREIGN KEY (producto1) REFERENCES Productos (id),
     CONSTRAINT FK_Intercambios_PRODUCTO2 FOREIGN KEY (producto2) REFERENCES Productos (id));

ALTER TABLE Pagos
ADD CONSTRAINT FK_PAGOS_INTERCAMBIOS FOREIGN KEY (intercambio) REFERENCES Intercambios (id);



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
DROP TABLE Calificaciones CASCADE CONSTRAINTS;
DROP TABLE Intercambios CASCADE CONSTRAINTS;
DROP TABLE Pagos CASCADE CONSTRAINTS;

DECLARE
  v_sql VARCHAR2(1000);
BEGIN
  FOR c IN (SELECT Table_Name FROM user_tables) LOOP
    v_sql := 'DROP TABLE ' || c.Table_Name || ' CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
*/


-- CICLO 1: Consultas

-- 1. Obtener todos los productos con un precio mayor a $50.000:

SELECT *
FROM Productos
WHERE precio > 50000;

-- 2. Obtener la cantidad total de productos ofrecidos por cada vendedor:

SELECT v.id, COUNT(o.producto) AS Cantidad_Productos_Ofrecidos
FROM Vendedores v
LEFT JOIN Ofrecimientos o ON v.id = o.vendedor
GROUP BY v.id;

-- 3. Obtener el nombre y la cantidad de usuarios que han realizado intercambios aprobados y pendientes:

SELECT u.nombre, i.estado, COUNT(i.comprador) AS Cantidad_Intercambios
FROM Usuarios u
JOIN Intercambios i ON u.id = i.comprador
WHERE i.estado IN ('Aprobado', 'Pendiente')
GROUP BY u.nombre, i.estado;

-- 4. Obtener el nombre de los productos que han recibido calificaciones con mas de 3 estrellas en el ultimo mes:

SELECT p.nombre
FROM Productos p
JOIN Calificaciones c ON p.id = c.producto
WHERE c.estrellas > 3 AND c.fecha >= TRUNC(SYSDATE, 'MM') - INTERVAL '1' MONTH;

-- 5. Obtener los nombres de los usuarios que han realizado transacciones de intercambio (tanto como comprador o vendedor)
--    y el total de transacciones que han realizado:

SELECT nombre, COUNT(*) AS Total_Transacciones
FROM (
    SELECT u.nombre
    FROM Usuarios u
    JOIN Intercambios i ON u.id = i.comprador
    UNION ALL
    SELECT u.nombre
    FROM Usuarios u
    JOIN Intercambios i ON u.id = i.vendedor)
GROUP BY nombre;


-- CICLO 1: XPoblar
/*
DELETE FROM Calificaciones;
DELETE FROM Claves;
DELETE FROM Compradores;
DELETE FROM CompradoresXProductos;
DELETE FROM Generos;
DELETE FROM GenerosXProductoss;
DELETE FROM Intercambios;
DELETE FROM Juegos;
DELETE FROM Ofrecimientos;
DELETE FROM Pagos;
DELETE FROM Plataformas;
DELETE FROM PlataformasXProductos;
DELETE FROM Productos;
DELETE FROM Usuarios;
DELETE FROM Vendedores;
DELETE FROM WishLists;
*/
---------- CODE END ----------