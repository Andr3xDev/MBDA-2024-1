---------- CODE START ----------

-- CICLO 1: ActoresE

-- 1. Especificacion paquete del Administrador

CREATE OR REPLACE PACKAGE PK_ADMINISTRADOR AS
    -- Procedimientos para Usuarios
    PROCEDURE USUARIOS_INSERTAR_USUARIO (
        u_nombre IN VARCHAR2, 
        u_correo IN VARCHAR2, 
        u_celular IN NUMBER, 
        u_direccion IN VARCHAR2
    );
    
    PROCEDURE USUARIOS_CONSULTAR_USUARIO (
        u_nombre IN VARCHAR2
    );
    
    PROCEDURE USUARIOS_CONSULTAR_VENDEDOR (
        v_nombre IN VARCHAR2
    );
    
    PROCEDURE USUARIOS_CONSULTAR_COMPRADOR (
        c_nombre IN VARCHAR2
    );
    
    PROCEDURE USUARIOS_MODIFICAR_USUARIO (
        u_nombre IN VARCHAR2, 
        u_correo IN VARCHAR2, 
        u_celular IN NUMBER, 
        u_direccion IN VARCHAR2
    );
    
    PROCEDURE USUARIOS_MODIFICAR_VENDEDOR (
        v_nombre IN VARCHAR2, 
        v_nit IN VARCHAR2, 
        v_tipo IN VARCHAR2
    );
    /*
    PROCEDURE USUARIOS_MODIFICAR_COMPRADOR (
        c_nombre IN VARCHAR2, 
        c_experiencia IN VARCHAR2
    );
    */
    PROCEDURE USUARIOS_ELIMINAR_USUARIO (
        u_nombre IN VARCHAR2
    );
    
    PROCEDURE INTERCAMBIOS_CONSULTAR_COMPRADORESXPRODUCTOS (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2
    );
    
    PROCEDURE PRODUCTOS_GENEROS_ADICIONAR (
        nuevo_genero IN VARCHAR2
    );
    
    PROCEDURE PRODUCTOS_GENEROS_CONSULTAR;
    
    PROCEDURE PRODUCTOS_GENEROS_MODIFICAR (
        anterior_genero IN VARCHAR2, 
        nuevo_genero IN VARCHAR2
    );
    
    PROCEDURE PRODUCTOS_GENEROS_ELIMINAR (
        nombre_genero IN VARCHAR2
    );
    
    PROCEDURE PRODUCTOS_PLATAFORMAS_ADICIONAR (
        nueva_plataforma IN VARCHAR2
    );
    
    PROCEDURE PRODUCTOS_PLATAFORMAS_CONSULTAR;
    
    PROCEDURE PRODUCTOS_PLATAFORMAS_MODIFICAR (
        anterior_plataforma IN VARCHAR2, 
        nueva_plataforma IN VARCHAR2
    );
    
    PROCEDURE PRODUCTOS_PLATAFORMAS_ELIMINAR (
        nombre_plataforma IN VARCHAR2
    );

END PK_ADMINISTRADOR;
/

-- 2. Especificacion paquete del Comprador

