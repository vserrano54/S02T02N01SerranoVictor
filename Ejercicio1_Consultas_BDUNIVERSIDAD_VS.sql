USE universidad;

/*
1.Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. 
El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, 
segundo apellido y nombre.
*/
SELECT apellido1 'Primer Apellido',apellido2 'Segundo Apellido',nombre 'Nombre',tipo 'Tipo'
FROM persona
WHERE TIPO = 'alumno'
ORDER BY apellido1,apellido2,nombre;

SELECT apellido1 'Primer Apellido',apellido2 'Segundo Apellido',nombre 'Nombre',tipo 'Tipo'
FROM persona
WHERE TIPO = 2
ORDER BY apellido1,apellido2,nombre;

/*
2.Halla el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono 
en la base de datos.
*/
SELECT nombre 'Nombre', apellido1 'Primer Apellido',apellido2 'Segundo Apellido'
FROM persona
WHERE TIPO = 2 AND telefono IS NULL;

/*
3.Devuelve el listado de los alumnos que nacieron en 1999.
*/
SELECT *
FROM persona
WHERE TIPO = 2 AND YEAR(fecha_nacimiento)=1999;

/*
4.Devuelve el listado de profesores/as que no han dado de alta su número de teléfono 
en la base de datos y además su NIF termina en K.
*/
SELECT *
FROM persona
WHERE TIPO = 1 AND telefono IS NULL AND RIGHT(nif, 1) = 'K';

/*
5.Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre,
 en el tercer curso del grado que tiene el identificador 7.
*/
SELECT nombre as Asisgnatura
FROM asignatura
WHERE cuatrimestre = 1 and curso = 3 and id_grado = 7;

/*
6.Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados.
 El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre 
 del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.
*/
SELECT per.apellido1 'Primer Apellido', per.apellido2 'Segundo Apellido', per.nombre 'Nombre', dep.nombre 'Departamento'
FROM persona per
INNER JOIN profesor pro on per.id = pro.id_profesor
INNER JOIN departamento dep on pro.id_departamento = dep.id
order by per.apellido1, per.apellido2, per.nombre;

/*
7.Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar
 del alumno/a con NIF 26902806M.
*/

SELECT a.nombre Asignatura,c.anyo_inicio 'Año de Inicio', c.anyo_fin 'Año de Finalización'
FROM PERSONA per
INNER JOIN alumno_se_matricula_asignatura mat on per.id = mat.id_alumno
INNER JOIN asignatura a on mat.id_asignatura = a.id
INNER JOIN curso_escolar c on mat.id_curso_escolar = c.id
WHERE per.nif = '26902806M';

/*
8.Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que 
imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
*/
SELECT dep.nombre Departamento, a.nombre Asignatura, concat(p.nombre,' ', p.apellido1, ' ', p.apellido2 ) AS Profesor
FROM asignatura a
INNER JOIN profesor pro ON a.id_profesor = pro.id_profesor
INNER JOIN departamento dep ON pro.id_departamento = dep.id
INNER JOIN grado g on a.id_grado = g.id
INNER JOIN persona p on pro.id_profesor = p.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

SELECT distinct dep.nombre Departamento
FROM asignatura a
INNER JOIN profesor pro ON a.id_profesor = pro.id_profesor
INNER JOIN departamento dep ON pro.id_departamento = dep.id
INNER JOIN grado g on a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

/*
9.Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura
 durante el curso escolar 2018/2019.
*/

SELECT  DISTINCT per.nombre 'Nombre', per.apellido1 'Primer Apellido', per.apellido2 'Segundo Apellido', per.tipo  'Tipo'/* ,a.nombre*/
FROM PERSONA per
INNER JOIN alumno_se_matricula_asignatura mat ON per.id = mat.id_alumno
/*INNER JOIN asignatura a ON mat.id_asignatura = a.id*/
INNER JOIN curso_escolar c ON mat.id_curso_escolar = c.id
WHERE c.anyo_inicio = 2018  AND  c.anyo_fin = 2019;

/*
Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
*/

/*
1.Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados.
 El listado también debe mostrar aquellos profesores/as que no tienen ningún departamento asociado.
 El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, 
 segundo apellido y nombre del profesor/a. El resultado estará ordenado alfabéticamente
 de menor a mayor por el nombre del departamento, apellidos y nombre.
*/

SELECT dep.nombre 'Departamento', per.apellido1 'Primer Apellido', per.apellido2 'Segundo Apellido', per.nombre 'Nombre'
FROM persona per
LEFT JOIN profesor pro on per.id = pro.id_profesor
LEFT JOIN departamento dep on pro.id_departamento = dep.id
order by per.apellido1, per.apellido2, per.nombre;

/*
2. Devuelve un listado con los profesores/as que no están asociados a un departamento.
*/
SELECT per.apellido1 'Primer Apellido', per.apellido2 'Segundo Apellido', per.nombre 'Nombre' /*, dep.nombre 'Departamento' */
FROM persona per
LEFT JOIN profesor pro on per.id = pro.id_profesor
LEFT JOIN departamento dep on pro.id_departamento = dep.id
WHERE dep.nombre is null
order by per.apellido1, per.apellido2, per.nombre;

/*
3.Devuelve un listado con los departamentos que no tienen profesores asociados.
*/
SELECT dep.nombre 'Departamento'
FROM persona per
RIGHT JOIN profesor pro on per.id = pro.id_profesor
RIGHT JOIN departamento dep on pro.id_departamento = dep.id
WHERE per.nombre is null
order by per.apellido1, per.apellido2, per.nombre;

