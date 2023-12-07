-- Active: 1701904023136@@127.0.0.1@3306@TBM_DB

#########################################################

-- CREATE DATABASE

CREATE DATABASE IF NOT EXISTS TBM_DB;

-----------------------------------------------------------

-- USE DB

USE TBM_DB;

-----------------------------------------------------------

-- CREATE ZONES TABLE

CREATE TABLE IF NOT EXISTS ZONAS (
    id_zona INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    zona VARCHAR(100)
);

-----------------------------------------------------------------

-- CREATE ROUTES TABLE

CREATE TABLE IF NOT EXISTS RUTAS (
    id_ruta INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    ruta VARCHAR(100),
    tiempo_ruta TIME,
    id_zona INT,
    CONSTRAINT FOREIGN KEY (id_zona) REFERENCES ZONAS(id_zona)
);

----------------------------------------------------------------------

-- CREATE STATIONS TABLE

CREATE TABLE IF NOT EXISTS ESTACIONES (
    id_estacion INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    estacion VARCHAR(100)
);

-----------------------------------------------------------------------

-- CREATE BUSES TABLE

CREATE TABLE IF NOT EXISTS BUSES (
    id_bus INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    placa VARCHAR(10)
);

-------------------------------------------------------------------------

-- CREATE DRIVERS TABLE

CREATE TABLE IF NOT EXISTS CONDUCTORES (
    id_conductor INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    p_nombre VARCHAR(50) NOT NULL,
    s_nombre VARCHAR(50),
    p_apellido VARCHAR(50) NOT NULL,
    s_apellido VARCHAR(50)
);

-----------------------------------------------------------------------------

-- CREATE STATIONS FOR EACH ROUTE TABLE

CREATE TABLE IF NOT EXISTS ESTACIONES_RUTA (
    id_ruta INT,
    id_estacion INT,
    CONSTRAINT FOREIGN KEY (id_ruta) REFERENCES RUTAS(id_ruta),
    CONSTRAINT FOREIGN KEY (id_estacion) REFERENCES ESTACIONES(id_estacion)
);

---------------------------------------------------------------------------------

-- CREATE BUS DRIVER FOR EACH DAY

CREATE TABLE IF NOT EXISTS CONDUCTOR_BUS (
    id_bus INT,
    id_conductor INT,
    dia VARCHAR(12),
    id_ruta INT,
    CONSTRAINT FOREIGN KEY (id_bus) REFERENCES BUSES(id_bus),
    CONSTRAINT FOREIGN KEY (id_conductor) REFERENCES CONDUCTORES(id_conductor),
    CONSTRAINT FOREIGN KEY (id_ruta) REFERENCES RUTAS(id_ruta)
);

-------------------------------------------------------------------------------------

#############################################################################################

-- POPULATION

-- INSERT ZONES

INSERT INTO ZONAS (zona) 
VALUES 
("Norte"), 
("Sur"),
("Oriente"),
("Occidente"),
("Floridablanca"),
("Girón"),
("Piedecuesta");

---------------------------------------------------------------------------------------------------------

-- INSERT ROUTES

INSERT INTO RUTAS (ruta, tiempo_ruta, id_zona)
VALUES
('Universidades','2:00:00',1),
('Café Madrid','2:15:00',1),
('Cacique','1:45:00',NULL),
('Diamantes','1:50:00',4),
('Terminal','2:00:00',4),
('Prado','1:30:00',NULL),
('Cabecera','1:30:00',NULL),
('Ciudadela','2:00:00',NULL),
('Punta Estrella','2:30:00',NULL),
('Niza','2:45:00',5),
('Autopista','2:15:00',5),
('Lagos','2:15:00',5),
('Centro Florida','2:30:00',NULL);

--------------------------------------------------------------------------------------------------------

-- INSERT STATIONS

INSERT INTO ESTACIONES (estacion)
VALUES
('Colseguros'),
('Clínica Chicamocha'),
('Plaza Guarín'),
('Mega Mall'),
('UIS'),
('UDI'),
('Santo Tomás'),
('Boulevard Santander'),
('Búcaros'),
('Rosita'),
('Puerta del Sol'),
('Cacique'),
('Plaza Satélite'),
('La Sirena'),
('Provenza '),
('Fontana'),
('Gibraltar '),
('Terminal'),
('Mutis'),
('Plaza Real');

-----------------------------------------------------------------------------------------------------

-- INSERT DRIVERS

INSERT INTO CONDUCTORES (p_nombre, s_nombre, p_apellido, s_apellido)
VALUES
('Andrés','Manuel','López','Obrador'),
('Nicolás','Maduro','Moros',NULL),
('Alberto', NULL,'Fernández', NULL),
('Luiz','Inácio','Lula','da Silva'),
('Gabriel',NULL,'Boric', NULL),
('Miguel', NULL,'Díaz-Canel', NULL),
('Daniel', NULL, 'Ortega', NULL),
('Gustavo','Petro','Urrego', NULL),
('Luis', NULL,'Arce', NULL),
('Xiomara', NULL,'Castro', NULL);

---------------------------------------------------------------------------------------------

-- INSERT BUSES

INSERT INTO BUSES (placa)
VALUES
("XVH345"),
("XDL965"),
("XFG847"),
("XRJ452"),
("XDF459"),
("XET554"),
("XKL688"),
("XXL757");

-----------------------------------------------------------------------------

-- INSERT ROUTES FOR EACH ZONE

INSERT INTO ESTACIONES_RUTA (id_ruta, id_estacion)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(3,8),
(3,9),
(3,10),
(3,11),
(3,12),
(4,13),
(4,14),
(4,15),
(5,16),
(5,17),
(8,18),
(8,19),
(8,20);

--------------------------------------------------------------------------------

-- INSERT DRIVER FOR EACH BUS

INSERT INTO CONDUCTOR_BUS (id_bus, id_conductor, dia, id_ruta)
VALUES
(1,5,'Lunes', 1),
(1,5,'Martes', 1),
(3,5,'Miércoles', 1),
(3,5,'Jueves', 1),
(5,5,'Viernes', 2),
(5,5,'Sábado', 2),
(5,5,'Domingo', 2),
(5,3,'Lunes', 4),
(6,3,'Martes', 4),
(1,3,'Miércoles', 4),
(1,3,'Jueves', 5),
(3,3,'Viernes', 5),
(3,3,'Sábado', 5),
(3,3,'Domingo', 5),
(3,10,'Lunes', 10),
(3,10,'Martes', 10),
(5,10,'Miércoles', 10),
(5,10,'Jueves', 10),
(4,10,'Viernes', 10),
(7,10,'Sábado', 11),
(7,10,'Domingo', 11),
(7,7,'Lunes', 11),
(7,7,'Martes', 11),
(7,6,'Miércoles', 12),
(7,6,'Jueves', 12),
(7,6,'Viernes', 12),
(6,6,'Sábado', 12),
(6,6,'Domingo', 12);

