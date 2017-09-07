/*EPD 6*/

Select count(*) from hr.employees;
Select count(commission_pct) from hr.employees;
Select count(nvl(commission_pct,0)) from hr.employees;
Select count(distinct commission_pct) from hr.employees;
Select count(hire_date), count(manager_id) from hr.employees;

Select avg(2) from hr.employees; --Devuelve 2 (107 filas x 2)/107
Select avg(salary) from hr.employees; --Devuelve 6461.68224 
Select avg(distinct salary) from hr.employees; --Devuelve 6980.70175
Select avg(commission_pct) from hr.employees; --Devuelve 0.222857143

Select sum(2) from hr.employees; --Devuelve 214 (107 filas x 2)
Select sum(salary) from hr.employees; --Devuelve 691400 
Select sum(distinct salary) from hr.employees; --Devuelve 397900 
Select sum(commission_pct) from hr.employees; --Devuelve 7.8

Select min(commission_pct), max(commission_pct) from hr.employees; --Devuelve 0.1 0.4 
Select min(start_date), max(END_DATE) from HR.job_history; --Devuelve 17-09-87 31-12-99
Select min(job_id), max(job_id) from hr.employees; --Devuelve AC_ACCOUNT ST_MAN

select avg(cant_ventas) from clientes;
select avg(cant_ventas) from clientes group by ciudad;
select nombre, ciudad, sum(cant_ventas) from clientes group by nombre, ciudad;

/*E1. Muestre en una misma consulta cu�ntos empleados, departamentos y categor�as de trabajadores diferentes hay almacenados
en la tabla EMPLOYEES.*/
SELECT COUNT (*),COUNT (DISTINCT NVL(DEPARTMENT_ID,0)),COUNT (DISTINCT JOB_ID) FROM HR.EMPLOYEES;

/*E2. Muestre el n�mero medio de a�os trabajados por los programadores (IT_PROG) de la empresa.*/
SELECT AVG(SYSDATE-HIRE_DATE+1)/365.25 FROM HR.EMPLOYEES WHERE JOB_ID LIKE 'IT_PROG';

/*E3. Calcule el total de d�as trabajados por todos los trabajadores.*/
SELECT SUM (SYSDATE-HIRE_DATE) FROM HR.EMPLOYEES;

/*E4. Obtenga para aquellos trabajadores pertenecientes a la categor�a SA_REP, la fecha de contrataci�n m�s antigua, el salario m�s
bajo cobrado, la fecha de contrataci�n m�s reciente y el salario m�s alto cobrado.*/
SELECT MIN(HIRE_DATE),MIN(SALARY),MAX(HIRE_DATE),MAX(SALARY) FROM HR.employees WHERE JOB_ID LIKE 'SA_REP';

/*E5. Obtenga el valor medio de las comisiones m�s altas que existen en los diferentes departamentos.*/
SELECT AVG(MAX(NVL(COMMISSION_PCT,0))) FROM HR.EMPLOYEES GROUP BY DEPARTMENT_ID;

/*E6. Corrija los errores de las siguientes consultas.*/
select end_date, count(*) from hr.job_history GROUP BY END_DATE;
select end_date, start_date, count(*) from hr.job_history group by end_date,START_DATE;

/*P1. A partir de la tabla COUNTRIES, calcular la media de longitud del nombre de los pa�ses (COUNTRY_NAME). La parte decimal
debe ser redondeada al entero m�s pr�ximo.*/
SELECT ROUND(AVG(LENGTH(COUNTRY_NAME))) FROM HR.COUNTRIES;

/*P2. Muestre cu�ntos trabajadores pertenecen a cada departamento almacenado en la tabla EMPLOYEES. Mu�strelos ordenados
por el identificador de departamento de forma ascendente.*/
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) FROM HR.EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID ;

/*P3. Muestre el n�mero de empleados que fueron despedidos agrupados por el a�o en que se marcharon de la empresa. El
resultado debe mostrarse ordenado de forma descendente en base al n�mero de empleados de cada grupo. Se deber� mostrar el
a�o, el JOB_ID y el n�mero de trabajadores despedidos.*/
SELECT COUNT(EMPLOYEE_ID), TO_CHAR(END_DATE,'YYYY'), JOB_ID FROM HR.JOB_HISTORY GROUP BY TO_CHAR(END_DATE,'YYYY'),JOB_ID ORDER BY 1 DESC;
SELECT TO_CHAR(END_DATE,'YYYY') FROM HR.job_history;

/*P4. Mostrar los d�as de la semana en los cuales 20 o m�s personas fueron contratados por la empresa.*/
SELECT TO_CHAR(HIRE_DATE,'Day'),COUNT(*) FROM HR.EMPLOYEES WHERE EMPLOYEE_ID>=20 GROUP BY TO_CHAR(HIRE_DATE,'Day') HAVING COUNT(*)>=20;

/*P5. Muestre el salario medio y el n�mero de empleados que corresponden a cada una de las categor�as de trabajo (JOB_ID). Tenga
en cuenta para los c�lculos s�lo a aquellos trabajadores que pertenezcan a una categor�a donde se gane m�s de 10000� de media.*/
SELECT AVG(SALARY), COUNT(*), JOB_ID FROM HR.EMPLOYEES GROUP BY JOB_ID HAVING AVG(SALARY)>10000;

