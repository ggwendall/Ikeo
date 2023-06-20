# Projet Streamlit pour la visualisation de données

Ce projet utilise Streamlit, une bibliothèque Python, pour créer une application web interactive permettant de visualiser des données à partir d'une base de données.

## Description du projet

L'objectif de ce projet est de créer une interface utilisateur conviviale pour explorer et visualiser des données provenant d'une base de données MySQL. L'application utilise les bibliothèques Pandas, Matplotlib et PyMySQL pour charger les données, effectuer des requêtes SQL et générer des graphiques interactifs.

## Fonctionnalités

- Affichage des produits avec leurs sites de production
- Filtrage des produits par site de production
- Affichage des graphiques des commandes par produits et par clients

## Prérequis

- Python 3.7 ou une version ultérieure
- Les bibliothèques Python : Streamlit, Pandas, Matplotlib et PyMySQL
- Une base de données MySQL avec les tables suivantes :
  - `Usines` : contient les informations sur les usines de production
  - `Produits` : contient les informations sur les produits
  - `FactureProduits` : contient les informations sur les commandes de produits
  - `Clients` : contient les informations sur les clients

## Installation

1. Clonez ce dépôt GitHub :

git clone https://github.com/votre-utilisateur/projet-streamlit.git

2. Accédez au répertoire du projet :

cd projet-streamlit

3.Installez les dépendances :

pip install -r requirements.txt

4.Configurez les informations de connexion à votre base de données dans le fichier app.py :

# Informations de connexion à la base de données
host = 'localhost'
user = 'votre_utilisateur'
password = 'votre_mot_de_passe'
database = 'votre_base_de_donnees'
port = 3306

5. Lancez l'application :

streamlit run app.py

## Captures d'écran

![image](https://github.com/ggwendall/Ikeo/assets/48108275/f2c3a794-6648-43a0-9829-3c424f92c637)

Affichage des produits avec leurs sites de production

![image](https://github.com/ggwendall/Ikeo/assets/48108275/21793092-196f-4235-9950-6f43bee6a550)

![image](https://github.com/ggwendall/Ikeo/assets/48108275/d038add7-e20d-45b5-b0bc-51ab6aeb9c8f)

Graphique des commandes par produits et Graphique des commandes par clients

Auteurs

    Quenet Gwendal gwendal.quenet@isen-ouest.yncrea.fr
    Lardic Jérémy  jeremy.lardic@isen-ouest.yncrea.fr
    Ulvoas Camile  camille.ulvoas@isen-ouest.yncrea.fr
