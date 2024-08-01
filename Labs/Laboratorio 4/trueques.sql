---------- CODE START ----------

-- CICLO 1: Tablas

CREATE TABLE universidades (
    codigo VARCHAR2(3) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    direccion VARCHAR2(50) NOT NULL,
    usuario VARCHAR2(10) NOT NULL
);

CREATE TABLE usuarios (
    codigo VARCHAR2(10) NOT NULL,
    tid VARCHAR2(2) NOT NULL,
    nid VARCHAR2(10) NOT NULL ,
    nombre VARCHAR2(50) NOT NULL,
    programa VARCHAR2(20) NOT NULL,
    correo VARCHAR2(50) NOT NULL,
    registro DATE NOT NULL,
    suspencion DATE,
    nSuspenciones NUMBER(3) NOT NULL,
    universidad VARCHAR2(3) NOT NULL
);

CREATE TABLE calificaciones (
    usuario VARCHAR2(10) NOT NULL,
    articulo NUMBER(16) NOT NULL,
    estrella NUMBER(1) NOT NULL
);

CREATE TABLE categorias (
    codigo VARCHAR2(5) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    tipo VARCHAR2(1) NOT NULL,
    minimo NUMBER(3) NOT NULL,
    maximo NUMBER(3) NOT NULL,
    codigo1 VARCHAR2(5) NOT NULL
);

CREATE TABLE articulos (
    id NUMBER(16) NOT NULL, 
    descripcion VARCHAR2(20) NOT NULL,
    estado VARCHAR2(1) NOT NULL,
    foto VARCHAR2(100) NOT NULL,
    precio NUMBER(3) NOT NULL,
    disponible VARCHAR2(5) NOT NULL,
    categoria VARCHAR2(5) NOT NULL,
    usuario VARCHAR2(10) NOT NULL
);

CREATE TABLE caracteristicas (
    articulo NUMBER(16) NOT NULL,
    caracteristica VARCHAR2(20) NOT NULL
);

CREATE TABLE ropas (
    articulo NUMBER(16) NOT NULL,
    talla VARCHAR2(2) NOT NULL,
    material VARCHAR2(10) NOT NULL,
    color VARCHAR2(10) NOT NULL
);

CREATE TABLE perecederos (
    articulo NUMBER(16) NOT NULL,
    vencimiento DATE NOT NULL
);

CREATE TABLE auditorias (
    id NUMBER(9) NOT NULL,
    fecha TIMESTAMP NOT NULL,
    accion VARCHAR2(1) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    evaluacion VARCHAR2(6) NOT NULL,
    categoria VARCHAR2(5) NOT NULL
);

CREATE TABLE evaluaciones (
    a_omes VARCHAR2(6) NOT NULL,
    tid VARCHAR2(2) NOT NULL,
    nid VARCHAR2(10) NOT NULL,
    fecha DATE NOT NULL,
    descripcion VARCHAR2(100),
    reporte VARCHAR2(100) NOT NULL,
    resultado VARCHAR2(2) NOT NULL 
);

CREATE TABLE respuestas (
    a_omes VARCHAR2(6) NOT NULL,
    respuesta VARCHAR2(50) NOT NULL
);


-- CICLO1: XTablas
/*
DROP TABLE universidades CASCADE CONSTRAINTS;
DROP TABLE usuarios CASCADE CONSTRAINTS;
DROP TABLE calificaciones CASCADE CONSTRAINTS;
DROP TABLE categorias CASCADE CONSTRAINTS;
DROP TABLE articulos CASCADE CONSTRAINTS;
DROP TABLE caracteristicas CASCADE CONSTRAINTS;
DROP TABLE ropas CASCADE CONSTRAINTS;
DROP TABLE perecederos CASCADE CONSTRAINTS;
DROP TABLE auditorias CASCADE CONSTRAINTS;
DROP TABLE evaluaciones CASCADE CONSTRAINTS;
DROP TABLE respuestas CASCADE CONSTRAINTS;
*/

-- CICLO 1: PoblarOK 1 (Inicial)

-- Insersion de datos en la tabla universidades
INSERT INTO universidades (codigo, nombre, direccion, usuario)
VALUES ('U01', 'Universidad A', 'Calle Principal 123', 'USR001');
INSERT INTO universidades (codigo, nombre, direccion, usuario)
VALUES ('U02', 'Universidad B', 'Avenida Central 456', 'USR002');
INSERT INTO universidades (codigo, nombre, direccion, usuario)
VALUES ('U03', 'Universidad C', 'Calle Secundaria 789', 'USR003');
INSERT INTO universidades (codigo, nombre, direccion, usuario)
VALUES ('U04', 'Universidad D', 'Avenida Norte 012', 'USR004');
INSERT INTO universidades (codigo, nombre, direccion, usuario)
VALUES ('U05', 'Universidad E', 'Calle Sur 345', 'USR005');

-- Insersion de datos en la tabla usuarios
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad)
VALUES ('USR001', 'T1', 'N01', 'Usuario 1', 'Programa 1', 'usuario1@example.com', TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 005, 'U01');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad)
VALUES ('USR002', 'T2', 'N02', 'Usuario 2', 'Programa 2', 'usuario2@example.com', TO_DATE('2024-03-14', 'YYYY-MM-DD'), NULL, 012, 'U02');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad)
VALUES ('USR003', 'T3', 'N03', 'Usuario 3', 'Programa 3', 'usuario3@example.com', TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-08-25', 'YYYY-MM-DD'), 128, 'U03');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad)
VALUES ('USR004', 'T4', 'N04', 'Usuario 4', 'Programa 4', 'usuario4@example.com', TO_DATE('2024-03-16', 'YYYY-MM-DD'), NULL, 435, 'U04');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad)
VALUES ('USR005', 'T5', 'N05', 'Usuario 5', 'Programa 5', 'usuario5@example.com', TO_DATE('2024-03-17', 'YYYY-MM-DD'), TO_DATE('2024-12-10', 'YYYY-MM-DD'), 632, 'U05');

-- Insersion de datos en la tabla calificaciones
INSERT INTO calificaciones (usuario, articulo, estrella)
VALUES ('CAL001', 5261397714268532, 4);
INSERT INTO calificaciones (usuario, articulo, estrella)
VALUES ('CAL002', 9337462158946721, 5);
INSERT INTO calificaciones (usuario, articulo, estrella)
VALUES ('CAL003', 8175632094837265, 3);
INSERT INTO calificaciones (usuario, articulo, estrella)
VALUES ('CAL004', 6409183725482910, 2);
INSERT INTO calificaciones (usuario, articulo, estrella)
VALUES ('CAL005', 3759210485627319, 1);

-- Insersion de datos en la tabla categorias
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)
VALUES ('CAT01', 'Categoria A', 'A', 50, 100, 'CAT01');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)
VALUES ('CAT02', 'Categoria B', 'R', 150, 250, 'CAT02');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)
VALUES ('CAT03', 'Categoria C', 'L', 100, 250, 'CAT03');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)
VALUES ('CAT04', 'Categoria D', 'T', 100, 150, 'CAT04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)
VALUES ('CAT05', 'Categoria E', 'O', 250, 250, 'CAT05');

-- Insersion de datos en la tabla articulos
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario)
VALUES (5261397714268532, 'Desc. Articulo 1', 'U', 'https://ejemplo.com/archivo1.pdf', 50, 'TRUE', 'CAT01', 'USR001');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario)
VALUES (9337462158946721, 'Desc. Articulo 2', 'N', 'https://otroejemplo.com/imagen2.pdf', 60, 'TRUE', 'CAT02', 'USR002');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario)
VALUES (8175632094837265, 'Desc. Articulo 3', 'N', 'https://mifoto.com/imagen3.pdf', 70, 'FALSE', 'CAT03', 'USR003');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario)
VALUES (6409183725482910, 'Desc. Articulo 4', 'U', 'https://dominio.com/foto4.pdf', 80, 'TRUE', 'CAT04', 'USR004');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario)
VALUES (3759210485627319, 'Desc. Articulo 5', 'U', 'https://ejemplo.net/otrafoto5.pdf', 90, 'FALSE', 'CAT05', 'USR005');

-- Insersion de datos en la tabla caracteristicas
INSERT INTO caracteristicas (articulo, caracteristica)
VALUES (5261397714268532, 'Caract. Articulo 1');
INSERT INTO caracteristicas (articulo, caracteristica)
VALUES (9337462158946721, 'Caract. Articulo 2');
INSERT INTO caracteristicas (articulo, caracteristica)
VALUES (8175632094837265, 'Caract. Articulo 3');
INSERT INTO caracteristicas (articulo, caracteristica)
VALUES (6409183725482910, 'Caract. Articulo 4');
INSERT INTO caracteristicas (articulo, caracteristica)
VALUES (3759210485627319, 'Caract. Articulo 5');

-- Insersion de datos en la tabla ropas
INSERT INTO ropas (articulo, talla, material, color)
VALUES (5261397714268532, 'M', 'Algodon', 'Azul');
INSERT INTO ropas (articulo, talla, material, color)
VALUES (9337462158946721, 'L', 'Seda', 'Rojo');
INSERT INTO ropas (articulo, talla, material, color)
VALUES (8175632094837265, 'XL', 'Poliester', 'Verde');
INSERT INTO ropas (articulo, talla, material, color)
VALUES (6409183725482910, 'S', 'Algodon', 'Amarillo');
INSERT INTO ropas (articulo, talla, material, color)
VALUES (3759210485627319, 'XS', 'Lana', 'Negro');

