---------- CODE START ----------

/*
Algunas cosas que podemos meter
*/


-- CICLO 2: Tuplas

-- 1. 

-- [Código]

-- 2. 

-- [Código]

-- 3. 

-- [Código]

COMMIT;



-- CICLO 2: Acciones

-- 1. 

-- [Código]

-- 2. 

-- [Código]

-- 3. 

-- [Código]

COMMIT;



-- CICLO 2: Disparadores (Triggers)

-- 1. Solo se puede elegir el envio o el punto de recogida (no ambos) (XOR)
-- Pendiente a ver su funcionamiento

CREATE OR REPLACE TRIGGER TG_ENVIO_MODO1
BEFORE INSERT ON Envios
FOR EACH ROW
DECLARE
    pago_pr VARCHAR2(10);
BEGIN
    SELECT pago INTO pago_pr
    FROM PuntosRecogidas
    WHERE pago = :NEW.pago;

    IF pago_pr IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20100, 'No se puede elegir el envio y el punto de recogida al mismo tiempo');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_ENVIO_MODO2
BEFORE INSERT ON PuntosRecogidas
FOR EACH ROW
DECLARE
    pago_en VARCHAR2(10);
BEGIN
    SELECT pago INTO pago_en
    FROM Envios
    WHERE pago = :NEW.pago;

    IF pago_en IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20100, 'No se puede elegir el envio y el punto de recogida al mismo tiempo');
    END IF;
END;
/

-- 2. No se puede generar un envío si el estado del pago es diferente de 'Aprobado'

CREATE OR REPLACE TRIGGER TG_ENVIOS_PAGO_BI
BEFORE INSERT ON Envios
FOR EACH ROW
DECLARE
    v_estado_pago VARCHAR2(20);
BEGIN
    SELECT estado INTO v_estado_pago
    FROM Pagos
    WHERE id = :NEW.pago;

    IF v_estado_pago <> 'Aprobado' THEN
        RAISE_APPLICATION_ERROR(-20201, 'No se puede generar el envío, ya que el estado del pago es diferente de "Aprobado".');
    END IF;
END;
/

-- 3. El estado de las devoluciones se actualiza automaticamente en funcion de la devolucion.

CREATE OR REPLACE TRIGGER TG_DEVOLUCION_ESTADO_AI
AFTER UPDATE ON Devoluciones
FOR EACH ROW
DECLARE
    id_envios VARCHAR2(20);
    id_puntos VARCHAR2(20);
BEGIN
    SELECT id
    INTO id_envios
    FROM Envios
    WHERE devolucion = :NEW.id;

    SELECT id
    INTO id_puntos
    FROM PuntosRecogidas
    WHERE devolucion = :NEW.id;

    IF id_puntos IS NOT NULL THEN
        UPDATE PuntosRecogidas
        SET estado = 'Devuelto'
        WHERE devolucion = :NEW.id;
    END IF;

    IF id_envios IS NOT NULL THEN
        UPDATE Envios
        SET estado = 'Devuelto'
        WHERE devolucion = :NEW.id;
    END IF;
END;
/

-- 4. Si un envío es estándar, no puede ser digital y viceversa

CREATE OR REPLACE TRIGGER TG_ENVIO_DIGITAL_BI_BU
BEFORE INSERT OR UPDATE ON Digitales
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Estandares
    WHERE id = :NEW.id;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El envío no puede ser digital y estándar al mismo tiempo.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_ENVIO_ESTANDAR_BI_BU
BEFORE INSERT OR UPDATE ON Estandares
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Digitales
    WHERE id = :NEW.id;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'El envío no puede ser estándar y digital al mismo tiempo.');
    END IF;
END;
/

-- 5. No se puede devolver un envio que ya se devolvio.

CREATE OR REPLACE TRIGGER TG_DEVOLUCION_UNICA_BI
BEFORE INSERT ON Devoluciones
FOR EACH ROW
DECLARE
    id_puntos VARCHAR(20);
    id_envios VARCHAR(20);
BEGIN

    SELECT id INTO id_puntos 
    FROM PuntosRecogidas 
    WHERE devolucion = :NEW.id;

    SELECT id INTO id_envios 
    FROM Envios 
    WHERE devolucion = :NEW.id;

    IF id_puntos IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20100, 'No se puede devolver un envio que ya se devolvio');
    END IF;

    IF id_envios IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20100, 'No se puede devolver un envio que ya se devolvio');
    END IF;
END;
/

-- 6. Solo se puede eliminar un repartidor que no tenga envíos pendientes

CREATE OR REPLACE TRIGGER TG_REPARTIDOR_ELIMINAR_BD
BEFORE DELETE ON Repartidores
FOR EACH ROW
DECLARE
    envios_pendientes NUMBER;
BEGIN
    SELECT COUNT(*) INTO envios_pendientes
    FROM Estandares es
    JOIN Envios en ON es.id = en.id 
    WHERE es.repartidor = :OLD.id AND en.estado != 'Entregado';

    IF envios_pendientes > 0 THEN
        RAISE_APPLICATION_ERROR(-20216, 'No se puede eliminar un repartidor con envios pendientes.');
    END IF;
END;
/

COMMIT;



-- CICLO 2: XDisparadores
/*
DROP TRIGGER TG_ENVIO_MODO1;
DROP TRIGGER TG_ENVIO_MODO2;
DROP TRIGGER TG_ENVIOS_PAGO_BI;
DROP TRIGGER TG_DEVOLUCION_ESTADO_AI;
DROP TRIGGER TG_ENVIO_DIGITAL_BI_BU;
DROP TRIGGER TG_ENVIO_ESTANDAR_BI_BU;
DROP TRIGGER TG_DEVOLUCION_UNICA_BI;
DROP TRIGGER TG_REPARTIDOR_ELIMINAR_BD;
COMMIT;
*/
---------- CODE END ----------