-- 1. Llista el nom de tots els productes que hi ha en la taula producto.
SELECT `nombre` FROM `producto`;

-- 2. Llista els noms i els preus de tots els productes de la taula producto.
SELECT `nombre`, `precio` FROM `producto`;

-- 3. Llista totes les columnes de la taula producto.
SELECT * FROM `producto`;

-- 4. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
-- AS command is used to rename a column or table with an alias.
SELECT `nombre`, `precio` AS `EUR`, round(precio * 0.9) AS `USD` FROM `producto`;

-- 5. Llista totes les columnes de la taula producto.



