/* Exercice 1 : */
/* Q1 */
SELECT * FROM AIRPLANE WHERE CAPACITY > 350;
/* Q2 */
SELECT NumAP , NameAP 
FROM AIRPLANE 
WHERE localisation = 'Nice';

/* Q3 */
SELECT NumP , Dept 
FROM flight;
/* Q4 */
SELECT * FROM PILOT;
/* Q5 */
SELECT NameP 
FROM PILOT
WHERE Address = 'Paris' and salary > 15000;
/* Q6 */
SELECT NumAP , NameAP 
FROM AIRPLANE 
WHERE LOCALISATION = 'Nice' OR capacity < 350;
/* Q7 */
SELECT * 
FROM FLIGHT
WHERE Dep_T = 'Nice' and Arr_T = 'Paris' and Dep_H >  18;
/* Q8 */
SELECT NumP 
FROM PILOT
WHERE Nump NOT IN ( SELECT Nump From flight );
/* Q9 */
SELECT NumF , Dep_T 
FROM flight
WHERE Nump IN (100,204);

/* Exercice 2 : */
/* Q1 */
SELECT Personne 
FROM Emprunt
WHERE Livre = 'Recueil Examens BD';
/* Q2 */
SELECT Personne 
FROM Emprunt 
WHERE Personne IN (
                     SELECT Personne 
                     FROM Retard)
AND DateRetourEective IS NULL ;
/* Q3 */
SELECT Personne 
FROM Emprunt
WHERE Livre > ALL (
                  SELECT Livre
                  FROM Emprunt);
/* Q4 */
SELECT Livre FROM Emprunt 
WHERE Personne > ALL (
                     SELECT Personne 
                     FROM Emprunt);
/* Q5 */
SELECT * 
FROM Emprunt
WHERE DateRetourEective > DateRetourPrevue;