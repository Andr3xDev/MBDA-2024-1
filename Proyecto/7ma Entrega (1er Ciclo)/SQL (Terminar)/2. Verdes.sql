---------- CODE START ----------

-- CICLO 1: Tuplas

-- 1. Validar que las personas que vayan a realizar un intercambio no sean iguales.

ALTER TABLE Intercambios
ADD CONSTRAINT CK_INTERCAMBIOS_COMPRADOR1_COMPRADOR2_DISTINTOS
CHECK (comprador1 != comprador2);

-- 2. Validar que la fecha de lanzamiento de los juegos esté entre 1970 y el año actual.

ALTER TABLE Juegos
ADD CONSTRAINT CK_JUEGOS_FECHA_LANZAMIENTO
CHECK (lanzamiento BETWEEN TO_DATE('01-01-1970', 'DD-MM-YYYY') AND TO_DATE('01-01-2025', 'DD-MM-YYYY'));

-- 3. Validar que la cantidad de productos ofrecidos e intercambiados sea mayor que cero.

ALTER TABLE Ofrecimientos   
ADD CONSTRAINT CK_OFRECIMIENTOS_CANTIDAD_POSITIVA
CHECK (cantidad >= 0);

ALTER TABLE Intercambios
ADD CONSTRAINT CK_INTERCAMBIOS_CANTIDAD1_POSITIVA
CHECK (cantidad1 >= 0);

ALTER TABLE Intercambios 
ADD CONSTRAINT CK_INTERCAMBIOS_CANTIDAD2_POSITIVA
CHECK (cantidad2 >= 0);

COMMIT;


-- CICLO 1: Acciones

-- 1. Si un vendedor se retira de la plataforma, se deben eliminar todas sus ofertas de productos asociadas.

ALTER TABLE Vendedores
DROP CONSTRAINT FK_VENDEDORES_USUARIOS;
ALTER TABLE Ofrecimientos
DROP CONSTRAINT FK_OFRECIMIENTOS_VENDEDORES;
ALTER TABLE Vendedores
ADD CONSTRAINT FK_VENDEDORES_USUARIOS FOREIGN KEY (id) REFERENCES Usuarios (id) ON DELETE CASCADE;
ALTER TABLE Ofrecimientos
ADD CONSTRAINT FK_OFRECIMIENTOS_VENDEDORES FOREIGN KEY (vendedor) REFERENCES Vendedores (id) ON DELETE CASCADE;

-- 2. Si un comprador se retira de la plataforma, su wishlist se elimina.

ALTER TABLE WishLists
DROP CONSTRAINT FK_WISHLISTS_COMPRADORES;
ALTER TABLE WishLists
ADD CONSTRAINT FK_WISHLISTS_COMPRADORES FOREIGN KEY (id) REFERENCES Compradores (id) ON DELETE CASCADE;
 
-- 3. Si un vendedor elimina un producto, se deben eliminar las calificaciones asociadas al producto.

ALTER TABLE Calificaciones
DROP CONSTRAINT FK_CALIFICACIONES_PRODUCTOS;
ALTER TABLE Calificaciones
ADD CONSTRAINT FK_CALIFICACIONES_PRODUCTOS FOREIGN KEY (producto) REFERENCES Productos (id) ON DELETE CASCADE;    

-- 4. Si un usuario elimina su cuenta, se deben eliminar su perfil de comprador y vendedor.

ALTER TABLE Compradores
DROP CONSTRAINT FK_COMPRADORES_USUARIOS;
ALTER TABLE Vendedores
DROP CONSTRAINT FK_VENDEDORES_USUARIOS;
ALTER TABLE Compradores
ADD CONSTRAINT FK_COMPRADORES_USUARIOS FOREIGN KEY (id) REFERENCES usuarios(id) ON DELETE CASCADE;
ALTER TABLE Vendedores
ADD CONSTRAINT FK_VENDEDORES_USUARIOS FOREIGN KEY (id) REFERENCES usuarios(id) ON DELETE CASCADE;

COMMIT;



-- CICLO 1: Disparadores (Triggers)
-- NOTA: Ejecutar los siguientes disparadores después de los PoblarOK para que la BD tenga un historial de uso simulado.

-- 1. Un usuario solo puede modificar su nombre, correo, celular y dirección.

