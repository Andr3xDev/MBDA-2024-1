---------- CODE START ----------

-- CICLO 2: DisparadoresOK

-- 1. Solo se puede elegir el envio o el punto de recogida (no ambos)
INSERT INTO puntos_recogidas (id, remitente, destinatario, direccion, fecha, estado, pago) VALUES ('0000010101', 'Juan Alberto', 'Maria Jose','av snapepe 129/3', SYSDATE, 'Enviado', '10200100101');
INSERT INTO Envios (id, remitente, destinatario, fecha, estado, pago, seguimiento) VALUES ('0000010101', 'Juan Alberto', 'Maria Jose', SYSDATE, 'Enviado', '10200100101', '00100000000000000001','120398089');

-- 2. 

-- [Código]

-- 3. 

-- [Código]

COMMIT;



-- CICLO 2: DisparadoresNoOK

-- 1. 

-- [Código]

-- 2. 

-- [Código]

-- 3. 

-- [Código]

COMMIT;
---------- CODE END ----------