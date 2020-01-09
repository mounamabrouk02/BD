/* Question 4 */
select * from employees;
select last_name, first_name , salary from employees;
select last_name, first_name , salary from employees where salary > 20000;
select last_name, first_name , salary , department_id from employees where salary BETWEEN 6000 AND 20000;
select last_name, first_name , salary from employees where department_id IN (200,201,203,121) and salary BETWEEN 6000 AND 20000;
select e.last_name, e.first_name , e.salary from employees e, departments d where d.department_id = e.department_id and d.department_name like 'E%';
select last_name,first_name,salary from employees where job_id NOT IN ('IT_PROG','AD_VP');
select DISTINCT department_id from departments;
select salary, department_id from employees ORDER BY department_id;
/* Question 5 */
select salary, salary + (salary / 100 * 15) as "salaire augmenté", department_id from employees ORDER BY department_id;
select salary, salary + (salary / 100 * 15) as "salaire augmenté",salary + (salary / 100 * 15) -salary as "La différence" , department_id from employees ORDER BY department_id;
select salary, department_id from employees ORDER BY department_id asc , salary desc;
/* Question 6 */
select SUBSTR(job_title,1,6) from jobs;
select last_name,first_name,length(last_name) from employees;
select CONCAT(first_name,last_name) as "Nom complet" ,salary from employees;
select LPAD(last_name,length(last_name)+6,'Nom : '),LPAD(first_name,length(first_name)+9,'Prenom : '),LPAD(salary,length(salary)+10,'Salaire : ') from employees;
select UPPER(last_name) , LOWER(first_name) from employees;
select last_name , first_name from employees where LOWER(first_name)='david';
select last_name,first_name,TO_CHAR(salary,'99,999') from employees;
select last_name,first_name,TO_CHAR(salary,'99,999L') from employees;
select last_name,first_name,TO_CHAR(hire_date,'DD/MM/YYYY');
select last_name,first_name,hire_date from employees where TO_CHAR(hire_date,'MM')=01;
select last_name,first_name,ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)) as "mois d ancienté" from employees ORDER BY "mois d ancienté" desc;
select last_name,first_name,ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)) as "mois d annees" from employees ORDER BY "mois d annees" desc;
/* Question 7 */
select e.last_name , e.first_name , d.department_name from employees e, departments d where e.department_id = d.department_id;
select d.department_name , e.first_name ,e.last_name from employees e , departments d where d.department_id = e.department_id order by d.department_name asc;