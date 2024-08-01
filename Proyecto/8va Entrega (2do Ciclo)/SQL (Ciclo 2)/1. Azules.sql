---------- CODE START ----------

-- CICLO 2: Tablas

CREATE TABLE PuntosRecogidas (
    id VARCHAR2(10) NOT NULL,
    remitente VARCHAR2(30) NOT NULL,
    destinatario VARCHAR2(30) NOT NULL,
    direccion VARCHAR2(30) NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR2(10) NOT NULL,
    pago VARCHAR2(20) NOT NULL,
    devolucion VARCHAR2(10)
);

CREATE TABLE Envios (
    id VARCHAR2(10) NOT NULL,
    remitente VARCHAR2(20) NOT NULL,
    destinatario VARCHAR2(20) NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR2(9) NOT NULL,
    pago VARCHAR2(20) NOT NULL, 
    devolucion VARCHAR2(10)
);

CREATE TABLE Estandares (
    id VARCHAR2(10) NOT NULL,
    direccion VARCHAR2(80) NOT NULL,
    costo NUMBER NOT NULL,
    repartidor VARCHAR2(10) NOT NULL
);

CREATE TABLE Repartidores (
    id VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(30) NOT NULL,
    celular NUMBER(10) NOT NULL,
    calificacion NUMBER(3) NOT NULL
);

CREATE TABLE Digitales (
    id VARCHAR2(10) NOT NULL,
    medio VARCHAR2(15) NOT NULL,
    plataforma VARCHAR2(12) NOT NULL,
    proteccion VARCHAR2(1) NOT NULL
);

CREATE TABLE Seguimientos (
    codigo VARCHAR2(10) NOT NULL,
    estado VARCHAR2(12) NOT NULL,
    ubicacion VARCHAR2(30) NOT NULL,
    fecha DATE NOT NULL,
    detalle VARCHAR2(35) NOT NULL
);

CREATE TABLE SeguimientosXNotificaciones (
    seguimiento VARCHAR2(10) NOT NULL,
    notificacion VARCHAR2(10) NOT NULL
);

CREATE TABLE Notificaciones (
    codigo VARCHAR2(10) NOT NULL,
    motivo VARCHAR2(100) NOT NULL,
    medio VARCHAR2(15) NOT NULL,
    fecha DATE NOT NULL
);

CREATE TABLE Devoluciones (
    id VARCHAR2(10) NOT NULL,
    motivo VARCHAR2(150) NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR2(12) NOT NULL,
    reembolso VARCHAR2(1) NOT NULL
);

CREATE TABLE Suscripciones (
    id VARCHAR2(10) NOT NULL,
    fecha DATE NOT NULL,
    vencimiento DATE NOT NULL,
    estado VARCHAR2(1) NOT NULL,
    monto NUMBER NOT NULL,
    metodo VARCHAR2(15) NOT NULL,
    seguro VARCHAR2(20)
);

CREATE TABLE Promociones (
    codigo VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    descripcion VARCHAR2(50) NOT NULL,
    f_comienzo DATE NOT NULL,
    f_final DATE NOT NULL,
    estado VARCHAR2(1) NOT NULL,
    reusable VARCHAR2(1) NOT NULL,
    valor NUMBER NOT NULL,
    suscripcion VARCHAR2(10) NOT NULL
);

CREATE TABLE Seguros (
    id VARCHAR2(20) NOT NULL,
    cobertura VARCHAR2(40) NOT NULL,
    estado VARCHAR2(1) NOT NULL
);

COMMIT;



-- CICLO 2: Atributos

-- Booleano

ALTER TABLE Devoluciones ADD CONSTRAINT CK_DEVOLUCIONES_REEMBOLZO
CHECK (reembolso IN ('T', 'F'));
ALTER TABLE Digitales ADD CONSTRAINT CK_DIGITALES_PROTECCION
CHECK (proteccion IN ('T', 'F'));
ALTER TABLE Promociones ADD CONSTRAINT CK_PROMOCIONES_REUSABLE
CHECK (reusable IN ('T', 'F'));

-- Moneda

ALTER TABLE Estandares ADD CONSTRAINT CK_ESTANDARES_COSTO
CHECK (costo > 0 AND MOD(costo, 100) = 0);
ALTER TABLE Suscripciones ADD CONSTRAINT CK_SUSCRIPCIONES_MONTO
CHECK (monto > 0 AND MOD(monto, 100) = 0);
ALTER TABLE Promociones ADD CONSTRAINT CK_PROMOCIONES_VALOR
CHECK (valor > 0 AND MOD(valor, 100) = 0);

