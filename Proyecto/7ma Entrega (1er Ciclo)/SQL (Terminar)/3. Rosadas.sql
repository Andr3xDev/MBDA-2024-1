---------- CODE START ----------

-- CICLO 1: Índices

CREATE INDEX I_USUARIOS 
ON USUARIOS (nombre);

CREATE INDEX I_VENDEDORES
ON VENDEDORES (nit);

CREATE INDEX I_OFRECIMIENTOS
ON OFRECIMIENTOS (precio);

CREATE INDEX I_PRODUCTOS
ON PRODUCTOS (nombre);

CREATE INDEX I_CLAVES
ON CLAVES (tipo);

CREATE INDEX I_JUEGOS
ON JUEGOS (desarrollador);

CREATE INDEX I1_INTERCAMBIOS
ON INTERCAMBIOS (comprador1, comprador2);

CREATE INDEX I2_INTERCAMBIOS
ON INTERCAMBIOS (fecha);

CREATE INDEX I_PAGOS
ON PAGOS (fecha);

COMMIT;


-- CICLO 1: Vistas

-- 1. Número de nuevos usuarios en la plataforma durante la última semana y fecha actual

CREATE OR REPLACE VIEW V_USUARIOS_NUEVOS AS
SELECT COUNT(*) AS numero_usuarios_nuevos, 
       TRUNC(SYSDATE) AS fecha_actual
FROM Usuarios
WHERE registro >= TRUNC(SYSDATE) - 7;

-- 2. Mejores productos ofertados durante el último mes (los más intercambiados y con disponibilidad)

CREATE OR REPLACE VIEW V_MEJORES_PRODUCTOS_OFERTADOS AS
SELECT p.nombre AS nombre_producto,
       o.precio,
       o.cantidad,
       p.disponibilidad,
       COUNT(i.id) AS cantidad_intercambios_ultima_semana
FROM Ofrecimientos o
JOIN Productos p ON o.producto = p.id
JOIN Intercambios i ON (o.producto = i.producto1 OR o.producto = i.producto2)
WHERE i.fecha >= TRUNC(SYSDATE, 'MM') - INTERVAL '1' MONTH
AND p.disponibilidad = 'T'
GROUP BY p.nombre, o.precio, o.cantidad, p.disponibilidad;

-- 3. Productos intercambiados en la última semana

CREATE OR REPLACE VIEW V_PRODUCTOS_INTERCAMBIADOS AS
SELECT 
    p1.nombre AS producto1_nombre,
    i.cantidad1 AS cantidad1,
    p2.nombre AS producto2_nombre,
    i.cantidad2 AS cantidad2,
    i.fecha
FROM Intercambios i
JOIN Productos p1 ON i.producto1 = p1.id
JOIN Productos p2 ON i.producto2 = p2.id
WHERE i.estado = 'Aprobado'
AND i.fecha >= SYSDATE - INTERVAL '7' DAY;

-- 4. Cantidad de intercambios en el último mes

CREATE OR REPLACE VIEW V_CANTIDAD_INTERCAMBIOS_ULTIMO_MES AS
SELECT 
    COUNT(*) AS cantidad_intercambios,
    TRUNC(SYSDATE) - INTERVAL '1' MONTH AS desde,
    TRUNC(SYSDATE) AS hasta
FROM Intercambios
WHERE fecha >= TRUNC(SYSDATE) - INTERVAL '1' MONTH;

-- 5. Reporte de las calificaciones negativas de productos intercambiados para analizar la satisfacción de los usuarios (Administrador)

CREATE OR REPLACE VIEW V_CALIFICACIONES_INCIDENCIAS AS
SELECT 
    uc.nombre AS nombre_comprador,
    uv.nombre AS nombre_vendedor,
    p.nombre AS nombre_producto,
    cal.estrellas,
    cal.fecha,
    cal.comentario
FROM 
    Calificaciones cal
JOIN 
    Usuarios uc ON cal.comprador = uc.id
JOIN 
    Productos p ON cal.producto = p.id
JOIN 
    Ofrecimientos o ON p.id = o.producto
JOIN 
    Vendedores v ON o.vendedor = v.id
JOIN 
    Usuarios uv ON v.id = uv.id
WHERE 
    cal.estrellas <= 2
ORDER BY 
    cal.fecha DESC;

COMMIT;

-- CICLO 1: XIndicesVistas
/*
DROP INDEX I_USUARIOS;
DROP INDEX I_VENDEDORES;
DROP INDEX I_OFRECIMIENTOS;
DROP INDEX I_PRODUCTOS;
DROP INDEX I_CLAVES;
DROP INDEX I_JUEGOS;
DROP INDEX I1_INTERCAMBIOS;
DROP INDEX I2_INTERCAMBIOS;
DROP INDEX I_PAGOS;
COMMIT;
DROP VIEW V_USUARIOS_NUEVOS;
DROP VIEW V_MEJORES_PRODUCTOS_OFERTADOS;
DROP VIEW V_PRODUCTOS_INTERCAMBIADOS;
DROP VIEW V_CANTIDAD_INTERCAMBIOS_ULTIMO_MES;
DROP VIEW V_CALIFICACIONES_INCIDENCIAS;
COMMIT;
*/
---------- CODE END ----------