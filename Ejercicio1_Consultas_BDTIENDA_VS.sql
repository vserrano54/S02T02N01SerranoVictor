USE `tienda`;

/*
1.Llista el nom de tots els productes que hi ha en la taula producto.
*/
SELECT NOMBRE FROM PRODUCTO;

/*
2. Llista els noms i els preus de tots els productes de la taula producto.
*/
SELECT NOMBRE, PRECIO FROM PRODUCTO;

/*
3. Lista todas las columnas de la tabla producto.
*/
SELECT * FROM PRODUCTO;

/*
4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
*/
SELECT NOMBRE, PRECIO AS 'PRECIO EN EURO', PRECIO * 1.07 AS 'PRECIO EN DOLAR' 
FROM PRODUCTO;

/*
5.Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
Utiliza los siguientes sobrenombre para las columnas: nombre de producto, euros, dólares.
*/
SELECT NOMBRE AS 'NOMBRE DE PRODUCTO', PRECIO AS 'EUROS', PRECIO * 1.07 AS 'DOLARES' 
FROM PRODUCTO;
/*
6. Llista els noms i els preus de tots els productes de la taula producto, 
convertint els noms a majúscula.
*/
SELECT UPPER(NOMBRE) AS NOMBRE, PRECIO FROM PRODUCTO;

/*
7. Llista els noms i els preus de tots els productes de la taula producto,
 convertint els noms a minúscula.
*/
SELECT LOWER(NOMBRE) AS NOMBRE, PRECIO FROM PRODUCTO;

/*
8. Lista el nombre de todos los fabricantes en una columna, 
y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
*/
SELECT NOMBRE, 
		CONCAT(UCASE(SUBSTRING(NOMBRE, 1, 2)), SUBSTRING(NOMBRE, 3)) AS MYUSCULA_PRIMERAS2_LETRA 
FROM FABRICANTE;

/*
9. Llista els noms i els preus de tots els productes de la taula producto, 
arrodonint el valor del preu.
*/
SELECT NOMBRE, ROUND(PRECIO,1) AS PRECIO FROM PRODUCTO;

/*
10.Lista los nombres y precios de todos los productos de la tabla producto, 
truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
*/
SELECT NOMBRE, TRUNCATE(PRECIO,0) AS 'PRECIO SIN DECIMAL' FROM PRODUCTO;

/*
11. Lista el código de los fabricantes que tienen productos en la tabla producto.
*/
SELECT  P.CODIGO_FABRICANTE
FROM FABRICANTE f
INNER JOIN PRODUCTO p on p.CODIGO_FABRICANTE = F.CODIGO;

/*
12.Llista el codi dels fabricants que tenen productes en la tabla producto,
 eliminant els codis que apareixen repetits.
*/
SELECT DISTINCT P.CODIGO_FABRICANTE
FROM FABRICANTE f
INNER JOIN PRODUCTO p on p.CODIGO_FABRICANTE = F.CODIGO;

/*
13.Lista los nombres de los fabricantes ordenados de forma ascendente.
*/
SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE ASC;

/*
14. Lista los nombres de los fabricantes ordenados de forma descendente
*/
SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE DESC;

/*
15.Lista los nombres de los productos ordenados, en primer lugar, 
por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
*/
SELECT NOMBRE,PRECIO
FROM PRODUCTO
ORDER BY NOMBRE ASC, PRECIO DESC;

/*
16. Retorna una llista amb les 5 primeres files de la taula fabricante.
*/
SELECT NOMBRE FROM FABRICANTE order by CODIGO LIMIT 0,5;

/*
17.Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante.
 La cuarta fila también debe incluirse en la respuesta.
*/
SELECT *
FROM FABRICANTE
ORDER BY CODIGO ASC
LIMIT 2 OFFSET 3;

/*
18.Lista el nombre y precio del producto más barato.
 (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MIN(precio),
 necesitaría GROUP BY.
*/
SELECT NOMBRE,PRECIO
FROM PRODUCTO
ORDER BY PRECIO ASC LIMIT 1;