-- TCalificacion

ALTER TABLE Repartidores ADD CONSTRAINT CK_REPARTIDORES_CALIFICACION
CHECK (calificacion BETWEEN 0 AND 100);

-- TCelular

ALTER TABLE Repartidores ADD CONSTRAINT CK_REPARTIDORES_CELULAR
CHECK (SUBSTR(celular, 1, 3) IN ('300', '301', '302', '303', '304', '305', 
                                 '310', '311', '312', '313', '314', '315',
                                 '316', '317', '318', '319', '320', '321',
                                 '322', '323', '324', '333'));

-- TCobertura

ALTER TABLE seguros ADD CONSTRAINT CK_SEGURO_COBERTURA
CHECK (cobertura IN ('Cancelacion', 'Danos', 'Defectos', 'Error', 'Extravio', 'Perdida', 'Robo', 'Retraso', 'Todo'));

-- TDireccion

ALTER TABLE Estandares ADD CONSTRAINT CK_ESTANDARES_DIRECCION
CHECK (LENGTH(direccion) >= 10);
ALTER TABLE PuntosRecogidas ADD CONSTRAINT CK_PUNTOSRECOGIDAS_DIRECCION
CHECK (LENGTH(direccion) >= 10);

-- TEstado

ALTER TABLE Devoluciones ADD CONSTRAINT CK_DEVOLUCIONES_ESTADO
CHECK (estado IN ('Aprobado', 'Pendiente', 'Pendiente 1','Pendiente 2', 'Rechazado', 'Reembolsado'));

-- TEstadoE

ALTER TABLE Envios ADD CONSTRAINT CK_ENVIOS_ESTADO
CHECK (estado IN ('Enviado', 'Entregado', 'Retrasado', 'Devuelto', 'Pendiente'));

-- TEstadoPR

ALTER TABLE PuntosRecogidas ADD CONSTRAINT CK_PUNTOSRECOGIDAS_ESTADO
CHECK (estado IN ('Pendiente', 'Recogido', 'Devuelto'));

-- TEstadoPS

ALTER TABLE Promociones ADD CONSTRAINT CK_PROMOCIONES_ESTADO
CHECK (estado IN ('A', 'C','V','R','U'));
ALTER TABLE Seguros ADD CONSTRAINT CK_SEGUROS_ESTADO
CHECK (estado IN ('A', 'C','V','R','U'));

-- TEstadoS

ALTER TABLE Seguimientos ADD CONSTRAINT CK_SEGUIMIENTOS_ESTADO
CHECK (estado IN ('Completado', 'En Proceso', 'Pendiente', 'En Revision', 'En Espera', 'Cancelado', 'Atrasado'));

-- TEstadoSP

ALTER TABLE Suscripciones ADD CONSTRAINT CK_SUSCRIPCIONES_ESTADO
CHECK (estado IN ('A','C','V','S'));

-- TMedio

ALTER TABLE Notificaciones ADD CONSTRAINT CK_NOTIFICACIONES_MEDIO
CHECK (medio IN ('Correo', 'Mensaje', 'Aplicacion', 'Sitio Web', 'Nube'));
ALTER TABLE Digitales ADD CONSTRAINT CK_DIGITALES_MEDIO
CHECK (medio IN ('Correo', 'Mensaje', 'Aplicacion', 'Sitio Web', 'Nube'));

-- TMetodo

ALTER TABLE Suscripciones ADD CONSTRAINT CK_SUSCRIPCIONES_METODO
CHECK (metodo IN ('Efectivo', 'Tarjeta', 'Transaccion', 'Criptomonedas'));

-- TPlataforma

ALTER TABLE Digitales ADD CONSTRAINT CK_DIGITALES_PLATAFORMA
CHECK (plataforma IN ('Gmail', 'Hotmail', 'iMessage', ' Messenger', 'ProtonMail', 'SMS', 'Telegram', 'Whatsapp', 'Yahoo', 'Otro'));

-- TUbicacion

ALTER TABLE Seguimientos ADD CONSTRAINT CK_SEGUIMIENTOS_UBICACION
CHECK (LENGTH(ubicacion) >= 10);


