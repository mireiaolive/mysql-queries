-- 1. Llista el nom de tots els productes que hi ha en la taula producto.
SELECT `nombre` FROM `producto`;

-- 2. Llista els noms i els preus de tots els productes de la taula producto.
SELECT `nombre`, `precio` FROM `producto`;

-- 3. Llista totes les columnes de la taula producto.
SELECT * FROM `producto`;

-- 4. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
-- AS command is used to rename a column or table with an alias.
SELECT `nombre`, `precio` AS `EUR`, ROUND(precio * 0.9) AS `USD` FROM `producto`;

-- 5. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). 
-- Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT `nombre` AS `nom de producto`, `precio` AS `euros`, round(precio * 0.9) AS `dòlars` FROM `producto`;

-- 6. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre) AS nombre , precio FROM producto;

-- 7. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre) AS nombre , precio FROM producto;

-- 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, SUBSTRING(nombre,1,2) AS dos FROM fabricante;

-- 9. Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT nombre , ROUND(precio) AS precio FROM producto;

-- 10.Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre , ROUND(precio) AS precio FROM producto;

-- 11.Llista el codi dels fabricants que tenen productes en la taula producto.
SELECT codigo_fabricante FROM producto;

-- 12. Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13. Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre, ROUND(precio) AS precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM fabricante LIMIT 0, 5;

-- 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. 
-- La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 3, 2;

-- 18. Llista el nom i el preu del producte més barat. 
-- (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 0, 1;

-- 19. Llista el nom i el preu del producte més car. 
-- (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 0, 1;

-- 20. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM fabricante WHERE codigo=2;

-- 21. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT p.nombre AS nombre, precio AS precio, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante;

-- 22. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. 
-- Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT p.nombre AS nombre, precio AS precio, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
ORDER BY fabricante ASC;

-- 24. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT p.nombre AS nombre, precio AS precio, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
ORDER BY precio ASC LIMIT 0, 1;

-- 25. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT p.nombre AS nombre, precio AS precio, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
ORDER BY precio DESC LIMIT 0, 1;

-- 26. Retorna una llista de tots els productes del fabricant Lenovo.
SELECT p.nombre AS nombre, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre='Lenovo';

-- 27. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT p.nombre AS nombre, precio AS precio, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre='Crucial'
AND precio > 200;

-- 28. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
SELECT p.nombre AS nombre, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre='Asus' 
OR f.nombre='Hewlett-Packard'
OR f.nombre='Seagate';

-- 29. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Fent servir l'operador IN.
SELECT p.nombre AS nombre, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT p.nombre AS nombre, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre LIKE '%e';

-- 31. Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT p.nombre AS nombre, precio AS precio, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre LIKE '%w%';

-- 32. Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. 
-- Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT p.nombre AS nombre, precio AS precio, f.nombre AS fabricante 
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE precio>=180 
ORDER BY precio DESC, f.nombre ASC;

-- 33. Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.