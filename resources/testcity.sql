-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 25 déc. 2020 à 16:43
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

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'EMS', 1),
('society_ammu', 'Armurier', 1),
('society_ballas', 'Ballas', 1),
('society_dog', 'Legion Dog', 1),
('society_gouv', 'Gouvernement', 1),
('society_mecano', 'Mecnao', 1),
('society_police', 'LSPD', 1),
('society_tequilala', 'Tequi La La', 1),
('society_unicorn', 'Vanilla Unicorn', 1),
('society_vagos', 'Vagos', 1),
('society_weazel', 'Weazel News', 1);

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

--
-- Déchargement des données de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(11, 'society_ambulance', 0, NULL),
(12, 'society_dog', 0, NULL),
(13, 'society_gouv', 0, NULL),
(14, 'society_mecano', 0, NULL),
(15, 'society_police', 0, NULL),
(16, 'society_tequilala', 0, NULL),
(17, 'society_unicorn', 0, NULL),
(18, 'society_weazel', 0, NULL),
(19, 'society_ballas', 0, NULL),
(20, 'society_vagos', 0, NULL),
(21, 'society_ammu', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'EMS', 1),
('society_ammu', 'Armurier', 1),
('society_ballas', 'Ballas', 1),
('society_dog', 'Legion Dog', 1),
('society_gouv', 'Gouvernement', 1),
('society_mecano', 'Mecnao', 1),
('society_police', 'LSPD', 1),
('society_tequilala', 'Tequi La La', 1),
('society_unicorn', 'Vanilla Unicorn', 1),
('society_vagos', 'Vagos', 1),
('society_weazel', 'Weazel News', 1);

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

--
-- Déchargement des données de la table `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(2, 'society_ballas', 'water', 0, NULL),
(3, 'society_ballas', 'hotdog', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ambulance_report`
--

