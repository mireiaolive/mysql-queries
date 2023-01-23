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
SELECT UPPER(nombre) AS `nombre` , `precio` FROM `producto`;

-- 7. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre) AS `nombre` , `precio` FROM `producto`;

-- 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.

