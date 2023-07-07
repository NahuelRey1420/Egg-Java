SELECT NOMBRE AS 'NOMBRE DE PRODUCTO' FROM PRODUCTO;

SELECT NOMBRE AS'NOMBRE PRODUCTO', PRECIO AS 'PRECIO' FROM PRODUCTO;

SELECT * FROM PRODUCTO;

SELECT NOMBRE AS'NOMBRE PRODUCTO', round(PRECIO) AS 'PRECIO PRODUCTO' 
FROM PRODUCTO;  

SELECT F.CODIGO,F.NOMBRE 
FROM FABRICANTE F 
INNER JOIN PRODUCTO P ON F.CODIGO=P.CODIGO_FABRICANTE;

SELECT DISTINCT F.CODIGO ,F.NOMBRE 
FROM FABRICANTE F 
INNER JOIN PRODUCTO P ON F.CODIGO=P.CODIGO_FABRICANTE;

SELECT NOMBRE, PRECIO 
FROM PRODUCTO 
ORDER BY NOMBRE ASC,PRECIO DESC;

SELECT * 
FROM FABRICANTE 
WHERE CODIGO < 6;

SELECT NOMBRE,PRECIO 
FROM PRODUCTO 
ORDER BY PRECIO ASC LIMIT 1;

SELECT NOMBRE,PRECIO 
FROM PRODUCTO 
ORDER BY PRECIO DESC LIMIT 1;

SELECT NOMBRE,PRECIO 
FROM PRODUCTO 
WHERE PRECIO <= 120;

SELECT NOMBRE, PRECIO 
FROM PRODUCTO 
WHERE PRECIO between '60' AND '200';

SELECT NOMBRE 
FROM PRODUCTO
WHERE CODIGO_FABRICANTE IN (1,3,5);

SELECT NOMBRE
FROM PRODUCTO
WHERE NOMBRE LIKE '%PORTATIL%';
/*multitabla*/
SELECT P.NOMBRE,P.CODIGO,P.CODIGO_FABRICANTE, F.NOMBRE
FROM producto P
INNER JOIN fabricante F;

SELECT P.NOMBRE, P.PRECIO, F.NOMBRE 
FROM PRODUCTO P 
INNER JOIN FABRICANTE F 
ORDER BY F.NOMBRE ASC;

SELECT P.NOMBRE,P.PRECIO,F.NOMBRE
FROM PRODUCTO P 
INNER JOIN FABRICANTE F 
ORDER BY P.PRECIO ASC
LIMIT 1;

SELECT P.NOMBRE, P.PRECIO 
FROM PRODUCTO P
INNER JOIN FABRICANTE F ON F.CODIGO=P.CODIGO_FABRICANTE
WHERE F.NOMBRE = 'LENOVO';

SELECT P.NOMBRE, P.PRECIO 
FROM PRODUCTO P
INNER JOIN FABRICANTE F ON F.CODIGO=P.CODIGO_FABRICANTE
WHERE F.NOMBRE = 'CRUCIAL' AND P.PRECIO >200;

SELECT P.NOMBRE, P.PRECIO 
FROM PRODUCTO P
INNER JOIN FABRICANTE F ON F.CODIGO=P.CODIGO_FABRICANTE
WHERE LOWER(F.NOMBRE) IN ('ASUS','HEWLETT-PACKARD');

SELECT P.NOMBRE, P.PRECIO,F.NOMBRE 
FROM PRODUCTO P
INNER JOIN FABRICANTE F ON F.CODIGO=P.CODIGO_FABRICANTE
WHERE P.PRECIO >= 180
ORDER BY P.PRECIO DESC, P.NOMBRE ASC;
/*LEFT JOIN - RIGHT JOIN*/
SELECT F.NOMBRE AS 'FABRICANTE',P.NOMBRE AS 'PRODUCTO'
FROM FABRICANTE F 
LEFT JOIN PRODUCTO P ON F.CODIGO=P.CODIGO_FABRICANTE;

SELECT F.NOMBRE AS 'FABRICANTE'
FROM FABRICANTE F 
LEFT JOIN PRODUCTO P ON F.CODIGO=P.CODIGO_FABRICANTE
WHERE P.CODIGO_FABRICANTE IS NULL;
/*Subconsultas (En la cláusula WHERE)
Con operadores básicos de comparación*/
SELECT F.NOMBRE AS 'FABRICANTE', P.NOMBRE AS 'PRODUCTO'
FROM FABRICANTE F 
RIGHT JOIN PRODUCTO P ON F.CODIGO=P.CODIGO_FABRICANTE
WHERE F.CODIGO IN(SELECT CODIGO 
				  FROM FABRICANTE 
                  WHERE NOMBRE ='LENOVO');

SELECT * 
FROM PRODUCTO 
WHERE PRECIO=(SELECT MAX(PRECIO) 
		      FROM PRODUCTO
              WHERE CODIGO_FABRICANTE=( SELECT CODIGO
									    FROM FABRICANTE
                                        WHERE NOMBRE = 'LENOVO'));
                                        
SELECT NOMBRE AS 'PRODUCTO'
FROM PRODUCTO 
WHERE PRECIO=(SELECT MAX(PRECIO) 
		      FROM PRODUCTO
              WHERE CODIGO_FABRICANTE=( SELECT CODIGO
									    FROM FABRICANTE
                                        WHERE NOMBRE = 'LENOVO'));
                                        
SELECT *
FROM PRODUCTO
WHERE CODIGO_FABRICANTE = (SELECT CODIGO 
						   FROM FABRICANTE 
						   WHERE NOMBRE = 'ASUS')
AND PRECIO > (SELECT AVG(PRECIO) 
				FROM PRODUCTO
                WHERE CODIGO_FABRICANTE=(SELECT CODIGO
										 FROM FABRICANTE
                                         WHERE NOMBRE='ASUS'));
  /*subconsultas con IN y NOT IN*/   
SELECT NOMBRE AS 'NOMBRE'
FROM FABRICANTE
WHERE CODIGO IN(SELECT DISTINCT CODIGO_FABRICANTE 
				FROM PRODUCTO);
SELECT NOMBRE AS 'NOMBRE'
FROM FABRICANTE
WHERE CODIGO NOT IN(SELECT DISTINCT CODIGO_FABRICANTE 
				FROM PRODUCTO);
                
SELECT NOMBRE AS 'FABRICANTE'
FROM FABRICANTE
WHERE CODIGO IN(SELECT CODIGO_FABRICANTE 
				FROM PRODUCTO
				GROUP BY CODIGO_FABRICANTE
				HAVING COUNT(*)=(SELECT COUNT(*) 
								 FROM PRODUCTO 
								 WHERE CODIGO_FABRICANTE =(SELECT CODIGO
														   FROM FABRICANTE
														   WHERE NOMBRE='LENOVO')));