CREATE TABLE `ambulance_report` (
  `Id` int(11) NOT NULL,
  `Identifier` varchar(255) NOT NULL,
  `Date` varchar(255) NOT NULL,
  `Report` longtext NOT NULL
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
('bandage', 'Bandage', 1, 0, 1),
('bulletproof', 'Gilet par balles', 1, 0, 1),
('Carte sim', 'sim', 1, 0, 1),
('Coca', 'coca', 1, 0, 1),
('corde', 'Corde', 1, 0, 1),
('frite', 'Frites', 1, 0, 1),
('headbag', 'Sac', 1, 0, 1),
('hotdog', 'Hot-Dog', 1, 0, 1),
('hotdogbread', 'Pain à hot-dog', 1, 0, 1),
('medikit', 'Défibrillateur', 1, 0, 1),
('Pain', 'bread', 1, 0, 1),
('patate', 'Pomme de terre', 1, 0, 1),
('pistol', 'pistolet', 1, 0, 1),
('Sandwich', 'sandwich', 1, 0, 1),
('saucisse', 'Saucisse', 1, 0, 1),
('serfelx', 'Serflex', 1, 0, 1),
('silencieux', 'Silencieux', 1, 0, 1),
('Téléphone', 'phone', 1, 0, 1),
('water', 'Eau', 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `job2_grades`
--

CREATE TABLE `job2_grades` (
  `id` int(11) NOT NULL,
  `job2_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `job2_grades`
--

INSERT INTO `job2_grades` (`id`, `job2_name`, `grade`, `name`, `label`, `salary`) VALUES
(1, 'unemployed2', 0, 'unemployed2', 'None', 0),
(2, 'ballas', 0, 'recrue', 'Ambulancier', 0),
(3, 'ballas', 1, 'medium', 'Medecin', 0),
(4, 'ballas', 2, 'expert', 'Medecin-chef', 0),
(5, 'ballas', 3, 'boss', 'Og', 0),
(6, 'vagos', 0, 'recrue', 'Recrue', 0),
(7, 'vagos', 1, 'medium', 'Novice', 0),
(8, 'vagos', 2, 'expert', 'Expert', 0),
(9, 'vagos', 3, 'boss', 'Jefe', 0);

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
('ambulance', 'EMS'),
('ammu', 'Armurier'),
('dog', 'Legion Dog'),
('gouv', 'Gouvernement'),
('mecano', 'Mecano'),
('police', 'LSPD'),
('tequilala', 'Tequi La La'),
('unemployed', 'Sans emploi'),
('unicorn', 'Vanilla Unicorn'),
('weazel', 'Weazel News');

-- --------------------------------------------------------

--
-- Structure de la table `jobs2`
--

CREATE TABLE `jobs2` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `jobs2`
--

INSERT INTO `jobs2` (`name`, `label`) VALUES
('ballas', 'Ballas'),
('unemployed2', 'Unemployed2'),
('vagos', 'Vagos');

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
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Citoyen', 200),
(45, 'ambulance', 0, 'recrue', 'Ambulancier', 0),
(46, 'ambulance', 1, 'medium', 'Medecin', 0),
(47, 'ambulance', 2, 'expert', 'Medecin-chef', 0),
(48, 'ambulance', 3, 'boss', 'Directeur', 0),
(49, 'police', 0, 'recrue', 'Recrue', 0),
(50, 'police', 1, 'medium', 'Officier', 0),
(51, 'police', 2, 'expert', 'Sergent', 0),
(52, 'police', 3, 'expert2', 'Lieutenant', 0),
(53, 'police', 4, 'boss', 'Commandant', 0),
(54, 'mecano', 0, 'recrue', 'Recrue', 0),
(55, 'mecano', 1, 'medium', 'Novice', 0),
(56, 'mecano', 2, 'expert', 'Expert', 0),
(57, 'mecano', 3, 'boss', 'PDG', 0),
(58, 'weazel', 0, 'recrue', 'Assistant', 0),
(59, 'weazel', 1, 'medium', 'Perchiste', 0),
(60, 'weazel', 2, 'expert', 'Rédacteur', 0),
(61, 'weazel', 3, 'boss', 'PDG', 0),
(62, 'unicorn', 0, 'recrue', 'Videur', 0),
(63, 'unicorn', 1, 'medium', 'Danseuse', 0),
(64, 'unicorn', 2, 'expert', 'Barman', 0),
(65, 'unicorn', 3, 'boss', 'PDG', 0),
(66, 'tequilala', 0, 'recrue', 'Videur', 0),
(67, 'tequilala', 1, 'medium', 'Musicien', 0),
(68, 'tequilala', 2, 'expert', 'Barman', 0),
(69, 'tequilala', 3, 'boss', 'PDG', 0),
(70, 'gouv', 0, 'recrue', 'Assistant', 0),
(71, 'gouv', 1, 'medium', 'Secrétaire', 0),
(72, 'gouv', 2, 'expert', 'Procureur', 0),
(73, 'gouv', 3, 'boss', 'Gouverneur', 0),
(74, 'dog', 0, 'recrue', 'Livreur', 0),
(75, 'dog', 1, 'medium', 'Cuisinier', 0),
(76, 'dog', 2, 'expert', 'Manager', 0),
(77, 'dog', 3, 'boss', 'Dirigeant', 0),
(78, 'ammu', 0, 'employer', 'Armurier', 300),
(79, 'ammu', 1, 'boss', 'Armurier', 300);

-- --------------------------------------------------------

--
-- Structure de la table `police_report`
--

CREATE TABLE `police_report` (
  `Id` int(11) NOT NULL,
  `Identifier` varchar(255) NOT NULL,
  `Date` varchar(255) NOT NULL,
  `Report` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `Id` int(11) NOT NULL,
  `Plate` varchar(8) NOT NULL,
  `ItemName` varchar(255) NOT NULL,
  `ItemCount` int(11) NOT NULL,
  `ItemLabel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `trunk_inventory`
--

INSERT INTO `trunk_inventory` (`Id`, `Plate`, `ItemName`, `ItemCount`, `ItemLabel`) VALUES
(24, '66BBU125', 'water', 0, 'Eau'),
(25, '63GCQ354', 'water', 0, 'Eau'),
(26, '28YTE718', 'water', 0, 'Eau'),
(27, '66MCM102', 'water', 1, 'Eau'),
(28, '89DKH838', 'water', 2, 'Eau');

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
  `Skin` longtext DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Birthday` varchar(10) DEFAULT NULL,
  `Taille` int(3) DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(20) NOT NULL DEFAULT 'unemployed2',
  `job2_grade` int(11) NOT NULL DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-1042.571,"y":-2746.193,"z":21.359,"heading":327.772}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`identifier`, `accounts`, `group`, `Statut`, `Sexe`, `Skin`, `FirstName`, `LastName`, `Birthday`, `Taille`, `inventory`, `job`, `job_grade`, `job2`, `job2_grade`, `loadout`, `position`) VALUES
('3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', '{\"black_money\":0,\"money\":2252,\"bank\":4000}', 'admin', '{\"Hunger\":100,\"Thrist\":100}', 'Homme', '{\"ArmsIndex\":2,\"ChaussureIndex2\":4,\"DadIndex\":2,\"ChaussureIndex\":7,\"TshirtIndex2\":7,\"PantalonIndex2\":9,\"PantalonIndex\":9,\"VesteIndex2\":3,\"VesteIndex\":6,\"TshirtIndex\":6,\"BarbeIndex\":3,\"PedIndex\":\"mp_m_freemode_01\",\"OeilIndex\":3,\"MotherIndex\":2,\"CouleurIndex\":2,\"CheuveuxIndex\":4}', 'Yan', 'Labray', '15/03/1996', 186, '{\"water\":897,\"pistol\":448}', 'ambulance', 3, 'ballas', 0, '{\"WEAPON_PISTOL\":{\"ammo\":178},\"weapon_nightstick\":{\"ammo\":250},\"weapon_flashlight\":{\"ammo\":250},\"WEAPON_RPG\":{\"ammo\":0}}', '{\"x\":965.3,\"y\":142.1,\"z\":81.0,\"heading\":149.0}');

-- --------------------------------------------------------

--
-- Structure de la table `users_accessories`
--

CREATE TABLE `users_accessories` (
  `Id` int(11) NOT NULL,
  `Identifier` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Stuff` varchar(255) NOT NULL,
  `Label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users_bans`
--

CREATE TABLE `users_bans` (
  `Id` int(11) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `Identifier` varchar(255) NOT NULL,
  `Banned` tinyint(1) NOT NULL,
  `Reason` varchar(255) NOT NULL,
  `BannedBy` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Structure de la table `users_vehicles`
--

CREATE TABLE `users_vehicles` (
  `Id` int(11) NOT NULL,
  `Identifier` varchar(255) NOT NULL,
  `Label` varchar(255) NOT NULL,
  `Hash` varchar(255) NOT NULL,
  `Plate` varchar(255) NOT NULL,
  `Props` longtext NOT NULL,
  `Health` int(11) NOT NULL,
  `Stored` tinyint(1) NOT NULL DEFAULT 0,
  `Ensure` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users_warns`
--

CREATE TABLE `users_warns` (
  `Id` int(11) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `Identifier` varchar(255) NOT NULL,
  `Reason` varchar(255) NOT NULL,
  `WarnedBy` varchar(255) NOT NULL
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
-- Index pour la table `ambulance_report`
--
ALTER TABLE `ambulance_report`
  ADD PRIMARY KEY (`Id`);

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
-- Index pour la table `job2_grades`
--
ALTER TABLE `job2_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `jobs2`
--
ALTER TABLE `jobs2`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `police_report`
--
ALTER TABLE `police_report`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`Id`);

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
-- Index pour la table `users_bans`
--
ALTER TABLE `users_bans`
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
-- Index pour la table `users_vehicles`
--
ALTER TABLE `users_vehicles`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `users_warns`
--
ALTER TABLE `users_warns`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ambulance_report`
--
ALTER TABLE `ambulance_report`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job2_grades`
--
ALTER TABLE `job2_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT pour la table `police_report`
--
ALTER TABLE `police_report`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `users_accessories`
--
ALTER TABLE `users_accessories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `users_bans`
--
ALTER TABLE `users_bans`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `users_tatoo`
--
ALTER TABLE `users_tatoo`
  MODIFY `Index` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `users_tenue`
--
ALTER TABLE `users_tenue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users_vehicles`
--
ALTER TABLE `users_vehicles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT pour la table `users_warns`
--
ALTER TABLE `users_warns`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