COMMIT;



-- CICLO 2: Primarias

ALTER TABLE PuntosRecogidas
ADD CONSTRAINT PK_PUNTOSRECOGIDAS PRIMARY KEY (id);

ALTER TABLE Envios
ADD CONSTRAINT PK_ENVIOS PRIMARY KEY (id);

ALTER TABLE Estandares
ADD CONSTRAINT PK_ESTANDARES PRIMARY KEY (id);

ALTER TABLE Repartidores
ADD CONSTRAINT PK_REPARTIDOR PRIMARY KEY (id);

ALTER TABLE Digitales
ADD CONSTRAINT PK_DIGITALES PRIMARY KEY (id);

ALTER TABLE Seguimientos
ADD CONSTRAINT PK_SEGUIMIENTOS PRIMARY KEY (codigo);

ALTER TABLE SeguimientosXNotificaciones
ADD CONSTRAINT PK_SEGUIMIENTOSXNOTIFICACIONES PRIMARY KEY (seguimiento, notificacion);

ALTER TABLE Notificaciones
ADD CONSTRAINT PK_NOTIFICACIONES PRIMARY KEY (codigo);

ALTER TABLE Devoluciones
ADD CONSTRAINT PK_DEVOLUCIONES PRIMARY KEY (id);

ALTER TABLE Suscripciones
ADD CONSTRAINT PK_SUSCRIPCIONES PRIMARY KEY (id);

ALTER TABLE Promociones
ADD CONSTRAINT PK_PROMOCIONES PRIMARY KEY (codigo);

ALTER TABLE Seguros
ADD CONSTRAINT PK_SEGUROS PRIMARY KEY (id);

COMMIT;



-- CICLO 2: Unicas

ALTER TABLE PuntosRecogidas
ADD CONSTRAINT UK_PUNTOSRECOGIDAS_DEVOLUCION UNIQUE (devolucion);

ALTER TABLE Envios
ADD CONSTRAINT UK_ENVIOS_DEVOLUCION UNIQUE (devolucion);

ALTER TABLE Repartidores
ADD (CONSTRAINT UK_REPARTIDORES_CELULAR UNIQUE (celular),
     CONSTRAINT UK_REPARTIDORES_NOMBRE UNIQUE (nombre));

ALTER TABLE Suscripciones
ADD CONSTRAINT UK_SUSCRIPCIONES_SEGURO UNIQUE (seguro);

COMMIT;



-- CICLO 2: Foraneas

ALTER TABLE Usuarios
ADD CONSTRAINT FK_USUARIOS_SUSCRIPCIONES FOREIGN KEY (suscripcion) REFERENCES Suscripciones (id) ON DELETE SET NULL;

ALTER TABLE PuntosRecogidas
ADD (CONSTRAINT FK_PUNTOSRECOGIDAS_PAGOS FOREIGN KEY (pago) REFERENCES Pagos (id),
     CONSTRAINT FK_PUNTOSRECOGIDAS_DEVOLUCIONES FOREIGN KEY (devolucion) REFERENCES Devoluciones (id));

ALTER TABLE Envios
ADD (CONSTRAINT FK_ENVIOS_PAGOS FOREIGN KEY (pago) REFERENCES Pagos (id),
     CONSTRAINT FK_ENVIOS_DEVOLUCIONES FOREIGN KEY (devolucion) REFERENCES Devoluciones (id));

ALTER TABLE Seguimientos
ADD CONSTRAINT FK_SEGUIMIENTOS_ENVIOS FOREIGN KEY (codigo) REFERENCES Envios (id);

ALTER TABLE Estandares
ADD (CONSTRAINT FK_ESTANDARES_ENVIOS FOREIGN KEY (id) REFERENCES Envios (id),
     CONSTRAINT FK_ESTANDARES_REPARTIDORES FOREIGN KEY (repartidor) REFERENCES Repartidores (id) ON DELETE SET NULL);

ALTER TABLE Digitales
ADD CONSTRAINT FK_DIGITALES_ENVIOS FOREIGN KEY (id) REFERENCES Envios (id);

