-- CRUDE
-- Registrar un Extra
CREATE  PACKAGE crudExtra AS
    FUNCTION registrarExtra(
        descripcion IN VARCHAR2,
        precio IN NUMBER,
        descuento IN NUMBER,
        booking_id IN VARCHAR2
    ) RETURN VARCHAR2;

    PROCEDURE actualizarodetallar(
        detail IN VARCHAR2,
        extra IN VARCHAR2
    );

    FUNCTION consultarTotalExtras(
        extra IN VARCHAR2
    ) RETURN SYS_REFCURSOR;

    PROCEDURE eliminarExtra(
        extra IN VARCHAR2
    );

    FUNCTION consultarSemanas(
        extra IN VARCHAR2
    ) RETURN SYS_REFCURSOR;

    FUNCTION consultarBooking(
        Booking IN VARCHAR2
    ) RETURN SYS_REFCURSOR;
    
END crudExtra;
/

-- CRUDI
CREATE  PACKAGE BODY crudExtra AS
    FUNCTION registrarExtra(
        descripcion IN VARCHAR2,
        precio IN NUMBER,
        descuento IN NUMBER,
        booking_id IN VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO extras (descripcion, precio, descuento, booking_id)
        VALUES (descripcion, precio, descuento, booking_id);
        RETURN 'Extra registrado';
    END registrarExtra;

    PROCEDURE actualizarodetallar(
        detail IN VARCHAR2,
        extra IN VARCHAR2
    ) IS
    BEGIN
        UPDATE extras
        SET descripcion = detail
        WHERE booking_id = extra;
    END actualizarodetallar;

    FUNCTION consultarTotalExtras(
        extra IN VARCHAR2
    ) RETURN SYS_REFCURSOR IS
        ref_cursor SYS_REFCURSOR;
    BEGIN
        OPEN ref_cursor FOR
        SELECT * FROM extras WHERE booking_id = extra;
        RETURN ref_cursor;
    END consultarTotalExtras;

    PROCEDURE eliminarExtra(
        extra IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM extras WHERE booking_id = extra;
    END eliminarExtra;

    FUNCTION consultarSemanas(
        extra IN VARCHAR2
    ) RETURN SYS_REFCURSOR IS
        ref_cursor SYS_REFCURSOR;
    BEGIN
        OPEN ref_cursor FOR
        SELECT * FROM extras WHERE booking_id = extra;
        RETURN ref_cursor;
    END consultarSemanas;

    FUNCTION consultarBooking(
        Booking IN VARCHAR2
    ) RETURN SYS_REFCURSOR IS
        ref_cursor SYS_REFCURSOR;
    BEGIN
        OPEN ref_cursor FOR
        SELECT * FROM extras WHERE booking_id = Booking;
        RETURN ref_cursor;
    END consultarBooking;
END crudExtra;
/
-- CRUDX
DROP PACKAGE crudExtra;
DROP PACKAGE BODY crudExtra;

-- CRUDOK
BEGIN
    crudExtra.registrarExtra('Extra Description', 10, 0, '123456');
    crudExtra.registrarExtra('Extra Description2', 20, 1, '0987776');
    crudExtra.consultarTotalExtras(:ref_cursor);
END;
/

-- CRUDNoOK

BEGIN
    crudExtra.registrarExtra(894003, 10, '3213', '123456');
    crudExtra.registrarExtra(803133, 10, '1533', '1231525');
    crudExtra.consultarTotalExtras(:ref_cursor);
END;
/