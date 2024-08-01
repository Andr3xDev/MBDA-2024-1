---------- CODE START ----------

-- CICLO 1: PoblarOK 1 (Inicial)

-- Insersion de datos en la tabla universidades
INSERT INTO universidades (codigo, nombre, direccion, usuario)
VALUES ('U01', 'Universidad A', 'Calle Principal 123', 'USR001');
INSERT INTO universidades (codigo, nombre, direccion, usuario)
VALUES ('U02', 'Universidad B', 'Avenida Central 456', 'USR002');
INSERT INTO universidades (codigo, nombre, direccion, usuario)
VALUES ('U03', 'Universidad C', 'Calle Secundaria 789', 'USR003');
INSERT INTO universidades (codigo, nombre, direccion, usuario)
VALUES ('U04', 'Universidad D', 'Avenida Norte 012', 'USR004');
INSERT INTO universidades (codigo, nombre, direccion, usuario)
VALUES ('U05', 'Universidad E', 'Calle Sur 345', 'USR005');

-- Insersion de datos en la tabla usuarios
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad)
VALUES ('USR001', 'T1', 'N01', 'Usuario 1', 'Programa 1', 'usuario1@example.com', TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 005, 'U01');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad)
VALUES ('USR002', 'T2', 'N02', 'Usuario 2', 'Programa 2', 'usuario2@example.com', TO_DATE('2024-03-14', 'YYYY-MM-DD'), NULL, 012, 'U02');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad)
VALUES ('USR003', 'T3', 'N03', 'Usuario 3', 'Programa 3', 'usuario3@example.com', TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-08-25', 'YYYY-MM-DD'), 128, 'U03');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad)
VALUES ('USR004', 'T4', 'N04', 'Usuario 4', 'Programa 4', 'usuario4@example.com', TO_DATE('2024-03-16', 'YYYY-MM-DD'), NULL, 435, 'U04');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad)
VALUES ('USR005', 'T5', 'N05', 'Usuario 5', 'Programa 5', 'usuario5@example.com', TO_DATE('2024-03-17', 'YYYY-MM-DD'), TO_DATE('2024-12-10', 'YYYY-MM-DD'), 632, 'U05');

-- Insersion de datos en la tabla calificaciones
INSERT INTO calificaciones (usuario, articulo, estrella)
VALUES ('CAL001', 5261397714268532, 4);
INSERT INTO calificaciones (usuario, articulo, estrella)
VALUES ('CAL002', 9337462158946721, 5);
INSERT INTO calificaciones (usuario, articulo, estrella)
VALUES ('CAL003', 8175632094837265, 3);
INSERT INTO calificaciones (usuario, articulo, estrella)
VALUES ('CAL004', 6409183725482910, 2);
INSERT INTO calificaciones (usuario, articulo, estrella)
VALUES ('CAL005', 3759210485627319, 1);

-- Insersion de datos en la tabla categorias
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)
VALUES ('CAT01', 'Categoria A', 'A', 50, 100, 'CAT01');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)
VALUES ('CAT02', 'Categoria B', 'R', 150, 250, 'CAT02');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)
VALUES ('CAT03', 'Categoria C', 'L', 100, 250, 'CAT03');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)
VALUES ('CAT04', 'Categoria D', 'T', 100, 150, 'CAT04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)
VALUES ('CAT05', 'Categoria E', 'O', 250, 250, 'CAT05');

-- Insersion de datos en la tabla articulos
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario)
VALUES (5261397714268532, 'Desc. Articulo 1', 'U', 'https://ejemplo.com/archivo1.pdf', 50, 'TRUE', 'CAT01', 'USR001');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario)
VALUES (9337462158946721, 'Desc. Articulo 2', 'N', 'https://otroejemplo.com/imagen2.pdf', 60, 'TRUE', 'CAT02', 'USR002');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario)
VALUES (8175632094837265, 'Desc. Articulo 3', 'N', 'https://mifoto.com/imagen3.pdf', 70, 'FALSE', 'CAT03', 'USR003');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario)
VALUES (6409183725482910, 'Desc. Articulo 4', 'U', 'https://dominio.com/foto4.pdf', 80, 'TRUE', 'CAT04', 'USR004');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario)
VALUES (3759210485627319, 'Desc. Articulo 5', 'U', 'https://ejemplo.net/otrafoto5.pdf', 90, 'FALSE', 'CAT05', 'USR005');

-- Insersion de datos en la tabla caracteristicas
INSERT INTO caracteristicas (articulo, caracteristica)
VALUES (5261397714268532, 'Caract. Articulo 1');
INSERT INTO caracteristicas (articulo, caracteristica)
VALUES (9337462158946721, 'Caract. Articulo 2');
INSERT INTO caracteristicas (articulo, caracteristica)
VALUES (8175632094837265, 'Caract. Articulo 3');
INSERT INTO caracteristicas (articulo, caracteristica)
VALUES (6409183725482910, 'Caract. Articulo 4');
INSERT INTO caracteristicas (articulo, caracteristica)
VALUES (3759210485627319, 'Caract. Articulo 5');

-- Insersion de datos en la tabla ropas
INSERT INTO ropas (articulo, talla, material, color)
VALUES (5261397714268532, 'M', 'Algodon', 'Azul');
INSERT INTO ropas (articulo, talla, material, color)
VALUES (9337462158946721, 'L', 'Seda', 'Rojo');
INSERT INTO ropas (articulo, talla, material, color)
VALUES (8175632094837265, 'XL', 'Poliester', 'Verde');
INSERT INTO ropas (articulo, talla, material, color)
VALUES (6409183725482910, 'S', 'Algodon', 'Amarillo');
INSERT INTO ropas (articulo, talla, material, color)
VALUES (3759210485627319, 'XS', 'Lana', 'Negro');

-- Insersion de datos en la tabla perecederos
INSERT INTO perecederos (articulo, vencimiento)
VALUES (5261397714268532, TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento)
VALUES (9337462158946721, TO_DATE('2024-11-30', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento)
VALUES (8175632094837265, TO_DATE('2024-10-31', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento)
VALUES (6409183725482910, TO_DATE('2024-09-30', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento)
VALUES (3759210485627319, TO_DATE('2024-08-31', 'YYYY-MM-DD'));

-- Insersion de datos en la tabla auditorias
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria)
VALUES (1, TO_DATE('2024-03-13', 'YYYY-MM-DD'), 'I', 'Auditoria 1', '202405', 'CAT01');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria)
VALUES (2, TO_DATE('2024-03-14', 'YYYY-MM-DD'), 'D', 'Auditoria 2', '202301', 'CAT02');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria)
VALUES (3, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'U', 'Auditoria 3', '201512', 'CAT03');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria)
VALUES (4, TO_DATE('2024-03-16', 'YYYY-MM-DD'), 'U', 'Auditoria 4', '201807', 'CAT04');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria)
VALUES (5, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'I', 'Auditoria 5', '202105', 'CAT05');

