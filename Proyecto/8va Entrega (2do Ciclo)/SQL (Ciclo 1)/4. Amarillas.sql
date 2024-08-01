---------- CODE START ----------

-- CICLO 1: CRUDE

-- 1. Especificacion Paquete de Usuarios

CREATE OR REPLACE PACKAGE PC_USUARIOS AS
    PROCEDURE INSERTAR_USUARIO (
        u_nombre IN VARCHAR2,
        u_correo IN VARCHAR2,
        u_celular IN NUMBER, 
        u_direccion IN VARCHAR2,
        u_nit IN VARCHAR2 DEFAULT NULL
    );
    PROCEDURE ACTUALIZAR_USUARIO (
        u_nombre IN VARCHAR2, 
        u_correo IN VARCHAR2, 
        u_celular IN NUMBER, 
        u_direccion IN VARCHAR2
    );
    PROCEDURE ELIMINAR_USUARIO (
        u_nombre IN VARCHAR2
    );
    PROCEDURE CONSULTAR_USUARIO (
        u_nombre IN VARCHAR2
    );

    PROCEDURE CONSULTAR_COMPRADOR (
        c_nombre IN VARCHAR2
    );
    PROCEDURE CONSULTAR_VENDEDOR (
        v_nombre IN VARCHAR2
    );
    PROCEDURE MODIFICAR_VENDEDOR (
        v_nombre IN VARCHAR2, 
        u_nit IN VARCHAR2,
        u_tipo IN VARCHAR2
    );

    -- Cursores
    CURSOR c_usuario(u_nombre VARCHAR2) IS
        SELECT * FROM Usuarios WHERE nombre = u_nombre;
    CURSOR c_vendedor(v_id VARCHAR2) IS
    SELECT * FROM Vendedores WHERE id = v_id;
    CURSOR c_comprador(c_id VARCHAR2) IS
    SELECT * FROM Compradores WHERE id = c_id;
        
END PC_USUARIOS;
/

-- 2. Especificacion Paquete de Productos 

CREATE OR REPLACE PACKAGE PC_PRODUCTOS AS
    PROCEDURE OFRECER_PRODUCTO (
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
    );
    PROCEDURE ACTUALIZAR_PRODUCTO (
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
    );

    PROCEDURE INSERTAR_GENEROS (
        g_genero IN VARCHAR2
    );
    PROCEDURE ACTUALIZAR_GENEROS (
        g_nuevo_genero IN VARCHAR2,
        g_genero IN VARCHAR2
    );
    PROCEDURE ELIMINAR_GENERO (
        g_genero IN VARCHAR2
    );

    PROCEDURE CONSULTAR_GENERO;

    PROCEDURE INSERTAR_PLATAFORMAS (
        p_plataforma IN VARCHAR2
    );
    PROCEDURE ACTUALIZAR_PLATAFORMAS (
        p_plataforma IN VARCHAR2,
        p_nueva_plataforma IN VARCHAR2
    );
    PROCEDURE ELIMINAR_PLATAFORMAS (
        p_plataforma IN VARCHAR2
    );
    PROCEDURE CONSULTAR_PLATAFORMAS;

    PROCEDURE ELIMINAR_PRODUCTO (
        p_nombre IN VARCHAR2
    );

    PROCEDURE CONSULTAR_PRODUCTO (
        p_nombre IN VARCHAR2
    );

    CURSOR c_producto(p_nombre VARCHAR2) IS
        SELECT * FROM productos WHERE p_nombre = nombre;
    CURSOR c_genero IS
    SELECT * FROM Generos;
    CURSOR c_plataforma IS
    SELECT plataforma FROM plataformas;
END PC_PRODUCTOS;
/

-- 3. Especificacion Paquete de Wishlists

CREATE OR REPLACE PACKAGE PC_WISHLIST AS
    PROCEDURE AGREGAR_PRODUCTO_WISHLIST (
        nombre_comprador IN VARCHAR2,
        nombre_producto IN VARCHAR2,
        w_prioridad IN VARCHAR2,
        w_cantidad IN NUMBER
    );
    PROCEDURE ACTUALIZAR_WISHLIST (
        nombre_comprador IN VARCHAR2,
        nombre_producto IN VARCHAR2,
        w_prioridad IN VARCHAR2,
        w_cantidad IN NUMBER
    );
    PROCEDURE ELIMINAR_WISHLIST (
        p_nombre IN VARCHAR2,
        nombre_comprador IN VARCHAR2
    );
    PROCEDURE CONSULTAR_WISHLIST (
        p_nombre IN VARCHAR2
    );
    
    CURSOR wishlists_cursor IS
    SELECT wishlist, producto, prioridad, cantidad
    FROM WishListsXProductos;
END PC_WISHLIST;
/

-- 4. Especificacion Paquete de Intercambios

