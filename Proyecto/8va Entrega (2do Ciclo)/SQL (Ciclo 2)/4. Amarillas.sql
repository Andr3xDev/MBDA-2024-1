---------- CODE START ----------

-- CICLO 2: CRUDE

-- 1. Especificación Paquete Puntos de Recogidas

CREATE OR REPLACE PACKAGE PK_PUNTOS_RECOGIDAS AS
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
    CURSOR c_PuntosRecogidas(c_id IN VARCHAR2) IS
        SELECT id, remitente, destinatario, direccion, fecha, estado, pago, devolucion
        FROM PuntosRecogidas
        WHERE c_id = id;
END PK_PUNTOS_RECOGIDAS;
/

-- 2. Especificación Paquete de Envios

CREATE OR REPLACE PACKAGE PK_ENVIOS AS
    PROCEDURE ADICIONAR_ENVIO (
        id_pago IN VARCHAR2,
        tipo_envio IN VARCHAR2 DEFAULT 'Estandar',
        n_direccion IN VARCHAR2 DEFAULT NULL
    );

    PROCEDURE ADICIONAR_NOTIFICACION (
        p_motivo IN VARCHAR2,
        p_metodo IN VARCHAR2,
        p_seguimiento IN VARCHAR2
    );

    PROCEDURE ADICIONAR_REPARTIDOR (
        r_nombre IN VARCHAR2,
        r_celular IN NUMBER
    );

    PROCEDURE CONSULTAR_ENVIO (
        id_envio IN VARCHAR2
    );

    PROCEDURE CONSULTAR_SEGUIMIENTO (
        id_envio IN VARCHAR2
    );

    PROCEDURE CONSULTAR_REPARTIDOR (
        r_nombre IN VARCHAR2
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

    PROCEDURE MODIFICAR_REPARTIDOR (
        n_nombre IN VARCHAR2,
        n_celular IN NUMBER,
        n_calificacion IN NUMBER
    );

    PROCEDURE ELIMINAR_REPARTIDOR (
        r_nombre IN VARCHAR2
    );
    CURSOR c_Envios(p_id VARCHAR2) IS
    SELECT * FROM Envios WHERE id = p_id;
END PK_ENVIOS;
/

-- 3. Especificación Paquete de Suscripciones

CREATE OR REPLACE PACKAGE PK_SUSCRIPCIONES AS
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
    
    CURSOR c_Suscripciones(p_id VARCHAR2) IS
        SELECT id, fecha, vencimiento, estado, monto, metodo, seguro
        FROM Suscripciones
        WHERE id = p_id;
    CURSOR c_Promociones(p_codigo VARCHAR2) IS
        SELECT * FROM Promociones WHERE codigo = p_codigo;
    CURSOR c_Seguros(p_id VARCHAR2) IS
        SELECT * FROM Seguros WHERE id = p_id;
END PK_SUSCRIPCIONES;
/

-- 4. Especificación Paquete de Devoluciones

CREATE OR REPLACE PACKAGE PK_DEVOLUCIONES AS
    PROCEDURE INSERTAR_DEVOLUCION (
        p_motivo IN VARCHAR2,
        p_reembolso IN VARCHAR2,
        p_envio IN VARCHAR2
    );
    PROCEDURE CONSULTAR_DEVOLUCIONES (
        p_id IN VARCHAR2
    );
    PROCEDURE ACTUALIZAR_DEVOLUCION (
        p_id IN VARCHAR2,
        p_estado IN VARCHAR2
    );
    CURSOR c_Devoluciones(p_id VARCHAR2) IS
        SELECT id, motivo, fecha, estado, reembolso
        FROM Devoluciones
        WHERE id = p_id;
END PK_DEVOLUCIONES;
/

COMMIT;



-- CICLO 2: CRUDI

-- 1. Implementación del paquete de Puntos de Recogida

CREATE OR REPLACE PACKAGE BODY PK_PUNTOS_RECOGIDAS AS
    PROCEDURE INSERTAR_PUNTORECOGIDA (
        p_remitente IN VARCHAR2,
        p_destinatario IN VARCHAR2,
        p_direccion IN VARCHAR2,
        p_pago IN VARCHAR2
    ) IS
        u_id NUMBER;
    BEGIN
        -- Generar un nuevo ID autoincremental
        SELECT NVL(MAX(TO_NUMBER(id)), 0) + 1 INTO u_id FROM PuntosRecogidas;
        
        -- Insertar el nuevo punto de recogida
        INSERT INTO PuntosRecogidas (id, remitente, destinatario, direccion, fecha, estado, pago) 
        VALUES (LPAD(u_id, 10, '0'), p_remitente, p_destinatario, p_direccion, SYSDATE, 'Pendiente', p_pago);
    END INSERTAR_PUNTORECOGIDA;

    PROCEDURE ACTUALIZAR_PUNTORECOGIDA (
        p_id IN VARCHAR2
    ) IS
    BEGIN
        UPDATE PuntosRecogidas 
        SET estado = 'Recogido',
            fecha = SYSDATE
        WHERE id = p_id;
    END ACTUALIZAR_PUNTORECOGIDA;

    PROCEDURE CONSULTAR_PUNTOSRECOGIDA (
        p_id IN VARCHAR2
    ) IS
        v_id PuntosRecogidas.id%TYPE;
        v_remitente PuntosRecogidas.remitente%TYPE;
        v_destinatario PuntosRecogidas.destinatario%TYPE;
        v_direccion PuntosRecogidas.direccion%TYPE;
        v_fecha PuntosRecogidas.fecha%TYPE;
        v_estado PuntosRecogidas.estado%TYPE;
        v_pago PuntosRecogidas.pago%TYPE;
        v_devolucion PuntosRecogidas.devolucion%TYPE;
    BEGIN
        OPEN c_PuntosRecogidas(p_id);
        LOOP
            FETCH c_PuntosRecogidas INTO v_id, v_remitente, v_destinatario, v_direccion, v_fecha, v_estado, v_pago, v_devolucion;
            EXIT WHEN c_PuntosRecogidas%NOTFOUND;

            -- Impresión en pantalla de los datos del punto de recogida consultado
            DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id);
            DBMS_OUTPUT.PUT_LINE('Remitente: ' || v_remitente);
            DBMS_OUTPUT.PUT_LINE('Destinatario: ' || v_destinatario);
            DBMS_OUTPUT.PUT_LINE('Dirección: ' || v_direccion);
            DBMS_OUTPUT.PUT_LINE('Fecha: ' || v_fecha);
            DBMS_OUTPUT.PUT_LINE('Estado: ' || v_estado);
            DBMS_OUTPUT.PUT_LINE('Pago: ' || v_pago);
            DBMS_OUTPUT.PUT_LINE('Devolución: ' || v_devolucion);

        END LOOP;
        CLOSE c_PuntosRecogidas;
    END CONSULTAR_PUNTOSRECOGIDA;