-- Insersion de datos en la tabla evaluaciones
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado)
VALUES ('202405', 'CC', 'N01', TO_DATE('2024-03-13', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 1 - A', 'https://ejemplo.com/reporte1.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado)
VALUES ('202301', 'TI', 'N02', TO_DATE('2024-03-14', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 2 - M', 'https://otroejemplo.com/reporte2.pdf', 'PE');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado)
VALUES ('201512', 'CC', 'N03', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 3 - B', 'https://mifoto.com/reporte3.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado)
VALUES ('201807', 'TI', 'N04', TO_DATE('2024-03-16', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 4 - M', 'https://dominio.com/reporte4.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado)
VALUES ('202105', 'CC', 'N05', TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 5 - A', 'https://ejemplo.net/reporte5.pdf', 'PE');

-- Insersion de datos en la tabla respuestas
INSERT INTO respuestas (a_omes, respuesta)
VALUES ('202405', 'Respuesta a la pregunta 1');
INSERT INTO respuestas (a_omes, respuesta)
VALUES ('202301', 'Respuesta a la pregunta 2');
INSERT INTO respuestas (a_omes, respuesta)
VALUES ('201512', 'Respuesta a la pregunta 3');
INSERT INTO respuestas (a_omes, respuesta)
VALUES ('202107', 'Respuesta a la pregunta 4');
INSERT INTO respuestas (a_omes, respuesta)
VALUES ('202105', 'Respuesta a la pregunta 5');



-- CICLO 1: PoblarNoOK 1 (Inserciones Rechazadas)

-- Tabla universidades
-- Caso 1: Intentar insertar el codigo de una universidad con una longitud mayor a 3.
-- Se desea validar que no se permita la Insersion del codigo de una universidad con una longitud mayor a 3.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U100', 'Universidad F', 'Calle Principal 456', 'USR012');
-- Caso 2: Intentar insertar una universidad con un nombre nulo.
-- Se desea validar que no se permita la Insersion de una universidad con un nombre nulo.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', NULL, 'Avenida Oeste 789', 'USR014');
-- Caso 3: Intentar insertar una universidad con una direccion que excede el limite de caracteres permitidos.
-- Se desea validar que no se permita la Insersion de una universidad con una direccion que excede el limite de caracteres permitidos.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 'Universidad G', 'Carrera 123 #23-34, Avenida las Americas, Bogota D.C., Colombia', 'USR016');

-- Tabla usuarios
-- Caso 1: Intentar insertar un usuario con un codigo nulo.
-- Se desea validar que no se permita la Insersion de un usuario nulo.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES (NULL, 'T6', 'N06', 'Usuario 6', 'Programa 6', 'usuario6@example.com', TO_DATE('2024-03-18', 'YYYY-MM-DD'), 0, 'U015');
-- Caso 2: Intentar insertar la fecha de registro de un usuario como una cadena de texto.
-- Se desea validar que no se permita la Insersion de una fecha de registro de un usuario como una cadena de texto que es de otro tipo ed dato.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR006', 'T6', 'N06', 'Usuario 6', 'Programa 6', 'usuario6@example.com', 20240318, 0, 'U034');
-- Caso 3: Intentar insertar un usuario con un valor nulo en el campo `registro`.
-- Se desea validar que no se permita la Insersion de un usuario con un valor nulo en el campo `registro`.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR006', 'T6', 'N06', 'Usuario 6', 'Programa 6', 'usuario6@example.com', NULL, 0, 'U055');

-- Tabla calificaciones
-- Caso 1: Intentar insertar una calificacion con un codigo de usuario numerico.
-- Se desea validar que no se permita la Insersion de una calificacion con un codigo de usuario de tipo numerico, ya que solo se permiten cadenas de caracteres.
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES (152602302745, 1234567890123456, 4);
-- Caso 2: Intentar insertar una calificacion con un numero de estrellas invalido (por encima del maximo permitido).
-- Se desea validar que no se permita la Insersion de una calificacion con un numero de estrellas invalido (por encima del maximo permitido).
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL006', 1234567890123456, 10);
-- Caso 3: Intentar insertar una calificacion con un valor nulo en el campo `articulo`.
-- Se desea validar que no se permita la Insersion de una calificacion con un valor nulo en el campo `articulo`.
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL006', NULL, 3);

-- Tabla categorias
-- Caso 1: Intentar insertar una categoria con un codigo que excede la longitud permitida (5).
-- Se desea validar que no se permita la Insersion de una categoria con un codigo que excede la longitud permitida (5).
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT0123', 'Categoria F', 'X', 5, 15, 'CAT0123');
-- Caso 2: Intentar insertar una categoria con un valor minimo mayor que el maximo.
-- Se desea validar que no se permita la Insersion de una categoria con un valor minimo mayor que el maximo.
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT06', 'Categoria G', 'Y', 2012, 10, 'CAT06');
-- Caso 3: Intentar insertar una categoria con un tipo no valido.
-- Se desea validar que no se permita la Insersion de una categoria con un tipo no valido.
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT06', 'Categoria H', TRUE, 15, 25, 'CAT06');

-- Tabla articulos
-- Caso 1: Intentar insertar un articulo con un ID como cadena de caracteres.
-- Se desea validar que no se permita la Insersion de un articulo con un tipo de dato diferente a numero.
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES ('ABCDE12345', 'Desc. Articulo 7', 'U', 'https://ejemplo.com/archivo7.pdf', 70, 'TRUE', 'CAT03', 'USR003');
-- Caso 2: Intentar insertar un articulo con una descripcion nula.
-- Se desea validar que no se permita la Insersion de un articulo con una descripcion nula.
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123456, NULL, 'N', 'https://dominio.com/foto7.pdf', 70, 'FALSE', 'CAT21', 'USR012');
-- Caso 3: Intentar insertar un articulo con un precio con mas digitos de los permitidos.
-- Se desea validar que no se permita la Insersion de un articulo con un precio que tenga mas de 3 digitos.
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (7890123456789012, 'Desc. Articulo 8', 'U', 'https://ejemplo.net/foto8.pdf', 80000, 'TRUE', 'CAT05', 'USR008');

-- Tabla caracteristicas
-- Caso 1: Intentar insertar un codigo de articulo como una cadena de caracteres.
-- Se desea validar que no se permita la Insersion de un codigo de articulo de otro tipo de dato distinto.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES ('CA57984', 'Caracteristica del Articulo 6');
-- Caso 2: Intentar insertar una Caracteristica con una cadena de caracteres demasiado larga.
-- Se desea validar que no se permita la Insersion de una Caracteristica con una cadena de caracteres demasiado larga.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (5261397714268532, 'Esta es una Caracteristica muy larga que excede el limite permitido');
-- Caso 3: Intentar insertar una Caracteristica con una cadena de caracteres nula.
-- Se desea validar que no se permita la Insersion de una Caracteristica con una cadena de caracteres nula.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (9337462158946721, NULL);

-- Tabla ropas
-- Caso 1: Intentar insertar un registro sin especificar la talla.
-- Se desea validar que no se permita la Insersion de un registro en la tabla ropas sin especificar la talla.
INSERT INTO ropas (articulo, material, color) VALUES (5261397714268532, 'Algodon', 'Azul');
-- Caso 2: Intentar insertar un registro con una talla demasiado larga.
-- Se desea validar que no se permita la Insersion de un registro en la tabla ropas con una talla demasiado larga.
INSERT INTO ropas (articulo, talla, material, color) VALUES (9337462158946721, 'XXL', 'Seda', 'Rojo');
-- Caso 3: Intentar insertar un registro con un color que excede el limite de caracteres.
-- Se desea validar que no se permita la Insersion de un registro en la tabla ropas con un color que excede el limite de caracteres.
INSERT INTO ropas (articulo, talla, material, color) VALUES (8175632094837265, 'XL', 'Poliester', 'Naranja Claro');

-- Tabla perecederos
-- Caso 1: Intentar insertar un registro con una fecha de vencimiento numerica.
-- Se desea validar que no se permita la Insersion de un registro en la tabla perecederos con una fecha numerica.
INSERT INTO perecederos (articulo, vencimiento) VALUES (5261397714268532, 20230115);
-- Caso 2: Intentar insertar un registro sin especificar la fecha de vencimiento.
-- Se desea validar que no se permita la Insersion de un registro en la tabla perecederos sin especificar la fecha de vencimiento.
INSERT INTO perecederos (articulo) VALUES (9337462158946721);
-- Caso 3: Intentar insertar un registro con un formato de fecha incorrecto.
-- Se desea validar que no se permita la Insersion de un registro en la tabla perecederos con un formato de fecha incorrecto.
INSERT INTO perecederos (articulo, vencimiento) VALUES (8175632094837265, '31162024');

-- Tabla auditorias
-- Caso 1: Intentar insertar un registro sin especificar la accion.
-- Se desea validar que no se permita la Insersion de un registro en la tabla auditorias sin especificar la accion.
INSERT INTO auditorias (id, fecha, nombre, evaluacion, categoria) VALUES (6, TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'Auditoria 6', '202605', 'CAT03');
-- Caso 2: Intentar insertar un registro con una fecha incorrecta.
-- Se desea validar que no se permita la Insersion de un registro en la tabla auditorias con una fecha incorrecta.
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (7, TO_DATE('01-01-2025', 'YYYY-MM-DD'), 'I', 'Auditoria 7', '202408', 'CAT08');
-- Caso 3: Intentar insertar un registro con un nombre que excede el limite de caracteres.
-- Se desea validar que no se permita la Insersion de un registro en la tabla auditorias con un nombre que excede el limite de caracteres.
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (8, TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'U', 'EsteNombreEsMuyLargoParaLaAuditoria', '203409', 'CAT21');

-- Tabla evaluaciones
-- Caso 1: Intentar insertar un registro con un codigo 'a_omes' que excede la longitud permitida.
-- Se desea validar que no se permita la Insersion de un registro con un codigo 'a_omes' que supere la longitud permitida de 6 caracteres.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('20240578532', 'CC', 'N01', TO_DATE('2024-03-13', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 1 - A', 'https://ejemplo.com/reporte1.pdf', 'AP');
-- Caso 2: Intentar insertar un registro con un resultado no valido.
-- Se desea validar que no se permita la Insersion de un registro en la tabla evaluaciones con un resultado no valido.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('202301', 'TI', 'N02', TO_DATE('2024-03-14', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 2 - M', 'https://otroejemplo.com/reporte2.pdf', 'RESULTADO');
-- Caso 3: Intentar insertar un registro con una fecha de evaluacion nula.
-- Se desea validar que no se permita la Insersion de un registro en la tabla evaluaciones con una fecha de evaluacion nula.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('201807', 'TI', 'N04', NULL, 'Descripcion de la evaluacion 4 - M', 'https://dominio.com/reporte4.pdf', 'AP');

-- Tabla respuestas
-- Caso 1: Intentar insertar un registro sin especificar la respuesta.
-- Se desea validar que no se permita la Insersion de un registro en la tabla respuestas sin especificar la respuesta.
INSERT INTO respuestas (a_omes) VALUES ('202107');
-- Caso 2: Intentar insertar un registro con una respuesta que excede el limite de caracteres.
-- Se desea validar que no se permita la Insersion de un registro en la tabla respuestas con una respuesta que excede el limite de caracteres.
INSERT INTO respuestas (a_omes, respuesta) VALUES ('202105', 'Esta es una respuesta muy larga que excede el limite de caracteres permitidos en la tabla.');
-- Caso 2: Intentar insertar un registro con un codigo "a_omes" nulo.
-- Se desea validar que no se permita la Insersion de un registro en la tabla respuestas sin especificar el codigo "a_omes".
INSERT INTO respuestas (a_omes, respuesta) VALUES (NULL, 'Respuesta sin codigo');



-- CICLO 1: PoblarNoOK 2 (Inserciones todavia Aceptadas)

-- Tabla universidades
-- Caso 1: Intentar insertar una universidad con un codigo que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de una universidad con un codigo que ya existe en la tabla.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U01', 'Universidad F', 'Calle Principal 456', 'USR012');
-- Caso 2: Intentar insertar una universidad con el campo "nombre" como un numero.
-- Se desea validar que todavia se permite la Insersion de una universidad con el campo "nombre" con otro tipo de dato distinto a VARCHAR2.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 6331245, 'Avenida Este 789', 'USR014');
-- Caso 3: Intentar insertar una universidad con una direccion como fecha.
-- Se desea validar que todavia se permite la Insersion de una universidad con una direccion que es de tipo fecha.
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 'Universidad F', '2024-05-26', 'USR016');

-- Tabla usuarios
-- Caso 1: Intentar insertar un usuario con un codigo que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de un usuario con un codigo que ya existe en la tabla.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR001', 'T1', 'N01', 'Usuario 1', 'Programa 1', 'usuario1@example.com', TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 005, 'U15');
-- Caso 2: Intentar insertar un usuario con una fecha de registro futura.
-- Se desea validar que todavia se permite la Insersion de un usuario con una fecha de registro futura.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR006', 'T6', 'N06', 'Usuario 6', 'Programa 6', 'usuario6@example.com', TO_DATE('2086-12-31', 'YYYY-MM-DD'), 0, 'U35');
-- Caso 3: Intentar insertar un usuario con un numero de suspensiones negativo.
-- Se desea validar que todavia se permite la Insersion de un usuario con un numero de suspensiones negativo.
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR007', 'T7', 'N07', 'Usuario 7', 'Programa 7', 'usuario7@example.com', TO_DATE('2024-03-18', 'YYYY-MM-DD'), -5, 'U17');

-- Tabla calificaciones
-- Caso 1: Intentar insertar una calificacion con un codigo que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de una calificacion con un codigo de usuario que ya existe en la tabla.
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL001', 5261268532, 4);
-- Caso 2: Intentar insertar una calificacion con un numero de estrellas fuera del rango permitido.
-- Se desea validar que todavia se permite la Insersion de una calificacion con un numero de estrellas fuera del rango permitido.
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL006', 1237123456, 8);
-- Caso 3: Intentar insertar una calificacion con un codigo de usuario negativo.
-- Se desea validar que todavia se permite la Insersion de codigo de articulo negativo.
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL007', -54214336576, 3);

-- Tabla categorias
-- Caso 1: Intentar insertar una categoria con un codigo que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de una categoria con un codigo que ya existe en la tabla.
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT01', 'Categoria F', 'R', 50, 150, 'CAT01');
-- Caso 2: Intentar insertar una categoria con un tipo que no cumple con las restricciones definidas (maximo).
-- Se desea validar que todavia se permite la Insersion de una categoria con un tipo que no cumple con las restricciones definidas (maximo).
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT06', 'Categoria G', 'A', 150, 500, 'CAT06');
-- Caso 3: Intentar insertar una categoria con un valor minimo mayor que el valor maximo.
-- Se desea validar que todavia se permite la Insersion de una categoria con un valor minimo mayor que el valor maximo.
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT07', 'Categoria H', 'L', 250, 50, 'CAT07');

-- Tabla articulos
-- Caso 1: Intentar insertar un articulo con un ID que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de un articulo con un ID que ya existe en la tabla.
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (5261397714268532, 'Desc. Articulo 6', 'U', 'https://ejemplo.com/archivo6.pdf', 60, 'TRUE', 'CAT11', 'USR007');
-- Caso 2: Intentar insertar un articulo con una descripcion erronea.
-- Se desea validar que todavia se permite la Insersion de un articulo con una descripcion nula.
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123456, 'Ayer estaba en Lima', 'N', 'https://dominio.com/foto7.pdf', 70, 'TRUE', 'CAT45', 'USR004');
-- Caso 3: Intentar insertar un articulo con un estado que no cumple con las restricciones definidas.
-- Se desea validar que todavia se permite la Insersion de un articulo con un estado que no cumple con las restricciones definidas (estado).
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (7890123456789012, 'Desc. Articulo 8', 'A', 'https://ejemplo.net/otrafoto8.pdf', 80, 'FALSE', 'CAT35', 'USR003');

-- Tabla caracteristicas
-- Caso 1: Intentar insertar una Caracteristica con un articulo que no existe en la tabla de articulos.
-- Se desea validar que todavia se permite la Insersion de una Caracteristica con un articulo que no existe en la tabla de articulos.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (9876543210987654, 'Caract. Articulo 4');
-- Caso 2: Intentar insertar una Caracteristica con una descripcion erronea.
-- Se desea validar que todavia se permite la Insersion de una Caracteristica con una descripcion que no tiene sentido.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (5261397714268532, 'Hoy es lunes');
-- Caso 3: Intentar insertar una Caracteristica con un codigo de articulo negativo.
-- Se desea validar que todavia se permite la Insersion de una Caracteristica con un codigo de articulo negativo que no tiene sentido.
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (-9337462158946721, 'Caract. Articulo 12');

-- Tabla ropas
-- Caso 1: Intentar insertar una prenda de ropa con un articulo que no existe en la tabla de articulos.
-- Se desea validar que todavia se permite la Insersion de una prenda de ropa con un articulo que no existe en la tabla de articulos.
INSERT INTO ropas (articulo, talla, material, color) VALUES (9876543210987654, 'M', 'Algodon', 'Azul');
-- Caso 2: Intentar insertar una prenda de ropa con una talla invalida.
-- Se desea validar que todavia se permite la Insersion de una prenda de ropa con una talla que no esta en las opciones.
INSERT INTO ropas (articulo, talla, material, color) VALUES (5261397714268532, 'XX', 'Seda', 'Rojo');
-- Caso 3: Intentar insertar una prenda de ropa con un material incorrecto.
-- Se desea validar que todavia se permite la Insersion de una prenda de ropa con un material que no tiene sentido.
INSERT INTO ropas (articulo, talla, material, color) VALUES (9337462158946721, 'L', 'Algodon', 'Felipe');

-- Tabla perecederos
-- Caso 1: Intentar insertar un articulo perecedero con un articulo que no existe en la tabla de articulos.
-- Se desea validar que todavia se permite la Insersion de un articulo perecedero con un articulo que no existe en la tabla de articulos.
INSERT INTO perecederos (articulo, vencimiento) VALUES (453543210987654, TO_DATE('2024-12-31', 'YYYY-MM-DD'));
-- Caso 2: Intentar insertar un articulo perecedero con una fecha de vencimiento pasada.
-- Se desea validar que todavia se permite la Insersion de un articulo perecedero con una fecha de vencimiento sin sentido.
INSERT INTO perecederos (articulo, vencimiento) VALUES (5261397714268532, TO_DATE('1345-12-15', 'YYYY-MM-DD'));
-- Caso 3: Intentar insertar un articulo perecedero con una fecha de vencimiento anterior a la fecha actual.
-- Se desea validar que todavia se permite la Insersion de un articulo perecedero con una fecha de vencimiento anterior a la fecha actual.
INSERT INTO perecederos (articulo, vencimiento) VALUES (9337462158946721, TO_DATE('2022-12-31', 'YYYY-MM-DD'));

-- Tabla auditorias
-- Caso 1: Intentar insertar una auditoria con un ID que ya existe en la tabla.
-- Se desea validar que todavia se permite la Insersion de una auditoria con un ID que ya existe en la tabla.
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (1, TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'I', 'Auditoria 6', '202108', 'CAT76');
-- Caso 2: Intentar insertar una auditoria con una accion que no cumple con las restricciones definidas.
-- Se desea validar que todavia se permite la Insersion de una auditoria con una accion que no cumple con las restricciones definidas.
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (6, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'A', 'Auditoria 7', '202311', 'CAT65');
-- Caso 3: Intentar insertar una auditoria con una fecha incorrecta.
-- Se desea validar que todavia se permite la Insersion de una auditoria con una fecha invalida.
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (7, TO_DATE('1888-06-01', 'YYYY-MM-DD'), 'U', 'Auditoria 9', '200507', 'CAT87');

-- Tabla evaluaciones
-- Caso 1: Intentar insertar una evaluacion con un a_omes invalido.
-- Se desea validar que todavia se permite la Insersion de una evaluacion con un a_omes que no cumple las condiciones del tipo de dato.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('154145', 'CC', 'N06', TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 6 - A', 'https://ejemplo.com/reporte6.pdf', 'AP');
-- Caso 2: Intentar insertar una evaluacion con un resultado que no cumple con las restricciones definidas.
-- Se desea validar que todavia se permite la Insersion de una evaluacion con un resultado que no cumple con las restricciones definidas.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('202405', 'CC', 'N07', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 7 - M', 'https://otroejemplo.com/reporte7.pdf', 'TI');
-- Caso 3: Intentar insertar una evaluacion con un reporte invalido.
-- Se desea validar que todavia se permite la Insersion de una evaluacion con un reporte que no cumple las condiciones del tipo de dato.
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('201512', 'TI', 'N08', TO_DATE('2024-03-21', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 8 - M', 'Hola soy Jorge', 'AP');

-- Tabla respuestas
-- Caso 1: Intentar insertar una respuesta con un a_omes que no existe en la tabla evaluaciones.
-- Se desea validar que todavia se permite la Insersion de una respuesta que no fue inesrtada primero en la tabla evaluaciones.
INSERT INTO respuestas (a_omes, respuesta) VALUES ('201204', 'Respuesta a la pregunta 6');
-- Caso 2: Intentar insertar una respuesta como fecha.
-- Se desea validar que todavia se permite la Insersion de una respuesta de un tipo de dato no valido.
INSERT INTO respuestas (a_omes, respuesta) VALUES ('202107', TO_DATE('2024-03-21', 'YYYY-MM-DD'));
-- Caso 3: Intentar insertar una respuesta con una respuesta como valor booleano.
-- Se desea validar que todavia se permite la Insersion de una respuesta de un tipo de dato no valido.
INSERT INTO respuestas (a_omes, respuesta) VALUES ('202105', 'TRUE');



-- CICLO 1: PoblarNoOK 3 (Validacion de las Nuevas Restricciones)

-- Tabla universidades
-- Caso 1: Intentar insertar una universidad con un codigo que ya existe en la tabla.
-- Restriccion: Llave primaria
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U01', 'Universidad F', 'Calle Principal 456', 'USR012');
-- Caso 2: Intentar insertar una universidad con el campo "nombre" como un numero.
-- Restriccion: Definicion de atributo 
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 6331245, 'Avenida Este 789', 'USR014');
-- Caso 3: Intentar insertar una universidad con una direccion como fecha.
-- Restriccion: Definicion de atributo 
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 'Universidad F', '2024-05-26', 'USR016');

-- Tabla usuarios
-- Caso 1: Intentar insertar un usuario con un codigo que ya existe en la tabla.
-- Restriccion: Llave primaria y foranea
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR001', 'T1', 'N01', 'Usuario 1', 'Programa 1', 'usuario1@example.com', TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 005, 'U15');
-- Caso 2: Intentar insertar un usuario con una fecha de registro futura.
-- Restriccion: Definicion de atributo 
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR006', 'T6', 'N06', 'Usuario 6', 'Programa 6', 'usuario6@example.com', TO_DATE('2086-12-31', 'YYYY-MM-DD'), 0, 'U35');
-- Caso 3: Intentar insertar un usuario con un numero de suspensiones negativo.
-- Restriccion: Definicion de atributo 
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, nSuspenciones, universidad) VALUES ('USR007', 'T7', 'N07', 'Usuario 7', 'Programa 7', 'usuario7@example.com', TO_DATE('2024-03-18', 'YYYY-MM-DD'), -5, 'U17');

-- Tabla calificaciones
-- Caso 1: Intentar insertar una calificacion con un codigo que ya existe en la tabla.
-- Restriccion: Llave primaria
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL001', 5261268532, 4);
-- Caso 2: Intentar insertar una calificacion con un numero de estrellas fuera del rango permitido.
-- Restriccion: Definicion de atributo 
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL006', 1237123456, 8);
-- Caso 3: Intentar insertar una calificacion con un codigo de usuario negativo.
-- Restriccion: Definicion de atributo 
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('CAL007', -54214336576, 3);

-- Tabla categorias
-- Caso 1: Intentar insertar una categoria con un codigo que ya existe en la tabla.
-- Restriccion: Llave primaria y foranea
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT01', 'Categoria F', 'R', 50, 150, 'CAT01');
-- Caso 2: Intentar insertar una categoria con un tipo que no cumple con las restricciones definidas (maximo).
-- Restriccion: Definicion de atributo 
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT06', 'Categoria G', 'A', 150, 500, 'CAT06');
-- Caso 3: Intentar insertar una categoria con un valor minimo mayor que el valor maximo.
-- Restriccion: Definicion de atributo 
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT07', 'Categoria H', 'L', 250, 50, 'CAT07');

-- Tabla articulos
-- Caso 1: Intentar insertar un articulo con un ID que ya existe en la tabla.
-- Restriccion: Llave primaria y foranea
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (5261397714268532, 'Desc. Articulo 6', 'U', 'https://ejemplo.com/archivo6.pdf', 60, 'TRUE', 'CAT11', 'USR007');
-- Caso 2: Intentar insertar un articulo con una descripcion erronea.
-- Restriccion: Definicion de atributo 
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123456, 'Ayer estaba en Lima', 'N', 'https://dominio.com/foto7.pdf', 70, 'TRUE', 'CAT45', 'USR004');
-- Caso 3: Intentar insertar un articulo con un estado que no cumple con las restricciones definidas.
-- Restriccion: Definicion de atributo
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (7890123456789012, 'Desc. Articulo 8', 'A', 'https://ejemplo.net/otrafoto8.pdf', 80, 'FALSE', 'CAT35', 'USR003');

-- Tabla caracteristicas
-- Caso 1: Intentar insertar una Caracteristica con un articulo que no existe en la tabla de articulos.
-- Restriccion: Llave foranea
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (9876543210987654, 'Caract. Articulo 4');
-- Caso 2: Intentar insertar una Caracteristica con una descripcion erronea.
-- Restriccion: Definicion de atributo 
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (5261397714268532, 'Hoy es lunes');
-- Caso 3: Intentar insertar una Caracteristica con un codigo de articulo negativo.
--- Restriccion: Definicion de atributo 
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (-9337462158946721, 'Caract. Articulo 12');

-- Tabla ropas
-- Caso 1: Intentar insertar una prenda de ropa con un articulo que no existe en la tabla de articulos.
-- Restriccion: Llave foranea
INSERT INTO ropas (articulo, talla, material, color) VALUES (9876543210987654, 'M', 'Algodon', 'Azul');
-- Caso 2: Intentar insertar una prenda de ropa con una talla invalida.
-- Restriccion: Definicion de atributo 
INSERT INTO ropas (articulo, talla, material, color) VALUES (5261397714268532, 'XX', 'Seda', 'Rojo');
-- Caso 3: Intentar insertar una prenda de ropa con un material incorrecto.
-- Restriccion: Definicion de atributo 
INSERT INTO ropas (articulo, talla, material, color) VALUES (9337462158946721, 'L', 'Algodon', 'Felipe');

-- Tabla perecederos
-- Caso 1: Intentar insertar un articulo perecedero con un articulo que no existe en la tabla de articulos.
-- Restriccion: Llave foranea
INSERT INTO perecederos (articulo, vencimiento) VALUES (453543210987654, TO_DATE('2024-12-31', 'YYYY-MM-DD'));
-- Caso 2: Intentar insertar un articulo perecedero con una fecha de vencimiento pasada.
-- Restriccion: Definicion de atributo 
INSERT INTO perecederos (articulo, vencimiento) VALUES (5261397714268532, TO_DATE('1345-12-15', 'YYYY-MM-DD'));
-- Caso 3: Intentar insertar un articulo perecedero con una fecha de vencimiento anterior a la fecha actual.
-- Restriccion: Definicion de atributo 
INSERT INTO perecederos (articulo, vencimiento) VALUES (9337462158946721, TO_DATE('2022-12-31', 'YYYY-MM-DD'));

-- Tabla auditorias
-- Caso 1: Intentar insertar una auditoria con un ID que ya existe en la tabla.
--- Restriccion: Llave primaria
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (1, TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'I', 'Auditoria 6', '202108', 'CAT76');
-- Caso 2: Intentar insertar una auditoria con una accion que no cumple con las restricciones definidas.
-- Restriccion: Definicion de atributo 
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (6, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'A', 'Auditoria 7', '202311', 'CAT65');
-- Caso 3: Intentar insertar una auditoria con una fecha incorrecta.
-- Restriccion: Definicion de atributo 
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (7, TO_DATE('1888-06-01', 'YYYY-MM-DD'), 'U', 'Auditoria 9', '200507', 'CAT87');

-- Tabla evaluaciones
-- Caso 1: Intentar insertar una evaluacion con un a_omes invalido.
-- Restriccion: Llave foranea y definicion de atributo 
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('154145', 'CC', 'N06', TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 6 - A', 'https://ejemplo.com/reporte6.pdf', 'AP');
-- Caso 2: Intentar insertar una evaluacion con un resultado que no cumple con las restricciones definidas.
-- Restriccion: Definicion de atributo 
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('202405', 'CC', 'N07', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 7 - M', 'https://otroejemplo.com/reporte7.pdf', 'TI');
-- Caso 3: Intentar insertar una evaluacion con un reporte invalido.
-- Restriccion: Definicion de atributo 
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('201512', 'TI', 'N08', TO_DATE('2024-03-21', 'YYYY-MM-DD'), 'Descripcion de la evaluacion 8 - M', 'Hola soy Jorge', 'AP');

-- Tabla respuestas
-- Caso 1: Intentar insertar una respuesta con un a_omes que no existe en la tabla evaluaciones.
-- Restriccion: Llave foranea
INSERT INTO respuestas (a_omes, respuesta) VALUES ('201204', 'Respuesta a la pregunta 6');
-- Caso 2: Intentar insertar una respuesta como fecha.
-- Restriccion: Definicion de atributo 
INSERT INTO respuestas (a_omes, respuesta) VALUES ('202107', TO_DATE('2024-03-21', 'YYYY-MM-DD'));
-- Caso 3: Intentar insertar una respuesta con una respuesta como valor booleano.
-- Restriccion: Definicion de atributo
INSERT INTO respuestas (a_omes, respuesta) VALUES ('202105', 'TRUE');



-- CICLO 1: PoblarOK 2 (Final)

-- Inserciones en la tabla universidades
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U01', 'Universidad A', 'Carrera 30 # 45-03', 'USR001');
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U02', 'Universidad B', 'Carrera 1 # 18A-12', 'USR002');
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U03', 'Universidad C', 'Carrera 7 # 40-62', 'USR003');
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U04', 'Universidad D', 'Carrera 13 # 14-69', 'USR004');
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U05', 'Universidad E', 'Calle 12C # 6-25', 'USR005');
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U06', 'Universidad F', 'Calle 74 # 14-14', 'USR006');
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U07', 'Universidad G', 'Calle 12 # 1-17', 'USR007');
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U08', 'Universidad H', 'Calle 70 # 5-24', 'USR008');
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U09', 'Universidad I', 'Carrera 5 # 14-16', 'USR009');
INSERT INTO universidades (codigo, nombre, direccion, usuario) VALUES ('U10', 'Universidad J', 'Carrera 10 # 45-38', 'USR010');

-- Inserciones en la tabla usuarios
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR001', 'CC', '1234567890', 'Juan Perez', 'Sistemas', 'juan.perez@example.com', TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL, 0, 'U01');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR002', 'TI', '0987654321', 'Maria Rodriguez', 'Ingenieria Civil', 'maria.rodriguez@example.com', TO_DATE('2023-11-20', 'YYYY-MM-DD'), NULL, 0, 'U02');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR003', 'CC', '2468101214', 'Carlos Gutierrez', 'Ingenieria Mecanica', 'carlos.gutierrez@example.com', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL, 0, 'U03');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR004', 'TI', '1357924680', 'Laura Martinez', 'Ingenieria Industrial', 'laura.martinez@example.com', TO_DATE('2023-10-05', 'YYYY-MM-DD'), NULL, 0, 'U04');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR005', 'CC', '9876543210', 'Andres Lopez', 'Ingenieria Biomedica', 'andres.lopez@example.com', TO_DATE('2024-03-25', 'YYYY-MM-DD'), NULL, 0, 'U05');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR006', 'TI', '1111111111', 'Sofia Ramirez', 'Ingenieria de Sistemas', 'sofia.ramirez@example.com', TO_DATE('2024-04-01', 'YYYY-MM-DD'), NULL, 0, 'U06');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR007', 'CC', '2222222222', 'Diego Herrera', 'Ingenieria Ambiental', 'diego.herrera@example.com', TO_DATE('2023-09-12', 'YYYY-MM-DD'), NULL, 0, 'U07');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR008', 'TI', '3333333333', 'Ana Castro', 'Ingenieria Electrica', 'ana.castro@example.com', TO_DATE('2024-02-28', 'YYYY-MM-DD'), NULL, 0, 'U08');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR009', 'CC', '4444444444', 'Pedro Gomez', 'Ingenieria de Telecomunicaciones', 'pedro.gomez@example.com', TO_DATE('2023-12-18', 'YYYY-MM-DD'), NULL, 0, 'U09');
INSERT INTO usuarios (codigo, tid, nid, nombre, programa, correo, registro, suspencion, nSuspenciones, universidad) VALUES ('USR010', 'TI', '5555555555', 'Luisa Fernandez', 'Ingenieria Quimica', 'luisa.fernandez@example.com', TO_DATE('2024-01-05', 'YYYY-MM-DD'), NULL, 0, 'U10');

-- Inserciones en la tabla calificaciones
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('USR001', 1234567890123456, 5);
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('USR002', 1234567890123457, 4);
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('USR003', 1234567890123458, 3);
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('USR004', 1234567890123459, 4);
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('USR005', 1234567890123460, 5);
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('USR006', 1234567890123461, 4);
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('USR007', 1234567890123462, 3);
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('USR008', 1234567890123463, 5);
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('USR009', 1234567890123464, 4);
INSERT INTO calificaciones (usuario, articulo, estrella) VALUES ('USR010', 1234567890123465, 3);

-- Inserciones en la tabla categorias
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('C01', 'Electronica', 'A', 50, 250, 'C04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('C02', 'Libros', 'R', 50, 250, 'C04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('C03', 'Herramientas', 'L', 50, 250, 'C04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('C04', 'Varios', 'T', 50, 250, 'C04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('C05', 'Electrodomesticos', 'A', 50, 250, 'C04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('C06', 'Videojuegos', 'R', 50, 250, 'C04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('C07', 'Juguetes', 'L', 50, 250, 'C04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('C08', 'Ropa', 'T', 50, 250, 'C04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('C09', 'Accesorios', 'A', 50, 250, 'C04');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('C10', 'Arte', 'R', 50, 250, 'C04');

-- Inserciones en la tabla articulos
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123456, 'Laptop', 'U', 'https://example.com/laptop.jpg', 200, 'TRUE', 'C01', 'USR001');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123457, 'Libro de Matematicas', 'U', 'https://example.com/libro_mate.jpg', 100, 'TRUE', 'C02', 'USR002');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123458, 'Taladro', 'U', 'https://example.com/taladro.jpg', 150, 'TRUE', 'C03', 'USR003');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123459, 'Silla de Oficina', 'U', 'https://example.com/silla_ofi.jpg', 200, 'TRUE', 'C04', 'USR004');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123460, 'Licuadora', 'U', 'https://example.com/licuadora.jpg', 250, 'TRUE', 'C05', 'USR005');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123461, 'FIFA 22', 'U', 'https://example.com/fifa22.jpg', 150, 'TRUE', 'C06', 'USR006');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123462, 'Muñeca', 'U', 'https://example.com/muneca.jpg', 100, 'TRUE', 'C07', 'USR007');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123463, 'Camiseta', 'U', 'https://example.com/camiseta.jpg', 50, 'TRUE', 'C08', 'USR008');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123464, 'Collar', 'U', 'https://example.com/collar.jpg', 100, 'TRUE', 'C09', 'USR009');
INSERT INTO articulos (id, descripcion, estado, foto, precio, disponible, categoria, usuario) VALUES (1234567890123465, 'Cuadro', 'U', 'https://example.com/cuadro.jpg', 150, 'TRUE', 'C10', 'USR010');