/*
4.Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
*/
SELECT  per.nombre Nombre,per.apellido1 'Primer Apellido',per.apellido2 'Segundo Apellido' /*, a.nombre Asignatura */
FROM asignatura a
RIGHT JOIN profesor pro ON a.id_profesor = pro.id_profesor
RIGHT JOIN persona per ON pro.id_profesor = per.id
WHERE a.nombre is null;
/*
5.Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
*/
SELECT  a.nombre Asignatura /*,per.nombre Nombre,per.apellido1 'Primer Apellido',per.apellido2 'Segundo Apellido' */
FROM asignatura a
LEFT JOIN profesor pro ON a.id_profesor = pro.id_profesor
LEFT JOIN persona per ON pro.id_profesor = per.id
WHERE per.nombre is null;

/*
6.Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
*/
SELECT DISTINCT dep.nombre Departamento /*, a.nombre, m.id_curso_escolar, ce.anyo_inicio, ce.anyo_inicio */
FROM departamento dep
LEFT JOIN profesor pro ON dep.id = pro.id_departamento
LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor
LEFT JOIN alumno_se_matricula_asignatura m ON a.id = m.id_asignatura
LEFT JOIN curso_escolar ce ON m.id_curso_escolar = ce.id
WHERE a.nombre IS NULL;

/*
Consultas resumen:
*/

/*
1.Devuelve el número total de alumnos existentes.
*/
SELECT COUNT(p.id) AS 'Alumnos Existentes'
FROM PERSONA p
WHERE p.tipo = 'Alumno';

/*
2.Calcula cuántos alumnos nacieron en 1999.
*/
SELECT COUNT(p.id) AS 'Alumnos Nacidos en 1999'
FROM persona p
WHERE p.TIPO = 2 AND YEAR(p.fecha_nacimiento)=1999;

/*
3.Calcula cuántos profesores/as hay en cada departamento. El resultado sólo debe mostrar dos columnas, 
una con el nombre del departamento y otra con el número de profesores/as que hay en ese departamento.
 El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y tendrá que estar 
 ordenado de mayor a menor por el número de profesores/as.
*/
SELECT  dep.nombre Departamento, COUNT(pro.id_profesor) 'Cantidad de Profesores por Departamento'
FROM persona per
INNER JOIN profesor pro ON per.id = pro.id_profesor
INNER JOIN departamento dep ON pro.id_departamento = dep.id
GROUP BY dep.nombre
ORDER BY COUNT(pro.id_profesor) DESC;

/*
4. Devuelve un listado con todos los departamentos y el número de profesores/as que hay 
en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen
 profesores asociados. Estos departamentos también deben aparecer en el listado.
*/
SELECT  dep.nombre Nombre, COUNT(pro.id_profesor) 'Cantidad de Profesores por Departamento'
FROM persona per
RIGHT JOIN profesor pro ON per.id = pro.id_profesor
RIGHT JOIN departamento dep ON pro.id_departamento = dep.id
GROUP BY dep.nombre
ORDER BY COUNT(pro.id_profesor) DESC;

/*
5.Devuelve un listado con el nombre de todos los grados existentes en la base de datos y 
el número de asignaturas que tiene cada uno. Ten en cuenta que pueden existir grados que
carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado.
 El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
*/
SELECT g.nombre Grado, COUNT(a.nombre) 'Cantidad de Asignatura'
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
ORDER BY COUNT(a.nombre) DESC;

/*
6.Devuelve un listado con el nombre de todos los grados existentes en la base de datos y 
el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
*/
SELECT g.nombre Grado, COUNT(a.nombre) 'Cantidad de Asignatura Mayor a 40'
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING COUNT(a.id) > 40;

/*
7.Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos 
existentes para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, 
tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.
*/
SELECT g.nombre Grado, a.tipo 'Tipo de Asignatura', SUM(a.creditos) Creditos
FROM grado g
INNER JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo
ORDER BY COUNT(a.creditos)  DESC;

/*
8.Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura 
en cada uno de los cursos escolares. El resultado tendrá que mostrar dos columnas, 
una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
*/
SELECT c.anyo_inicio 'Año Inicio del Curso Escolar', COUNT(mat.id_alumno) AS 'Cantidad de Alumno'
FROM alumno_se_matricula_asignatura mat
INNER JOIN curso_escolar c ON mat.id_curso_escolar = c.id
GROUP BY c.anyo_inicio;

/*
9.Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado debe tener
 en cuenta a aquellos profesores/as que no imparten ninguna asignatura. El resultado mostrará 
 cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas.
 El resultado estará ordenado de mayor a menor por el número de asignaturas.
*/
SELECT per.id, per.nombre Nombre, per.apellido1 'Primer Apellido', per.apellido2 'Segundo Apellido',COUNT(a.nombre) 'Cantidad de Asignaturas que Imparte'
FROM persona per
LEFT JOIN profesor pro ON per.id = pro.id_profesor
LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor
GROUP BY per.id
ORDER BY COUNT(a.nombre) DESC;

/*
10.Devuelve todos los datos del alumno/a más joven.
*/
SELECT *
FROM persona p
WHERE p.fecha_nacimiento = (SELECT MIN(p2.fecha_nacimiento) FROM persona p2 where p2.tipo = 'Alumno')
AND p.tipo = 'Alumno';

/*
11. Devuelve un listado con los profesores/as que tienen un departamento asociado y 
que no imparten ninguna asignatura.
*/
SELECT per.nombre 'Nombre', per.apellido1 'Primer Apellido', per.apellido2 'Segundo Apellido', dep.nombre 'Departamento'  /*,per.tipo, a.nombre 'Asignatura' */
FROM persona per
INNER JOIN profesor pro ON per.id = pro.id_profesor
INNER JOIN departamento dep ON pro.id_departamento = dep.id
LEFT JOIN asignatura a on pro.id_profesor = a.id_profesor
WHERE a.id is NULL;