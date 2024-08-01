-- INTEGRIDAD DECLARATIVA

-- 1. El tipo de dato UUID es una cadena de exactamente 32 caracteres y debe contener 4 guiones (‘-’).
-- CREATE DOMAIN uuid AS VARCHAR2(32) 
-- CHECK (id LIKE '%-%-%-%-%');

-- 2. El tipo de garantía es por daño o defecto.
-- ALTER TABLE garantias
-- ADD CONSTRAINT ck_garantia_tipo CHECK (tipo IN ('daño', 'defecto'));

-- 3. No pueden existir más de 30 productos reacondicionados
-- CREATE ASSERTION as_tangibles_reacondicionados
-- CHECK (NOT EXISTS (SELECT * FROM tangibles WHERE estado = 'reacondicionado' AND COUNT(*) > 30));

-- 4. La garantía de un producto puede generar un bono o un servicio de mantenimiento pero no los dos.
-- CREATE ASSERTION as_garantia_bono_servicio
-- CHECK (NOT EXISTS (SELECT * FROM garantias WHERE codigoBono IS NOT NULL AND empresa IS NOT NULL));

-- INTEGRIDAD PROCEDIMENTAL

-- ADICIONAR
-- 1. Las garantías de los productos que pertenecen a la categoría de electrónicos tienen una duración de 12 meses.
-- CREATE TRIGGER tg_garantia_electronicos
-- BEFORE INSERT ON productos
-- FOR EACH ROW
-- DECLARE
--     categoria VARCHAR2(32);
-- BEGIN
--     SELECT categoria INTO categoria 
--     FROM productos 
--     WHERE id = :NEW.id;

--     IF categoria = 'electronicos' THEN
--         :NEW.garantia := 12;
--     END IF;
-- END;

-- 2. Al registrar un bono se debe verificar que las fechas iniciales y finales sean posteriores a la fecha actual y el estado del bono falso porque no ha sido cobrado.

-- CREATE TRIGGER tg_bono_fechaEstado
-- BEFORE INSERT ON bonos
-- FOR EACH ROW
-- BEGIN
--     IF :NEW.estado = 'T' THEN
--         RAISE_APPLICATION_ERROR(-20002, 'El bono ya fue cobrado');
--     END IF;

--     IF :NEW.fechaInicial < SYSDATE THEN
--         RAISE_APPLICATION_ERROR(-20003, 'La fecha inicial no puede ser menor a la fecha actual');
--     ELSE IF :NEW.fechaFinal < SYSDATE THEN
--         RAISE_APPLICATION_ERROR(-20004, 'La fecha final no puede ser menor a la fecha actual');
--     END IF;
--     END IF;
-- END;
-- /

-- 3. Para registrar un producto solo basta con indicarle el nombre del país al que pertenece si no se envía la información se asume que no tiene impuesto
-- CREATE TRIGGER tg_producto_impuesto
-- BEFORE INSERT ON productos
-- FOR EACH ROW
-- BEGIN
--     IF :NEW.pais IS NULL THEN
--         :NEW.impuesto := NULL;
--     END IF;
-- END;

-- MODIFICAR
-- 1. No se puede modificar un impuesto que tenga productos asociados.
-- ALTER TABLE productos
-- ADD CONSTRAINT fk_impuestos_productos
-- FOREIGN KEY (impuesto) REFERENCES impuestos(id)
-- ON UPDATE RESTRICT;

-- 2. No se pueden modificar las garantías que son por reparación
-- CREATE TRIGGER tg_garantia_tipo
-- BEFORE UPDATE ON garantias
-- FOR EACH ROW
-- BEGIN
--     IF :OLD.tipo = 'reparacion' THEN
--         RAISE_APPLICATION_ERROR(-20006, 'No se puede modificar la garantía porque es por reparación');
--     END IF;
-- END;


-- ELIMINAR
-- 1. Al eliminar un producto se deben eliminar sus garantías
-- ALTER TABLE garantias
-- ADD CONSTRAINT fk_garantias_productos
-- FOREIGN KEY (codigoGarantia) REFERENCES productos(id)
-- ON DELETE CASCADE;

-- 2. Si un vendedor abandona la organización se debe mantener los registros de sus ventas de productos.
-- ALTER TABLE registroProductos
-- ADD CONSTRAINT fk_registroProductos_vendedores
-- FOREIGN KEY (tipodeidentificacion, numeroidentificacion) REFERENCES vendedores(tipodeidentificacion, numeroidentificacion)
-- ON DELETE SET NULL;


-- CONSTRUCCIÓN
-- 1. CREACION DE TABLAS
CREATE TABLE vendedores (
    tipodeidentificacion VARCHAR2(2) NOT NULL,
    numeroidentificacion VARCHAR2(50) NOT NULL,
    nombre VARCHAR2(100) NOT NULL,
    apellido VARCHAR2(100) NOT NULL,
    correo VARCHAR2(100) NOT NULL,
    paisOrigen VARCHAR2(2) NOT NULL
);
-- Para hacer las acciones se declaran las primarias
ALTER TABLE vendedores
ADD CONSTRAINT pk_vendedores PRIMARY KEY (tipodeidentificacion, numeroidentificacion);