CREATE OR REPLACE TRIGGER TG_USUARIOS_MODIFICAR_ATRIBUTOS_BU
BEFORE UPDATE ON Usuarios
FOR EACH ROW
BEGIN
    IF :OLD.id = :NEW.id THEN
        IF NVL(:OLD.nombre, 'NULL') <> NVL(:NEW.nombre, 'NULL') OR
           NVL(:OLD.correo, 'NULL') <> NVL(:NEW.correo, 'NULL') OR
           NVL(:OLD.celular, 'NULL') <> NVL(:NEW.celular, 'NULL') OR
           NVL(:OLD.direccion, 'NULL') <> NVL(:NEW.direccion, 'NULL')
        THEN
            NULL;
        ELSE
            RAISE_APPLICATION_ERROR(-20101, 'El usuario solo puede modificar su nombre, correo, celular y dirección.');
        END IF;
    END IF;
END;
/

-- 2. Un vendedor solo puede modificar su Nit y Tipo.

CREATE OR REPLACE TRIGGER TG_VENDEDORES_MODIFICAR_ATRIBUTOS_BU
BEFORE UPDATE ON Vendedores
FOR EACH ROW
BEGIN
    IF :OLD.id = :NEW.id THEN
        IF NVL(:OLD.nit, 'NULL') <> NVL(:NEW.nit, 'NULL') OR
           NVL(:OLD.tipo, 'NULL') <> NVL(:NEW.tipo, 'NULL')
        THEN
            NULL;
        ELSE
            RAISE_APPLICATION_ERROR(-20102, 'El vendedor solo puede modificar su Nit y Tipo.');
        END IF;
    END IF;
END;
/

-- 3. Un vendedor puede modificar todos los atributos de un producto, menos el ID.

CREATE OR REPLACE TRIGGER TG_PRODUCTOS_MODIFICAR_ATRIBUTOS_BU
BEFORE UPDATE ON Productos
FOR EACH ROW
BEGIN
    IF :OLD.id <> :NEW.id THEN
        RAISE_APPLICATION_ERROR(-20103, 'No se puede modificar el id del producto');
    END IF;
END;
/

-- 4. El estado del intercambio se modifica en función del estado del pago.

CREATE OR REPLACE TRIGGER TR_PAGOS_ESTADO_BI_BU
BEFORE INSERT OR UPDATE ON Pagos
FOR EACH ROW
BEGIN
    IF :NEW.estado = 'Pendiente 1' THEN
        UPDATE Intercambios
        SET estado = 'Pendiente 1'
        WHERE id = :NEW.intercambio;
    ELSIF :NEW.estado = 'Pendiente 2' THEN
        UPDATE Intercambios
        SET estado = 'Pendiente 2'
        WHERE id = :NEW.intercambio;
    ELSIF :NEW.estado = 'Aprobado' THEN
        UPDATE Intercambios
        SET estado = 'Aprobado'
        WHERE id = :NEW.intercambio;
    END IF;
END;
/

-- 5. A medida que un usuario intercambia más productos, su tipo de experiencia aumenta.
/*
CREATE OR REPLACE PROCEDURE ACTUALIZAR_EXPERIENCIA_COMPRADORES(
    p_comprador1 IN NUMBER,
    p_comprador2 IN NUMBER
) AS
    c1_intercambios NUMBER;
    c2_intercambios NUMBER;
BEGIN
    -- Actualizar experiencia del comprador 1
    SELECT COUNT(*) INTO c1_intercambios
    FROM Intercambios
    WHERE comprador1 = p_comprador1 AND estado = 'Aprobado';

    IF c1_intercambios <= 10 THEN
        UPDATE Compradores
        SET experiencia = 'Novato'
        WHERE id = p_comprador1;
    ELSIF c1_intercambios > 10 AND c1_intercambios <= 20 THEN
        UPDATE Compradores
        SET experiencia = 'Entusiasta'
        WHERE id = p_comprador1;
    ELSIF c1_intercambios > 20 AND c1_intercambios <= 50 THEN
        UPDATE Compradores
        SET experiencia = 'Coleccionista'
        WHERE id = p_comprador1;
    ELSE
        UPDATE Compradores
        SET experiencia = 'Gamer'
        WHERE id = p_comprador1;
    END IF;

    -- Actualizar experiencia del comprador 2
    SELECT COUNT(*) INTO c2_intercambios
    FROM Intercambios
    WHERE comprador2 = p_comprador2 AND estado = 'Aprobado';

    IF c2_intercambios <= 10 THEN
        UPDATE Compradores
        SET experiencia = 'Novato'
        WHERE id = p_comprador2;
    ELSIF c2_intercambios > 10 AND c2_intercambios <= 20 THEN
        UPDATE Compradores
        SET experiencia = 'Entusiasta'
        WHERE id = p_comprador2;
    ELSIF c2_intercambios > 20 AND c2_intercambios <= 50 THEN
        UPDATE Compradores
        SET experiencia = 'Coleccionista'
        WHERE id = p_comprador2;
    ELSE
        UPDATE Compradores
        SET experiencia = 'Gamer'
        WHERE id = p_comprador2;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_COMPRADORES_EXPERIENCIA_AI
AFTER INSERT ON Intercambios
FOR EACH ROW
BEGIN
    ACTUALIZAR_EXPERIENCIA_COMPRADORES(:NEW.comprador1, :NEW.comprador2);
END;
/

CREATE OR REPLACE TRIGGER TG_COMPRADORES_EXPERIENCIA_AU
AFTER UPDATE ON Intercambios
FOR EACH ROW
BEGIN
    ACTUALIZAR_EXPERIENCIA_COMPRADORES(:NEW.comprador1, :NEW.comprador2);
END;
/
*/
-- 6. Los compradores solo pueden hacer una calificación para cada producto adquirido.

