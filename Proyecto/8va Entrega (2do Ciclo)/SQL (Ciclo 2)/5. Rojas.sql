---------- CODE START ----------

-- CICLO 2: ActoresE

CREATE OR REPLACE PACKAGE PK2_ADMINISTRADOR AS
    
    PROCEDURE ADICIONAR_SUSCRIPCION (
        u_usuario IN VARCHAR2,
        u_monto IN NUMBER,
        u_metodo IN VARCHAR2
    );
    PROCEDURE ADICIONAR_PROMOCION (
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_inicio IN DATE,
        p_fin IN DATE,
        p_reusable IN VARCHAR2,
        p_suscripcion IN VARCHAR2
    );
    PROCEDURE CONSULTAR_SUSCRIPCION (
        p_id IN VARCHAR2
    );
    PROCEDURE CONSULTAR_PROMOCION (
        p_codigo IN VARCHAR2
    );
    PROCEDURE CONSULTAR_SEGURO (
        p_id IN VARCHAR2
    );
    PROCEDURE ACTUALIZAR_SUSCRIPCION (
        p_id IN VARCHAR2,
        p_monto IN NUMBER DEFAULT NULL,
        p_metodo IN VARCHAR2 DEFAULT NULL
    );
    PROCEDURE MODIFICAR_PROMOCION (
        p_codigo IN VARCHAR2,
        p_nombre IN VARCHAR2 DEFAULT NULL,
        p_descripcion IN VARCHAR2 DEFAULT NULL,
        p_inicio IN DATE DEFAULT NULL,
        p_fin IN DATE DEFAULT NULL,
        p_reusable IN VARCHAR2 DEFAULT NULL,
        p_suscripcion IN VARCHAR2 DEFAULT NULL
    );
    PROCEDURE ACTUALIZAR_SEGURO (
        p_id IN VARCHAR2,
        p_cobertura IN VARCHAR2 DEFAULT NULL,
        p_estado IN VARCHAR2 DEFAULT NULL
    );
    PROCEDURE ELIMINAR_SUSCRIPCION (
        p_id IN VARCHAR2
    );
    PROCEDURE ELIMINAR_PROMOCION (
        p_codigo IN VARCHAR2
    );
    PROCEDURE ADICIONAR_REPARTIDOR (
        r_nombre IN VARCHAR2,
        r_celular IN NUMBER
    );
    PROCEDURE CONSULTAR_REPARTIDOR (
        r_nombre IN VARCHAR2
    );
    PROCEDURE MODIFICAR_REPARTIDOR (
        n_nombre IN VARCHAR2,
        n_celular IN NUMBER,
        n_calificacion IN NUMBER
    );
    PROCEDURE ELIMINAR_REPARTIDOR (
        r_nombre IN VARCHAR2
    );
END PK2_ADMINISTRADOR;
/

CREATE OR REPLACE PACKAGE PK2_COMPRADOR AS
    PROCEDURE ADICIONAR_ENVIO (
        id_pago IN VARCHAR2,
        tipo_envio IN VARCHAR2 DEFAULT 'Estandar',
        n_direccion IN VARCHAR2 DEFAULT NULL
    );
    PROCEDURE CONSULTAR_ENVIO (
        id_envio IN VARCHAR2
    );
    PROCEDURE CONSULTAR_SEGUIMIENTO (
        id_envio IN VARCHAR2
    );
    PROCEDURE INSERTAR_DEVOLUCION (
        p_motivo IN VARCHAR2,
        p_reembolso IN VARCHAR2,
        p_envio IN VARCHAR2
    );
    PROCEDURE CONSULTAR_DEVOLUCIONES (
        p_id IN VARCHAR2
    );
END PK2_COMPRADOR;
/


