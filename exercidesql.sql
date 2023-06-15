
 Afficher toutes les informations concernant les employés. 
select * from employe

2. Afficher toutes les informations concernant les départements. 
select * from employe

3. Afficher le nom, la date d'embauche, le numéro du supérieur, le
numéro de département et le salaire de tous les employés
SELECT nom, dateemb, nosup, nodep, salaire FROM employe

4. Afficher le titre de tous les employés.
select nom, titre from employe

5. Afficher les différentes valeurs des titres des employés
SELECT titre from employe group by titre

6. Afficher le nom, le numéro d'employé et le numéro du
département des employés dont le titre est « Secrétaire » */
SELECT nom, noemp, nodep from employe where titre = "Secrétaire"

7. Afficher le nom et le numéro de département dont le numéro de
département est supérieur à 40 */
SELECT nom, nodep from employe where nodep > 40

8. Afficher le nom et le prénom des employés dont le nom est
alphabétiquement antérieur au prénom */
SELECT nom, prenom from employe order by prenom < nom

9. Afficher le nom, le salaire et le numéro du département des employés
dont le titre est « Représentant », le numéro de département est 35 et
le salaire est supérieur à 20000 */
SELECT nom, salaire, nodep from employe where titre = "Représentant" and nodep = 35 and salaire > 20000

10. Afficher le nom, le titre et le salaire des employés dont le titre est
« Représentant » ou dont le titre est « Président » */
SELECT nom, titre, salaire from employe where titre = "Représentant" or titre = "Président"

11. Afficher le nom, le titre, le numéro de département, le salaire des
employés du département 34, dont le titre est « Représentant » ou
« Secrétaire » */
SELECT nom, titre, nodep, salaire from employe where (titre = "Représentant" or titre = "Secrétaire") and nodep = 34

/* 12. Afficher le nom, le titre, le numéro de département, le salaire des
employés dont le titre est Représentant, ou dont le titre est Secrétaire
dans le département numéro 34 */
SELECT nom, titre, nodep, salaire from employe where titre = "Représentant" or (titre = "Secrétaire" and nodep = 34)

/* 13. Afficher le nom, et le salaire des employés dont le salaire est compris
entre 20000 et 30000 */
SELECT nom, salaire from employe where salaire > 20000 and salaire < 30000

/* 15. Afficher le nom des employés commençant par la lettre « H » */
SELECT nom from employe where left(nom, 1)  = "H"

/* 16. Afficher le nom des employés se terminant par la lettre « n » */
SELECT nom from employe where right(nom, 1) = "n"

/* 17. Afficher le nom des employés contenant la lettre « u » en 3ème
position */
SELECT nom from employe where SUBSTR(nom, 3, 1) = "u"

/* 18. Afficher le salaire et le nom des employés du service 41 classés par
salaire croissant */
SELECT salaire, nom from employe where nodep = 41 order by salaire ASC

/* 19. Afficher le salaire et le nom des employés du service 41 classés par
salaire décroissant */
SELECT salaire, nom from employe where nodep = 41 order by salaire DESC

/* 20. Afficher le titre, le salaire et le nom des employés classés par titre
croissant et par salaire décroissant */
SELECT titre, salaire, nom from employe order by titre ASC, salaire DESC

/* 21. Afficher le taux de commission, le salaire et le nom des employés
classés par taux de commission croissante */
SELECT tauxcom, salaire, nom from employe order by tauxcom DESC

/* 22. Afficher le nom, le salaire, le taux de commission et le titre des
employés dont le taux de commission n'est pas renseigné */
SELECT nom, salaire, tauxcom, titre from employe where tauxcom is NULL

/* 23. Afficher le nom, le salaire, le taux de commission et le titre des
employés dont le taux de commission est renseigné */
SELECT nom, salaire, tauxcom, titre from employe where tauxcom is not null

/* 24. Afficher le nom, le salaire, le taux de commission, le titre des
employés dont le taux de commission est inférieur à 15 */
SELECT nom, salaire, tauxcom, titre from employe where tauxcom < 15

/* 25. Afficher le nom, le salaire, le taux de commission, le titre des
employés dont le taux de commission est supérieur à 15 */
SELECT nom, salaire, tauxcom, titre from employe where tauxcom > 15