CREATE OR REPLACE PACKAGE PC_INTERCAMBIOS AS
    PROCEDURE INSERTAR_INTERCAMBIO(
        nombre_comprador1 IN VARCHAR2,
        nombre_producto1 IN VARCHAR2,
        p_cantidad1 IN NUMBER,
        nombre_comprador2 IN VARCHAR2,
        nombre_producto2 IN VARCHAR2,
        p_cantidad2 IN NUMBER
    );
    PROCEDURE ACTUALIZAR_INTERCAMBIO (
        I_id IN VARCHAR2,
        p_precio_producto1 IN VARCHAR2,
        p_cantidad1 IN NUMBER,
        p_precio_producto2 IN VARCHAR2,
        p_cantidad2 IN NUMBER
    );
    PROCEDURE CONSULTAR_COMPRADORESXPRODUCTOS (
        nombre_comprador IN VARCHAR2,
        nombre_producto IN VARCHAR2
    );
    PROCEDURE CONSULTAR_INTERCAMBIOS (
        I_id IN VARCHAR2
    );

    CURSOR compradores_cursor IS
    SELECT (SELECT nombre FROM usuarios WHERE Usuarios.id = CompradoresXProductos.comprador), 
            (SELECT nombre FROM productos WHERE Productos.id = CompradoresXProductos.producto)
    FROM CompradoresXProductos;
    CURSOR c_intercambio (Inter VARCHAR2) IS
        SELECT * FROM Intercambios WHERE id = Inter;
    
END PC_INTERCAMBIOS;
/

-- 5. Especificacion Paquete Calificaciones

CREATE OR REPLACE PACKAGE PC_CALIFICACIONES AS
    PROCEDURE INSERTAR_CALIFICACION (
        nombre_comprador IN VARCHAR2,
        nombre_producto IN VARCHAR2,
        c_estrellas IN NUMBER,
        c_comentario IN VARCHAR2
    );
    PROCEDURE ACTUALIZAR_CALIFICACION (
        nombre_comprador IN VARCHAR2,
        nombre_producto IN VARCHAR2,
        c_comentario IN VARCHAR2
    );
    PROCEDURE CONSULTAR_CALIFICACION (
        nombre_comprador IN VARCHAR2,
        nombre_producto IN VARCHAR2
    );

    CURSOR c_calificacion(p_comprador VARCHAR2, p_producto VARCHAR2) IS
    SELECT * FROM Calificaciones WHERE comprador = p_comprador AND producto = p_producto;

END PC_CALIFICACIONES;
/

-- 6. Especificacion Paquete de Pagos

CREATE OR REPLACE PACKAGE PC_PAGOS AS
    PROCEDURE REALIZAR_PAGO_INTERCAMBIO(
        id_pago IN VARCHAR2,
        nombre_comprador IN VARCHAR2
    );
    
    PROCEDURE CONSULTAR_PAGOS(
        id IN VARCHAR2
    );
    PROCEDURE MODIFICAR_PAGOS(
        p_id IN VARCHAR2,
        p_metodo IN VARCHAR2
    );

    CURSOR pagos_cursor IS
    SELECT id, metodo, total, fecha, estado, intercambio
    FROM Pagos;

END PC_PAGOS;
/



-- CICLO 1: CRUDI

-- 1. Implementación del Paquete de Usuarios

