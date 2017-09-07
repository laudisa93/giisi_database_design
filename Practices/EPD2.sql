/*EPD2*/
desc HR.regions;
select * from hr.regions;
select * from HR.departments;
select department_id, department_name from hr.departments;
select job_title from hr.jobs;
select * from hr.job_history;
select distinct job_id from hr.job_history;

SELECT EMPLOYEE_ID, JOB_ID, START_DATE, END_DATE, 
(END_DATE-START_DATE) +1 "DAYS EMPLOYED"
FROM HR.JOB_HISTORY;

select 360*24*60*60  from dual;

/*E2*/
SELECT DISTINCT JOB_ID, DEPARTMENT_ID FROM HR.job_history;

/*E3*/
SELECT * FROM HR.employees;
SELECT DISTINCT department_id FROM HR.employees;
SELECT * FROM HR.departments;

/*E4*/
SELECT * FROM HR.REGIONS;
SELECT * FROM HR.COUNTRIES;

/*E5*/
SELECT * FROM HR.employees;
SELECT DISTINCT 'THE EMPLOYEE ' || FIRST_NAME ||' ' || LAST_NAME || 
' HAS A SALARY OF ' || SALARY || ' DOLLARS' AS SENTENCE FROM HR.EMPLOYEES;

/*E6*/
SELECT FIRST_NAME || NULL || LAST_NAME AS "FULL_NAME",
COMMISSION_PCT,
COMMISSION_PCT + EMPLOYEE_ID + 10 AS "NULL ARITHMETIC",
10/COMMISSION_PCT AS "DIVISION BY NULL" FROM HR.EMPLOYEES;

/*E7*/
SELECT DISTINCT EMPLOYEE_ID, JOB_ID, START_DATE, END_DATE,
((END_DATE-start_date)+1)/365.25 AS "YEARS WORKING" FROM HR.job_history;

/*E8*/
SELECT (22/7)*6000*6000 AS AREA FROM DUAL;