CREATE OR REPLACE PACKAGE PK2_VENDEDOR AS
    PROCEDURE ADICIONAR_ENVIO (
        id_pago IN VARCHAR2,
        tipo_envio IN VARCHAR2 DEFAULT 'Estandar',
        n_direccion IN VARCHAR2 DEFAULT NULL
    );
    PROCEDURE CONSULTAR_ENVIO (
        id_envio IN VARCHAR2
    );
    PROCEDURE CONSULTAR_SEGUIMIENTO (
        id_envio IN VARCHAR2
    );
    PROCEDURE INSERTAR_PUNTORECOGIDA (
        p_remitente IN VARCHAR2,
        p_destinatario IN VARCHAR2,
        p_direccion IN VARCHAR2,
        p_pago IN VARCHAR2
    );
    PROCEDURE ACTUALIZAR_PUNTORECOGIDA (
        p_id IN VARCHAR2
    );
    PROCEDURE CONSULTAR_PUNTOSRECOGIDA (
        p_id IN VARCHAR2
    );
END PK2_VENDEDOR;
/


CREATE OR REPLACE PACKAGE PK2_REPARTIDOR AS
    PROCEDURE ADICIONAR_NOTIFICACION (
        p_motivo IN VARCHAR2,
        p_metodo IN VARCHAR2,
        p_seguimiento IN VARCHAR2
    );
    PROCEDURE CONSULTAR_ENVIO (
        id_envio IN VARCHAR2
    );
    PROCEDURE CONSULTAR_SEGUIMIENTO (
        id_envio IN VARCHAR2
    );
    PROCEDURE MODIFICAR_SEGUIMIENTO (
        id_envio IN VARCHAR2,
        n_estado IN VARCHAR2,
        n_ubicacion IN VARCHAR2,
        n_detalle IN VARCHAR2
    );
    PROCEDURE MODIFICAR_NOTIFICACION (
        id_envio IN VARCHAR2,
        n_motivo IN VARCHAR2,
        n_medio IN VARCHAR2
    );
END PK2_REPARTIDOR;
/
    
COMMIT;



-- CICLO 2: ActoresI

