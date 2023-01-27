
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
