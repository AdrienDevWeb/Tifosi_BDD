# 🇮🇹 Projet Base de Données MySQL - Tifosi Street Food

Ce dépôt contient l'intégralité du projet de conception et de vérification d'une base de données relationnelle pour le restaurant de Street Food italien "Tifosi".

## 🎯 Objectifs du Projet

L'objectif principal était de concevoir le modèle physique d'une base de données MySQL à partir du modèle conceptuel de données (MCD) fourni, puis de valider le schéma via des requêtes SQL de complexité variable.

## 🛠️ Structure des Fichiers SQL

Le projet est organisé en trois scripts SQL à exécuter dans l'ordre pour initialiser et tester la base de données.

| Fichier | Description | Exécution |
| :--- | :--- | :--- |
| **`01_schema_creation.sql`** | Création de la base de données `tifosi`, de l'utilisateur dédié (`tifosi@localhost` avec le mot de passe `Tifosi2024`), et de toutes les tables (DDL). | À exécuter **en premier** pour construire le schéma. |
| **`02_data_insertion.sql`** | Insertion de l'ensemble des données de test (marques, ingrédients, focaccias, boissons, composition) dans les tables (DML). | À exécuter **en second** pour peupler la base. |
| **`03_test_queries.sql`** | Contient les **10 requêtes de vérification** demandées pour tester la pertinence du schéma (DQL/DML). | À exécuter **en dernier** pour valider les données et les relations. |

## 🚀 Comment Exécuter les Scripts

1.  **Préalable :** Assurez-vous d'avoir un serveur MySQL (ou MariaDB) fonctionnel (ex: via WAMP, XAMPP, ou un Docker).
2.  **Connexion :** Connectez-vous à votre client MySQL (workbench, DBeaver, ou console) avec un compte administrateur.
3.  **Exécution :** Exécutez les scripts dans l'ordre :
    1.  `01_schema_creation.sql`
    2.  `02_data_insertion.sql`
    3.  `03_test_queries.sql` (Les résultats de ces requêtes valident la structure.)

## 🔍 Validation : Requêtes de Test

Le script `03_test_queries.sql` inclut les 10 requêtes de validation, chacune étant commentée pour expliquer son rôle.
