---------- CODE START ----------

-- CICLO 2: �?ndices

CREATE INDEX I_PROMOCIONES
ON Promociones (nombre);

CREATE INDEX I_PUNTOSRECOGIDA
ON PuntosRecogidas (remitente, destinatario);

CREATE INDEX I_ENVIOS
ON Envios (remitente, destinatario);

CREATE INDEX I_REPARTIDORES
ON Repartidores (nombre);

COMMIT;


-- CICLO 2: Vistas

-- 1. Ver los beneficios de las suscripciones activas

CREATE OR REPLACE VIEW  V_BENEFICIOS_SUSCRIPCIONES AS
SELECT
    COUNT(S.id) AS cantidad_suscripciones,
    SUM(S.monto) AS ingresos_suscripciones,
    COUNT(P.codigo) AS cantidad_promociones,
    SUM(P.valor) AS egresos_promociones,
    SYSDATE AS fecha_actual,
    SUM(S.monto) - SUM(P.valor) AS beneficios
FROM
    Suscripciones S
    LEFT JOIN Promociones P ON S.id = P.suscripcion
WHERE
    S.estado = 'A'
GROUP BY
    SYSDATE;

-- 2. Envios pendientes de entrega

CREATE OR REPLACE VIEW V_ENVIOS_PENDIENTES AS
SELECT E.id AS id_envio, 
       E.remitente, 
       E.destinatario, 
       E.fecha, 
       S.detalle AS detalle_seguimiento, 
       ER.direccion AS direccion,
       R.nombre AS nombre_repartidor
FROM Envios E
JOIN Seguimientos S ON E.id = S.codigo
LEFT JOIN Estandares ER ON E.id = ER.id
LEFT JOIN Repartidores R ON ER.repartidor = R.id
WHERE E.estado = 'Pendiente' AND S.estado = 'En Proceso';

COMMIT;



-- CICLO 2: XIndicesVistas
/*
DROP INDEX I_PROMOCIONES;
DROP INDEX I_PUNTOSRECOGIDA;
DROP INDEX I_ENVIOS;
DROP INDEX I_REPARTIDORES;
COMMIT;
DROP VIEW V_BENEFICIOS_SUSCRIPCIONES;
DROP VIEW V_ENVIOS_PENDIENTES;
COMMIT;
*/
---------- CODE END ----------