-- Inserciones en la tabla caracteristicas
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (1234567890123456, '16GB RAM');
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (1234567890123457, 'Nivel Avanzado');
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (1234567890123458, 'Potencia de 600W');
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (1234567890123459, 'Respaldo Ergonomico');
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (1234567890123460, 'Capacidad de 2L');
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (1234567890123461, 'Para PS5');
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (1234567890123462, 'De Plastico');
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (1234567890123463, 'Talla M');
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (1234567890123464, 'Dorado');
INSERT INTO caracteristicas (articulo, caracteristica) VALUES (1234567890123465, 'Autor: Picasso');

-- Inserciones en la tabla ropas
INSERT INTO ropas (articulo, talla, material, color) VALUES (1234567890123470, 'S', 'Algodon', 'Blanco');
INSERT INTO ropas (articulo, talla, material, color) VALUES (1234567890123471, 'M', 'Lino', 'Negro');
INSERT INTO ropas (articulo, talla, material, color) VALUES (1234567890123472, 'L', 'Seda', 'Azul');
INSERT INTO ropas (articulo, talla, material, color) VALUES (1234567890123473, 'XL', 'Poliester', 'Rojo');
INSERT INTO ropas (articulo, talla, material, color) VALUES (1234567890123474, 'M', 'Algodon', 'Verde');
INSERT INTO ropas (articulo, talla, material, color) VALUES (1234567890123475, 'S', 'Lino', 'Gris');
INSERT INTO ropas (articulo, talla, material, color) VALUES (1234567890123476, 'M', 'Seda', 'Blanco');
INSERT INTO ropas (articulo, talla, material, color) VALUES (1234567890123477, 'L', 'Poliester', 'Negro');
INSERT INTO ropas (articulo, talla, material, color) VALUES (1234567890123478, 'XL', 'Algodon', 'Azul');
INSERT INTO ropas (articulo, talla, material, color) VALUES (1234567890123479, 'S', 'Lino', 'Rojo');

