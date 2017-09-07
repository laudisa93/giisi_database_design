/*EPD 5*/

select length(123456) from dual;
select length(SYSDATE) from dual;

select mod('11',2) from dual;
select mod('11,123',2) from dual;
select mod('11,123,456',2) from dual; --error: numero no valido

select add_months('24-ENE­09',1) from dual; -- Devolverá 24/FEB/09, formato DD-­?MON-­?YY 
select add_months('24\ENE/9',1) from dual; -- Devolverá 24/FEB/09, formato DD\MON/Y 
select add_months('24-ENER-09',1) from dual; -- Devolverá el error ORA-­?1841 puesto que JANA no es un mes válido

select to_char(10,'0999') from dual; -- Devuelve 0010 
select to_char(123,'L999') from dual; -- Devuelve  €123 

select to_char(SYSDATE,'DD MONTH YYYY') from dual; --Devuelve 11 JULIO 2011
select to_char(SYSDATE,'DAY') from dual; --?Devuelve LUNES

select to_date('15 January,1989','dd Month, YYYY','nls_date_language=American') from dual;
select to_date('15/01/1989','dd/mm/yyyy') from dual; 
select to_date('January 15, 1989, 11:00', 'Month dd, YYYY, HH:MI', 'nls_date_language = American') from dual;

select to_number('15465.43','99999.99') from dual;

select nvl(commission_pct,0) from hr.employees;

select nvl2(commission_pct, commission_pct*2, 0) from hr.employees;

select nullif(1234,1234) from dual; --Devolverá null 
select nullif(1234,'1234') from dual; --Devolverá error
select nullif('24-­JUL-­2011', '24-­JUL-­11') from dual; --Devolverá '24-­JUL-­2011'

select first_name, coalesce(commission_pct,0.5*salary,0) from hr.employees;

select decode (department_id, 30, 'Sevilla', 20, 'Granada', 'OTRO CASO') from hr.employees;

select last_name, hire_date,
        trunc(months_between(sysdate,hire_date)/12) years,
        trunc(months_between(sysdate,hire_date)/60) "Years divided by 5",
        case 
              when trunc(months_between(sysdate,hire_date)/60) < 1 then 'Intern'
              when trunc(months_between(sysdate,hire_date)/60) < 2 then 'Junior' 
              when trunc(months_between(sysdate,hire_date)/60) < 3 then 'Intermediate' 
              when trunc(months_between(sysdate,hire_date)/60) < 4 then 'Senior'
              else 'Furniture' 
        end Loyalty 
            from hr.employees 
                where department_id in (60,10);

/*E1. A partir de la tabla JOBS, muestre los datos de trabajo realizado (JOB_TITLE) y salario máximo ganado (MAX_SALARY) de
forma que se muestre este último campo con el símbolo del dólar, como separador de millares una coma y como separador de
decimales un punto (por ej.: $10,020.45). */

SELECT job_title, TO_CHAR(max_salary,'$99,999.99') from HR.jobs;

/*E2. Mostrar la fecha del sistema de forma que si la fecha del sistema es 1/11/2011, martes, deberá mostrar por pantalla “Hoy es
LUNES, 01 de NOVIEMBRE de 2011”.*/

SELECT TO_CHAR(SYSDATE,'"Hoy es" DAY, DD " de " MONTH " de " YYYY') FROM DUAL;

/*E3. De cada empleado contratado a partir del 12 de Enero 2000 se desea mostrar el nombre (FIRST_NAME), apellido
(LAST_NAME) y la fecha de contratación (HIRE_DATE). La fecha de contratación se deberá mostrar con el formato MM/DD/YYYY.*/

SELECT FIRST_NAME, LAST_NAME, TO_CHAR(HIRE_DATE,'MM/DD/YYYY') FROM HR.EMPLOYEES WHERE HIRE_DATE >='12/01/2000';

/*E4. Las llamadas internas de los diferentes departamentos se realizan marcando los últimos siete dígitos del número de teléfono
asignado a cada empleado. Muestre, a partir de la tabla EMPLOYEES, el nombre de pila (FIRST_NAME), número de teléfono
(PHONE_NUMBER) y el número de teléfono (sólo dígitos) para las llamadas internas de los trabajadores que trabajen en el
departamento con ID=30 .*/

SELECT FIRST_NAME, PHONE_NUMBER, TO_NUMBER(SUBSTR(PHONE_NUMBER,5),'9999999') FROM HR.EMPLOYEES WHERE DEPARTMENT_ID=30;