CREATE TABLE registroProductos (
    tipodeidentificacion VARCHAR2(2) NOT NULL,
    numeroidentificacion VARCHAR2(50) NOT NULL,
    id VARCHAR2(32) NOT NULL,
    cantidad NUMBER NOT NULL
);
-- Para hacer las acciones se declaran las primarias
ALTER TABLE registroProductos
ADD CONSTRAINT pk_registroProductos PRIMARY KEY (tipodeidentificacion, numeroidentificacion);


CREATE TABLE productos (
    id VARCHAR2(32) NOT NULL PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    precio FLOAT NOT NULL,
    pais VARCHAR(2),
    categoria VARCHAR2(32) NOT NULL,
    impuesto VARCHAR2(10) UNIQUE NOT NULL,
    garantia VARCHAR2(32) UNIQUE NOT NULL
);

CREATE TABLE impuestos (
    id VARCHAR2(10) NOT NULL PRIMARY KEY,
    porcentaje REAL NOT NULL,
    pais VARCHAR2(10) NOT NULL,
    descripcion VARCHAR2(50) NOT NULL
);

CREATE TABLE categorias (
    id VARCHAR2(32) NOT NULL PRIMARY KEY,
    nombre VARCHAR2(50) UNIQUE NOT NULL,
    descripcion VARCHAR2(50) NOT NULL
);

CREATE TABLE garantias (
    codigoGarantia VARCHAR2(32) NOT NULL PRIMARY KEY,
    empresa VARCHAR2(100) UNIQUE NOT NULL,
    codigoBono VARCHAR2(10) UNIQUE NOT NULL,
    duracion VARCHAR2(20) NOT NULL,
    tipo VARCHAR2(50) NOT NULL,
    respuesta VARCHAR2(50) NOT NULL,
    cobertura VARCHAR2(100) NOT NULL
);

CREATE TABLE serviciosMantenimiento (
    empresa VARCHAR2(100) NOT NULL PRIMARY KEY,
    direccion VARCHAR2(50) NOT NULL,
    telefono VARCHAR2(10) NOT NULL
);

CREATE TABLE bonos (
    id VARCHAR2(32) NOT NULL PRIMARY KEY,
    valor NUMBER(10,2) NOT NULL,
    fechaInicial DATE NOT NULL,
    fechaFinal DATE NOT NULL,
    estado VARCHAR2(1) NOT NULL
);

CREATE TABLE tangibles (
    id VARCHAR2(32) NOT NULL PRIMARY KEY,
    peso NUMBER(10,2) NOT NULL,
    estado VARCHAR2(20) NOT NULL
);

DROP TABLE tangibles; DROP TABLE vendedoress;DROP TABLE vendedores; DROP TABLE registroProductos; DROP TABLE productos; DROP TABLE impuestos; DROP TABLE categorias; DROP TABLE garantias; DROP TABLE serviciosMantenimiento; DROP TABLE bonos;

-- 2. IMPLEMENTACION DE RESTRIICCIONES DECLARATIVAS

-- EXTRAS: definiciones dentro del astah
-- TEstado
ALTER TABLE tangibles
ADD CONSTRAINT ck_tangibles_estado CHECK (estado IN ('nuevo', 'reacondicionado', 'usado'));
-- TKilos
ALTER TABLE tangibles
ADD CONSTRAINT ck_tangibles_peso CHECK (peso > 0);
-- TtipoIdentificacion
ALTER TABLE vendedores
ADD CONSTRAINT ck_vendedores_tipoIdentificacion CHECK (tipodeidentificacion IN ('CC', 'CE', 'TI', 'PP'));

ALTER TABLE registroProductos
ADD CONSTRAINT ck_registroProductos_tipoIdentificacion CHECK (tipodeidentificacion IN ('CC', 'CE', 'TI', 'PP'));


-- 1. El tipo de dato UUID es una cadena de exactamente 32 caracteres y debe contener 4 guiones (‘-’).
ALTER TABLE productos
ADD CONSTRAINT ck_producto_uuid CHECK (LENGTH(id) = 32 AND id LIKE '%-%-%-%-%');

ALTER TABLE garantias
ADD CONSTRAINT ck_garantia_uuid CHECK (LENGTH(codigoGarantia) = 32 AND codigoGarantia LIKE '%-%-%-%-%');

ALTER TABLE bonos
ADD CONSTRAINT ck_bono_uuid CHECK (LENGTH(id) = 32 AND id LIKE '%-%-%-%-%');

ALTER TABLE categorias
ADD CONSTRAINT ck_categoria_uuid CHECK (LENGTH(id) = 32 AND id LIKE '%-%-%-%-%');

