/* Création de la base de données et contraintes d’intégrité */
/* 1 */
CREATE TABLE DEPT(
DEPTNO NUMBER(2) PRIMARY KEY,
DNAME VARCHAR2(20) CHECK (dname IN ('ACCOUNTING','RESEARCH','SALES','OPERATIONS')),
LOC VARCHAR2(20)
);
/* 2 */
INSERT INTO DEPT 
VALUES (10,'ACCOUNTING','NEW-YORK');
INSERT INTO DEPT 
VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT 
VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT 
VALUES (40,'OPERATIONS','BOSTON');
/* 3 */
CREATE TABLE EMP AS SELECT * FROM SCOTT.EMP;
/* 4 */
INSERT INTO EMP 
VALUES  (7369, ‘Bidon’, NULL, NULL, NULL, NULL, NULL, NULL);
/* La requéte ne fonctionne pas parcequ'on a déjà cette valeur dans la colonne EMPNO qui est une clé primaire */
/* 5 */
ROLLBACK;
/* 6 */
 ALTER TABLE EMP 
 ADD CONSTRAINT emp_pk PRIMARY KEY (EMPNO);
 
 ALTER TABLE EMP 
 ADD CONSTRAINT emp_fk1 FOREIGN KEY (MGR) REFERENCES EMP (MGR);
 
 
  ALTER TABLE EMP 
  ADD CONSTRAINT emp_fk2 FOREIGN KEY (DEPTNO) REFERENCES EMP (DEPTNO);
  /* 7 */ 

INSERT INTO EMP
VALUES (7657,'WILSON','MANAGER',7000,'17/11/91',3500.00,600.00,10);

INSERT INTO EMP
VALUES (7657,'WILSON','MANAGER',7839,'17/11/91',3500.00,600.00, 10);
/*
Remarques :
-On ne peut pas inséré le ligne qui contien la valeur 50 dans la colonne DEPTNO, car cette dernière et une clé etrangère qui n'existe pas dans la table DEPT
-On ne peut pas inserer la ligne qui contient la valeur 7369 dans la colonne EMPNO parceque elle est deja entrée dans un autre ligne et elle est clé primaire
-On ne peut pas inseré deux ligne avec la méme clé primaire 
-On ne peut pas inseré la ligne qui contient la valeur 7000 dans la colonne MGR parce qu'il une clé étrangère réfférencié à la colonne EMPNO est la valeur 7000 n'exist pas dans EMPNO*/
/* 8 */
COMMIT;
/* Mise à jour de la base de données */
/* 1 */
UPDATE DEPT SET LOC = 'PITTSBURGH' WHERE DNAME = 'SALES';
/* 2 */
UPDATE EMP SET SAL = (SAL + (SAL/10)) where COMM > (SAL/2);
/* 3 */
UPDATE EMP SET COMM = (select AVG(COMM) from emp) where HIREDATE < '01/01/81' AND COMM IS NULL;
/* 4 */ 
ROLLBACK;
/* 5 */
DELETE FROM DEPT WHERE DEPTNO = 20;
/* Cette requete doit nous renvoyer une erreure parce qu'on a DEPTNO = 20 comme une clé étrangère dans la table EMP.*/
/* Interrogation de la base de données */
/* 1 */
select ENAME, SAL , COMM , SAL + COMM from emp where JOB='SALESMAN';
/* 2 */
SELECT ENAME from emp ORDER BY COMM/SAL desc;
/* 3 */
SELECT ename from emp where comm < (sal/100*25);
/* 4 */
select COUNT(EMPNO) from emp where deptno = 10;
/* 5 */
select COUNT(EMPNO) from emp where comm IS NOT NULL;
/* 6 */
select COUNT(DISTINCT JOB) from emp;
/* 7 */
select JOB,AVG(SAL) from emp GROUP BY JOB;
/* 8 */
select SUM(sal) FROM EMP e, DEPT d where e.deptno = d.deptno and d.dname ='SALES';
/* 9 */
select e.ename,d.dname from emp e , dept d where e.deptno = d.deptno;
/* 10 */
select ename,job,sal from emp where sal = (select max(sal) from emp);
/* 11 */
select ename from emp where sal > (select sal from emp where ename='JONES');
/* 12 */
select ename from emp where job = (select job from emp where ename='JONES') and ename <> 'JONES';
/* 13 */
select ename from emp where MGR = (select MGR from emp where ename='CLARK') and ename <> 'CLARK';
/* 14 */
select ename , job from emp where (job , mgr) IN (select job,mgr from emp where ename='TURNER') and ename<>'TURNER';
/* 15 */
select ename from emp where hiredate < all (select hiredate from emp where deptno = 10);
/* 16 */
select e.ename , m.ename from emp e , emp m where e.empno = m.mgr;
/* 17 */
select e.ename from emp e , emp m where e.empno = m.mgr and e.deptno <> m.deptno;