-- Inserciones en la tabla perecederos
INSERT INTO perecederos (articulo, vencimiento) VALUES (1234567890123470, TO_DATE('2024-04-10', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento) VALUES (1234567890123471, TO_DATE('2024-04-15', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento) VALUES (1234567890123472, TO_DATE('2024-04-20', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento) VALUES (1234567890123473, TO_DATE('2024-04-25', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento) VALUES (1234567890123474, TO_DATE('2024-04-30', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento) VALUES (1234567890123475, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento) VALUES (1234567890123476, TO_DATE('2024-05-10', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento) VALUES (1234567890123477, TO_DATE('2024-05-15', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento) VALUES (1234567890123478, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO perecederos (articulo, vencimiento) VALUES (1234567890123479, TO_DATE('2024-05-25', 'YYYY-MM-DD'));

-- Inserciones en la tabla auditorias
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (1, CURRENT_TIMESTAMP, 'I', 'Laptop', '000101', 'C01');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (2, CURRENT_TIMESTAMP, 'I', 'Libro de Matematicas', '000102', 'C02');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (3, CURRENT_TIMESTAMP, 'I', 'Taladro', '000103', 'C03');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (4, CURRENT_TIMESTAMP, 'I', 'Silla de Oficina', '000104', 'C04');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (5, CURRENT_TIMESTAMP, 'I', 'Licuadora', '000105', 'C05');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (6, CURRENT_TIMESTAMP, 'I', 'FIFA 22', '000106', 'C06');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (7, CURRENT_TIMESTAMP, 'I', 'Muneca', '000107', 'C07');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (8, CURRENT_TIMESTAMP, 'I', 'Camiseta', '000108', 'C08');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (9, CURRENT_TIMESTAMP, 'I', 'Collar', '000109', 'C09');
INSERT INTO auditorias (id, fecha, accion, nombre, evaluacion, categoria) VALUES (10, CURRENT_TIMESTAMP, 'I', 'Cuadro', '000110', 'C10');

-- Inserciones en la tabla evaluaciones
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('000101', 'CC', '1234567890', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'La laptop funciona correctamente.', 'https://example.com/auditoria_laptop.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('000102', 'TI', '1234567891', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'El libro esta en buen estado.', 'https://example.com/auditoria_libro.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('000103', 'CC', '1234567892', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'El taladro presenta problemas.', 'https://example.com/auditoria_taladro.pdf', 'PE');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('000104', 'TI', '1234567893', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'La silla esta en perfecto estado.', 'https://example.com/auditoria_silla.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('000105', 'CC', '1234567894', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'La licuadora funciona correctamente.', 'https://example.com/auditoria_licuadora.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('000106', 'TI', '1234567895', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'El juego FIFA 22 esta en su empaque original.', 'https://example.com/auditoria_fifa22.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('000107', 'CC', '1234567896', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'La muneca tiene un defecto de fabrica.', 'https://example.com/auditoria_muneca.pdf', 'PE');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('000108', 'TI', '1234567897', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'La camiseta tiene una mancha.', 'https://example.com/auditoria_camiseta.pdf', 'PE');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('000109', 'CC', '1234567898', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'El collar esta en perfecto estado.', 'https://example.com/auditoria_collar.pdf', 'AP');
INSERT INTO evaluaciones (a_omes, tid, nid, fecha, descripcion, reporte, resultado) VALUES ('000110', 'TI', '1234567899', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'El cuadro tiene una esquina danada.', 'https://example.com/auditoria_cuadro.pdf', 'PE');

-- Inserciones en la tabla respuestas
INSERT INTO respuestas (a_omes, respuesta) VALUES ('000001', 'Aprobada');
INSERT INTO respuestas (a_omes, respuesta) VALUES ('000002', 'Rechazada');
INSERT INTO respuestas (a_omes, respuesta) VALUES ('000003', 'Aprobada');
INSERT INTO respuestas (a_omes, respuesta) VALUES ('000004', 'Rechazada');
INSERT INTO respuestas (a_omes, respuesta) VALUES ('000005', 'Aprobada');
INSERT INTO respuestas (a_omes, respuesta) VALUES ('000006', 'Rechazada');
INSERT INTO respuestas (a_omes, respuesta) VALUES ('000007', 'Aprobada');
INSERT INTO respuestas (a_omes, respuesta) VALUES ('000008', 'Rechazada');
INSERT INTO respuestas (a_omes, respuesta) VALUES ('000009', 'Aprobada');
INSERT INTO respuestas (a_omes, respuesta) VALUES ('000010', 'Rechazada');



-- CICLO 1: XPoblar

DELETE FROM universidades;
DELETE FROM usuarios;
DELETE FROM calificaciones;
DELETE FROM categorias;
DELETE FROM articulos;
DELETE FROM caracteristicas;
DELETE FROM ropas;
DELETE FROM perecederos;
DELETE FROM auditorias;
DELETE FROM evaluaciones;
DELETE FROM respuestas;



-- CICLO 1: TuplasOK

-- Los datos se insertan pues el precio minimo debe ser menor que el maximo

INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT11', 'Electronics', 'E', 50, 100, 'CAT11');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT12', 'Clothing', 'C', 100, 150, 'CAT12');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT13', 'Books', 'B', 100, 200, 'CAT13');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT14', 'Home', 'H', 150, 200, 'CAT14');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT15', 'Toys', 'T', 200, 250, 'CAT15');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT16', 'Automotive', 'A', 150, 200, 'CAT16');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT17', 'Health', 'H', 100, 150, 'CAT17');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT18', 'Sports', 'S', 100, 200, 'CAT18');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT19', 'Tools', 'T', 150, 200, 'CAT19');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT20', 'Pet Supplies', 'P', 200, 250, 'CAT20');



-- CICLO 1: TuplasNoOK

-- En este caso no permite el ingreso pues el precio minimo es mayor que el maximo puesto y manda un error

INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT21', 'Clothing', 'C', 100, 50, 'CAT21');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT22', 'Automotive', 'A', 200, 100, 'CAT22');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT23', 'Pet Supplies', 'P', 300, 150, 'CAT23');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT24', 'Sports', 'S', 400, 200, 'CAT24');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT25', 'Home', 'H', 500, 250, 'CAT25');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT26', 'Tools', 'T', 600, 300, 'CAT26');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT27', 'Pet Supplies', 'P', 700, 350, 'CAT27');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT28', 'Sports', 'S', 800, 400, 'CAT28');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT29', 'Health', 'H', 900, 450, 'CAT29');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT30', 'Pet Supplies', 'B', 1000, 500, 'CAT30');



