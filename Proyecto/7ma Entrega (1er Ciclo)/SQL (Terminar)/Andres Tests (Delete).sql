---------- CODE START ----------

-- 1. Count rows inserted

SELECT *
FROM USUARIOS;
-- COMMIT;

-- 2. Show all data from a table

SELECT id
FROM VENDEDORES;

SELECT *
FROM usuarios
WHERE usuarios.id = vendedores.id;

SELECT id
FROM usuarios
WHERE id IN (SELECT id FROM vendedores);
-- 3. Delete data from a column

DELETE FROM Compradores;

-- 4. Tests cases

INSERT INTO productos(nombre, descripcion,condicion,imagen,disponibilidad) 
VALUES ('Producto 1', 'Descripcion 1', 'N', 'https://aa.sad.jpg', 'T');

-- Delete DB

DECLARE
  v_sql VARCHAR2(1000);
BEGIN
  FOR c IN (SELECT Table_Name FROM user_tables) LOOP
    v_sql := 'DROP TABLE ' || c.Table_Name || ' CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/
COMMIT;

DROP PACKAGE BODY PC_AUDITORIA;

---------- CODE END ----------


-- CICLO 1: Transacciones

-- 1. Crear un nuevo usuario

CREATE OR REPLACE PROCEDURE CREAR_USUARIO (
    u_nombre IN VARCHAR2,
    u_correo IN VARCHAR2,
    u_celular IN NUMBER,
    u_direccion IN VARCHAR2
) AS
    u_id NUMBER;
BEGIN
    -- Generar un nuevo ID autoincremental para el nuevo usuario
    SELECT NVL(MAX(TO_NUMBER(id)), 0) + 1 INTO u_id FROM Usuarios;

    -- Insertar un nuevo usuario en la tabla Usuarios
    INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado)
    VALUES (LPAD(u_id, 10, '0'), u_nombre, u_correo, u_celular, u_direccion, SYSDATE, 'A');

    -- Crear un nuevo perfil de vendedor
    INSERT INTO Vendedores (id, tipo) VALUES (LPAD(u_id, 10, '0'), 'Persona');

    -- Crear un nuevo perfil de comprador con wishlist
    INSERT INTO Compradores (id, experiencia) VALUES (LPAD(u_id, 10, '0'), 'Ninguna');
    INSERT INTO WishLists (id, estado) VALUES (LPAD(u_id, 10, '0'), 'A');
 
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20011, 'La inscripción del usuario no se pudo completar debido a un error inesperado.');
END;
/

-- 2. Ofrecer un nuevo producto
-- NOTA: Para ejecutar este procedimiento, primero hay que poblar las tablas Géneros y Plataformas

CREATE OR REPLACE PROCEDURE OFRECER_PRODUCTO (
    nombre_vendedor IN VARCHAR2,
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
    p_condicion IN VARCHAR2,
    p_imagen IN VARCHAR2,
    p_disponibilidad IN VARCHAR2,
    p_precio IN NUMBER,
    p_cantidad IN NUMBER,
    p_tipo IN VARCHAR2,
    p_genero IN VARCHAR2,
    p_plataforma IN VARCHAR2
) AS
    p_id NUMBER;
    id_vendedor VARCHAR2(10);
BEGIN
    -- Buscar el ID del vendedor
    SELECT id INTO id_vendedor
    FROM Usuarios
    WHERE nombre = nombre_vendedor;

    -- Generar un nuevo ID autoincremental para el nuevo producto
    SELECT NVL(MAX(TO_NUMBER(id)), 0) + 1 INTO p_id FROM Productos;

    -- Insertar el nuevo producto en la tabla Productos
    INSERT INTO Productos (id, nombre, descripcion, condicion, imagen, disponibilidad)
    VALUES (LPAD(p_id, 10, '0'), p_nombre, p_descripcion, p_condicion, p_imagen, p_disponibilidad);

    -- Relacionar el nuevo producto en la tabla Ofrecimientos
    INSERT INTO Ofrecimientos (vendedor, producto, precio, cantidad)
    VALUES (id_vendedor, LPAD(p_id, 10, '0'), p_precio, p_cantidad);

    -- Relacionar el nuevo producto en la tabla GenerosXProductos
    INSERT INTO GenerosXProductos (genero, producto) VALUES (p_genero, LPAD(p_id, 10, '0'));

    -- Relacionar el nuevo producto en la tabla PlataformasXProductos
    INSERT INTO PlataformasXProductos (plataforma, producto) VALUES (p_plataforma, LPAD(p_id, 10, '0'));

    -- Insertar datos adicionales del producto según su tipo
    IF p_tipo LIKE '%Juego%' THEN
        INSERT INTO Juegos (id, desarrollador, lanzamiento) VALUES (LPAD(p_id, 10, '0'), NULL, NULL);
    ELSIF p_tipo LIKE '%Clave%' THEN
        INSERT INTO Claves (id, tipo, vencimiento) VALUES (LPAD(p_id, 10, '0'), 'Por definir', SYSDATE);
    END IF;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20102, 'No se encontró el vendedor o productos especificados.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20012, 'El ofrecimiento del producto no se pudo completar debido a un error inesperado.');
    ROLLBACK;