CREATE OR REPLACE PACKAGE BODY PC_USUARIOS AS
    PROCEDURE INSERTAR_USUARIO (
        u_nombre IN VARCHAR2,
        u_correo IN VARCHAR2,
        u_celular IN NUMBER,
        u_direccion IN VARCHAR2,
        u_nit IN VARCHAR2 DEFAULT NULL
    ) IS
        u_id NUMBER;
    BEGIN
        -- Generar un nuevo ID autoincremental para el nuevo usuario
        SELECT NVL(MAX(TO_NUMBER(id)), 0) + 1 INTO u_id FROM Usuarios;

        -- Insertar un nuevo usuario en la tabla Usuarios
        INSERT INTO Usuarios (id, nombre, correo, celular, direccion, registro, estado)
        VALUES (LPAD(u_id, 10, '0'), u_nombre, u_correo, u_celular, u_direccion, SYSDATE, 'A');

        -- Crear un nuevo perfil de vendedor
        INSERT INTO Vendedores (id, nit, tipo) VALUES (LPAD(u_id, 10, '0'), u_nit, 'Persona');

        -- Crear un nuevo perfil de comprador con wishlist
        INSERT INTO Compradores (id, experiencia) VALUES (LPAD(u_id, 10, '0'), 'Ninguna');
        INSERT INTO WishLists (id, estado) VALUES (LPAD(u_id, 10, '0'), 'A');
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La inscripcion del usuario no se pudo completar debido a un error inesperado.');
    END INSERTAR_USUARIO;


    PROCEDURE ACTUALIZAR_USUARIO (
        u_nombre IN VARCHAR2,
        u_correo IN VARCHAR2,
        u_celular IN NUMBER,
        u_direccion IN VARCHAR2
    ) AS
        id_usuario VARCHAR2(10);
    BEGIN
        -- Buscar el ID del vendedor
        SELECT id INTO id_usuario
        FROM Usuarios
        WHERE nombre = u_nombre;

        -- Actualizar los datos del usuario
        IF u_correo IS NOT NULL OR u_celular IS NOT NULL OR u_direccion IS NOT NULL THEN
        UPDATE Usuarios
        SET 
            correo = NVL(u_correo, correo), 
            celular = NVL(u_celular, celular), 
            direccion = NVL(u_direccion, direccion)
        WHERE id = id_usuario;
            DBMS_OUTPUT.PUT_LINE('Usuario actualizado correctamente.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('No se proporcionaron campos para actualizar.');
        END IF;
        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Usuario no encontrado.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La actualizacion del usuario no se pudo completar debido a un error inesperado.');
    END ACTUALIZAR_USUARIO;    
    

    PROCEDURE ELIMINAR_USUARIO (u_nombre IN VARCHAR2) AS
        id_usuario VARCHAR2(10);
    BEGIN
        SELECT id INTO id_usuario
        FROM Usuarios
        WHERE nombre = u_nombre;

        DELETE FROM usuarios WHERE nombre = u_nombre;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La ELIMINACION del usuario no se pudo completar debido a un error inesperado.');
    END ELIMINAR_USUARIO;


    PROCEDURE CONSULTAR_USUARIO(u_nombre IN VARCHAR2) AS
        v_usuario Usuarios%ROWTYPE;
    BEGIN
        -- Abrir el cursor
        OPEN c_usuario(u_nombre);
        
        -- Obtener la informacion del usuario
        FETCH c_usuario INTO v_usuario;
        
        -- Verificar si se obtuvo alguna fila
        IF c_usuario%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_usuario.id);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_usuario.nombre);
        DBMS_OUTPUT.PUT_LINE('Correo: ' || v_usuario.correo);
        DBMS_OUTPUT.PUT_LINE('Celular: ' || v_usuario.celular);
        DBMS_OUTPUT.PUT_LINE('Direccion: ' || v_usuario.direccion);
        DBMS_OUTPUT.PUT_LINE('Fecha de Registro: ' || TO_CHAR(v_usuario.registro, 'DD-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Estado: ' || v_usuario.estado);
        ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontro un usuario con nombre ' || u_nombre);
        END IF;
        
        -- Cerrar el cursor
        CLOSE c_usuario;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Usuario no encontrado.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La consulta del usuario no se pudo completar debido a un error inesperado.');
    END CONSULTAR_USUARIO;


    PROCEDURE CONSULTAR_COMPRADOR (c_nombre IN VARCHAR2) AS
        v_comprador Compradores%ROWTYPE;
        p_id VARCHAR2(10);
    BEGIN
        -- Buscar el ID del vendedor
        SELECT id INTO p_id
        FROM Usuarios
        WHERE nombre = c_nombre;

        -- Abrir el cursor
        OPEN c_comprador(p_id);
        
        -- Obtener la informacion del comprador
        FETCH c_comprador INTO v_comprador;
        
        -- Verificar si se obtuvo alguna fila
        IF c_comprador%FOUND THEN
            DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_comprador.id);
            DBMS_OUTPUT.PUT_LINE('Experiencia: ' || v_comprador.experiencia);
        ELSE
            DBMS_OUTPUT.PUT_LINE('No se encontro un comprador con ID ' || p_id);
        END IF;
        
        -- Cerrar el cursor
        CLOSE c_comprador;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Usuario no encontrado.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La consulta del usuario no se pudo completar debido a un error inesperado.');
    END CONSULTAR_COMPRADOR;


    PROCEDURE CONSULTAR_VENDEDOR (v_nombre IN VARCHAR2) AS
            v_vendedor Vendedores%ROWTYPE;
            p_id VARCHAR2(10);
    BEGIN
        -- Buscar el ID del vendedor
        SELECT id INTO p_id
        FROM Usuarios
        WHERE nombre = v_nombre;

        -- Abrir el cursor
        OPEN c_vendedor(p_id);
        
        -- Obtener la informacion del vendedor
        FETCH c_vendedor INTO v_vendedor;
        
        -- Verificar si se obtuvo alguna fila
        IF c_vendedor%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_vendedor.id);
        DBMS_OUTPUT.PUT_LINE('NIT: ' || v_vendedor.nit);
        DBMS_OUTPUT.PUT_LINE('Tipo: ' || v_vendedor.tipo);
        ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontro un vendedor con ID ' || p_id);
        END IF;
        
        -- Cerrar el cursor
        CLOSE c_vendedor;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Usuario no encontrado.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La consulta del usuario no se pudo completar debido a un error inesperado.');
    END CONSULTAR_VENDEDOR;


    PROCEDURE MODIFICAR_VENDEDOR (v_nombre IN VARCHAR2, u_nit IN VARCHAR2, u_tipo IN VARCHAR2) AS
        p_id VARCHAR2(10);
    BEGIN
        -- Buscar el ID del vendedor
        SELECT id INTO p_id
        FROM Usuarios
        WHERE nombre = v_nombre;
        UPDATE vendedores
        SET nit = NVL(u_nit, nit), 
            tipo = NVL(u_tipo, tipo)
        WHERE id = p_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Usuario no encontrado.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La actualizacion del usuario no se pudo completar debido a un error inesperado.');
    END MODIFICAR_VENDEDOR;
END PC_USUARIOS;
/

-- 2. Implementación del Paquete de Productos 

