
SELECT NOMBRE FROM JUGADORES ORDER BY NOMBRE ASC;

SELECT NOMBRE,POSICION,PESO
FROM JUGADORES 
WHERE POSICION ='C' AND PESO > 200
ORDER BY NOMBRE ASC;

SELECT NOMBRE FROM EQUIPOS ORDER BY NOMBRE ASC;

SELECT NOMBRE , CONFERENCIA FROM EQUIPOS WHERE CONFERENCIA = 'EAST';

SELECT NOMBRE, CIUDAD 
FROM EQUIPOS 
WHERE CIUDAD LIKE 'C%'
ORDER BY NOMBRE ASC;

SELECT *
FROM JUGADORES J 
INNER JOIN EQUIPOS E ON J.NOMBRE_EQUIPO=E.NOMBRE
ORDER BY E.NOMBRE ASC;

SELECT *
FROM JUGADORES
WHERE NOMBRE_EQUIPO = 'RAPTORS'
ORDER BY NOMBRE;

SELECT E.PUNTOS_POR_PARTIDO, J.NOMBRE
FROM ESTADISTICAS E 
INNER JOIN JUGADORES J ON J.CODIGO=E.JUGADOR
WHERE J.NOMBRE='PAU GASOL';

SELECT E.PUNTOS_POR_PARTIDO, J.NOMBRE
FROM ESTADISTICAS E 
INNER JOIN JUGADORES J ON J.CODIGO=E.JUGADOR
WHERE J.NOMBRE='PAU GASOL' AND E.TEMPORADA='04/05';

SELECT E.PUNTOS_POR_PARTIDO, J.NOMBRE,J.CODIGO
FROM ESTADISTICAS E 
LEFT JOIN JUGADORES J ON J.CODIGO=E.JUGADOR;

SELECT NOMBRE_EQUIPO, COUNT(*) AS 'CANTIDAD DE JUGADORES'
FROM JUGADORES
GROUP BY NOMBRE_EQUIPO;

SELECT J.NOMBRE, SUM(E.PUNTOS_POR_PARTIDO) AS TOTAL_PUNTOS
FROM JUGADORES J 
JOIN ESTADISTICAS E ON J.CODIGO=E.JUGADOR
GROUP BY J.NOMBRE
ORDER BY TOTAL_PUNTOS DESC
LIMIT 1;

SELECT E.NOMBRE, E.DIVISION, E.CONFERENCIA, J.NOMBRE, J.ALTURA
FROM EQUIPOS E 
LEFT JOIN JUGADORES J ON E.NOMBRE=J.NOMBRE_EQUIPO
ORDER BY J.ALTURA DESC LIMIT 1;

SELECT EQUIPO_LOCAL, EQUIPO_VISITANTE,ABS(PUNTOS_LOCAL - PUNTOS_VISITANTE) AS 'DIFERENCIA'
FROM PARTIDOS
ORDER BY DIFERENCIA DESC
LIMIT 3;

SELECT CODIGO, EQUIPO_LOCAL,PUNTOS_LOCAL,EQUIPO_VISITANTE,PUNTOS_VISITANTE,
	CASE 
		WHEN PUNTOS_LOCAL > PUNTOS_VISITANTE THEN EQUIPO_LOCAL
        WHEN PUNTOS_LOCAL < PUNTOS_VISITANTE THEN EQUIPO_VISITANTE
	END AS EQUIPO_GANADOR
FROM PARTIDOS;


