/*EPD 3*/
select country_name from hr.countries where region_id=3;

select last_name, first_name from hr.employees where job_id='SA_REP'; //Hay que ponerlo exactamente como este escrito (no Sa_Epd)

select last_name, salary from hr.employees where salary = 10000; //Si se pone como literal de caracteres, se va a traducir como un numero

select employee_id from hr.job_history where start_date = '13-ENE-1993';

select last_name from hr.employees where salary >= 3400 and salary <= 4000;
select last_name from hr.employees where salary between 3400 and 4000;

select last_name from hr.employees where salary in (1000,4000,6000);

select first_name from hr.employees where first_name like '%a%'; //% hace referencia a cualquier caracter.
select first_name from hr.employees where first_name like '_a%'; //_ aqui va a haber un solo caracter, el que sea

select job_id from hr.jobs where job_id like 'SA\_%' escape '\'; // \ hace refenrencia a un guion bajo específicamente en este caso.

select last_name from hr.employees  where commission_pct is null;

select last_name, hire_date, salary from hr.employees where job_id in ('SA_REP','MK_MAN') order by last_name /*DESC es orden inverso*/;

select job_id, last_name, salary, hire_date from hr.employees where job_id in ('SA_REP','MK_MAN') order by job_id desc, last_name, 3 desc;
//Primero en orden descendiente el id, segundo el apellido en ascendente y tercero el salario en descendente

select employee_id, last_name, phone_number from hr.employees where last_name = '&LASTNAME' or employee_id = &EMPNO; //Poner con comillas simples las cadenas de caracteres

select first_name, last_name from hr.employees where last_name like '%&&SEARCH%' and first_name like '%&SEARCH%'; //& indica pide un valor. Doble & para hacer una misma consultaç

select first_name, job_id, &&col/*Una columna que introducimos*/ from hr.employees where job_id in ('MK_MAN','SA_MAN') order by &col;
define;
undefine SEARCH;
undefine col;
define SEARCH=A;

/*E1*/
SELECT FIRST_NAME, SALARY FROM HR.employees WHERE SALARY>5000;

/*E2*/
SELECT EMPLOYEE_ID, JOB_ID FROM HR.employees WHERE SALARY!=DEPARTMENT_ID+4000;

/*E3*/
SELECT LAST_NAME FROM HR.employees WHERE LAST_NAME<'KING' ORDER BY LAST_NAME;

/*E4*/
SELECT * FROM HR.employees WHERE hire_date>'01-01-2000';

/*E5*/
SELECT FIRST_NAME, HIRE_DATE FROM HR.EMPLOYEES WHERE HIRE_DATE BETWEEN '24-07-1994' AND '07-06-1996';

/*E6*/
select last_name from HR.employees where last_name='King' OR last_name='Garbharran' OR last_name= 'Ramklass'; //ES IGUAL A
select last_name from HR.employees where last_name IN ('King','Garbharran','Ramklass');

/*E7*/
SELECT COUNTRY_NAME FROM HR.COUNTRIES WHERE country_name LIKE 'I%a%';
SELECT COUNTRY_NAME FROM HR.COUNTRIES WHERE country_name LIKE 'I___i';

/*E8*/
SELECT FIRST_NAME||' '||LAST_NAME AS NOMBRE, COMMISSION_PCT, HIRE_DATE FROM HR.employees WHERE FIRST_NAME NOT LIKE 'B%' AND commission_pct>0.35;

/*P1*/
SELECT LAST_NAME, SALARY, DEPARTMENT_ID, JOB_ID, COMMISSION_PCT FROM HR.EMPLOYEES WHERE (LAST_NAME LIKE '%a%' AND SALARY>DEPARTMENT_ID*200) OR (JOB_ID IN ('MK_REP','MK_MAN') AND COMMISSION_PCT IS NOT NULL);

/*P2*/
SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, (MAX_SALARY-MIN_SALARY) AS "VARIANCE" FROM HR.JOBS 
WHERE JOB_TITLE LIKE '%President%' OR job_id LIKE '%Manager%'
ORDER BY "VARIANCE" DESC, JOB_TITLE DESC;

/*P3*/