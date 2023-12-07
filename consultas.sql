-- Active: 1701904023136@@127.0.0.1@3306@TBM_DB

-- 1) Cantidad de Paradas por Ruta

SELECT ruta, COUNT(ruta) AS cant_paradas FROM RUTAS
INNER JOIN ESTACIONES_RUTA ON (RUTAS.id_ruta IN (ESTACIONES_RUTA.id_ruta))
GROUP BY ruta;

-----------------------------------------------------------------------------

-- 2) Nombre de las Paradas de la Ruta Universidades

SELECT ruta, estacion FROM RUTAS
INNER JOIN ESTACIONES_RUTA ON (RUTAS.id_ruta IN (ESTACIONES_RUTA.id_ruta) AND RUTAS.id_ruta = 1)
INNER JOIN ESTACIONES ON (ESTACIONES.id_estacion IN (ESTACIONES_RUTA.id_estacion));

----------------------------------------------------------------------------------------------------------

-- 3) Nombres de las Rutas No Programadas

SELECT ruta FROM RUTAS
LEFT OUTER JOIN CONDUCTOR_BUS ON (RUTAS.id_ruta = CONDUCTOR_BUS.id_ruta)
WHERE CONDUCTOR_BUS.id_ruta IS NULL;

------------------------------------------------------------------------------------------------------------

-- 4) Rutas Programadas sin Conductor Asignado

SELECT * FROM RUTAS
INNER JOIN CONDUCTOR_BUS ON (RUTAS.id_ruta IN (CONDUCTOR_BUS.id_ruta))
WHERE CONDUCTOR_BUS.id_conductor IS NULL;

--------------------------------------------------------------------------------------------------------------

-- 5) Conductores No Asignados a la Programación

SELECT * FROM CONDUCTORES
LEFT OUTER JOIN CONDUCTOR_BUS ON (CONDUCTORES.id_conductor = CONDUCTOR_BUS.id_conductor)
WHERE CONDUCTOR_BUS.id_conductor IS NULL;

----------------------------------------------------------------------------------------------------------------

-- 6) Buses No asignados a la Programación

SELECT * FROM BUSES
LEFT OUTER JOIN CONDUCTOR_BUS ON (BUSES.id_bus = CONDUCTOR_BUS.id_bus)
WHERE CONDUCTOR_BUS.id_bus IS NULL;

----------------------------------------------------------------------------------------------------------------

-- 7) Zonas NO Programadas

SELECT zona, ruta FROM ZONAS
LEFT OUTER JOIN RUTAS ON (ZONAS.id_zona = RUTAS.id_zona)
WHERE RUTAS.id_zona IS NULL;

---------------------------------------------------------------------------------------------------------------

-- 8) Programación asignada a cada conductor (Conductor, Ruta y Día)

SELECT p_nombre, s_nombre, p_apellido, s_apellido, ruta, dia FROM CONDUCTORES
INNER JOIN CONDUCTOR_BUS ON (CONDUCTORES.id_conductor IN (CONDUCTOR_BUS.id_conductor))
INNER JOIN RUTAS ON (CONDUCTOR_BUS.id_ruta IN (RUTAS.id_ruta));

---------------------------------------------------------------------------------------------------------------

-- 9) Programación asignada a conductores que hacen rutas de más de dos horas



----------------------------------------------------------------------------------------------------------------

-- 10) Nombres de Zonas y cantidad de rutas que tienen programadas (Contar)

SELECT zona, COUNT(ruta) FROM ZONAS
INNER JOIN RUTAS ON (ZONAS.id_zona IN (RUTAS.id_zona))
GROUP BY zona;

------------------------------------------------------------------------------------------------------------------