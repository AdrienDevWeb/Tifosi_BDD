-- ######################################################################
-- # FICHIER: 01_schema_creation.sql
-- # DESCRIPTION: Création de la base de données 'tifosi' et de son schéma relationnel.
-- ######################################################################

-- Suppression de la base de données si elle existe pour un redéploiement propre
DROP DATABASE IF EXISTS tifosi;

-- 1. CREATION DE LA BASE DE DONNEES
CREATE DATABASE tifosi
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Sélectionne la base de données
USE tifosi;

-- 2. CREATION DE L'UTILISATEUR ET DES DROITS (comme demandé dans le brief)
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'Tifosi2024';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

-- ----------------------------------------------------------------------
-- TABLE marque (Références les marques de boissons)
-- ----------------------------------------------------------------------
CREATE TABLE marque (
    id_marque INT PRIMARY KEY 
        COMMENT 'Clé primaire : Identifiant unique de la marque.',
    nom_marque VARCHAR(50) UNIQUE NOT NULL 
        COMMENT 'Nom de la marque.'
);

-- ----------------------------------------------------------------------
-- TABLE ingredient (Liste de tous les ingrédients)
-- ----------------------------------------------------------------------
CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY 
        COMMENT 'Clé primaire : Identifiant unique de l''ingrédient.',
    nom_ingredient VARCHAR(50) UNIQUE NOT NULL 
        COMMENT 'Nom de l''ingrédient.'
);

-- ----------------------------------------------------------------------
-- TABLE focaccia (Les produits vendus)
-- ----------------------------------------------------------------------
CREATE TABLE focaccia (
    id_focaccia INT PRIMARY KEY 
        COMMENT 'Clé primaire : Identifiant unique de la focaccia.',
    nom_focaccia VARCHAR(100) UNIQUE NOT NULL 
        COMMENT 'Nom commercial de la focaccia.',
    prix DECIMAL(5, 2) NOT NULL 
        COMMENT 'Prix de vente.'
);

-- ----------------------------------------------------------------------
-- TABLE boisson (Les boissons vendues. Relation 1,1 avec marque)
-- ----------------------------------------------------------------------
CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY 
        COMMENT 'Clé primaire : Identifiant unique de la boisson.',
    nom_boisson VARCHAR(100) NOT NULL 
        COMMENT 'Nom de la boisson.',
    id_marque INT NOT NULL 
        COMMENT 'Clé étrangère vers la marque associée.',
    
    FOREIGN KEY (id_marque) 
        REFERENCES marque(id_marque)
);

-- ----------------------------------------------------------------------
-- TABLE comprend (Relation N:M entre focaccia et ingredient : Composition)
-- ----------------------------------------------------------------------
CREATE TABLE comprend (
    id_focaccia INT NOT NULL 
        COMMENT 'Clé étrangère vers la focaccia.',
    id_ingredient INT NOT NULL 
        COMMENT 'Clé étrangère vers l''ingrédient.',
    quantite_g INT DEFAULT 20 
        COMMENT 'Quantité de l''ingrédient dans la focaccia (en grammes).',
    
    PRIMARY KEY (id_focaccia, id_ingredient), -- Clé primaire composée
    FOREIGN KEY (id_focaccia) 
        REFERENCES focaccia(id_focaccia) 
        ON DELETE CASCADE,
    FOREIGN KEY (id_ingredient) 
        REFERENCES ingredient(id_ingredient) 
        ON DELETE CASCADE
);

-- ----------------------------------------------------------------------
-- TABLES CLIENTS ET COMMANDES (Pour respecter l'intégralité du MCD)
-- ----------------------------------------------------------------------

CREATE TABLE client (
    id_client INT PRIMARY KEY AUTO_INCREMENT 
        COMMENT 'Clé primaire du client.',
    nom_client VARCHAR(50) NOT NULL,
    prenom_client VARCHAR(50) NOT NULL,
    email_client VARCHAR(100) UNIQUE NOT NULL,
    code_postal VARCHAR(10)
);

CREATE TABLE menu (
    id_menu INT PRIMARY KEY AUTO_INCREMENT 
        COMMENT 'Clé primaire du menu.',
    nom_menu VARCHAR(100) UNIQUE NOT NULL,
    prix_menu DECIMAL(5, 2) NOT NULL
);

CREATE TABLE commande (
    id_commande INT PRIMARY KEY AUTO_INCREMENT 
        COMMENT 'Clé primaire de la commande.',
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);
