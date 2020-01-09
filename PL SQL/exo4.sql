/* Exercice 1 */
SET serveroutput on;
declare 
    a number := 1;
    b number := 2;
    c number;
begin 
dbms_output.put_line('a = '||a||' b = '||b);
    c:= a;
    a:= b;
    b:= c;
dbms_output.put_line('a = '||a||' b = '||b);
end;
/
/* Exercice 2 */
SET serveroutput on;
declare 
    a number := 10;
    fact number := 1;
begin 
for i in REVERSE 1..a loop
fact := fact * i ;
end loop;
dbms_output.put_line('le factoriel de : '||a||' est : '||fact);
end;
/
/* Exercice 3 */
SET serveroutput on;
declare 
dept departments.department_id%TYPE;
begin 
select max(department_id) into dept from departments;
insert into departments
values (dept+10,'Informatique',100,1700);
end;
/
/* Exercice 4 */
SET serveroutput on;
declare 
dept departments.department_id%TYPE;
begin 
select max(department_id) into dept from departments;

dbms_output.put_line(dept);
end;
/
/* Exercice 5 */
SET serveroutput on;
declare 
dept departments%ROWTYPE;
begin 
select * into dept from departments where department_id = (select max(department_id) from departments);
dbms_output.put_line(dept.department_id||' '||dept.department_name||' '||dept.manager_id||' '||dept.location_id);
end;
/
/* Exercice 6 */
set serveroutput on;
declare 
    id_dept departments.department_id%TYPE;
    counter number;
begin 
    select max(department_id) into id_dept from departments;
    update departments set location_id = 2500 where department_id = id_dept;
    select count(department_id) into counter from departments where location_id=2500;
    dbms_output.put_line(counter);
end;
/
/* Exercice 7 */
set serveroutput on;
declare 
     id_mgr employees.manager_id%TYPE;
begin 
    select manager_id into id_mgr from employees where last_name=INITCAP('&last_name');
    dbms_output.put_line(id_mgr);
end;
/
/* Exercice 8 */
SET serveroutput on;
declare 
 cursor c_emp is select * from employees where rownum <= 10 order by hire_date desc;
begin 
for var_em in c_emp loop
dbms_output.put_line(var_em.last_name||' '||var_em.hire_date);
end loop;
end;
/
/* Exercice 9 */
SET serveroutput on;
declare 
counter number;
begin 
select count(DISTINCT employee_id) into counter from employees where department_id =30;
dbms_output.put_line(counter);
end;
/
/* Exercice 10 */
DECLARE
v_salary employees.salary%TYPE;
v_name employees.last_name%TYPE;
BEGIN
v_name := 'King';
v_salary := 2888;

IF v_salary < 3000  THEN
    v_salary := v_salary +500;
    UPDATE EMPLOYEES
    SET salary = v_salary
    WHERE salary = 3000;
dbms_output.put_line(v_name ||'s salary updated');

ELSIF v_salary > 3000 THEN
    dbms_output.put_line(v_name || ' earns '|| to_char(v_salary));
END IF;
END;
/* Exercice 11 */
/* 1 : a */
SELECT s.horaire, s.nomS
FROM salle s , film f
WHERE f.titre = s.titre
AND f.titre = 'Les miserables';
/* b */
SELECT acteur
FROM film 
WHERE Titre IN (SELECT titre
                FROM Film;);
/* c */                
SELECT a.amateur
FROM Aime a , vue v, film f
WHERE a.titre = v.titre = f.titre;
/* 2 */
DECLARE
CURSOR prod_c IS
    SELECT producteur,titre
    FROM PRODUCTEUR;
CURSOR film_c IS
    SELECT titre
    FROM film;
coun NUMBER := 0;
BEGIN
for i IN prod_c LOOP
    for j IN film_c LOOP
        IF i.titre == j.titre THEN
        coun =: coun +1;
        END IF;
    END LOOP;
dbms_output.put_line(i.producteur || 'a realiser' || to_char(coun);
END LOOP;
END;




