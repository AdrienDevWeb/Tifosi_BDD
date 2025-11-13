-- ######################################################################
-- # FICHIER: 03_test_queries.sql
-- # DESCRIPTION: Script contenant les 10 requêtes de test pour vérifier la BDD 'tifosi'.
-- ######################################################################

USE tifosi;

-- ======================================================================
-- A. REQUÊTES DE TEST (Complexité Variable)
-- ======================================================================

-- 1. But : Afficher la liste des noms des focaccias par ordre alphabétique croissant.
SELECT 
    nom_focaccia 
FROM 
    focaccia
ORDER BY 
    nom_focaccia ASC;

-- ----------------------------------------------------------------------

-- 2. But : Afficher le nombre total d'ingrédients.
SELECT 
    COUNT(id_ingredient) AS NombreTotalIngredients 
FROM 
    ingredient;

-- ----------------------------------------------------------------------

-- 3. But : Afficher le prix moyen des focaccias.
SELECT 
    AVG(prix) AS PrixMoyenFocaccias 
FROM 
    focaccia;

-- ----------------------------------------------------------------------

-- 4. But : Afficher la liste des boissons avec leur marque, triée par nom de boisson.
SELECT 
    b.nom_boisson, 
    m.nom_marque
FROM 
    boisson b
JOIN 
    marque m ON b.id_marque = m.id_marque
ORDER BY 
    b.nom_boisson ASC;

-- ----------------------------------------------------------------------

-- 5. But : Afficher la liste des ingrédients pour une Raclaccia.
SELECT 
    i.nom_ingredient,
    c.quantite_g
FROM 
    ingredient i
JOIN 
    comprend c ON i.id_ingredient = c.id_ingredient
JOIN 
    focaccia f ON c.id_focaccia = f.id_focaccia
WHERE 
    f.nom_focaccia = 'Raclaccia';

-- ----------------------------------------------------------------------

-- 6. But : Afficher le nom et le nombre d'ingrédients pour chaque foccacia.
SELECT 
    f.nom_focaccia, 
    COUNT(c.id_ingredient) AS NombreIngredients
FROM 
    focaccia f
JOIN 
    comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY 
    f.id_focaccia, f.nom_focaccia
ORDER BY 
    NombreIngredients DESC, f.nom_focaccia ASC;

-- ----------------------------------------------------------------------

-- 7. But : Afficher le nom de la focaccia qui a le plus d'ingrédients.
SELECT 
    nom_focaccia
FROM 
    focaccia f
JOIN 
    comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY 
    f.id_focaccia, f.nom_focaccia
ORDER BY 
    COUNT(c.id_ingredient) DESC
LIMIT 1;

-- ----------------------------------------------------------------------

-- 8. But : Afficher la liste des focaccia qui contiennent de l'ail.
SELECT 
    f.nom_focaccia
FROM 
    focaccia f
JOIN 
    comprend c ON f.id_focaccia = c.id_focaccia
JOIN 
    ingredient i ON c.id_ingredient = i.id_ingredient
WHERE 
    i.nom_ingredient = 'Ail'
ORDER BY 
    f.nom_focaccia;

-- ----------------------------------------------------------------------

-- 9. But : Afficher la liste des ingrédients inutilisés (non présents dans aucune focaccia).
SELECT 
    i.nom_ingredient
FROM 
    ingredient i
LEFT JOIN 
    comprend c ON i.id_ingredient = c.id_ingredient
WHERE 
    c.id_focaccia IS NULL
ORDER BY 
    i.nom_ingredient;

-- ----------------------------------------------------------------------

-- 10. But : Afficher la liste des focaccia qui n'ont pas de champignons.
SELECT 
    f.nom_focaccia
FROM 
    focaccia f
WHERE 
    f.id_focaccia NOT IN (
        SELECT 
            c.id_focaccia
        FROM 
            comprend c
        JOIN 
            ingredient i ON c.id_ingredient = i.id_ingredient
        WHERE 
            i.nom_ingredient = 'Champignon'
    )
ORDER BY 
    f.nom_focaccia;
