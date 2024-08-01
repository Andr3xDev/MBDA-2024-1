---------- CODE START ----------

-- 1. Count rows inserted

SELECT COUNT(*)
FROM USUARIOS;
-- COMMIT;

-- 2. Show all data from a table

SELECT *
FROM Compradores;

-- 3. Delete data from a column

DELETE FROM usuarios;

-- 4. Tests cases

INSERT INTO Compradores (id, experiencia, wishlist) VALUES ('3674043791', 'Entusiasta', '5653454543');
INSERT INTO Compradores (id, experiencia, wishlist) VALUES ('4880074820', 'Novato', '6238475540');

INSERT INTO USUARIOS (id ,nombre, correo, celular, direccion, estado) 
VALUES ('222130321', NULL, 'asd@1asda.com', 3174547890, 'Calle 1 con 4+0-16', 'A');


















































-- Find out the number of rows in all DB tables

DECLARE
    v_table_name VARCHAR2(100);
    v_row_count NUMBER;
BEGIN
    FOR tables IN (SELECT table_name FROM user_tables) LOOP
        v_table_name := tables.table_name;
        EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || v_table_name INTO v_row_count;
        IF v_row_count > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Tabla: ' || v_table_name || ', Filas: ' || v_row_count);
        END IF;
    END LOOP;
END;
/



-- Delete All Database Objects (EXECUTE ALL FOR A COMPLETE CLEAN)

-- Delete Tables + Indexes
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
---------- CODE END ----------