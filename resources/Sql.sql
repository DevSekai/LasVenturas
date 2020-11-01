-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 23 sep. 2020 à 22:50
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `testcity`
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` tinyint(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('bread', 'Pain', 1, 0, 1),
('chargeur', 'Chargeur', 1, 0, 1),
('water', 'Eau', 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`) VALUES
('unemployed', 'Sans emploi');

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Citoyen', 200, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(40) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `Statut` varchar(255) NOT NULL DEFAULT '{"Hunger":100,"Thrist":100}',
  `Sexe` varchar(6) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Birthday` varchar(10) DEFAULT NULL,
  `Taille` int(2) DEFAULT NULL,
  `Skin` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-1042.571,"y":-2746.193,"z":21.359,"heading":327.772}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`identifier`, `accounts`, `group`, `Statut`, `Sexe`, `FirstName`, `LastName`, `Birthday`, `Taille`, `Skin`, `inventory`, `job`, `job_grade`, `loadout`, `position`) VALUES
('3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', '{\"money\":3765,\"black_money\":0,\"bank\":15600}', 'admin', '{\"Hunger\":89,\"Thrist\":78}', 'Homme', 'Yan', 'Labray', '15/03/1996', 186, '{\"PantalonIndex2\":5,\"ChaussureIndex\":8,\"VesteIndex\":10,\"OeilIndex\":7,\"CheuveuxIndex\":1,\"BarbeIndex\":2,\"TshirtIndex2\":2,\"PantalonIndex\":5,\"ChaussureIndex2\":8,\"TshirtIndex\":3,\"DadIndex\":2,\"PedIndex\":\"mp_m_freemode_01\",\"CouleurIndex\":2,\"ArmsIndex\":1,\"MotherIndex\":3,\"VesteIndex2\":2}', '{\"water\":75,\"bread\":24}', 'unemployed', 0, '{\"weapon_switchblade\":{\"ammo\":50},\"weapon_flashlight\":{\"ammo\":50},\"weapon_ball\":{\"ammo\":50},\"weapon_bat\":{\"ammo\":50},\"WEAPON_SNSPISTOL\":{\"ammo\":50},\"weapon_knuckle\":{\"ammo\":50}}', '{\"heading\":180.3,\"x\":-664.0,\"y\":-948.4,\"z\":21.6}');

-- --------------------------------------------------------

--
-- Structure de la table `users_accessories`
--

CREATE TABLE `users_accessories` (
  `Id` int(11) NOT NULL,
  `Identifier` varchar(255) NOT NULL,
  `Accessoire` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Label` varchar(255) NOT NULL,
  `Part` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users_accessories`
--

INSERT INTO `users_accessories` (`Id`, `Identifier`, `Accessoire`, `Type`, `Label`, `Part`) VALUES
(18, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', '{\"acces_1\":10,\"acces_2\":2}', 'Veste', 'Veste #10', '1'),
(19, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', '{\"acces_1\":3,\"acces_2\":1}', 'Lunettes', 'Lunettes #3', '1');

-- --------------------------------------------------------

--
-- Structure de la table `users_tatoo`
--

CREATE TABLE `users_tatoo` (
  `Index` int(11) NOT NULL,
  `Identifier` varchar(255) NOT NULL,
  `Tatoo` varchar(255) NOT NULL,
  `Collection` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users_tenue`
--

CREATE TABLE `users_tenue` (
  `Id` int(11) NOT NULL,
  `Identifier` varchar(255) NOT NULL,
  `Label` varchar(255) NOT NULL,
  `Tenue` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `users_accessories`
--
ALTER TABLE `users_accessories`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `users_tatoo`
--
ALTER TABLE `users_tatoo`
  ADD PRIMARY KEY (`Index`);

--
-- Index pour la table `users_tenue`
--
ALTER TABLE `users_tenue`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users_accessories`
--
ALTER TABLE `users_accessories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `users_tatoo`
--
ALTER TABLE `users_tatoo`
  MODIFY `Index` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `users_tenue`
--
ALTER TABLE `users_tenue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
