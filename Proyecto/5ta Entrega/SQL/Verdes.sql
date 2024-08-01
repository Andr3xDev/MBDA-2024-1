---------- CODE START ----------

-- CICLO 1: Tuplas

-- 1. Validar que el total de cada intercambio coincida con la suma de los precios de los productos intercambiados.

ALTER TABLE Intercambios
ADD CONSTRAINT CK_INTERCAMBIOS_TOTAL_PRECIOS
CHECK (
    total = (
        SELECT SUM(precio)
        FROM Productos
        WHERE id IN (producto1, producto2)
    )
);

-- 2. Validar que el comprador y el vendedor no sean la misma persona.

ALTER TABLE Intercambios
ADD CONSTRAINT CK_INTERCAMBIOS_COMPRADOR_VENDEDOR_DISTINTOS
CHECK (comprador != vendedor);

-- 3. Validar que un vendedor no pueda calificar su propio producto.

ALTER TABLE Calificaciones
ADD CONSTRAINT CK_CALIFICACIONES_COMPRADOR_DISTINTO_PRODUCTO
CHECK (NOT EXISTS (
    SELECT *
    FROM Intercambios
    WHERE id = intercambio AND comprador = comprador AND (producto1 = producto OR producto2 = producto)
));

-- 4. Validar que la fecha del intercambio sea posterior a la fecha de registro del comprador y del vendedor.

ALTER TABLE Intercambios
ADD CONSTRAINT CK_INTERCAMBIOS_FECHA_POSTERIOR_REGISTRO
CHECK (
    fecha >= (SELECT registro FROM Usuarios WHERE id = comprador)
    AND fecha >= (SELECT registro FROM Usuarios WHERE id = vendedor)
);

-- 5. Validar que un vendedor no pueda ofertar un producto que no esté en existencias.

ALTER TABLE Ofrecimientos
ADD CONSTRAINT CK_OFRECIMIENTOS_EXISTENCIA_PRODUCTO
CHECK (cantidad <= (SELECT COUNT(*) FROM Productos WHERE id = producto AND disponibilidad = 'T'));



-- CICLO 1: Acciones

-- 1. Las calificaciones de los productos no se pueden eliminar (Validar por qué SQLD no reconoce el DELECTE RESTRICT)

ALTER TABLE Calificaciones
ADD CONSTRAINT FK_CALIFICACIONES_PRODUCTOS
FOREIGN KEY (producto) REFERENCES Productos (id);


-- 2. Si un vendedor se retira de la plataforma, se deben eliminar todas sus ofertas de productos asociadas

-- [Andres]

-- 3. Si un comprador se retira de la plataforma, la wishlist se elimina

ALTER TABLE Compradores
ADD CONSTRAINT FK_COMPRADORES_WISHLISTS
FOREIGN KEY (wishlist) REFERENCES WishLists (id) ON DELETE CASCADE;

-- 4. Si un vendedor elimina un producto, se deben eliminar las calificaciones asociadas al producto (AR)

-- [Andres]



-- CICLO 1: Disparadores (Triggers)

-- 1. El id del usuario se genera automáticamente

-- [Andres]

-- 2. Validar que el año de lanzamiento de los videojuegos sea mayor a 1970

-- [Andres]

-- 3. Si el género del producto no se encuentra en las opciones, se solicita al usuario crear uno

CREATE OR REPLACE TRIGGER TG_GENEROS_GENERO_BI
BEFORE INSERT OR UPDATE ON Productos
FOR EACH ROW
BEGIN
    IF :NEW.genero NOT IN (SELECT genero FROM Generos) THEN
        RAISE_APPLICATION_ERROR(-20001, 'El género del producto no se encuentra en las opciones. Por favor seleccione de nuevo.');
    END IF;
END;
/

-- 4. Si no se indica el nombre del usuario se le asigna: Nombre de '<id>'

-- [Andres]

-- 5. La fecha de registro del usuario se genera automáticamente

CREATE OR REPLACE TRIGGER TG_USUARIOS_REGISTRO_AI
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
    :NEW.registro := SYSDATE;
END;
/

-- 6. El total del intercambio se autocalcula como el precio del producto más el envío

-- [Andres]

-- 7. La fecha provisional del pago se autogenera cuando se confirma el intercambio

