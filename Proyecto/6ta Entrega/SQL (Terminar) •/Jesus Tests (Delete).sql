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




PROCEDURE COUNSULTAR_INTERCAMBIOS (
    nombre_comprador1 IN VARCHAR2,
    nombre_producto1 IN VARCHAR2,
    nombre_comprador2 IN VARCHAR2,
    nombre_producto2 IN VARCHAR2
) AS
BEGIN
    FOR intercambio IN (SELECT * FROM V_CONSULTAR_INTERCAMBIOS) LOOP
    DBMS_OUTPUT.PUT_LINE('Comprador 1: ' || intercambio.nombre_comprador1 ||
                            ', Comprador 2: ' || intercambio.nombre_comprador2 ||
                            ', Producto 1: ' || intercambio.nombre_producto1 ||
                            ', Producto 2: ' || intercambio.nombre_producto2);
    END LOOP;
END COUNSULTAR_INTERCAMBIOS;



PROCEDURE CONSULTAR_COMPRADORESXPRODUCTOS (
    nombre_comprador IN VARCHAR2,
    nombre_producto IN VARCHAR2
) AS
    id_comprador VARCHAR2(10);
    id_producto VARCHAR2(15);
BEGIN
    -- Buscar el ID del comprador
    SELECT id INTO id_comprador
    FROM Usuarios
    WHERE nombre = nombre_comprador;

    -- Buscar el ID del producto
    SELECT id INTO id_producto
    FROM Productos
    WHERE nombre = nombre_producto;

    -- Consultar los intercambios
    FOR registro IN (SELECT * FROM CONSULTAR_COMPRADOESXPRODUCTOS) LOOP
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Comprador: ' || registro.comprador);
        DBMS_OUTPUT.PUT_LINE('Producto: ' || registro.producto);
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;

END CONSULTAR_COMPRADORESXPRODUCTOS;
*/

    -- Consultar los intercambios
    FOR registro IN (SELECT * FROM CONSULTAR_COMPRADOESXPRODUCTOS) LOOP
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Comprador: ' || registro.comprador);
        DBMS_OUTPUT.PUT_LINE('Producto: ' || registro.producto);
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;

END CONSULTAR_COMPRADORESXPRODUCTOS;
*/
Informe de error -
ORA-06550: line 21, column 1:
PLS-00103: Encountered the symbol "*" 
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:   Refer to the following PL/SQL messages for more
           information about the error.
















































































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