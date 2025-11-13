-- ######################################################################
-- # FICHIER: 02_data_insertion.sql
-- # DESCRIPTION: Insertion des données de test à partir des fichiers CSV.
-- # ASSUMPTION: Le script 01_schema_creation.sql a déjà été exécuté.
-- ######################################################################

USE tifosi;

-- Désactive la vérification des clés étrangères temporairement pour faciliter les insertions
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Insertion des Marques
INSERT INTO marque (id_marque, nom_marque) VALUES 
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- 2. Insertion des Ingrédients
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES 
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chèvre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');

-- 3. Insertion des Focaccias
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES 
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 8.90),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);

-- 4. Insertion des Boissons
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 1, 'Coca-cola zéro', id_marque FROM marque WHERE nom_marque = 'Coca-cola';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 2, 'Coca-cola original', id_marque FROM marque WHERE nom_marque = 'Coca-cola';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 3, 'Fanta citron', id_marque FROM marque WHERE nom_marque = 'Coca-cola';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 4, 'Fanta orange', id_marque FROM marque WHERE nom_marque = 'Coca-cola';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 5, 'Capri-sun', id_marque FROM marque WHERE nom_marque = 'Coca-cola';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 6, 'Pepsi', id_marque FROM marque WHERE nom_marque = 'Pepsico';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 7, 'Pepsi Max Zéro', id_marque FROM marque WHERE nom_marque = 'Pepsico';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 8, 'Lipton zéro citron', id_marque FROM marque WHERE nom_marque = 'Pepsico';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 9, 'Lipton Peach', id_marque FROM marque WHERE nom_marque = 'Pepsico';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 10, 'Monster energy ultra gold', id_marque FROM marque WHERE nom_marque = 'Monster';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 11, 'Monster energy ultra blue', id_marque FROM marque WHERE nom_marque = 'Monster';
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) 
SELECT 12, 'Eau de source', id_marque FROM marque WHERE nom_marque = 'Cristalline';

-- 5. Insertion des données dans la table COMPREND (Composition des focaccias)
INSERT INTO comprend (id_focaccia, id_ingredient, quantite_g) VALUES 
(1, 5, 20), (1, 25, 20), (1, 9, 20), (1, 13, 20), (1, 1, 2), (1, 3, 20), (1, 7, 20), (1, 18, 20), (1, 20, 20), (1, 16, 20),
(2, 5, 20), (2, 11, 20), (2, 9, 20), (2, 1, 2), (2, 7, 20), (2, 18, 20), (2, 20, 20), (2, 16, 20),
(3, 5, 20), (3, 22, 20), (3, 9, 20), (3, 1, 2), (3, 7, 20), (3, 18, 20), (3, 20, 20),
(4, 6, 20), (4, 10, 20), (4, 9, 20), (4, 7, 20), (4, 18, 20), (4, 20, 20), (4, 15, 20),
(5, 5, 20), (5, 25, 20), (5, 9, 20), (5, 12, 20), (5, 7, 80), (5, 18, 20), (5, 20, 20), (5, 16, 10), (5, 17, 10),
(6, 5, 20), (6, 25, 20), (6, 9, 20), (6, 4, 20), (6, 2, 20), (6, 19, 20), (6, 18, 20), (6, 20, 20), (6, 16, 20),
(7, 5, 20), (7, 25, 20), (7, 9, 20), (7, 4, 20), (7, 21, 40), (7, 18, 20), (7, 20, 20), (7, 16, 20),
(8, 6, 20), (8, 8, 20), (8, 9, 20), (8, 21, 20), (8, 13, 20), (8, 1, 2), (8, 3, 20), (8, 7, 20), (8, 18, 20), (8, 20, 20), (8, 16, 20), (8, 14, 20);

-- 6. Insertion de données factices pour Client et Menu
INSERT INTO client (id_client, nom_client, prenom_client, email_client) VALUES 
(1, 'Rossi', 'Marco', 'm.rossi@mail.com'),
(2, 'Bianchi', 'Sofia', 's.bianchi@mail.com');

INSERT INTO menu (id_menu, nom_menu, prix_menu) VALUES 
(1, 'Menu Classico', 12.00),
(2, 'Menu Veggie', 11.50);

-- Rétablit la vérification des clés étrangères
SET FOREIGN_KEY_CHECKS = 1;
