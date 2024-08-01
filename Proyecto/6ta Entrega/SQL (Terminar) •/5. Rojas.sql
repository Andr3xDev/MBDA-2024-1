---------- CODE START ----------

-- CICLO 1: ActoresE

-- 1. Especificación paquete del Administrador 

CREATE OR REPLACE PACKAGE PK_ADMINISTRADOR AS
    -- Procedimientos para Usuarios
    PROCEDURE usuariosAdicionar (
        u_nombre IN VARCHAR2, 
        u_correo IN VARCHAR2, 
        u_celular IN NUMBER, 
        u_direccion IN VARCHAR2
    );
    PROCEDURE usuariosConsultarUsuario (
        u_nombre IN VARCHAR2
    );
    PROCEDURE usuariosConsultarVendedor (
        v_nombre IN VARCHAR2
    );
    PROCEDURE usuariosConsultarComprador (
        c_nombre IN VARCHAR2
    );
    PROCEDURE usuariosModificarUsuario (
        u_nombre IN VARCHAR2, 
        u_correo IN VARCHAR2, 
        u_celular IN NUMBER, 
        u_direccion IN VARCHAR2,
        u_estado IN VARCHAR2
    );
    PROCEDURE usuariosModificarVendedor (
        v_nombre IN VARCHAR2, 
        v_nit IN VARCHAR2, 
        v_tipo IN VARCHAR2
    );
    PROCEDURE usuariosModificarComprador (
        c_nombre IN VARCHAR2, 
        c_experiencia IN VARCHAR2
    );
    PROCEDURE usuariosEliminarUsuario (
        u_nombre IN VARCHAR2
    );

    -- Procedimientos para Intercambios
    PROCEDURE intercambiosConsultarCompradoresXProductos (
        nombre_GameLink_Comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );

    -- Procedimientos para Géneros
    PROCEDURE generosAdicionar (
        nuevo_genero IN VARCHAR2
    );
    PROCEDURE generosConsultar (
        nombre_genero IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );
    PROCEDURE generosModificar (
        anterior_genero IN VARCHAR2, 
        nuevo_genero IN VARCHAR2
    );
    PROCEDURE generosEliminar (
        nombre_genero IN VARCHAR2
    );

    -- Procedimientos para Plataformas
    PROCEDURE plataformasAdicionar (
        nueva_plataforma IN VARCHAR2
    );
    PROCEDURE plataformasConsultar (
        nombre_plataforma IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );
    PROCEDURE plataformasModificar (
        anterior_plataforma IN VARCHAR2, 
        nueva_plataforma IN VARCHAR2
    );
    PROCEDURE plataformasEliminar (
        nombre_plataforma IN VARCHAR2
    );
END PK_ADMINISTRADOR;
/

-- 2. Especificación paquete del Comprador

CREATE OR REPLACE PACKAGE PK_COMPRADOR AS
    -- Procedimientos para Wishlists
    PROCEDURE wishlistsAdicionarProducto (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        w_prioridad IN VARCHAR2, 
        w_cantidad IN NUMBER
    );
    PROCEDURE wishlistsConsultar (
        nombre_comprador IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );
    PROCEDURE wishlistsEliminarProducto (
        c_nombre IN VARCHAR2, 
        p_nombre IN VARCHAR2
    );

    -- Procedimientos para Calificaciones
    PROCEDURE calificacionesAdicionar (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        c_estrellas IN NUMBER, 
        c_comentario IN VARCHAR2
    );
    PROCEDURE calificacionesConsultar (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );
    PROCEDURE calificacionesModificar (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        n_estrellas IN NUMBER, 
        n_comentario IN VARCHAR2
    );

    -- Procedimientos para Intercambios
    PROCEDURE intercambiosAdicionar (
        nombre_comprador1 IN VARCHAR2, 
        nombre_producto1 IN VARCHAR2, 
        p_cantidad1 IN NUMBER, 
        nombre_comprador2 IN VARCHAR2, 
        nombre_producto2 IN VARCHAR2, 
        p_cantidad2 IN NUMBER
    );
    PROCEDURE intercambiosConsultarIntercambios (
        nombre_comprador1 IN VARCHAR2, 
        nombre_comprador2 IN VARCHAR2, 
        nombre_producto1 IN VARCHAR2, 
        nombre_producto2 IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );
    PROCEDURE intercambiosModificar (
        nombre_comprador1 IN VARCHAR2, 
        nombre_producto1 IN VARCHAR2, 
        p_cantidad1 IN NUMBER, 
        nombre_comprador2 IN VARCHAR2, 
        nombre_producto2 IN VARCHAR2, 
        p_cantidad2 IN NUMBER
    );

    -- Procedimientos para Pagos
    PROCEDURE pagosConsultar (
        id_pago IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );
    PROCEDURE pagosModificar (
        id_pago IN VARCHAR2, 
        n_metodo IN VARCHAR2
    );
    PROCEDURE pagosActualizar (
        id_pago IN VARCHAR2, 
        nombre_comprador IN VARCHAR2
    );

    -- Procedimientos para Productos
    PROCEDURE productosConsultar (
        nombre_producto IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );
    PROCEDURE productosConsultarOfrecimientos (
        nombre_vendedor IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );
END PK_COMPRADOR;
/


-- 3. Especificación paquete del Vendedor

CREATE OR REPLACE PACKAGE PK_VENDEDOR AS
    -- Procedimientos para Productos
    PROCEDURE productosAdicionar (
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
    PROCEDURE productosConsultar (
        nombre_producto IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );
    PROCEDURE productosConsultarOfrecimientos (
        nombre_vendedor IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    );
    PROCEDURE productosModificar (
        n_nombre IN VARCHAR2, 
        n_descripcion IN VARCHAR2, 
        n_condicion IN VARCHAR2, 
        n_imagen IN VARCHAR2, 
        n_disponibilidad IN VARCHAR2, 
        n_precio IN NUMBER, 
        n_cantidad IN NUMBER, 
        n_tipo IN VARCHAR2, 
        n_genero IN VARCHAR2, 
        n_plataforma IN VARCHAR2
    );
    PROCEDURE productosEliminar (
        nombre_producto IN VARCHAR2
    );
END PK_VENDEDOR;
/
COMMIT;



-- CICLO 1: ActoresI

-- 1. Implementación paquete del Administrador 

CREATE OR REPLACE PACKAGE BODY PK_ADMINISTRADOR AS
    -- Implementación de Usuarios
    PROCEDURE usuariosAdicionar (
        u_nombre IN VARCHAR2, 
        u_correo IN VARCHAR2, 
        u_celular IN NUMBER, 
        u_direccion IN VARCHAR2
    ) IS
    BEGIN
        PC_USUARIOS.INSERTAR_USUARIO(u_nombre, u_correo, u_celular, u_direccion);
    END usuariosAdicionar;

    PROCEDURE usuariosConsultarUsuario (
        u_nombre IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM Usuarios WHERE nombre = u_nombre;
    END usuariosConsultarUsuario;

    PROCEDURE usuariosConsultarVendedor (
        v_nombre IN VARCHAR2, 
        v_nit IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM vendedores WHERE nombre = v_nombre AND nit = v_nit;
    END usuariosConsultarVendedor;

    PROCEDURE usuariosConsultarComprador (
        c_nombre IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM compradores WHERE nombre = c_nombre;
    END usuariosConsultarComprador;

    PROCEDURE usuariosModificarUsuario (
        u_nombre IN VARCHAR2, 
        u_correo IN VARCHAR2, 
        u_celular IN NUMBER, 
        u_direccion IN VARCHAR2
    ) IS
    BEGIN
        PC_USUARIOS.ACTUALIZAR_USUARIO(u_nombre, u_correo, u_celular, u_direccion);
    END usuariosModificarUsuario;

    PROCEDURE usuariosModificarVendedor (
        v_nombre IN VARCHAR2, 
        v_nit IN VARCHAR2, 
        v_tipo IN VARCHAR2
    ) IS
    BEGIN
        PC_USUARIOS.MODIFICAR_VENDEDOR (v_nombre, v_nit, v_tipo);
    END usuariosModificarVendedor;

    PROCEDURE usuariosEliminarUsuario (
        u_nombre IN VARCHAR2
    ) IS
    BEGIN
        PC_USUARIOS.ELIMINAR_USUARIO(u_nombre);
    END usuariosEliminarUsuario;

    -- Implementación de Intercambios
    PROCEDURE intercambiosConsultarCompradoresXProductos (
        nombre_Comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        PC_INTERCAMBIOS.CONSULTAR_COMPRADOESXPRODUCTOS(nombre_Comprador, nombre_producto);
    END intercambiosConsultarCompradoresXProductos;

    -- Implementación de Géneros
    PROCEDURE generosAdicionar (
        nuevo_genero IN VARCHAR2
    ) IS
    BEGIN
        PC_GENEROS.INSERTAR_GENEROS(nuevo_genero);
    END generosAdicionar;

    PROCEDURE generosConsultar (
        nombre_genero IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT genero FROM generos WHERE genero = nombre_genero;
    END generosConsultar;

    PROCEDURE generosModificar (
        anterior_genero IN VARCHAR2, 
        nuevo_genero IN VARCHAR2
    ) IS
    BEGIN
        PC_GENEROS.ACTUALIZAR_GENEROS(nuevo_genero, anterior_genero);
    END generosModificar;

    PROCEDURE generosEliminar (
        nombre_genero IN VARCHAR2
    ) IS
    BEGIN
        PC_GENEROS.ELIMINAR_GENERO(nombre_genero);
    END generosEliminar;

    -- Implementación de Plataformas
    PROCEDURE plataformasAdicionar (
        nueva_plataforma IN VARCHAR2
    ) IS
    BEGIN
        PC_PLATAFORMAS.INSERTAR_PLATAFORMAS(nueva_plataforma);
    END plataformasAdicionar;

    PROCEDURE plataformasConsultar (
        nombre_plataforma IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT plataforma FROM plataformas WHERE plataforma = nombre_plataforma;
    END plataformasConsultar;

    PROCEDURE plataformasModificar (
        anterior_plataforma IN VARCHAR2, 
        nueva_plataforma IN VARCHAR2
    ) IS
    BEGIN
        PC_PLATAFORMAS.ACTUALIZAR_PLATAFORMAS(anterior_plataforma, nueva_plataforma);
    END plataformasModificar;

    PROCEDURE plataformasEliminar (
        nombre_plataforma IN VARCHAR2
    ) IS
    BEGIN
        PC_PLATAFORMAS.ELIMINAR_PLATAFORMAS(nombre_plataforma);
    END plataformasEliminar;
END PK_ADMINISTRADOR;
/

-- 2. Implementación paquete del Comprador

CREATE OR REPLACE PACKAGE BODY PK_COMPRADOR AS
    -- Implementación de Wishlists
    PROCEDURE wishlistsAdicionarProducto (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        w_prioridad IN VARCHAR2, 
        w_cantidad IN NUMBER
    ) IS
    BEGIN
        PC_WISHLIST.AGREGAR_PRODUCTO_WISHLIST(nombre_comprador, nombre_producto, w_prioridad, w_cantidad);
    END wishlistsAdicionarProducto;

    PROCEDURE wishlistsConsultar (
        nombre_comprador IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM Wishlists WHERE comprador = nombre_comprador;
    END wishlistsConsultar;

    PROCEDURE wishlistsEliminarProducto (
        c_nombre IN VARCHAR2, 
        p_nombre IN VARCHAR2
    ) IS
    BEGIN
        PC_WISHLIST.ELIMINAR_WISHLIST(p_nombre, c_nombre);
    END wishlistsEliminarProducto;

    -- Implementación de Calificaciones
    PROCEDURE calificacionesAdicionar (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        c_estrellas IN NUMBER, 
        c_comentario IN VARCHAR2
    ) IS
    BEGIN
        PC_CALIFICACIONES.INSERTAR_CALIFICACION(nombre_comprador, nombre_producto, c_estrellas, c_comentario);
    END calificacionesAdicionar;

    PROCEDURE calificacionesConsultar (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM Calificaciones WHERE comprador = nombre_comprador AND producto = nombre_producto;
    END calificacionesConsultar;

    PROCEDURE calificacionesModificar (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        n_estrellas IN NUMBER, 
        n_comentario IN VARCHAR2
    ) IS
    BEGIN
        PC_CALIFICACIONES.ACTUALIZAR_CALIFICACION(nombre_comprador, nombre_producto, n_comentario);
    END calificacionesModificar;

    -- Implementación de Intercambios
    PROCEDURE intercambiosAdicionar (
        nombre_comprador1 IN VARCHAR2, 
        nombre_producto1 IN VARCHAR2, 
        p_cantidad1 IN NUMBER, 
        nombre_comprador2 IN VARCHAR2, 
        nombre_producto2 IN VARCHAR2, 
        p_cantidad2 IN NUMBER
    ) IS
    BEGIN
        PC_INTERCAMBIOS.INSERTAR_INTERCAMBIO(nombre_comprador1, nombre_producto1, p_cantidad1, nombre_comprador2, nombre_producto2, p_cantidad2);
    END intercambiosAdicionar;

    PROCEDURE intercambiosConsultarIntercambios (
        nombre_comprador1 IN VARCHAR2, 
        nombre_comprador2 IN VARCHAR2, 
        nombre_producto1 IN VARCHAR2, 
        nombre_producto2 IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM Intercambios 
                    WHERE comprador1 = nombre_comprador1 
                      AND comprador2 = nombre_comprador2 
                      AND producto1 = nombre_producto1 
                      AND producto2 = nombre_producto2;
    END intercambiosConsultarIntercambios;

    PROCEDURE intercambiosModificar (
        nombre_comprador1 IN VARCHAR2, 
        nombre_producto1 IN VARCHAR2, 
        p_cantidad1 IN NUMBER, 
        nombre_comprador2 IN VARCHAR2, 
        nombre_producto2 IN VARCHAR2, 
        p_cantidad2 IN NUMBER
    ) IS
    BEGIN
        PC_INTERCAMBIOS.ACTUALIZAR_INTERCAMBIO(1, nombre_comprador1, nombre_producto1, p_cantidad1, nombre_comprador2, nombre_producto2, p_cantidad2);
    END intercambiosModificar;

    -- Implementación de Pagos
    PROCEDURE pagosConsultar (
        id_pago IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM Pagos WHERE id = id_pago;
    END pagosConsultar;

    PROCEDURE pagosModificar (
        id_pago IN VARCHAR2, 
        n_metodo IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Pagos
        SET metodo_pago = n_metodo
        WHERE id = id_pago;
    END pagosModificar;

    PROCEDURE pagosActualizar (
        id_pago IN VARCHAR2, 
        nombre_comprador IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Pagos
        SET comprador = (SELECT id FROM compradores WHERE nombre = nombre_comprador)
        WHERE id = id_pago;
    END pagosActualizar;

    -- Implementación de Productos
    PROCEDURE productosConsultar (
        nombre_producto IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM Productos WHERE nombre = nombre_producto;
    END productosConsultar;

    PROCEDURE productosConsultarOfrecimientos (
        nombre_vendedor IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM Ofrecimientos WHERE vendedor = (SELECT id FROM Vendedores WHERE nombre = nombre_vendedor);
    END productosConsultarOfrecimientos;
END PK_COMPRADOR;
/

-- 3. Implementación paquete del Vendedor

CREATE OR REPLACE PACKAGE BODY PK_VENDEDOR AS
    -- Implementación de Productos
    PROCEDURE productosAdicionar (
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
    ) IS
    BEGIN
        PC_PRODUCTOS.OFRECER_PRODUCTO(nombre_vendedor, p_nombre, p_descripcion, p_condicion, p_imagen, p_disponibilidad, p_precio, p_cantidad, p_tipo, p_genero, p_plataforma);
    END productosAdicionar;

    PROCEDURE productosConsultar (
        nombre_producto IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM Productos WHERE nombre = nombre_producto;
    END productosConsultar;

    PROCEDURE productosConsultarOfrecimientos (
        nombre_vendedor IN VARCHAR2, 
        cur OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN cur FOR SELECT * FROM Ofrecimientos WHERE vendedor = (SELECT id FROM endedores WHERE nombre = nombre_vendedor);
    END productosConsultarOfrecimientos;
    
    PROCEDURE productosModificar (
        n_nombre IN VARCHAR2, 
        n_descripcion IN VARCHAR2, 
        n_condicion IN VARCHAR2, 
        n_imagen IN VARCHAR2, 
        n_disponibilidad IN VARCHAR2, 
        n_precio IN NUMBER, 
        n_cantidad IN NUMBER, 
        n_tipo IN VARCHAR2, 
        n_genero IN VARCHAR2, 
        n_plataforma IN VARCHAR2
    ) IS
    BEGIN
        PC_PRODUCTOS.ACTUALIZAR_PRODUCTO(n_nombre, n_descripcion, n_condicion, n_imagen, n_disponibilidad, n_precio, n_cantidad, n_tipo, n_genero, n_plataforma);
    END productosModificar;
    
    PROCEDURE productosEliminar (
        nombre_producto IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM Productos WHERE nombre = nombre_producto;
    END productosEliminar;
END PK_VENDEDOR;
/
COMMIT;



-- CICLO 1: Seguridad

-- 1. Creación de roles

CREATE ROLE GameLink_Administrador;
CREATE ROLE GameLink_Comprador;
CREATE ROLE GameLink_Vendedor;

-- 2. Otorgación de permisos

-- 2.1. Administrador

GRANT SELECT, INSERT, UPDATE, DELETE 
ON Usuarios
TO GameLink_Administrador;

GRANT SELECT, INSERT, UPDATE, DELETE 
ON Generos
TO GameLink_Administrador;

GRANT SELECT, INSERT, UPDATE, DELETE 
ON Plataformas
TO GameLink_Administrador;

-- 2.2. Comprador

GRANT SELECT, UPDATE, DELETE
ON WishListsXProductos
TO GameLink_Comprador;

GRANT SELECT, INSERT, UPDATE 
ON Calificaciones 
TO GameLink_Comprador;

GRANT SELECT, INSERT, UPDATE
ON Intercambios
TO GameLink_Comprador;

GRANT SELECT, UPDATE
ON Pagos
TO GameLink_Comprador;

GRANT SELECT
ON Productos
TO GameLink_Comprador;

-- 2.3. Vendedor

GRANT SELECT, INSERT, UPDATE, DELETE 
ON Productos
TO GameLink_Vendedor;



-- CICLO 1: XSeguridad
/*
-- 1. Eliminación de Roles

DROP ROLE GameLink_Administrador;
DROP ROLE GameLink_Comprador;
DROP ROLE GameLink_Vendedor;

-- 2. Eliminación de permisos

-- 2.1. Administrador

REVOKE SELECT, INSERT, UPDATE, DELETE
ON USUARIOS
FROM GameLink_Administrador;

-- 2.2. Comprador

REVOKE SELECT, INSERT, UPDATE, DELETE
ON wishlist
FROM GameLink_Comprador;

REVOKE SELECT, INSERT, UPDATE
ON calificaciones
FROM GameLink_Comprador;

REVOKE SELECT, INSERT, UPDATE
ON intercambios
FROM GameLink_Comprador;

REVOKE SELECT, INSERT, UPDATE
ON pagos
FROM GameLink_Comprador;

-- 2.3. Vendedor

REVOKE SELECT, INSERT, UPDATE, DELETE
ON PRODUCTOS
FROM GameLink_Vendedor;

REVOKE SELECT, INSERT, UPDATE
ON intercambios
FROM GameLink_Vendedor;

REVOKE SELECT, INSERT, UPDATE
ON pagos
FROM GameLink_Vendedor;

-- 3. Eliminación de paquetes
 
DROP PACKAGE PK_ADMINISTRADOR;
DROP PACKAGE BODY PK_ADMINISTRADOR;
DROP PACKAGE PK_COMPRADOR;
DROP PACKAGE BODY PK_COMPRADOR;
DROP PACKAGE PK_VENDEDOR;
DROP PACKAGE BODY PK_VENDEDOR;
COMMIT;
*/
---------- CODE END ----------