CREATE OR REPLACE TRIGGER TG_CALIFICACIONES_UNICA_BI
BEFORE INSERT ON Calificaciones
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Calificaciones
    WHERE comprador = :NEW.comprador
    AND producto = :NEW.producto;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20106, 'El comprador ya ha realizado una calificación para este producto.');
    END IF;
END;
/

-- 7. Un comprador solo puede calificar un producto después de comprarlo.

CREATE OR REPLACE TRIGGER TG_CALIFICACIONES_COMPRAR_BI
BEFORE INSERT ON Calificaciones
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM CompradoresXProductos
    WHERE comprador = :NEW.comprador
    AND producto = :NEW.producto;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20107, 'El comprador debe adquirir el producto antes de calificarlo.');
    END IF;
END;
/

-- 8. Validar que un vendedor no pueda calificar sus propios productos.

CREATE OR REPLACE TRIGGER TG_CALIFICACIONES_COMPRADOR_DISTINTO_PRODUCTO_BI
BEFORE INSERT ON Calificaciones
FOR EACH ROW
DECLARE
    id_vendedor VARCHAR2(10);
BEGIN
    SELECT vendedor INTO id_vendedor
    FROM Ofrecimientos
    WHERE producto = :NEW.producto;

    IF id_vendedor = :NEW.comprador THEN
        RAISE_APPLICATION_ERROR(-20108, 'Un vendedor no puede calificar su propio producto.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20201, 'No se encontró el comprador y/o el producto especificados.');
END;
/

-- 9. Validar que la cantidad de productos agregados a una WishList no puede ser superior a
--    la cantidad actual ofrecida por el vendedor.

CREATE OR REPLACE TRIGGER TR_WISHLISTS_VALIDAR_CANTIDAD_PRODUCTO_BI
BEFORE INSERT ON WishListsXProductos
FOR EACH ROW
DECLARE
    v_cantidad_producto NUMBER;
BEGIN
    SELECT cantidad INTO v_cantidad_producto
    FROM Ofrecimientos
    WHERE producto = :NEW.producto
    AND ROWNUM = 1;
    
    IF :NEW.cantidad > v_cantidad_producto THEN
        RAISE_APPLICATION_ERROR(-20109, 'La cantidad de productos agregados a la WishList no puede ser superior a la cantidad actual ofrecida por el vendedor.');
    END IF;
END;
/	
	
-- 10. Las calificaciones de los productos no se pueden eliminar.

CREATE OR REPLACE TRIGGER TR_CALIFICACIONES_ELIMINAR_BD
BEFORE DELETE ON Calificaciones
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20110, 'No se pueden eliminar las calificaciones de los productos.');
END;
/

-- 11. Un comprador no puede agregar a su wishlist sus propios productos.

CREATE OR REPLACE TRIGGER TR_WISHLISTSXPRODUCTOS_AGREGAR_PRODUCTOS_PROPIOS_BI
BEFORE INSERT ON WishListsXProductos
FOR EACH ROW
DECLARE
    id_vendedor VARCHAR2(10);