-- CICLO 1: AccionesOK

-- Insersion de datos en la tabla categorias, por lo cual no tiene articulos relacionados

INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1)  VALUES ('CAT99', 'Sin articulos', 'S', 50, 100, 'CAT99');

-- Eliminacion valida de el dato sin 'articulos'

DELETE FROM categorias WHERE codigo = 'CAT99';



-- CICLO 1: AccionesNoOK




-- CICLO 1: TriggersOK

-- TR_CATEGORIA_NOMBRE
-- En este caso se permite el ingreso de datos, pues las categorias tienen nombres vacios y se autocompletan con el trigger

INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT31', NULL, 'C', 50, 100, 'CAT31');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT32', NULL, 'A', 100, 150, 'CAT32');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT33', NULL, 'P', 150, 200, 'CAT33');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT34', NULL, 'S', 200, 250, 'CAT34');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT35', NULL, 'H', 250, 300, 'CAT35');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT36', NULL, 'T', 300, 350, 'CAT36');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT37', NULL, 'P', 350, 400, 'CAT37');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT38', NULL, 'S', 400, 450, 'CAT38');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT39', NULL, 'H', 450, 500, 'CAT39');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT40', NULL, 'B', 500, 550, 'CAT40');

-- TR_CATEGORIA_MAXIMO
-- En este caso se permite el ingreso de datos, pues las categorias tienen un valor nulo y se cambiarian con el trigger

INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT61', 'Electronics', 'E', 200, NULL, 'CAT61');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT62', 'Clothing', 'C', 100, NULL, 'CAT62');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT63', 'Books', 'B', 100, NULL, 'CAT63');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT64', 'Home', 'H', 300, NULL, 'CAT64');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT65', 'Toys', 'T', 200, NULL, 'CAT65');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT66', 'Automotive', 'A', 300, NULL, 'CAT66');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT67', 'Health', 'H', 100, NULL, 'CAT67');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT68', 'Sports', 'S', 100, NULL, 'CAT68');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT69', 'Tools', 'T', 200, NULL, 'CAT69');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT70', 'Pet Supplies', 'P', 300, NULL, 'CAT70');

-- TR_CATEGORIA_MINMAX
-- En este caso se actualizaron 3 datos de tal forma que se aumentara los precios y el trigger se activa

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT19';

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT19';

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT20';

-- TR_CATEGORIA_NEWMAX
-- En este caso actualizamos 3 de los datos del poblar OK activando el trigger al subir el minimo a un valor mayor al maximo

UPDATE categorias
SET minimo = 600
WHERE codigo = 'CAT14';

UPDATE categorias
SET minimo = 600
WHERE codigo = 'CAT15';

UPDATE categorias
SET minimo = 600
WHERE codigo = 'CAT16';