ALTER TABLE tangibles
ADD CONSTRAINT ck_tangible_uuid CHECK (LENGTH(id) = 32 AND id LIKE '%-%-%-%-%');

-- 2. El tipo de garantía es por daño o defecto.
ALTER TABLE garantias
ADD CONSTRAINT ck_garantia_tipo CHECK (tipo IN ('daño', 'defecto'));

-- 3. No pueden existir más de 30 productos reacondicionados
CREATE OR REPLACE TRIGGER tg_tangibles_reacondicionados
BEFORE INSERT ON productos
FOR EACH ROW
DECLARE
    reacondicionados NUMBER;
BEGIN
    SELECT COUNT(*) INTO reacondicionados
    FROM tangibles 
    WHERE estado = 'reacondicionado';

    IF reacondicionados > 30 THEN
        RAISE_APPLICATION_ERROR(-20000, 'No pueden existir más de 30 productos reacondicionados');
    END IF;
END;
/

-- 4. La garantía de un producto puede generar un bono o un servicio de mantenimiento pero no los dos.
CREATE TRIGGER tg_garantia_bonoServicio
BEFORE INSERT ON garantias
FOR EACH ROW
BEGIN
    IF :NEW.codigoBono IS NOT NULL AND :NEW.empresa IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'La garantía de un producto puede generar un bono o un servicio de mantenimiento pero no los dos');
    END IF;
END;
/


-- IMPLEMENTACION DE RESTRICCIONES PROCEDIMENTALES
-- ADICIONAR
-- 1. Las garantías de los productos que pertenecen a la categoría de electrónicos tienen una duración de 12 meses.
CREATE TRIGGER tg_garantia_electronicos
BEFORE INSERT ON productos
FOR EACH ROW
DECLARE
    categoria VARCHAR2(32);
BEGIN
    SELECT categoria INTO categoria 
    FROM productos 
    WHERE id = :NEW.id;

    IF categoria = 'electronicos' THEN
        :NEW.garantia := 12;
    END IF;
END;
/

-- 2. Al registrar un bono se debe verificar que las fechas iniciales y finales sean posteriores a la fecha actual y el estado del bono falso porque no ha sido cobrado.

CREATE TRIGGER tg_bono_fechaEstado
BEFORE INSERT ON bonos
FOR EACH ROW
BEGIN
    IF :NEW.estado = 'T' THEN
        RAISE_APPLICATION_ERROR(-20002, 'El bono ya fue cobrado');
    END IF;

    IF :NEW.fechaInicial < SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20003, 'La fecha inicial no puede ser menor a la fecha actual');
    ELSE IF :NEW.fechaFinal < SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20004, 'La fecha final no puede ser menor a la fecha actual');
    END IF;
    END IF;
END;
/

-- 3. Para registrar un producto solo basta con indicarle el nombre del país al que pertenece si no se envía la información se asume que no tiene impuesto
CREATE TRIGGER tg_producto_impuesto
BEFORE INSERT ON productos
FOR EACH ROW
BEGIN
    IF :NEW.pais IS NULL THEN
        :NEW.impuesto := NULL;
    END IF;
END;
/

-- MODIFICAR
-- 1. No se puede modificar un impuesto que tenga productos asociados.
ALTER TABLE productos
ADD CONSTRAINT fk_impuestos_productos
FOREIGN KEY (impuesto) REFERENCES impuestos(id);

-- 2. No se pueden modificar las garantías que son por reparación
CREATE TRIGGER tg_garantia_tipo
BEFORE UPDATE ON garantias
FOR EACH ROW
BEGIN
    IF :OLD.tipo = 'reparacion' THEN
        RAISE_APPLICATION_ERROR(-20006, 'No se puede modificar la garantía porque es por reparación');
    END IF;
END;
/

-- ELIMINAR
-- 1. Al eliminar un producto se deben eliminar sus garantías
ALTER TABLE garantias
ADD CONSTRAINT fk_garantias_productos
FOREIGN KEY (codigoGarantia) REFERENCES productos(id)
ON DELETE CASCADE;

-- 2. Si un vendedor abandona la organización se debe mantener los registros de sus ventas de productos.
ALTER TABLE registroProductos
ADD CONSTRAINT fk_registroProductos_vendedores
FOREIGN KEY (tipodeidentificacion, numeroidentificacion) REFERENCES vendedores(tipodeidentificacion, numeroidentificacion)
ON DELETE SET NULL;

DROP TRIGGER tg_garantia_electronicos; DROP TRIGGER tg_bono_fechaEstado; DROP TRIGGER tg_producto_impuesto; DROP TRIGGER tg_impuesto_productos; DROP TRIGGER tg_garantia_tipo; DROP TRIGGER tg_tangibles_reacondicionados; DROP TRIGGER tg_garantia_bonoServicio;