END PK_PUNTOS_RECOGIDAS;
/
-- 2. Implementación del paquete de Envios

CREATE OR REPLACE PACKAGE BODY PK_ENVIOS AS

    PROCEDURE ADICIONAR_ENVIO (
        id_pago IN VARCHAR2,
        tipo_envio IN VARCHAR2 DEFAULT 'Estandar',
        n_direccion IN VARCHAR2 DEFAULT NULL
    ) AS
        e_id VARCHAR2(10);
        c_remitente VARCHAR2(20);
        c_destinatario VARCHAR2(20);
        id_repartidor VARCHAR2(10);
    BEGIN
        -- Buscar IDs de compradores1 (remitente) y comprador2 (destinatario) usando el id_pago
        SELECT comprador1, comprador2
        INTO c_remitente, c_destinatario
        FROM Pagos p
        JOIN Intercambios i ON p.intercambio = i.id
        WHERE p.id = id_pago;

        -- Generar un nuevo ID autoincremental para el envio
        SELECT NVL(MAX(TO_NUMBER(id)), 0) + 1 INTO e_id FROM Envios;

        -- Insertar un nuevo registro en la tabla Envios
        INSERT INTO Envios (id, remitente, destinatario, fecha, estado, pago, devolucion)
        VALUES (LPAD(e_id, 10, '0'), c_remitente, c_destinatario, SYSDATE, 'Pendiente', id_pago, NULL);

        -- Insertar datos adicionales del envio segun su tipo
        IF tipo_envio = 'Estandar' THEN
            SELECT id INTO id_repartidor
            FROM (SELECT id FROM Repartidores ORDER BY DBMS_RANDOM.VALUE)
            WHERE ROWNUM = 1;

            INSERT INTO Estandares (id, costo, direccion, repartidor)
            VALUES (LPAD(e_id, 10, '0'), 10000, n_direccion, id_repartidor);
        ELSIF tipo_envio = 'Digital' THEN
            INSERT INTO Digitales (id, medio, plataforma, proteccion)
            VALUES (LPAD(e_id, 10, '0'), 'Correo', 'Gmail', 'T');
        ELSE
            RAISE_APPLICATION_ERROR(-20014, 'Tipo de envío no válido.');
        END IF;

        -- Impresión en pantalla del ID del envío
        DBMS_OUTPUT.PUT_LINE('');  
        DBMS_OUTPUT.PUT_LINE('El ID de su envío es: ' || LPAD(e_id, 10, '0'));  

        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20102, 'No se encontro la información del pago especificado.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'No fue posible registrar el envío debido a un error inesperado.');
            ROLLBACK;
    END ADICIONAR_ENVIO;

    PROCEDURE ADICIONAR_NOTIFICACION (
        p_motivo IN VARCHAR2,
        p_metodo IN VARCHAR2,
        p_seguimiento IN VARCHAR2
    ) AS
        n_id VARCHAR2(10);
    BEGIN
        DECLARE
            v_count NUMBER;
        BEGIN
            SELECT COUNT(*)
            INTO v_count
            FROM Seguimientos
            WHERE codigo = p_seguimiento;

            IF v_count = 0 THEN
                RAISE_APPLICATION_ERROR(-20217, 'No se encuentra la información del envío especificado');
            END IF;
        END;

        -- Generar un nuevo ID autoincremental para la notificacion
        SELECT NVL(MAX(TO_NUMBER(codigo)), 0) + 1 INTO n_id FROM Notificaciones;

        -- Insertar un nuevo registro en la tabla Notificaciones
        INSERT INTO Notificaciones (codigo, motivo, medio, fecha)
        VALUES (LPAD(n_id, 10, '0'), p_motivo, p_metodo, SYSDATE);

        DBMS_OUTPUT.PUT_LINE('Notificación realizada correctamente');
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20218, 'No fue posible registrar la notificación debido a un error inesperado.');
    END ADICIONAR_NOTIFICACION;

    PROCEDURE ADICIONAR_REPARTIDOR (
        r_nombre IN VARCHAR2,
        r_celular IN NUMBER
    ) AS
    BEGIN
        INSERT INTO Repartidores (id, nombre, celular, calificacion)
        VALUES (LPAD(r_nombre, 10, '0'), r_nombre, r_celular, 0);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'No fue posible agregar el repartidor debido a un error inesperado.');
            ROLLBACK;
    END ADICIONAR_REPARTIDOR;

    PROCEDURE CONSULTAR_ENVIO (
        id_envio IN VARCHAR2
    ) AS
        CURSOR c_envio IS
            SELECT *
            FROM Envios
            WHERE id = id_envio;
        v_envio Envios%ROWTYPE;
    BEGIN
        OPEN c_envio;
        FETCH c_envio INTO v_envio;
        CLOSE c_envio;

        -- Mostrar información del envío
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('ID del Envío: ' || v_envio.id);
        DBMS_OUTPUT.PUT_LINE('Remitente: ' || v_envio.remitente);
        DBMS_OUTPUT.PUT_LINE('Destinatario: ' || v_envio.destinatario);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(v_envio.fecha, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Estado: ' || v_envio.estado);
        DBMS_OUTPUT.PUT_LINE('Pago: ' || v_envio.pago);
        DBMS_OUTPUT.PUT_LINE('Devolución: ' || v_envio.devolucion);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20102, 'No se encontró información para el envío especificado.');
    END CONSULTAR_ENVIO;

    PROCEDURE CONSULTAR_SEGUIMIENTO (
        id_envio IN VARCHAR2
    ) AS
        CURSOR c_seguimientos IS
            SELECT *
            FROM Seguimientos
            WHERE codigo = id_envio;
        v_seguimiento Seguimientos%ROWTYPE;
    BEGIN
        OPEN c_seguimientos;
        FETCH c_seguimientos INTO v_seguimiento;
        CLOSE c_seguimientos;

        -- Mostrar información del seguimiento
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Código de Seguimiento: ' || v_seguimiento.codigo);
        DBMS_OUTPUT.PUT_LINE('Estado: ' || v_seguimiento.estado);
        DBMS_OUTPUT.PUT_LINE('Ubicación: ' || v_seguimiento.ubicacion);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(v_seguimiento.fecha, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Detalle: ' || v_seguimiento.detalle);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20102, 'No se encontró información para el seguimiento especificado.');
    END CONSULTAR_SEGUIMIENTO;

    PROCEDURE CONSULTAR_REPARTIDOR (
        r_nombre IN VARCHAR2
    ) AS
        CURSOR c_repartidor IS
            SELECT *
            FROM Repartidores
            WHERE nombre = r_nombre;
        v_repartidor Repartidores%ROWTYPE;
    BEGIN
        OPEN c_repartidor;
        FETCH c_repartidor INTO v_repartidor;
        CLOSE c_repartidor;

        -- Mostrar información del repartidor
        DBMS_OUTPUT.PUT_LINE('ID del Repartidor: ' || v_repartidor.id);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_repartidor.nombre);
        DBMS_OUTPUT.PUT_LINE('Celular: ' || v_repartidor.celular);
        DBMS_OUTPUT.PUT_LINE('Calificación: ' || v_repartidor.calificacion);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20102, 'No se encontró información para el repartidor especificado.');
    END CONSULTAR_REPARTIDOR;

    PROCEDURE MODIFICAR_SEGUIMIENTO (
        id_envio IN VARCHAR2,
        n_estado IN VARCHAR2,
        n_ubicacion IN VARCHAR2,
        n_detalle IN VARCHAR2
    ) AS
    BEGIN
        UPDATE Seguimientos
        SET estado = n_estado,
            ubicacion = n_ubicacion,
            detalle = n_detalle
        WHERE codigo = id_envio;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'No fue posible modificar el seguimiento debido a un error inesperado.');
            ROLLBACK;
    END MODIFICAR_SEGUIMIENTO;

    PROCEDURE MODIFICAR_NOTIFICACION (
        id_envio IN VARCHAR2,
        n_motivo IN VARCHAR2,
        n_medio IN VARCHAR2
    ) AS
    BEGIN
        UPDATE Notificaciones
        SET motivo = n_motivo,
            medio = n_medio
        WHERE codigo = id_envio;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'No fue posible modificar la notificación debido a un error inesperado.');
            ROLLBACK;
    END MODIFICAR_NOTIFICACION;

    PROCEDURE MODIFICAR_REPARTIDOR (
        n_nombre IN VARCHAR2,
        n_celular IN NUMBER,
        n_calificacion IN NUMBER
    ) AS
    BEGIN
        UPDATE Repartidores
        SET celular = n_celular,
            calificacion = n_calificacion
        WHERE nombre = n_nombre;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'No fue posible modificar el repartidor debido a un error inesperado.');
            ROLLBACK;
    END MODIFICAR_REPARTIDOR;

    PROCEDURE ELIMINAR_REPARTIDOR (
        r_nombre IN VARCHAR2
    ) AS
    BEGIN
        DELETE FROM Repartidores
        WHERE nombre = r_nombre;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'No fue posible eliminar el repartidor debido a un error inesperado.');
            ROLLBACK;
    END ELIMINAR_REPARTIDOR;

