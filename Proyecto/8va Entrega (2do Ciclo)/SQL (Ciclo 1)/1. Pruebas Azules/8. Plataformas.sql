---------- CODE START ----------

-- CICLO 1: PoblarOK

INSERT INTO Plataformas(plataforma) VALUES ('PC');
INSERT INTO Plataformas(plataforma) VALUES ('WII');
INSERT INTO Plataformas(plataforma) VALUES ('XBOX');
INSERT INTO Plataformas(plataforma) VALUES ('STEAM');
INSERT INTO Plataformas(plataforma) VALUES ('NINTENDO');
INSERT INTO Plataformas(plataforma) VALUES ('PLAY STATION');
COMMIT;



-- CICLO 1: PoblarNoOK

-- 1. La plataforma ingresada no está dentro de las opciones.

INSERT INTO Plataformas (plataforma) VALUES ('ANDROID');
INSERT INTO Plataformas (plataforma) VALUES ('IOS');
INSERT INTO Plataformas (plataforma) VALUES ('MAC');

COMMIT;
---------- CODE END ----------