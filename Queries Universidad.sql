-- IT Academy C1_S2_Queries_Universidad
-- Author Miquel Debon Villagrasa

-- TABLE Universidad

USE universidad;

-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. 
	-- El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre 
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;

-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3. Retorna el llistat dels alumnes que van néixer en 1999.
SELECT *
FROM persona
WHERE tipo = 'alumno' AND fecha_nacimiento LIKE "%1999%"; 
	-- WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN "1999-01-01" AND "1999-12-29";

-- 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT *
FROM persona
WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE "%K";

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT *
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. 
	-- El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. 
    -- El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre
FROM persona p
JOIN profesor pro ON p.id = pro.id_profesor
JOIN departamento d ON pro.id_departamento = d.id
WHERE p.tipo = 'profesor'
ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT a.nombre, c.anyo_inicio, c.anyo_fin
FROM asignatura a
JOIN alumno_se_matricula_asignatura am ON a.id = am.id_asignatura
JOIN persona p ON p.id = am.id_alumno
JOIN curso_escolar c ON am.id_curso_escolar = c.id
WHERE p.nif = '26902806M';



-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre 
FROM departamento d
JOIN profesor p ON p.id_departamento = d.id
JOIN asignatura a ON a.id_profesor = p.id_profesor
JOIN grado ON a.id_grado = grado.id
WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';


-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.id as ID, p.nombre as Nombre , ce.anyo_inicio as Start , ce.anyo_fin as Fin
FROM persona p
JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno
JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id
WHERE tipo = 'alumno' and ce.anyo_inicio LIKE "%2018%";

-- 

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

--

-- 1. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. 
	-- El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. 
	-- El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. 
    -- El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre
FROM profesor pro
LEFT JOIN persona p ON p.id = pro.id_profesor
LEFT JOIN departamento d ON pro.id_departamento = d.id
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

SELECT d.nombre, p.apellido1, p.apellido2, p.nombre
FROM persona p
JOIN profesor pro ON p.id = pro.id_profesor
LEFT JOIN departamento d ON pro.id_departamento = d.id
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 2. Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT d.nombre AS DepartmentName, p.apellido1, p.apellido2, p.nombre
FROM departamento d
LEFT JOIN profesor pro ON pro.id_departamento = d.id
RIGHT JOIN persona p ON p.id = pro.id_profesor
WHERE d.nombre is NULL
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 3. Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT d.nombre
FROM departamento d
LEFT JOIN profesor pro ON pro.id_departamento = d.id
WHERE pro.id_departamento is NULL;

-- 4. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT p.*, asi.nombre AS Asignatura
FROM profesor pro
LEFT JOIN asignatura asi ON asi.id_profesor = pro.id_profesor
LEFT JOIN persona p ON p.id = pro.id_profesor
WHERE asi.id_profesor is null;

-- 5. Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT *
FROM asignatura
WHERE id_profesor is NULL;

-- 6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT DISTINCT d.id, d.nombre, ce.id
FROM departamento d
LEFT JOIN profesor pro ON (d.id = pro.id_departamento)
LEFT JOIN asignatura asi ON (pro.id_profesor = asi.id)
LEFT JOIN alumno_se_matricula_asignatura almatr ON (asi.id = almatr.id_asignatura)
LEFT JOIN curso_escolar ce ON (almatr.id_curso_escolar = ce.id)
WHERE ce.id is null;

SELECT DISTINCT d.id, d.nombre
FROM departamento d
LEFT JOIN profesor pro ON (d.id = pro.id_departamento)
LEFT JOIN asignatura asi ON (pro.id_profesor = asi.id)
LEFT JOIN alumno_se_matricula_asignatura almatr ON (asi.id = almatr.id_asignatura)
WHERE almatr.id_curso_escolar is null;


--

-- Consultes resum:

--

-- 1. Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(persona.id) AS "Total alumnos"
FROM persona
WHERE persona.tipo = "alumno";

-- 2. Calcula quants alumnes van néixer en 1999.
SELECT COUNT(persona.id) AS "Alumnos 1999"
FROM persona
WHERE persona.tipo = "alumno" and persona.fecha_nacimiento LIKE "%1999%";

-- 3. Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, 
	-- una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. 
    -- El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT d.*, COUNT(pro.id_profesor) AS "Count Profesors"
FROM departamento d
INNER JOIN profesor pro ON d.id = pro.id_departamento
GROUP BY d.id;

-- 4. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. 
	-- Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.*, COUNT(pro.id_profesor) AS "Count Profesors"
FROM departamento d
LEFT JOIN profesor pro ON d.id = pro.id_departamento
GROUP BY d.id;
    

-- 5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. 
	-- Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. 
	-- El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.*, COUNT(asi.id) as "Total asignatures"
FROM grado g
LEFT JOIN asignatura asi ON g.id = asi.id_grado
GROUP BY g.id
ORDER BY COUNT(asi.id) DESC;

-- 6. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.*, COUNT(asi.id) as "Total asignatures"
FROM grado g
LEFT JOIN asignatura asi ON g.id = asi.id_grado
GROUP BY g.id
HAVING COUNT(asi.id) > 40;

-- 7. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. 
	-- El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.nombre, asi.tipo, SUM(asi.creditos)
FROM grado g
LEFT JOIN asignatura asi ON g.id = asi.id_grado
GROUP BY g.id, asi.tipo;

-- 8. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. 
	-- El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT ce.anyo_inicio, COUNT(DISTINCT(almtr.id_alumno))    
FROM curso_escolar ce
LEFT JOIN alumno_se_matricula_asignatura almtr ON ce.id = almtr.id_curso_escolar
GROUP BY ce.id;

-- 9. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura.
	-- El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT p.id, p.nombre, p.apellido1, p.apellido2 , COUNT(asi.id) AS "Total asignaturas"
FROM profesor pro
LEFT JOIN asignatura asi USING (id_profesor) 
LEFT JOIN persona p ON pro.id_profesor = p.id
GROUP BY pro.id_profesor
ORDER BY COUNT(asi.id) DESC;

-- 10. Retorna totes les dades de l'alumne/a més jove.
SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

-- 11. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT p.*, asi.id_profesor
FROM profesor pro
LEFT JOIN asignatura asi ON pro.id_profesor = asi.id_profesor
LEFT JOIN persona p ON pro.id_profesor = p.id
WHERE asi.id_profesor IS NULL;