/* 26. Afficher le nom, le salaire, le taux de commission et la commission des
employés dont le taux de commission n'est pas nul. (la commission
est calculée en multipliant le salaire par le taux de commission) */
SELECT nom, salaire, (salaire * tauxcom) AS Commission from employe where tauxcom is not null

/* 27.  Afficher le nom, le salaire, le taux de commission, la commission des
employés dont le taux de commission n'est pas nul, classé par taux de
commission croissant */
SELECT nom, salaire, tauxcom, (salaire * tauxcom) AS commission from employe where tauxcom is not null order by commission ASC

/* 28. Afficher le nom et le prénom (concaténés) des employés. Renommer
les colonnes */
select concat(nom, " ", prenom) as Nom_Prenom from employe

/* 29. Afficher les 5 premières lettres du nom des employés */
SELECT left(nom, 5) from employe

/* 30. Afficher le nom et le rang de la lettre « r » dans le nom des
employés */ 
SELECT nom, INSTR(nom, 'r') from employe

/* 31. Afficher le nom, le nom en majuscule et le nom en minuscule de
l'employé dont le nom est Vrante */
SELECT nom, UPPER(nom), LOWER(prenom) from employe where nom = 'Vrante'

/* 32.  Afficher le nom et le nombre de caractères du nom des employés */
SELECT nom, length(nom) from employe


/* PARTIE 2*/

/* 1. Calculer le nombre d'employés de chaque titre. */
SELECT titre, count(nom) AS "Nombre d'Employer" from employe group by titre

/* 2. Calculer la moyenne des salaires et leur somme, par région */
SELECT AVG(salaire) AS "Moyenne Salaire", SUM(salaire) AS "Somme Salaire" from employe group by nodep

/* 3. Afficher les numéros des départements ayant au moins 3 employés */
SELECT nodep from employe group by nodep having count(nodep) < 3

/* 4. Afficher les lettres qui sont l'initiale d'au moins trois employés */
SELECT SUBSTR(nom, 1, 1), count(*)
from employe
group by SUBSTR(nom, 1, 1)
having COUNT(*) >= 3

/* 5. Rechercher le salaire maximum et le salaire minimum parmi tous les
salariés et l'écart entre les deux */
SELECT max(salaire) AS "Salaire le plus haut", min(salaire) AS "Salaire le plus bas", max(salaire) - min(salaire) AS 'Différence' from employe

/* 6. Rechercher le nombre de titres différents */
SELECT count(DISTINCT titre) from employe

/* 7. Pour chaque titre, compter le nombre d'employés possédant ce titre */
SELECT titre, count(titre) AS "Nombre d'employés" from employe group by titre

/* 8. Pour chaque nom de département, afficher le nom du département et
le nombre d'employés */
SELECT dept.nom, count(employe.nom) from dept
inner join employe on employe.nodep = dept.nodept
group by dept.nom

/* 9. Rechercher les titres et la moyenne des salaires par titre dont la
moyenne est supérieure à la moyenne des salaires des Représentants */
SELECT titre, avg(salaire) 
from employe
group by titre
having avg(salaire) > (SELECT avg(salaire)
                        from employe
                        where titre like "Représentant")

/* 10. Rechercher le nombre de salaires renseignés et le nombre de taux de
commission renseignés */
SELECT count(salaire) AS "Nombre de salaire", count(tauxcom) AS "Nombre de commission" from employe


/* Manipuler une base de données */

/* INSERT */
INSERT into employe(noemp, nom, prenom, dateemb, nosup, titre, nodep, salaire, tauxcom)
VALUES(26, 'laurent', 'tasgin', '2023-04-11 00:00:00', '7', 'représentant', '50', 25000, 10),
(27, 'George', 'Cliche', '2018-11-25 00:00:00', '4', 'représentant', '45', 18000, 5),
(28, 'Soren', 'Charté', '2005-01-23 00:00:00', '8', 'secrétaire', '41', 51000, 15);

INSERT into dept(nodept, nom, noregion)
VALUES (80, 'Picardie', 6);

/* UPDATE */
UPDATE employe
set salaire = (salaire * 1.1)
where noemp = 17

UPDATE dept
set nom = "Logistique"
where nodept = 45

/* DELETE */
DELETE
FROM employe
WHERE noemp = 28
