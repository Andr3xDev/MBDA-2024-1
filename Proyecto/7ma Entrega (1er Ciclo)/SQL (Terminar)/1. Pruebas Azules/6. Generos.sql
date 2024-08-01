---------- CODE START ----------

-- CICLO 1: PoblarOK

INSERT INTO Generos(genero) VALUES ('Accion');
INSERT INTO Generos(genero) VALUES ('Aprendizaje');
INSERT INTO Generos(genero) VALUES ('Aventura');
INSERT INTO Generos(genero) VALUES ('Battle Royale');
INSERT INTO Generos(genero) VALUES ('Carreras');
INSERT INTO Generos(genero) VALUES ('Crafteo');
INSERT INTO Generos(genero) VALUES ('Deportes');
INSERT INTO Generos(genero) VALUES ('Desarrollo Software');
INSERT INTO Generos(genero) VALUES ('Diseño');
INSERT INTO Generos(genero) VALUES ('Disparos');
INSERT INTO Generos(genero) VALUES ('Edicion');
INSERT INTO Generos(genero) VALUES ('Educacion');
INSERT INTO Generos(genero) VALUES ('Entretenimiento');
INSERT INTO Generos(genero) VALUES ('Estrategia');
INSERT INTO Generos(genero) VALUES ('Horror');
INSERT INTO Generos(genero) VALUES ('Juego');
INSERT INTO Generos(genero) VALUES ('Lucha');
INSERT INTO Generos(genero) VALUES ('Mundo Abierto');
INSERT INTO Generos(genero) VALUES ('Multimedia');
INSERT INTO Generos(genero) VALUES ('Musical');
INSERT INTO Generos(genero) VALUES ('Navegador Web');
INSERT INTO Generos(genero) VALUES ('Oficina');
INSERT INTO Generos(genero) VALUES ('Productividad');
INSERT INTO Generos(genero) VALUES ('Puzzle');
INSERT INTO Generos(genero) VALUES ('Rol');
INSERT INTO Generos(genero) VALUES ('Seguridad');
INSERT INTO Generos(genero) VALUES ('Sigilo');
INSERT INTO Generos(genero) VALUES ('Simulacion');
INSERT INTO Generos(genero) VALUES ('Sistema Operativo');
INSERT INTO Generos(genero) VALUES ('Survival');
COMMIT;



-- CICLO 1: PoblarNoOK

-- 1. El género insertado no está dentro de las opciones permitidas.

INSERT INTO Generos (genero) VALUES ('Terror');
INSERT INTO Generos (genero) VALUES ('Fantasía 2');
INSERT INTO Generos (genero) VALUES ('Ciencia Ficción 2');

COMMIT;
---------- CODE END ----------