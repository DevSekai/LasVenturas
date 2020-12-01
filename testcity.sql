-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 01 déc. 2020 à 22:49
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
('bulletproof', 'Gilet par balles', 1, 0, 1),
('Carte sim', 'sim', 1, 0, 1),
('Coca', 'coca', 1, 0, 1),
('corde', 'Corde', 1, 0, 1),
('headbag', 'Sac', 1, 0, 1),
('Pain', 'bread', 1, 0, 1),
('Sandwich', 'sandwich', 1, 0, 1),
('serfelx', 'Serflex', 1, 0, 1),
('silencieux', 'Silencieux', 1, 0, 1),
('Téléphone', 'phone', 1, 0, 1),
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
  `Skin` longtext DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Birthday` varchar(10) DEFAULT NULL,
  `Taille` int(3) DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-1042.571,"y":-2746.193,"z":21.359,"heading":327.772}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`identifier`, `accounts`, `group`, `Statut`, `Sexe`, `Skin`, `FirstName`, `LastName`, `Birthday`, `Taille`, `inventory`, `job`, `job_grade`, `loadout`, `position`) VALUES
('3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', '{\"jeton\":0,\"black_money\":0,\"bank\":45800,\"money\":841681202818}', 'admin', '{\"Hunger\":100,\"Thrist\":100}', 'Homme', '{\"ArmsIndex\":2,\"ChaussureIndex2\":4,\"DadIndex\":2,\"ChaussureIndex\":7,\"TshirtIndex2\":7,\"PantalonIndex2\":9,\"PantalonIndex\":9,\"VesteIndex2\":3,\"VesteIndex\":6,\"TshirtIndex\":6,\"BarbeIndex\":3,\"PedIndex\":\"mp_m_freemode_01\",\"OeilIndex\":3,\"MotherIndex\":2,\"CouleurIndex\":2,\"CheuveuxIndex\":4}', 'Yan', 'Labray', '15/03/1996', 186, '{\"water\":5}', 'unemployed', 0, '[]', '{\"y\":-1098.3,\"x\":-45.6,\"heading\":57.4,\"z\":26.4}');

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

--
-- Déchargement des données de la table `users_accessories`
--

INSERT INTO `users_accessories` (`Id`, `Identifier`, `Type`, `Stuff`, `Label`) VALUES
(5, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Tshirt', '{\"Index\":3,\"Color\":1}', 'Tshirt #3'),
(6, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Vestes', '{\"Index\":4,\"Color\":2}', 'Vestes #4'),
(7, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Pantalons', '{\"Index\":5,\"Color\":5}', 'Pantalons #5'),
(8, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Chaussures', '{\"Index\":7,\"Color\":4}', 'Test'),
(9, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Lunettes', '{\"Index\":8,\"Color\":5}', 'Lunettes #8'),
(10, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Boucles', '{\"Index\":7,\"Color\":1}', 'Boucles #7'),
(11, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Chaines', '{\"Index\":31,\"Color\":0}', 'Chaines #31'),
(12, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Chapeaux', '{\"Color\":2,\"Index\":3}', 'Chapeaux #3'),
(13, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Masque', '{\"Index\":24,\"Color\":1}', 'Masque #24');

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
-- Structure de la table `users_calendar`
--

CREATE TABLE `users_calendar` (
  `Id` int(11) NOT NULL,
  `identifier` varchar(25) NOT NULL,
  `Calendar` longtext NOT NULL
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

--
-- Déchargement des données de la table `users_tatoo`
--

INSERT INTO `users_tatoo` (`Index`, `Identifier`, `Tatoo`, `Collection`) VALUES
(13, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'MP_Buis_F_Neck_001', 'mpbusiness_overlays');

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

--
-- Déchargement des données de la table `users_vehicles`
--

INSERT INTO `users_vehicles` (`Id`, `Identifier`, `Label`, `Hash`, `Plate`, `Props`, `Health`, `Stored`, `Ensure`) VALUES
(6, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Pfister810', 'pfister811', 'JQ 584ON', '{\"modSteeringWheel\":-1,\"modOrnaments\":-1,\"neonColor\":[255,0,255],\"modSpeakers\":-1,\"modPlateHolder\":-1,\"modRoof\":-1,\"modStruts\":-1,\"modSeats\":-1,\"modHydrolic\":-1,\"modXenon\":false,\"modShifterLeavers\":-1,\"modWindows\":-1,\"modDoorSpeaker\":-1,\"modAerials\":-1,\"windowTint\":-1,\"modDial\":-1,\"modTank\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"tankHealth\":1000.0,\"plateIndex\":0,\"fuelLevel\":60.0,\"modRightFender\":-1,\"engineHealth\":1000.0,\"color2\":57,\"bodyHealth\":1000.0,\"wheels\":7,\"modSmokeEnabled\":false,\"modArmor\":-1,\"modTurbo\":false,\"modRearBumper\":-1,\"modHorns\":-1,\"modDashboard\":-1,\"modFender\":-1,\"modTrimA\":-1,\"modFrame\":-1,\"modTransmission\":-1,\"xenonColor\":255,\"modBrakes\":-1,\"modSpoilers\":-1,\"neonEnabled\":[false,false,false,false],\"modEngine\":-1,\"modFrontBumper\":-1,\"modTrimB\":-1,\"color1\":0,\"modExhaust\":-1,\"tyreSmokeColor\":[255,255,255],\"modBackWheels\":-1,\"modTrunk\":-1,\"modLivery\":-1,\"dirtLevel\":3.0,\"wheelColor\":156,\"model\":-1829802492,\"modArchCover\":-1,\"plate\":\"JQ 584ON\",\"pearlescentColor\":92,\"modHood\":-1,\"modAPlate\":-1,\"modVanityPlate\":-1,\"modSuspension\":-1,\"modEngineBlock\":-1,\"extras\":{\"1\":true},\"modSideSkirt\":-1,\"modAirFilter\":-1}', 999, 0, 1),
(7, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Penetrator', 'penetrator', 'DZ 747RT', '{\"modArmor\":-1,\"modDashboard\":-1,\"modSteeringWheel\":-1,\"wheels\":0,\"modTrimA\":-1,\"windowTint\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"plateIndex\":0,\"neonEnabled\":[false,false,false,false],\"modFrame\":-1,\"bodyHealth\":1000.0,\"modSpeakers\":-1,\"modStruts\":-1,\"modHood\":-1,\"modFender\":-1,\"modTank\":-1,\"modFrontBumper\":-1,\"modSuspension\":-1,\"modHydrolic\":-1,\"modArchCover\":-1,\"modHorns\":-1,\"modWindows\":-1,\"plate\":\"DZ 747RT\",\"wheelColor\":156,\"modPlateHolder\":-1,\"modLivery\":-1,\"modDoorSpeaker\":-1,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"model\":-1758137366,\"modEngine\":-1,\"modAirFilter\":-1,\"xenonColor\":255,\"modEngineBlock\":-1,\"modSpoilers\":-1,\"color1\":32,\"modRoof\":-1,\"modSeats\":-1,\"modSideSkirt\":-1,\"modAerials\":-1,\"modExhaust\":-1,\"extras\":[],\"modTransmission\":-1,\"neonColor\":[255,0,255],\"tankHealth\":1000.0,\"modTrunk\":-1,\"modOrnaments\":-1,\"engineHealth\":1000.0,\"dirtLevel\":3.0,\"modBrakes\":-1,\"modBackWheels\":-1,\"modRearBumper\":-1,\"color2\":4,\"modXenon\":false,\"modAPlate\":-1,\"modRightFender\":-1,\"modShifterLeavers\":-1,\"pearlescentColor\":18,\"fuelLevel\":65.0,\"modSmokeEnabled\":false,\"modTurbo\":false,\"modTrimB\":-1,\"modDial\":-1}', 1000, 1, 1),
(8, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Torero', 'torero', 'PF 703PF', '{\"neonColor\":[255,0,255],\"modEngine\":-1,\"modArchCover\":-1,\"color2\":0,\"modPlateHolder\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":false,\"modHood\":-1,\"modShifterLeavers\":-1,\"modTrunk\":-1,\"modRoof\":-1,\"modRightFender\":-1,\"modTurbo\":false,\"extras\":[],\"modWindows\":-1,\"pearlescentColor\":0,\"modSpoilers\":-1,\"modTank\":-1,\"modTrimA\":-1,\"modSteeringWheel\":-1,\"modFrame\":-1,\"modVanityPlate\":-1,\"wheelColor\":156,\"modSideSkirt\":-1,\"engineHealth\":1000.0,\"color1\":0,\"wheels\":7,\"modFrontBumper\":-1,\"modGrille\":-1,\"dirtLevel\":0.0,\"modXenon\":false,\"bodyHealth\":1000.0,\"modTransmission\":-1,\"plateIndex\":0,\"modFender\":-1,\"modBackWheels\":-1,\"modTrimB\":-1,\"modStruts\":-1,\"modAPlate\":-1,\"modArmor\":-1,\"modExhaust\":-1,\"modSuspension\":-1,\"modEngineBlock\":-1,\"xenonColor\":255,\"modAerials\":-1,\"fuelLevel\":65.0,\"modOrnaments\":-1,\"tankHealth\":1000.0,\"modHorns\":-1,\"tyreSmokeColor\":[255,255,255],\"modDashboard\":-1,\"modHydrolic\":-1,\"model\":1504306544,\"neonEnabled\":[false,false,false,false],\"modLivery\":-1,\"windowTint\":-1,\"modRearBumper\":-1,\"plate\":\"PF 703PF\",\"modDial\":-1,\"modDoorSpeaker\":-1,\"modFrontWheels\":-1,\"modAirFilter\":-1}', 1000, 0, 1),
(9, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Taipan', 'taipan', 'FG 164FG', '{\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modTrimB\":-1,\"neonColor\":[255,0,255],\"color1\":11,\"modFrame\":-1,\"modEngineBlock\":-1,\"modHood\":-1,\"modSeats\":-1,\"plateIndex\":0,\"modAPlate\":-1,\"windowTint\":-1,\"modGrille\":-1,\"modExhaust\":-1,\"modSmokeEnabled\":false,\"modXenon\":false,\"bodyHealth\":1000.0,\"modRoof\":-1,\"color2\":38,\"pearlescentColor\":7,\"engineHealth\":1000.0,\"modArmor\":-1,\"modTrunk\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"modDial\":-1,\"modTank\":-1,\"modOrnaments\":-1,\"modSpeakers\":-1,\"modAerials\":-1,\"modDoorSpeaker\":-1,\"modSpoilers\":-1,\"dirtLevel\":6.0,\"modStruts\":-1,\"modLivery\":-1,\"modSuspension\":-1,\"modPlateHolder\":-1,\"model\":-1134706562,\"wheels\":7,\"neonEnabled\":[false,false,false,false],\"modTransmission\":-1,\"modHorns\":-1,\"modArchCover\":-1,\"modFender\":-1,\"extras\":[],\"modTurbo\":false,\"modRightFender\":-1,\"modBrakes\":-1,\"modDashboard\":-1,\"modTrimA\":-1,\"tankHealth\":1000.0,\"modVanityPlate\":-1,\"modAirFilter\":-1,\"modFrontBumper\":-1,\"plate\":\"FG 164FG\",\"modShifterLeavers\":-1,\"modRearBumper\":-1,\"modEngine\":-1,\"fuelLevel\":65.0,\"wheelColor\":38,\"modWindows\":-1,\"tyreSmokeColor\":[255,255,255],\"xenonColor\":255,\"modSteeringWheel\":-1}', 1000, 0, 0),
(10, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Infernus', 'infernus2', 'CQ 081CQ', '{\"modEngine\":-1,\"modRearBumper\":-1,\"wheels\":7,\"modSideSkirt\":-1,\"modTurbo\":false,\"modBrakes\":-1,\"modSpoilers\":-1,\"modDoorSpeaker\":-1,\"modWindows\":-1,\"color1\":145,\"modXenon\":false,\"modBackWheels\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modLivery\":-1,\"modTrunk\":-1,\"tankHealth\":1000.0,\"xenonColor\":255,\"plateIndex\":0,\"modDashboard\":-1,\"modShifterLeavers\":-1,\"modFender\":-1,\"fuelLevel\":65.0,\"modAPlate\":-1,\"model\":-1405937764,\"modFrontBumper\":-1,\"modHydrolic\":-1,\"dirtLevel\":5.0,\"modGrille\":-1,\"wheelColor\":112,\"modHood\":-1,\"modSmokeEnabled\":false,\"modTank\":-1,\"pearlescentColor\":18,\"modRightFender\":-1,\"color2\":0,\"modPlateHolder\":-1,\"tyreSmokeColor\":[255,255,255],\"modAirFilter\":-1,\"modOrnaments\":-1,\"modFrontWheels\":-1,\"modAerials\":-1,\"modStruts\":-1,\"extras\":[],\"modArmor\":-1,\"modFrame\":-1,\"modExhaust\":-1,\"bodyHealth\":1000.0,\"modDial\":-1,\"modSpeakers\":-1,\"engineHealth\":1000.0,\"modSeats\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"modVanityPlate\":-1,\"plate\":\"CQ 081CQ\",\"neonColor\":[255,0,255],\"modRoof\":-1,\"modEngineBlock\":-1,\"modArchCover\":-1,\"modHorns\":-1,\"modTransmission\":-1,\"neonEnabled\":[false,false,false,false],\"modTrimB\":-1}', 1000, 0, 0),
(11, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Xa21', 'xa21', 'KO 677KO', '{\"fuelLevel\":65.0,\"modSpoilers\":-1,\"model\":917809321,\"modTrimA\":-1,\"modEngineBlock\":-1,\"modPlateHolder\":-1,\"xenonColor\":255,\"extras\":[],\"modFrontBumper\":-1,\"modShifterLeavers\":-1,\"modXenon\":false,\"modHorns\":-1,\"plate\":\"KO 677KO\",\"modRearBumper\":-1,\"bodyHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modHydrolic\":-1,\"wheels\":7,\"modSteeringWheel\":-1,\"modSeats\":-1,\"modOrnaments\":-1,\"plateIndex\":0,\"neonColor\":[255,0,255],\"wheelColor\":5,\"modRoof\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrame\":-1,\"modDial\":-1,\"modSpeakers\":-1,\"modTrimB\":-1,\"modSideSkirt\":-1,\"tankHealth\":1000.0,\"modEngine\":-1,\"dirtLevel\":0.0,\"modGrille\":-1,\"modTurbo\":false,\"modLivery\":-1,\"modRightFender\":-1,\"modSuspension\":-1,\"modAirFilter\":-1,\"modVanityPlate\":-1,\"modWindows\":-1,\"color1\":29,\"modSmokeEnabled\":false,\"modHood\":-1,\"engineHealth\":1000.0,\"windowTint\":-1,\"modDashboard\":-1,\"modTransmission\":-1,\"modFrontWheels\":-1,\"color2\":7,\"modAPlate\":-1,\"modArchCover\":-1,\"modTank\":-1,\"pearlescentColor\":5,\"modDoorSpeaker\":-1,\"modArmor\":-1,\"modAerials\":-1,\"modFender\":-1,\"modTrunk\":-1,\"modExhaust\":-1,\"modBackWheels\":-1,\"modBrakes\":-1,\"modStruts\":-1}', 1000, 0, 0),
(12, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Penetrator', 'penetrator', 'TR 332TR', '{\"modLivery\":-1,\"modWindows\":-1,\"tankHealth\":1000.0,\"wheels\":0,\"tyreSmokeColor\":[255,255,255],\"modGrille\":-1,\"modSeats\":-1,\"modArmor\":-1,\"modXenon\":false,\"pearlescentColor\":18,\"modStruts\":-1,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"modTurbo\":false,\"modExhaust\":-1,\"color2\":4,\"modFender\":-1,\"modTrimB\":-1,\"model\":-1758137366,\"modArchCover\":-1,\"modFrame\":-1,\"modSpeakers\":-1,\"modHorns\":-1,\"modTank\":-1,\"xenonColor\":255,\"wheelColor\":156,\"plate\":\"TR 332TR\",\"modBrakes\":-1,\"modTransmission\":-1,\"modFrontWheels\":-1,\"modSuspension\":-1,\"modVanityPlate\":-1,\"modRightFender\":-1,\"bodyHealth\":1000.0,\"modHood\":-1,\"plateIndex\":0,\"windowTint\":-1,\"modSmokeEnabled\":false,\"modAirFilter\":-1,\"modRoof\":-1,\"modAerials\":-1,\"modHydrolic\":-1,\"modShifterLeavers\":-1,\"modDial\":-1,\"modEngineBlock\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"modBackWheels\":-1,\"modDashboard\":-1,\"modDoorSpeaker\":-1,\"modTrunk\":-1,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"fuelLevel\":65.0,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modAPlate\":-1,\"dirtLevel\":3.0,\"neonEnabled\":[false,false,false,false],\"extras\":[],\"color1\":32,\"modSpoilers\":-1,\"modEngine\":-1,\"modOrnaments\":-1}', 1000, 0, 0),
(13, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'TurismoR', 'turismor', 'TV 343TV', '{\"modTransmission\":-1,\"modHydrolic\":-1,\"modAerials\":-1,\"modEngineBlock\":-1,\"modFender\":-1,\"color2\":0,\"modAPlate\":-1,\"modRearBumper\":-1,\"modFrame\":-1,\"modSeats\":-1,\"engineHealth\":1000.0,\"tyreSmokeColor\":[255,255,255],\"modFrontWheels\":-1,\"modSideSkirt\":-1,\"bodyHealth\":1000.0,\"modSuspension\":-1,\"model\":408192225,\"neonEnabled\":[false,false,false,false],\"modEngine\":-1,\"modDial\":-1,\"modSmokeEnabled\":false,\"color1\":1,\"modAirFilter\":-1,\"modLivery\":-1,\"modExhaust\":-1,\"modBackWheels\":-1,\"modTank\":-1,\"wheels\":7,\"modShifterLeavers\":-1,\"modRightFender\":-1,\"fuelLevel\":60.0,\"dirtLevel\":2.0,\"modStruts\":-1,\"modBrakes\":-1,\"modXenon\":false,\"plate\":\"TV 343TV\",\"modSpoilers\":-1,\"windowTint\":-1,\"modDoorSpeaker\":-1,\"modGrille\":-1,\"modDashboard\":-1,\"modHorns\":-1,\"wheelColor\":156,\"modArchCover\":-1,\"modRoof\":-1,\"modWindows\":-1,\"modOrnaments\":-1,\"neonColor\":[255,0,255],\"extras\":[],\"modTrimB\":-1,\"modTrimA\":-1,\"tankHealth\":1000.0,\"modSteeringWheel\":-1,\"xenonColor\":255,\"modTurbo\":false,\"plateIndex\":0,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"modSpeakers\":-1,\"modFrontBumper\":-1,\"modTrunk\":-1,\"modHood\":-1,\"modArmor\":-1,\"pearlescentColor\":4}', 1000, 0, 0),
(14, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Autrach', 'autarch', 'EG 017EG', '{\"modRightFender\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modTrimA\":-1,\"tankHealth\":1000.0,\"color2\":36,\"modLivery\":-1,\"modXenon\":false,\"modTurbo\":false,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"extras\":[],\"wheelColor\":12,\"modHorns\":-1,\"modTank\":-1,\"modWindows\":-1,\"modAirFilter\":-1,\"tyreSmokeColor\":[255,255,255],\"modHydrolic\":-1,\"wheels\":7,\"modArmor\":-1,\"modTransmission\":-1,\"modRearBumper\":-1,\"modVanityPlate\":-1,\"modArchCover\":-1,\"plateIndex\":0,\"modTrimB\":-1,\"modFrame\":-1,\"fuelLevel\":65.0,\"modFrontWheels\":-1,\"modRoof\":-1,\"modShifterLeavers\":-1,\"modDial\":-1,\"modStruts\":-1,\"modHood\":-1,\"modEngine\":-1,\"modBrakes\":-1,\"modTrunk\":-1,\"model\":-313185164,\"modOrnaments\":-1,\"modExhaust\":-1,\"modAerials\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modSpoilers\":-1,\"dirtLevel\":3.0,\"modAPlate\":-1,\"neonColor\":[255,0,255],\"modFender\":-1,\"modGrille\":-1,\"color1\":36,\"modSeats\":-1,\"bodyHealth\":1000.0,\"modEngineBlock\":-1,\"pearlescentColor\":88,\"modBackWheels\":-1,\"modSideSkirt\":-1,\"plate\":\"EG 017EG\",\"engineHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modSuspension\":-1,\"modPlateHolder\":-1,\"xenonColor\":255,\"modSmokeEnabled\":false}', 1000, 0, 0),
(15, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'GT500', 'gt500', 'ST 880ST', '{\"modRightFender\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modTrimA\":-1,\"tankHealth\":1000.0,\"color2\":111,\"modLivery\":-1,\"modXenon\":false,\"modTurbo\":false,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"extras\":[],\"wheelColor\":111,\"modHorns\":-1,\"modTank\":-1,\"modWindows\":-1,\"modAirFilter\":-1,\"tyreSmokeColor\":[255,255,255],\"modHydrolic\":-1,\"wheels\":2,\"modArmor\":-1,\"modTransmission\":-1,\"modRearBumper\":-1,\"modVanityPlate\":-1,\"modArchCover\":-1,\"plateIndex\":0,\"modTrimB\":-1,\"modFrame\":-1,\"fuelLevel\":65.0,\"modFrontWheels\":-1,\"modRoof\":-1,\"modShifterLeavers\":-1,\"modDial\":-1,\"modStruts\":-1,\"modHood\":-1,\"modEngine\":-1,\"modBrakes\":-1,\"modTrunk\":-1,\"model\":-2079788230,\"modOrnaments\":-1,\"modExhaust\":-1,\"modAerials\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modSpoilers\":-1,\"dirtLevel\":4.0,\"modAPlate\":-1,\"neonColor\":[255,0,255],\"modFender\":-1,\"modGrille\":-1,\"color1\":111,\"modSeats\":-1,\"bodyHealth\":1000.0,\"modEngineBlock\":-1,\"pearlescentColor\":111,\"modBackWheels\":-1,\"modSideSkirt\":-1,\"plate\":\"ST 880ST\",\"engineHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modSuspension\":-1,\"modPlateHolder\":-1,\"xenonColor\":255,\"modSmokeEnabled\":false}', 1000, 0, 0),
(16, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'GB200', 'gb200', 'RN 823RN', '{\"modHydrolic\":-1,\"modSeats\":-1,\"plateIndex\":0,\"xenonColor\":255,\"modArmor\":-1,\"modFrame\":-1,\"modAirFilter\":-1,\"tankHealth\":1000.0,\"modSteeringWheel\":-1,\"modSpeakers\":-1,\"modFender\":-1,\"wheels\":7,\"modSmokeEnabled\":false,\"modEngineBlock\":-1,\"model\":1909189272,\"windowTint\":-1,\"pearlescentColor\":18,\"modHood\":-1,\"modTank\":-1,\"modTrunk\":-1,\"modShifterLeavers\":-1,\"modAerials\":-1,\"engineHealth\":1000.0,\"modBackWheels\":-1,\"modTrimB\":-1,\"fuelLevel\":65.0,\"color1\":12,\"modHorns\":-1,\"modXenon\":false,\"modVanityPlate\":-1,\"modTransmission\":-1,\"modExhaust\":-1,\"modStruts\":-1,\"modDial\":-1,\"extras\":[],\"modTrimA\":-1,\"color2\":12,\"wheelColor\":158,\"modTurbo\":false,\"modPlateHolder\":-1,\"modArchCover\":-1,\"tyreSmokeColor\":[255,255,255],\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"modLivery\":-1,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"modDashboard\":-1,\"modSpoilers\":-1,\"modWindows\":-1,\"modFrontWheels\":-1,\"modFrontBumper\":-1,\"modOrnaments\":-1,\"modSideSkirt\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"neonEnabled\":[false,false,false,false],\"modRoof\":-1,\"plate\":\"RN 823RN\",\"dirtLevel\":13.0,\"modGrille\":-1,\"bodyHealth\":1000.0,\"modAPlate\":-1}', 1000, 0, 0),
(17, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Panto', 'panto', 'EC 556EC', '{\"modPlateHolder\":-1,\"modTrunk\":-1,\"color2\":3,\"modVanityPlate\":-1,\"neonColor\":[255,0,255],\"modTurbo\":false,\"modSpeakers\":-1,\"modArmor\":-1,\"modTank\":-1,\"wheelColor\":156,\"modFrontBumper\":-1,\"modGrille\":-1,\"modAPlate\":-1,\"modRightFender\":-1,\"modFrontWheels\":-1,\"modExhaust\":-1,\"modLivery\":-1,\"modFender\":-1,\"modRoof\":-1,\"modSteeringWheel\":-1,\"tyreSmokeColor\":[255,255,255],\"xenonColor\":255,\"modTrimB\":-1,\"modAerials\":-1,\"modXenon\":false,\"modWindows\":-1,\"dirtLevel\":8.0,\"extras\":{\"4\":true,\"3\":true,\"5\":true,\"2\":true,\"1\":true},\"tankHealth\":1000.0,\"modEngine\":-1,\"modRearBumper\":-1,\"wheels\":5,\"modBrakes\":-1,\"modDoorSpeaker\":-1,\"modBackWheels\":-1,\"modHydrolic\":-1,\"model\":-431692672,\"modHood\":-1,\"modStruts\":-1,\"modEngineBlock\":-1,\"plate\":\"EC 556EC\",\"modDashboard\":-1,\"color1\":3,\"modSeats\":-1,\"neonEnabled\":[false,false,false,false],\"modOrnaments\":-1,\"modSideSkirt\":-1,\"modDial\":-1,\"modTrimA\":-1,\"modHorns\":-1,\"pearlescentColor\":0,\"modTransmission\":-1,\"fuelLevel\":65.0,\"modArchCover\":-1,\"engineHealth\":1000.0,\"modAirFilter\":-1,\"modSuspension\":-1,\"plateIndex\":3,\"bodyHealth\":1000.0,\"modShifterLeavers\":-1,\"windowTint\":-1,\"modSpoilers\":-1,\"modFrame\":-1,\"modSmokeEnabled\":false}', 1000, 0, 0),
(18, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Panto', 'panto', 'NQ 781NQ', '{\"modTank\":-1,\"modSpeakers\":-1,\"modSuspension\":-1,\"modDashboard\":-1,\"modHood\":-1,\"modWindows\":-1,\"modArchCover\":-1,\"modHydrolic\":-1,\"modAerials\":-1,\"plate\":\"NQ 781NQ\",\"windowTint\":-1,\"engineHealth\":1000.0,\"modFrame\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrimB\":-1,\"modSpoilers\":-1,\"color1\":32,\"modGrille\":-1,\"modEngine\":-1,\"wheelColor\":156,\"modFrontBumper\":-1,\"modLivery\":-1,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"plateIndex\":3,\"modAPlate\":-1,\"xenonColor\":255,\"modExhaust\":-1,\"modEngineBlock\":-1,\"modTurbo\":false,\"modBrakes\":-1,\"modSmokeEnabled\":false,\"modTransmission\":-1,\"modSideSkirt\":-1,\"modAirFilter\":-1,\"fuelLevel\":65.0,\"modOrnaments\":-1,\"neonColor\":[255,0,255],\"modSteeringWheel\":-1,\"modBackWheels\":-1,\"modXenon\":false,\"modRoof\":-1,\"modFrontWheels\":-1,\"modArmor\":-1,\"color2\":32,\"model\":-431692672,\"dirtLevel\":7.0,\"modFender\":-1,\"modPlateHolder\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modRearBumper\":-1,\"modTrunk\":-1,\"tankHealth\":1000.0,\"extras\":{\"1\":true,\"2\":true,\"3\":true,\"4\":true,\"5\":true},\"modVanityPlate\":-1,\"modHorns\":-1,\"wheels\":5,\"modDial\":-1,\"pearlescentColor\":0,\"bodyHealth\":1000.0,\"modStruts\":-1,\"modDoorSpeaker\":-1,\"modRightFender\":-1}', 1000, 0, 0),
(19, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Kanjo', 'kanjo', 'TY 399TY', '{\"modWindows\":-1,\"bodyHealth\":1000.0,\"fuelLevel\":65.0,\"model\":409049982,\"modExhaust\":-1,\"modArchCover\":-1,\"modStruts\":-1,\"modRoof\":-1,\"modArmor\":-1,\"modAerials\":-1,\"modFrontBumper\":-1,\"modVanityPlate\":-1,\"color1\":0,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"tankHealth\":1000.0,\"modPlateHolder\":-1,\"color2\":0,\"plate\":\"TY 399TY\",\"neonColor\":[255,0,255],\"modHorns\":-1,\"modBackWheels\":-1,\"modSteeringWheel\":-1,\"modAirFilter\":-1,\"modTrunk\":-1,\"modLivery\":-1,\"modDoorSpeaker\":-1,\"modRearBumper\":-1,\"modEngineBlock\":-1,\"plateIndex\":0,\"modBrakes\":-1,\"neonEnabled\":[false,false,false,false],\"wheels\":5,\"xenonColor\":255,\"wheelColor\":156,\"tyreSmokeColor\":[255,255,255],\"modSeats\":-1,\"dirtLevel\":4.0,\"engineHealth\":1000.0,\"modTrimB\":-1,\"modOrnaments\":-1,\"modFender\":-1,\"extras\":{\"1\":true},\"modRightFender\":-1,\"modGrille\":-1,\"modTurbo\":false,\"modTransmission\":-1,\"modFrame\":-1,\"modEngine\":-1,\"modHydrolic\":-1,\"modTank\":-1,\"modSuspension\":-1,\"windowTint\":-1,\"modSpoilers\":-1,\"pearlescentColor\":10,\"modXenon\":false,\"modSpeakers\":-1,\"modDial\":-1,\"modSideSkirt\":-1,\"modFrontWheels\":-1,\"modDashboard\":-1,\"modTrimA\":-1,\"modAPlate\":-1,\"modHood\":-1}', 1000, 0, 0),
(20, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Blista', 'blista', 'CV 544CV', '{\"modSideSkirt\":-1,\"plate\":\"CV 544CV\",\"modFrame\":-1,\"engineHealth\":1000.0,\"modDashboard\":-1,\"modSpoilers\":-1,\"xenonColor\":255,\"modExhaust\":-1,\"modBrakes\":-1,\"windowTint\":-1,\"modStruts\":-1,\"modTrunk\":-1,\"modBackWheels\":-1,\"modHydrolic\":-1,\"modAirFilter\":-1,\"modSteeringWheel\":-1,\"modDial\":-1,\"plateIndex\":0,\"modEngine\":-1,\"model\":-344943009,\"modArchCover\":-1,\"tyreSmokeColor\":[255,255,255],\"fuelLevel\":65.0,\"neonEnabled\":[false,false,false,false],\"modSmokeEnabled\":false,\"modTrimA\":-1,\"extras\":{\"12\":true,\"10\":false},\"modAerials\":-1,\"modFrontBumper\":-1,\"modLivery\":-1,\"wheels\":0,\"neonColor\":[255,0,255],\"modSeats\":-1,\"modTank\":-1,\"modFrontWheels\":-1,\"modTurbo\":false,\"modVanityPlate\":-1,\"color2\":0,\"modSuspension\":-1,\"modFender\":-1,\"modWindows\":-1,\"modDoorSpeaker\":-1,\"modPlateHolder\":-1,\"modHorns\":-1,\"modSpeakers\":-1,\"modShifterLeavers\":-1,\"modRoof\":-1,\"modRearBumper\":-1,\"wheelColor\":156,\"dirtLevel\":7.0,\"modAPlate\":-1,\"modTrimB\":-1,\"bodyHealth\":1000.0,\"tankHealth\":1000.0,\"modXenon\":false,\"modHood\":-1,\"modArmor\":-1,\"modGrille\":-1,\"modTransmission\":-1,\"pearlescentColor\":5,\"color1\":7,\"modRightFender\":-1,\"modEngineBlock\":-1,\"modOrnaments\":-1}', 1000, 0, 0),
(21, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Prairie', 'prairie', 'IN 674IN', '{\"modDoorSpeaker\":-1,\"modShifterLeavers\":-1,\"modSideSkirt\":-1,\"modGrille\":-1,\"fuelLevel\":65.0,\"modArchCover\":-1,\"modRoof\":-1,\"modLivery\":-1,\"plate\":\"IN 674IN\",\"model\":-1450650718,\"modEngine\":-1,\"modTank\":-1,\"engineHealth\":1000.0,\"modEngineBlock\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modOrnaments\":-1,\"modRightFender\":-1,\"modAPlate\":-1,\"modSuspension\":-1,\"modXenon\":false,\"pearlescentColor\":7,\"modHood\":-1,\"modSmokeEnabled\":false,\"modTransmission\":-1,\"modTrimB\":-1,\"modBrakes\":-1,\"modFrontWheels\":-1,\"modPlateHolder\":-1,\"modDial\":-1,\"modDashboard\":-1,\"modHorns\":-1,\"modRearBumper\":-1,\"modTrimA\":-1,\"modExhaust\":-1,\"modAirFilter\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"plateIndex\":0,\"tankHealth\":1000.0,\"extras\":{\"11\":false,\"10\":true},\"modWindows\":-1,\"wheels\":0,\"modHydrolic\":-1,\"neonEnabled\":[false,false,false,false],\"modTurbo\":false,\"modFender\":-1,\"modSeats\":-1,\"modFrame\":-1,\"modArmor\":-1,\"modStruts\":-1,\"bodyHealth\":1000.0,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"modVanityPlate\":-1,\"dirtLevel\":11.0,\"modSpoilers\":-1,\"modFrontBumper\":-1,\"wheelColor\":156,\"modBackWheels\":-1,\"color2\":0,\"color1\":6,\"modSteeringWheel\":-1,\"xenonColor\":255}', 1000, 0, 0),
(22, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Issi RS', 'issi7', 'SI 866SI', '{\"modFrontBumper\":-1,\"plateIndex\":0,\"modSpoilers\":-1,\"modSeats\":-1,\"modWindows\":-1,\"modBrakes\":-1,\"extras\":{\"1\":true},\"wheelColor\":112,\"model\":1854776567,\"modEngine\":-1,\"modFender\":-1,\"modGrille\":-1,\"modSmokeEnabled\":false,\"modHorns\":-1,\"bodyHealth\":1000.0,\"xenonColor\":255,\"modXenon\":false,\"modRightFender\":-1,\"modBackWheels\":-1,\"modDial\":-1,\"modOrnaments\":-1,\"color1\":112,\"modSideSkirt\":-1,\"modSteeringWheel\":-1,\"modShifterLeavers\":-1,\"modExhaust\":-1,\"modLivery\":-1,\"modDashboard\":-1,\"modArmor\":-1,\"modAPlate\":-1,\"modTank\":-1,\"windowTint\":-1,\"modTrunk\":-1,\"tankHealth\":1000.0,\"modHood\":-1,\"modDoorSpeaker\":-1,\"modArchCover\":-1,\"pearlescentColor\":18,\"modRearBumper\":-1,\"plate\":\"SI 866SI\",\"modTrimB\":-1,\"fuelLevel\":65.0,\"modStruts\":-1,\"modSpeakers\":-1,\"modTurbo\":false,\"modTransmission\":-1,\"modHydrolic\":-1,\"modEngineBlock\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":112,\"modRoof\":-1,\"modFrame\":-1,\"modAirFilter\":-1,\"modSuspension\":-1,\"wheels\":0,\"dirtLevel\":4.0,\"modTrimA\":-1,\"neonColor\":[255,0,255],\"modVanityPlate\":-1,\"modAerials\":-1,\"modPlateHolder\":-1,\"engineHealth\":1000.0,\"modFrontWheels\":-1,\"neonEnabled\":[false,false,false,false]}', 1000, 0, 0),
(23, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Issi', 'issi2', 'PS 283PS', '{\"neonColor\":[255,0,255],\"modFender\":-1,\"modAPlate\":-1,\"modSeats\":-1,\"bodyHealth\":1000.0,\"wheelColor\":156,\"modRearBumper\":-1,\"modAirFilter\":-1,\"modTrimB\":-1,\"color1\":34,\"modDashboard\":-1,\"modSpoilers\":-1,\"modHorns\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"modFrontBumper\":-1,\"extras\":{\"11\":false},\"model\":-1177863319,\"modSpeakers\":-1,\"modFrame\":-1,\"plate\":\"PS 283PS\",\"modShifterLeavers\":-1,\"modWindows\":-1,\"modAerials\":-1,\"modTank\":-1,\"modGrille\":-1,\"modLivery\":-1,\"dirtLevel\":4.0,\"tyreSmokeColor\":[255,255,255],\"modEngine\":-1,\"wheels\":0,\"plateIndex\":3,\"modVanityPlate\":-1,\"modRightFender\":-1,\"modPlateHolder\":-1,\"xenonColor\":255,\"modXenon\":false,\"modArchCover\":-1,\"fuelLevel\":65.0,\"modSteeringWheel\":-1,\"tankHealth\":1000.0,\"modDoorSpeaker\":-1,\"engineHealth\":1000.0,\"modHydrolic\":-1,\"modRoof\":-1,\"modArmor\":-1,\"modFrontWheels\":-1,\"modTrimA\":-1,\"modStruts\":-1,\"modBackWheels\":-1,\"modEngineBlock\":-1,\"neonEnabled\":[false,false,false,false],\"color2\":0,\"modSuspension\":-1,\"modExhaust\":-1,\"pearlescentColor\":28,\"modTurbo\":false,\"modSideSkirt\":-1,\"modDial\":-1,\"modSmokeEnabled\":false,\"modHood\":-1,\"modTransmission\":-1,\"windowTint\":-1,\"modBrakes\":-1}', 1000, 0, 0),
(24, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Dilettante', 'dilettante', 'GL 123GL', '{\"modEngineBlock\":-1,\"modArmor\":-1,\"modExhaust\":-1,\"modHorns\":-1,\"modStruts\":-1,\"modTurbo\":false,\"modHydrolic\":-1,\"modDial\":-1,\"modBrakes\":-1,\"modSteeringWheel\":-1,\"modTrimA\":-1,\"pearlescentColor\":1,\"color2\":0,\"modAPlate\":-1,\"modFender\":-1,\"modGrille\":-1,\"modDashboard\":-1,\"modTank\":-1,\"modVanityPlate\":-1,\"modFrame\":-1,\"modTrunk\":-1,\"modArchCover\":-1,\"modRearBumper\":-1,\"modSmokeEnabled\":false,\"model\":-1130810103,\"modEngine\":-1,\"neonColor\":[255,0,255],\"modSpoilers\":-1,\"modSeats\":-1,\"windowTint\":-1,\"modXenon\":false,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"dirtLevel\":7.0,\"wheelColor\":156,\"modBackWheels\":-1,\"plate\":\"GL 123GL\",\"modSuspension\":-1,\"modAerials\":-1,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":0,\"modFrontWheels\":-1,\"neonEnabled\":[false,false,false,false],\"modTrimB\":-1,\"modOrnaments\":-1,\"extras\":{\"10\":true},\"modRightFender\":-1,\"modRoof\":-1,\"bodyHealth\":1000.0,\"color1\":0,\"modPlateHolder\":-1,\"modShifterLeavers\":-1,\"modTransmission\":-1,\"modAirFilter\":-1,\"tankHealth\":1000.0,\"modSideSkirt\":-1,\"modLivery\":-1,\"xenonColor\":255,\"fuelLevel\":65.0,\"wheels\":0,\"modHood\":-1,\"modWindows\":-1,\"engineHealth\":1000.0,\"modFrontBumper\":-1}', 1000, 0, 0),
(25, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Blista', 'blista', 'OJ 261OJ', '{\"model\":-344943009,\"fuelLevel\":65.0,\"modLivery\":-1,\"modAirFilter\":-1,\"modHood\":-1,\"tankHealth\":1000.0,\"modRearBumper\":-1,\"wheelColor\":156,\"neonColor\":[255,0,255],\"plate\":\"OJ 261OJ\",\"modFrontWheels\":-1,\"modArchCover\":-1,\"xenonColor\":255,\"modSpoilers\":-1,\"modSmokeEnabled\":false,\"modTrimB\":-1,\"tyreSmokeColor\":[255,255,255],\"extras\":{\"10\":false,\"12\":true},\"modTurbo\":false,\"modAPlate\":-1,\"modTrimA\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"modDashboard\":-1,\"modFender\":-1,\"modTrunk\":-1,\"color1\":7,\"modXenon\":false,\"modTank\":-1,\"dirtLevel\":3.0,\"modDoorSpeaker\":-1,\"modExhaust\":-1,\"modGrille\":-1,\"modTransmission\":-1,\"modEngine\":-1,\"modSeats\":-1,\"wheels\":0,\"modSpeakers\":-1,\"modWindows\":-1,\"bodyHealth\":1000.0,\"modBrakes\":-1,\"modFrame\":-1,\"modSuspension\":-1,\"pearlescentColor\":5,\"engineHealth\":1000.0,\"modStruts\":-1,\"color2\":0,\"modSideSkirt\":-1,\"modHydrolic\":-1,\"modAerials\":-1,\"plateIndex\":0,\"modPlateHolder\":-1,\"modRightFender\":-1,\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modBackWheels\":-1,\"modShifterLeavers\":-1,\"modEngineBlock\":-1,\"modHorns\":-1,\"modRoof\":-1,\"modArmor\":-1}', 1000, 0, 0),
(26, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Blista', 'blista', 'DR 034DR', '{\"modFrontWheels\":-1,\"modRightFender\":-1,\"pearlescentColor\":65,\"modArmor\":-1,\"modDoorSpeaker\":-1,\"modTransmission\":-1,\"windowTint\":-1,\"modPlateHolder\":-1,\"modTank\":-1,\"modDashboard\":-1,\"modGrille\":-1,\"modStruts\":-1,\"modAerials\":-1,\"modTrimB\":-1,\"modArchCover\":-1,\"modXenon\":false,\"modSpoilers\":-1,\"modTrunk\":-1,\"modDial\":-1,\"modTurbo\":false,\"model\":-344943009,\"modRearBumper\":-1,\"modFrontBumper\":-1,\"modHood\":-1,\"modSuspension\":-1,\"modBrakes\":-1,\"extras\":{\"12\":false,\"10\":true},\"xenonColor\":255,\"neonColor\":[255,0,255],\"modAirFilter\":-1,\"modFrame\":-1,\"color1\":61,\"modHorns\":-1,\"modTrimA\":-1,\"modVanityPlate\":-1,\"modRoof\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":0,\"modSteeringWheel\":-1,\"modSmokeEnabled\":false,\"tankHealth\":1000.0,\"bodyHealth\":1000.0,\"modFender\":-1,\"dirtLevel\":11.0,\"plate\":\"DR 034DR\",\"modShifterLeavers\":-1,\"modWindows\":-1,\"modSpeakers\":-1,\"modSeats\":-1,\"plateIndex\":0,\"fuelLevel\":65.0,\"wheelColor\":156,\"modExhaust\":-1,\"modHydrolic\":-1,\"modOrnaments\":-1,\"modAPlate\":-1,\"wheels\":0,\"modSideSkirt\":-1,\"modEngine\":-1,\"neonEnabled\":[false,false,false,false],\"engineHealth\":1000.0,\"modLivery\":-1,\"modBackWheels\":-1,\"modEngineBlock\":-1}', 1000, 0, 0),
(27, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Rhapsody', 'rhapsody', 'CD 550CD', '{\"modAPlate\":-1,\"modTank\":-1,\"modDashboard\":-1,\"modBackWheels\":-1,\"windowTint\":-1,\"modTransmission\":-1,\"modHydrolic\":-1,\"modShifterLeavers\":-1,\"modFrame\":-1,\"modRoof\":-1,\"modArchCover\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"tankHealth\":1000.0,\"modDoorSpeaker\":-1,\"modFrontBumper\":-1,\"modVanityPlate\":-1,\"modTrimB\":-1,\"modEngineBlock\":-1,\"modRearBumper\":-1,\"pearlescentColor\":4,\"xenonColor\":255,\"wheels\":1,\"modDial\":-1,\"modSpoilers\":-1,\"color2\":0,\"modWindows\":-1,\"modArmor\":-1,\"modSteeringWheel\":-1,\"modHorns\":-1,\"modTrimA\":-1,\"modOrnaments\":-1,\"fuelLevel\":65.0,\"plateIndex\":0,\"bodyHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"model\":841808271,\"modFrontWheels\":-1,\"modEngine\":-1,\"modSmokeEnabled\":false,\"extras\":[],\"modHood\":-1,\"wheelColor\":156,\"tyreSmokeColor\":[255,255,255],\"modFender\":-1,\"modSuspension\":-1,\"modLivery\":-1,\"modAerials\":-1,\"modBrakes\":-1,\"modTrunk\":-1,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"modRightFender\":-1,\"modSeats\":-1,\"plate\":\"CD 550CD\",\"color1\":1,\"dirtLevel\":6.0,\"modGrille\":-1,\"modSpeakers\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modXenon\":false,\"modTurbo\":false,\"engineHealth\":1000.0}', 1000, 0, 0),
(28, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Rhapsody', 'rhapsody', 'KQ 782KQ', '{\"modAPlate\":-1,\"modTank\":-1,\"modDashboard\":-1,\"modBackWheels\":-1,\"windowTint\":-1,\"modTransmission\":-1,\"modHydrolic\":-1,\"modShifterLeavers\":-1,\"modFrame\":-1,\"modRoof\":-1,\"modArchCover\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"tankHealth\":1000.0,\"modDoorSpeaker\":-1,\"modFrontBumper\":-1,\"modVanityPlate\":-1,\"modTrimB\":-1,\"modEngineBlock\":-1,\"modRearBumper\":-1,\"pearlescentColor\":5,\"xenonColor\":255,\"wheels\":1,\"modDial\":-1,\"modSpoilers\":-1,\"color2\":3,\"modWindows\":-1,\"modArmor\":-1,\"modSteeringWheel\":-1,\"modHorns\":-1,\"modTrimA\":-1,\"modOrnaments\":-1,\"fuelLevel\":65.0,\"plateIndex\":0,\"bodyHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"model\":841808271,\"modFrontWheels\":-1,\"modEngine\":-1,\"modSmokeEnabled\":false,\"extras\":[],\"modHood\":-1,\"wheelColor\":156,\"tyreSmokeColor\":[255,255,255],\"modFender\":-1,\"modSuspension\":-1,\"modLivery\":-1,\"modAerials\":-1,\"modBrakes\":-1,\"modTrunk\":-1,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"modRightFender\":-1,\"modSeats\":-1,\"plate\":\"KQ 782KQ\",\"color1\":3,\"dirtLevel\":3.0,\"modGrille\":-1,\"modSpeakers\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modXenon\":false,\"modTurbo\":false,\"engineHealth\":1000.0}', 1000, 0, 0),
(29, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Panto', 'panto', 'BK 521BK', '{\"modXenon\":false,\"modAPlate\":-1,\"modRearBumper\":-1,\"color2\":54,\"bodyHealth\":1000.0,\"modFrontWheels\":-1,\"dirtLevel\":12.0,\"modSpeakers\":-1,\"plateIndex\":0,\"modHood\":-1,\"modEngine\":-1,\"modSpoilers\":-1,\"modTurbo\":false,\"wheels\":5,\"modFender\":-1,\"modArmor\":-1,\"modDoorSpeaker\":-1,\"modVanityPlate\":-1,\"wheelColor\":156,\"modAirFilter\":-1,\"windowTint\":-1,\"modWindows\":-1,\"modEngineBlock\":-1,\"modStruts\":-1,\"modGrille\":-1,\"modTrimA\":-1,\"neonColor\":[255,0,255],\"modSteeringWheel\":-1,\"modSuspension\":-1,\"modTank\":-1,\"modArchCover\":-1,\"modPlateHolder\":-1,\"fuelLevel\":65.0,\"modShifterLeavers\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modAerials\":-1,\"modTransmission\":-1,\"modHorns\":-1,\"modOrnaments\":-1,\"modExhaust\":-1,\"modDial\":-1,\"modBackWheels\":-1,\"modFrame\":-1,\"modSeats\":-1,\"tankHealth\":1000.0,\"pearlescentColor\":0,\"tyreSmokeColor\":[255,255,255],\"neonEnabled\":[false,false,false,false],\"modTrunk\":-1,\"model\":-431692672,\"modTrimB\":-1,\"modSideSkirt\":-1,\"modHydrolic\":-1,\"modLivery\":-1,\"plate\":\"BK 521BK\",\"engineHealth\":1000.0,\"color1\":54,\"modRoof\":-1,\"modRightFender\":-1,\"extras\":{\"4\":true,\"5\":true,\"2\":true,\"3\":true,\"1\":true},\"modBrakes\":-1,\"xenonColor\":255,\"modSmokeEnabled\":false}', 1000, 0, 0),
(30, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Dilettante', 'dilettante', 'KI 765KI', '{\"modHood\":-1,\"neonEnabled\":[false,false,false,false],\"modDashboard\":-1,\"modSpeakers\":-1,\"modDoorSpeaker\":-1,\"modOrnaments\":-1,\"modFrontWheels\":-1,\"modWindows\":-1,\"modTank\":-1,\"modHydrolic\":-1,\"wheelColor\":156,\"modExhaust\":-1,\"extras\":{\"10\":false},\"xenonColor\":255,\"modRoof\":-1,\"modXenon\":false,\"tankHealth\":1000.0,\"modDial\":-1,\"modShifterLeavers\":-1,\"modEngineBlock\":-1,\"modTrimB\":-1,\"modAirFilter\":-1,\"modSuspension\":-1,\"modSpoilers\":-1,\"modRightFender\":-1,\"tyreSmokeColor\":[255,255,255],\"modFender\":-1,\"modAPlate\":-1,\"modSeats\":-1,\"model\":-1130810103,\"modTrimA\":-1,\"modSmokeEnabled\":false,\"modTrunk\":-1,\"dirtLevel\":5.0,\"modTurbo\":false,\"plateIndex\":0,\"modEngine\":-1,\"neonColor\":[255,0,255],\"modStruts\":-1,\"modGrille\":-1,\"modAerials\":-1,\"modVanityPlate\":-1,\"engineHealth\":1000.0,\"modSideSkirt\":-1,\"modRearBumper\":-1,\"fuelLevel\":65.0,\"modTransmission\":-1,\"bodyHealth\":1000.0,\"modHorns\":-1,\"modPlateHolder\":-1,\"windowTint\":-1,\"modArmor\":-1,\"color2\":0,\"pearlescentColor\":1,\"plate\":\"KI 765KI\",\"modLivery\":-1,\"modSteeringWheel\":-1,\"color1\":0,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"wheels\":0,\"modArchCover\":-1,\"modBrakes\":-1,\"modFrame\":-1}', 1000, 0, 0),
(31, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Issi RS', 'issi7', 'IX 640IX', '{\"modDashboard\":-1,\"modLivery\":-1,\"modFrame\":-1,\"modDoorSpeaker\":-1,\"modRearBumper\":-1,\"modTransmission\":-1,\"modOrnaments\":-1,\"modHydrolic\":-1,\"tankHealth\":1000.0,\"modAerials\":-1,\"modShifterLeavers\":-1,\"modTrimA\":-1,\"plate\":\"IX 640IX\",\"modTrunk\":-1,\"color1\":112,\"modSpeakers\":-1,\"modHorns\":-1,\"modArchCover\":-1,\"extras\":{\"1\":true},\"modRoof\":-1,\"modTrimB\":-1,\"neonEnabled\":[false,false,false,false],\"wheelColor\":112,\"modSteeringWheel\":-1,\"modSeats\":-1,\"color2\":112,\"modWindows\":-1,\"modSuspension\":-1,\"modEngineBlock\":-1,\"modRightFender\":-1,\"plateIndex\":0,\"modAirFilter\":-1,\"modTank\":-1,\"modAPlate\":-1,\"modExhaust\":-1,\"modSmokeEnabled\":false,\"modStruts\":-1,\"modBrakes\":-1,\"modVanityPlate\":-1,\"engineHealth\":1000.0,\"modGrille\":-1,\"modSideSkirt\":-1,\"fuelLevel\":65.0,\"modDial\":-1,\"modSpoilers\":-1,\"dirtLevel\":3.0,\"modBackWheels\":-1,\"bodyHealth\":1000.0,\"model\":1854776567,\"windowTint\":-1,\"modXenon\":false,\"xenonColor\":255,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modFender\":-1,\"modTurbo\":false,\"modEngine\":-1,\"modArmor\":-1,\"modFrontBumper\":-1,\"modFrontWheels\":-1,\"pearlescentColor\":18,\"neonColor\":[255,0,255],\"wheels\":0,\"modPlateHolder\":-1}', 1000, 0, 0),
(32, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Blista', 'blista', 'AF 056AF', '{\"modDashboard\":-1,\"modLivery\":-1,\"modFrame\":-1,\"modDoorSpeaker\":-1,\"modRearBumper\":-1,\"modTransmission\":-1,\"modOrnaments\":-1,\"modHydrolic\":-1,\"tankHealth\":1000.0,\"modAerials\":-1,\"modShifterLeavers\":-1,\"modTrimA\":-1,\"plate\":\"AF 056AF\",\"modTrunk\":-1,\"color1\":7,\"modSpeakers\":-1,\"modHorns\":-1,\"modArchCover\":-1,\"extras\":{\"12\":true,\"10\":false},\"modRoof\":-1,\"modTrimB\":-1,\"neonEnabled\":[false,false,false,false],\"wheelColor\":156,\"modSteeringWheel\":-1,\"modSeats\":-1,\"color2\":0,\"modWindows\":-1,\"modSuspension\":-1,\"modEngineBlock\":-1,\"modRightFender\":-1,\"plateIndex\":0,\"modAirFilter\":-1,\"modTank\":-1,\"modAPlate\":-1,\"modExhaust\":-1,\"modSmokeEnabled\":false,\"modStruts\":-1,\"modBrakes\":-1,\"modVanityPlate\":-1,\"engineHealth\":1000.0,\"modGrille\":-1,\"modSideSkirt\":-1,\"fuelLevel\":65.0,\"modDial\":-1,\"modSpoilers\":-1,\"dirtLevel\":9.0,\"modBackWheels\":-1,\"bodyHealth\":1000.0,\"model\":-344943009,\"windowTint\":-1,\"modXenon\":false,\"xenonColor\":255,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modFender\":-1,\"modTurbo\":false,\"modEngine\":-1,\"modArmor\":-1,\"modFrontBumper\":-1,\"modFrontWheels\":-1,\"pearlescentColor\":5,\"neonColor\":[255,0,255],\"wheels\":0,\"modPlateHolder\":-1}', 1000, 0, 0),
(33, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Issi', 'issi2', 'AT 033AT', '{\"modLivery\":-1,\"color1\":34,\"modRightFender\":-1,\"modFrontBumper\":-1,\"modSeats\":-1,\"plateIndex\":0,\"modPlateHolder\":-1,\"modRoof\":-1,\"fuelLevel\":65.0,\"color2\":0,\"modHood\":-1,\"xenonColor\":255,\"modTrunk\":-1,\"modTurbo\":false,\"modFrame\":-1,\"modStruts\":-1,\"engineHealth\":1000.0,\"modSmokeEnabled\":false,\"modXenon\":false,\"modSuspension\":-1,\"modBrakes\":-1,\"neonColor\":[255,0,255],\"modSpoilers\":-1,\"model\":-1177863319,\"modDashboard\":-1,\"modOrnaments\":-1,\"modFrontWheels\":-1,\"pearlescentColor\":28,\"modSideSkirt\":-1,\"modAerials\":-1,\"modArmor\":-1,\"wheelColor\":156,\"modTrimB\":-1,\"modAPlate\":-1,\"modHydrolic\":-1,\"modDoorSpeaker\":-1,\"wheels\":0,\"modTrimA\":-1,\"plate\":\"AT 033AT\",\"modTransmission\":-1,\"modRearBumper\":-1,\"modWindows\":-1,\"windowTint\":-1,\"modShifterLeavers\":-1,\"modEngineBlock\":-1,\"modBackWheels\":-1,\"modHorns\":-1,\"modDial\":-1,\"modSteeringWheel\":-1,\"neonEnabled\":[false,false,false,false],\"dirtLevel\":8.0,\"modGrille\":-1,\"extras\":{\"11\":true},\"modTank\":-1,\"modEngine\":-1,\"modVanityPlate\":-1,\"modExhaust\":-1,\"tankHealth\":1000.0,\"modSpeakers\":-1,\"bodyHealth\":1000.0,\"modFender\":-1,\"modAirFilter\":-1,\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1}', 1000, 0, 0),
(34, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Issi RS', 'issi7', 'UW 498UW', '{\"modLivery\":-1,\"color1\":112,\"modRightFender\":-1,\"modFrontBumper\":-1,\"modSeats\":-1,\"plateIndex\":0,\"modPlateHolder\":-1,\"modRoof\":-1,\"fuelLevel\":65.0,\"color2\":112,\"modHood\":-1,\"xenonColor\":255,\"modTrunk\":-1,\"modTurbo\":false,\"modFrame\":-1,\"modStruts\":-1,\"engineHealth\":1000.0,\"modSmokeEnabled\":false,\"modXenon\":false,\"modSuspension\":-1,\"modBrakes\":-1,\"neonColor\":[255,0,255],\"modSpoilers\":-1,\"model\":1854776567,\"modDashboard\":-1,\"modOrnaments\":-1,\"modFrontWheels\":-1,\"pearlescentColor\":18,\"modSideSkirt\":-1,\"modAerials\":-1,\"modArmor\":-1,\"wheelColor\":112,\"modTrimB\":-1,\"modAPlate\":-1,\"modHydrolic\":-1,\"modDoorSpeaker\":-1,\"wheels\":0,\"modTrimA\":-1,\"plate\":\"UW 498UW\",\"modTransmission\":-1,\"modRearBumper\":-1,\"modWindows\":-1,\"windowTint\":-1,\"modShifterLeavers\":-1,\"modEngineBlock\":-1,\"modBackWheels\":-1,\"modHorns\":-1,\"modDial\":-1,\"modSteeringWheel\":-1,\"neonEnabled\":[false,false,false,false],\"dirtLevel\":7.0,\"modGrille\":-1,\"extras\":{\"1\":true},\"modTank\":-1,\"modEngine\":-1,\"modVanityPlate\":-1,\"modExhaust\":-1,\"tankHealth\":1000.0,\"modSpeakers\":-1,\"bodyHealth\":1000.0,\"modFender\":-1,\"modAirFilter\":-1,\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1}', 1000, 0, 0),
(35, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Blista', 'blista', 'BN 029BN', '{\"modBrakes\":-1,\"modSeats\":-1,\"wheelColor\":156,\"modOrnaments\":-1,\"modAerials\":-1,\"color2\":0,\"neonColor\":[255,0,255],\"modLivery\":-1,\"extras\":{\"12\":true,\"10\":false},\"dirtLevel\":7.0,\"modAirFilter\":-1,\"color1\":7,\"modEngineBlock\":-1,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"engineHealth\":1000.0,\"modPlateHolder\":-1,\"model\":-344943009,\"modSmokeEnabled\":false,\"modVanityPlate\":-1,\"modSideSkirt\":-1,\"modEngine\":-1,\"modTrunk\":-1,\"windowTint\":-1,\"modHood\":-1,\"modSteeringWheel\":-1,\"modFrame\":-1,\"modTrimA\":-1,\"wheels\":0,\"fuelLevel\":65.0,\"modArmor\":-1,\"modHorns\":-1,\"plateIndex\":0,\"modTransmission\":-1,\"modSpeakers\":-1,\"tyreSmokeColor\":[255,255,255],\"modAPlate\":-1,\"modGrille\":-1,\"modDashboard\":-1,\"modTank\":-1,\"modSuspension\":-1,\"modFrontBumper\":-1,\"modHydrolic\":-1,\"modTurbo\":false,\"pearlescentColor\":5,\"modRightFender\":-1,\"modFender\":-1,\"modStruts\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontWheels\":-1,\"modSpoilers\":-1,\"modRearBumper\":-1,\"modExhaust\":-1,\"tankHealth\":1000.0,\"modBackWheels\":-1,\"plate\":\"BN 029BN\",\"modRoof\":-1,\"modXenon\":false,\"modArchCover\":-1,\"modWindows\":-1,\"modDial\":-1,\"modShifterLeavers\":-1,\"bodyHealth\":1000.0,\"xenonColor\":255}', 1000, 0, 0),
(36, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Brioso', 'brioso', 'VP 475VP', '{\"modFrontWheels\":-1,\"modBrakes\":-1,\"windowTint\":-1,\"modTurbo\":false,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modShifterLeavers\":-1,\"modHood\":-1,\"modSpoilers\":-1,\"modAerials\":-1,\"modVanityPlate\":-1,\"modSteeringWheel\":-1,\"model\":1549126457,\"tyreSmokeColor\":[255,255,255],\"modSuspension\":-1,\"modLivery\":-1,\"extras\":[],\"modAPlate\":-1,\"modFrontBumper\":-1,\"pearlescentColor\":55,\"modStruts\":-1,\"color1\":50,\"modRoof\":-1,\"modDashboard\":-1,\"color2\":0,\"modTank\":-1,\"modOrnaments\":-1,\"modTrimA\":-1,\"modBackWheels\":-1,\"modEngine\":-1,\"plateIndex\":0,\"modWindows\":-1,\"modAirFilter\":-1,\"plate\":\"VP 475VP\",\"modArchCover\":-1,\"dirtLevel\":4.0,\"modSmokeEnabled\":false,\"modPlateHolder\":-1,\"modGrille\":-1,\"modDial\":-1,\"modExhaust\":-1,\"neonColor\":[255,0,255],\"modSpeakers\":-1,\"modSeats\":-1,\"xenonColor\":255,\"modHydrolic\":-1,\"modXenon\":false,\"modRightFender\":-1,\"modFrame\":-1,\"modArmor\":-1,\"wheels\":5,\"tankHealth\":1000.0,\"engineHealth\":1000.0,\"wheelColor\":92,\"modDoorSpeaker\":-1,\"modTransmission\":-1,\"fuelLevel\":65.0,\"modEngineBlock\":-1,\"bodyHealth\":1000.0,\"modFender\":-1,\"modHorns\":-1,\"modTrunk\":-1,\"modTrimB\":-1,\"modSideSkirt\":-1}', 1000, 0, 0),
(37, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Club', 'club', 'SC 356SC', '{\"modTurbo\":false,\"modTank\":-1,\"neonEnabled\":[false,false,false,false],\"modHorns\":-1,\"modOrnaments\":-1,\"modShifterLeavers\":-1,\"modRoof\":-1,\"modTrimA\":-1,\"modSpoilers\":-1,\"tankHealth\":1000.0,\"modAerials\":-1,\"plate\":\"SC 356SC\",\"modSideSkirt\":-1,\"modSeats\":-1,\"neonColor\":[255,0,255],\"modEngine\":-1,\"modAPlate\":-1,\"modSmokeEnabled\":false,\"modStruts\":-1,\"modXenon\":false,\"modFender\":-1,\"modFrame\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"modRightFender\":-1,\"modDial\":-1,\"color1\":70,\"plateIndex\":0,\"dirtLevel\":3.0,\"engineHealth\":1000.0,\"modTrimB\":-1,\"modRearBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"modDashboard\":-1,\"wheels\":5,\"modWindows\":-1,\"bodyHealth\":1000.0,\"modSteeringWheel\":-1,\"color2\":0,\"modAirFilter\":-1,\"fuelLevel\":60.0,\"modLivery\":-1,\"windowTint\":-1,\"extras\":{\"1\":true},\"modArmor\":-1,\"modPlateHolder\":-1,\"modBrakes\":-1,\"modFrontWheels\":-1,\"modExhaust\":-1,\"modDoorSpeaker\":-1,\"modHydrolic\":-1,\"modArchCover\":-1,\"modTrunk\":-1,\"modFrontBumper\":-1,\"wheelColor\":156,\"modBackWheels\":-1,\"model\":-2098954619,\"modGrille\":-1,\"pearlescentColor\":18,\"modSuspension\":-1,\"modVanityPlate\":-1,\"modTransmission\":-1,\"xenonColor\":255,\"modHood\":-1}', 1000, 0, 0),
(38, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Kanjo', 'kanjo', 'PH 310PH', '{\"modFrontBumper\":-1,\"modTrimB\":-1,\"fuelLevel\":65.0,\"modAirFilter\":-1,\"wheelColor\":156,\"tankHealth\":1000.0,\"modTurbo\":false,\"modArmor\":-1,\"modFrame\":-1,\"modRoof\":-1,\"modArchCover\":-1,\"modSpeakers\":-1,\"modTrunk\":-1,\"plateIndex\":0,\"modAerials\":-1,\"dirtLevel\":6.0,\"modHood\":-1,\"modSmokeEnabled\":false,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"modDial\":-1,\"modBrakes\":-1,\"modSteeringWheel\":-1,\"tyreSmokeColor\":[255,255,255],\"modExhaust\":-1,\"modVanityPlate\":-1,\"modSideSkirt\":-1,\"modRearBumper\":-1,\"modFrontWheels\":-1,\"modBackWheels\":-1,\"modHydrolic\":-1,\"plate\":\"PH 310PH\",\"modDashboard\":-1,\"modStruts\":-1,\"color1\":0,\"modTrimA\":-1,\"pearlescentColor\":10,\"bodyHealth\":1000.0,\"windowTint\":-1,\"modRightFender\":-1,\"modFender\":-1,\"model\":409049982,\"modTransmission\":-1,\"modWindows\":-1,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"engineHealth\":1000.0,\"modSpoilers\":-1,\"modTank\":-1,\"modShifterLeavers\":-1,\"modGrille\":-1,\"wheels\":5,\"neonEnabled\":[false,false,false,false],\"modEngineBlock\":-1,\"modLivery\":-1,\"modXenon\":false,\"color2\":0,\"extras\":{\"1\":true},\"modEngine\":-1,\"modOrnaments\":-1,\"modSeats\":-1,\"modHorns\":-1,\"modAPlate\":-1}', 1000, 0, 0),
(39, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Kanjo', 'kanjo', 'PH 310PH', '{\"modFrontBumper\":-1,\"modTrimB\":-1,\"fuelLevel\":65.0,\"modAirFilter\":-1,\"wheelColor\":156,\"tankHealth\":1000.0,\"modTurbo\":false,\"modArmor\":-1,\"modFrame\":-1,\"modRoof\":-1,\"modArchCover\":-1,\"modSpeakers\":-1,\"modTrunk\":-1,\"plateIndex\":0,\"modAerials\":-1,\"dirtLevel\":6.0,\"modHood\":-1,\"modSmokeEnabled\":false,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"modDial\":-1,\"modBrakes\":-1,\"modSteeringWheel\":-1,\"tyreSmokeColor\":[255,255,255],\"modExhaust\":-1,\"modVanityPlate\":-1,\"modSideSkirt\":-1,\"modRearBumper\":-1,\"modFrontWheels\":-1,\"modBackWheels\":-1,\"modHydrolic\":-1,\"plate\":\"PH 310PH\",\"modDashboard\":-1,\"modStruts\":-1,\"color1\":0,\"modTrimA\":-1,\"pearlescentColor\":10,\"bodyHealth\":1000.0,\"windowTint\":-1,\"modRightFender\":-1,\"modFender\":-1,\"model\":409049982,\"modTransmission\":-1,\"modWindows\":-1,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"engineHealth\":1000.0,\"modSpoilers\":-1,\"modTank\":-1,\"modShifterLeavers\":-1,\"modGrille\":-1,\"wheels\":5,\"neonEnabled\":[false,false,false,false],\"modEngineBlock\":-1,\"modLivery\":-1,\"modXenon\":false,\"color2\":0,\"extras\":{\"1\":true},\"modEngine\":-1,\"modOrnaments\":-1,\"modSeats\":-1,\"modHorns\":-1,\"modAPlate\":-1}', 1000, 0, 0),
(40, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Blista', 'blista', 'GL 624GL', '{\"modFrontBumper\":-1,\"modTrimB\":-1,\"fuelLevel\":65.0,\"modAirFilter\":-1,\"wheelColor\":156,\"tankHealth\":1000.0,\"modTurbo\":false,\"modArmor\":-1,\"modFrame\":-1,\"modRoof\":-1,\"modArchCover\":-1,\"modSpeakers\":-1,\"modTrunk\":-1,\"plateIndex\":0,\"modAerials\":-1,\"dirtLevel\":5.0,\"modHood\":-1,\"modSmokeEnabled\":false,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"modDial\":-1,\"modBrakes\":-1,\"modSteeringWheel\":-1,\"tyreSmokeColor\":[255,255,255],\"modExhaust\":-1,\"modVanityPlate\":-1,\"modSideSkirt\":-1,\"modRearBumper\":-1,\"modFrontWheels\":-1,\"modBackWheels\":-1,\"modHydrolic\":-1,\"plate\":\"GL 624GL\",\"modDashboard\":-1,\"modStruts\":-1,\"color1\":7,\"modTrimA\":-1,\"pearlescentColor\":5,\"bodyHealth\":1000.0,\"windowTint\":-1,\"modRightFender\":-1,\"modFender\":-1,\"model\":-344943009,\"modTransmission\":-1,\"modWindows\":-1,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"engineHealth\":1000.0,\"modSpoilers\":-1,\"modTank\":-1,\"modShifterLeavers\":-1,\"modGrille\":-1,\"wheels\":0,\"neonEnabled\":[false,false,false,false],\"modEngineBlock\":-1,\"modLivery\":-1,\"modXenon\":false,\"color2\":0,\"extras\":{\"10\":true,\"12\":false},\"modEngine\":-1,\"modOrnaments\":-1,\"modSeats\":-1,\"modHorns\":-1,\"modAPlate\":-1}', 1000, 0, 0),
(41, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Abso', 'asbo', 'PH 369PH', '{\"modSmokeEnabled\":false,\"wheelColor\":156,\"modSeats\":-1,\"plateIndex\":0,\"color1\":29,\"tankHealth\":1000.0,\"wheels\":5,\"modRearBumper\":-1,\"modHydrolic\":-1,\"modAirFilter\":-1,\"modOrnaments\":-1,\"modTurbo\":false,\"modAerials\":-1,\"modXenon\":false,\"plate\":\"PH 369PH\",\"modTrunk\":-1,\"modStruts\":-1,\"modPlateHolder\":-1,\"modFrontBumper\":-1,\"modEngineBlock\":-1,\"modBrakes\":-1,\"fuelLevel\":65.0,\"modFrame\":-1,\"modSideSkirt\":-1,\"xenonColor\":255,\"modExhaust\":-1,\"modDashboard\":-1,\"modTrimA\":-1,\"modWindows\":-1,\"modArchCover\":-1,\"modTank\":-1,\"modDial\":-1,\"model\":1118611807,\"modBackWheels\":-1,\"pearlescentColor\":138,\"modSteeringWheel\":-1,\"modRightFender\":-1,\"modLivery\":-1,\"modShifterLeavers\":-1,\"modSuspension\":-1,\"color2\":111,\"extras\":[],\"neonColor\":[255,0,255],\"modSpoilers\":-1,\"modArmor\":-1,\"modAPlate\":-1,\"modDoorSpeaker\":-1,\"modFender\":-1,\"windowTint\":-1,\"modEngine\":-1,\"bodyHealth\":1000.0,\"modHorns\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"dirtLevel\":5.0,\"modTransmission\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modSpeakers\":-1,\"modVanityPlate\":-1,\"neonEnabled\":[false,false,false,false],\"modRoof\":-1,\"modTrimB\":-1,\"engineHealth\":1000.0}', 1000, 0, 0);
INSERT INTO `users_vehicles` (`Id`, `Identifier`, `Label`, `Hash`, `Plate`, `Props`, `Health`, `Stored`, `Ensure`) VALUES
(42, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Brioso', 'brioso', 'TN 877TN', '{\"wheelColor\":92,\"neonEnabled\":[false,false,false,false],\"neonColor\":[255,0,255],\"modDial\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"modArmor\":-1,\"modSmokeEnabled\":false,\"modSpeakers\":-1,\"modAerials\":-1,\"extras\":[],\"modXenon\":false,\"modTransmission\":-1,\"color2\":0,\"modSuspension\":-1,\"engineHealth\":1000.0,\"modLivery\":-1,\"modEngineBlock\":-1,\"modTrimA\":-1,\"pearlescentColor\":55,\"modRightFender\":-1,\"modPlateHolder\":-1,\"modAPlate\":-1,\"modTrimB\":-1,\"wheels\":5,\"modGrille\":-1,\"modOrnaments\":-1,\"tankHealth\":1000.0,\"modSteeringWheel\":-1,\"modFrontBumper\":-1,\"modDashboard\":-1,\"modSeats\":-1,\"bodyHealth\":1000.0,\"modFrontWheels\":-1,\"modHood\":-1,\"xenonColor\":255,\"modHorns\":-1,\"modTank\":-1,\"modTurbo\":false,\"modVanityPlate\":-1,\"modWindows\":-1,\"modFender\":-1,\"modSpoilers\":-1,\"plate\":\"TN 877TN\",\"modEngine\":-1,\"modSideSkirt\":-1,\"modFrame\":-1,\"modBackWheels\":-1,\"modArchCover\":-1,\"modBrakes\":-1,\"color1\":50,\"modTrunk\":-1,\"fuelLevel\":65.0,\"modStruts\":-1,\"modExhaust\":-1,\"modHydrolic\":-1,\"modShifterLeavers\":-1,\"model\":1549126457,\"modAirFilter\":-1,\"modDoorSpeaker\":-1,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":0,\"dirtLevel\":12.0,\"modRoof\":-1}', 1000, 0, 0),
(43, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Prairie', 'prairie', 'PG 262PG', '{\"modTrunk\":-1,\"modTrimA\":-1,\"color2\":0,\"modHorns\":-1,\"modFrontWheels\":-1,\"modSpoilers\":-1,\"modWindows\":-1,\"color1\":6,\"modArmor\":-1,\"modDial\":-1,\"modTank\":-1,\"modHydrolic\":-1,\"modSuspension\":-1,\"neonColor\":[255,0,255],\"modVanityPlate\":-1,\"modTrimB\":-1,\"modSteeringWheel\":-1,\"modTurbo\":false,\"modDashboard\":-1,\"plateIndex\":0,\"modOrnaments\":-1,\"modXenon\":false,\"modExhaust\":-1,\"modTransmission\":-1,\"modEngine\":-1,\"modShifterLeavers\":-1,\"dirtLevel\":5.0,\"modBrakes\":-1,\"bodyHealth\":1000.0,\"modPlateHolder\":-1,\"extras\":{\"10\":true,\"11\":false},\"modSeats\":-1,\"engineHealth\":1000.0,\"modAPlate\":-1,\"fuelLevel\":65.0,\"modAerials\":-1,\"modHood\":-1,\"modBackWheels\":-1,\"neonEnabled\":[false,false,false,false],\"wheelColor\":156,\"modFrontBumper\":-1,\"modFender\":-1,\"xenonColor\":255,\"modAirFilter\":-1,\"pearlescentColor\":7,\"modArchCover\":-1,\"model\":-1450650718,\"modSmokeEnabled\":false,\"modRoof\":-1,\"modStruts\":-1,\"tankHealth\":1000.0,\"modGrille\":-1,\"tyreSmokeColor\":[255,255,255],\"modRightFender\":-1,\"wheels\":0,\"modLivery\":-1,\"modFrame\":-1,\"windowTint\":-1,\"modSideSkirt\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"plate\":\"PG 262PG\",\"modDoorSpeaker\":-1,\"modRearBumper\":-1}', 1000, 0, 0),
(44, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Rhapsody', 'rhapsody', 'IN 676IN', '{\"modAirFilter\":-1,\"modSideSkirt\":-1,\"color2\":0,\"modTransmission\":-1,\"pearlescentColor\":4,\"modAPlate\":-1,\"modSpeakers\":-1,\"modFrontWheels\":-1,\"modRoof\":-1,\"modDashboard\":-1,\"color1\":1,\"modFrontBumper\":-1,\"wheels\":1,\"tankHealth\":1000.0,\"modGrille\":-1,\"modBrakes\":-1,\"bodyHealth\":1000.0,\"modRearBumper\":-1,\"modXenon\":false,\"modSuspension\":-1,\"modStruts\":-1,\"neonColor\":[255,0,255],\"modFender\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"extras\":[],\"plate\":\"IN 676IN\",\"modEngineBlock\":-1,\"engineHealth\":1000.0,\"modVanityPlate\":-1,\"modBackWheels\":-1,\"modEngine\":-1,\"fuelLevel\":65.0,\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modAerials\":-1,\"modTrimA\":-1,\"modTrimB\":-1,\"modHydrolic\":-1,\"modFrame\":-1,\"neonEnabled\":[false,false,false,false],\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"windowTint\":-1,\"modLivery\":-1,\"dirtLevel\":5.0,\"modPlateHolder\":-1,\"modDial\":-1,\"modDoorSpeaker\":-1,\"modSteeringWheel\":-1,\"plateIndex\":0,\"modSpoilers\":-1,\"modSmokeEnabled\":false,\"modHorns\":-1,\"wheelColor\":156,\"modArchCover\":-1,\"modTank\":-1,\"xenonColor\":255,\"modSeats\":-1,\"modRightFender\":-1,\"modArmor\":-1,\"modTurbo\":false,\"modWindows\":-1,\"model\":841808271}', 1000, 0, 0),
(45, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Issi RS', 'issi7', 'ID 600ID', '{\"xenonColor\":255,\"modSideSkirt\":-1,\"modGrille\":-1,\"modSmokeEnabled\":false,\"modTransmission\":-1,\"modBackWheels\":-1,\"model\":1854776567,\"modHorns\":-1,\"modWindows\":-1,\"modXenon\":false,\"color2\":112,\"modOrnaments\":-1,\"modAPlate\":-1,\"modFrame\":-1,\"modFrontBumper\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modArchCover\":-1,\"modDashboard\":-1,\"extras\":{\"1\":true},\"tankHealth\":1000.0,\"plate\":\"ID 600ID\",\"modRearBumper\":-1,\"modEngineBlock\":-1,\"dirtLevel\":6.0,\"modTrunk\":-1,\"wheels\":0,\"color1\":112,\"modSpeakers\":-1,\"modRoof\":-1,\"modSeats\":-1,\"neonColor\":[255,0,255],\"modStruts\":-1,\"windowTint\":-1,\"modSpoilers\":-1,\"modLivery\":-1,\"bodyHealth\":1000.0,\"modFender\":-1,\"modDial\":-1,\"modAirFilter\":-1,\"modAerials\":-1,\"modFrontWheels\":-1,\"engineHealth\":1000.0,\"modVanityPlate\":-1,\"modBrakes\":-1,\"pearlescentColor\":18,\"modTank\":-1,\"modHood\":-1,\"modSteeringWheel\":-1,\"modSuspension\":-1,\"fuelLevel\":65.0,\"modExhaust\":-1,\"wheelColor\":112,\"tyreSmokeColor\":[255,255,255],\"modDoorSpeaker\":-1,\"modTurbo\":false,\"modHydrolic\":-1,\"modArmor\":-1,\"modShifterLeavers\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"modRightFender\":-1,\"neonEnabled\":[false,false,false,false]}', 1000, 0, 0),
(46, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Issi', 'issi2', 'UE 857UE', '{\"tyreSmokeColor\":[255,255,255],\"modPlateHolder\":-1,\"tankHealth\":1000.0,\"modArchCover\":-1,\"fuelLevel\":65.0,\"modStruts\":-1,\"windowTint\":-1,\"modGrille\":-1,\"modFrame\":-1,\"modXenon\":false,\"wheels\":0,\"modHorns\":-1,\"modBackWheels\":-1,\"modSmokeEnabled\":false,\"pearlescentColor\":28,\"bodyHealth\":1000.0,\"modTransmission\":-1,\"modDashboard\":-1,\"modHood\":-1,\"modWindows\":-1,\"modEngine\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modFrontBumper\":-1,\"modSuspension\":-1,\"modTank\":-1,\"modSideSkirt\":-1,\"modTrimA\":-1,\"dirtLevel\":10.0,\"plateIndex\":0,\"modAerials\":-1,\"modArmor\":-1,\"neonEnabled\":[false,false,false,false],\"modSeats\":-1,\"neonColor\":[255,0,255],\"wheelColor\":156,\"modLivery\":-1,\"color1\":34,\"xenonColor\":255,\"modTrunk\":-1,\"modTurbo\":false,\"modEngineBlock\":-1,\"modOrnaments\":-1,\"modSteeringWheel\":-1,\"modRoof\":-1,\"modVanityPlate\":-1,\"modHydrolic\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modDial\":-1,\"modExhaust\":-1,\"modSpoilers\":-1,\"modRightFender\":-1,\"engineHealth\":1000.0,\"model\":-1177863319,\"extras\":{\"11\":false},\"modAPlate\":-1,\"color2\":0,\"modRearBumper\":-1,\"modDoorSpeaker\":-1,\"modBrakes\":-1,\"plate\":\"UE 857UE\",\"modAirFilter\":-1,\"modFrontWheels\":-1}', 1000, 0, 0),
(47, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Rhapsody', 'rhapsody', 'BR 584BR', '{\"modTank\":-1,\"wheels\":1,\"modDashboard\":-1,\"modExhaust\":-1,\"modSpoilers\":-1,\"plate\":\"BR 584BR\",\"modSmokeEnabled\":false,\"modSuspension\":-1,\"modHorns\":-1,\"modLivery\":-1,\"neonEnabled\":[false,false,false,false],\"engineHealth\":1000.0,\"modTurbo\":false,\"modGrille\":-1,\"dirtLevel\":4.0,\"modBrakes\":-1,\"modTrimA\":-1,\"modArmor\":-1,\"modSpeakers\":-1,\"modTrimB\":-1,\"color1\":1,\"wheelColor\":156,\"modSeats\":-1,\"modTrunk\":-1,\"modRearBumper\":-1,\"modAirFilter\":-1,\"modXenon\":false,\"xenonColor\":255,\"tankHealth\":1000.0,\"fuelLevel\":65.0,\"windowTint\":-1,\"modAPlate\":-1,\"modRoof\":-1,\"modFender\":-1,\"modSteeringWheel\":-1,\"modTransmission\":-1,\"modWindows\":-1,\"modDial\":-1,\"modAerials\":-1,\"modFrontBumper\":-1,\"modShifterLeavers\":-1,\"modBackWheels\":-1,\"modSideSkirt\":-1,\"modEngine\":-1,\"modStruts\":-1,\"color2\":0,\"modFrontWheels\":-1,\"modFrame\":-1,\"modRightFender\":-1,\"neonColor\":[255,0,255],\"bodyHealth\":1000.0,\"modArchCover\":-1,\"modEngineBlock\":-1,\"plateIndex\":0,\"model\":841808271,\"modVanityPlate\":-1,\"modHood\":-1,\"modPlateHolder\":-1,\"modHydrolic\":-1,\"modDoorSpeaker\":-1,\"tyreSmokeColor\":[255,255,255],\"extras\":[],\"modOrnaments\":-1,\"pearlescentColor\":4}', 1000, 0, 0),
(48, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Abso', 'asbo', 'EL 571EL', '{\"modDashboard\":-1,\"modTank\":-1,\"modTrimA\":-1,\"modRightFender\":-1,\"modAirFilter\":-1,\"modXenon\":false,\"modEngineBlock\":-1,\"modRoof\":-1,\"pearlescentColor\":138,\"modBackWheels\":-1,\"modFender\":-1,\"color1\":29,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"color2\":111,\"modVanityPlate\":-1,\"modBrakes\":-1,\"windowTint\":-1,\"modFrontBumper\":-1,\"model\":1118611807,\"modHydrolic\":-1,\"wheels\":5,\"tankHealth\":1000.0,\"modHood\":-1,\"plateIndex\":0,\"modSteeringWheel\":-1,\"modTrunk\":-1,\"modGrille\":-1,\"tyreSmokeColor\":[255,255,255],\"modAPlate\":-1,\"neonEnabled\":[false,false,false,false],\"modDoorSpeaker\":-1,\"modEngine\":-1,\"modOrnaments\":-1,\"dirtLevel\":6.0,\"modSpoilers\":-1,\"modLivery\":-1,\"modHorns\":-1,\"fuelLevel\":65.0,\"modPlateHolder\":-1,\"modShifterLeavers\":-1,\"modStruts\":-1,\"modSuspension\":-1,\"modTransmission\":-1,\"modFrame\":-1,\"wheelColor\":156,\"xenonColor\":255,\"plate\":\"EL 571EL\",\"modAerials\":-1,\"modArmor\":-1,\"modSideSkirt\":-1,\"modWindows\":-1,\"modSeats\":-1,\"modTurbo\":false,\"engineHealth\":1000.0,\"bodyHealth\":1000.0,\"modTrimB\":-1,\"modFrontWheels\":-1,\"modRearBumper\":-1,\"modExhaust\":-1,\"modSpeakers\":-1,\"modArchCover\":-1,\"extras\":[],\"modDial\":-1}', 1000, 0, 0),
(49, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Prairie', 'prairie', 'CQ 089CQ', '{\"plateIndex\":3,\"modTransmission\":-1,\"engineHealth\":1000.0,\"color2\":0,\"neonColor\":[255,0,255],\"modHood\":-1,\"modDashboard\":-1,\"modFrontWheels\":-1,\"modBackWheels\":-1,\"modPlateHolder\":-1,\"tyreSmokeColor\":[255,255,255],\"modRoof\":-1,\"modStruts\":-1,\"modArchCover\":-1,\"modSpoilers\":-1,\"modOrnaments\":-1,\"modSuspension\":-1,\"modLivery\":-1,\"dirtLevel\":9.0,\"wheelColor\":156,\"modShifterLeavers\":-1,\"modRightFender\":-1,\"modTank\":-1,\"modAPlate\":-1,\"modSeats\":-1,\"modEngineBlock\":-1,\"fuelLevel\":65.0,\"modRearBumper\":-1,\"modDial\":-1,\"modXenon\":false,\"modEngine\":-1,\"modTrunk\":-1,\"modFender\":-1,\"modTrimA\":-1,\"modExhaust\":-1,\"modVanityPlate\":-1,\"tankHealth\":1000.0,\"modBrakes\":-1,\"modSteeringWheel\":-1,\"modAerials\":-1,\"model\":-1450650718,\"modFrame\":-1,\"modTurbo\":false,\"modFrontBumper\":-1,\"modSideSkirt\":-1,\"modSmokeEnabled\":false,\"modTrimB\":-1,\"modAirFilter\":-1,\"neonEnabled\":[false,false,false,false],\"windowTint\":-1,\"extras\":{\"10\":false,\"11\":false},\"pearlescentColor\":7,\"modArmor\":-1,\"bodyHealth\":1000.0,\"modHydrolic\":-1,\"modGrille\":-1,\"plate\":\"CQ 089CQ\",\"wheels\":0,\"modDoorSpeaker\":-1,\"modHorns\":-1,\"modSpeakers\":-1,\"xenonColor\":255,\"color1\":6,\"modWindows\":-1}', 1000, 0, 0),
(50, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Issi RS', 'issi7', 'YJ 967YJ', '{\"xenonColor\":255,\"modDashboard\":-1,\"pearlescentColor\":18,\"fuelLevel\":65.0,\"modSuspension\":-1,\"windowTint\":-1,\"wheelColor\":112,\"modSpoilers\":-1,\"modFrontWheels\":-1,\"modArchCover\":-1,\"tyreSmokeColor\":[255,255,255],\"modSeats\":-1,\"modTrunk\":-1,\"modRightFender\":-1,\"neonEnabled\":[false,false,false,false],\"modSmokeEnabled\":false,\"color2\":112,\"modShifterLeavers\":-1,\"model\":1854776567,\"modEngine\":-1,\"wheels\":0,\"modWindows\":-1,\"tankHealth\":1000.0,\"modLivery\":-1,\"modHorns\":-1,\"plate\":\"YJ 967YJ\",\"modRoof\":-1,\"modEngineBlock\":-1,\"plateIndex\":0,\"modOrnaments\":-1,\"modTrimB\":-1,\"modDoorSpeaker\":-1,\"modBrakes\":-1,\"modAerials\":-1,\"modTrimA\":-1,\"modStruts\":-1,\"modRearBumper\":-1,\"modTurbo\":false,\"modFrontBumper\":-1,\"modSteeringWheel\":-1,\"modAPlate\":-1,\"neonColor\":[255,0,255],\"modTransmission\":-1,\"modExhaust\":-1,\"modBackWheels\":-1,\"modVanityPlate\":-1,\"extras\":{\"1\":true},\"modXenon\":false,\"modGrille\":-1,\"modFender\":-1,\"modHood\":-1,\"modTank\":-1,\"color1\":112,\"modDial\":-1,\"dirtLevel\":6.0,\"bodyHealth\":1000.0,\"modArmor\":-1,\"modSpeakers\":-1,\"modHydrolic\":-1,\"modSideSkirt\":-1,\"engineHealth\":1000.0,\"modFrame\":-1,\"modAirFilter\":-1,\"modPlateHolder\":-1}', 1000, 0, 0),
(51, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Club', 'club', 'RJ 369RJ', '{\"modDoorSpeaker\":-1,\"modLivery\":-1,\"modDashboard\":-1,\"modEngineBlock\":-1,\"wheels\":5,\"modHood\":-1,\"modArmor\":-1,\"modFrontBumper\":-1,\"engineHealth\":1000.0,\"modSeats\":-1,\"modRightFender\":-1,\"modShifterLeavers\":-1,\"xenonColor\":255,\"modBrakes\":-1,\"modFrontWheels\":-1,\"plateIndex\":0,\"modSpoilers\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"color2\":0,\"modXenon\":false,\"modHydrolic\":-1,\"modFender\":-1,\"modAerials\":-1,\"bodyHealth\":1000.0,\"modFrame\":-1,\"modTurbo\":false,\"modWindows\":-1,\"plate\":\"RJ 369RJ\",\"modEngine\":-1,\"extras\":{\"1\":true},\"neonEnabled\":[false,false,false,false],\"modSmokeEnabled\":false,\"windowTint\":-1,\"modAirFilter\":-1,\"modOrnaments\":-1,\"modTransmission\":-1,\"dirtLevel\":5.0,\"modVanityPlate\":-1,\"modAPlate\":-1,\"modPlateHolder\":-1,\"modTank\":-1,\"fuelLevel\":60.0,\"modBackWheels\":-1,\"modSpeakers\":-1,\"modExhaust\":-1,\"color1\":70,\"modRoof\":-1,\"pearlescentColor\":18,\"modDial\":-1,\"neonColor\":[255,0,255],\"modGrille\":-1,\"modTrimA\":-1,\"modArchCover\":-1,\"modTrimB\":-1,\"modSideSkirt\":-1,\"modSteeringWheel\":-1,\"tankHealth\":1000.0,\"modSuspension\":-1,\"modStruts\":-1,\"modHorns\":-1,\"wheelColor\":156,\"modRearBumper\":-1,\"model\":-2098954619}', 1000, 0, 0),
(52, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Issi', 'issi2', 'OP 281OP', '{\"modHood\":-1,\"modBackWheels\":-1,\"color1\":34,\"modGrille\":-1,\"modFrame\":-1,\"modPlateHolder\":-1,\"dirtLevel\":3.0,\"modSpoilers\":-1,\"modSmokeEnabled\":false,\"tankHealth\":1000.0,\"modWindows\":-1,\"wheels\":0,\"modTrunk\":-1,\"modFrontWheels\":-1,\"pearlescentColor\":28,\"modEngine\":-1,\"modOrnaments\":-1,\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modTrimA\":-1,\"modDoorSpeaker\":-1,\"bodyHealth\":1000.0,\"modExhaust\":-1,\"engineHealth\":1000.0,\"modSideSkirt\":-1,\"modRearBumper\":-1,\"plateIndex\":3,\"modArmor\":-1,\"modLivery\":-1,\"modShifterLeavers\":-1,\"modTrimB\":-1,\"modHorns\":-1,\"modRoof\":-1,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"modXenon\":false,\"fuelLevel\":65.0,\"windowTint\":-1,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"modSeats\":-1,\"extras\":{\"11\":false},\"modAirFilter\":-1,\"modSpeakers\":-1,\"modSteeringWheel\":-1,\"color2\":0,\"modHydrolic\":-1,\"model\":-1177863319,\"modBrakes\":-1,\"modDashboard\":-1,\"modTransmission\":-1,\"modStruts\":-1,\"modAerials\":-1,\"tyreSmokeColor\":[255,255,255],\"modAPlate\":-1,\"modArchCover\":-1,\"wheelColor\":156,\"modTank\":-1,\"xenonColor\":255,\"modRightFender\":-1,\"modSuspension\":-1,\"modFender\":-1,\"plate\":\"OP 281OP\",\"modTurbo\":false}', 1000, 0, 0),
(53, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Panto', 'panto', 'BD 555BD', '{\"tankHealth\":1000.0,\"bodyHealth\":1000.0,\"wheelColor\":156,\"modDashboard\":-1,\"xenonColor\":255,\"modAerials\":-1,\"pearlescentColor\":0,\"modRoof\":-1,\"modTrimB\":-1,\"modSpoilers\":-1,\"modLivery\":-1,\"modFrontWheels\":-1,\"modAirFilter\":-1,\"neonColor\":[255,0,255],\"modRightFender\":-1,\"modTurbo\":false,\"dirtLevel\":7.0,\"color1\":3,\"modDial\":-1,\"modSpeakers\":-1,\"modStruts\":-1,\"modHood\":-1,\"modEngine\":-1,\"modTank\":-1,\"plateIndex\":3,\"modOrnaments\":-1,\"modSteeringWheel\":-1,\"modArchCover\":-1,\"wheels\":5,\"windowTint\":-1,\"modSideSkirt\":-1,\"color2\":3,\"modFender\":-1,\"engineHealth\":1000.0,\"modBackWheels\":-1,\"modExhaust\":-1,\"modEngineBlock\":-1,\"modTrunk\":-1,\"modXenon\":false,\"modPlateHolder\":-1,\"tyreSmokeColor\":[255,255,255],\"modDoorSpeaker\":-1,\"modWindows\":-1,\"modRearBumper\":-1,\"modSmokeEnabled\":false,\"modFrame\":-1,\"modGrille\":-1,\"modAPlate\":-1,\"modHorns\":-1,\"fuelLevel\":65.0,\"extras\":{\"4\":true,\"5\":true,\"1\":true,\"2\":true,\"3\":true},\"model\":-431692672,\"modSuspension\":-1,\"modBrakes\":-1,\"modArmor\":-1,\"modSeats\":-1,\"modHydrolic\":-1,\"neonEnabled\":[false,false,false,false],\"modTrimA\":-1,\"modTransmission\":-1,\"plate\":\"BD 555BD\",\"modShifterLeavers\":-1,\"modFrontBumper\":-1,\"modVanityPlate\":-1}', 1000, 0, 0),
(54, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Brioso', 'brioso', 'AC 051AC', '{\"extras\":[],\"wheelColor\":92,\"modBrakes\":-1,\"tyreSmokeColor\":[255,255,255],\"xenonColor\":255,\"modEngine\":-1,\"pearlescentColor\":55,\"modSeats\":-1,\"modAPlate\":-1,\"modDashboard\":-1,\"plate\":\"AC 051AC\",\"modLivery\":-1,\"modFrame\":-1,\"modShifterLeavers\":-1,\"modOrnaments\":-1,\"modTrimB\":-1,\"modDial\":-1,\"wheels\":5,\"modSpoilers\":-1,\"windowTint\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modHorns\":-1,\"modFender\":-1,\"modSteeringWheel\":-1,\"modRoof\":-1,\"dirtLevel\":3.0,\"modSuspension\":-1,\"modRearBumper\":-1,\"modSpeakers\":-1,\"color1\":50,\"modExhaust\":-1,\"fuelLevel\":65.0,\"modTurbo\":false,\"modSideSkirt\":-1,\"modFrontWheels\":-1,\"modSmokeEnabled\":false,\"modPlateHolder\":-1,\"modTank\":-1,\"color2\":0,\"modArchCover\":-1,\"plateIndex\":0,\"modTrimA\":-1,\"modRightFender\":-1,\"modAerials\":-1,\"neonEnabled\":[false,false,false,false],\"model\":1549126457,\"modStruts\":-1,\"modTrunk\":-1,\"modAirFilter\":-1,\"modWindows\":-1,\"modVanityPlate\":-1,\"modBackWheels\":-1,\"modXenon\":false,\"engineHealth\":1000.0,\"modHydrolic\":-1,\"modEngineBlock\":-1,\"modArmor\":-1,\"bodyHealth\":1000.0,\"neonColor\":[255,0,255],\"modGrille\":-1,\"modDoorSpeaker\":-1,\"modTransmission\":-1,\"tankHealth\":1000.0}', 1000, 0, 0),
(55, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Abso', 'asbo', 'FQ 630FQ', '{\"neonColor\":[255,0,255],\"modSpoilers\":-1,\"modSmokeEnabled\":false,\"modOrnaments\":-1,\"modVanityPlate\":-1,\"plate\":\"FQ 630FQ\",\"bodyHealth\":1000.0,\"modAirFilter\":-1,\"modFrontBumper\":-1,\"modLivery\":-1,\"modRoof\":-1,\"color2\":111,\"wheels\":5,\"modSpeakers\":-1,\"modGrille\":-1,\"modDial\":-1,\"wheelColor\":156,\"tankHealth\":1000.0,\"extras\":[],\"modHorns\":-1,\"model\":1118611807,\"modDoorSpeaker\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modFender\":-1,\"modTrunk\":-1,\"modAerials\":-1,\"modSteeringWheel\":-1,\"fuelLevel\":65.0,\"modFrame\":-1,\"modTrimB\":-1,\"modEngine\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"dirtLevel\":8.0,\"modTurbo\":false,\"modSeats\":-1,\"modDashboard\":-1,\"modBackWheels\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modWindows\":-1,\"modShifterLeavers\":-1,\"modRearBumper\":-1,\"modArchCover\":-1,\"modStruts\":-1,\"pearlescentColor\":138,\"modExhaust\":-1,\"neonEnabled\":[false,false,false,false],\"modSideSkirt\":-1,\"modXenon\":false,\"modEngineBlock\":-1,\"engineHealth\":1000.0,\"modPlateHolder\":-1,\"xenonColor\":255,\"modTank\":-1,\"windowTint\":-1,\"plateIndex\":0,\"modFrontWheels\":-1,\"color1\":53,\"modAPlate\":-1,\"modHydrolic\":-1}', 1000, 0, 0),
(56, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Abso', 'asbo', 'FQ 630FQ', '{\"neonColor\":[255,0,255],\"modSpoilers\":-1,\"modSmokeEnabled\":false,\"modOrnaments\":-1,\"modVanityPlate\":-1,\"plate\":\"FQ 630FQ\",\"bodyHealth\":1000.0,\"modAirFilter\":-1,\"modFrontBumper\":-1,\"modLivery\":-1,\"modRoof\":-1,\"color2\":111,\"wheels\":5,\"modSpeakers\":-1,\"modGrille\":-1,\"modDial\":-1,\"wheelColor\":156,\"tankHealth\":1000.0,\"extras\":[],\"modHorns\":-1,\"model\":1118611807,\"modDoorSpeaker\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modFender\":-1,\"modTrunk\":-1,\"modAerials\":-1,\"modSteeringWheel\":-1,\"fuelLevel\":65.0,\"modFrame\":-1,\"modTrimB\":-1,\"modEngine\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"dirtLevel\":8.0,\"modTurbo\":false,\"modSeats\":-1,\"modDashboard\":-1,\"modBackWheels\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modWindows\":-1,\"modShifterLeavers\":-1,\"modRearBumper\":-1,\"modArchCover\":-1,\"modStruts\":-1,\"pearlescentColor\":138,\"modExhaust\":-1,\"neonEnabled\":[false,false,false,false],\"modSideSkirt\":-1,\"modXenon\":false,\"modEngineBlock\":-1,\"engineHealth\":1000.0,\"modPlateHolder\":-1,\"xenonColor\":255,\"modTank\":-1,\"windowTint\":-1,\"plateIndex\":0,\"modFrontWheels\":-1,\"color1\":53,\"modAPlate\":-1,\"modHydrolic\":-1}', 1000, 0, 0),
(57, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Brioso', 'brioso', 'BP 534BP', '{\"neonColor\":[255,0,255],\"modSpoilers\":-1,\"modSmokeEnabled\":false,\"modOrnaments\":-1,\"modVanityPlate\":-1,\"plate\":\"BP 534BP\",\"bodyHealth\":1000.0,\"modAirFilter\":-1,\"modFrontBumper\":-1,\"modLivery\":-1,\"modRoof\":-1,\"color2\":0,\"wheels\":5,\"modSpeakers\":-1,\"modGrille\":-1,\"modDial\":-1,\"wheelColor\":92,\"tankHealth\":1000.0,\"extras\":[],\"modHorns\":-1,\"model\":1549126457,\"modDoorSpeaker\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modFender\":-1,\"modTrunk\":-1,\"modAerials\":-1,\"modSteeringWheel\":-1,\"fuelLevel\":65.0,\"modFrame\":-1,\"modTrimB\":-1,\"modEngine\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"dirtLevel\":11.0,\"modTurbo\":false,\"modSeats\":-1,\"modDashboard\":-1,\"modBackWheels\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modWindows\":-1,\"modShifterLeavers\":-1,\"modRearBumper\":-1,\"modArchCover\":-1,\"modStruts\":-1,\"pearlescentColor\":55,\"modExhaust\":-1,\"neonEnabled\":[false,false,false,false],\"modSideSkirt\":-1,\"modXenon\":false,\"modEngineBlock\":-1,\"engineHealth\":1000.0,\"modPlateHolder\":-1,\"xenonColor\":255,\"modTank\":-1,\"windowTint\":-1,\"plateIndex\":0,\"modFrontWheels\":-1,\"color1\":50,\"modAPlate\":-1,\"modHydrolic\":-1}', 1000, 0, 0),
(58, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Abso', 'asbo', 'LZ 245LZ', '{\"neonColor\":[255,0,255],\"modSpoilers\":-1,\"modSmokeEnabled\":false,\"modOrnaments\":-1,\"modVanityPlate\":-1,\"plate\":\"LZ 245LZ\",\"bodyHealth\":1000.0,\"modAirFilter\":-1,\"modFrontBumper\":-1,\"modLivery\":-1,\"modRoof\":-1,\"color2\":111,\"wheels\":5,\"modSpeakers\":-1,\"modGrille\":-1,\"modDial\":-1,\"wheelColor\":156,\"tankHealth\":1000.0,\"extras\":[],\"modHorns\":-1,\"model\":1118611807,\"modDoorSpeaker\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modFender\":-1,\"modTrunk\":-1,\"modAerials\":-1,\"modSteeringWheel\":-1,\"fuelLevel\":65.0,\"modFrame\":-1,\"modTrimB\":-1,\"modEngine\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"dirtLevel\":8.0,\"modTurbo\":false,\"modSeats\":-1,\"modDashboard\":-1,\"modBackWheels\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modWindows\":-1,\"modShifterLeavers\":-1,\"modRearBumper\":-1,\"modArchCover\":-1,\"modStruts\":-1,\"pearlescentColor\":138,\"modExhaust\":-1,\"neonEnabled\":[false,false,false,false],\"modSideSkirt\":-1,\"modXenon\":false,\"modEngineBlock\":-1,\"engineHealth\":1000.0,\"modPlateHolder\":-1,\"xenonColor\":255,\"modTank\":-1,\"windowTint\":-1,\"plateIndex\":0,\"modFrontWheels\":-1,\"color1\":29,\"modAPlate\":-1,\"modHydrolic\":-1}', 1000, 0, 0),
(59, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Blista', 'blista', 'RD 858RD', '{\"modSeats\":-1,\"modAerials\":-1,\"modSuspension\":-1,\"modRightFender\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"plate\":\"RD 858RD\",\"modFrontWheels\":-1,\"wheels\":0,\"xenonColor\":255,\"dirtLevel\":11.0,\"modRearBumper\":-1,\"modHorns\":-1,\"modLivery\":-1,\"extras\":{\"12\":false,\"10\":true},\"modDashboard\":-1,\"modFrontBumper\":-1,\"modTrimB\":-1,\"modExhaust\":-1,\"tankHealth\":1000.0,\"modEngine\":-1,\"modVanityPlate\":-1,\"modTurbo\":false,\"modBrakes\":-1,\"modHydrolic\":-1,\"modXenon\":false,\"modGrille\":-1,\"modSmokeEnabled\":false,\"modWindows\":-1,\"modArchCover\":-1,\"modSteeringWheel\":-1,\"modShifterLeavers\":-1,\"modSpoilers\":-1,\"modFender\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"modEngineBlock\":-1,\"modHood\":-1,\"modSpeakers\":-1,\"modBackWheels\":-1,\"color1\":7,\"modSideSkirt\":-1,\"model\":-344943009,\"fuelLevel\":65.0,\"neonColor\":[255,0,255],\"color2\":0,\"windowTint\":-1,\"modTank\":-1,\"modFrame\":-1,\"modTrimA\":-1,\"modAirFilter\":-1,\"wheelColor\":156,\"pearlescentColor\":5,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"engineHealth\":1000.0,\"modRoof\":-1,\"modPlateHolder\":-1,\"bodyHealth\":1000.0,\"plateIndex\":0,\"modStruts\":-1,\"modDoorSpeaker\":-1,\"modOrnaments\":-1,\"modAPlate\":-1}', 1000, 0, 0),
(60, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Prairie', 'prairie', 'ZI 415ZI', '{\"modSeats\":-1,\"modAerials\":-1,\"modSuspension\":-1,\"modRightFender\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"plate\":\"ZI 415ZI\",\"modFrontWheels\":-1,\"wheels\":0,\"xenonColor\":255,\"dirtLevel\":6.0,\"modRearBumper\":-1,\"modHorns\":-1,\"modLivery\":-1,\"extras\":{\"10\":true,\"11\":false},\"modDashboard\":-1,\"modFrontBumper\":-1,\"modTrimB\":-1,\"modExhaust\":-1,\"tankHealth\":1000.0,\"modEngine\":-1,\"modVanityPlate\":-1,\"modTurbo\":false,\"modBrakes\":-1,\"modHydrolic\":-1,\"modXenon\":false,\"modGrille\":-1,\"modSmokeEnabled\":false,\"modWindows\":-1,\"modArchCover\":-1,\"modSteeringWheel\":-1,\"modShifterLeavers\":-1,\"modSpoilers\":-1,\"modFender\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"modEngineBlock\":-1,\"modHood\":-1,\"modSpeakers\":-1,\"modBackWheels\":-1,\"color1\":6,\"modSideSkirt\":-1,\"model\":-1450650718,\"fuelLevel\":65.0,\"neonColor\":[255,0,255],\"color2\":0,\"windowTint\":-1,\"modTank\":-1,\"modFrame\":-1,\"modTrimA\":-1,\"modAirFilter\":-1,\"wheelColor\":156,\"pearlescentColor\":7,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"engineHealth\":1000.0,\"modRoof\":-1,\"modPlateHolder\":-1,\"bodyHealth\":1000.0,\"plateIndex\":0,\"modStruts\":-1,\"modDoorSpeaker\":-1,\"modOrnaments\":-1,\"modAPlate\":-1}', 1000, 0, 0),
(61, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Prairie', 'prairie', 'NW 746NW', '{\"modSeats\":-1,\"modAerials\":-1,\"modSuspension\":-1,\"modRightFender\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"plate\":\"NW 746NW\",\"modFrontWheels\":-1,\"wheels\":0,\"xenonColor\":255,\"dirtLevel\":7.0,\"modRearBumper\":-1,\"modHorns\":-1,\"modLivery\":-1,\"extras\":{\"10\":true,\"11\":false},\"modDashboard\":-1,\"modFrontBumper\":-1,\"modTrimB\":-1,\"modExhaust\":-1,\"tankHealth\":1000.0,\"modEngine\":-1,\"modVanityPlate\":-1,\"modTurbo\":false,\"modBrakes\":-1,\"modHydrolic\":-1,\"modXenon\":false,\"modGrille\":-1,\"modSmokeEnabled\":false,\"modWindows\":-1,\"modArchCover\":-1,\"modSteeringWheel\":-1,\"modShifterLeavers\":-1,\"modSpoilers\":-1,\"modFender\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"modEngineBlock\":-1,\"modHood\":-1,\"modSpeakers\":-1,\"modBackWheels\":-1,\"color1\":29,\"modSideSkirt\":-1,\"model\":-1450650718,\"fuelLevel\":65.0,\"neonColor\":[255,0,255],\"color2\":0,\"windowTint\":-1,\"modTank\":-1,\"modFrame\":-1,\"modTrimA\":-1,\"modAirFilter\":-1,\"wheelColor\":156,\"pearlescentColor\":30,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"engineHealth\":1000.0,\"modRoof\":-1,\"modPlateHolder\":-1,\"bodyHealth\":1000.0,\"plateIndex\":0,\"modStruts\":-1,\"modDoorSpeaker\":-1,\"modOrnaments\":-1,\"modAPlate\":-1}', 1000, 0, 0),
(62, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Blista', 'blista', 'JJ 168JJ', '{\"neonEnabled\":[false,false,false,false],\"modEngineBlock\":-1,\"modTrunk\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"modSuspension\":-1,\"modFrame\":-1,\"modFender\":-1,\"plateIndex\":0,\"modRightFender\":-1,\"modArchCover\":-1,\"modTrimA\":-1,\"modSteeringWheel\":-1,\"color2\":0,\"modLivery\":-1,\"dirtLevel\":11.0,\"color1\":7,\"modHydrolic\":-1,\"modExhaust\":-1,\"modTank\":-1,\"modArmor\":-1,\"model\":-344943009,\"modDoorSpeaker\":-1,\"modAerials\":-1,\"modStruts\":-1,\"modPlateHolder\":-1,\"tankHealth\":1000.0,\"wheelColor\":156,\"modSpoilers\":-1,\"modFrontBumper\":-1,\"modHorns\":-1,\"wheels\":0,\"modWindows\":-1,\"pearlescentColor\":5,\"modSmokeEnabled\":false,\"engineHealth\":1000.0,\"modSeats\":-1,\"xenonColor\":255,\"modXenon\":false,\"fuelLevel\":65.0,\"modBackWheels\":-1,\"modGrille\":-1,\"modTurbo\":false,\"modDial\":-1,\"modEngine\":-1,\"modTrimB\":-1,\"modOrnaments\":-1,\"modAirFilter\":-1,\"modTransmission\":-1,\"neonColor\":[255,0,255],\"modBrakes\":-1,\"extras\":{\"10\":false,\"12\":false},\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modFrontWheels\":-1,\"modSideSkirt\":-1,\"plate\":\"JJ 168JJ\",\"modSpeakers\":-1,\"modAPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modRoof\":-1,\"bodyHealth\":1000.0}', 1000, 0, 0),
(63, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Panto', 'panto', 'QN 829QN', '{\"modRearBumper\":-1,\"modFrame\":-1,\"modDashboard\":-1,\"plateIndex\":3,\"modTransmission\":-1,\"pearlescentColor\":0,\"modAirFilter\":-1,\"bodyHealth\":1000.0,\"modGrille\":-1,\"modSeats\":-1,\"modTurbo\":false,\"modTrunk\":-1,\"neonEnabled\":[false,false,false,false],\"plate\":\"QN 829QN\",\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modRoof\":-1,\"modVanityPlate\":-1,\"neonColor\":[255,0,255],\"modTank\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"modXenon\":false,\"tankHealth\":1000.0,\"modFrontBumper\":-1,\"modArchCover\":-1,\"modHorns\":-1,\"color1\":3,\"modAPlate\":-1,\"modStruts\":-1,\"modShifterLeavers\":-1,\"modRightFender\":-1,\"wheelColor\":156,\"model\":-431692672,\"modArmor\":-1,\"modOrnaments\":-1,\"modPlateHolder\":-1,\"modBrakes\":-1,\"modFender\":-1,\"modLivery\":-1,\"extras\":{\"3\":true,\"4\":true,\"5\":true,\"1\":true,\"2\":true},\"modFrontWheels\":-1,\"modSmokeEnabled\":false,\"modSteeringWheel\":-1,\"modWindows\":-1,\"modEngineBlock\":-1,\"modTrimB\":-1,\"modEngine\":-1,\"modExhaust\":-1,\"fuelLevel\":65.0,\"modSpoilers\":-1,\"modSideSkirt\":-1,\"engineHealth\":1000.0,\"modBackWheels\":-1,\"modAerials\":-1,\"modSpeakers\":-1,\"modDoorSpeaker\":-1,\"modDial\":-1,\"windowTint\":-1,\"modHydrolic\":-1,\"xenonColor\":255,\"wheels\":5,\"color2\":3,\"dirtLevel\":7.0}', 1000, 0, 0),
(64, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Dilettante', 'dilettante', 'FJ 663FJ', '{\"modSpoilers\":-1,\"modEngine\":-1,\"modRightFender\":-1,\"modTrunk\":-1,\"color1\":0,\"modSteeringWheel\":-1,\"modAerials\":-1,\"modXenon\":false,\"modSpeakers\":-1,\"modHorns\":-1,\"modTransmission\":-1,\"modTank\":-1,\"modTrimA\":-1,\"modTrimB\":-1,\"modGrille\":-1,\"modFrontBumper\":-1,\"modTurbo\":false,\"modDashboard\":-1,\"wheels\":0,\"modShifterLeavers\":-1,\"modOrnaments\":-1,\"modSideSkirt\":-1,\"neonEnabled\":[false,false,false,false],\"fuelLevel\":65.0,\"modDial\":-1,\"modSmokeEnabled\":false,\"modWindows\":-1,\"modPlateHolder\":-1,\"modSuspension\":-1,\"dirtLevel\":10.0,\"modBackWheels\":-1,\"modFrame\":-1,\"modFrontWheels\":-1,\"modFender\":-1,\"modLivery\":-1,\"windowTint\":-1,\"wheelColor\":156,\"modStruts\":-1,\"tankHealth\":1000.0,\"modEngineBlock\":-1,\"tyreSmokeColor\":[255,255,255],\"modDoorSpeaker\":-1,\"modSeats\":-1,\"extras\":{\"10\":true},\"model\":-1130810103,\"plate\":\"FJ 663FJ\",\"modArchCover\":-1,\"modExhaust\":-1,\"modRoof\":-1,\"modRearBumper\":-1,\"engineHealth\":1000.0,\"modBrakes\":-1,\"modArmor\":-1,\"modVanityPlate\":-1,\"modHydrolic\":-1,\"modAPlate\":-1,\"modAirFilter\":-1,\"bodyHealth\":1000.0,\"modHood\":-1,\"pearlescentColor\":1,\"plateIndex\":3,\"neonColor\":[255,0,255],\"color2\":0,\"xenonColor\":255}', 1000, 0, 0),
(65, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Issi', 'issi2', 'JL 123JL', '{\"modEngineBlock\":-1,\"modExhaust\":-1,\"tankHealth\":1000.0,\"modSpoilers\":-1,\"engineHealth\":1000.0,\"modGrille\":-1,\"modTrimB\":-1,\"color2\":0,\"modSeats\":-1,\"bodyHealth\":1000.0,\"modHydrolic\":-1,\"modAerials\":-1,\"modRightFender\":-1,\"modOrnaments\":-1,\"pearlescentColor\":111,\"modEngine\":-1,\"modXenon\":false,\"modTurbo\":false,\"modShifterLeavers\":-1,\"fuelLevel\":65.0,\"modDashboard\":-1,\"modHorns\":-1,\"modFrontBumper\":-1,\"dirtLevel\":7.0,\"color1\":6,\"modVanityPlate\":-1,\"modAPlate\":-1,\"xenonColor\":255,\"modBrakes\":-1,\"modSideSkirt\":-1,\"neonColor\":[255,0,255],\"modWindows\":-1,\"modDoorSpeaker\":-1,\"model\":-1177863319,\"modSmokeEnabled\":false,\"modSteeringWheel\":-1,\"plate\":\"JL 123JL\",\"modBackWheels\":-1,\"modAirFilter\":-1,\"modLivery\":-1,\"modPlateHolder\":-1,\"modTrimA\":-1,\"modFender\":-1,\"modTrunk\":-1,\"neonEnabled\":[false,false,false,false],\"wheelColor\":156,\"modRoof\":-1,\"modRearBumper\":-1,\"modArmor\":-1,\"modDial\":-1,\"modTank\":-1,\"wheels\":0,\"plateIndex\":3,\"modStruts\":-1,\"modFrame\":-1,\"windowTint\":-1,\"modTransmission\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrontWheels\":-1,\"modHood\":-1,\"modArchCover\":-1,\"modSpeakers\":-1,\"modSuspension\":-1,\"extras\":{\"11\":false}}', 1000, 0, 0),
(66, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Dilettante', 'dilettante', 'DA 552DA', '{\"wheelColor\":156,\"wheels\":0,\"modPlateHolder\":-1,\"xenonColor\":255,\"modHydrolic\":-1,\"modArmor\":-1,\"modDoorSpeaker\":-1,\"modBrakes\":-1,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"modRightFender\":-1,\"modEngine\":-1,\"modOrnaments\":-1,\"fuelLevel\":65.0,\"bodyHealth\":1000.0,\"modTrimA\":-1,\"modTurbo\":false,\"modLivery\":-1,\"modFrame\":-1,\"model\":-1130810103,\"modTransmission\":-1,\"modSpeakers\":-1,\"modSideSkirt\":-1,\"neonColor\":[255,0,255],\"modGrille\":-1,\"modVanityPlate\":-1,\"modHorns\":-1,\"tyreSmokeColor\":[255,255,255],\"modSteeringWheel\":-1,\"modAirFilter\":-1,\"modFrontWheels\":-1,\"modSpoilers\":-1,\"modDial\":-1,\"modEngineBlock\":-1,\"modFender\":-1,\"color1\":0,\"plateIndex\":0,\"tankHealth\":1000.0,\"modXenon\":false,\"modBackWheels\":-1,\"modAerials\":-1,\"modAPlate\":-1,\"modFrontBumper\":-1,\"modTrunk\":-1,\"modRearBumper\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modWindows\":-1,\"color2\":0,\"modSmokeEnabled\":false,\"dirtLevel\":8.0,\"modExhaust\":-1,\"engineHealth\":1000.0,\"modArchCover\":-1,\"modStruts\":-1,\"extras\":{\"10\":false},\"plate\":\"DA 552DA\",\"modRoof\":-1,\"pearlescentColor\":1,\"modTank\":-1,\"modTrimB\":-1,\"modSeats\":-1,\"modSuspension\":-1,\"windowTint\":-1}', 1000, 0, 0),
(67, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Rhapsody', 'rhapsody', 'FW 190FW', '{\"model\":841808271,\"modRoof\":-1,\"extras\":[],\"modGrille\":-1,\"color2\":0,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"wheelColor\":156,\"modHydrolic\":-1,\"modStruts\":-1,\"modShifterLeavers\":-1,\"modAerials\":-1,\"modLivery\":-1,\"modTransmission\":-1,\"modEngine\":-1,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"plateIndex\":0,\"modSuspension\":-1,\"modAPlate\":-1,\"modOrnaments\":-1,\"plate\":\"FW 190FW\",\"modEngineBlock\":-1,\"bodyHealth\":1000.0,\"modTank\":-1,\"pearlescentColor\":4,\"modAirFilter\":-1,\"wheels\":1,\"modSpeakers\":-1,\"color1\":1,\"modSmokeEnabled\":false,\"modRearBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"modSideSkirt\":-1,\"neonEnabled\":[false,false,false,false],\"modTurbo\":false,\"xenonColor\":255,\"modSteeringWheel\":-1,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modFrontWheels\":-1,\"modBackWheels\":-1,\"modArmor\":-1,\"neonColor\":[255,0,255],\"modArchCover\":-1,\"modTrimA\":-1,\"modWindows\":-1,\"modExhaust\":-1,\"modSeats\":-1,\"modPlateHolder\":-1,\"modFender\":-1,\"modRightFender\":-1,\"tankHealth\":1000.0,\"modDial\":-1,\"dirtLevel\":9.0,\"modTrunk\":-1,\"modBrakes\":-1,\"modTrimB\":-1,\"windowTint\":-1,\"fuelLevel\":65.0,\"modFrame\":-1,\"modXenon\":false,\"modDashboard\":-1}', 1000, 0, 0),
(68, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Kanjo', 'kanjo', 'LX 790LX', '{\"modRightFender\":-1,\"modGrille\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"tyreSmokeColor\":[255,255,255],\"fuelLevel\":65.0,\"modHorns\":-1,\"modAPlate\":-1,\"color2\":0,\"modStruts\":-1,\"modTrunk\":-1,\"modDashboard\":-1,\"modSideSkirt\":-1,\"windowTint\":-1,\"modDoorSpeaker\":-1,\"modArmor\":-1,\"plate\":\"LX 790LX\",\"plateIndex\":0,\"modXenon\":false,\"wheels\":5,\"engineHealth\":1000.0,\"extras\":{\"1\":true},\"tankHealth\":1000.0,\"wheelColor\":156,\"modTurbo\":false,\"modPlateHolder\":-1,\"modSuspension\":-1,\"modTrimB\":-1,\"modTrimA\":-1,\"modEngine\":-1,\"modSmokeEnabled\":false,\"modWindows\":-1,\"modRoof\":-1,\"bodyHealth\":1000.0,\"modExhaust\":-1,\"modFrontWheels\":-1,\"modAirFilter\":-1,\"modRearBumper\":-1,\"modHydrolic\":-1,\"color1\":0,\"modDial\":-1,\"modLivery\":-1,\"modFrame\":-1,\"modEngineBlock\":-1,\"modFender\":-1,\"modOrnaments\":-1,\"modTank\":-1,\"neonEnabled\":[false,false,false,false],\"neonColor\":[255,0,255],\"modAerials\":-1,\"modSpoilers\":-1,\"modArchCover\":-1,\"xenonColor\":255,\"modVanityPlate\":-1,\"modSteeringWheel\":-1,\"modBrakes\":-1,\"modHood\":-1,\"model\":409049982,\"modBackWheels\":-1,\"modFrontBumper\":-1,\"dirtLevel\":5.0,\"pearlescentColor\":10,\"modSeats\":-1,\"modTransmission\":-1}', 1000, 0, 0),
(69, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Dilettante', 'dilettante', 'DG 062DG', '{\"modArmor\":-1,\"modDashboard\":-1,\"modSteeringWheel\":-1,\"wheels\":0,\"modTrimA\":-1,\"windowTint\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"plateIndex\":0,\"neonEnabled\":[false,false,false,false],\"modFrame\":-1,\"bodyHealth\":1000.0,\"modSpeakers\":-1,\"modStruts\":-1,\"modHood\":-1,\"modFender\":-1,\"modTank\":-1,\"modFrontBumper\":-1,\"modSuspension\":-1,\"modHydrolic\":-1,\"modArchCover\":-1,\"modHorns\":-1,\"modWindows\":-1,\"plate\":\"DG 062DG\",\"wheelColor\":156,\"modPlateHolder\":-1,\"modLivery\":-1,\"modDoorSpeaker\":-1,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"model\":-1130810103,\"modEngine\":-1,\"modAirFilter\":-1,\"xenonColor\":255,\"modEngineBlock\":-1,\"modSpoilers\":-1,\"color1\":0,\"modRoof\":-1,\"modSeats\":-1,\"modSideSkirt\":-1,\"modAerials\":-1,\"modExhaust\":-1,\"extras\":{\"10\":true},\"modTransmission\":-1,\"neonColor\":[255,0,255],\"tankHealth\":1000.0,\"modTrunk\":-1,\"modOrnaments\":-1,\"engineHealth\":1000.0,\"dirtLevel\":5.0,\"modBrakes\":-1,\"modBackWheels\":-1,\"modRearBumper\":-1,\"color2\":0,\"modXenon\":false,\"modAPlate\":-1,\"modRightFender\":-1,\"modShifterLeavers\":-1,\"pearlescentColor\":1,\"fuelLevel\":65.0,\"modSmokeEnabled\":false,\"modTurbo\":false,\"modTrimB\":-1,\"modDial\":-1}', 1000, 0, 0),
(70, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Pariah', 'pariah', 'DG 562DG', '{\"modTrunk\":-1,\"neonColor\":[255,0,255],\"model\":867799010,\"wheels\":7,\"modOrnaments\":-1,\"tankHealth\":1000.0,\"modHydrolic\":-1,\"modFrame\":-1,\"modTransmission\":-1,\"modDial\":-1,\"modPlateHolder\":-1,\"fuelLevel\":60.0,\"modXenon\":false,\"modTrimA\":-1,\"modGrille\":-1,\"modWindows\":-1,\"modRoof\":-1,\"dirtLevel\":8.0,\"modVanityPlate\":-1,\"modFender\":-1,\"plateIndex\":0,\"modSideSkirt\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modSpoilers\":-1,\"extras\":[],\"modStruts\":-1,\"windowTint\":-1,\"modDashboard\":-1,\"modHorns\":-1,\"modSmokeEnabled\":false,\"modTank\":-1,\"modSpeakers\":-1,\"engineHealth\":1000.0,\"modEngineBlock\":-1,\"wheelColor\":112,\"modEngine\":-1,\"tyreSmokeColor\":[255,255,255],\"modBackWheels\":-1,\"modSteeringWheel\":-1,\"modDoorSpeaker\":-1,\"modAerials\":-1,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modExhaust\":-1,\"color1\":24,\"pearlescentColor\":0,\"modFrontWheels\":-1,\"modFrontBumper\":-1,\"plate\":\"DG 562DG\",\"modLivery\":-1,\"xenonColor\":255,\"modRightFender\":-1,\"modArmor\":-1,\"modTrimB\":-1,\"modSuspension\":-1,\"modHood\":-1,\"modSeats\":-1,\"bodyHealth\":1000.0,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"color2\":32,\"modBrakes\":-1,\"modArchCover\":-1}', 1000, 0, 0);

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
-- Index pour la table `users_bans`
--
ALTER TABLE `users_bans`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `users_calendar`
--
ALTER TABLE `users_calendar`
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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `users_bans`
--
ALTER TABLE `users_bans`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `users_calendar`
--
ALTER TABLE `users_calendar`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `users_warns`
--
ALTER TABLE `users_warns`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
