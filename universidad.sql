
-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. 
-- El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre 
FROM persona 
ORDER BY apellido1 ASC;
    
-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT apellido1, apellido2, nombre, telefono 
FROM persona 
WHERE telefono IS NULL
ORDER BY apellido1 ASC;

-- 3. Retorna el llistat dels alumnes que van néixer en 1999.
SELECT nombre, apellido1, apellido2, fecha_nacimiento AS bday
FROM persona 
WHERE YEAR(fecha_nacimiento)=1999;
    
-- 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT apellido1, nombre, telefono, tipo
FROM persona 
WHERE telefono IS NULL
AND tipo='profesor';

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT  nombre, cuatrimestre, curso, id_grado
FROM asignatura 
WHERE cuatrimestre=1
AND curso=3
AND id_grado=7; 

-- 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. 
-- El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. 
-- El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT  p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento
FROM persona p
JOIN profesor prf
ON prf.id_profesor=p.id
JOIN departamento d
ON d.id=prf.id_departamento
WHERE tipo='profesor'
ORDER BY apellido1 ASC; 


-- 7. Retorna un llistat amb el nom de les assignatures, 
-- any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
-- tabla persona p
-- alumno_se_matricula_asignatura al
-- curso_escolar c
-- tabla asignatura a
SELECT a.nombre AS asignatura, anyo_inicio, anyo_fin 
FROM persona p
INNER JOIN alumno_se_matricula_asignatura al
ON p.id=al.id_alumno
INNER JOIN curso_escolar c
ON c.id=al.id_curso_escolar
INNER JOIN asignatura a
ON a.id=al.id_asignatura
WHERE p.nif='26902806M';

-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es 
-- que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
-- departamento d
-- profesor p
-- asignatura a
-- grado g
SELECT DISTINCT d.nombre AS departamento
FROM departamento d
INNER JOIN profesor p
ON d.id=p.id_departamento
INNER JOIN asignatura a
INNER JOIN grado g
ON g.id=a.id_grado
WHERE g.nombre='Grado en Ingeniería Informática (Plan 2015)';
    
-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura 
-- durant el curs escolar 2018/2019.
-- alumno_se_matricula_asignatura a
-- alumno al
-- curso_escolar c
SELECT DISTINCT p.nombre AS alumno
FROM persona p
INNER JOIN alumno_se_matricula_asignatura a
ON p.id=a.id_alumno
INNER JOIN curso_escolar c
ON c.id=a.id_curso_escolar
WHERE c.anyo_inicio=2018
AND c.anyo_fin=2019;

-- LEFT JOIN i RIGHT JOIN
-- 1. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. 
-- El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. 
-- El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. 
-- El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS departamento, p.nombre AS profesora, p.apellido1, p.apellido2
FROM persona p
LEFT JOIN profesor pr
ON p.id=pr.id_profesor
LEFT JOIN departamento d
ON d.id=pr.id_departamento
ORDER BY d.nombre, apellido1, apellido2 ASC;

-- 2. Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT p.nombre AS profesoras, d.nombre AS departamento
FROM persona p
LEFT JOIN profesor pr
ON p.id=pr.id_profesor
LEFT JOIN departamento d
ON d.id=pr.id_departamento
WHERE p.tipo="profesor"
AND d.nombre IS NULL;

-- 3. Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT p.nombre AS profesoras, d.nombre AS departamento
FROM persona p
RIGHT JOIN profesor pr
ON p.id=pr.id_profesor
RIGHT JOIN departamento d
ON d.id=pr.id_departamento
WHERE p.tipo="profesor"
AND d.nombre IS NULL;

-- 4. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT DISTINCT p.nombre AS profesoras, a.nombre AS asignatura
FROM persona p
LEFT JOIN profesor pr
ON p.id=pr.id_profesor
LEFT JOIN asignatura a
ON pr.id_profesor=a.id_profesor
WHERE p.tipo="profesor"
AND a.nombre IS NOT NULL;

-- 5. Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT DISTINCT p.nombre AS profesoras, a.nombre AS asignatura
FROM persona p
RIGHT JOIN profesor pr
ON p.id=pr.id_profesor
RIGHT JOIN asignatura a
ON pr.id_profesor=a.id_profesor
AND p.nombre IS NULL;

-- 6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT d.nombre AS departamento, c.anyo_inicio, c.anyo_fin
FROM departamento d
LEFT JOIN curso_escolar c
ON c.id=d.id
WHERE c.anyo_inicio IS NULL
AND c.anyo_fin IS NULL;

-- Consultes resum:
-- 1. Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(p.id) AS alumnos
FROM persona p
WHERE tipo = 'alumno';

-- 2. Calcula quants alumnes van néixer en 1999.
SELECT COUNT(p.id) AS alumnos
FROM persona p
WHERE tipo='alumno'
AND YEAR(fecha_nacimiento)=1999;

-- 3. Calcula quants professors/es hi ha en cada departament. 
-- El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. 
-- El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT d.nombre AS departamento, COUNT(p.id) AS profesores
FROM persona p
JOIN profesor pr
ON p.id=pr.id_profesor
JOIN departamento d
ON d.id=pr.id_departamento
GROUP BY d.nombre
ORDER BY profesores DESC;

-- 4. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. 
-- Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.

-- 5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. 
-- Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.

-- 6. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.

-- 7. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
-- 8. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
-- 9. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
-- 10. Retorna totes les dades de l'alumne/a més jove.
-- 12. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.