-- TR_AUDITORIA_MOD_UPD
-- En este caso se actualizan 2 datos de la tabla de auditorias, los cuales son aptos para que el trigger se cumpla y se envia el menaje de restriccion

UPDATE auditorias
SET fecha = TO_DATE('2024-03-18', 'YYYY-MM-DD')
WHERE id = 1;

UPDATE auditorias
SET fecha = TO_DATE('2024-03-18', 'YYYY-MM-DD')
WHERE id = 2;

DELETE FROM auditorias
WHERE id = 1;

DELETE FROM auditorias
WHERE id = 2;



-- CICLO 1: TriggersNoOK

-- TR_CATEGORIA_NOMBRE
-- En este caso no se aceptan los valores, pues el valor del maximo esta declarado de forma erronea

INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT51', 'Electronics', 'E', 50, 100, 'CAT51');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT52', 'Clothing', 'C', 100, 150, 'CAT52');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT53', 'Books', 'B', 150, 200, 'CAT53');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT54', 'Home', 'H', 200, 250, 'CAT54');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT55', 'Toys', 'T', 250, 300, 'CAT55');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT56', 'Automotive', 'A', 300, 350, 'CAT56');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT57', 'Health', 'H', 350, 400, 'CAT57');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT58', 'Sports', 'S', 400, 450, 'CAT58');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT59', 'Tools', 'T', 450, 500, 'CAT59');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT60', 'Pet Supplies', 'P', 500, 550, 'CAT60');


-- TR_CATEGORIA_NOMBRE
-- En este caso no permite la activacion, pues las categorias tienen nombres declarados

INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT41', 'Electronics', 'E', 200, 400, 'CAT41');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT42', 'Clothing', 'C', 100, 200, 'CAT42');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT43', 'Books', 'B', 100, 150, 'CAT43');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT44', 'Home', 'H', 200, 400, 'CAT44');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT45', 'Toys', 'T', 150, 250, 'CAT45');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT46', 'Automotive', 'A', 200, 400, 'CAT46');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT47', 'Health', 'H', 100, 200, 'CAT47');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT48', 'Sports', 'S', 100, 250, 'CAT48');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT49', 'Tools', 'T', 150, 400, 'CAT49');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT50', 'Pet Supplies', 'P', 200, 250, 'CAT50');


-- TR_CATEGORIA_MAXIMO
-- En este caso no se activa el trigger, pues los minimos tienen un valor declarado

INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT61', 'Electronics', 'E', 200, 400, 'CAT61');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT62', 'Clothing', 'C', 100, 400, 'CAT62');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT63', 'Books', 'B', 100, 400, 'CAT63');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT64', 'Home', 'H', 300, 400, 'CAT64');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT65', 'Toys', 'T', 200, 400, 'CAT65');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT66', 'Automotive', 'A', 300, 400, 'CAT66');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT67', 'Health', 'H', 100, 400, 'CAT67');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT68', 'Sports', 'S', 100, 400, 'CAT68');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT69', 'Tools', 'T', 200, 400, 'CAT69');
INSERT INTO categorias (codigo, nombre, tipo, minimo, maximo, codigo1) VALUES ('CAT70', 'Pet Supplies', 'P', 300, 400, 'CAT70');


