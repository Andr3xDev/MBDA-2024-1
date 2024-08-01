---------- CODE START ----------

-- CICLO 1: DisparadoresOK

-- 1. Un usuario solo puede modificar su nombre, correo, celular y dirección.
UPDATE usuarios
SET nombre = 'Salomon Monroe', correo = 'sapieassa@iclud.net', celular = 3000000000, direccion = 'Calle 123 con carrera 7ma # 70-23'
WHERE ROWNUM = 1;

UPDATE usuarios
SET nombre = 'Andre2 many', correo = 'nonname@aoloha.com'
WHERE ROWNUM = 2;

UPDATE usuarios
SET  celular = 3000000001, direccion = 'Av.americas con calle 45 # 35-13'
WHERE ROWNUM = 3;

UPDATE usuarios
SET direccion = 'AutoNorte con calle 100 # 45-13'
WHERE ROWNUM = 4;

UPDATE usuarios
SET nombre = 'Salomon Monroe', celular = 3104005839
WHERE ROWNUM = 5;

-- 7. El vendedor puede modificar su Nit y Tipo
UPDATE vendedores
SET nit = '', tipo = 'Persona'
WHERE ROWNUM = 1;

UPDATE vendedores
SET nit = '', tipo = 'Persona'
WHERE ROWNUM = 2;

UPDATE vendedores
SET nit = '', tipo = 'Tienda'
WHERE ROWNUM = 3;

UPDATE vendedores
SET nit = '', tipo = 'Plataforma'
WHERE ROWNUM = 4;

UPDATE vendedores
SET nit = '', tipo = 'Tienda'
WHERE ROWNUM = 5;

-- 9. El vendedor puede modificar todos los atributos de los productos, menos los id
UPDATE productos
SET nombre = 'Camiseta', descripcion = '50000', condicion = 'N', imagen = 'https://asjdb.asljfb.jpg', disponibilidad = 'T', wishlist = NULL
WHERE ROWNUM = 1;

UPDATE productos
SET nombre = 'Aenean egestas hendrerit neque. In', descripcion = 'scelerisque dui. Suspendisse ac metus vitae velit egestas', condicion = 'U', imagen = 'https://asdbj.ahsdbkjasd.jpg', disponibilidad = 'F', wishlist = NULL
WHERE ROWNUM = 2;

UPDATE productos
SET nombre = 'est, congue a, aliquet', descripcion = 'Cras convallis convallis dolor. Quisque tincidunt', condicion = 'U', imagen = 'https://jadvjh.ajsdvjas.jpg', disponibilidad = 'T', wishlist = NULL
WHERE ROWNUM = 3;

UPDATE productos
SET nombre = 'ipsum cursus vestibulum. Mauris magna.', descripcion = 'Nam porttitor scelerisque neque. Null
am nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla', condicion = 'P', imagen = 'https://gassg.msbdk.jpg', disponibilidad = 'F', wishlist = NULL
WHERE ROWNUM = 4;

UPDATE productos
SET nombre = 'dolor, nonummy', descripcion = 'malesuada id,', condicion = 'B', imagen = 'https://asd.fasf.jpg', disponibilidad = 'F', wishlist = NULL
WHERE ROWNUM = 5;

-- 4. El estado del intercambio se modifica en función del estado del pago.
UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 2;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 3;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 4;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 5;

-- 5. A medida que un usuario compra más productos, su tipo de experiencia cambia