/*
19.Lista el nombre y precio del producto más caro. (Utiliza solo las cláusulas ORDER BY y LIMIT).
 NOTA : Aquí no podría usar MAX(precio), necesitaría GROUP BY.
*/
SELECT NOMBRE,PRECIO
FROM PRODUCTO
ORDER BY PRECIO DESC LIMIT 1;

/*
20.Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
*/
SELECT p.NOMBRE
FROM PRODUCTO p
INNER JOIN FABRICANTE f
WHERE f.CODIGO = 2;

/*
21.Devuelve una lista con el nombre del producto, precio y nombre de fabricante 
de todos los productos de la base de datos.
*/
SELECT p.NOMBRE PRODUCTO, p.PRECIO, f.NOMBRE FABRICANTE FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO;

/*
22.Devuelve una lista con el nombre del producto, precio y nombre de fabricante 
de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante,
 por orden alfabético.
*/
SELECT p.NOMBRE PRODUCTO, p.PRECIO, f.NOMBRE FABRICANTE FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
ORDER BY f.NOMBRE ASC;

/*
24.Devuelve una lista con el código del producto, nombre del producto, 
código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
*/
SELECT P.CODIGO 'COD PRODUCTO', p.NOMBRE PRODUCTO, f.CODIGO 'COD FABRICANTE', f.NOMBRE FABRICANTE FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
ORDER BY P.CODIGO ASC;

/*
25.Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
*/
SELECT p.NOMBRE PRODUCTO, MAX(p.PRECIO), f.NOMBRE FABRICANTE FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO;

SELECT p.NOMBRE PRODUCTO, p.PRECIO, f.NOMBRE FABRICANTE FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
ORDER BY p.precio DESC LIMIT 1;

/*
26.Devuelve una lista de todos los productos del fabricante Lenovo.
*/
SELECT p.NOMBRE PRODUCTO, p.PRECIO FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
WHERE f.NOMBRE = 'Lenovo';

/*
27.Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio
 mayor que 200€.
*/
SELECT p.NOMBRE PRODUCTO, p.PRECIO FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
WHERE f.NOMBRE = 'Crucial' AND p.PRECIO > 200;
/*
28.Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. 
Sense utilitzar l'operador IN.
*/
SELECT p.NOMBRE PRODUCTO, p.PRECIO FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
WHERE f.NOMBRE = 'Asus' OR f.NOMBRE = 'Hewlett-Packard' OR f.NOMBRE = 'Seagate';

/*
29.Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate.
 Utilizando el operador IN.
*/
SELECT p.NOMBRE PRODUCTO, p.PRECIO FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
WHERE f.NOMBRE IN('Asus', 'Hewlett-Packard','Seagate');


/*
30.Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes 
cuyo nombre acabe por la vocal e.
*/
SELECT p.NOMBRE PRODUCTO, p.PRECIO, f.NOMBRE Fabricante FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
WHERE f.NOMBRE LIKE '%e';

/*
31.Devuelve un listado con el nombre y precio de todos los productos cuyo nombre de fabricante contenga 
el carácter w en su nombre.
*/
SELECT p.NOMBRE PRODUCTO, p.PRECIO, f.NOMBRE Fabricante FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
WHERE f.NOMBRE LIKE '%w%';

/*
32.Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos 
que tengan un precio mayor o igual a 180€. Ordena el resultado, en primer lugar, por el precio 
(en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
*/
SELECT p.NOMBRE PRODUCTO, p.PRECIO, f.NOMBRE Fabricante FROM
PRODUCTO p
INNER JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
WHERE p.PRECIO>=180
ORDER BY p.PRECIO DESC, p.NOMBRE ASC;

/*
33.Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que 
tienen productos asociados en la base de datos.
*/
SELECT DISTINCT f.CODIGO, f.NOMBRE Fabricante FROM
PRODUCTO p
JOIN FABRICANTE f ON p.CODIGO_FABRICANTE = f.CODIGO
ORDER BY f.CODIGO;
/*
34.Devuelve un listado de todos los fabricantes que existen en la base de datos, 
junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también 
a aquellos fabricantes que no tienen productos asociados.
*/
SELECT f.NOMBRE Fabricante, P.CODIGO Cod_Producto, p.NOMBRE Producto
FROM FABRICANTE f
LEFT JOIN PRODUCTO p ON f.CODIGO = p.CODIGO_FABRICANTE
ORDER BY p.CODIGO;

