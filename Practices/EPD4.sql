/*EPD 4*/

select lower(region_name) from HR.regions;

select upper(region_name) from hr.regions;

select initcap(region_name) from hr.regions;

select concat('Today is: ', SYSDATE) from dual;
select concat(region_name,concat(' ',region_id)) from HR.regions; /*concat solo permite 2 valores.*/

select length(SYSDATE) from dual; 
select length(1+2.14||' pi aproximado') from dual;

select lpad(SYSDATE,14,'*') from dual;
select rpad(SYSDATE,14,'$#') from dual;
select lpad(1000+200.55,14,'*') from dual;
select rpad(1000+200.55,14,'*') from dual;

select trim(trailing '*' from '**Hidden**') from dual;/*Devuelve **Hidden / por la derecha*/
select trim(leading '*' from '**Hidden**') from dual; /* por la izquierda */
select trim(both '*' from '**Hidden**') from dual; /*Devuelve Hidden */
select trim(both '*' from '**Hidden**a') from dual; /*Devuelve Hidden**a */

select instr(3+0.14,'4') from dual; /*Lo suma y da la posicion*/
select instr('3+0.14','4') from dual; /*Con comillas lo interpreta como una cadena*/
select instr ('UNIVERSIDAD PABLO DE OLAVIDE','A',12,2) from dual;

select substr(SYSDATE,4,2) from dual;

select replace('1#3#5#7#9','#','-­>') from dual; /*devuelve “1-­>3-­>5-­>7-­>9”*/

select round(16.916,1) from dual; /*resultado: 16.9*/
select round(16.916,2) from dual; /*resultado: 16.92*/
select round(16.91,-1) from dual;  /*resultado: 20 / El -1 redondea las unidades, -2 las decenas...*/
select round(16.91) from dual; /*resultado: 17 / redondea la parte entera*/

select trunc(16.916,1) from dual; /*resultado: 16.9*/
select trunc(16.916,2) from  dual; /*resultado: 16.91 */
select trunc(16.91,-1) from dual; /*resultado: 10*/
select trunc(16.91) from dual; /*resultado: 16 */

select mod(6,2) from dual; /*Da el resto de la division de los dos numeros*/
select mod(5,3) from dual; 
select mod(7,35) from dual; 
select mod(5.2,3) from dual;

select sysdate from dual;

select months_between('29-mar-2010','28-feb-2010') from dual;

select add_months('07-abr-2010',1) from dual;

select next_day(sysdate,'jueves') from dual;

select last_day('01-ene-2011') from dual;

/*E1. Reescriba la siguiente consulta de una forma más compacta para que devuelva los mismos resultados.*/
select first_name, last_name from HR.employees where LOWER(LAST_NAME) like '%ur%';

/*E2. Obtenga una lista de todos los valores de los atributos FIRST_NAME y LAST_NAME de la tabla EMPLOYEES cuyo
FIRST_NAME contenga la cadena “li”.*/
SELECT FIRST_NAME, LAST_NAME FROM HR.EMPLOYEES WHERE LOWER(first_name) LIKE '%li%';

/*E3.Obtenga a partir de la tabla EMPLOYEES aquellos trabajadores que pertenezcan al departamento identificado con el número
100 (DEPARTMENT_ID=100). La información será mostrada como “NOMBRE APELLIDOS gana SALARIO”, utilice para ello la
función CONCAT.*/
SELECT CONCAT(FIRST_NAME,CONCAT(' ',CONCAT(LAST_NAME,CONCAT(' gana ',SALARY)))) 
FROM HR.EMPLOYEES WHERE DEPARTMENT_ID=100;

/*E4. A partir de la tabla EMPLOYEES muestre una cadena que contenga la inicial del nombre, el símbolo de puntuación . y el
apellido de aquellos trabajadores cuyos dos caracteres iniciales del identificador de trabajo (JOB_ID) coincida con 'AD'. Así, por
ejemplo, si tenemos almacenado un trabador que cumpla la condición impuesta y cuyo FIRST_NAME='Luis' y
LAST_NAME='Pérez', se deberá mostrar 'L.Pérez'.*/
SELECT CONCAT(SUBSTR(FIRST_NAME,1,1),CONCAT('.',LAST_NAME)) FROM HR.EMPLOYEES WHERE UPPER(JOB_ID) LIKE 'AD%';

/*E5. Modifique la consulta realizada en el experimento E4 de forma que en el caso de existir un apellido compuesto se eliminen los
espacios en blanco existentes*/
SELECT CONCAT(SUBSTR(FIRST_NAME,1,1),CONCAT('.',REPLACE(LAST_NAME,' '))) /*TRIM NO SIRVE PORQUE ES A LOS LADOS*/
FROM HR.EMPLOYEES WHERE UPPER(JOB_ID) LIKE 'AD%';

/*E6. Supongamos que la empresa cuyos datos de trabajadores se encuentran almacenados en la tabla EMPLOYEES ha decidido
pagar la nómina de los trabajadores sin decimales, en doce mensualidades. Muestra los datos de los trabajadores (nombre y
apellido) y la cantidad no percibida anualmente de aquellos trabajadores que ganen anualmente menos de lo que figura en el
campo SALARY.*/
SELECT FIRST_NAME, LAST_NAME, MOD(SALARY,12) FROM HR.EMPLOYEES WHERE MOD(SALARY,12)>0;

/*P1. Por motivos de seguridad, se desea obtener una clave alfanumérica para cada trabajador. A partir de los datos almacenados en
la tabla EMPLOYEES, obtén una clave para cada trabajador conformado por los 4 primeros caracteres del nombre y los 4 primeros
caracteres del apellido.*/
SELECT FIRST_NAME, LAST_NAME, CONCAT(SUBSTR(FIRST_NAME,1,4),SUBSTR(LAST_NAME,1,4)) AS "CONTRASEÑA" FROM HR.EMPLOYEES;

/*P2. Obtener una lista con los datos de aquellos empleados cuyo contrato se realizó hace más de 8 años.*/
SELECT * FROM HR.employees WHERE ADD_MONTHS(HIRE_DATE,8*12)<SYSDATE;

/*P3. Obtener una lista con los datos EMPLOYEE_ID, LAST_NAME y HIRE_DATE de aquellos empleados que hayan trabajado más
de 100 meses entre la fecha en que fueron contratados y el 01-ene-2000 (vamos a suponer que no han sido despedidos).*/
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE FROM HR.EMPLOYEES WHERE MONTHS_BETWEEN('01-ENE-2000',HIRE_DATE)>100;

/*P4. Obtener una lista con los datos EMPLOYEE_ID, LAST_NAME y HIRE_DATE de aquellos trabajadores que han trabajado más
de 5 años en la empresa*/
SELECT EMPLOYEE_ID, LAST_NAME, hIRE_DATE FROM HR.EMPLOYEES WHERE MONTHS_BETWEEN(SYSDATE,HIRE_DATE)>5*12;