BEGIN
    SELECT vendedor INTO id_vendedor
    FROM Ofrecimientos
    WHERE producto = :NEW.producto
    AND ROWNUM = 1;

    IF id_vendedor = :NEW.wishlist THEN
        RAISE_APPLICATION_ERROR(-20111, 'No puedes agregar tus propios productos a tu lista de deseos.');
    END IF;
END;
/

-- 12. Si el estado de un pago se actualiza a 'Aprobado',
--     entonces se deben descontar las cantidades intercambiadas de los productos ofrecidos por los vendedores.

CREATE OR REPLACE TRIGGER TR_PAGOS_DESCONTAR_CANTIDAD_PRODUCTOS_OFRECIDOS_AU
AFTER UPDATE ON Pagos
FOR EACH ROW
DECLARE
    id_comprador VARCHAR2(10);
BEGIN
    IF :NEW.estado = 'Aprobado' AND :OLD.estado != 'Aprobado' THEN
        -- Descontar la cantidad intercambiada del producto1
        SELECT comprador1 INTO id_comprador
        FROM Intercambios
        WHERE id = :NEW.intercambio;

        UPDATE Ofrecimientos
        SET cantidad = cantidad - (
            SELECT cantidad1
            FROM Intercambios
            WHERE id = :NEW.intercambio
        )
        WHERE producto = (
            SELECT producto1
            FROM Intercambios
            WHERE id = :NEW.intercambio
        );

        -- Descontar la cantidad intercambiada del producto2
        SELECT comprador2 INTO id_comprador
        FROM Intercambios
        WHERE id = :NEW.intercambio;

        UPDATE Ofrecimientos
        SET cantidad = cantidad - (
            SELECT cantidad2
            FROM Intercambios
            WHERE id = :NEW.intercambio
        )
        WHERE producto = (
            SELECT producto2
            FROM Intercambios
            WHERE id = :NEW.intercambio
        );
        COMMIT;
    END IF;
END;
/


-- 13. Si el estado de un pago se actualiza a 'Aprobado',
--     entonces se deben registrar los datos de los dos compradores y productos en la BD.

CREATE OR REPLACE TRIGGER TR_PAGOS_REGISTRAR_COMPRADORESXPRODUCTOS_AU
AFTER UPDATE ON Pagos
FOR EACH ROW
BEGIN
    IF :NEW.estado = 'Aprobado' AND :OLD.estado != 'Aprobado' THEN
        INSERT INTO CompradoresXProductos (comprador, producto)
        SELECT comprador1, producto2
        FROM Intercambios
        WHERE id = :NEW.intercambio;

        INSERT INTO CompradoresXProductos (comprador, producto)
        SELECT comprador2, producto1
        FROM Intercambios
        WHERE id = :NEW.intercambio;
    END IF;
END;
/

COMMIT;



-- CICLO 1: XDisparadores
/*
DROP TRIGGER TG_USUARIOS_MODIFICAR_ATRIBUTOS_BU;
DROP TRIGGER TG_VENDEDORES_MODIFICAR_ATRIBUTOS_BU;
DROP TRIGGER TG_PRODUCTOS_MODIFICAR_ATRIBUTOS_BU;
DROP TRIGGER TR_PAGOS_ESTADO_BI_BU;
DROP TRIGGER TG_COMPRADORES_EXPERIENCIA_AI;
DROP TRIGGER TG_COMPRADORES_EXPERIENCIA_AU;
DROP TRIGGER TG_CALIFICACIONES_UNICA_BI;
DROP TRIGGER TG_CALIFICACIONES_COMPRAR_BI;
DROP TRIGGER TG_CALIFICACIONES_COMPRADOR_DISTINTO_PRODUCTO_BI;
DROP TRIGGER TR_WISHLISTS_VALIDAR_CANTIDAD_PRODUCTO_BI;
DROP TRIGGER TR_CALIFICACIONES_ELIMINAR_BD;
DROP TRIGGER TR_WISHLISTSXPRODUCTOS_AGREGAR_PRODUCTOS_PROPIOS_BI;
DROP TRIGGER TR_PAGOS_DESCONTAR_CANTIDAD_PRODUCTOS_OFRECIDOS_AU;
DROP TRIGGER TR_PAGOS_REGISTRAR_COMPRADORESXPRODUCTOS_AU;
COMMIT;
*/
---------- CODE END ----------\