/*
35.Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen 
ningún producto asociado.
*/
SELECT f.CODIGO, f.NOMBRE
FROM FABRICANTE f
LEFT JOIN PRODUCTO p ON f.CODIGO = p.CODIGO_FABRICANTE
WHERE p.CODIGO_FABRICANTE IS NULL;

/*
36.Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
*/
SELECT p.CODIGO, p.NOMBRE PRODUCTO, p.PRECIO
FROM PRODUCTO p
WHERE p.CODIGO_FABRICANTE = 
		(SELECT f.CODIGO FROM FABRICANTE f WHERE f.NOMBRE = 'Lenovo');
        
/*
37.Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro 
del fabricante Lenovo. (Sin usar INNER JOIN)
*/
SELECT p.CODIGO, p.NOMBRE PRODUCTO, p.PRECIO
FROM PRODUCTO p
WHERE p.PRECIO =
	(SELECT MAX(p2.PRECIO) 
    FROM PRODUCTO p2
    WHERE p2.CODIGO_FABRICANTE = 
		(SELECT f.CODIGO FROM FABRICANTE f WHERE f.NOMBRE = 'Lenovo')
	) AND (p.CODIGO_FABRICANTE <> (SELECT f.CODIGO FROM FABRICANTE f WHERE f.NOMBRE = 'Lenovo'));
        

/*
38.Lista el nombre del producto más caro del fabricante Lenovo.
*/
SELECT p.CODIGO, p.NOMBRE PRODUCTO, p.PRECIO
FROM PRODUCTO p
WHERE p.PRECIO =
	(SELECT MAX(p2.PRECIO) 
    FROM PRODUCTO p2
    WHERE p2.CODIGO_FABRICANTE = 
		(SELECT f.CODIGO FROM FABRICANTE f WHERE f.NOMBRE = 'Lenovo')
	) AND (p.CODIGO_FABRICANTE = (SELECT f.CODIGO FROM FABRICANTE f WHERE f.NOMBRE = 'Lenovo'));
    
/*
39.Lista el nombre del producto más barato del fabricante Hewlett-Packard.
*/
SELECT p.CODIGO, p.NOMBRE PRODUCTO, p.PRECIO
FROM PRODUCTO p
WHERE p.PRECIO =
	(SELECT MIN(p2.PRECIO) 
    FROM PRODUCTO p2
    WHERE p2.CODIGO_FABRICANTE = 
		(SELECT f.CODIGO FROM FABRICANTE f WHERE f.NOMBRE = 'Hewlett-Packard')
	) AND (p.CODIGO_FABRICANTE = (SELECT f.CODIGO FROM FABRICANTE f WHERE f.NOMBRE = 'Hewlett-Packard'));
    SELECT * FROM FABRICANTE;
/*
40.Devuelve todos los productos de la base de datos que tienen un precio mayor 
o igual al producto más caro del fabricante Lenovo.
*/
SELECT p.CODIGO, p.NOMBRE PRODUCTO, p.PRECIO
FROM PRODUCTO p
WHERE p.PRECIO >=
	(SELECT MAX(p2.PRECIO) 
    FROM PRODUCTO p2
    WHERE p2.CODIGO_FABRICANTE = 
		(SELECT f.CODIGO FROM FABRICANTE f WHERE f.NOMBRE = 'Lenovo')
	) AND (p.CODIGO_FABRICANTE <> (SELECT f.CODIGO FROM FABRICANTE f WHERE f.NOMBRE = 'Lenovo'));

/*
41.Lista todos los productos del fabricante Asus que tienen un precio superior 
al precio medio de todos sus productos.
*/
SELECT p.CODIGO, p.NOMBRE PRODUCTO, p.PRECIO
FROM PRODUCTO p
WHERE p.PRECIO >
	(SELECT AVG(p2.PRECIO)
    FROM PRODUCTO p2)
    AND p.CODIGO_FABRICANTE = (SELECT f.CODIGO FROM FABRICANTE f WHERE f.NOMBRE = 'Asus');