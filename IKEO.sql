-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mar. 20 juin 2023 à 10:41
-- Version du serveur : 8.0.33
-- Version de PHP : 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `IKEO`
--

-- --------------------------------------------------------

--
-- Structure de la table `Clients`
--

CREATE TABLE `Clients` (
  `ClientID` int NOT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `RaisonSocial` varchar(100) DEFAULT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `Ville` varchar(100) DEFAULT NULL,
  `Pays` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Clients`
--

INSERT INTO `Clients` (`ClientID`, `Type`, `RaisonSocial`, `Adresse`, `Ville`, `Pays`) VALUES
(1, 'Magasin', 'Bo Meuble', 'Place Vendôme', 'Paris', 'France'),
(2, 'Magasin', 'Mobel', 'Porte de Brandebourg', 'Berlin', 'Allemagne'),
(3, 'Magasin', 'Bo Meuble', 'Rue Jean Jaurès', 'Brest', 'France'),
(4, 'Magasin', 'Tout A La Maison', 'Rue de la Bastille', 'Paris', 'France'),
(5, 'Magasin', 'Bo Meuble', 'Avenue des Trois Dragons', 'Barcelone', 'Espagne'),
(6, 'Central d\'achat', 'The World Compagny', 'Oxford street', 'Londres', 'Angleterre'),
(7, 'Magasin', 'The Best Greatest Beautifulest Furniture', 'Coven Garden', 'Londres', 'Angleterre');

-- --------------------------------------------------------

--
-- Structure de la table `FactureProduits`
--

CREATE TABLE `FactureProduits` (
  `FactureID` int DEFAULT NULL,
  `ProduitID` int DEFAULT NULL,
  `Quantite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `FactureProduits`
--

INSERT INTO `FactureProduits` (`FactureID`, `ProduitID`, `Quantite`) VALUES
(1, 1, 20),
(1, 2, 30),
(1, 3, 10),
(2, 8, 25),
(2, 4, 32),
(3, 3, 80),
(3, 5, 70),
(3, 6, 60),
(3, 4, 60),
(3, 9, 120),
(3, 7, 90),
(4, 1, 10),
(4, 2, 10),
(4, 6, 30),
(5, 1, 25),
(5, 7, 34),
(6, 2, 40),
(6, 5, 38),
(6, 6, 54),
(7, 4, 20),
(7, 5, 34),
(7, 6, 45);

-- --------------------------------------------------------

--
-- Structure de la table `Factures`
--

CREATE TABLE `Factures` (
  `FactureID` int NOT NULL,
  `Numero` varchar(100) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ClientID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Factures`
--

INSERT INTO `Factures` (`FactureID`, `Numero`, `Date`, `ClientID`) VALUES
(1, 'MSQ291', '2018-06-15', 1),
(2, 'MSQ292', '2018-06-23', 1),
(3, 'MSQ293', '2018-06-23', 6),
(4, 'MSQ294', '2018-06-28', 1),
(5, 'MSQ295', '2018-07-01', 4),
(6, 'MSQ296', '2018-07-04', 7),
(7, 'MSQ297', '2018-07-12', 2);

-- --------------------------------------------------------

--
-- Structure de la table `Produits`
--

CREATE TABLE `Produits` (
  `ProduitID` int NOT NULL,
  `Nom` varchar(100) DEFAULT NULL,
  `Ref` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Abandonne` varchar(3) DEFAULT NULL,
  `Usine` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Produits`
--

INSERT INTO `Produits` (`ProduitID`, `Nom`, `Ref`, `Description`, `Abandonne`, `Usine`) VALUES
(1, 'Knutsen', 'OANT72', 'Table basse pour poser les bières', 'Non', 'Harald,Sverre'),
(2, 'Moen', 'OANT34', 'Chaise haute de bar', 'Oui', 'Harald,Sverre'),
(3, 'Eide', 'OANT67', 'Porte-serviettes pour 100 serviettes', 'Non', 'Harald,Olaf'),
(4, 'Gulbrandsen', 'LXAL34', 'Lit nuage en lévitation', 'Non', 'Olaf'),
(5, 'Naess', 'LXAL56', 'Table 128 convives', 'Non', 'Haral,Sverre,Olaf'),
(6, 'Lund', 'LXAL78', 'Bureau-cafetière électrique', 'Non', 'Haral,Olaf'),
(7, 'Dahl', 'LXAL12', 'Tiroir à ronds de serviette', 'Oui', 'Sverre,Olaf'),
(8, 'Ruud', 'OANT90', 'Bureau-lit conbiné', 'Non', 'Olaf'),
(9, 'Apfelgluk', 'OANT12', 'Panier à chien (ou à chat)', 'Non', 'Olaf');

-- --------------------------------------------------------

--
-- Structure de la table `Usines`
--

CREATE TABLE `Usines` (
  `UsineID` int NOT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `Ville` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Usines`
--

INSERT INTO `Usines` (`UsineID`, `Adresse`, `Ville`) VALUES
(1, 'Quai Pipervika', 'Oslo'),
(2, 'Rue Strangehagen', 'Bergen'),
(3, 'Place Nidaros', 'Trondheim');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`ClientID`);

--
-- Index pour la table `FactureProduits`
--
ALTER TABLE `FactureProduits`
  ADD KEY `FactureID` (`FactureID`),
  ADD KEY `ProduitID` (`ProduitID`);

--
-- Index pour la table `Factures`
--
ALTER TABLE `Factures`
  ADD PRIMARY KEY (`FactureID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Index pour la table `Produits`
--
ALTER TABLE `Produits`
  ADD PRIMARY KEY (`ProduitID`);

--
-- Index pour la table `Usines`
--
ALTER TABLE `Usines`
  ADD PRIMARY KEY (`UsineID`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `FactureProduits`
--
ALTER TABLE `FactureProduits`
  ADD CONSTRAINT `FactureProduits_ibfk_1` FOREIGN KEY (`FactureID`) REFERENCES `Factures` (`FactureID`),
  ADD CONSTRAINT `FactureProduits_ibfk_2` FOREIGN KEY (`ProduitID`) REFERENCES `Produits` (`ProduitID`);

--
-- Contraintes pour la table `Factures`
--
ALTER TABLE `Factures`
  ADD CONSTRAINT `Factures_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `Clients` (`ClientID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