END;
/

-- 3. Agregar un producto a la wishlist

CREATE OR REPLACE PROCEDURE AGREGAR_PRODUCTO_WISHLIST (
    nombre_comprador IN VARCHAR2,
    nombre_producto IN VARCHAR2,
    w_prioridad IN VARCHAR2,
    w_cantidad IN NUMBER
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

    -- Insertar el pruducto deseado en la tabla WishListsXProductos
    INSERT INTO WishListsXProductos (wishlist, producto, prioridad, cantidad)
    VALUES (id_comprador, id_producto, w_prioridad, w_cantidad);

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20103, 'No se encontró el vendedor o producto especificados.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20013, 'El producto no pudo ser agregado a la wishlist debido a un error inesperado.');
    ROLLBACK;
END;
/

-- 4. Intercambiar productos

CREATE OR REPLACE PROCEDURE INTERCAMBIAR_PRODUCTOS (
    nombre_comprador1 IN VARCHAR2,
    nombre_producto1 IN VARCHAR2,
    p_cantidad1 IN NUMBER,
    nombre_comprador2 IN VARCHAR2,
    nombre_producto2 IN VARCHAR2,
    p_cantidad2 IN NUMBER
) AS
    i_id NUMBER;
    p_id NUMBER;
    id_comprador1 VARCHAR2(10);
    id_producto1 VARCHAR2(15);
    id_comprador2 VARCHAR2(10);
    id_producto2 VARCHAR2(15);
    v_costo1 NUMBER;
    v_costo2 NUMBER;
BEGIN
    -- Generar un nuevo ID autoincremental para el intercambio y pago
    SELECT NVL(MAX(TO_NUMBER(id)), 0) + 1 INTO i_id FROM Intercambios;
    SELECT NVL(MAX(TO_NUMBER(id)), 0) + 1 INTO p_id FROM Pagos;

    -- Buscar los IDs de los compradores
    SELECT id INTO id_comprador1
    FROM Usuarios
    WHERE nombre = nombre_comprador1;

    SELECT id INTO id_comprador2
    FROM Usuarios
    WHERE nombre = nombre_comprador2;

    -- Buscar los IDs de los productos
    SELECT id INTO id_producto1
    FROM Productos
    WHERE nombre = nombre_producto1;

    SELECT id INTO id_producto2
    FROM Productos
    WHERE nombre = nombre_producto2;

    -- Calcular el costo del intercambio para cada uno de los compradores
    SELECT precio * p_cantidad1
    INTO v_costo1
    FROM Ofrecimientos
    WHERE vendedor = id_comprador1 AND producto = id_producto1;

    SELECT precio * p_cantidad2
    INTO v_costo2
    FROM Ofrecimientos
    WHERE vendedor = id_comprador2 AND producto = id_producto2;

    IF v_costo1 <= 20000 THEN
        v_costo1 := 5000;
    ELSIF v_costo1 > 20000 AND v_costo1 <= 50000 THEN
        v_costo1 := 10000;
    ELSIF v_costo1 > 50000 AND v_costo1 <= 100000 THEN
        v_costo1 := 15000;
    ELSIF v_costo1 > 100000 AND v_costo1 <= 200000 THEN
        v_costo1 := 20000;
    ELSE
        v_costo1 := 50000;
    END IF;

    IF v_costo2 <= 20000 THEN
        v_costo2 := 5000;
    ELSIF v_costo2 > 20000 AND v_costo2 <= 50000 THEN
        v_costo2 := 10000;
    ELSIF v_costo2 > 50000 AND v_costo2 <= 100000 THEN
        v_costo2 := 15000;
    ELSIF v_costo2 > 100000 AND v_costo2 <= 200000 THEN
        v_costo2 := 20000;
    ELSE
        v_costo2 := 50000;
    END IF;

    -- Insertar un nuevo registro en la tabla Intercambios
    INSERT INTO Intercambios (id, estado, fecha, comprador1, producto1, cantidad1, costo1, comprador2, producto2, cantidad2, costo2)
    VALUES (
        LPAD(i_id, 10, '0'),
        'Pendiente',
        SYSDATE,
        id_comprador1,
        id_producto1,
        p_cantidad1,
        v_costo1,
        id_comprador2,
        id_producto2,
        p_cantidad2,
        v_costo2
    );

    -- Generar la cuenta de cobro en la tabla Pagos
    INSERT INTO Pagos (id, metodo, total, fecha, estado, intercambio)
    VALUES (
        LPAD(p_id, 10, '0'),
        'Transaccion',
        v_costo1 + v_costo2,
        SYSDATE,
        'Pendiente',
        LPAD(i_id, 10, '0')
    );
    DBMS_OUTPUT.PUT_LINE('El número de su cuenta de cobro es: ' || LPAD(p_id, 10, '0'));    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20104, 'No se encontraron las personas o productos especificados.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20014, 'El ofrecimiento del producto no se pudo completar debido a un error inesperado.');
    ROLLBACK;
END;
/

-- 5. Pagar intercambios

CREATE OR REPLACE PROCEDURE REALIZAR_PAGO_INTERCAMBIO (
    id_pago IN VARCHAR2,
    nombre_comprador IN VARCHAR2
) AS
    id_comprador VARCHAR2(10);
    estado_actual VARCHAR2(12);
    c_comprador1 VARCHAR2(10);
    c_comprador2 VARCHAR2(10);
BEGIN
    -- Buscar el ID del comprador
    SELECT id INTO id_comprador
    FROM Usuarios
    WHERE nombre = nombre_comprador;

    -- Obtener información del intercambio
    SELECT p.estado, comprador1, comprador2 INTO estado_actual, c_comprador1, c_comprador2
    FROM Intercambios i
    JOIN Pagos p ON i.id = p.intercambio
    WHERE p.id = id_pago;

    -- Actualizar el estado del pago
    
    IF id_comprador = c_comprador1 THEN
        IF estado_actual = 'Pendiente' THEN
            UPDATE Pagos SET estado = 'Pendiente 2', fecha = SYSDATE WHERE id = id_pago;
            DBMS_OUTPUT.PUT_LINE('Estado del Pago: Pendiente 2');   
        ELSIF estado_actual = 'Pendiente 1' THEN
            UPDATE Pagos SET estado = 'Aprobado', fecha = SYSDATE WHERE id = id_pago;
            UPDATE Intercambios SET estado = 'Aprobado' WHERE id = (SELECT intercambio FROM Pagos WHERE id = id_pago);
            DBMS_OUTPUT.PUT_LINE('Estado del Pago: Aprobado');   
        END IF;
    ELSIF id_comprador = c_comprador2 THEN
        IF estado_actual = 'Pendiente' THEN
            UPDATE Pagos SET estado = 'Pendiente 1', fecha = SYSDATE WHERE id = id_pago;
            DBMS_OUTPUT.PUT_LINE('Estado del Pago: Pendiente 2');   
        ELSIF estado_actual = 'Pendiente 2' THEN
            UPDATE Pagos SET estado = 'Aprobado', fecha = SYSDATE WHERE id = id_pago;
            UPDATE Intercambios SET estado = 'Aprobado' WHERE id = (SELECT intercambio FROM Pagos WHERE id = id_pago);
            DBMS_OUTPUT.PUT_LINE('Estado del Pago: Aprobado');  
        END IF;
    END IF;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20105, 'No se encontró el comprador especificado.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20015, 'No fue posible realizar el pago debido a un error inesperado.');
    ROLLBACK;
END;
/

-- 6. Calificar un producto (Verificar Funcionamiento) =============================================================

CREATE OR REPLACE PROCEDURE CALIFICAR_PRODUCTO (
    nombre_comprador IN VARCHAR2,
    nombre_producto IN VARCHAR2,
    c_estrellas IN NUMBER,
    c_comentario IN VARCHAR2
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

    -- Insertar el nuevo registro en la tabla CompradoresXProductos
    INSERT INTO CompradoresXProductos (comprador, producto, estrellas, fecha, comentario)
    VALUES (id_comprador, id_producto, c_estrellas, SYSDATE, c_comentario);

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20014, 'No se encontró el comprador y/o el producto especificados.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20014, 'No fue posible realizar la calificación del producto debido a un error inesperado.');
END;
/

CREATE OR REPLACE PROCEDURE ACTUALIZAR_USUARIO (
        u_nombre IN VARCHAR2 ,
        u_correo IN VARCHAR2 ,
        u_celular IN NUMBER ,
        u_direccion IN VARCHAR2 ,
        u_estado IN VARCHAR2 
    ) AS
        id_usuario VARCHAR2(10);
    BEGIN
        -- Buscar el ID del vendedor
        SELECT id INTO id_usuario
        FROM Usuarios
        WHERE nombre = u_nombre;

        -- Actualizar los datos del usuario
        UPDATE usuarios
        SET 
            nombre = NVL(u_nombre, nombre), 
            correo = NVL(u_correo, correo), 
            celular = NVL(u_celular, celular), 
            direccion = NVL(u_direccion, direccion), 
            estado = NVL(u_estado, estado)
        WHERE id = id_usuario;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La inscripción del usuario no se pudo completar debido a un error inesperado.');
END ACTUALIZAR_USUARIO;


BEGIN
    ACTUALIZAR_USUARIO(
        u_nombre => 'Armando diasxa',
        u_correo => 'risus3352@outloook.net',
        u_celular => NULL,
        u_direccion => 'ASDDDAS Av. Amassdrica',
        u_estado => 'A'
    );
END;
/



EXECUTE PC_USUARIOS.ACTUALIZAR_USUARIO('Armando diasxa', null, 3213526654, 'ASDDDAS Av. Amrica', 'A');