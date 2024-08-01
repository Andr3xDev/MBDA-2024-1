---------- CODE START ----------

--------------------------------------------
-- Prueba de Intercambio entre 2 Usuarios --
--------------------------------------------

-- 1. Creación de 2 usuarios

EXECUTE PC_USUARIOS.INSERTAR_USUARIO ('Andres Rodríguez', 'correo@ejemplo.com', '3158764509', 'Cra. 24 #45-18 Norte');
EXECUTE PC_USUARIOS.INSERTAR_USUARIO ('Nevile Cucinotta', 'ncucinottarj@studiopress.com', '3001503834', 'AV 34 Magdeline Court');
EXECUTE PC_USUARIOS.INSERTAR_USUARIO ('Rosette Heliot', 'rheliotri@360.cn', '3124779998', '456 Porter Lane');
EXECUTE PC_USUARIOS.INSERTAR_USUARIO ('Sheilakathryn Guidelli', 'sguidelli3t@telegraph.co.uk', '3000880467', '9 Caliangt Park');
EXECUTE PC_USUARIOS.INSERTAR_USUARIO ('Hannah Lill', 'hlill3u@vimeo.com', '3145437900', '4233 Village Green Circle');
EXECUTE PC_USUARIOS.INSERTAR_USUARIO ('Dory Waud', 'dwaud3v@jiathis.com', '3212022890', '367 Almo Crossing');

-- Prueba de error por el celular
EXECUTE PC_USUARIOS.INSERTAR_USUARIO ('Viviyan Shortland', 'vshortlandrh@yolasite.com', '5434766397', '30963 Lawn Parkway');

DELETE FROM USUARIOS;
COMMIT;


-- 2. Ofrecer nuevos productos
-- NOTA: Ejecutar los siguientes disparadores después de los PoblarOK para que la BD tenga un historial de uso simulado

-- 2.1. Vendedor 1
BEGIN
    PC_PRODUCTOS.OFRECER_PRODUCTO (
        'Andres Rodríguez', -- Nombre del vendedor
        'Nombre del Producto',  -- Nombre del producto
        'Descripción del Producto', -- Descripción del producto
        'B', -- Condición del Producto (Bueno)
        'https://dominio.extensión/nombreArchivo.jpg', 
        'T', -- Disponibilidad del Producto (Disponible)
        5000, -- Precio del Producto
        10, -- Cantidad del Producto
        'Juego', -- Tipo de Producto (Juego)
        'Aventura', -- Género del Producto
        'PC' -- Plataforma del Producto
    );
END;
/

-- 2.2. Vendedor 2
BEGIN
    PC_PRODUCTOS.OFRECER_PRODUCTO (
        'Nevile Cucinotta', -- Nombre del vendedor
        'Nombre del Producto 2',  -- Nombre del producto
        'Descripción del Producto 3', -- Descripción del producto
        'B', -- Condición del Producto (Bueno)
        'https://dominio2.extensión/nombreArchivo.jpg', 
        'T', -- Disponibilidad del Producto (Disponible)
        5000, -- Precio del Producto
        10, -- Cantidad del Producto
        'Juego', -- Tipo de Producto (Juego)
        'Aventura', -- Género del Producto
        'PC' -- Plataforma del Producto
    );
END;
/

-- 2.3 Vendedor 3 (No Existe)
BEGIN
    PC_PRODUCTOS.OFRECER_PRODUCTO (
        'Hannah Lillf',  -- Nombre del vendedor
        'Nombre del Producto 3', 
        'Descripción del Producto 3', 
        'U', -- Condición del Producto (Usado)
        'https://dominio3.extensión/nombreArchivo.jpg', 
        'T', -- Disponibilidad del Producto (Disponible)
        3500, -- Precio del Producto
        1, -- Cantidad del Producto
        'Juego', -- Tipo de Producto (Juego)
        'Aventura', -- Género del Producto
        'PC' -- Plataforma del Producto
    );
END;
/

-- 2.4 Vendedor 4 (La Condición no está dentro de las opciones permitidas)
BEGIN
    OFRECER_PRODUCTO (
        'Hannah Lill',  -- Nombre del vendedor
        'Nombre del Producto 3', 
        'Descripción del Producto 3', 
        'A', -- ERROR!
        'https://dominio3.extensión/nombreArchivo.jpg', 
        'T', -- Disponibilidad del Producto (Disponible)
        3500, -- Precio del Producto
        1, -- Cantidad del Producto
        'Juego', -- Tipo de Producto (Juego)
        'Aventura', -- Género del Producto
        'PC' -- Plataforma del Producto
    );
END;
/

DELETE FROM PRODUCTOS;
COMMIT;


-- 3. Agregar productos a la wishlist

