---------- Código PL/SQL Autoestudio 4 ----------

-- Tablas
-- Crear tabla bookings
CREATE TABLE bookings (
    id TBook NOT NULL,
    bookink_date DATE NOT NULL,
    room_no TRoom NOT NULL,
    guest_id TGuest NOT NULL,
    occupants TOccup NOT NULL,
    room_type TRoomT NOT NULL,
    nights NUMBER(1) NOT NULL,
    arrival_time TArrival NOT NULL
);
-- Crear tabla extras
CREATE TABLE extras (
    id TExtra NOT NULL,
    amount TPrice NOT NULL,
    discount TPrice NOT NULL,
    booking NOT NULL
);
-- Crear tabla descriptions
CREATE TABLE descriptions (
    extra TExtra NOT NULL,
    descriptions TDetail NOT NULL
);


-- Atributos
-- Definición del tipo TExtra
CREATE DOMAIN TBook AS NUMBER(4) CHECK (VALUE > 5000);
-- Definición del tipo TExtra
CREATE DOMAIN TRoom AS NUMBER(3) CHECK (VALUE > 100);
-- Definición del tipo TExtra
CREATE DOMAIN TGuest AS NUMBER(4) CHECK (VALUE > 1000);
-- Definición del tipo TExtra
CREATE DOMAIN TOccup AS NUMBER(1) CHECK (VALUE IN (1, 2, 3));
-- Definición del tipo TExtra
CREATE DOMAIN TRoomT AS VARCHAR(6) CHECK (VALUE IN ('single', 'double', 'family', 'twin'));
-- Definición del tipo TExtra
CREATE DOMAIN TArrival AS VARCHAR(5) CHECK (REGEXP_LIKE(VALUE, '^([01][0-9]|2[0-3]):[0-5][0-9]$'));
-- Definición del tipo TExtra
CREATE DOMAIN TExtra AS NUMBER(11) CHECK (VALUE >= 9);
-- Definición del tipo TDetail
CREATE DOMAIN TDetail AS VARCHAR(50) CHECK (VALUE <> '');
-- Definición del tipo TPrice
CREATE DOMAIN TPrice AS NUMBER(9) CHECK (VALUE >= 0);


-- Primarias
-- Agregar id de bookings como Clave Primaria
ALTER TABLE bookings
ADD CONSTRAINT PK_BOOKINGS PRIMARY KEY (id);
-- Agregar id de extras como Clave Primaria
ALTER TABLE extras
ADD CONSTRAINT PK_EXTRAS PRIMARY KEY (id);
-- Agregar extra de descriptions como Clave Primaria
ALTER TABLE descriptions
ADD CONSTRAINT PK_DESCRIPCTIONS PRIMARY KEY (extra);


-- Foráneas
-- Agregar booking como Clave Foránea de la tabla extras con el atributo id de bookings
ALTER TABLE extras
ADD CONSTRAINT FK_EXTRAS_BOOKINGS FOREIGN KEY (booking) REFERENCES bookings(id);
-- Agregar extra como Clave Foránea de la tabla descriptions con el atributo id de extras
ALTER TABLE descriptions
ADD CONSTRAINT FK_DESCRIPTIONS_EXTRAS FOREIGN KEY (extra) REFERENCES extras(id);


-- XTablas
/*
DROP TABLE extras CASCADE CONSTRAINTS;
DROP TABLE descriptions CASCADE CONSTRAINTS;
*/


-- Tuplas
-- Validaciones para la tabla bookings
ALTER TABLE bookings
ADD CONSTRAINT CK_BOOKINGS_ID CHECK (id > 5000),
ADD CONSTRAINT CK_BOOKINGS_ROOM_NO CHECK (room_no > 100),
ADD CONSTRAINT CK_BOOKINGS_GUEST_ID CHECK (guest_id > 1000),
ADD CONSTRAINT CK_BOOKINGS_OCCUPANTS CHECK (occupants IN (1, 2, 3)),
ADD CONSTRAINT CK_BOOKINGS_ROOM_TYPE CHECK (room_type IN ('single', 'double', 'family', 'twin')),
ADD CONSTRAINT CK_BOOKINGS_ARRIVAL_TIME CHECK (REGEXP_LIKE(arrival_time, '^([01][0-9]|2[0-3]):[0-5][0-9]$'));
-- Validaciones para la tabla extras
ALTER TABLE extras
ADD CONSTRAINT CK_EXTRAS_ID CHECK (id >= 9),
ADD CONSTRAINT CK_EXTRAS_PRICE CHECK (amount >= 0),
ADD CONSTRAINT CK_EXTRAS_DISCOUNT CHECK (discount >= 0);
-- Validaciones para la tabla descriptions
ALTER TABLE descriptions
ADD CONSTRAINT CK_DESCRIPTIONS_EXTRAS CHECK (extra >= 9),
ADD CONSTRAINT CK_DESCRIPTIONS_DETAIL CHECK (description <> '');


-- AtributosOK / TuplasOK
-- Inserción de datos en la tabla bookings que cumplen con las restricciones
INSERT INTO bookings (id, booking_date, room_no, guest_id, occupants, room_type, nights, arrival_time)
VALUES (6000, '2024-03-22', 150, 2000, 2, 'single', 3, '12:30');
-- Inserción de datos en la tabla extras que cumplen con las restricciones
INSERT INTO extras (id, amount, discount)
VALUES (10, 50, 10);
-- Inserción de datos en la tabla descriptions que cumplen con las restricciones
INSERT INTO descriptions (extra, description)
VALUES (10, 'Descripción válida');


