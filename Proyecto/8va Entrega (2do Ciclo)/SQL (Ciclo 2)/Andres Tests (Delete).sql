---------- CODE START ----------
BEGIN
    FOR rec IN (SELECT table_name FROM user_tables) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || rec.table_name || ' CASCADE CONSTRAINTS';
    END LOOP;
END;
/

-- Delete Views
BEGIN
    FOR rec IN (SELECT view_name FROM user_views) LOOP
        EXECUTE IMMEDIATE 'DROP VIEW ' || rec.view_name;
    END LOOP;
END;
/

-- Delete Packages
BEGIN
    FOR rec IN (SELECT object_name FROM user_objects WHERE object_type = 'PACKAGE') LOOP
        EXECUTE IMMEDIATE 'DROP PACKAGE ' || rec.object_name;
    END LOOP;
END;
/

-- Delete Procedures
BEGIN
    FOR rec IN (SELECT object_name FROM user_objects WHERE object_type = 'PROCEDURE') LOOP
        EXECUTE IMMEDIATE 'DROP PROCEDURE ' || rec.object_name;
    END LOOP;
END;
/

-- Delete Functions
BEGIN
    FOR rec IN (SELECT object_name FROM user_objects WHERE object_type = 'FUNCTION') LOOP
        EXECUTE IMMEDIATE 'DROP FUNCTION ' || rec.object_name;
    END LOOP;
END;
/

-- Delete Secuences
BEGIN
    FOR rec IN (SELECT sequence_name FROM user_sequences) LOOP
        EXECUTE IMMEDIATE 'DROP SEQUENCE ' || rec.sequence_name;
    END LOOP;
END;
/
COMMIT;
-- 
INSERT INTO productos(nombre, descripcion,condicion,imagen,disponibilidad) 
VALUES ('Producto 1', 'Descripcion 1', 'N', 'https://aa.sad.jpg', 'T');

-- Delete DB
DROP PACKAGE BODY PC_AUDITORIA;



INSERT INTO Envios (id, remitente, destinatario, fecha, direccion, repartidor, estado, pago)
VALUES ('000000001', 'Remitente 1', 'Destinatario 1', SYSDATE, 'Direccion 1', 'Repartidor 1', 'P', 'Pago 1');


---------- CODE END ----------