-- 3.1 Producto 1 (Correcto)
BEGIN
    AGREGAR_PRODUCTO_WISHLIST (
        'Andres Rodríguez', -- Nombre del comprador
        'Nombre del Producto 2',     -- Nombre del producto
        'A',       -- Prioridad del producto en la wishlist
        2             -- Cantidad del producto en la wishlist
    );
END;
/

-- 3.1 Producto 2 (No existe el comprador)
BEGIN
    AGREGAR_PRODUCTO_WISHLIST (
        'Hannah Lillf', -- ERROR!
        'Nombre del Producto 3',     -- Nombre del producto
        'A',       -- Prioridad del producto en la wishlist
        1             -- Cantidad del producto en la wishlist
    );
END;
/

-- 3.3 Producto 3 (No existe el producto)
BEGIN
    AGREGAR_PRODUCTO_WISHLIST (
        'Hannah Lillf', -- Nombre del comprador
        'Nombre del Producto 9',     -- ERROR!
        'A',       -- Prioridad del producto en la wishlist
        1             -- Cantidad del producto en la wishlist
    );
END;
/

-- 4. Intercambiar productos (Revisar) ====================================================================================================================================================================================================================================================

    -- Insertar un nuevo registro en la tabla Intercambios
    INSERT INTO Intercambios (id, estado, fecha, comprador1, producto1, cantidad1, costo1, comprador2, producto2, cantidad2, costo2)
    VALUES (
        '0000000010',
        'Pendiente',
        SYSDATE,
        '0000000001',
        '0000000001',
        1,
        5000,
        '0000000002',
        '0000000001',
        1,
        5000
    );

DROP TRIGGER TG_COMPRADORES_EXPERIENCIA_AI_AU;



-- 4.1 Intercambio 1 (Correcto)
BEGIN
    INTERCAMBIAR_PRODUCTOS (
        'Andres Rodríguez',  -- Nombre del comprador1
        'Nombre del Producto',  -- Nombre del producto1
        1,  -- Cantidad del producto1
        'Nevile Cucinotta',  -- Nombre del comprador2
        'Nombre del Producto 2',  -- Nombre del producto2
        1  -- Cantidad del producto1
    );
END;
/

-- 4.2 Intercambio 2 (Correcto)
BEGIN
    INTERCAMBIAR_PRODUCTOS (
        'Andres Rodríguez',  -- Nombre del comprador1
        'Nombre del Producto',  -- Nombre del producto1
        8,  -- Cantidad del producto1
        'Nevile Cucinotta',  -- Nombre del comprador2
        'Nombre del Producto 2',  -- Nombre del producto2
        3  -- Cantidad del producto1
    );
END;
/

-- 4.2 Intercambio 3 (No existe uno de los compradores)
BEGIN
    INTERCAMBIAR_PRODUCTOS (
        'Andresa Rodríguez',  -- ERROR!
        'Nombre del Producto',  -- Nombre del producto1
        8,  -- Cantidad del producto1
        'Nevile Cucinotta',  -- Nombre del comprador2
        'Nombre del Producto 2',  -- Nombre del producto2
        3  -- Cantidad del producto1
    );
END;
/


DELETE FROM PAGOS;
DELETE FROM INTERCAMBIOS;
COMMIT;


-- 5. Pagar Intercambios
-- NOTA: Los IDs de los pagos se deben ingresar al procedimiento como cadenas de texto, porque como números no funcionan por los tipos de datos

-- 5.1 Pago 1 (Correcto)

EXECUTE REALIZAR_PAGO_INTERCAMBIO ('0000000001', 'Andres Rodríguez'); -- R/ Pendiente 2
EXECUTE REALIZAR_PAGO_INTERCAMBIO ('0000000001', 'Nevile Cucinotta'); -- R/ Aprobado

-- 5.1 Pago 1 (Correcto)

EXECUTE REALIZAR_PAGO_INTERCAMBIO ('0000000002', 'Nevile Cucinotta'); -- R/ Pendiente 1
EXECUTE REALIZAR_PAGO_INTERCAMBIO ('0000000002', 'Andres Rodríguez'); -- R/ Aprobado

-- 6. Calificar un producto

-- 6.1 Calificación 1 (Correcta)

EXECUTE CALIFICAR_PRODUCTO ('Andres Rodríguez', 'Nombre del Producto 2', 4, 'Muy buen producto');
EXECUTE CALIFICAR_PRODUCTO ('Nevile Cucinotta', 'Nombre del Producto', 1, 'Pésimo producto');

-- 6.1 Calificación 1 (Incorrecta)

EXECUTE CALIFICAR_PRODUCTO ('Andres Rodríguez', 'Nombre del Producto 8', 4, 'Muy buen producto'); -- No lo ha intercambiado
EXECUTE CALIFICAR_PRODUCTO ('Nevile Cucinotta', 'Nombre del Producto', 8, 'Excelente producto'); -- El número de estrellas está fuera del rango permitido

---------- CODE END ----------