-- AtributosNoOK / TuplasNoOK
-- Validación de los atributos de la tabla bookings
-- Intento de inserción de datos que violan las restricciones
-- El id es menor que 5000
INSERT INTO bookings (id, booking_date, room_no, guest_id, occupants, room_type, nights, arrival_time)
VALUES (4000, '2024-03-22', 150, 2000, 2, 'single', 3, '12:30');
-- El room_no es menor que 100
INSERT INTO bookings (id, booking_date, room_no, guest_id, occupants, room_type, nights, arrival_time)
VALUES (6001, '2024-03-22', 90, 2000, 2, 'single', 3, '12:30');
-- El guest_id es menor que 1000
INSERT INTO bookings (id, booking_date, room_no, guest_id, occupants, room_type, nights, arrival_time)
VALUES (6002, '2024-03-22', 150, 900, 2, 'single', 3, '12:30');
-- El occupants no está en (1, 2, 3)
INSERT INTO bookings (id, booking_date, room_no, guest_id, occupants, room_type, nights, arrival_time)
VALUES (6003, '2024-03-22', 150, 2000, 4, 'single', 3, '12:30');
-- El room_type no es 'single', 'double', 'family', o 'twin'
INSERT INTO bookings (id, booking_date, room_no, guest_id, occupants, room_type, nights, arrival_time)
VALUES (6004, '2024-03-22', 150, 2000, 2, 'suite', 3, '12:30');
-- El formato de arrival_time no es válido
INSERT INTO bookings (id, booking_date, room_no, guest_id, occupants, room_type, nights, arrival_time)
VALUES (6005, '2024-03-22', 150, 2000, 2, 'single', 3, '25:64');

-- Validación de los atributos de la tabla extras
-- Intento de inserción de datos que violan las restricciones
-- El id es menor que 9
INSERT INTO extras (id, amount, discount)
VALUES (5, 50, 10);
-- El amount es menor que 0
INSERT INTO extras (id, amount, discount)
VALUES (11, -50, 10);
-- El discount es menor que 0
INSERT INTO extras (id, amount, discount)
VALUES (12, 50, -10);

-- Validación de los atributos de la tabla descriptions
-- Intento de inserción de datos que violan las restricciones
-- El extra es menor que 9
INSERT INTO descriptions (extra, description)
VALUES (5, 'Descripción inválida');
-- La descripción es una cadena vacía
INSERT INTO descriptions (extra, description)
VALUES (11, '');


-- Acciones
-- Eliminar la FK de la tabla Description y agregarla con la opción ON DELETE CASCADE para que al eliminar un registro de Extra se elimine el registro de descripción asociado
ALTER TABLE Description
DROP CONSTRAINT fk_description_extra,
ADD CONSTRAINT fk_description_extra FOREIGN KEY (extra) REFERENCES Extra(id) ON DELETE CASCADE;


-- AccionesOK
-- Hacer un insert en la tabla bookings para posteriomente eliminar el registro y verificar que se elimine el registro de Description asociado
INSERT INTO bookings (id, booking_date, room_no, guest_id, occupants, room_type, nights, arrival_time)
VALUES (5255, '2024-02-22', 150, 1234, 1, 'family', 2, '12:30');
SHOW TABLE extras;
DELETE FROM bookings WHERE id = 5255;
SHOW TABLE extras;

-- Disparadores
-- Crear un disparador en la de extras que verifique si un descuento es mayor que el 50% del monto

CREATE TRIGGER trg_descuento_50
BEFORE INSERT ON extras
FOR EACH ROW
BEGIN
    IF (monto/2) < descuento THEN
        RAISE EXCEPTION('El descuento no puede ser mayor al 50% del monto');
    END IF;
END;

-- crear un disparador en la tabla extras que ponga el descuento en 10% si el monto es mayor a 100000
CREATE TRIGGER trg_descuento_10
BEFORE INSERT ON extras
FOR EACH ROW
BEGIN
    IF monto > 100000 THEN
        descuento := monto * 0.1;
    END IF;
END;

--crear un disparador que permita modificar la descripción unicamente para añaadir una nueva descripción
CREATE TRIGGER trg_descripcion
BEFORE UPDATE OF description ON descriptions
FOR EACH ROW
BEGIN
    IF :OLD.description <> :NEW.description AND LENGTH(OLD.description) > LENGTH(:NEW.description) THEN
        RAISE EXCEPTION('No se puede modificar la descripción');
    END IF;
END;


-- XDisparadores
DROP TRIGGER trg_descuento_50;
DROP TRIGGER trg_descuento_10;
DROP TRIGGER trg_descripcion;

-- DisparadoresOK
-- Insertar un registro en la tabla extras con un descuento mayor al 50% del monto
INSERT INTO extras (id, monto, descuento)
VALUES (20, 100, 60);
-- Insertar un registro en la tabla extras con un monto mayor a 100000
INSERT INTO extras (id, monto, descuento)
VALUES (21, 100000, 20);
-- Insertar un registro en la tabla descriptions con una descripción válida
INSERT INTO descriptions (extra, description)
VALUES (20, 'Descripción válida'); -- suponiendo que la anteriror descripción era vacía

-- DisparadoresNoOK
-- Insertar un registro en la tabla extras con un descuento mayor al 50% del monto
INSERT INTO extras (id, monto, descuento)
VALUES (22, 100, 60);
-- Insertar un registro en la tabla extras con un monto mayor a 100000
INSERT INTO extras (id, monto, descuento)
VALUES (23, 100000, 20);
-- Insertar un registro en la tabla descriptions con una descripción válida
INSERT INTO descriptions (extra, description)
VALUES (22, 'Descripción válida'); -- suponiendo que la anteriror descripción era Descripción válida Y Perfecta

---------- FIN DEL CÓDIGO ----------