/*E5. De aquellos empleados cuyo apellido empiece por F, se desea realizar una clasificación entre los que ganan comisión y
aquellos que no ganan comisión, de forma que en el caso de ganar comisión se mostrará “Gana comisión” y en caso contrario “No
gana comisión” .*/

SELECT LAST_NAME, NVL2(COMMISSION_PCT,'Gana comision','No gana comision') FROM HR.EMPLOYEES WHERE LAST_NAME LIKE 'F%';

/*E6. Obtener para cada empleado que trabaje en un departamento con identificador menor a 41 el nombre y la localización del
departamento en el que se encuentran utilizando para ello la función DECODE.*/

SELECT DEPARTMENT_ID, DECODE(DEPARTMENT_ID,10,'Administration',20,'Marketing',30,'Purchasing',40,'Human Resources') 
FROM HR.EMPLOYEES WHERE DEPARTMENT_ID<41;

/*P1. De cada empleado se desea mostrar la información de la fecha de finalización de contrato (END_DATE), el identificador de
empleado (EMPLOYEE_ID) y su identificador de trabajo (JOB_ID). El formato de salida de la cadena será tal que si un trabajador
con JOB_ID= 'AC_MGR', y EMPLOYEE_ID=3 finaliza su contrato el 31/10/2011 se deberá mostrar por pantalla “El empleado 3
finaliza como AC_MGR el Lunes 31 de Octubre de 2011”.*/
--PREGUNTAR
SELECT END_DATE, EMPLOYEE_ID, JOB_ID,
CONCAT(TO_CHAR(EMPLOYEE_ID,'"El empleado "'),CONCAT('" finaliza como " JOB_ID',TO_CHAR(END_DATE,' el " Day DD "de" Month "de" YYYY'))) --concatenar
FROM HR.JOB_HISTORY;

--select 'El empleado ' || employee_id,job_id,end_date from hr.job_history;

/*P2. De cada empleado contratado en sábado se desea mostrar su nombre de pila (FIRST_NAME), su apellido (LAST_NAME) y una
cadena basada en el campo fecha de contratación (HIRE_DATE), de forma que si el 17-FEB-1996 fue sábado y hubo una
contratación, la cadena mostrada será “Sábado, 17th de Febrero, One Thousand Nine Hundred Ninety-Six”.*/

SELECT FIRST_NAME, LAST_NAME, TO_CHAR(HIRE_DATE, 'Day, DDth "de" Month, Yyyysp') 
FROM HR.EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'fmDay') like 'Sábado';

/*P3. De aquellos empleados cuyo apellido comiencen por E se desea mostrar su apellido (LAST_NAME), salario (SALARY), el
porcentaje de comisión asignado (COMMISSION_PCT) y la comisión que recibe mensualmente, la cual se calcula multiplicando el
porcentaje de comisión asignado por el salario mensual de cada trabajador.*/

SELECT LAST_NAME, SALARY, COMMISSION_PCT, COMMISSION_PCT*(SALARY/12) AS COMISION_MENSUAL FROM HR.EMPLOYEES WHERE LAST_NAME LIKE 'E%';

/*P4. De aquellos empleados que trabajen en el departamento con ID=100, se desea conocer su nombre (FIRST_NAME), apellido
(LAST_NAME) y si la longitud de nombre es igual a la de su apellido (en caso de igualdad se mostrará “Igual longitud”, en caso
contrario “Longitud diferente”).*/

SELECT FIRST_NAME, LAST_NAME, NVL2(NULLIF(LENGTH(FIRST_NAME),LENGTH(LAST_NAME)),'Longitud diferente','Igual longitud')
FROM HR.EMPLOYEES WHERE DEPARTMENT_ID=100;

/*P5. A partir de la tabla LOCATIONS muestre toda la información almacenada de aquellas localizaciones cuyo identificador de país
(COUNTRY_ID) sea igual a US. Al mostrar la información almacenada en el campo LOCATION_INFO se deberá tener en cuenta la
siguiente tabla:*/

SELECT country_id,--PREGUNTAR
  CASE state_province
        when 'Washington' then 'Headquarters'
        when 'Texas' then 'Oil Wells' 
        when 'California' then CITY 
        when 'New Jersey' then STREET_ADDRESS
   end AS LOCATION_INFO
FROM HR.LOCATIONS WHERE COUNTRY_ID LIKE 'US';