CREATE OR REPLACE PACKAGE BODY PC_PRODUCTOS AS
    PROCEDURE OFRECER_PRODUCTO (
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

        -- Insertar datos adicionales del producto segun su tipo
        IF p_tipo LIKE '%Juego%' THEN
            INSERT INTO Juegos (id, desarrollador, lanzamiento) VALUES (LPAD(p_id, 10, '0'), NULL, NULL);
        ELSIF p_tipo LIKE '%Clave%' THEN
            INSERT INTO Claves (id, tipo, vencimiento) VALUES (LPAD(p_id, 10, '0'), 'Por definir', SYSDATE);
        END IF;

        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20102, 'No se encontro el vendedor o productos especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20012, 'El ofrecimiento del producto no se pudo completar debido a un error inesperado.');
        ROLLBACK;
    END OFRECER_PRODUCTO;

    PROCEDURE ACTUALIZAR_PRODUCTO (
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
        p_id VARCHAR2(15);
        id_vendedor VARCHAR2(10);
    BEGIN
        -- Buscar el ID del producto
        SELECT id INTO p_id
        FROM productos
        WHERE nombre = p_nombre;

        -- Buscar id del vendedor
        SELECT id INTO id_vendedor
        FROM Usuarios
        WHERE nombre = nombre_vendedor;

        -- Actualizar los datos del producto
        UPDATE productos 
        SET 
            nombre = NVL(p_nombre, nombre),
            descripcion = NVL(p_descripcion, descripcion),
            condicion = NVL(p_condicion, condicion),
            disponibilidad = NVL(p_disponibilidad, disponibilidad),
            imagen = NVL(p_imagen, imagen)
        WHERE p_id = id;
        
        -- Actualizar los datos del producto en Ofrecimientos
        UPDATE ofrecimientos
        SET 
            vendedor = NVL(id_vendedor, vendedor),
            precio = NVL(p_precio, precio), 
            cantidad = NVL(p_cantidad, cantidad)
        WHERE p_id = ofrecimientos.producto;

        -- Actualizar los datos del producto en GenerosXProductos
        UPDATE generosxproductos
        SET
            genero = NVL(p_genero, genero) 
        WHERE p_id = generosxproductos.producto;

        -- Actualizar los datos del producto en PlataformasXProductos
        UPDATE plataformasxproductos
        SET 
            plataforma = NVL(p_plataforma, plataforma) 
        WHERE p_id = plataformasxproductos.producto;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20102, 'No se encontro el vendedor o productos especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20012, 'La actualizacion del producto no se pudo completar debido a un error inesperado.');
        ROLLBACK;
    END ACTUALIZAR_PRODUCTO;

    PROCEDURE ELIMINAR_PRODUCTO (p_nombre IN VARCHAR2) AS
        p_id VARCHAR2(15);
    BEGIN
        -- Buscar el ID del producto
        SELECT id INTO p_id
        FROM productos
        WHERE nombre = p_nombre;

        DELETE 
        FROM productos 
        WHERE id = p_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20102, 'No se encontro el vendedor o productos especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20012, 'La eliminacion del producto no se pudo completar debido a un error inesperado.');
        ROLLBACK;
    END ELIMINAR_PRODUCTO;

    PROCEDURE CONSULTAR_PRODUCTO (p_nombre IN VARCHAR2) AS
        v_producto Productos%ROWTYPE;
    BEGIN
        -- Abrir el cursor
        OPEN c_producto(p_nombre);
        
        -- Obtener la informacion de los productos
        LOOP
        FETCH c_producto INTO v_producto;
        EXIT WHEN c_producto%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_producto.id);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
        DBMS_OUTPUT.PUT_LINE('Descripcion: ' || v_producto.descripcion);
        DBMS_OUTPUT.PUT_LINE('Condicion: ' || v_producto.condicion);
        DBMS_OUTPUT.PUT_LINE('Imagen: ' || v_producto.imagen);
        DBMS_OUTPUT.PUT_LINE('Disponibilidad: ' || v_producto.disponibilidad);
        DBMS_OUTPUT.PUT_LINE('------------------------------');
        END LOOP;
        
        -- Cerrar el cursor
        CLOSE c_producto;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20102, 'No se encontro el vendedor o productos especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20012, 'La consulta del producto no se pudo completar debido a un error inesperado.');
        ROLLBACK;
    END CONSULTAR_PRODUCTO;
    
    PROCEDURE INSERTAR_GENEROS (g_genero IN VARCHAR2) AS
    BEGIN
        INSERT INTO generos (genero) VALUES (g_genero);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Genero no encontrado.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La insercion del genero no se pudo completar debido a un error inesperado.');
    END INSERTAR_GENEROS;


    PROCEDURE ACTUALIZAR_GENEROS (g_nuevo_genero IN VARCHAR2, g_genero IN VARCHAR2) AS 
    BEGIN
        UPDATE generos 
        SET genero = NVL(g_nuevo_genero, g_genero)
        WHERE genero = g_genero;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Genero no encontrado.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La actualizacion del genero no se pudo completar debido a un error inesperado.');
    END ACTUALIZAR_GENEROS;


    PROCEDURE ELIMINAR_GENERO (g_genero IN VARCHAR2) AS
    BEGIN
        DELETE 
        FROM generos 
        WHERE genero = g_genero;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Genero no encontrado.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La eliminacion del genero no se pudo completar debido a un error inesperado.');
    END ELIMINAR_GENERO;


    PROCEDURE CONSULTAR_GENERO AS
        v_genero Generos%ROWTYPE;
    BEGIN
        -- Abrir el cursor
        OPEN c_genero;
        
        -- Obtener la informacion de los generos
        LOOP
        FETCH c_genero INTO v_genero;
        EXIT WHEN c_genero%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Genero: ' || v_genero.genero);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
        
        -- Cerrar el cursor
        CLOSE c_genero;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Genero no encontrado.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La consulta del genero no se pudo completar debido a un error inesperado.');
    END CONSULTAR_GENERO;
    PROCEDURE INSERTAR_PLATAFORMAS (p_plataforma IN VARCHAR2) AS
    BEGIN
        INSERT INTO plataformas VALUES (p_plataforma);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Plataforma no encontrada.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La insersion de la plataforma no se pudo completar debido a un error inesperado.');
    END INSERTAR_PLATAFORMAS;


    PROCEDURE ACTUALIZAR_PLATAFORMAS (p_plataforma IN VARCHAR2, p_nueva_plataforma IN VARCHAR2) AS
    BEGIN
        UPDATE plataformas 
        SET plataforma = NVL(p_nueva_plataforma, p_plataforma) 
        WHERE plataforma = p_plataforma;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Plataforma no encontrada.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La actualizacion de la plataforma no se pudo completar debido a un error inesperado.');
    END ACTUALIZAR_PLATAFORMAS;

    PROCEDURE ELIMINAR_PLATAFORMAS (p_plataforma IN VARCHAR2) AS
    BEGIN
        DELETE 
        FROM plataformas 
        WHERE plataforma = p_plataforma;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Plataforma no encontrada.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La eliminacion de la plataforma no se pudo completar debido a un error inesperado.');
    END ELIMINAR_PLATAFORMAS;

    PROCEDURE CONSULTAR_PLATAFORMAS AS
        v_plataforma Plataformas%ROWTYPE;
    BEGIN
        -- Abrir el cursor
        OPEN c_plataforma;
        
        -- Obtener la informacion de los generos
        LOOP
        FETCH c_plataforma INTO v_plataforma;
        EXIT WHEN c_plataforma%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Plataforma: ' || v_plataforma.plataforma);
        END LOOP;
        
        -- Cerrar el cursor
        CLOSE c_plataforma;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Genero no encontrado.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'La consulta del genero no se pudo completar debido a un error inesperado.');
    END CONSULTAR_PLATAFORMAS;

