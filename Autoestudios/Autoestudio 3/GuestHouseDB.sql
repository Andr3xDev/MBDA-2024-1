-- Creación de la Base de Datos (BD) "GuestHouseDB"

-- Crear Tablas Vacías
-- Crear Tabla rate
CREATE TABLE rate (
    room_type CHAR(6),
    occupancy INT,
    amount DECIMAL(4,2)
);
-- Crear Tabla room_type
CREATE TABLE room_type (
    id CHAR(6),
    description VARCHAR(50)
);
-- Crear tabla room
CREATE TABLE room (
    id INT,
    room_type VARCHAR(10),
    max_occupancy INT
);


-- Agregar restricciones declarativas a la BD (Atributos, PKs, FKs, UKs) 
-- Agregar clave primaria a room_type.id
ALTER TABLE room_type
ADD CONSTRAINT pk_room_type_id PRIMARY KEY (id);

-- Agregar clave primaria a room.id
ALTER TABLE room
ADD CONSTRAINT pk_room_id PRIMARY KEY (id);

-- Agregar clave única a room_type.description
ALTER TABLE room_type
ADD CONSTRAINT uq_room_type_description UNIQUE (description);


-- Insertar Datos en la BD
-- SIN Automatización
-- Insertar datos en la tabla rate
INSERT INTO rate (room_type, occupancy, amount) VALUES ('double', 1, 56.00);
INSERT INTO rate (room_type, occupancy, amount) VALUES ('double', 2, 72.00);
INSERT INTO rate (room_type, occupancy, amount) VALUES ('family', 1, 56.00);
INSERT INTO rate (room_type, occupancy, amount) VALUES ('family', 2, 72.00);
INSERT INTO rate (room_type, occupancy, amount) VALUES ('family', 3, 84.00);
INSERT INTO rate (room_type, occupancy, amount) VALUES ('single', 1, 48.00);
INSERT INTO rate (room_type, occupancy, amount) VALUES ('twin', 1, 50.00);
INSERT INTO rate (room_type, occupancy, amount) VALUES ('twin', 2, 72.00);

-- Insertar datos en la tabla room_type
INSERT INTO room_type (id, description) VALUES ('double', 'Fabulously appointed double room.');
INSERT INTO room_type (id, description) VALUES ('family', 'Superior appartment for up to 3 people.');
INSERT INTO room_type (id, description) VALUES ('single', 'Luxury accommodation suitable for one person.');
INSERT INTO room_type (id, description) VALUES ('twin', 'Superb room with two beds.');

-- Insertar datos en la tabla room
INSERT INTO room (id, room_type, max_occupancy) VALUES (101, 'single', 1);
INSERT INTO room (id, room_type, max_occupancy) VALUES (102, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (103, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (104, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (105, 'family', 3);
INSERT INTO room (id, room_type, max_occupancy) VALUES (106, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (107, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (108, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (109, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (110, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (201, 'single', 1);
INSERT INTO room (id, room_type, max_occupancy) VALUES (202, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (203, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (204, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (205, 'family', 3);
INSERT INTO room (id, room_type, max_occupancy) VALUES (206, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (207, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (208, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (209, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (210, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (301, 'single', 1);
INSERT INTO room (id, room_type, max_occupancy) VALUES (302, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (303, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (304, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (305, 'family', 3);
INSERT INTO room (id, room_type, max_occupancy) VALUES (306, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (307, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (308, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (309, 'double', 2);
INSERT INTO room (id, room_type, max_occupancy) VALUES (310, 'double', 2);

-- CON Automatización
-- Insertar datos en la tabla rate
INSERT INTO rate (room_type, occupancy, amount) 
VALUES 
('double', 1, 56.00),
('double', 2, 72.00),
('family', 1, 56.00),
('family', 2, 72.00),
('family', 3, 84.00),
('single', 1, 48.00),
('twin', 1, 50.00),
('twin', 2, 72.00);

-- Insertar datos en la tabla room_type
INSERT INTO room_type (id, description) 
VALUES 
('double', 'Fabulously appointed double room.'),
('family', 'Superior apartment for up to 3 people.'),
('single', 'Luxury accommodation suitable for one person.'),
('twin', 'Superb room with two beds.');

-- Insertar datos en la tabla room
INSERT INTO room (id, room_type, max_occupancy) 
VALUES 
(101, 'single', 1),
(102, 'double', 2),
(103, 'double', 2),
(104, 'double', 2),
(105, 'family', 3),
(106, 'double', 2),
(107, 'double', 2),
(108, 'double', 2),
(109, 'double', 2),
(110, 'double', 2),
(201, 'single', 1),
(202, 'double', 2),
(203, 'double', 2),
(204, 'double', 2),
(205, 'family', 3),
(206, 'double', 2),
(207, 'double', 2),
(208, 'double', 2),
(209, 'double', 2),
(210, 'double', 2),
(301, 'single', 1),
(302, 'double', 2),
(303, 'double', 2),
(304, 'double', 2),
(305, 'family', 3),
(306, 'double', 2),
(307, 'double', 2),
(308, 'double', 2),
(309, 'double', 2),
(310, 'double', 2);


-- Intento de ingreso de datos erróneos protegidos por las restricciones declarativsa de la BD
-- Intentar insertar una tasa con un tipo de habitación no existente
INSERT INTO rate (room_type, occupancy, amount) VALUES ('suite', 2, 100.00);
-- Intentar insertar un room_type con una clave primaria duplicada
INSERT INTO room_type (id, description) VALUES ('double', 'Fabulously appointed double room.');
-- Intentar insertar una room con una clave primaria duplicada
INSERT INTO room (id, room_type, max_occupancy) VALUES (101, 'single', 1);


-- Prueba de 5 consultas pertienentes para la BD
-- ¿Cuántos cuartos del tipo 'single' hay?
SELECT COUNT(room_type) 
FROM room 
WHERE room_type = 'single';

-- ¿Cuánto dinero se recauda en total con rate? 
SELECT SUM(amount) 
FROM rate;

-- ¿Cuántos cuartos hay en total?
SELECT DISTINCT COUNT(id) 
FROM room;

-- ¿Cuáles son los tipos de cuartos ofrecidos?
SELECT id 
FROM room_type;

-- ¿Cuál es la máxima cantidad de huéspedes?
SELECT SUM(max_occupancy) 
FROM room;


-- Despoblar la BD (XPoblar)
TRUNCATE TABLE rate;
TRUNCATE TABLE room_type;
TRUNCATE TABLE room;

SHOW rate;
SHOW room_type;
SHOW room;

-- Eliminar toda la información de la BD (XTablas)
DROP TABLE rate;
DROP TABLE room_type;
DROP TABLE room;

SHOW rate;
SHOW room_type;
SHOW room;