---------- CODE START ----------

-- CICLO 1: AccionesOK

-- 1. Las calificaciones de los productos no se pueden eliminar
-- Se insertan calificaciones que vamos a eliminar
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (459082892, 230809232, 5, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (312590854, 328098522, 3, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (124890824, 190284909, 4, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (109237080, 123809821, 1, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (058951503, 902784901, 2, 'Excelente');
-- Se eliminan las calificaciones
DELETE FROM CALIFICACIONES WHERE comprador = 459082892 AND producto = 230809232;
DELETE FROM CALIFICACIONES WHERE comprador = 312590854 AND producto = 328098522;
DELETE FROM CALIFICACIONES WHERE comprador = 124890824 AND producto = 190284909;
DELETE FROM CALIFICACIONES WHERE comprador = 109237080 AND producto = 123809821;
DELETE FROM CALIFICACIONES WHERE comprador = 058951503 AND producto = 902784901;
-- No se eliminan las calificaciones y manda error

-- 2. Si un vendedor se retira de la plataforma, se deben eliminar todas sus ofertas de productos asociadas
-- Se crea el vendedor
INSERT INTO USUARIOS (nombre, correo, celular, direccion) 
VALUES('Alvin Delgado','risus.donec@google.net',3211952764,'9415 Id Av.');
-- Se crean los productos del vendedor
INSERT INTO PRODUCTOS (nombre, descripcion, condicion, imagen, disponibilidad, wishlist)
VALUES ('dolor, nonummy','malesuada id,','B','https://asd.fasf.jpg','F', NULL);
-- Se asocian los productos al vendedor
INSERT INTO Ofrecimientos (vendedor, producto, precio, cantidad)
VALUES (11231241, 124124512521, 10000, 1);
-- Se elimina el vendedor
DELETE FROM USUARIOS WHERE nombre = 'Alvin Delgado';
-- Se eliminan los productos que hayan sido creados por el vendedor

-- 3. Si un vendedor elimina un producto, se deben eliminar las calificaciones asociadas al producto

-- 4. Si un usuario elimina su cuenta, se deben eliminar su perfil de omprador y vendedor
INSERT INTO USUARIOS (nombre, correo, celular, direccion) 
VALUES('Alvin Delgado','risus.donec@google.net',3211952764,'9415 Id Av.');
INSERT INTO USUARIOS (nombre, correo, celular, direccion) 
VALUES('Irene Greer','felis.adipiscing@outlook.ca',3164353709,'392-2925 Sed St.');
INSERT INTO USUARIOS (nombre, correo, celular, direccion) 
VALUES('Malik Morrison','sed@icloud.org',3135462794,'186-3611 Vivamus Street');
INSERT INTO USUARIOS (nombre, correo, celular, direccion) 
VALUES('Castor Nash','hendrerit.donec@hotmail.ca',3001742146,'Ap #491-4014 Nec, Road');
INSERT INTO USUARIOS (nombre, correo, celular, direccion) 
VALUES('Remedios Figueroa','donec.dignissim@google.net',3108263530,'Ap #526-9277 Fringilla. Road');

DELETE FROM USUARIOS WHERE nombre = 'Alvin Delgado';
DELETE FROM USUARIOS WHERE nombre = 'Irene Greer';
DELETE FROM USUARIOS WHERE nombre = 'Malik Morrison';
DELETE FROM USUARIOS WHERE nombre = 'Castor Nash';
DELETE FROM USUARIOS WHERE nombre = 'Remedios Figueroa';



-- CICLO 1: AccionesNoOK

-- 1. Las calificaciones de los productos no se pueden eliminar

-- 2. Si un vendedor se retira de la plataforma, se deben eliminar todas sus ofertas de productos asociadas
-- Se crea el vendedor
INSERT INTO USUARIOS (nombre, correo, celular, direccion) 
VALUES('Alvin Delgado','risus.donec@google.net',3211952764,'9415 Id Av.');
-- Se crean los productos del vendedor
INSERT INTO PRODUCTOS (nombre, descripcion, condicion, imagen, disponibilidad, wishlist)
VALUES ('dolor, nonummy','malesuada id,','B','https://asd.fasf.jpg','F', NULL);
-- Se asocian los productos al vendedor
INSERT INTO Ofrecimientos (vendedor, producto, precio, cantidad)
VALUES (11231241, 124124512521, 10000, 1);
-- Se elimina el vendedor
DELETE FROM USUARIOS WHERE nombre = 'Alvin Delgado';
-- Se eliminan los productos que hayan sido creados por el vendedor

-- 3. Si un vendedor elimina un producto, se deben eliminar las calificaciones asociadas al producto 

-- 4. Si un usuario elimina su cuenta, se deben eliminar su perfil de omprador y vendedor
-- No se eliminan usuarios no existentes (Unico caso de falla)
DELETE FROM USUARIOS WHERE nombre = 'Alvin Delgado';
DELETE FROM USUARIOS WHERE nombre = 'Irene Greer';
DELETE FROM USUARIOS WHERE nombre = 'Malik Morrison';
DELETE FROM USUARIOS WHERE nombre = 'Castor Nash';
DELETE FROM USUARIOS WHERE nombre = 'Remedios Figueroa';

---------- CODE END ----------