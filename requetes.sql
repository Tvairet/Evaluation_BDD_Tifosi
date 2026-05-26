-- 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant :
SELECT * FROM focaccia
ORDER BY nom_focaccia;

-- Résultat attendu et obtenu :
(7, 'Américaine', 10.80),
(4, 'Emmentalaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(6, 'Hawaienne', 11.20),
(1, 'Mozaccia', 9.80),
(8, 'Paysanne', 12.80),
(3, 'Raclaccia', 8.90),
(5, 'Tradizione', 8.90);

-- 2. Afficher le nombre total d'ingrédients :
SELECT COUNT(*) FROM ingredient;

-- Résultat attendu et obtenu :
(25);

-- 3. Afficher le prix moyen des focaccias :
SELECT AVG(prix_focaccia) FROM focaccia;

-- Résultat attendu et obtenu : 
(10.375000);

-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson :
SELECT nom_boisson, id_marque FROM boisson
ORDER BY nom_boisson;

-- Résultat attendu et obtenu :

('Capri-sun', 1),
('Coca-cola original', 1),
('Coca-cola zéro', 1),
('Eau de source', 2),
('Fanta citron', 1),
('Fanta orange', 1),
('Lipton peach', 4),
('Lipton zéro citron', 4),
('Monster energy ultra blue', 3),
('Monster energy ultra gold', 3),
('Pepsi', 4),
('Pepsi Max zéro', 4);

-- 5. Afficher la liste des ingrédients pour une Raclaccia :
SELECT id_focaccia, nom_ingredient FROM `comprend` INNER JOIN ingredient ON ingredient.id_ingredient = comprend.id_ingredient 
WHERE id_focaccia = 3;

-- Résultat attendu et obtenu :
(3, 'Base tomate'),
(3, 'Raclette'),
(3, 'Cresson'),
(3, 'Ail'),
(3, 'Champignon'),
(3, 'Parmesan'),
(3, 'Poivre');

-- 6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia :
SELECT focaccia.nom_focaccia, COUNT(comprend.id_ingredient)
FROM focaccia INNER JOIN comprend ON comprend.id_focaccia = focaccia.id_focaccia GROUP BY nom_focaccia

-- Résultat attendu et obtenu :
La requete ne fonctionne pas. 

-- attendu :

nom_focaccia    | nombre_ingredients 

Américaine      |                  8 
Emmentalaccia   |                  7 
Gorgonzollaccia |                  8 
Hawaienne       |                  9 
Mozaccia        |                 10 
Paysanne        |                 12 
Raclaccia       |                  7 
Tradizione      |                  9 

-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients :
SELECT nom_focaccia, COUNT (id_ingredient)  FROM focaccia
INNER JOIN comprend
ON focaccia.id_focaccia = comprend.id_focaccia
GROUP BY nom_focaccia
ORDER BY nom_focaccia
LIMIT 1;

-- Résultat attendu et obtenu :
La requete ne fonctionne pas.

-- 9. Afficher la liste des ingrédients inutilisés :
SELECT * FROM ingredient
LEFT OUTER JOIN comprend
ON comprend.id_ingredient = ingredient.id_ingredient
WHERE comprend.id_ingredient IS NULL;

-- Résultat attendu et obtenu :
(23, 'Salami', NULL, NULL),
(24, 'Tomate cerise', NULL, NULL);


-- 10. Afficher la liste des focaccia qui n'ont pas de champignons :
SELECT focaccia.nom_focaccia FROM focaccia
WHERE focaccia.id_focaccia NOT IN (
	SELECT comprend.id_focaccia FROM comprend
	INNER JOIN ingredient 
	ON comprend.id_ingredient = ingredient.id_ingredient
	WHERE ingredient.nom_ingredient = 'Champignon');

-- Résultat attendu et obtenu :
('Américaine'),
('Hawaienne');