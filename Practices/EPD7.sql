/*EPD 7*/

SELECT COUNTRY_NAME FROM HR.COUNTRIES A, HR.REGIONS B 
WHERE a.region_id= b.region_id AND REGION_NAME='Americas';

SELECT * FROM HR.locations NATURAL JOIN HR.countries;
select * from HR.locations, HR.countries
where locations.country_id = countries.country_id;

select * from HR.jobs natural join HR.countries;
select * from HR.jobs, HR.countries;

select * from hr.locations join hr.countries using (country_id);
select * from hr.locations, hr.countries
where locations.country_id = countries.country_id;

select * from hr.jobs join hr.countries c using (c.region_id); --ERROR PORQUE NO ESTAN EN LAS DOS COLUMNAS

select * from HR.departments d
join HR.employees e on (e.employee_id=d.department_id);
select * from hr.employees e, hr.departments d
where e.employee_id=d.department_id;

select * from hr.employees e, hr.departments d
where e.department_id=d.department_id;
select e.employee_id, e.department_id, d.department_id, d.department_name
from hr.departments d left outer join hr.employees e on (d.DEPARTMENT_ID=e.DEPARTMENT_ID);
select e.employee_id, e.department_id, d.department_id, d.department_name
from hr.departments d right outer join hr.employees e on (d.DEPARTMENT_ID=e.DEPARTMENT_ID);
select e.employee_id, e.department_id, d.department_id, d.department_name
from hr.departments d full outer join hr.employees e on (d.DEPARTMENT_ID=e.DEPARTMENT_ID);

select * from hr.jobs cross join hr.ob_history;
select * from hr.jobs j cross join hr.job_history jh
where j.job_id='AD_PRES';

/*E1. Obtenga el nombre de aquellas regiones que contengan países cuyo nombre empiece por ‘E’.*/

SELECT REGION_NAME,country_name FROM HR.countries C,HR.regions R WHERE country_name LIKE 'E%' AND c.region_id=r.region_id;

/*E2. Lleve a cabo un NATURAL JOIN entre las tablas EMPLOYEES y JOB_HISTORY, mostrando los campos EMPLOYEE_ID,
JOB_ID, DEPARTMENT_ID, LAST_NAME, HIRE_DATE y END_DATE. Analice el resultado y comprenda exactamente qué tipo de
información ha sido devuelta. Posteriormente, implemente la misma consulta utilizando la notación actual.*/

SELECT employee_id, job_id, department_id, E.last_name, E.hire_date, JH.end_date FROM HR.job_history JH NATURAL JOIN HR.employees E;

SELECT e.employee_id, e.job_id, e.department_id, E.last_name, E.hire_date, JH.end_date FROM HR.job_history JH, HR.employees E
WHERE jh.department_id = e.department_id AND jh.employee_id = e.employee_id AND jh.job_id = e.job_id;

/*E3. Implemente la anterior consulta pero utilizando JOIN USING y sólo estableciendo como columnas comunes JOB_ID y
EMPLOYEE_ID.*/

SELECT employee_id, job_id, e.department_id, E.last_name, E.hire_date, JH.end_date FROM HR.job_history JH join HR.employees E
using (employee_id, job_id);

/*E4. Utilizando JOIN USING, establezca un join entre tablas que no tengan en común ninguna columna, como por ejemplo JOBS y
COUNTRIES ¿Cúal es el resultado? ¿Y si lo hacemos con NATURAL JOIN?*/

SELECT * FROM HR.jobs JOIN HR.countries USING ;--error
SELECT * FROM HR.jobs NATURAL JOIN HR.countries;


/*E5. La tabla DEPARTMENTES tiene una columna, MANAGER_ID, la cual es FK de la columna EMPLOYEE_ID en la tabla
EMPLOYEES. Dicha columna identifica al jefe de cada departamento. Construya una consulta que devuelva una sola columna con
el alias Managers. Dicha columna tendrá el siguiente formato: FIRST_NAME LAST_NAME is manager of the
DEPARTMENT_NAME department. Implemente la consulta con la cláusula JOIN ON y también utilizando la notación actual.*/

SELECT  first_name ||' ' || LAST_NAME || 'is manager of the ' || department_name || ' department' AS Managers 
FROM HR.departments D, HR.employees e WHERE e.department_id = d.MANAGER_id;