CREATE OR REPLACE PACKAGE PK_COMPRADOR AS
    -- Procedimientos para Wishlists
    PROCEDURE WISHLISTS_ADICIONAR_PRODUCTO (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        w_prioridad IN VARCHAR2, 
        w_cantidad IN NUMBER
    );
    
    PROCEDURE WISHLISTS_CONSULTAR (
        nombre_comprador IN VARCHAR2
    );
    
    PROCEDURE WISHLISTS_ELIMINAR_PRODUCTO (
        c_nombre IN VARCHAR2, 
        p_nombre IN VARCHAR2
    );
    
    PROCEDURE CALIFICACIONES_ADICIONAR (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        c_estrellas IN NUMBER, 
        c_comentario IN VARCHAR2
    );
    
    PROCEDURE CALIFICACIONES_CONSULTAR (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2
    );
    
    PROCEDURE CALIFICACIONES_MODIFICAR (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2,
        n_comentario IN VARCHAR2
    );
    
    PROCEDURE INTERCAMBIOS_ADICIONAR (
        nombre_comprador1 IN VARCHAR2, 
        nombre_producto1 IN VARCHAR2, 
        p_cantidad1 IN NUMBER, 
        nombre_comprador2 IN VARCHAR2, 
        nombre_producto2 IN VARCHAR2, 
        p_cantidad2 IN NUMBER
    );
    
    PROCEDURE INTERCAMBIOS_CONSULTAR_INTERCAMBIOS (
        I_id IN VARCHAR2
    );
    
    PROCEDURE INTERCAMBIOS_MODIFICAR (
        I_id IN VARCHAR2,
        p_precio_producto1 IN VARCHAR2,
        p_cantidad1 IN NUMBER,
        p_precio_producto2 IN VARCHAR2,
        p_cantidad2 IN NUMBER
    );
    
    PROCEDURE PAGOS_CONSULTAR (
        id_pago IN VARCHAR2
    );
    /*
    PROCEDURE PAGOS_MODIFICAR (
        id_pago IN VARCHAR2, 
        n_metodo IN VARCHAR2
    );
    */
    PROCEDURE PAGOS_ACTUALIZAR (
        id_pago IN VARCHAR2, 
        nombre_comprador IN VARCHAR2
    );
    
    PROCEDURE PRODUCTOS_CONSULTAR (
        nombre_producto IN VARCHAR2
    );
    /*
    PROCEDURE PRODUCTOS_CONSULTAR_OFRECIMIENTOS (
        nombre_vendedor IN VARCHAR2
    );
    */
END PK_COMPRADOR;
/

-- 3. Especificacion paquete del Vendedor

