SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1 ASC;
SELECT apellido1, apellido2, nombre, telefono FROM persona WHERE telefono IS NULL ORDER BY apellido1 ASC;
SELECT nombre, apellido1, apellido2, fecha_nacimiento AS bday FROM persona WHERE YEAR(fecha_nacimiento)=1999;
SELECT apellido1, nombre, telefono, tipo FROM persona WHERE telefono IS NULL AND tipo='profesor';
SELECT  nombre, cuatrimestre, curso, id_grado FROM asignatura WHERE cuatrimestre=1 AND curso=3 AND id_grado=7; 
SELECT  p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento FROM persona p JOIN profesor prf ON prf.id_profesor=p.id JOIN departamento d ON d.id=prf.id_departamento WHERE tipo='profesor' ORDER BY apellido1 ASC; 
SELECT a.nombre AS asignatura, anyo_inicio, anyo_fin FROM persona p INNER JOIN alumno_se_matricula_asignatura al ON p.id=al.id_alumno INNER JOIN curso_escolar c ON c.id=al.id_curso_escolar INNER JOIN asignatura a ON a.id=al.id_asignatura WHERE p.nif='26902806M';
SELECT DISTINCT d.nombre AS departamento FROM departamento d INNER JOIN profesor p ON d.id=p.id_departamento INNER JOIN asignatura a INNER JOIN grado g ON g.id=a.id_grado WHERE g.nombre='Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.nombre AS alumno FROM persona p INNER JOIN alumno_se_matricula_asignatura aON p.id=a.id_alumno INNER JOIN curso_escolar c ON c.id=a.id_curso_escolar WHERE c.anyo_inicio=2018 AND c.anyo_fin=2019;
SELECT d.nombre AS departamento, p.nombre AS profesora, p.apellido1, p.apellido2 FROM persona p LEFT JOIN profesor pr ON p.id=pr.id_profesor LEFT JOIN departamento d ON d.id=pr.id_departamento ORDER BY d.nombre, apellido1, apellido2 ASC;
SELECT p.nombre AS profesoras, d.nombre AS departamento FROM persona p LEFT JOIN profesor pr ON p.id=pr.id_profesor LEFT JOIN departamento d ON d.id=pr.id_departamento WHERE p.tipo="profesor" AND d.nombre IS NULL;
SELECT p.nombre AS profesoras, d.nombre AS departamento FROM persona p RIGHT JOIN profesor pr ON p.id=pr.id_profesor RIGHT JOIN departamento d ON d.id=pr.id_departamento WHERE p.tipo="profesor" AND d.nombre IS NULL;
SELECT DISTINCT p.nombre AS profesoras, a.nombre AS asignatura FROM persona p LEFT JOIN profesor pr ON p.id=pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor=a.id_profesor WHERE p tipo="profesor" AND a.nombre IS NOT NULL;
SELECT DISTINCT p.nombre AS profesoras, a.nombre AS asignatura FROM persona p RIGHT JOIN profesor pr ON p.id=pr.id_profesor RIGHT JOIN asignatura a ON pr.id_profesor=a.id_profesor AND p.nombre IS NULL;
SELECT d.nombre AS departamento, c.anyo_inicio, c.anyo_fin FROM departamento d LEFT JOIN curso_escolar c ON c.id=d.id WHERE c.anyo_inicio IS NULL AND c.anyo_fin IS NULL;
SELECT COUNT(p.id) AS alumnos FROM persona p WHERE tipo = 'alumno';
SELECT COUNT(p.id) AS alumnos FROM persona p WHERE tipo='alumno' AND YEAR(fecha_nacimiento)=1999;
SELECT d.nombre AS departamento, COUNT(p.id) AS profesores FROM persona p JOIN profesor pr ON p.id=pr.id_profesor JOIN departamento d ON d.id=pr.id_departamento GROUP BY departamento ORDER BY profesores DESC;
SELECT d.nombre AS departamento, COUNT(p.id) AS profesores FROM persona p RIGHT JOIN profesor pr ON p.id=pr.id_profesor RIGHT JOIN departamento d ON d.id=pr.id_departamento GROUP BY departamento;
SELECT g.id, g.nombre AS grado, COUNT(a.id) AS asignatura FROM grado g LEFT JOIN asignatura a ON a.id_grado=g.id GROUP BY g.id ORDER BY asignatura DESC;
SELECT g.id, g.nombre AS grado, COUNT(a.id) AS asignatura FROM grado g LEFT JOIN asignatura a ON a.id_grado=g.id GROUP BY g.id HAVING COUNT(a.id) > 40;
SELECT g.nombre AS grado, a.tipo AS asignatura, SUM(a.creditos) AS creditos FROM grado g LEFT JOIN asignatura a ON a.id_grado=g.id GROUP BY g.nombre, a.tipo;
SELECT c.anyo_inicio, COUNT(al.id_alumno) AS matriculats FROM curso_escolar c JOIN alumno_se_matricula_asignatura al ON c.id=al.id_curso_escolar GROUP BY c.anyo_inicio; 
SELECT p.id, p.nombre AS nombre, p.apellido1, p.apellido2, a.nombre AS asignatura FROM persona p RIGHT JOIN profesor pr ON p.id=pr.id_profesor RIGHT JOIN asignatura a ON pr.id_profesor=a.id_profesor WHERE p.tipo="profesor" ORDER BY asignatura DESC;
SELECT * FROM persona WHERE tipo='alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT p.id, p.nombre AS profesor, d.nombre AS departamento, a.nombre AS asignatura FROM persona p JOIN profesor pr
ON id_profesor=p.id JOIN departamento d ON d.id=pr.id_departamento JOIN asignatura a ON pr.id_profesor=a.id_profesor WHERE p.tipo='profesor' AND a.id IS NULL;