-- Insersion de datos en la tabla perecederos
INSERT INTO perecederos (articulo, vencimiento)
VALUES (5261397714268532, TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento)
VALUES (9337462158946721, TO_DATE('2024-11-30', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento)
VALUES (8175632094837265, TO_DATE('2024-10-31', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento)
VALUES (6409183725482910, TO_DATE('2024-09-30', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento)
VALUES (3759210485627319, TO_DATE('2024-08-31', 'YYYY-MM-DD'));

-- Insersion de datos en la tabla auditorias
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria)
VALUES (1, TO_DATE('2024-03-13', 'YYYY-MM-DD'), 'I', 'Auditoria 1', '202405', 'CAT01');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria)
VALUES (2, TO_DATE('2024-03-14', 'YYYY-MM-DD'), 'D', 'Auditoria 2', '202301', 'CAT02');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria)
VALUES (3, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'U', 'Auditoria 3', '201512', 'CAT03');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria)
VALUES (4, TO_DATE('2024-03-16', 'YYYY-MM-DD'), 'U', 'Auditoria 4', '201807', 'CAT04');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria)
VALUES (5, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'I', 'Auditoria 5', '202105', 'CAT05');

-- Insersion de datos en la tabla evaluaciones
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado)
VALUES ('202405', 'CC', 'N01', TO_DATE('2024-03-13', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 1 - A', 'https://ejemplo.com/reporte1.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado)
VALUES ('202301', 'TI', 'N02', TO_DATE('2024-03-14', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 2 - M', 'https://otroejemplo.com/reporte2.pdf', 'PE');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado)
VALUES ('201512', 'CC', 'N03', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 3 - B', 'https://mifoto.com/reporte3.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado)
VALUES ('201807', 'TI', 'N04', TO_DATE('2024-03-16', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 4 - M', 'https://dominio.com/reporte4.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado)
VALUES ('202105', 'CC', 'N05', TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 5 - A', 'https://ejemplo.net/reporte5.pdf', 'PE');

-- Insersion de datos en la tabla respuestas
INSERT INTO respuestas (a_omes, respuesta)
VALUES ('202405', 'Respuesta a la pregunta 1');
INSERT INTO respuestas (a_omes, respuesta)
VALUES ('202301', 'Respuesta a la pregunta 2');
INSERT INTO respuestas (a_omes, respuesta)
VALUES ('201512', 'Respuesta a la pregunta 3');
INSERT INTO respuestas (a_omes, respuesta)
VALUES ('202107', 'Respuesta a la pregunta 4');
INSERT INTO respuestas (a_omes, respuesta)
VALUES ('202105', 'Respuesta a la pregunta 5');


-- CICLO 1: PoblarNoOK 1 (Inserciones Rechazadas)

-- Tabla universidades
-- Caso 1: Intentar insertar el codigo de una universidad con una longitud mayor a 3.
-- Se desea validar que no se permita la Insersion del codigo de una universidad con una longitud mayor a 3.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U100', 'Universidad F', 'Calle Principal 456', 'USR012');
-- Caso 2: Intentar insertar una universidad con un nombre nulo.
-- Se desea validar que no se permita la Insersion de una universidad con un nombre nulo.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', NULL, 'Avenida Oeste 789', 'USR014');
-- Caso 3: Intentar insertar una universidad con una direccion que excede el limite de caracteres permitidos.
-- Se desea validar que no se permita la Insersion de una universidad con una direccion que excede el limite de caracteres permitidos.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 'Universidad G', 'Carrera 123 #23-34, Avenida las Americas, Bogota D.C., Colombia', 'USR016');

-- Tabla usuarios
-- Caso 1: Intentar insertar un usuario con un codigo nulo.
-- Se desea validar que no se permita la Insersion de un usuario nulo.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES (NULL, 'T6', 'N06', 'Usuario 6', 'Programa 6', 'usuario6@example.com', TO_DATE('2024-03-18', 'YYYY-MM-DD'), 0, 'U015');
-- Caso 2: Intentar insertar la fecha de registro de un usuario como una cadena de texto.
-- Se desea validar que no se permita la Insersion de una fecha de registro de un usuario como una cadena de texto que es de otro tipo ed dato.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR006', 'T6', 'N06', 'Usuario 6', 'Programa 6', 'usuario6@example.com', 20240318, 0, 'U034');
-- Caso 3: Intentar insertar un usuario con un valor nulo en el campo `registro`.
-- Se desea validar que no se permita la Insersion de un usuario con un valor nulo en el campo `registro`.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR006', 'T6', 'N06', 'Usuario 6', 'Programa 6', 'usuario6@example.com', NULL, 0, 'U055');

-- Tabla calificaciones
-- Caso 1: Intentar insertar una calificacion con un codigo de usuario numerico.
-- Se desea validar que no se permita la Insersion de una calificacion con un codigo de usuario de tipo numerico, ya que solo se permiten cadenas de caracteres.
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES (152602302745, 1234567890123456, 4);
-- Caso 2: Intentar insertar una calificacion con un numero de estrellas invalido (por encima del maximo permitido).
-- Se desea validar que no se permita la Insersion de una calificacion con un numero de estrellas invalido (por encima del maximo permitido).
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL006', 1234567890123456, 10);
-- Caso 3: Intentar insertar una calificacion con un valor nulo en el campo `articulo`.
-- Se desea validar que no se permita la Insersion de una calificacion con un valor nulo en el campo `articulo`.
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL006', NULL, 3);

-- Tabla categorias
-- Caso 1: Intentar insertar una categoria con un codigo que excede la longitud permitida (5).
-- Se desea validar que no se permita la Insersion de una categoria con un codigo que excede la longitud permitida (5).
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT0123', 'Categoria F', 'X', 5, 15, 'CAT0123');
-- Caso 2: Intentar insertar una categoria con un valor minimo mayor que el maximo.
-- Se desea validar que no se permita la Insersion de una categoria con un valor minimo mayor que el maximo.
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT06', 'Categoria G', 'Y', 2012, 10, 'CAT06');
-- Caso 3: Intentar insertar una categoria con un tipo no valido.
-- Se desea validar que no se permita la Insersion de una categoria con un tipo no valido.
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT06', 'Categoria H', TRUE, 15, 25, 'CAT06');

-- Tabla articulos
-- Caso 1: Intentar insertar un articulo con un ID como cadena de caracteres.
-- Se desea validar que no se permita la Insersion de un articulo con un tipo de dato diferente a numero.
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES ('ABCDE12345', 'Desc. Articulo 7', 'U', 'https://ejemplo.com/archivo7.pdf', 70, 'TRUE', 'CAT03', 'USR003');
-- Caso 2: Intentar insertar un articulo con una descripcion nula.
-- Se desea validar que no se permita la Insersion de un articulo con una descripcion nula.
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123456, NULL, 'N', 'https://dominio.com/foto7.pdf', 70, 'FALSE', 'CAT21', 'USR012');
-- Caso 3: Intentar insertar un articulo con un precio con mas digitos de los permitidos.
-- Se desea validar que no se permita la Insersion de un articulo con un precio que tenga mas de 3 digitos.
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (7890123456789012, 'Desc. Articulo 8', 'U', 'https://ejemplo.net/foto8.pdf', 80000, 'TRUE', 'CAT05', 'USR008');

-- Tabla caracteristicas
-- Caso 1: Intentar insertar un codigo de articulo como una cadena de caracteres.
-- Se desea validar que no se permita la Insersion de un codigo de articulo de otro tipo de dato distinto.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES ('CA57984', 'Caracteristica del Articulo 6');
-- Caso 2: Intentar insertar una Caracteristica con una cadena de caracteres demasiado larga.
-- Se desea validar que no se permita la Insersion de una Caracteristica con una cadena de caracteres demasiado larga.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (5261397714268532, 'Esta es una Caracteristica muy larga que excede el limite permitido');
-- Caso 3: Intentar insertar una Caracteristica con una cadena de caracteres nula.
-- Se desea validar que no se permita la Insersion de una Caracteristica con una cadena de caracteres nula.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (9337462158946721, NULL);

-- Tabla ropas
-- Caso 1: Intentar insertar un registro sin especificar la talla.
-- Se desea validar que no se permita la Insersion de un registro en la tabla ropas sin especificar la talla.
INSERT INTO ropas (articulo, material, color) VALUES (5261397714268532, 'Algodon', 'Azul');
-- Caso 2: Intentar insertar un registro con una talla demasiado larga.
-- Se desea validar que no se permita la Insersion de un registro en la tabla ropas con una talla demasiado larga.
INSERT INTO ropas (articulo, talla, material, color) VALUES (9337462158946721, 'XXL', 'Seda', 'Rojo');
-- Caso 3: Intentar insertar un registro con un color que excede el limite de caracteres.
-- Se desea validar que no se permita la Insersion de un registro en la tabla ropas con un color que excede el limite de caracteres.
INSERT INTO ropas (articulo, talla, material, color) VALUES (8175632094837265, 'XL', 'Poliester', 'Naranja Claro');

-- Tabla perecederos
-- Caso 1: Intentar insertar un registro con una fecha de vencimiento numerica.
-- Se desea validar que no se permita la Insersion de un registro en la tabla perecederos con una fecha numerica.
INSERT INTO perecederos (articulo, vencimiento) VALUES (5261397714268532, 20230115);
-- Caso 2: Intentar insertar un registro sin especificar la fecha de vencimiento.
-- Se desea validar que no se permita la Insersion de un registro en la tabla perecederos sin especificar la fecha de vencimiento.
INSERT INTO perecederos (articulo) VALUES (9337462158946721);
-- Caso 3: Intentar insertar un registro con un formato de fecha incorrecto.
-- Se desea validar que no se permita la Insersion de un registro en la tabla perecederos con un formato de fecha incorrecto.
INSERT INTO perecederos (articulo, vencimiento) VALUES (8175632094837265, '31162024');

-- Tabla auditorias
-- Caso 1: Intentar insertar un registro sin especificar la accion.
-- Se desea validar que no se permita la Insersion de un registro en la tabla auditorias sin especificar la accion.
INSERT INTO auditorias (id, fecha, nombre, evaluacion, categoria) VALUES (6, TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'Auditoria 6', '202605', 'CAT03');
-- Caso 2: Intentar insertar un registro con una fecha incorrecta.
-- Se desea validar que no se permita la Insersion de un registro en la tabla auditorias con una fecha incorrecta.
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (7, TO_DATE('01-01-2025', 'YYYY-MM-DD'), 'I', 'Auditoria 7', '202408', 'CAT08');
-- Caso 3: Intentar insertar un registro con un nombre que excede el limite de caracteres.
-- Se desea validar que no se permita la Insersion de un registro en la tabla auditorias con un nombre que excede el limite de caracteres.
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (8, TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'U', 'EsteNombreEsMuyLargoParaLaAuditoria', '203409', 'CAT21');

-- Tabla evaluaciones
-- Caso 1: Intentar insertar un registro con un codigo 'a_omes' que excede la longitud permitida.
-- Se desea validar que no se permita la Insersion de un registro con un codigo 'a_omes' que supere la longitud permitida de 6 caracteres.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('20240578532', 'CC', 'N01', TO_DATE('2024-03-13', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 1 - A', 'https://ejemplo.com/reporte1.pdf', 'AP');
-- Caso 2: Intentar insertar un registro con un resultado no valido.
-- Se desea validar que no se permita la Insersion de un registro en la tabla evaluaciones con un resultado no valido.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('202301', 'TI', 'N02', TO_DATE('2024-03-14', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 2 - M', 'https://otroejemplo.com/reporte2.pdf', 'RESULTADO');
-- Caso 3: Intentar insertar un registro con una fecha de evaluacion nula.
-- Se desea validar que no se permita la Insersion de un registro en la tabla evaluaciones con una fecha de evaluacion nula.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('201807', 'TI', 'N04', NULL, 'Descripcion de la evaluacion 4 - M', 'https://dominio.com/reporte4.pdf', 'AP');

-- Tabla respuestas
-- Caso 1: Intentar insertar un registro sin especificar la respuesta.
-- Se desea validar que no se permita la Insersion de un registro en la tabla respuestas sin especificar la respuesta.
INSERT INTO respuestas (a_omes) VALUES ('202107');
-- Caso 2: Intentar insertar un registro con una respuesta que excede el limite de caracteres.
-- Se desea validar que no se permita la Insersion de un registro en la tabla respuestas con una respuesta que excede el limite de caracteres.
INSERT INTO respuestas (a_omes, respuesta) VALUES ('202105', 'Esta es una respuesta muy larga que excede el limite de caracteres permitidos en la tabla.');
-- Caso 2: Intentar insertar un registro con un codigo "a_omes" nulo.
-- Se desea validar que no se permita la Insersion de un registro en la tabla respuestas sin especificar el codigo "a_omes".
INSERT INTO respuestas (a_omes, respuesta) VALUES (NULL, 'Respuesta sin codigo');


-- CICLO 1: PoblarNoOK 2 (Inserciones todavia Aceptadas)

-- Tabla universidades
-- Caso 1: Intentar insertar una universidad con un codigo que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de una universidad con un codigo que ya existe en la tabla.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U01', 'Universidad F', 'Calle Principal 456', 'USR012');
-- Caso 2: Intentar insertar una universidad con el campo "nombre" como un numero.
-- Se desea validar que todavia se permite la Insersion de una universidad con el campo "nombre" con otro tipo de dato distinto a VARCHAR2.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 6331245, 'Avenida Este 789', 'USR014');
-- Caso 3: Intentar insertar una universidad con una direccion como fecha.
-- Se desea validar que todavia se permite la Insersion de una universidad con una direccion que es de tipo fecha.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 'Universidad F', '2024-05-26', 'USR016');

-- Tabla usuarios
-- Caso 1: Intentar insertar un usuario con un codigo que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de un usuario con un codigo que ya existe en la tabla.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR001', 'T1', 'N01', 'Usuario 1', 'Programa 1', 'usuario1@example.com', TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 005, 'U15');
-- Caso 2: Intentar insertar un usuario con una fecha de registro futura.
-- Se desea validar que todavia se permite la Insersion de un usuario con una fecha de registro futura.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR006', 'T6', 'N06', 'Usuario 6', 'Programa 6', 'usuario6@example.com', TO_DATE('2086-12-31', 'YYYY-MM-DD'), 0, 'U35');
-- Caso 3: Intentar insertar un usuario con un numero de suspensiones negativo.
-- Se desea validar que todavia se permite la Insersion de un usuario con un numero de suspensiones negativo.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR007', 'T7', 'N07', 'Usuario 7', 'Programa 7', 'usuario7@example.com', TO_DATE('2024-03-18', 'YYYY-MM-DD'), -5, 'U17');

-- Tabla calificaciones
-- Caso 1: Intentar insertar una calificacion con un codigo que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de una calificacion con un codigo de usuario que ya existe en la tabla.
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL001', 5261268532, 4);
-- Caso 2: Intentar insertar una calificacion con un numero de estrellas fuera del rango permitido.
-- Se desea validar que todavia se permite la Insersion de una calificacion con un numero de estrellas fuera del rango permitido.
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL006', 1237123456, 8);
-- Caso 3: Intentar insertar una calificacion con un codigo de usuario negativo.
-- Se desea validar que todavia se permite la Insersion de codigo de articulo negativo.
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL007', -54214336576, 3);

-- Tabla categorias
-- Caso 1: Intentar insertar una categoria con un codigo que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de una categoria con un codigo que ya existe en la tabla.
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT01', 'Categoria F', 'R', 50, 150, 'CAT01');
-- Caso 2: Intentar insertar una categoria con un tipo que no cumple con las restricciones definidas (maximo).
-- Se desea validar que todavia se permite la Insersion de una categoria con un tipo que no cumple con las restricciones definidas (maximo).
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT06', 'Categoria G', 'A', 150, 500, 'CAT06');
-- Caso 3: Intentar insertar una categoria con un valor minimo mayor que el valor maximo.
-- Se desea validar que todavia se permite la Insersion de una categoria con un valor minimo mayor que el valor maximo.
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT07', 'Categoria H', 'L', 250, 50, 'CAT07');

-- Tabla articulos
-- Caso 1: Intentar insertar un articulo con un ID que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de un articulo con un ID que ya existe en la tabla.
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (5261397714268532, 'Desc. Articulo 6', 'U', 'https://ejemplo.com/archivo6.pdf', 60, 'TRUE', 'CAT11', 'USR007');
-- Caso 2: Intentar insertar un articulo con una descripcion erronea.
-- Se desea validar que todavia se permite la Insersion de un articulo con una descripcion nula.
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123456, 'Ayer estaba en Lima', 'N', 'https://dominio.com/foto7.pdf', 70, 'TRUE', 'CAT45', 'USR004');
-- Caso 3: Intentar insertar un articulo con un estado que no cumple con las restricciones definidas.
-- Se desea validar que todavia se permite la Insersion de un articulo con un estado que no cumple con las restricciones definidas (estado).
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (7890123456789012, 'Desc. Articulo 8', 'A', 'https://ejemplo.net/otrafoto8.pdf', 80, 'FALSE', 'CAT35', 'USR003');

-- Tabla caracteristicas
-- Caso 1: Intentar insertar una Caracteristica con un articulo que no existe en la tabla de articulos.
-- Se desea validar que todavia se permite la Insersion de una Caracteristica con un articulo que no existe en la tabla de articulos.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (9876543210987654, 'Caract. Articulo 4');
-- Caso 2: Intentar insertar una Caracteristica con una descripcion erronea.
-- Se desea validar que todavia se permite la Insersion de una Caracteristica con una descripcion que no tiene sentido.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (5261397714268532, 'Hoy es lunes');
-- Caso 3: Intentar insertar una Caracteristica con un codigo de articulo negativo.
-- Se desea validar que todavia se permite la Insersion de una Caracteristica con un codigo de articulo negativo que no tiene sentido.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (-9337462158946721, 'Caract. Articulo 12');

-- Tabla ropas
-- Caso 1: Intentar insertar una prenda de ropa con un articulo que no existe en la tabla de articulos.
-- Se desea validar que todavia se permite la Insersion de una prenda de ropa con un articulo que no existe en la tabla de articulos.
INSERT INTO ropas (articulo, talla, material, color) VALUES (9876543210987654, 'M', 'Algodon', 'Azul');
-- Caso 2: Intentar insertar una prenda de ropa con una talla invalida.
-- Se desea validar que todavia se permite la Insersion de una prenda de ropa con una talla que no esta en las opciones.
INSERT INTO ropas (articulo, talla, material, color) VALUES (5261397714268532, 'XX', 'Seda', 'Rojo');
-- Caso 3: Intentar insertar una prenda de ropa con un material incorrecto.
-- Se desea validar que todavia se permite la Insersion de una prenda de ropa con un material que no tiene sentido.
INSERT INTO ropas (articulo, talla, material, color) VALUES (9337462158946721, 'L', 'Algodon', 'Felipe');

-- Tabla perecederos
-- Caso 1: Intentar insertar un articulo perecedero con un articulo que no existe en la tabla de articulos.
-- Se desea validar que todavia se permite la Insersion de un articulo perecedero con un articulo que no existe en la tabla de articulos.
INSERT INTO perecederos (articulo, vencimiento) VALUES (453543210987654, TO_DATE('2024-12-31', 'YYYY-MM-DD'));
-- Caso 2: Intentar insertar un articulo perecedero con una fecha de vencimiento pasada.
-- Se desea validar que todavia se permite la Insersion de un articulo perecedero con una fecha de vencimiento sin sentido.
INSERT INTO perecederos (articulo, vencimiento) VALUES (5261397714268532, TO_DATE('1345-12-15', 'YYYY-MM-DD'));
-- Caso 3: Intentar insertar un articulo perecedero con una fecha de vencimiento anterior a la fecha actual.
-- Se desea validar que todavia se permite la Insersion de un articulo perecedero con una fecha de vencimiento anterior a la fecha actual.
INSERT INTO perecederos (articulo, vencimiento) VALUES (9337462158946721, TO_DATE('2022-12-31', 'YYYY-MM-DD'));

-- Tabla auditorias
-- Caso 1: Intentar insertar una auditoria con un ID que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de una auditoria con un ID que ya existe en la tabla.
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (1, TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'I', 'Auditoria 6', '202108', 'CAT76');
-- Caso 2: Intentar insertar una auditoria con una accion que no cumple con las restricciones definidas.
-- Se desea validar que todavia se permite la Insersion de una auditoria con una accion que no cumple con las restricciones definidas.
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (6, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'A', 'Auditoria 7', '202311', 'CAT65');
-- Caso 3: Intentar insertar una auditoria con una fecha incorrecta.
-- Se desea validar que todavia se permite la Insersion de una auditoria con una fecha invalida.
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (7, TO_DATE('1888-06-01', 'YYYY-MM-DD'), 'U', 'Auditoria 9', '200507', 'CAT87');

-- Tabla evaluaciones
-- Caso 1: Intentar insertar una evaluacion con un a_omes invalido.
-- Se desea validar que todavia se permite la Insersion de una evaluacion con un a_omes que no cumple las condiciones del tipo de dato.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('154145', 'CC', 'N06', TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 6 - A', 'https://ejemplo.com/reporte6.pdf', 'AP');
-- Caso 2: Intentar insertar una evaluacion con un resultado que no cumple con las restricciones definidas.
-- Se desea validar que todavia se permite la Insersion de una evaluacion con un resultado que no cumple con las restricciones definidas.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('202405', 'CC', 'N07', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 7 - M', 'https://otroejemplo.com/reporte7.pdf', 'TI');
-- Caso 3: Intentar insertar una evaluacion con un reporte invalido.
-- Se desea validar que todavia se permite la Insersion de una evaluacion con un reporte que no cumple las condiciones del tipo de dato.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('201512', 'TI', 'N08', TO_DATE('2024-03-21', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 8 - M', 'Hola soy Jorge', 'AP');

-- Tabla respuestas
-- Caso 1: Intentar insertar una respuesta con un a_omes que no existe en la tabla evaluaciones.
-- Se desea validar que todavia se permite la Insersion de una respuesta que no fue inesrtada primero en la tabla evaluaciones.
INSERT INTO respuestas (a_omes, respuesta) VALUES ('201204', 'Respuesta a la pregunta 6');
-- Caso 2: Intentar insertar una respuesta como fecha.
-- Se desea validar que todavia se permite la Insersion de una respuesta de un tipo de dato no valido.
INSERT INTO respuestas (a_omes, respuesta) VALUES ('202107', TO_DATE('2024-03-21', 'YYYY-MM-DD'));
-- Caso 3: Intentar insertar una respuesta con una respuesta como valor booleano.
-- Se desea validar que todavia se permite la Insersion de una respuesta de un tipo de dato no valido.
INSERT INTO respuestas (a_omes, respuesta) VALUES ('202105', 'TRUE');


-- CICLO 1: XPoblar

DELETE FROM universidades;
DELETE FROM usuarios;
DELETE FROM calificaciones;
DELETE FROM categorias;
DELETE FROM articulos;
DELETE FROM caracteristicas;
DELETE FROM ropas;
DELETE FROM perecederos;
DELETE FROM auditorias;
DELETE FROM evaluaciones;
DELETE FROM respuestas;

-- Restricciones:

-- CICLO 1: Atributos

-- Tabla usuarios
ALTER TABLE usuarios
ADD CONSTRAINT chk_tid CHECK (tid IN ('CC', 'TI'));
ALTER TABLE usuarios
ADD CONSTRAINT chk_correo CHECK (correo LIKE '%@%.%');

-- Tabla calificaciones
ALTER TABLE calificaciones
ADD CONSTRAINT chk_articulo CHECK (articulo BETWEEN 1000000000000000 AND 9999999999999999);

-- Tabla categorias
ALTER TABLE categorias 
ADD CONSTRAINT chk_tipo CHECK (tipo IN ('A', 'R', 'L', 'T', 'O'));
ALTER TABLE categorias
ADD CONSTRAINT chk_minimo CHECK (minimo IN (50, 100, 150, 200, 250));
ALTER TABLE categorias
ADD CONSTRAINT chk_maximo CHECK (maximo IN (50, 100, 150, 200, 250));

-- Tabla articulos
ALTER TABLE articulos
ADD CONSTRAINT chk_id CHECK (id BETWEEN 1000000000000000 AND 9999999999999999);
ALTER TABLE articulos
ADD CONSTRAINT chk_estado CHECK (estado IN ('U', 'N'));
ALTER TABLE articulos
ADD CONSTRAINT chk_foto CHECK (foto LIKE 'https://%.%.%.%.%');
ALTER TABLE articulos
ADD CONSTRAINT chk_precio CHECK (precio IN (50, 100, 150, 200, 250));
ALTER TABLE articulos
ADD CONSTRAINT chk_disponible CHECK (disponible IN ('TRUE', 'FALSE'));

-- Tabla caracteristicas
ALTER TABLE caracteristicas
ADD CONSTRAINT chk_articulo_caracteristicas CHECK (articulo BETWEEN 1000000000000000 AND 9999999999999999);

-- Tabla ropas
ALTER TABLE ropas
ADD CONSTRAINT chk_articulo_ropas CHECK (articulo BETWEEN 1000000000000000 AND 9999999999999999);
ALTER TABLE ropas
ADD CONSTRAINT chk_talla CHECK (talla IN ('XS', 'S', 'M', 'L', 'XL'));

-- Tabla perecederos
ALTER TABLE perecederos
ADD CONSTRAINT chk_articulo_perecederos CHECK (articulo BETWEEN 1000000000000000 AND 9999999999999999);

-- Tabla auditorias
ALTER TABLE auditorias
ADD CONSTRAINT chk_id_auditorias CHECK (id > 99999999);
ALTER TABLE auditorias
ADD CONSTRAINT chk_accion CHECK (accion IN ('I', 'D', 'U'));
ALTER TABLE auditorias
ADD CONSTRAINT chk_evaluacion CHECK (evaluacion LIKE '______' AND SUBSTR(evaluacion, 5, 2) BETWEEN '01' AND '12');

-- Tabla evaluaciones
ALTER TABLE evaluaciones
ADD CONSTRAINT chk_a_omes CHECK (a_omes LIKE '______' AND SUBSTR(a_omes, 5, 2) BETWEEN '01' AND '12');
ALTER TABLE evaluaciones
ADD CONSTRAINT chk_tid_evaluaciones CHECK (tid IN ('CC', 'TI'));
ALTER TABLE evaluaciones
ADD CONSTRAINT chk_descripcion CHECK (descripcion LIKE '%[A-M]');
ALTER TABLE evaluaciones
ADD CONSTRAINT chk_reporte CHECK (reporte LIKE 'https://%.%.%.%.%');
ALTER TABLE evaluaciones
ADD CONSTRAINT chk_resultado CHECK (resultado IN ('AP', 'PE'));

-- Tabla respuestas
ALTER TABLE respuestas
ADD CONSTRAINT chk_a_omes_respuestas CHECK (a_omes LIKE '______' AND SUBSTR(a_omes, 5, 2) BETWEEN '01' AND '12');

-- Nuevas definiciones de atributos
ALTER TABLE usuarios
ADD CONSTRAINT chk_programa_usuarios CHECK (programa IN ('Civil', 'Sistemas', 'Mecanica', 'Biomedica'));
ALTER TABLE respuestas
ADD CONSTRAINT chk_respuesta_respuestas CHECK (respuesta IN ('Aprobada', 'Rechazada'));


-- CICLO 1: Primarias

ALTER TABLE universidades
ADD CONSTRAINT pk_universidades PRIMARY KEY (codigo);

ALTER TABLE usuarios
ADD CONSTRAINT pk_usuarios PRIMARY KEY (codigo);

ALTER TABLE calificaciones
ADD CONSTRAINT pk_calificaciones PRIMARY KEY (usuario, articulo);

ALTER TABLE categorias
ADD CONSTRAINT pk_categorias PRIMARY KEY (codigo);

ALTER TABLE articulos
ADD CONSTRAINT pk_articulos PRIMARY KEY (id);

ALTER TABLE caracteristicas
ADD CONSTRAINT pk_caracteristicas PRIMARY KEY (articulo);

ALTER TABLE ropas
ADD CONSTRAINT pk_ropas PRIMARY KEY (articulo);

ALTER TABLE perecederos
ADD CONSTRAINT pk_perecederos PRIMARY KEY (articulo);

ALTER TABLE auditorias
ADD CONSTRAINT pk_auditorias PRIMARY KEY (id);

ALTER TABLE evaluaciones
ADD CONSTRAINT pk_evaluaciones PRIMARY KEY (a_omes);

ALTER TABLE respuestas
ADD CONSTRAINT pk_respuestas PRIMARY KEY (a_omes);


-- CICLO 1: Unicas

ALTER TABLE usuarios
ADD CONSTRAINT uk_usuarios_tid_nid UNIQUE (tid, nid);

ALTER TABLE articulos
ADD CONSTRAINT uk_articulos_foto UNIQUE (foto);

ALTER TABLE evaluaciones
ADD CONSTRAINT uk_evaluaciones_reporte UNIQUE (reporte);


-- CICLO 1: Foraneas

ALTER TABLE universidades
ADD CONSTRAINT fk_universidades_usuarios FOREIGN KEY (codigo) REFERENCES usuarios(codigo);

ALTER TABLE usuarios
ADD CONSTRAINT fk_usuarios_universidades FOREIGN KEY (codigo) REFERENCES universidades(codigo);

ALTER TABLE calificaciones
ADD CONSTRAINT fk_calificaciones_usuarios FOREIGN KEY (usuario) REFERENCES usuarios(codigo);

ALTER TABLE calificaciones
ADD CONSTRAINT fk_calificaciones_articulos FOREIGN KEY (articulo) REFERENCES articulos(id);

ALTER TABLE categorias
ADD CONSTRAINT fk_categorias_padre FOREIGN KEY (codigo1) REFERENCES categorias(codigo);

ALTER TABLE articulos
ADD CONSTRAINT fk_articulos_categorias FOREIGN KEY (categoria) REFERENCES categorias(codigo);

ALTER TABLE articulos
ADD CONSTRAINT fk_articulos_usuarios FOREIGN KEY (usuario) REFERENCES usuarios(codigo);

ALTER TABLE caracteristicas
ADD CONSTRAINT fk_caracteristicas_articulos FOREIGN KEY (articulo) REFERENCES articulos(id);

ALTER TABLE ropas
ADD CONSTRAINT fk_ropas_articulos FOREIGN KEY (articulo) REFERENCES articulos(id);

ALTER TABLE perecederos
ADD CONSTRAINT fk_perecederos_articulos FOREIGN KEY (articulo) REFERENCES articulos(id);

ALTER TABLE auditorias
ADD CONSTRAINT fk_auditorias_evaluaciones FOREIGN KEY (evaluacion) REFERENCES evaluaciones(a_omes);

ALTER TABLE auditorias
ADD CONSTRAINT fk_auditorias_categorias FOREIGN KEY (categoria) REFERENCES categorias(codigo);

ALTER TABLE respuestas
ADD CONSTRAINT fk_respuestas_evaluaciones FOREIGN KEY (a_omes) REFERENCES evaluaciones(a_omes);


-- CICLO 1: PoblarNoOK 3 (Validacion de las Nuevas Restricciones)

-- Tabla universidades
-- Caso 1: Intentar insertar una universidad con un codigo que ya existe en la tabla.
-- Restriccion: Llave primaria
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U01', 'Universidad F', 'Calle Principal 456', 'USR012');
-- Caso 2: Intentar insertar una universidad con el campo "nombre" como un numero.
-- Restriccion: Definición de atributo 
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 6331245, 'Avenida Este 789', 'USR014');
-- Caso 3: Intentar insertar una universidad con una direccion como fecha.
-- Restriccion: Definición de atributo 
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 'Universidad F', '2024-05-26', 'USR016');

-- Tabla usuarios
-- Caso 1: Intentar insertar un usuario con un codigo que ya existe en la tabla.
-- Restriccion: Llave primaria y foranea
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR001', 'T1', 'N01', 'Usuario 1', 'Programa 1', 'usuario1@example.com', TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 005, 'U15');
-- Caso 2: Intentar insertar un usuario con una fecha de registro futura.
-- Restriccion: Definición de atributo 
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR006', 'T6', 'N06', 'Usuario 6', 'Programa 6', 'usuario6@example.com', TO_DATE('2086-12-31', 'YYYY-MM-DD'), 0, 'U35');
-- Caso 3: Intentar insertar un usuario con un numero de suspensiones negativo.
-- Restriccion: Definición de atributo 
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR007', 'T7', 'N07', 'Usuario 7', 'Programa 7', 'usuario7@example.com', TO_DATE('2024-03-18', 'YYYY-MM-DD'), -5, 'U17');

-- Tabla calificaciones
-- Caso 1: Intentar insertar una calificacion con un codigo que ya existe en la tabla.
-- Restriccion: Llave primaria
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL001', 5261268532, 4);
-- Caso 2: Intentar insertar una calificacion con un numero de estrellas fuera del rango permitido.
-- Restriccion: Definición de atributo 
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL006', 1237123456, 8);
-- Caso 3: Intentar insertar una calificacion con un codigo de usuario negativo.
-- Restriccion: Definición de atributo 
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL007', -54214336576, 3);

-- Tabla categorias
-- Caso 1: Intentar insertar una categoria con un codigo que ya existe en la tabla.
-- Restriccion: Llave primaria y foranea
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT01', 'Categoria F', 'R', 50, 150, 'CAT01');
-- Caso 2: Intentar insertar una categoria con un tipo que no cumple con las restricciones definidas (maximo).
-- Restriccion: Definición de atributo 
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT06', 'Categoria G', 'A', 150, 500, 'CAT06');
-- Caso 3: Intentar insertar una categoria con un valor minimo mayor que el valor maximo.
-- Restriccion: Definición de atributo 
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT07', 'Categoria H', 'L', 250, 50, 'CAT07');

-- Tabla articulos
-- Caso 1: Intentar insertar un articulo con un ID que ya existe en la tabla.
-- Restriccion: Llave primaria y foranea
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (5261397714268532, 'Desc. Articulo 6', 'U', 'https://ejemplo.com/archivo6.pdf', 60, 'TRUE', 'CAT11', 'USR007');
-- Caso 2: Intentar insertar un articulo con una descripcion erronea.
-- Restriccion: Definición de atributo 
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123456, 'Ayer estaba en Lima', 'N', 'https://dominio.com/foto7.pdf', 70, 'TRUE', 'CAT45', 'USR004');
-- Caso 3: Intentar insertar un articulo con un estado que no cumple con las restricciones definidas.
-- Restriccion: Definición de atributo
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (7890123456789012, 'Desc. Articulo 8', 'A', 'https://ejemplo.net/otrafoto8.pdf', 80, 'FALSE', 'CAT35', 'USR003');

-- Tabla caracteristicas
-- Caso 1: Intentar insertar una Caracteristica con un articulo que no existe en la tabla de articulos.
-- Restriccion: Llave foranea
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (9876543210987654, 'Caract. Articulo 4');
-- Caso 2: Intentar insertar una Caracteristica con una descripcion erronea.
-- Restriccion: Definición de atributo 
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (5261397714268532, 'Hoy es lunes');
-- Caso 3: Intentar insertar una Caracteristica con un codigo de articulo negativo.
--- Restriccion: Definición de atributo 
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (-9337462158946721, 'Caract. Articulo 12');

-- Tabla ropas
-- Caso 1: Intentar insertar una prenda de ropa con un articulo que no existe en la tabla de articulos.
-- Restriccion: Llave foranea
INSERT INTO ropas (articulo, talla, material, color) VALUES (9876543210987654, 'M', 'Algodon', 'Azul');
-- Caso 2: Intentar insertar una prenda de ropa con una talla invalida.
-- Restriccion: Definición de atributo 
INSERT INTO ropas (articulo, talla, material, color) VALUES (5261397714268532, 'XX', 'Seda', 'Rojo');
-- Caso 3: Intentar insertar una prenda de ropa con un material incorrecto.
-- Restriccion: Definición de atributo 
INSERT INTO ropas (articulo, talla, material, color) VALUES (9337462158946721, 'L', 'Algodon', 'Felipe');

-- Tabla perecederos
-- Caso 1: Intentar insertar un articulo perecedero con un articulo que no existe en la tabla de articulos.
-- Restriccion: Llave foranea
INSERT INTO perecederos (articulo, vencimiento) VALUES (453543210987654, TO_DATE('2024-12-31', 'YYYY-MM-DD'));
-- Caso 2: Intentar insertar un articulo perecedero con una fecha de vencimiento pasada.
-- Restriccion: Definición de atributo 
INSERT INTO perecederos (articulo, vencimiento) VALUES (5261397714268532, TO_DATE('1345-12-15', 'YYYY-MM-DD'));
-- Caso 3: Intentar insertar un articulo perecedero con una fecha de vencimiento anterior a la fecha actual.
-- Restriccion: Definición de atributo 
INSERT INTO perecederos (articulo, vencimiento) VALUES (9337462158946721, TO_DATE('2022-12-31', 'YYYY-MM-DD'));

-- Tabla auditorias
-- Caso 1: Intentar insertar una auditoria con un ID que ya existe en la tabla.
--- Restriccion: Llave primaria
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (1, TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'I', 'Auditoria 6', '202108', 'CAT76');
-- Caso 2: Intentar insertar una auditoria con una accion que no cumple con las restricciones definidas.
-- Restriccion: Definición de atributo 
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (6, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'A', 'Auditoria 7', '202311', 'CAT65');
-- Caso 3: Intentar insertar una auditoria con una fecha incorrecta.
-- Restriccion: Definición de atributo 
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (7, TO_DATE('1888-06-01', 'YYYY-MM-DD'), 'U', 'Auditoria 9', '200507', 'CAT87');

-- Tabla evaluaciones
-- Caso 1: Intentar insertar una evaluacion con un a_omes invalido.
-- Restriccion: Llave foranea y definición de atributo 
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('154145', 'CC', 'N06', TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 6 - A', 'https://ejemplo.com/reporte6.pdf', 'AP');
-- Caso 2: Intentar insertar una evaluacion con un resultado que no cumple con las restricciones definidas.
-- Restriccion: Definición de atributo 
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('202405', 'CC', 'N07', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 7 - M', 'https://otroejemplo.com/reporte7.pdf', 'TI');
-- Caso 3: Intentar insertar una evaluacion con un reporte invalido.
-- Restriccion: Definición de atributo 
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('201512', 'TI', 'N08', TO_DATE('2024-03-21', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 8 - M', 'Hola soy Jorge', 'AP');

-- Tabla respuestas
-- Caso 1: Intentar insertar una respuesta con un a_omes que no existe en la tabla evaluaciones.
-- Restriccion: Llave foranea
INSERT INTO respuestas (a_omes, respuesta) VALUES ('201204', 'Respuesta a la pregunta 6');
-- Caso 2: Intentar insertar una respuesta como fecha.
-- Restriccion: Definición de atributo 
INSERT INTO respuestas (a_omes, respuesta) VALUES ('202107', TO_DATE('2024-03-21', 'YYYY-MM-DD'));
-- Caso 3: Intentar insertar una respuesta con una respuesta como valor booleano.
-- Restriccion: Definición de atributo
INSERT INTO respuestas (a_omes, respuesta) VALUES ('202105', 'TRUE');


-- CICLO 1: Consultar las categorias con mas articulos

SELECT categoria, COUNT(*) AS cantidad_articulos
FROM articulos
GROUP BY categoria
ORDER BY COUNT(*) DESC;


-- CICLO 1: Consultar las calificaciones de los articulos del último mes

SELECT estrella
FROM calificaciones JOIN articulos ON articulo=id
WHERE TO_CHAR(fecha, 'YYYY-MM') = TO_CHAR(ADD_MONTHS(SYSDATE, -1), 'YYYY-MM');


-- CICLO 1: Consultar la cantidad de estudiantes suspendidos por programa (Propuesta)

SELECT programa, COUNT(*) AS cantidad_suspendidos
FROM usuarios
WHERE suspencion IS NOT NULL
GROUP BY programa;


-- CICLO 1: PoblarOK 2 (Final)

-- Insersion de datos en la tabla universidades
INSERT INTO universidades (codigo, nombre, direccion, usuario) 
VALUES 
    ('U01', 'University of Science', '957 Ohio Way', 'USR001'),
    ('U02', 'Mountain View University', '770 Maryland Plaza', 'USR002'),
    ('U03', 'Tech Institute', '527 Vermont Way', 'USR003'),
    ('U04', 'Sunset College', '289 Kansas Lane', 'USR004'),
    ('U05', 'Oceanfront University', '965 Washington Way', 'USR005'),
    ('U06', 'Pinecrest University', '482 Arizona Drive', 'USR006'),
    ('U07', 'Liberty University', '573 Dakota Lane', 'USR007'),
    ('U08', 'Lakeside College', '855 Virginia Plaza', 'USR008'),
    ('U09', 'University of Central', '478 Dakota Plaza', 'USR009'),
    ('U10', 'Grandview College', '523 Dakota Drive', 'USR010');

-- Insersion de datos en la tabla usuarios
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) 
VALUES 
    ('USR001', 'T1', 'N01', 'Marsha Cunningham', 'Civil Engineering', 'mcunningham0@plala.or.jp', '2024-03-01', NULL, 3, 'U01'),
    ('USR002', 'T2', 'N02', 'Nicole Cruz', 'Computer Science', 'ncruz1@spotify.com', '2024-03-02', NULL, 7, 'U02'),
    ('USR003', 'T1', 'N03', 'Janice Garrett', 'Electrical Engineering', 'jgarrett2@weibo.com', '2024-03-03', NULL, 2, 'U03'),
    ('USR004', 'T2', 'N04', 'Donna Brown', 'Chemical Engineering', 'dbrown3@pbs.org', '2024-03-04', NULL, 5, 'U04'),
    ('USR005', 'T1', 'N05', 'Jeremy Barnes', 'Mechanical Engineering', 'jbarnes4@netvibes.com', '2024-03-05', NULL, 1, 'U05'),
    ('USR006', 'T2', 'N06', 'Judith Ortiz', 'Computer Science', 'jortiz5@posterous.com', '2024-03-06', NULL, 8, 'U06'),
    ('USR007', 'T1', 'N07', 'Jerry Allen', 'Mechanical Engineering', 'jallen6@harvard.edu', '2024-03-07', NULL, 4, 'U07'),
    ('USR008', 'T2', 'N08', 'Cynthia Simpson', 'Civil Engineering', 'csimpson7@desdev.cn', '2024-03-08', NULL, 6, 'U08'),
    ('USR009', 'T1', 'N09', 'Shawn Powell', 'Chemical Engineering', 'spowell8@myspace.com', '2024-03-09', NULL, 9, 'U09'),
    ('USR010', 'T2', 'N10', 'Roy Morgan', 'Electrical Engineering', 'rmorgan9@fda.gov', '2024-03-10', NULL, 0, 'U10');


-- Insersion de datos en la tabla calificaciones
INSERT INTO calificaciones (usuario, articulo, estrella) 
VALUES 
    ('USR001', 1000000000000001, 4),
    ('USR002', 1000000000000002, 5),
    ('USR003', 1000000000000003, 3),
    ('USR004', 1000000000000004, 4),
    ('USR005', 1000000000000005, 5),
    ('USR006', 1000000000000006, 3),
    ('USR007', 1000000000000007, 4),
    ('USR008', 1000000000000008, 5),
    ('USR009', 1000000000000009, 3),
    ('USR010', 1000000000000010, 4);

-- Insersion de datos en la tabla categorias
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT01', 'Electronics', 'E', 100, 500, 'CAT01'),
    ('CAT02', 'Clothing', 'C', 50, 200, 'CAT02'),
    ('CAT03', 'Books', 'B', 50, 250, 'CAT03'),
    ('CAT04', 'Home & Kitchen', 'H', 150, 500, 'CAT04'),
    ('CAT05', 'Toys & Games', 'T', 100, 250, 'CAT05'),
    ('CAT06', 'Automotive', 'A', 150, 500, 'CAT06'),
    ('CAT07', 'Health & Personal Care', 'H', 50, 200, 'CAT07'),
    ('CAT08', 'Sports & Outdoors', 'S', 50, 250, 'CAT08'),
    ('CAT09', 'Tools & Home Improvement', 'T', 100, 500, 'CAT09'),
    ('CAT10', 'Pet Supplies', 'P', 150, 250, 'CAT10');

-- Insersion de datos en la tabla articulos
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) 
VALUES 
    (1234567890123456, 'Smartphone', 'U', 'https://example.com/smartphone.jpg', 500, 'TRUE', 'CAT01', 'USR001'),
    (2345678901234567, 'Winter Jacket', 'N', 'https://example.com/jacket.jpg', 150, 'TRUE', 'CAT02', 'USR002'),
    (3456789012345678, 'Mystery Novel', 'U', 'https://example.com/novel.jpg', 30, 'TRUE', 'CAT03', 'USR003'),
    (4567890123456789, 'Coffee Maker', 'U', 'https://example.com/coffee_maker.jpg', 200, 'TRUE', 'CAT04', 'USR004'),
    (5678901234567890, 'Board Game', 'N', 'https://example.com/board_game.jpg', 80, 'TRUE', 'CAT05', 'USR005'),
    (6789012345678901, 'Car Seat Cover', 'N', 'https://example.com/seat_cover.jpg', 100, 'TRUE', 'CAT06', 'USR006'),
    (7890123456789012, 'Toothpaste', 'U', 'https://example.com/toothpaste.jpg', 5, 'TRUE', 'CAT07', 'USR007'),
    (8901234567890123, 'Soccer Ball', 'N', 'https://example.com/soccer_ball.jpg', 20, 'TRUE', 'CAT08', 'USR008'),
    (9012345678901234, 'Power Drill', 'U', 'https://example.com/power_drill.jpg', 150, 'TRUE', 'CAT09', 'USR009'),
    (9876543210987654, 'Dog Collar', 'N', 'https://example.com/dog_collar.jpg', 15, 'TRUE', 'CAT10', 'USR010');

-- Insersion de datos en la tabla caracteristicas
INSERT INTO caracteristicas (articulo, caracteristica) 
VALUES 
    (1234567890123456, '4G LTE'),
    (2345678901234567, 'Waterproof'),
    (3456789012345678, 'Bestseller'),
    (4567890123456789, 'Programmable'),
    (5678901234567890, 'Educational'),
    (6789012345678901, 'Universal Fit'),
    (7890123456789012, 'Fluoride-free'),
    (8901234567890123, 'Official Size'),
    (9012345678901234, 'Cordless'),
    (9876543210987654, 'Adjustable');

-- Insersion de datos en la tabla ropas
INSERT INTO ropas (articulo, talla, material, color) 
VALUES 
    (1234567890123456, 'M', 'Cotton', 'Blue'),
    (2345678901234567, 'L', 'Polyester', 'Black'),
    (3456789012345678, 'S', 'Denim', 'Gray'),
    (4567890123456789, 'XL', 'Wool', 'Red'),
    (5678901234567890, 'XS', 'Leather', 'Brown'),
    (6789012345678901, 'M', 'Silk', 'White'),
    (7890123456789012, 'L', 'Cotton', 'Green'),
    (8901234567890123, 'XL', 'Polyester', 'Blue'),
    (9012345678901234, 'S', 'Denim', 'Black'),
    (9876543210987654, 'M', 'Wool', 'Gray');

-- Insersion de datos en la tabla perecederos
INSERT INTO perecederos (articulo, vencimiento) 
VALUES 
    (1234567890123456, TO_DATE('2024-12-31', 'YYYY-MM-DD')),
    (2345678901234567, TO_DATE('2025-03-15', 'YYYY-MM-DD')),
    (3456789012345678, TO_DATE('2024-11-30', 'YYYY-MM-DD')),
    (4567890123456789, TO_DATE('2024-10-31', 'YYYY-MM-DD')),
    (5678901234567890, TO_DATE('2024-09-30', 'YYYY-MM-DD')),
    (6789012345678901, TO_DATE('2024-08-31', 'YYYY-MM-DD')),
    (7890123456789012, TO_DATE('2024-07-31', 'YYYY-MM-DD')),
    (8901234567890123, TO_DATE('2024-06-30', 'YYYY-MM-DD')),
    (9012345678901234, TO_DATE('2024-05-31', 'YYYY-MM-DD')),
    (9876543210987654, TO_DATE('2024-04-30', 'YYYY-MM-DD'));

-- Insersion de datos en la tabla auditorias
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) 
VALUES 
    (1, TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'I', 'Audit 1', '202104', 'CAT01'),
    (2, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'A', 'Audit 2', '202205', 'CAT02'),
    (3, TO_DATE('2024-03-21', 'YYYY-MM-DD'), 'U', 'Audit 3', '202306', 'CAT03'),
    (4, TO_DATE('2024-03-22', 'YYYY-MM-DD'), 'I', 'Audit 4', '202407', 'CAT04'),
    (5, TO_DATE('2024-03-23', 'YYYY-MM-DD'), 'A', 'Audit 5', '202508', 'CAT05'),
    (6, TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'U', 'Audit 6', '202609', 'CAT06'),
    (7, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'I', 'Audit 7', '202710', 'CAT07'),
    (8, TO_DATE('2024-03-26', 'YYYY-MM-DD'), 'A', 'Audit 8', '202811', 'CAT08'),
    (9, TO_DATE('2024-03-27', 'YYYY-MM-DD'), 'U', 'Audit 9', '202912', 'CAT09'),
    (10, TO_DATE('2024-03-28', 'YYYY-MM-DD'), 'I', 'Audit 10', '203013', 'CAT10');

-- Insersion de datos en la tabla evaluaciones
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) 
VALUES 
('202201', 'CC', 'N01', TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 1', 'https://example.com/reporte1.pdf', 'AP'),
('202202', 'TI', 'N02', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 2', 'https://example.com/reporte2.pdf', 'PE'),
('202203', 'CC', 'N03', TO_DATE('2024-03-21', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 3', 'https://example.com/reporte3.pdf', 'AP'),
('202204', 'TI', 'N04', TO_DATE('2024-03-22', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 4', 'https://example.com/reporte4.pdf', 'TI'),
('202205', 'CC', 'N05', TO_DATE('2024-03-23', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 5', 'https://example.com/reporte5.pdf', 'AP'),
('202206', 'TI', 'N06', TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 6', 'https://example.com/reporte6.pdf', 'PE'),
('202207', 'CC', 'N07', TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 7', 'https://example.com/reporte7.pdf', 'AP'),
('202208', 'TI', 'N08', TO_DATE('2024-03-26', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 8', 'https://example.com/reporte8.pdf', 'TI'),
('202209', 'CC', 'N09', TO_DATE('2024-03-27', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 9', 'https://example.com/reporte9.pdf', 'AP'),
('202210', 'TI', 'N10', TO_DATE('2024-03-28', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 10', 'https://example.com/reporte10.pdf', 'PE');


-- Insersion de datos en la tabla respuestas
INSERT INTO respuestas (a_omes, respuesta) 
VALUES 
('202201', 'Respuesta 1'),
('202202', 'Respuesta 2'),
('202203', 'Respuesta 3'),
('202204', 'Respuesta 4'),
('202205', 'Respuesta 5'),
('202206', 'Respuesta 6'),
('202207', 'Respuesta 7'),
('202208', 'Respuesta 8'),
('202209', 'Respuesta 9'),
('202210', 'Respuesta 10');


--CICLO 1: CRUD : Caso de uso 1

--Atributos
--Los códigos deben iniciar con una letra mayúscula
ALTER TABLE categotias
ADD CONSTRAINT codigo_mayuscula CHECK (codigo LIKE '[A-Z]%');

--La fecha del registro corresponde a la fecha del momento en el cual se registra.
ALTER TABLE auditorias
ADD CONSTRAINT check_fecha_registro
CHECK (fecha = CURRENT_TIMESTAMP);



--Tuplas
--El precio mínimo debe ser menor que el máximo
ALTER TABLE categorias
ADD CONSTRAINT minimo_menor_maximo CHECK (minimo < maximo);

-- TuplasOK
-- minimo_menor_maximo
-- Los datos se insertan pues el precio mínimo debe ser menor que el máximo
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT11', 'Electronics', 'E', 50, 100, 'CAT11'),
    ('CAT12', 'Clothing', 'C', 100, 150, 'CAT12'),
    ('CAT13', 'Books', 'B', 100, 200, 'CAT13'),
    ('CAT14', 'Home & Kitchen', 'H', 150, 200, 'CAT14'),
    ('CAT15', 'Toys & Games', 'T', 200, 250, 'CAT15'),
    ('CAT16', 'Automotive', 'A', 150, 200, 'CAT16'),
    ('CAT17', 'Health & Personal Care', 'H', 100, 150, 'CAT17'),
    ('CAT18', 'Sports & Outdoors', 'S', 100, 200, 'CAT18'),
    ('CAT19', 'Tools & Home Improvement', 'T', 150, 200, 'CAT19'),
    ('CAT20', 'Pet Supplies', 'P', 200, 250, 'CAT20');

-- TuplasNoOK
-- minimo_menor_maximo
-- En este caso no permite el ingreso pues el precio minimo es mayor que el maximo puesto y manda un error
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT21', 'Clothing', 'C', 100, 50, 'CAT21'),
    ('CAT22', 'Automotive', 'A', 200, 100, 'CAT22'),
    ('CAT23', 'Pet Supplies', 'P', 300, 150, 'CAT23'),
    ('CAT24', 'Sports & Outdoors', 'S', 400, 200, 'CAT24'),
    ('CAT25', 'Home & Kitchen', 'H', 500, 250, 'CAT25'),
    ('CAT26', 'Tools & Home Improvement', 'T', 600, 300, 'CAT26'),
    ('CAT27', 'Pet Supplies', 'P', 700, 350, 'CAT27'),
    ('CAT28', 'Sports & Outdoors', 'S', 800, 400, 'CAT28'),
    ('CAT29', 'Health & Personal Care', 'H', 900, 450, 'CAT29'),
    ('CAT30', 'Pet Supplies', 'B', 1000, 500, 'CAT30');


--Acciones
--Unicamente se pueden eliminar los que no tienen artículos asociados.
CONSTRAINT FK_ARTICULOS_SOLOS FOREIGN KEY Articulos.codigo
REFERENCES categorias(codigo)
ON DELETE RESTRICT

--AccionesOK

-- Insersion de datos en la tabla categorias, por lo cual no tiene articulos relacionados
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT99', 'Sin articulos', 'S', 50, 100, 'CAT99');
-- Eliminacion valida de el dato Sin 'articulos'
DELETE FROM categorias WHERE codigo = 'CAT99';


--Disparadores
--Si no se indica el nombre se le asigna. 'Nombre de <codigo>'
CREATE TRIGGER TR_CATEGORIA_NOMBRE
BEFORE INSERT ON categorias
FOR EACH ROW
BEGIN
    IF :new.nombre IS NULL THEN
        :new.nombre := "Nombre de "||:new.codigo;
    END IF;
END;

--Si no se indica el precio máximo se supone que es el doble del mínimo
CREATE TRIGGER TR_CATEGORIA_MAXIMO
BEFORE INSERT ON categorias
FOR EACH ROW
BEGIN
    IF :new.maximo IS NULL THEN
        :new.maximo := :new.minimo * 2;
    END IF;
END;

--Los únicos datos que se pueden modificar son el mínimo y el máximo. Únicamente pueden aumentar
CREATE TRIGGER TR_CATEGORIA_MINMAX
BEFORE UPDATE ON mi_tabla
FOR EACH ROW
BEGIN
    IF NEW.minimo < OLD.minimo OR NEW.maximo < OLD.maximo THEN
        SET MESSAGE_TEXT = 'Los valores solo pueden aumentar'
    END IF;
END;

--Si se modifica el mínimo, el máximo debe modificarse en el mismo valor.
CREATE TRIGGER TR_CATEGORIA_NEWMAX
BEFORE UPDATE ON categorias
FOR EACH ROW
BEGIN
    IF :new.minimo > old.maximo THEN
        :new.maximo := :new.minimo;
    END IF;
END;

CREATE TRIGGER TR_AUDITORIA_MOD
BEFORE UPDATE ON auditorias
FOR EACH ROW
BEGIN
    IF :new.fecha < old.fecha THEN
        SET MESSAGE_TEXT = 'La fecha de la auditoria no puede ser modificada a una fecha anterior';
    END IF;
END;

--Los registros no se pueden modificar.
CREATE TRIGGER TR_AUDITORIAS_DEL
BEFORE DELETE OR UPDATE ON auditorias
FOR EACH ROW
BEGIN
    IF UPDATING THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar registros de esta tabla.');
    END IF;
END;

--Los registros no se pueden modificar.
CREATE TRIGGER TR_AUDITORIAS_UPD
BEFORE DELETE OR UPDATE ON auditorias
FOR EACH ROW
BEGIN
    IF DELETING THEN
        RAISE_APPLICATION_ERROR(-20001, 'No se puede eliminar registros de esta tabla.');
    END IF;
END;

--DisparadoresOK

-- TR_CATEGORIA_NOMBRE
-- En este caso permite el ingreso pues las categorias tienen nombres vacios y se autocompletan con el trigger
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT31', NULL, 'C', 50, 100, 'CAT31'),
    ('CAT32', NULL, 'A', 100, 150, 'CAT32'),
    ('CAT33', NULL, 'P', 150, 200, 'CAT33'),
    ('CAT34', NULL, 'S', 200, 250, 'CAT34'),
    ('CAT35', NULL, 'H', 250, 300, 'CAT35'),
    ('CAT36', NULL, 'T', 300, 350, 'CAT36'),
    ('CAT37', NULL, 'P', 350, 400, 'CAT37'),
    ('CAT38', NULL, 'S', 400, 450, 'CAT38'),
    ('CAT39', NULL, 'H', 450, 500, 'CAT39'),
    ('CAT40', NULL, 'B', 500, 550, 'CAT40');

-- TR_CATEGORIA_MAXIMO
-- En este caso permite el ingreso pues las categorias tienen un valor nulo y se cambiarian con el trigger
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT61', 'Electronics', 'E', 200, NULL, 'CAT61'),
    ('CAT62', 'Clothing', 'C', 100, NULL, 'CAT62'),
    ('CAT63', 'Books', 'B', 100, NULL, 'CAT63'),
    ('CAT64', 'Home & Kitchen', 'H', 300, NULL, 'CAT64'),
    ('CAT65', 'Toys & Games', 'T', 200, NULL, 'CAT65'),
    ('CAT66', 'Automotive', 'A', 300, NULL, 'CAT66'),
    ('CAT67', 'Health & Personal Care', 'H', 100, NULL, 'CAT67'),
    ('CAT68', 'Sports & Outdoors', 'S', 100, NULL, 'CAT68'),
    ('CAT69', 'Tools & Home Improvement', 'T', 200, NULL, 'CAT69'),
    ('CAT70', 'Pet Supplies', 'P', 300, NULL, 'CAT70');

--TR_CATEGORIA_MINMAX
-- En este caso se actualizaron 3 datos de tal forma que se aumentara los precios y el trigger se activa
UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT19';

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT19';

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT20';

--TR_CATEGORIA_NEWMAX
-- En este caso actualizamos 3 de los datos del poblar OK activando el trigger al subir el minimo a un valor mayor al maximo
UPDATE categorias
SET minimo = 600
WHERE codigo = 'CAT14';

UPDATE categorias
SET minimo = 600
WHERE codigo = 'CAT15';

UPDATE categorias
SET minimo = 600
WHERE codigo = 'CAT16';

--TR_AUDITORIA_MOD_UPD
-- En este caso se actualizan 2 datos de la tabla de auditorias, los cuales son aptos para que el trigger se cumpla y se envia el menaje de restriccion
UPDATE auditorias
SET fecha = TO_DATE('2024-03-18', 'YYYY-MM-DD')
WHERE id = 1;

UPDATE auditorias
SET fecha = TO_DATE('2024-03-18', 'YYYY-MM-DD')
WHERE id = 2;


--TR_AUDITORIA_MOD_DEL
-- En este caso se borran 2 datos de la tabla de auditorias, los cuales son aptos para que el trigger se cumpla y se envia el menaje de restriccion

DELETE FROM auditorias
WHERE id = 1;

DELETE FROM auditorias
WHERE id = 2;


-- TR_CATEGORIA_NOMBRE
-- En este caso no permite la activacion, pues las categorias tienen nombres declarados
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT41', 'Electronics', 'E', 200, 400, 'CAT41'),
    ('CAT42', 'Clothing', 'C', 100, 200, 'CAT42');

-- TR_CATEGORIA_NOMBRE
-- En este caso permite el ingreso pues las categorias tienen nombres vacios y se autocompletan con el trigger
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT31', NULL, 'C', 50, 100, 'CAT31'),
    ('CAT32', NULL, 'A', 100, 150, 'CAT32');


--DisparadoresNoOK
--TR_CATEGORIA_NOMBRE
-- En este caso no se aceptan los valores, pues el valor del maximo esta declarado de forma erronea
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT51', 'Electronics', 'E', 50, 100, 'CAT51'),
    ('CAT52', 'Clothing', 'C', 100, 150, 'CAT52'),
    ('CAT53', 'Books', 'B', 150, 200, 'CAT53'),
    ('CAT54', 'Home & Kitchen', 'H', 200, 250, 'CAT54'),
    ('CAT55', 'Toys & Games', 'T', 250, 300, 'CAT55'),
    ('CAT56', 'Automotive', 'A', 300, 350, 'CAT56'),
    ('CAT57', 'Health & Personal Care', 'H', 350, 400, 'CAT57'),
    ('CAT58', 'Sports & Outdoors', 'S', 400, 450, 'CAT58'),
    ('CAT59', 'Tools & Home Improvement', 'T', 450, 500, 'CAT59'),
    ('CAT60', 'Pet Supplies', 'P', 500, 550, 'CAT60');


-- TR_CATEGORIA_NOMBRE
-- En este caso no permite la activacion, pues las categorias tienen nombres declarados
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT41', 'Electronics', 'E', 200, 400, 'CAT41'),
    ('CAT42', 'Clothing', 'C', 100, 200, 'CAT42'),
    ('CAT43', 'Books', 'B', 100, 150, 'CAT43'),
    ('CAT44', 'Home & Kitchen', 'H', 200, 400, 'CAT44'),
    ('CAT45', 'Toys & Games', 'T', 150, 250, 'CAT45'),
    ('CAT46', 'Automotive', 'A', 200, 400, 'CAT46'),
    ('CAT47', 'Health & Personal Care', 'H', 100, 200, 'CAT47'),  
    ('CAT48', 'Sports & Outdoors', 'S', 100, 250, 'CAT48'),
    ('CAT49', 'Tools & Home Improvement', 'T', 150, 400, 'CAT49'),
    ('CAT50', 'Pet Supplies', 'P', 200, 250, 'CAT50');

-- TR_CATEGORIA_MAXIMO
-- En este caso no se activa el trigger, pues los minimos tienen un valor declarado
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) 
VALUES 
    ('CAT61', 'Electronics', 'E', 200, 400, 'CAT61'),
    ('CAT62', 'Clothing', 'C', 100, 400, 'CAT62'),
    ('CAT63', 'Books', 'B', 100, 400, 'CAT63'),
    ('CAT64', 'Home & Kitchen', 'H', 300, 400, 'CAT64'),
    ('CAT65', 'Toys & Games', 'T', 200, 400, 'CAT65'),
    ('CAT66', 'Automotive', 'A', 300, 400, 'CAT66'),
    ('CAT67', 'Health & Personal Care', 'H', 100, 400, 'CAT67'),
    ('CAT68', 'Sports & Outdoors', 'S', 100, 400, 'CAT68'),
    ('CAT69', 'Tools & Home Improvement', 'T', 200, 400, 'CAT69'),
    ('CAT70', 'Pet Supplies', 'P', 300, 400, 'CAT70');

--TR_CATEGORIA_MINMAX
-- En este caso se actualizaron 3 datos de tal forma que se aumentara los precios y el trigger se activa
UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT19';

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT19';

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT20';

--TR_CATEGORIA_NEWMAX
-- En este caso actualizamos 5 de los datos del poblar OK activando el trigger, los cuales no son aptos para que el trigger se cumpla
UPDATE categorias
SET minimo = 50
WHERE codigo = 'CAT11';

UPDATE categorias
SET minimo = 50
WHERE codigo = 'CAT12';

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT13';

--TR_AUDITORIA_MOD_UPD
-- En este caso se actualizan 2 datos de la tabla de auditorias, los cuales no son aptos para que el trigger se cumpla y se trata de actualizar a estos
UPDATE auditorias
SET fecha = TO_DATE('2024-07-14', 'YYYY-MM-DD')
WHERE id = 0;

UPDATE auditorias
SET fecha = TO_DATE('2026-06-16', 'YYYY-MM-DD')
WHERE id = 1000;

--TR_AUDITORIA_MOD_UPD
-- En este caso se borran 2 datos de la tabla de auditorias, los cuales no son aptos para que el trigger se cumpla y se eliminan a estos con exito

DELETE FROM auditorias
WHERE id = 0;

DELETE FROM auditorias
WHERE id = 1000;


--Xdisparadores
DROP TRIGGER IF EXISTS TR_CATEGORIA_NEWMAX;
DROP TRIGGER IF EXISTS TR_CATEGORIA_NOMBRE;
DROP TRIGGER IF EXISTS TR_CATEGORIA_MAXIMO;
DROP TRIGGER IF EXISTS TR_CATEGORIA_MINMAX;

DROP TRIGGER IF EXISTS TR_AUDITORIA_MOD_UPD;

---------- CODE END ----------