END PK_ENVIOS;
/

-- 3. Implementación del paquete de Suscripciones

CREATE OR REPLACE PACKAGE BODY PK_SUSCRIPCIONES AS
    PROCEDURE ADICIONAR_SUSCRIPCION (
        u_usuario IN VARCHAR2,
        u_monto IN NUMBER,
        u_metodo IN VARCHAR2
    ) IS
        u_id NUMBER;
        s_id NUMBER;
    BEGIN
        -- Generar un nuevo ID autoincremental para la nueva suscripcion
        SELECT NVL(MAX(TO_NUMBER(id)), 0) + 1 INTO s_id FROM Suscripciones;

        -- Insertar la nueva suscripcion
        INSERT INTO Suscripciones (id, fecha, vencimiento, estado, monto, metodo) 
        VALUES (LPAD(s_id, 10, '0'), SYSDATE, SYSDATE + 31, 'A', u_monto, u_metodo);
        
        -- Buscar el id del usuario
        SELECT id INTO u_id FROM Usuarios WHERE nombre = u_usuario;

        -- Actualizar el usuario con la nueva suscripcion
        UPDATE Usuarios 
        SET suscripcion = LPAD(s_id, 10, '0')
        WHERE id = u_id;

    END ADICIONAR_SUSCRIPCION;

    PROCEDURE ADICIONAR_PROMOCION (
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_inicio IN DATE,
        p_fin IN DATE,
        p_reusable IN VARCHAR2,
        p_suscripcion IN VARCHAR2
    ) IS
        u_id NUMBER;
        p_valor NUMBER;
    BEGIN
        SELECT NVL(MAX(TO_NUMBER(codigo)), 0) + 1 INTO u_id FROM PROMOCIONES;

        SELECT monto/5 INTO p_valor FROM SUSCRIPCIONES WHERE id = p_suscripcion;

        INSERT INTO PROMOCIONES (codigo, nombre, descripcion, f_comienzo, f_final, estado, reusable, Valor, suscripcion) 
        VALUES (LPAD(u_id, 10, '0'),p_nombre, p_descripcion, p_inicio, p_fin,'A', p_reusable, p_valor, p_suscripcion);
    END ADICIONAR_PROMOCION;

    PROCEDURE CONSULTAR_SUSCRIPCION (
        p_id IN VARCHAR2
    ) IS
        suscripcion_record Suscripciones%ROWTYPE;
    BEGIN
        OPEN c_Suscripciones(p_id);
        LOOP
            FETCH c_Suscripciones INTO suscripcion_record;
            EXIT WHEN c_Suscripciones%NOTFOUND;

            -- Mostrar los datos de la suscripción
            DBMS_OUTPUT.PUT_LINE('ID: ' || suscripcion_record.id);
            DBMS_OUTPUT.PUT_LINE('Fecha: ' || suscripcion_record.fecha);
            DBMS_OUTPUT.PUT_LINE('Vencimiento: ' || suscripcion_record.vencimiento);
            DBMS_OUTPUT.PUT_LINE('Estado: ' || suscripcion_record.estado);
            DBMS_OUTPUT.PUT_LINE('Monto: ' || suscripcion_record.monto);
            DBMS_OUTPUT.PUT_LINE('Método: ' || suscripcion_record.metodo);
            DBMS_OUTPUT.PUT_LINE('Seguro: ' || suscripcion_record.seguro);

        END LOOP;
        CLOSE c_Suscripciones;
    END CONSULTAR_SUSCRIPCION;

    PROCEDURE CONSULTAR_PROMOCION (
        p_codigo IN VARCHAR2
    ) IS
        promocion_record Promociones%ROWTYPE;
    BEGIN
        OPEN c_Promociones(p_codigo);
        LOOP
            FETCH c_Promociones INTO promocion_record;
            EXIT WHEN c_Promociones%NOTFOUND;

            -- Mostrar los datos de la promoción
            DBMS_OUTPUT.PUT_LINE('Código: ' || promocion_record.codigo || 
                                 ', Nombre: ' || promocion_record.nombre || 
                                 ', Descripción: ' || promocion_record.descripcion || 
                                 ', Fecha Comienzo: ' || promocion_record.f_comienzo || 
                                 ', Fecha Final: ' || promocion_record.f_final || 
                                 ', Estado: ' || promocion_record.estado || 
                                 ', Reusable: ' || promocion_record.reusable || 
                                 ', Valor: ' || promocion_record.valor || 
                                 ', Suscripción: ' || promocion_record.suscripcion);
        END LOOP;
        CLOSE c_Promociones;
    END CONSULTAR_PROMOCION;

    PROCEDURE CONSULTAR_SEGURO (
        p_id IN VARCHAR2
    ) IS
        seguro_record Seguros%ROWTYPE;
    BEGIN
        OPEN c_Seguros(p_id);
        LOOP
            FETCH c_Seguros INTO seguro_record;
            EXIT WHEN c_Seguros%NOTFOUND;

            -- Mostrar los datos del seguro
            DBMS_OUTPUT.PUT_LINE('ID: ' || seguro_record.id || 
                                 ', Cobertura: ' || seguro_record.cobertura || 
                                 ', Estado: ' || seguro_record.estado);
        END LOOP;
        CLOSE c_Seguros;
    END CONSULTAR_SEGURO;

    PROCEDURE ACTUALIZAR_SUSCRIPCION (
        p_id IN VARCHAR2,
        p_monto IN NUMBER DEFAULT NULL,
        p_metodo IN VARCHAR2 DEFAULT NULL
    ) IS
    BEGIN
        UPDATE SUSCRIPCIONES
        SET monto = NVL(p_monto, monto), 
            metodo = NVL(p_metodo, metodo)
        WHERE id = p_id;
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
        UPDATE PROMOCIONES
        SET nombre = NVL(p_nombre, nombre), 
            descripcion = NVL(p_descripcion, descripcion), 
            f_comienzo = NVL(p_inicio, f_comienzo), 
            f_final = NVL(p_fin, f_final), 
            reusable = NVL(p_reusable, reusable), 
            suscripcion = NVL(p_suscripcion, suscripcion)
        WHERE codigo = p_codigo;
    END MODIFICAR_PROMOCION;

    PROCEDURE ACTUALIZAR_SEGURO (
        p_id IN VARCHAR2,
        p_cobertura IN VARCHAR2 DEFAULT NULL,
        p_estado IN VARCHAR2 DEFAULT NULL
    ) IS
    BEGIN
        UPDATE SEGUROS SET 
            cobertura = NVL(p_cobertura, cobertura), 
            estado = NVL(p_estado, estado)
        WHERE id = p_id;
    END ACTUALIZAR_SEGURO;

    PROCEDURE ELIMINAR_SUSCRIPCION (
        p_id IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM SUSCRIPCIONES WHERE id = p_id;
    END ELIMINAR_SUSCRIPCION;

    PROCEDURE ELIMINAR_PROMOCION (
        p_codigo IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM PROMOCIONES WHERE codigo = p_codigo;
    END ELIMINAR_PROMOCION;
END PK_SUSCRIPCIONES;
/

-- 4. Implementación del paquete de Devoluciones

CREATE OR REPLACE PACKAGE BODY PK_DEVOLUCIONES AS
    PROCEDURE INSERTAR_DEVOLUCION (
        p_motivo IN VARCHAR2,
        p_reembolso IN VARCHAR2,
        p_envio IN VARCHAR2
    ) IS
        u_id NUMBER;
    BEGIN
        -- Generar un nuevo ID autoincremental para la devolucion
        SELECT NVL(MAX(TO_NUMBER(id)), 0) + 1 INTO u_id FROM Devoluciones;

        -- Insertar la devolucion
        INSERT INTO Devoluciones (id, motivo, fecha, estado, reembolso) 
        VALUES (LPAD(u_id, 10, '0'),p_motivo, SYSDATE, 'Pendiente', p_reembolso);

        -- Actualizar el la devolucion del envio y punto de recogida
        UPDATE Envios
        SET devolucion = LPAD(u_id, 10, '0') 
        WHERE id = p_envio;

        UPDATE PuntosRecogidas
        SET devolucion = LPAD(u_id, 10, '0') 
        WHERE id = p_envio;

    END INSERTAR_DEVOLUCION;

    PROCEDURE CONSULTAR_DEVOLUCIONES (
        p_id IN VARCHAR2
    ) IS
        v_id Devoluciones.id%TYPE;
        v_motivo Devoluciones.motivo%TYPE;
        v_fecha Devoluciones.fecha%TYPE;
        v_estado Devoluciones.estado%TYPE;
        v_reembolso Devoluciones.reembolso%TYPE;
    BEGIN
        OPEN c_Devoluciones(p_id);
        LOOP
            FETCH c_Devoluciones INTO v_id, v_motivo, v_fecha, v_estado, v_reembolso;
            EXIT WHEN c_Devoluciones%NOTFOUND;

            -- Aquí puedes realizar cualquier operación con los datos obtenidos
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Motivo: ' || v_motivo || ', Fecha: ' || v_fecha || ', Estado: ' || v_estado || 
                                 ', Reembolso: ' || v_reembolso);
        END LOOP;
        CLOSE c_Devoluciones;
    END CONSULTAR_DEVOLUCIONES;
    
    PROCEDURE ACTUALIZAR_DEVOLUCION (
        p_id IN VARCHAR2,
        p_estado IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Devoluciones 
        SET estado = p_estado,
            fecha = SYSDATE
        WHERE id = p_id;
    END ACTUALIZAR_DEVOLUCION;

END PK_DEVOLUCIONES;
/

COMMIT;



-- CICLO 2: XCRUD
/*
DROP PACKAGE PK_PUNTOS_RECOGIDAS;
DROP PACKAGE BODY PK_PUNTOS_RECOGIDAS;
DROP PACKAGE PK_ENVIOS;
DROP PACKAGE BODY PK_ENVIOS;
DROP PACKAGE PK_SUSCRIPCIONES;
DROP PACKAGE BODY PK_SUSCRIPCIONES;
DROP PACKAGE PK_DEVOLUCIONES;
DROP PACKAGE BODY PK_DEVOLUCIONES;
*/
---------- CODE END ----------