CREATE OR REPLACE PACKAGE PK_VENDEDOR AS
    -- Procedimientos para Productos
    PROCEDURE PRODUCTOS_ADICIONAR (
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
    
    PROCEDURE PRODUCTOS_CONSULTAR (
        nombre_producto IN VARCHAR2
    );
    
    PROCEDURE PRODUCTOS_MODIFICAR (
        nombre_vendedor IN VARCHAR2,
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
    
    PROCEDURE PRODUCTOS_ELIMINAR (
        nombre_producto IN VARCHAR2
    );

END PK_VENDEDOR;
/



-- CICLO 1: ActoresI

-- 1. Implementacion paquete del Administrador

CREATE OR REPLACE PACKAGE BODY PK_ADMINISTRADOR AS
    PROCEDURE USUARIOS_INSERTAR_USUARIO (
        u_nombre IN VARCHAR2, 
        u_correo IN VARCHAR2, 
        u_celular IN NUMBER, 
        u_direccion IN VARCHAR2
    ) AS
    BEGIN
        PC_USUARIOS.INSERTAR_USUARIO(u_nombre, u_correo, u_celular, u_direccion);
    END USUARIOS_INSERTAR_USUARIO;
    
    PROCEDURE USUARIOS_CONSULTAR_USUARIO (
        u_nombre IN VARCHAR2
    ) AS
    BEGIN
        PC_USUARIOS.CONSULTAR_USUARIO(u_nombre);
    END USUARIOS_CONSULTAR_USUARIO;
    
    PROCEDURE USUARIOS_CONSULTAR_VENDEDOR (
        v_nombre IN VARCHAR2
    ) AS
    BEGIN
        PC_USUARIOS.CONSULTAR_VENDEDOR(v_nombre);
    END USUARIOS_CONSULTAR_VENDEDOR;
    
    PROCEDURE USUARIOS_CONSULTAR_COMPRADOR (
        c_nombre IN VARCHAR2
    ) AS
    BEGIN
        PC_USUARIOS.CONSULTAR_COMPRADOR(c_nombre);
    END USUARIOS_CONSULTAR_COMPRADOR;
    
    PROCEDURE USUARIOS_MODIFICAR_USUARIO (
        u_nombre IN VARCHAR2, 
        u_correo IN VARCHAR2, 
        u_celular IN NUMBER, 
        u_direccion IN VARCHAR2
    ) AS
    BEGIN
        PC_USUARIOS.ACTUALIZAR_USUARIO(u_nombre, u_correo, u_celular, u_direccion);
    END USUARIOS_MODIFICAR_USUARIO;
    
    PROCEDURE USUARIOS_MODIFICAR_VENDEDOR (
        v_nombre IN VARCHAR2, 
        v_nit IN VARCHAR2, 
        v_tipo IN VARCHAR2
    ) AS
    BEGIN
        PC_USUARIOS.MODIFICAR_VENDEDOR(v_nombre, v_nit, v_tipo);
    END USUARIOS_MODIFICAR_VENDEDOR;
    /*
    PROCEDURE USUARIOS_MODIFICAR_COMPRADOR (
        c_nombre IN VARCHAR2, 
        c_experiencia IN VARCHAR2
    ) AS
    BEGIN
        PC_USUARIOS.MODIFICAR_COMPRADOR(c_nombre, c_experiencia);
    END USUARIOS_MODIFICAR_COMPRADOR;
    */
    PROCEDURE USUARIOS_ELIMINAR_USUARIO (
        u_nombre IN VARCHAR2
    ) AS
    BEGIN
        PC_USUARIOS.ELIMINAR_USUARIO(u_nombre);
    END USUARIOS_ELIMINAR_USUARIO;
    
    PROCEDURE INTERCAMBIOS_CONSULTAR_COMPRADORESXPRODUCTOS (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2
    ) AS
    BEGIN
        PC_INTERCAMBIOS.CONSULTAR_COMPRADORESXPRODUCTOS(nombre_comprador, nombre_producto);
    END INTERCAMBIOS_CONSULTAR_COMPRADORESXPRODUCTOS;
    
    PROCEDURE PRODUCTOS_GENEROS_ADICIONAR (
        nuevo_genero IN VARCHAR2
    ) AS
    BEGIN
        PC_PRODUCTOS.INSERTAR_GENEROS(nuevo_genero);
    END PRODUCTOS_GENEROS_ADICIONAR;
    
    PROCEDURE PRODUCTOS_GENEROS_CONSULTAR
    AS
    BEGIN
        PC_PRODUCTOS.CONSULTAR_GENERO;
    END PRODUCTOS_GENEROS_CONSULTAR;
    
    PROCEDURE PRODUCTOS_GENEROS_MODIFICAR (
        anterior_genero IN VARCHAR2, 
        nuevo_genero IN VARCHAR2
    ) AS
    BEGIN
        PC_PRODUCTOS.ACTUALIZAR_GENEROS(nuevo_genero, anterior_genero);
    END PRODUCTOS_GENEROS_MODIFICAR;
    
    PROCEDURE PRODUCTOS_GENEROS_ELIMINAR (
        nombre_genero IN VARCHAR2
    ) AS
    BEGIN
        PC_PRODUCTOS.ELIMINAR_GENERO(nombre_genero);
    END PRODUCTOS_GENEROS_ELIMINAR;
    
    PROCEDURE PRODUCTOS_PLATAFORMAS_ADICIONAR (
        nueva_plataforma IN VARCHAR2
    ) AS
    BEGIN
        PC_PRODUCTOS.INSERTAR_PLATAFORMAS(nueva_plataforma);
    END PRODUCTOS_PLATAFORMAS_ADICIONAR;
    
    PROCEDURE PRODUCTOS_PLATAFORMAS_CONSULTAR
    AS
    BEGIN
        PC_PRODUCTOS.CONSULTAR_PLATAFORMAS;
    END PRODUCTOS_PLATAFORMAS_CONSULTAR;
    
    PROCEDURE PRODUCTOS_PLATAFORMAS_MODIFICAR (
        anterior_plataforma IN VARCHAR2, 
        nueva_plataforma IN VARCHAR2
    ) AS
    BEGIN
        PC_PRODUCTOS.ACTUALIZAR_PLATAFORMAS(anterior_plataforma, nueva_plataforma);
    END PRODUCTOS_PLATAFORMAS_MODIFICAR;
    
    PROCEDURE PRODUCTOS_PLATAFORMAS_ELIMINAR (
        nombre_plataforma IN VARCHAR2
    ) AS
    BEGIN
        PC_PRODUCTOS.ELIMINAR_PLATAFORMAS(nombre_plataforma);
    END PRODUCTOS_PLATAFORMAS_ELIMINAR;

END PK_ADMINISTRADOR;
/

-- 2. Implementacion paquete del Comprador

CREATE OR REPLACE PACKAGE BODY PK_COMPRADOR AS
    PROCEDURE WISHLISTS_ADICIONAR_PRODUCTO (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        w_prioridad IN VARCHAR2, 
        w_cantidad IN NUMBER
    ) AS
    BEGIN
        PC_WISHLIST.AGREGAR_PRODUCTO_WISHLIST(nombre_comprador, nombre_producto, w_prioridad, w_cantidad);
    END WISHLISTS_ADICIONAR_PRODUCTO;
    
    PROCEDURE WISHLISTS_CONSULTAR (
        nombre_comprador IN VARCHAR2
    ) AS
    BEGIN
        PC_WISHLIST.CONSULTAR_WISHLIST(nombre_comprador);
    END WISHLISTS_CONSULTAR;
    
    PROCEDURE WISHLISTS_ELIMINAR_PRODUCTO (
        c_nombre IN VARCHAR2, 
        p_nombre IN VARCHAR2
    ) AS
    BEGIN
        PC_WISHLIST.ELIMINAR_WISHLIST(p_nombre, c_nombre);
    END WISHLISTS_ELIMINAR_PRODUCTO;
    
    PROCEDURE CALIFICACIONES_ADICIONAR (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2, 
        c_estrellas IN NUMBER, 
        c_comentario IN VARCHAR2
    ) AS
    BEGIN
        PC_CALIFICACIONES.INSERTAR_CALIFICACION(nombre_comprador, nombre_producto, c_estrellas, c_comentario);
    END CALIFICACIONES_ADICIONAR;
    
    PROCEDURE CALIFICACIONES_CONSULTAR (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2
    ) AS
    BEGIN
        PC_CALIFICACIONES.CONSULTAR_CALIFICACION(nombre_comprador, nombre_producto);
    END CALIFICACIONES_CONSULTAR;
    
    PROCEDURE CALIFICACIONES_MODIFICAR (
        nombre_comprador IN VARCHAR2, 
        nombre_producto IN VARCHAR2,
        n_comentario IN VARCHAR2
    ) AS
    BEGIN
        PC_CALIFICACIONES.ACTUALIZAR_CALIFICACION(nombre_comprador, nombre_producto, n_comentario);
    END CALIFICACIONES_MODIFICAR;
    
    PROCEDURE INTERCAMBIOS_ADICIONAR (
        nombre_comprador1 IN VARCHAR2, 
        nombre_producto1 IN VARCHAR2, 
        p_cantidad1 IN NUMBER, 
        nombre_comprador2 IN VARCHAR2, 
        nombre_producto2 IN VARCHAR2, 
        p_cantidad2 IN NUMBER
    ) AS
    BEGIN
        PC_INTERCAMBIOS.INSERTAR_INTERCAMBIO(nombre_comprador1, nombre_producto1, p_cantidad1, nombre_comprador2, nombre_producto2, p_cantidad2);
    END INTERCAMBIOS_ADICIONAR;
    
    PROCEDURE INTERCAMBIOS_CONSULTAR_INTERCAMBIOS (
        I_id IN VARCHAR2
    ) AS
    BEGIN
        PC_INTERCAMBIOS.CONSULTAR_INTERCAMBIOS(I_id);
    END INTERCAMBIOS_CONSULTAR_INTERCAMBIOS;
    
    PROCEDURE INTERCAMBIOS_MODIFICAR (
        I_id IN VARCHAR2,
        p_precio_producto1 IN VARCHAR2,
        p_cantidad1 IN NUMBER,
        p_precio_producto2 IN VARCHAR2,
        p_cantidad2 IN NUMBER
    ) AS
    BEGIN
        PC_INTERCAMBIOS.ACTUALIZAR_INTERCAMBIO(I_id, p_precio_producto1, p_cantidad1, p_precio_producto2, p_cantidad2);
    END INTERCAMBIOS_MODIFICAR;
    
    PROCEDURE PAGOS_CONSULTAR (
        id_pago IN VARCHAR2
    ) AS
    BEGIN
        PC_PAGOS.CONSULTAR_PAGOS(id_pago);
    END PAGOS_CONSULTAR;
    /*
    PROCEDURE PAGOS_MODIFICAR (
        id_pago IN VARCHAR2, 
        n_metodo IN VARCHAR2
    ) AS
    BEGIN
        PC_PAGOS.MODIFICAR_PAGOS(id_pago, n_metodo);
    END PAGOS_MODIFICAR;
    */
    PROCEDURE PAGOS_ACTUALIZAR (
        id_pago IN VARCHAR2, 
        nombre_comprador IN VARCHAR2
    ) AS
    BEGIN
        PC_PAGOS.MODIFICAR_PAGOS(id_pago, nombre_comprador);
    END PAGOS_ACTUALIZAR;
    
    PROCEDURE PRODUCTOS_CONSULTAR (
        nombre_producto IN VARCHAR2
    ) AS
    BEGIN
        PC_PRODUCTOS.CONSULTAR_PRODUCTO(nombre_producto);
    END PRODUCTOS_CONSULTAR;
    /*
    PROCEDURE PRODUCTOS_CONSULTAR_OFRECIMIENTOS (
        nombre_vendedor IN VARCHAR2
    ) AS
    BEGIN
        PC_PRODUCTOS.CONSULTAR_OFRECIMIENTOS(nombre_vendedor);
    END PRODUCTOS_CONSULTAR_OFRECIMIENTOS;
    */
END PK_COMPRADOR;
/

-- 3. Implementacion paquete del Vendedor

CREATE OR REPLACE PACKAGE BODY PK_VENDEDOR AS
    PROCEDURE PRODUCTOS_ADICIONAR (
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
    BEGIN
        PC_PRODUCTOS.OFRECER_PRODUCTO(nombre_vendedor, p_nombre, p_descripcion, p_condicion, p_imagen, p_disponibilidad, p_precio, p_cantidad, p_tipo, p_genero, p_plataforma);
    END PRODUCTOS_ADICIONAR;
    
    PROCEDURE PRODUCTOS_CONSULTAR (
        nombre_producto IN VARCHAR2
    ) AS
    BEGIN
        PC_PRODUCTOS.CONSULTAR_PRODUCTO(nombre_producto);
    END PRODUCTOS_CONSULTAR;
    
    PROCEDURE PRODUCTOS_MODIFICAR (
        nombre_vendedor IN VARCHAR2,
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
    ) AS
    BEGIN
        PC_PRODUCTOS.ACTUALIZAR_PRODUCTO(nombre_vendedor, n_nombre, n_descripcion, n_condicion, n_imagen, n_disponibilidad, n_precio, n_cantidad, n_tipo, n_genero, n_plataforma);
    END PRODUCTOS_MODIFICAR;
    
    PROCEDURE PRODUCTOS_ELIMINAR (
        nombre_producto IN VARCHAR2
    ) AS
    BEGIN
        PC_PRODUCTOS.ELIMINAR_PRODUCTO(nombre_producto);
    END PRODUCTOS_ELIMINAR;

END PK_VENDEDOR;
/



-- CICLO 1: Seguridad

-- 1. Creacion de roles

CREATE ROLE GameLink_Administrador;
CREATE ROLE GameLink_Comprador;
CREATE ROLE GameLink_Vendedor;

-- 2. Otorgacion de permisos

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
-- 1. Eliminacion de Roles

DROP ROLE GameLink_Administrador;
DROP ROLE GameLink_Comprador;
DROP ROLE GameLink_Vendedor;

-- 2. Eliminacion de permisos

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

-- 3. Eliminacion de paquetes
 
DROP PACKAGE PK_ADMINISTRADOR;
DROP PACKAGE BODY PK_ADMINISTRADOR;
DROP PACKAGE PK_COMPRADOR;
DROP PACKAGE BODY PK_COMPRADOR;
DROP PACKAGE PK_VENDEDOR;
DROP PACKAGE BODY PK_VENDEDOR;
COMMIT;
*/
---------- CODE END ----------