-- 6. Los compradores solo pueden hacer una calificación para cada producto adquirido
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (293849828, 389302842, 5, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (293849828, 389302842, 4, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (293849828, 389302842, 1, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (293849828, 389302842, 2, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (293849828, 389302842, 3, 'Excelente');

-- 7. Un comprador solo puede calificar un producto después de comprarlo
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

-- 8. Validar que un vendedor no pueda calificar su propio producto.
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (128937922, 128937922, 5, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (109238092, 109238092, 1, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (512089232, 512089232, 2, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (184984092, 184984092, 3, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (129047802, 129047802, 4, 'Excelente');

-- 9. Validar que la cantidad de productos agregados a una WishList no puede ser superior a la cantidad actual ofrecida por el vendedor.
INSERT INTO WISHLISTS (usuario, estado)
VALUES (123123123, 'A');

-- 10. Las calificaciones de los productos no se pueden eliminar.
DELETE FROM CALIFICACIONES 
WHERE comprador = 293849828 AND producto = 389302842;
DELETE FROM CALIFICACIONES 
WHERE comprador = 293849828 AND producto = 389302842;
DELETE FROM CALIFICACIONES 
WHERE comprador = 293849828 AND producto = 389302842;
DELETE FROM CALIFICACIONES 
WHERE comprador = 293849828 AND producto = 389302842;
DELETE FROM CALIFICACIONES 
WHERE comprador = 293849828 AND producto = 389302842;

-- 11. Un comprador no puede agregar a su wishlist sus propios productos.
INSERT INTO WISHLISTS (usuario, estado)
VALUES (123123123, 'A');

-- 12. Si el estado de un pago se actualiza a 'Aprobado', entonces se deben descontar las cantidades intercambiadas de los productos ofrecidos por los vendedores.
UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;

-- 13. Si el estado de un pago se actualiza a 'Aprobado', entonces se deben registrar los datos de los dos compradores y productos en la BD.
UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;

UPDATE pagos
SET estado = 'Aprobado'
WHERE ROWNUM = 1;


-- CICLO 1: DisparadoresNoOK

-- 1. El usuario solo puede modificar su nombre, correo, celular y dirección
UPDATE usuarios
SET id = NULL, nombre = NULL, correo = NULL
WHERE ROWNUM = 1;

UPDATE usuarios
SET id = 13235412, correo = 'nonname@aoloha.com'
WHERE ROWNUM = 2;

UPDATE usuarios
SET id = 13235412, celular = 3003003211
WHERE ROWNUM = 3;

UPDATE usuarios
SET fecha = '12-32-2022'
WHERE ROWNUM = 4;

UPDATE usuarios
SET id = NULL, fecha = '12-32-2022'
WHERE ROWNUM = 5;

-- 2. El vendedor puede modificar su Nit y Tipo
UPDATE vendedores
SET nit = '', tipo = 'Persona'
WHERE ROWNUM = 1;

UPDATE vendedores
SET nit = '', tipo = 'Persona'
WHERE ROWNUM = 2;

UPDATE vendedores
SET nit = '', tipo = 'Tienda'
WHERE ROWNUM = 3;

UPDATE vendedores
SET nit = '', tipo = 'Plataforma'
WHERE ROWNUM = 4;

UPDATE vendedores
SET nit = '', tipo = 'Tienda'
WHERE ROWNUM = 5;

-- 3. El vendedor puede modificar todos los atributos de los productos, menos los id
UPDATE productos
SET id = 123312345, nombre = 'Camiseta', descripcion = '50000', condicion = 'N', imagen = 'https://asjdb.asljfb.jpg', disponibilidad = 'T'
WHERE ROWNUM = 1;

UPDATE productos
SET id = 874128922, nombre = 'Aenean egestas hendrerit neque. In', descripcion = 'scelerisque dui. Suspendisse ac metus vitae velit egestas', condicion = 'U', imagen = 'https://asdbj.ahsdbkjasd.jpg', disponibilidad = 'F'
WHERE ROWNUM = 2;

UPDATE productos
SET id = 092734890, nombre = 'est, congue a, aliquet', descripcion = 'Cras convallis convallis dolor. Quisque tincidunt', condicion = 'U', imagen = 'https://jadvjh.ajsdvjas.jpg', disponibilidad = 'T'
WHERE ROWNUM = 3;

UPDATE productos
SET id = 190247908, nombre = 'ipsum cursus vestibulum. Mauris magna.', descripcion = 'Nam porttitor scelerisque neque. Null
am nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla', condicion = 'P', imagen = 'https://gassg.msbdk.jpg', disponibilidad = 'F'
WHERE ROWNUM = 4;

UPDATE productos
SET id = 309217390, nombre = 'dolor, nonummy', descripcion = 'malesuada id,', condicion = 'B', imagen = 'https://asd.fasf.jpg', disponibilidad = 'F'
WHERE ROWNUM = 5;

-- 4. El estado del intercambio se automodifica en función del estado del pago
-- No se acciona el trigger, pues el estado indicado no esta dentro de los estados permitidos
UPDATE pagos
SET estado = 'Rechazados no es'
WHERE ROWNUM = 1;

UPDATE pagos
SET estado = 'Pendiente no hay'
WHERE ROWNUM = 2;

UPDATE pagos
SET estado = 'Reembolzado nunca'
WHERE ROWNUM = 3;

UPDATE pagos
SET estado = 'Pendiente jamas'
WHERE ROWNUM = 4;

UPDATE pagos
SET estado = 'Reembolzado siempre'
WHERE ROWNUM = 5;

-- 5. A medida que un usuario compra más productos, su tipo de experiencia cambia

-- 6. Los compradores solo pueden hacer una calificación para cada producto adquirido
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (293849828, 389302842, 5, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (293849828, 389302842, 4, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (293849828, 389302842, 1, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (293849828, 389302842, 2, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (293849828, 389302842, 3, 'Excelente');

-- 7. Un comprador solo puede calificar un producto después de comprarlo
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

-- 8. Validar que un vendedor no pueda calificar su propio producto.
-- El trigger no se activa, pues el comprador y el producto son distintos
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (128937922, 019240242, 5, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (192847223, 109238092, 1, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (190380912, 512089232, 2, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (184984092, 019278409, 3, 'Excelente');
INSERT INTO CALIFICACIONES (comprador, producto, estrellas, comentario)
VALUES (129047802, 897123023, 4, 'Excelente');

-- 9. Validar que la cantidad de productos agregados a una WishList no puede ser superior a
--    la cantidad actual ofrecida por el vendedor.

-- 10. Las calificaciones de los productos no se pueden eliminar.
DELETE FROM CALIFICACIONES 
WHERE comprador = 293849828 AND producto = 389302842;
DELETE FROM CALIFICACIONES 
WHERE comprador = 293849828 AND producto = 389302842;
DELETE FROM CALIFICACIONES 
WHERE comprador = 293849828 AND producto = 389302842;
DELETE FROM CALIFICACIONES 
WHERE comprador = 293849828 AND producto = 389302842;
DELETE FROM CALIFICACIONES 
WHERE comprador = 293849828 AND producto = 389302842;

-- 11. Un comprador no puede agregar a su wishlist sus propios productos.
INSERT INTO WISHLISTSXPRODUCTOS (whishlist, poducto, prioridad, cantidad)
VALUES ('123123123', '123123123', 1, 1);
INSERT INTO WISHLISTSXPRODUCTOS (whishlist, poducto, prioridad, cantidad)
VALUES ('123123123', '123123123', 1, 1);
INSERT INTO WISHLISTSXPRODUCTOS (whishlist, poducto, prioridad, cantidad)
VALUES ('123123123', '123123123', 1, 1);
INSERT INTO WISHLISTSXPRODUCTOS (whishlist, poducto, prioridad, cantidad)
VALUES ('123123123', '123123123', 1, 1);
INSERT INTO WISHLISTSXPRODUCTOS (whishlist, poducto, prioridad, cantidad)
VALUES ('123123123', '123123123', 1, 1);

-- 13. Si el estado de un pago se actualiza a 'Aprobado',
--     entonces se deben descontar las cantidades intercambiadas de los productos ofrecidos por los vendedores.
-- 14. Si el estado de un pago se actualiza a 'Aprobado',
--     entonces se deben registrar los datos de los dos compradores y productos en la BD.

---------- CODE END ----------