-- TR_CATEGORIA_MINMAX
-- En este caso se actualizaron 3 datos de tal forma que se aumentara los precios y el trigger se activa

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT19';

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT19';

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT20';

-- TR_CATEGORIA_NEWMAX
-- En este caso actualizamos 5 de los datos del poblar OK activando el trigger, los cuales no son aptos para que el trigger se cumpla

UPDATE categorias
SET minimo = 50
WHERE codigo = 'CAT11';

UPDATE categorias
SET minimo = 50
WHERE codigo = 'CAT12';

UPDATE categorias
SET minimo = 0
WHERE codigo = 'CAT13';

-- TR_AUDITORIA_MOD_UPD
-- En este caso se actualizan 2 datos de la tabla de auditorias, los cuales no son aptos para que el trigger se cumpla y se trata de eliminar a estos

UPDATE auditorias
SET fecha = TO_DATE('2024-07-14', 'YYYY-MM-DD')
WHERE id = 0;

UPDATE auditorias
SET fecha = TO_DATE('2026-06-16', 'YYYY-MM-DD')
WHERE id = 1000;

DELETE FROM auditorias
WHERE id = 0;

DELETE FROM auditorias
WHERE id = 1000;



-- CICLO 1: XTriggers

DROP TRIGGER TR_CATEGORIA_FECHAG_BI;
DROP TRIGGER TR_CATEGORIA_NOMBRE_BI;
DROP TRIGGER TR_CATEGORIA_MAXIMO;
DROP TRIGGER TR_CATEGORIA_MINMAX_BI;
DROP TRIGGER TR_CATEGORIA_NEWMAX_BU;
DROP TRIGGER TR_AUDITORIAS_DEL;
DROP TRIGGER TR_AUDITORIAS_UP;



-- CICLO 1: IndicesVistasOK

-- Índices de la tabla usuarios

SELECT *
FROM usuarios
WHERE codigo = 'USR001';

SELECT *
FROM usuarios
WHERE nid = '9876543210';

-- Índice de la tabla categorías

SELECT *
FROM categorias
WHERE codigo = 'CAT55';

-- Índice de la tabla artículos

SELECT *
FROM articulos
WHERE id = '1234567890123461';

-- Índice de la tabla evaluaciones

SELECT *
FROM evaluaciones
WHERE a_omes = '000106';

-- Vista de Trueques Exitosos (Gerente)

SELECT *
FROM VTRUEQUES_EXITOSOS;

-- Vista de la tabla categorías

SELECT *
FROM VCATEGORIAS;

-- Vista de la tabla calificaiones

SELECT *
FROM VCALIFICACIONES;



-- CICLO 1: CRUDOK

-- PK_EVALUACIONES

BEGIN
    PK_EVALUACIONES.adicionar('CC', '1234567890', 'Descripción de la evaluación', 'https://reporte.pdf', 'AP');
END;
BEGIN
    PK_EVALUACIONES.consultar('202301', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Descripción de la evaluación', 'https://reporte.pdf', 'AP');
END;
BEGIN
    PK_EVALUACIONES.modificar('Nueva descripción de la evaluación');
END;
BEGIN
    PK_EVALUACIONES.eliminar('000102');
END;

-- PK_AUDITORIAS

BEGIN
    PK_AUDITORIAS.adicionar('I', 'AUDI1074353');
END;
BEGIN
    PK_AUDITORIAS.adicionar('I', 'AUDI1074353');
END;
BEGIN
    PK_AUDITORIAS.modificar('Nuevo resultado de la auditoría');
END;
BEGIN
    PK_AUDITORIAS.eliminar(543155);
END;

-- PK_RESPUESTAS

BEGIN
    PK_RESPUESTAS.adicionar('Respuesta de la auditoría');
END;
BEGIN
    PK_RESPUESTAS.consultar('EVAL01', 'Respuesta de la auditoría');
END;
BEGIN
    PK_RESPUESTAS.modificar();
END;
BEGIN
    PK_RESPUESTAS.eliminar('000105');
END;



-- CICLO 1: CRUDNoOK

-- PK_EVALUACIONES

BEGIN
    PK_EVALUACIONES.adicionar('T1', '1234567890', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin suscipit justo sit amet convallis vehicula.', 'Reporte 1', 'OK');
END;
BEGIN
    PK_EVALUACIONES.consultar('202301', TO_DATE('2023-01-32', 'YYYY-MM-DD'), 'Descripción 1', 'Reporte 1', 'OK');
END;
BEGIN
    PK_EVALUACIONES.modificar('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin suscipit justo sit amet convallis vehicula.');
END;
BEGIN
    PK_EVALUACIONES.eliminar('202301');
END;

-- PK_AUDITORIAS

BEGIN
    PK_AUDITORIAS.adicionar('X', 'UsuarioX');
END;
BEGIN
    PK_AUDITORIAS.consultar(5431236, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'X', 'UsuarioX', 'OK', 'CAT01');
END;
BEGIN
    PK_AUDITORIAS.modificar('La auditoría fue aprobada, sin hallazgos.');
END;
BEGIN
    PK_AUDITORIAS.eliminar(5431236);
END;

-- PK_RESPUESTAS

BEGIN
    PK_RESPUESTAS.adicionar('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin suscipit justo sit amet convallis vehicula.');
END;
BEGIN
    PK_RESPUESTAS.consultar('202301', 'Respuesta larga que excede los 50 caracteres');
END;
BEGIN
    PK_RESPUESTAS.modificar();
END;
BEGIN
    PK_RESPUESTAS.eliminar(5431236);
END;



-- CICLO 1: SeguridadOK

-- PK_ADMINISTRADOR

CALL PK_ADMINISTRADOR.adicionarAuditoria('A', 'Nombre de ejemplo');
CALL PK_ADMINISTRADOR.consultarAuditoria(:v_id, :v_fecha, :v_accion, :v_nombre, :v_evaluacion, :v_categoria, 1001);
CALL PK_ADMINISTRADOR.modificarAuditoria('Resultado modificado');

-- PK_AUDITOR

CALL PK_AUDITOR.adicionarEvaluacion('202204', 'TID01', 'NID1234567890', 'Descripción de la evaluación', 'Reporte de la evaluación', 'OK');
CALL PK_AUDITOR.consultarEvaluacion('202204', 'TID01', 'NID1234567890');
CALL PK_AUDITOR.modificarEvaluacion('Resultado modificado', '202204');
CALL PK_AUDITOR.eliminarEvaluacion('202204');
CALL PK_AUDITOR.adicionarRespuesta('Respuesta de ejemplo');
CALL PK_AUDITOR.consultarRespuesta('202204', 'Respuesta de ejemplo');

-- Roles y Usuarios

-- 1. Casos de Éxito

-- 1.1. Éxito en la adición de una auditoría por el Administrador:
CALL PK_ADMINISTRADOR.adicionarAuditoria('Acción X', 'Usuario Y');

-- 1.2. Éxito en la consulta de una auditoría por el Administrador:
CALL PK_ADMINISTRADOR.consultarAuditoria(:id, :fecha, :accion, :nombre, :evaluacion, :categoria);

-- 1.3. Éxito en la modificación de una auditoría por el Administrador:
CALL PK_ADMINISTRADOR.modificarAuditoria('Nuevo resultado');

-- 1.4. Éxito en la adición de una evaluación por el Auditor:
CALL PK_AUDITOR.adicionarEvaluacion('A01', 'TID', 'NID', 'Descripción', 'Reporte', 'Resultado');

-- 1.5. Éxito en la consulta de una evaluación por el Auditor:
CALL PK_AUDITOR.consultarEvaluacion('A01', 'TID', 'NID');



-- CICLO 1: SeguridadNoOK

-- 2. Casos de Fracaso

-- 2.1. Fracaso en la adición de una auditoría por el Administrador debido a falta de permisos:
CALL PK_ADMINISTRADOR.adicionarAuditoria('Acción X', 'Usuario Y');

-- 2.2. Fracaso en la modificación de una auditoría por el Administrador debido a falta de permisos:
CALL PK_ADMINISTRADOR.modificarAuditoria('Nuevo resultado');

-- 2.3. Fracaso en la adición de una evaluación por el Auditor debido a falta de permisos:
CALL PK_AUDITOR.adicionarEvaluacion('A01', 'TID', 'NID', 'Descripción', 'Reporte', 'Resultado');

---------- CODE END ----------