CREATE OR REPLACE PACKAGE BODY PK2_ADMINISTRADOR AS
    PROCEDURE ADICIONAR_SUSCRIPCION (
        u_usuario IN VARCHAR2,
        u_monto IN NUMBER,
        u_metodo IN VARCHAR2
    ) IS
    BEGIN
        PK_SUSCRIPCIONES.ADICIONAR_SUSCRIPCION(u_usuario, u_monto, u_metodo);
    END ADICIONAR_SUSCRIPCION;

    PROCEDURE ADICIONAR_PROMOCION (
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_inicio IN DATE,
        p_fin IN DATE,
        p_reusable IN VARCHAR2,
        p_suscripcion IN VARCHAR2
    ) IS
    BEGIN
        PK_SUSCRIPCIONES.ADICIONAR_PROMOCION(p_nombre, p_descripcion, p_inicio, p_fin, p_reusable, p_suscripcion);
    END ADICIONAR_PROMOCION;

    PROCEDURE CONSULTAR_SUSCRIPCION (
        p_id IN VARCHAR2
    ) IS
    BEGIN
        PK_SUSCRIPCIONES.CONSULTAR_SUSCRIPCION(p_id);
    END CONSULTAR_SUSCRIPCION;

    PROCEDURE CONSULTAR_PROMOCION (
        p_codigo IN VARCHAR2
    ) IS
    BEGIN
        PK_SUSCRIPCIONES.CONSULTAR_PROMOCION(p_codigo);
    END CONSULTAR_PROMOCION;

    PROCEDURE CONSULTAR_SEGURO (
        p_id IN VARCHAR2
    ) IS
    BEGIN
        PK_SUSCRIPCIONES.CONSULTAR_SEGURO(p_id);
    END CONSULTAR_SEGURO;

    PROCEDURE ACTUALIZAR_SUSCRIPCION (
        p_id IN VARCHAR2,
        p_monto IN NUMBER DEFAULT NULL,
        p_metodo IN VARCHAR2 DEFAULT NULL
    ) IS
    BEGIN
        PK_SUSCRIPCIONES.ACTUALIZAR_SUSCRIPCION(p_id, p_monto, p_metodo);
    END ACTUALIZAR_SUSCRIPCION;

    PROCEDURE MODIFICAR_PROMOCION (
        p_codigo IN VARCHAR2,
        p_nombre IN VARCHAR2 DEFAULT NULL,
        p_descripcion IN VARCHAR2 DEFAULT NULL,
        p_inicio IN DATE DEFAULT NULL,
        p_fin IN DATE DEFAULT NULL,
        p_reusable IN VARCHAR2 DEFAULT NULL,
        p_suscripcion IN VARCHAR2 DEFAULT NULL
    ) IS
    BEGIN
        PK_SUSCRIPCIONES.MODIFICAR_PROMOCION(p_codigo, p_nombre, p_descripcion, p_inicio, p_fin, p_reusable, p_suscripcion);
    END MODIFICAR_PROMOCION;

    PROCEDURE ACTUALIZAR_SEGURO (
        p_id IN VARCHAR2,
        p_cobertura IN VARCHAR2 DEFAULT NULL,
        p_estado IN VARCHAR2 DEFAULT NULL
    ) IS
    BEGIN
        PK_SUSCRIPCIONES.ACTUALIZAR_SEGURO(p_id, p_cobertura, p_estado);
    END ACTUALIZAR_SEGURO;

    PROCEDURE ELIMINAR_SUSCRIPCION (
        p_id IN VARCHAR2
    ) IS
    BEGIN
        PK_SUSCRIPCIONES.ELIMINAR_SUSCRIPCION(p_id);
    END ELIMINAR_SUSCRIPCION;

    PROCEDURE ELIMINAR_PROMOCION (
        p_codigo IN VARCHAR2
    ) IS
    BEGIN
        PK_SUSCRIPCIONES.ELIMINAR_PROMOCION(p_codigo);
    END ELIMINAR_PROMOCION;

    PROCEDURE ADICIONAR_REPARTIDOR (
        r_nombre IN VARCHAR2,
        r_celular IN NUMBER
    ) IS
    BEGIN
        PK_ENVIOS.ADICIONAR_REPARTIDOR(r_nombre, r_celular);
    END ADICIONAR_REPARTIDOR;

    PROCEDURE CONSULTAR_REPARTIDOR (
        r_nombre IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.CONSULTAR_REPARTIDOR(r_nombre);
    END CONSULTAR_REPARTIDOR;

    PROCEDURE MODIFICAR_REPARTIDOR (
        n_nombre IN VARCHAR2,
        n_celular IN NUMBER,
        n_calificacion IN NUMBER
    ) IS
    BEGIN
        PK_ENVIOS.MODIFICAR_REPARTIDOR(n_nombre, n_celular, n_calificacion);
    END MODIFICAR_REPARTIDOR;

    PROCEDURE ELIMINAR_REPARTIDOR (
        r_nombre IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.ELIMINAR_REPARTIDOR(r_nombre);
    END ELIMINAR_REPARTIDOR;
END PK2_ADMINISTRADOR;
/


CREATE OR REPLACE PACKAGE BODY PK2_COMPRADOR AS

    PROCEDURE ADICIONAR_ENVIO (
        id_pago IN VARCHAR2,
        tipo_envio IN VARCHAR2 DEFAULT 'Estandar',
        n_direccion IN VARCHAR2 DEFAULT NULL
    ) IS
    BEGIN
        PK_ENVIOS.ADICIONAR_ENVIO (id_pago, tipo_envio, n_direccion);
    END ADICIONAR_ENVIO;

    PROCEDURE CONSULTAR_ENVIO (
        id_envio IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.CONSULTAR_ENVIO (id_envio);
    END CONSULTAR_ENVIO;

    PROCEDURE CONSULTAR_SEGUIMIENTO (
        id_envio IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.CONSULTAR_SEGUIMIENTO (id_envio);
    END CONSULTAR_SEGUIMIENTO;

    PROCEDURE INSERTAR_DEVOLUCION (
        p_motivo IN VARCHAR2,
        p_reembolso IN VARCHAR2,
        p_envio IN VARCHAR2
    ) IS
    BEGIN
        PK_DEVOLUCIONES.INSERTAR_DEVOLUCION (p_motivo, p_reembolso, p_envio);
    END INSERTAR_DEVOLUCION;

    PROCEDURE CONSULTAR_DEVOLUCIONES (
        p_id IN VARCHAR2
    ) IS
    BEGIN
        PK_DEVOLUCIONES.CONSULTAR_DEVOLUCIONES (p_id);
    END CONSULTAR_DEVOLUCIONES;
END PK2_COMPRADOR;
/


CREATE OR REPLACE PACKAGE BODY PK2_VENDEDOR AS
    
    PROCEDURE ADICIONAR_ENVIO (
        id_pago IN VARCHAR2,
        tipo_envio IN VARCHAR2 DEFAULT 'Estandar',
        n_direccion IN VARCHAR2 DEFAULT NULL
    ) IS
    BEGIN
        PK_ENVIOS.ADICIONAR_ENVIO (id_pago, tipo_envio, n_direccion);
    END ADICIONAR_ENVIO;

    PROCEDURE CONSULTAR_ENVIO (
        id_envio IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.CONSULTAR_ENVIO (id_envio);
    END CONSULTAR_ENVIO;

    PROCEDURE CONSULTAR_SEGUIMIENTO (
        id_envio IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.CONSULTAR_SEGUIMIENTO (id_envio);
    END CONSULTAR_SEGUIMIENTO;

    PROCEDURE INSERTAR_PUNTORECOGIDA (
        p_remitente IN VARCHAR2,
        p_destinatario IN VARCHAR2,
        p_direccion IN VARCHAR2,
        p_pago IN VARCHAR2
    ) IS
    BEGIN
        PK_PUNTOS_RECOGIDAS.INSERTAR_PUNTORECOGIDA (p_remitente, p_destinatario, p_direccion, p_pago);
    END INSERTAR_PUNTORECOGIDA;

    PROCEDURE ACTUALIZAR_PUNTORECOGIDA (
        p_id IN VARCHAR2
    ) IS
    BEGIN
        PK_PUNTOS_RECOGIDAS.ACTUALIZAR_PUNTORECOGIDA (p_id);
    END ACTUALIZAR_PUNTORECOGIDA;
    
    PROCEDURE CONSULTAR_PUNTOSRECOGIDA (
        p_id IN VARCHAR2
    ) IS
    BEGIN
        PK_PUNTOS_RECOGIDAS.CONSULTAR_PUNTOSRECOGIDA (p_id);
    END CONSULTAR_PUNTOSRECOGIDA;
END PK2_VENDEDOR;
/



CREATE OR REPLACE PACKAGE BODY PK2_REPARTIDOR AS
    PROCEDURE ADICIONAR_NOTIFICACION (
        p_motivo IN VARCHAR2,
        p_metodo IN VARCHAR2,
        p_seguimiento IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.ADICIONAR_NOTIFICACION (p_motivo, p_metodo, p_seguimiento);
    END ADICIONAR_NOTIFICACION;

    PROCEDURE CONSULTAR_ENVIO (
        id_envio IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.CONSULTAR_ENVIO (id_envio);
    END CONSULTAR_ENVIO;

    PROCEDURE CONSULTAR_SEGUIMIENTO (
        id_envio IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.CONSULTAR_SEGUIMIENTO (id_envio);
    END CONSULTAR_SEGUIMIENTO;

    PROCEDURE MODIFICAR_SEGUIMIENTO (
        id_envio IN VARCHAR2,
        n_estado IN VARCHAR2,
        n_ubicacion IN VARCHAR2,
        n_detalle IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.MODIFICAR_SEGUIMIENTO (id_envio, n_estado, n_ubicacion, n_detalle);
    END MODIFICAR_SEGUIMIENTO;

    PROCEDURE MODIFICAR_NOTIFICACION (
        id_envio IN VARCHAR2,
        n_motivo IN VARCHAR2,
        n_medio IN VARCHAR2
    ) IS
    BEGIN
        PK_ENVIOS.MODIFICAR_NOTIFICACION (id_envio, n_motivo, n_medio);
    END MODIFICAR_NOTIFICACION;
END PK2_REPARTIDOR;
/

COMMIT;



-- CICLO 2: Seguridad

-- 1. Creación de roles

CREATE ROLE GameLink_Administrador;
CREATE ROLE GameLink_Comprador;
CREATE ROLE GameLink_Vendedor;
CREATE ROLE GameLink_Repartidor;

-- 2. Otorgación de permisos

-- 2.1. Administrador

GRANT SELECT, INSERT, UPDATE, DELETE 
ON Repartidores
TO GameLink_Administrador;

GRANT SELECT, INSERT, UPDATE, DELETE 
ON Suscripciones
TO GameLink_Administrador;

GRANT SELECT, INSERT, UPDATE, DELETE 
ON Seguros
TO GameLink_Administrador;

GRANT SELECT, INSERT, UPDATE, DELETE 
ON Promociones
TO GameLink_Administrador;

-- 2.2. Comprador

GRANT SELECT, UPDATE, DELETE
ON Devoluciones
TO GameLink_Comprador;

GRANT SELECT, INSERT, UPDATE 
ON Envios 
TO GameLink_Comprador;

GRANT SELECT, INSERT, UPDATE
ON PuntosRecogidas
TO GameLink_Comprador;

GRANT SELECT, UPDATE 
ON Suscripciones
TO GameLink_Comprador;

GRANT SELECT
ON Seguros
TO GameLink_Comprador;

GRANT SELECT
ON Seguros
TO GameLink_Comprador;

-- 2.3. Vendedor

GRANT SELECT, INSERT, UPDATE
ON PuntosRecogidas
TO GameLink_Vendedor;

GRANT SELECT, INSERT, UPDATE
ON Envios
TO GameLink_Vendedor;

COMMIT;

-- 2.4. Repartidor

GRANT SELECT
ON Envios
TO GameLink_Repartidor;

GRANT SELECT, UPDATE, DELETE
ON Notificaciones
TO GameLink_Repartidor;

-- CICLO 2: XSeguridad
/*

-- 1. Eliminacion de roles

DROP ROLE GameLink_Administrador;
DROP ROLE GameLink_Comprador;
DROP ROLE GameLink_Vendedor;
DROP ROLE GameLink_Repartidor;

-- 2. Revocación de permisos

-- 2.1. Administrador

REVOKE SELECT, INSERT, UPDATE, DELETE
ON Repartidores
FROM GameLink_Administrador;

REVOKE SELECT, INSERT, UPDATE, DELETE
ON Suscripciones
FROM GameLink_Administrador;

REVOKE SELECT, INSERT, UPDATE, DELETE
ON Seguros
FROM GameLink_Administrador;

REVOKE SELECT, INSERT, UPDATE, DELETE
ON Promociones
FROM GameLink_Administrador;

-- 2.2. Comprador

REVOKE SELECT, UPDATE, DELETE
ON Devoluciones
FROM GameLink_Comprador;

REVOKE SELECT, INSERT, UPDATE
ON Envios
FROM GameLink_Comprador;

REVOKE SELECT, INSERT, UPDATE
ON PuntosRecogidas
FROM GameLink_Comprador;

REVOKE SELECT, UPDATE
ON Suscripciones
FROM GameLink_Comprador;

REVOKE SELECT
ON Seguros
FROM GameLink_Comprador;

REVOKE SELECT
ON Seguros
FROM GameLink_Comprador;

-- 2.3. Vendedor

REVOKE SELECT, INSERT, UPDATE
ON PuntosRecogidas
FROM GameLink_Vendedor;

REVOKE SELECT, INSERT, UPDATE
ON Envios
FROM GameLink_Vendedor;

-- 2.4. Repartidor

REVOKE SELECT
ON Envios
FROM GameLink_Repartidor;

REVOKE SELECT, UPDATE, DELETE
ON Notificaciones
FROM GameLink_Repartidor;

-- Eliminación de paquetes

DROP PACKAGE PK2_ADMINISTRADOR;
DROP PACKAGE BODY PK2_ADMINISTRADOR;
DROP PACKAGE PK2_COMPRADOR;
DROP PACKAGE BODY PK2_COMPRADOR;
DROP PACKAGE PK2_VENDEDOR;
DROP PACKAGE BODY PK2_VENDEDOR;
DROP PACKAGE PK2_REPARTIDOR;
DROP PACKAGE BODY PK2_REPARTIDOR;

COMMIT;
*/

---------- CODE END ----------