END PC_PRODUCTOS;
/

-- 3. Implementación del Paquete de Wishlists

CREATE OR REPLACE PACKAGE BODY PC_WISHLIST AS
    PROCEDURE AGREGAR_PRODUCTO_WISHLIST (
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
            RAISE_APPLICATION_ERROR(-20103, 'No se encontro el vendedor o producto especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20013, 'El producto no pudo ser agregado a la wishlist debido a un error inesperado.');
        ROLLBACK;
    END AGREGAR_PRODUCTO_WISHLIST;

    PROCEDURE ACTUALIZAR_WISHLIST (
        nombre_comprador IN VARCHAR2,
        nombre_producto IN VARCHAR2,
        w_prioridad IN VARCHAR2,
        w_cantidad IN NUMBER
    )AS
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
        
        -- Actualizar el pruducto deseado en la tabla WishListsXProductos
        UPDATE WishListsXProductos 
        SET prioridad = NVL(w_prioridad, prioridad),
            cantidad = NVL(w_cantidad, cantidad)
        WHERE WishListsXProductos.wishlist = id_comprador AND WishListsXProductos.producto = id_producto;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20103, 'No se encontro el vendedor o producto especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20013, 'El producto no pudo ser actualizado a la wishlist debido a un error inesperado.');
        ROLLBACK;
    END ACTUALIZAR_WISHLIST;

    PROCEDURE ELIMINAR_WISHLIST(p_nombre IN VARCHAR2, nombre_comprador IN VARCHAR2) IS
        id_comprador VARCHAR2(10);
        id_producto VARCHAR2(15);
    BEGIN
        SELECT id INTO id_producto
        FROM Productos
        WHERE nombre = p_nombre;

        SELECT id INTO id_comprador 
        FROM Usuarios
        WHERE nombre = nombre_comprador;

        DELETE 
        FROM WISHLISTSXPRODUCTOS
        WHERE wishlist = id_comprador AND producto = id_producto;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20103, 'No se encontro el vendedor o producto especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20013, 'El producto no pudo ser eliminado a la wishlist debido a un error inesperado.');
        ROLLBACK;
    END ELIMINAR_WISHLIST;
    
    PROCEDURE CONSULTAR_WISHLIST(p_nombre IN VARCHAR2) IS
        v_wishlist  WishListsXProductos.wishlist%TYPE;
        v_producto  WishListsXProductos.producto%TYPE;
        v_prioridad WishListsXProductos.prioridad%TYPE;
        v_cantidad  WishListsXProductos.cantidad%TYPE;
        wishlist_id VARCHAR2(10);

        CURSOR filtered_cursor IS
        SELECT wishlist, producto, prioridad, cantidad
        FROM WishListsXProductos
        WHERE wishlist = wishlist_id;
        
    BEGIN
        SELECT id INTO wishlist_id
        FROM Usuarios
        WHERE nombre = p_nombre;

        -- Abrir el cursor filtrado
        OPEN filtered_cursor;
        
        -- Recorrer las filas del cursor
        LOOP
        FETCH filtered_cursor INTO v_wishlist, v_producto, v_prioridad, v_cantidad;
        
        EXIT WHEN filtered_cursor%NOTFOUND;  -- Salir del loop cuando no haya mas filas
        
        -- Procesar cada fila (en este caso, simplemente imprimir los valores)
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Wishlist: ' || v_wishlist);
        DBMS_OUTPUT.PUT_LINE('Producto: ' || v_producto);
        DBMS_OUTPUT.PUT_LINE('Prioridad: ' || v_prioridad);
        DBMS_OUTPUT.PUT_LINE('Cantidad: ' || v_cantidad);
        END LOOP;
        
        -- Cerrar el cursor
        CLOSE filtered_cursor;
    END CONSULTAR_WISHLIST;
END PC_WISHLIST;
/

-- 4. Implementación del Paquete de Intercambios

CREATE OR REPLACE PACKAGE BODY PC_INTERCAMBIOS AS
    PROCEDURE INSERTAR_INTERCAMBIO (
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
        DBMS_OUTPUT.PUT_LINE('El numero de su cuenta de cobro es: ' || LPAD(p_id, 10, '0'));    
        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20104, 'No se encontraron las personas o productos especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'El ofrecimiento del producto no se pudo completar debido a un error inesperado.');
        ROLLBACK;
    END;

    PROCEDURE ACTUALIZAR_INTERCAMBIO (
        I_id IN VARCHAR2,
        p_precio_producto1 IN VARCHAR2,
        p_cantidad1 IN NUMBER,
        p_precio_producto2 IN VARCHAR2,
        p_cantidad2 IN NUMBER
    ) AS
        id_comprador1 VARCHAR2(10);
        id_producto1 VARCHAR2(15);
        id_comprador2 VARCHAR2(10);
        id_producto2 VARCHAR2(15);
        v_costo1 NUMBER;
        v_costo2 NUMBER;
    BEGIN
        -- Buscar los IDs de los compradores
        SELECT comprador1 INTO id_comprador1
        FROM Intercambios
        WHERE id = I_id;

        SELECT id INTO id_comprador2
        FROM Intercambios
        WHERE id = I_id;

        -- Buscar los IDs de los productos
        SELECT id INTO id_producto1
        FROM Intercambios
        WHERE id = I_id;

        SELECT id INTO id_producto2
        FROM Intercambios
        WHERE id = I_id;

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

        -- Actualizar el registro en la tabla Intercambios
        UPDATE Intercambios
        SET 
            producto1 = NVL(id_producto1, producto1),
            cantidad1 = NVL(p_cantidad1, cantidad1), 
            costo1 = NVL(v_costo1, costo1), 
            producto2 = NVL(id_producto2, producto2),
            cantidad2 = NVL(p_cantidad2, cantidad2), 
            costo2 = NVL(v_costo2, costo2)
        WHERE id = I_id;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20104, 'No se encontraron las personas, productos o intercambios especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'El ofrecimiento del producto no se pudo completar debido a un error inesperado.');
        ROLLBACK;
    END ACTUALIZAR_INTERCAMBIO;

    PROCEDURE CONSULTAR_COMPRADORESXPRODUCTOS (
        nombre_comprador IN VARCHAR2,
        nombre_producto IN VARCHAR2
    ) AS
        id_comprador VARCHAR2(10);
        id_producto VARCHAR2(15);
    BEGIN
        
        -- Abrir el cursor
        OPEN compradores_cursor;

        -- Recorrer las filas del cursor
        LOOP
        FETCH compradores_cursor INTO id_comprador, id_producto;
        -- Buscar el ID del comprador
        SELECT id INTO id_comprador
        FROM Usuarios
        WHERE nombre = nombre_comprador;

        -- Buscar el ID del producto
        SELECT id INTO id_producto
        FROM Productos
        WHERE nombre = nombre_producto;
    
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Comprador: ' || nombre_comprador);
        DBMS_OUTPUT.PUT_LINE('Producto: ' || nombre_producto);

        EXIT WHEN compradores_cursor%NOTFOUND;  -- Salir del loop cuando no haya mas filas
        END LOOP;
        
        -- Cerrar el cursor
        CLOSE compradores_cursor;
    END CONSULTAR_COMPRADORESXPRODUCTOS;

    PROCEDURE CONSULTAR_INTERCAMBIOS (I_id IN VARCHAR2) AS
        v_intercambio Intercambios%ROWTYPE;
    BEGIN
        -- Abrir el cursor
        OPEN c_intercambio(I_id);
        
        -- Obtener la informacion del intercambio
        FETCH c_intercambio INTO v_intercambio;
        
        -- Verificar si se obtuvo alguna fila
        IF c_intercambio%FOUND THEN
            DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_intercambio.id);
            DBMS_OUTPUT.PUT_LINE('Estado: ' || v_intercambio.estado);
            DBMS_OUTPUT.PUT_LINE('Fecha: ' || v_intercambio.fecha);
            DBMS_OUTPUT.PUT_LINE('Comprador 1: ' || v_intercambio.comprador1);
            DBMS_OUTPUT.PUT_LINE('Producto 1: ' || v_intercambio.producto1);
            DBMS_OUTPUT.PUT_LINE('Cantidad 1: ' || v_intercambio.cantidad1);
            DBMS_OUTPUT.PUT_LINE('Costo 1: ' || v_intercambio.costo1);
            DBMS_OUTPUT.PUT_LINE('Comprador 2: ' || v_intercambio.comprador2);
            DBMS_OUTPUT.PUT_LINE('Producto 2: ' || v_intercambio.producto2);
            DBMS_OUTPUT.PUT_LINE('Cantidad 2: ' || v_intercambio.cantidad2);
            DBMS_OUTPUT.PUT_LINE('Costo 2: ' || v_intercambio.costo2);
        ELSE
            DBMS_OUTPUT.PUT_LINE('No se encontro un intercambio con ID ' || I_id);
        END IF;
        
        -- Cerrar el cursor
        CLOSE c_intercambio;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20104, 'No se encontro el intercambios especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'El ofrecimiento del producto no se pudo completar debido a un error inesperado.');
            ROLLBACK;
    END CONSULTAR_INTERCAMBIOS;

END PC_INTERCAMBIOS;
/

-- 5. Implementación del Paquete Calificaciones

CREATE OR REPLACE PACKAGE BODY PC_CALIFICACIONES AS
    PROCEDURE INSERTAR_CALIFICACION (
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

        -- Insertar el nuevo registro en la tabla CALIFICACIONES
        INSERT INTO CALIFICACIONES (comprador, producto, estrellas, fecha, comentario)
        VALUES (id_comprador, id_producto, c_estrellas, SYSDATE, c_comentario);

        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20014, 'No se encontro el comprador y/o el producto especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'No fue posible realizar la calificacion del producto debido a un error inesperado.');
    END INSERTAR_CALIFICACION;

    PROCEDURE ACTUALIZAR_CALIFICACION (
        nombre_comprador IN VARCHAR2,
        nombre_producto IN VARCHAR2,
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

        -- Actualizar el comentario de la calificacion
        UPDATE Calificaciones 
        SET comentario = c_comentario
        WHERE id_producto = producto AND id_comprador = comprador;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20014, 'No se encontro el comprador y/o el producto especificados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'No fue posible realizar la actualizacion de la calificacion del producto debido a un error inesperado.');
    END ACTUALIZAR_CALIFICACION;

    PROCEDURE CONSULTAR_CALIFICACION (nombre_comprador IN VARCHAR2, nombre_producto IN VARCHAR2) AS
        v_calificacion Calificaciones%ROWTYPE;
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

        -- Abrir el cursor
        OPEN c_calificacion(id_comprador,id_producto);
        
        -- Obtener la informacion de las calificaciones
        LOOP
        FETCH c_calificacion INTO v_calificacion;
        
        EXIT WHEN c_calificacion%NOTFOUND;  -- Salir del loop cuando no haya mas filas
        
        -- Procesar cada fila (en este caso, simplemente imprimir los valores)
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Comprador: ' || v_calificacion.comprador);
        DBMS_OUTPUT.PUT_LINE('Producto: ' || v_calificacion.producto);
        DBMS_OUTPUT.PUT_LINE('Estrellas: ' || v_calificacion.estrellas);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || v_calificacion.fecha);
        DBMS_OUTPUT.PUT_LINE('Comentario: ' || v_calificacion.comentario);
        END LOOP;
        
        -- Cerrar el cursor
        CLOSE c_calificacion;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20014, 'No se encontro el producto especificado.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'No fue posible consultar la calificacion del producto debido a un error inesperado.');
    END CONSULTAR_CALIFICACION;
END PC_CALIFICACIONES;
/

-- 6. Implementación del Paquete de Pagos

CREATE OR REPLACE PACKAGE BODY PC_PAGOS AS
    
    PROCEDURE REALIZAR_PAGO_INTERCAMBIO (
        id_pago IN VARCHAR2,
        nombre_comprador IN VARCHAR2
    ) AS
        id_comprador VARCHAR2(10);
        estado_actual VARCHAR2(12);
        c_comprador1 VARCHAR2(10);
        c_comprador2 VARCHAR2(10);
        id_intercambio VARCHAR2(10);
    BEGIN
        -- Buscar el ID del comprador
        SELECT id INTO id_comprador
        FROM Usuarios
        WHERE nombre = nombre_comprador;

        -- Obtener información del intercambio
        SELECT p.estado, comprador1, comprador2, p.intercambio INTO estado_actual, c_comprador1, c_comprador2, id_intercambio
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
                UPDATE Intercambios SET estado = 'Aprobado' WHERE id = id_intercambio;
                DBMS_OUTPUT.PUT_LINE('Estado del Pago: Aprobado');
                
                -- Relacionar el comprador1 y producto2 en la tabla CompradoresXProductos
                INSERT INTO CompradoresXProductos (comprador, producto)
                SELECT comprador1, producto2
                FROM Intercambios
                WHERE id = id_intercambio;

                -- Relacionar el comprador2 y producto1 en la tabla CompradoresXProductos
                INSERT INTO CompradoresXProductos (comprador, producto)
                SELECT comprador2, producto1
                FROM Intercambios
                WHERE id = id_intercambio;
            END IF;
        END IF;
        IF id_comprador = c_comprador2 THEN
            IF estado_actual = 'Pendiente' THEN
                UPDATE Pagos SET estado = 'Pendiente 1', fecha = SYSDATE WHERE id = id_pago;
                DBMS_OUTPUT.PUT_LINE('Estado del Pago: Pendiente 2');   
            ELSIF estado_actual = 'Pendiente 2' THEN
                UPDATE Pagos SET estado = 'Aprobado', fecha = SYSDATE WHERE id = id_pago;
                UPDATE Intercambios SET estado = 'Aprobado' WHERE id = id_intercambio;
                DBMS_OUTPUT.PUT_LINE('Estado del Pago: Aprobado');
                                
                -- Relacionar el comprador1 y producto2 en la tabla CompradoresXProductos
                INSERT INTO CompradoresXProductos (comprador, producto)
                SELECT comprador1, producto2
                FROM Intercambios
                WHERE id = id_intercambio;

                -- Relacionar el comprador2 y producto1 en la tabla CompradoresXProductos
                INSERT INTO CompradoresXProductos (comprador, producto)
                SELECT comprador2, producto1
                FROM Intercambios
                WHERE id = id_intercambio;
            END IF;
        END IF;

        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20105, 'No se encontro el comprador especificado.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20015, 'No fue posible realizar el pago debido a un error inesperado.');
        ROLLBACK;
    END REALIZAR_PAGO_INTERCAMBIO;

    PROCEDURE CONSULTAR_PAGOS(id IN VARCHAR2) IS
        -- Variables para almacenar cada fila del cursor
        v_id           Pagos.id%TYPE;
        v_metodo       Pagos.metodo%TYPE;
        v_total        Pagos.total%TYPE;
        v_fecha        Pagos.fecha%TYPE;
        v_estado       Pagos.estado%TYPE;
        v_intercambio  Pagos.intercambio%TYPE;
    BEGIN
        -- Abrir el cursor
        OPEN pagos_cursor;
        
        -- Recorrer las filas del cursor
        LOOP
        FETCH pagos_cursor INTO v_id, v_metodo, v_total, v_fecha, v_estado, v_intercambio;
        
        EXIT WHEN pagos_cursor%NOTFOUND;  -- Salir del loop cuando no haya mas filas
        
        -- Procesar cada fila (en este caso, simplemente imprimir los valores)
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id);
        DBMS_OUTPUT.PUT_LINE('Metodo: ' || v_metodo);
        DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(v_fecha, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Estado: ' || v_estado);
        DBMS_OUTPUT.PUT_LINE('Intercambio: ' || v_intercambio);
        DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
        
        -- Cerrar el cursor
        CLOSE pagos_cursor;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20105, 'No se encontro el pago especificado.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20015, 'No fue posible consultar el pago debido a un error inesperado.');
        ROLLBACK;
    END CONSULTAR_PAGOS;

    PROCEDURE MODIFICAR_PAGOS(p_id IN VARCHAR2, p_metodo IN VARCHAR2) IS
    BEGIN
        UPDATE pagos
        SET metodo = p_metodo
        WHERE id = p_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20105, 'No se encontro el pago especificado.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20015, 'No fue posible modificar el pago debido a un error inesperado.');
        ROLLBACK;
    END MODIFICAR_PAGOS;

END PC_PAGOS;
/


-- CICLO 1: XCRUD
/*
DROP PACKAGE PC_USUARIOS;
DROP PACKAGE BODY PC_USUARIOS;
DROP PACKAGE PC_GENEROS;
DROP PACKAGE BODY PC_GENEROS;
DROP PACKAGE PC_PLATAFORMAS;
DROP PACKAGE BODY PC_PLATAFORMAS;
DROP PACKAGE PC_PRODUCTOS;
DROP PACKAGE BODY PC_PRODUCTOS;
DROP PACKAGE PC_WISHLIST;
DROP PACKAGE BODY PC_WISHLIST;
DROP PACKAGE PC_INTERCAMBIOS;
DROP PACKAGE BODY PC_INTERCAMBIOS;
DROP PACKAGE PC_CALIFICACIONES;
DROP PACKAGE BODY PC_CALIFICACIONES;
DROP PACKAGE PC_PAGOS;
DROP PACKAGE BODY PC_PAGOS;
COOMIT;
*/
---------- CODE END ----------