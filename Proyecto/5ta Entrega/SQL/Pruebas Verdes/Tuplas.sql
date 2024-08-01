---------- CODE START ----------

-- CICLO 1: TuplasOK

-- 1. Validar que el total de cada intercambio coincida con la suma de los precios de los productos intercambiados.

INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('5', 'Rechazado', 5000, SYSDATE, 'comprador2', 'vendedor2', 'producto5', 'producto6');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('6', 'Aprobado', 6000, SYSDATE, 'comprador3', 'vendedor3', 'producto7', 'producto8');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('7', 'Pendiente', 7000, SYSDATE, 'comprador4', 'vendedor4', 'producto9', 'producto10');


-- 2. Validar que el comprador y el vendedor no sean la misma persona.

INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('8', 'Rechazado', 8000, SYSDATE, 'comprador5', 'vendedor5', 'producto11', 'producto12');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('9', 'Pendiente', 9000, SYSDATE, 'comprador6', 'vendedor6', 'producto13', 'producto14');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('10', 'Aprobado', 10000, SYSDATE, 'comprador7', 'vendedor7', 'producto15', 'producto16');

-- 3. Validar que un vendedor no pueda calificar su propio producto.

INSERT INTO Calificaciones (comprador, producto, estrellas, fecha)
VALUES ('comprador8', 'producto17', 5, SYSDATE);
INSERT INTO Calificaciones (comprador, producto, estrellas, fecha)
VALUES ('comprador9', 'producto18', 4, SYSDATE);
INSERT INTO Calificaciones (comprador, producto, estrellas, fecha)
VALUES ('comprador10', 'producto19', 3, SYSDATE);

-- 4. Validar que la fecha del intercambio sea posterior a la fecha de registro del comprador y del vendedor.

INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('17', 'Pendiente', 17000, SYSDATE, 'comprador18', 'vendedor18', 'producto35', 'producto36');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('18', 'Pendiente', 18000, SYSDATE, 'comprador19', 'vendedor19', 'producto37', 'producto38');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('19', 'Pendiente', 19000, SYSDATE, 'comprador20', 'vendedor20', 'producto39', 'producto40');

-- 5. Validar que un vendedor no pueda ofertar un producto que no esté en existencias.

INSERT INTO Ofrecimientos (id, nit, tipo, producto, precio, cantidad)
VALUES ('ofrecimiento21', 'nit21', 'Tienda', 'producto41', 200, 5);
INSERT INTO Ofrecimientos (id, nit, tipo, producto, precio, cantidad)
VALUES ('ofrecimiento22', 'nit22', 'Tienda', 'producto42', 250, 10);
INSERT INTO Ofrecimientos (id, nit, tipo, producto, precio, cantidad)
VALUES ('ofrecimiento23', 'nit23', 'Tienda', 'producto43', 300, 15);



-- CICLO 1: TuplasNoOK

-- 1. Validar que el total de cada intercambio coincida con la suma de los precios de los productos intercambiados.

INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('11', 'Pendiente', 11000, SYSDATE, 'comprador11', 'vendedor11', 'producto20', 'producto21');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('12', 'Pendiente', 12000, SYSDATE, 'comprador12', 'vendedor12', 'producto22', 'producto23');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('13', 'Pendiente', 13000, SYSDATE, 'comprador13', 'vendedor13', 'producto24', 'producto25');

-- 2. Validar que el comprador y el vendedor no sean la misma persona.

INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('14', 'Pendiente', 14000, SYSDATE, 'comprador14', 'comprador14', 'producto26', 'producto27');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('15', 'Pendiente', 15000, SYSDATE, 'comprador15', 'comprador15', 'producto28', 'producto29');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('16', 'Pendiente', 16000, SYSDATE, 'comprador16', 'comprador16', 'producto30', 'producto31');

-- 3. Validar que un vendedor no pueda calificar su propio producto.

INSERT INTO Calificaciones (comprador, producto, estrellas, fecha)
VALUES ('vendedor14', 'producto32', 2, SYSDATE);
INSERT INTO Calificaciones (comprador, producto, estrellas, fecha)
VALUES ('vendedor15', 'producto33', 1, SYSDATE);
INSERT INTO Calificaciones (comprador, producto, estrellas, fecha)
VALUES ('vendedor16', 'producto34', 3, SYSDATE);

-- 4. Validar que la fecha del intercambio sea posterior a la fecha de registro del comprador y del vendedor.

INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('20', 'Pendiente', 20000, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'comprador21', 'vendedor21', 'producto44', 'producto45');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('21', 'Pendiente', 21000, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'comprador22', 'vendedor22', 'producto46', 'producto47');
INSERT INTO Intercambios (id, estado, total, fecha, comprador, vendedor, producto1, producto2)
VALUES ('22', 'Pendiente', 22000, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'comprador23', 'vendedor23', 'producto48', 'producto49');

-- 5. Validar que un vendedor no pueda ofertar un producto que no esté en existencias.

INSERT INTO Ofrecimientos (id, nit, tipo, producto, precio, cantidad)
VALUES ('ofrecimiento24', 'nit24', 'Tienda', 'producto50', 400, 20);
INSERT INTO Ofrecimientos (id, nit, tipo, producto, precio, cantidad)
VALUES ('ofrecimiento25', 'nit25', 'Tienda', 'producto51', 450, 25);
INSERT INTO Ofrecimientos (id, nit, tipo, producto, precio, cantidad)
VALUES ('ofrecimiento26', 'nit26', 'Tienda', 'producto52', 500, 30);

---------- CODE END ----------