CREATE OR REPLACE TRIGGER TG_PAGOS_FECHA_INICIAL_AI
AFTER UPDATE ON Intercambios
FOR EACH ROW
WHEN (NEW.estado = 'Aprobado')
BEGIN
    UPDATE Pagos
    SET fecha = SYSDATE
    WHERE intercambio = :NEW.id;
END;
/

-- 8. La fecha del intercambio se autogenera cuando los usuarios aprueban el intercambio

CREATE OR REPLACE TRIGGER TG_INTERCAMBIOS_FECHA_AI
AFTER UPDATE ON Intercambios
FOR EACH ROW
WHEN (NEW.estado = 'Aprobado')
BEGIN
    :NEW.fecha := SYSDATE;
END;
/

-- 9. Los compradores solo pueden hacer una calificación para cada producto adquirido

-- [Andres]

-- 10. A medida que un usuario compra más productos, su tipo de experiencia cambia

-- [Andres]

-- 11. Un comprador solo puede calificar un producto después de comprarlo (TR)

-- [Andres]

-- 12. Un comprador solo puede hacer una calificación para cada producto adquirido

CREATE OR REPLACE TRIGGER TG_CALIFICACIONES_ESTRELLAS_BI
BEFORE INSERT ON Calificaciones
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Calificaciones WHERE comprador = :NEW.comprador AND producto = :NEW.producto) THEN
        RAISE_APPLICATION_ERROR(-20002, 'El comprador ya ha realizado una calificación para este producto.');
    END IF;
END;
/

-- 13. El usuario solo puede modificar su nombre, correo, celular y dirección

CREATE OR REPLACE TRIGGER TG_USUARIOS_MODIFICAR_ATRIBUTOS_BI
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
            RAISE_APPLICATION_ERROR(-20003, 'El usuario solo puede modificar su nombre, correo, celular y dirección.');
        END IF;
    END IF;
END;
/

-- 14. El vendedor puede modificar su Nit y Tipo

CREATE OR REPLACE TRIGGER TG_VENDEDORES_MODIFICAR_ATRIBUTOS_BI
BEFORE UPDATE ON Vendedores
FOR EACH ROW
BEGIN
    IF :OLD.id = :NEW.id THEN
        IF NVL(:OLD.nit, 'NULL') <> NVL(:NEW.nit, 'NULL') OR
           NVL(:OLD.tipo, 'NULL') <> NVL(:NEW.tipo, 'NULL')
        THEN
            NULL;
        ELSE
            RAISE_APPLICATION_ERROR(-20004, 'El vendedor solo puede modificar su Nit y tipo.');
        END IF;
    END IF;
END;
/

-- 15. El vendedor puede modificar todos los atributos de los productos, menos los id

-- [Andres]

-- 16. El estado del intercambio se automodifica en función del estado del pago

-- [Andres]

-- 17. La fecha final del pago se cambia cuando el estado del pago sea "Aprobado"

CREATE OR REPLACE TRIGGER TG_PAGOS_FECHA_FINAL_AU
AFTER UPDATE ON Pagos
FOR EACH ROW
BEGIN
    IF :OLD.estado <> 'Aprobado' AND :NEW.estado = 'Aprobado' THEN
        :NEW.fecha := SYSDATE;
    END IF;
END;
/



-- CICLO 1: XDisparadores

DROP TRIGGER TR_NAME_1;
DROP TRIGGER TR_NAME_2;
DROP TRIGGER TG_GENEROS_GENERO_BI;
DROP TRIGGER TR_NAME_4;
DROP TRIGGER TG_USUARIOS_REGISTRO_AI;
DROP TRIGGER TR_NAME_6;
DROP TRIGGER TG_PAGOS_FECHA_INICIAL_AI;
DROP TRIGGER TG_INTERCAMBIOS_FECHA_AI;
DROP TRIGGER TR_NAME_9;
DROP TRIGGER TR_NAME_10;
DROP TRIGGER TR_NAME_11;
DROP TRIGGER TG_CALIFICACIONES_ESTRELLAS_BI;
DROP TRIGGER TG_USUARIOS_MODIFICAR_ATRIBUTOS_BI;
DROP TRIGGER TG_VENDEDORES_MODIFICAR_ATRIBUTOS_BI;
DROP TRIGGER TR_NAME_15;
DROP TRIGGER TR_NAME_16;
DROP TRIGGER TG_PAGOS_FECHA_FINAL_AU;

---------- CODE END ----------