ALTER TABLE SeguimientosXNotificaciones
ADD (CONSTRAINT FK_SEGUIMIENTOSXNOTIFICACIONES_SEGUIMIENTOS FOREIGN KEY (seguimiento) REFERENCES Seguimientos (codigo) ON DELETE CASCADE,
     CONSTRAINT FK_SEGUIMIENTOSXNOTIFICACIONES_NOTIFICACIONES FOREIGN KEY (notificacion) REFERENCES Notificaciones (codigo) ON DELETE CASCADE);

ALTER TABLE Suscripciones 
ADD CONSTRAINT FK_SUSCRIPCIONES_SEGUROS FOREIGN KEY (seguro) REFERENCES Seguros (id) ON DELETE SET NULL;

ALTER TABLE Promociones
ADD CONSTRAINT FK_PROMOCIONES_SUSCRIPCIONES FOREIGN KEY (suscripcion) REFERENCES Suscripciones (id) ON DELETE CASCADE;

COMMIT;



-- CICLO 1: XTablas
/*
DROP TABLE PuntosRecogidas CASCADE CONSTRAINTS;
DROP TABLE Envios CASCADE CONSTRAINTS;
DROP TABLE Devoluciones CASCADE CONSTRAINTS;
DROP TABLE Digitales CASCADE CONSTRAINTS;
DROP TABLE Estandares CASCADE CONSTRAINTS;
DROP TABLE Repartidores CASCADE CONSTRAINTS;
DROP TABLE Seguimientos CASCADE CONSTRAINTS;
DROP TABLE SeguimientosXNotificaciones CASCADE CONSTRAINTS;
DROP TABLE Notificaciones CASCADE CONSTRAINTS;
DROP TABLE Suscripciones CASCADE CONSTRAINTS;
DROP TABLE Promociones CASCADE CONSTRAINTS;
DROP TABLE Seguros CASCADE CONSTRAINTS;
COMMIT;
*/


-- CICLO 1: XBaseDatos
/*
-- Eliminar Tablas + Indices
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


-- CICLO 2: Consultas
/*
-- 1. Consultar el detalle de los envios que estan en estado "Retrasado" o "Devuelto".

SELECT *
FROM Envios
WHERE estado IN ('Retrasado', 'Devuelto');

-- 2. Consultar todas las devoluciones aprobadas en el ultimo mes.

SELECT *
FROM Devoluciones
WHERE estado = 'Aprobado'
AND fecha >= ADD_MONTHS(SYSDATE, -1);

-- 3. Consultar el numero de envios realizados por cada repartidor en el ultimo año.

SELECT r.id, r.nombre, COUNT(en.id) AS total_envios
FROM Repartidores r
JOIN Estandares es ON r.id = es.repartidor
JOIN Envios en ON es.id = en.id
WHERE en.fecha >= ADD_MONTHS(SYSDATE, -12)
GROUP BY r.id, r.nombre;

-- 4. Consulta las notificaciones de seguimiento de un envio especifico.

SELECT n.codigo, n.motivo, n.medio, n.fecha
FROM Envios e
JOIN Seguimientos s ON e.id = s.codigo
JOIN SeguimientosXNotificaciones sxn ON s.codigo = sxn.seguimiento
JOIN Notificaciones n ON sxn.notificacion = n.codigo
WHERE e.id = '1856934072';

-- 5. Obtener un resumen de los seguros por su estado.

SELECT sg.estado, COUNT(sg.id) AS cantidad_seguros
FROM Seguros sg
GROUP BY sg.estado
ORDER BY sg.estado;

-- 6. Consultar las promociones activas y sus estadisticas de uso.

SELECT p.codigo, p.nombre, p.descripcion, p.valor, COUNT(s.id) AS veces_utilizada
FROM Promociones p
JOIN Suscripciones s ON p.suscripcion = s.id
WHERE p.estado = 'A'
GROUP BY p.codigo, p.nombre, p.descripcion, p.valor
ORDER BY veces_utilizada DESC;
*/


-- CICLO 2: XPoblar
/*
DELETE FROM PuntosRecogidas;
DELETE FROM Envios;
DELETE FROM Devoluciones;
DELETE FROM Digitales;
DELETE FROM Estandares;
DELETE FROM Repartidores;
DELETE FROM Seguimientos;
DELETE FROM SeguimientosXNotificaciones;
DELETE FROM Notificaciones;
DELETE FROM Suscripciones;
DELETE FROM Promociones;
DELETE FROM Seguros;
COMMIT;
*/
---------- CODE END ----------