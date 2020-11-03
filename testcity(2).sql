-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 03 nov. 2020 à 19:32
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
('Eau', 'water', 1, 0, 1),
('headbag', 'Sac', 1, 0, 1),
('Pain', 'bread', 1, 0, 1),
('Sandwich', 'sandwich', 1, 0, 1),
('serfelx', 'Serflex', 1, 0, 1),
('silencieux', 'Silencieux', 1, 0, 1),
('Téléphone', 'phone', 1, 0, 1);

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
('3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', '{\"jeton\":0,\"bank\":11800,\"black_money\":0,\"money\":3000}', 'admin', '{\"Hunger\":100,\"Thrist\":100}', 'Homme', '{\"ArmsIndex\":2,\"ChaussureIndex2\":4,\"DadIndex\":2,\"ChaussureIndex\":7,\"TshirtIndex2\":7,\"PantalonIndex2\":9,\"PantalonIndex\":9,\"VesteIndex2\":3,\"VesteIndex\":6,\"TshirtIndex\":6,\"BarbeIndex\":3,\"PedIndex\":\"mp_m_freemode_01\",\"OeilIndex\":3,\"MotherIndex\":2,\"CouleurIndex\":2,\"CheuveuxIndex\":4}', 'Yan', 'Labray', '15/03/1996', 186, '[]', 'unemployed', 0, '{\"WEAPON_DAGGER\":{\"ammo\":50}}', '{\"heading\":223.8,\"z\":4.3,\"y\":-1711.5,\"x\":-1083.7}');

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
  `Stored` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users_vehicles`
--

INSERT INTO `users_vehicles` (`Id`, `Identifier`, `Label`, `Hash`, `Plate`, `Props`, `Health`, `Stored`) VALUES
(6, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Pfister811', 'pfister811', 'JQ 584ON', '{\"dirtLevel\":1.0,\"modGrille\":-1,\"modRoof\":-1,\"modDashboard\":-1,\"modArmor\":-1,\"pearlescentColor\":92,\"xenonColor\":255,\"modEngine\":-1,\"modFender\":-1,\"modDial\":-1,\"modEngineBlock\":-1,\"color1\":0,\"modOrnaments\":-1,\"modTank\":-1,\"modShifterLeavers\":-1,\"modArchCover\":-1,\"modAerials\":-1,\"modFrontBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modLivery\":-1,\"extras\":{\"1\":false},\"tankHealth\":1000.0,\"windowTint\":-1,\"modXenon\":false,\"modTransmission\":-1,\"modBackWheels\":-1,\"modAPlate\":-1,\"modSteeringWheel\":-1,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"modSpoilers\":-1,\"color2\":57,\"modTurbo\":false,\"modHood\":-1,\"modSideSkirt\":-1,\"modSmokeEnabled\":false,\"modSeats\":-1,\"modRightFender\":-1,\"model\":-1829802492,\"wheelColor\":156,\"modFrontWheels\":-1,\"neonColor\":[255,0,255],\"modVanityPlate\":-1,\"modTrimA\":-1,\"modSuspension\":-1,\"modPlateHolder\":-1,\"modHorns\":-1,\"plate\":\"JQ 584ON\",\"modStruts\":-1,\"modFrame\":-1,\"modWindows\":-1,\"bodyHealth\":1000.0,\"modTrunk\":-1,\"modRearBumper\":-1,\"modBrakes\":-1,\"wheels\":7,\"engineHealth\":1000.0,\"modAirFilter\":-1,\"modExhaust\":-1,\"tyreSmokeColor\":[255,255,255],\"fuelLevel\":60.0,\"modHydrolic\":-1,\"plateIndex\":0,\"modSpeakers\":-1}', 1000, 0),
(7, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Penetrator', 'penetrator', 'DZ 747RT', '{\"modEngine\":-1,\"modOrnaments\":-1,\"modLivery\":-1,\"modBackWheels\":-1,\"wheelColor\":156,\"fuelLevel\":65.0,\"modFrontBumper\":-1,\"windowTint\":-1,\"modTrunk\":-1,\"bodyHealth\":1000.0,\"modArchCover\":-1,\"plateIndex\":0,\"xenonColor\":255,\"modFrontWheels\":-1,\"modEngineBlock\":-1,\"modHood\":-1,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"modDashboard\":-1,\"modTurbo\":false,\"modPlateHolder\":-1,\"modGrille\":-1,\"pearlescentColor\":18,\"engineHealth\":1000.0,\"modRightFender\":-1,\"model\":-1758137366,\"modAPlate\":-1,\"modSpoilers\":-1,\"plate\":\"DZ 747RT\",\"neonEnabled\":[false,false,false,false],\"modVanityPlate\":-1,\"modFender\":-1,\"modShifterLeavers\":-1,\"modTrimA\":-1,\"modWindows\":-1,\"modRoof\":-1,\"modXenon\":false,\"modExhaust\":-1,\"modTrimB\":-1,\"modRearBumper\":-1,\"modDial\":-1,\"modHydrolic\":-1,\"modSpeakers\":-1,\"modAirFilter\":-1,\"modArmor\":-1,\"color1\":32,\"tankHealth\":1000.0,\"wheels\":0,\"modHorns\":-1,\"extras\":[],\"modSeats\":-1,\"modSideSkirt\":-1,\"modTransmission\":-1,\"tyreSmokeColor\":[255,255,255],\"dirtLevel\":2.0,\"modFrame\":-1,\"modSmokeEnabled\":false,\"modSteeringWheel\":-1,\"modTank\":-1,\"neonColor\":[255,0,255],\"modBrakes\":-1,\"color2\":4,\"modStruts\":-1,\"modAerials\":-1}', 1000, 0),
(8, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Torero', 'torero', 'PF 703PF', '{\"modHood\":-1,\"plate\":\"PF 703PF\",\"modStruts\":-1,\"modTank\":-1,\"modFrontBumper\":-1,\"modVanityPlate\":-1,\"modSeats\":-1,\"modRightFender\":-1,\"modSpoilers\":-1,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"wheels\":7,\"modTrimA\":-1,\"engineHealth\":1000.0,\"tyreSmokeColor\":[255,255,255],\"modSideSkirt\":-1,\"modEngine\":-1,\"color1\":0,\"plateIndex\":0,\"pearlescentColor\":0,\"bodyHealth\":1000.0,\"modExhaust\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"fuelLevel\":65.0,\"modXenon\":false,\"modHorns\":-1,\"xenonColor\":255,\"color2\":0,\"modBrakes\":-1,\"modShifterLeavers\":-1,\"modLivery\":-1,\"modBackWheels\":-1,\"modEngineBlock\":-1,\"modGrille\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modSuspension\":-1,\"tankHealth\":1000.0,\"model\":1504306544,\"modTrunk\":-1,\"modDial\":-1,\"modOrnaments\":-1,\"extras\":[],\"modFrame\":-1,\"modRearBumper\":-1,\"modTransmission\":-1,\"wheelColor\":156,\"modHydrolic\":-1,\"modSmokeEnabled\":false,\"modPlateHolder\":-1,\"modFrontWheels\":-1,\"modRoof\":-1,\"modSteeringWheel\":-1,\"modFender\":-1,\"modSpeakers\":-1,\"modArchCover\":-1,\"modArmor\":-1,\"modAirFilter\":-1,\"dirtLevel\":4.0,\"modDashboard\":-1,\"neonColor\":[255,0,255],\"neonEnabled\":[false,false,false,false],\"modWindows\":-1}', 1000, 0),
(9, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Taipan', 'taipan', 'FG 164FG', '{\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modTrimB\":-1,\"neonColor\":[255,0,255],\"color1\":11,\"modFrame\":-1,\"modEngineBlock\":-1,\"modHood\":-1,\"modSeats\":-1,\"plateIndex\":0,\"modAPlate\":-1,\"windowTint\":-1,\"modGrille\":-1,\"modExhaust\":-1,\"modSmokeEnabled\":false,\"modXenon\":false,\"bodyHealth\":1000.0,\"modRoof\":-1,\"color2\":38,\"pearlescentColor\":7,\"engineHealth\":1000.0,\"modArmor\":-1,\"modTrunk\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"modDial\":-1,\"modTank\":-1,\"modOrnaments\":-1,\"modSpeakers\":-1,\"modAerials\":-1,\"modDoorSpeaker\":-1,\"modSpoilers\":-1,\"dirtLevel\":6.0,\"modStruts\":-1,\"modLivery\":-1,\"modSuspension\":-1,\"modPlateHolder\":-1,\"model\":-1134706562,\"wheels\":7,\"neonEnabled\":[false,false,false,false],\"modTransmission\":-1,\"modHorns\":-1,\"modArchCover\":-1,\"modFender\":-1,\"extras\":[],\"modTurbo\":false,\"modRightFender\":-1,\"modBrakes\":-1,\"modDashboard\":-1,\"modTrimA\":-1,\"tankHealth\":1000.0,\"modVanityPlate\":-1,\"modAirFilter\":-1,\"modFrontBumper\":-1,\"plate\":\"FG 164FG\",\"modShifterLeavers\":-1,\"modRearBumper\":-1,\"modEngine\":-1,\"fuelLevel\":65.0,\"wheelColor\":38,\"modWindows\":-1,\"tyreSmokeColor\":[255,255,255],\"xenonColor\":255,\"modSteeringWheel\":-1}', 1000, 0),
(10, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Infernus', 'infernus2', 'CQ 081CQ', '{\"modEngine\":-1,\"modRearBumper\":-1,\"wheels\":7,\"modSideSkirt\":-1,\"modTurbo\":false,\"modBrakes\":-1,\"modSpoilers\":-1,\"modDoorSpeaker\":-1,\"modWindows\":-1,\"color1\":145,\"modXenon\":false,\"modBackWheels\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modLivery\":-1,\"modTrunk\":-1,\"tankHealth\":1000.0,\"xenonColor\":255,\"plateIndex\":0,\"modDashboard\":-1,\"modShifterLeavers\":-1,\"modFender\":-1,\"fuelLevel\":65.0,\"modAPlate\":-1,\"model\":-1405937764,\"modFrontBumper\":-1,\"modHydrolic\":-1,\"dirtLevel\":5.0,\"modGrille\":-1,\"wheelColor\":112,\"modHood\":-1,\"modSmokeEnabled\":false,\"modTank\":-1,\"pearlescentColor\":18,\"modRightFender\":-1,\"color2\":0,\"modPlateHolder\":-1,\"tyreSmokeColor\":[255,255,255],\"modAirFilter\":-1,\"modOrnaments\":-1,\"modFrontWheels\":-1,\"modAerials\":-1,\"modStruts\":-1,\"extras\":[],\"modArmor\":-1,\"modFrame\":-1,\"modExhaust\":-1,\"bodyHealth\":1000.0,\"modDial\":-1,\"modSpeakers\":-1,\"engineHealth\":1000.0,\"modSeats\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"modVanityPlate\":-1,\"plate\":\"CQ 081CQ\",\"neonColor\":[255,0,255],\"modRoof\":-1,\"modEngineBlock\":-1,\"modArchCover\":-1,\"modHorns\":-1,\"modTransmission\":-1,\"neonEnabled\":[false,false,false,false],\"modTrimB\":-1}', 1000, 0),
(11, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Xa21', 'xa21', 'KO 677KO', '{\"fuelLevel\":65.0,\"modSpoilers\":-1,\"model\":917809321,\"modTrimA\":-1,\"modEngineBlock\":-1,\"modPlateHolder\":-1,\"xenonColor\":255,\"extras\":[],\"modFrontBumper\":-1,\"modShifterLeavers\":-1,\"modXenon\":false,\"modHorns\":-1,\"plate\":\"KO 677KO\",\"modRearBumper\":-1,\"bodyHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modHydrolic\":-1,\"wheels\":7,\"modSteeringWheel\":-1,\"modSeats\":-1,\"modOrnaments\":-1,\"plateIndex\":0,\"neonColor\":[255,0,255],\"wheelColor\":5,\"modRoof\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrame\":-1,\"modDial\":-1,\"modSpeakers\":-1,\"modTrimB\":-1,\"modSideSkirt\":-1,\"tankHealth\":1000.0,\"modEngine\":-1,\"dirtLevel\":0.0,\"modGrille\":-1,\"modTurbo\":false,\"modLivery\":-1,\"modRightFender\":-1,\"modSuspension\":-1,\"modAirFilter\":-1,\"modVanityPlate\":-1,\"modWindows\":-1,\"color1\":29,\"modSmokeEnabled\":false,\"modHood\":-1,\"engineHealth\":1000.0,\"windowTint\":-1,\"modDashboard\":-1,\"modTransmission\":-1,\"modFrontWheels\":-1,\"color2\":7,\"modAPlate\":-1,\"modArchCover\":-1,\"modTank\":-1,\"pearlescentColor\":5,\"modDoorSpeaker\":-1,\"modArmor\":-1,\"modAerials\":-1,\"modFender\":-1,\"modTrunk\":-1,\"modExhaust\":-1,\"modBackWheels\":-1,\"modBrakes\":-1,\"modStruts\":-1}', 1000, 0),
(12, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Penetrator', 'penetrator', 'TR 332TR', '{\"modLivery\":-1,\"modWindows\":-1,\"tankHealth\":1000.0,\"wheels\":0,\"tyreSmokeColor\":[255,255,255],\"modGrille\":-1,\"modSeats\":-1,\"modArmor\":-1,\"modXenon\":false,\"pearlescentColor\":18,\"modStruts\":-1,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"modTurbo\":false,\"modExhaust\":-1,\"color2\":4,\"modFender\":-1,\"modTrimB\":-1,\"model\":-1758137366,\"modArchCover\":-1,\"modFrame\":-1,\"modSpeakers\":-1,\"modHorns\":-1,\"modTank\":-1,\"xenonColor\":255,\"wheelColor\":156,\"plate\":\"TR 332TR\",\"modBrakes\":-1,\"modTransmission\":-1,\"modFrontWheels\":-1,\"modSuspension\":-1,\"modVanityPlate\":-1,\"modRightFender\":-1,\"bodyHealth\":1000.0,\"modHood\":-1,\"plateIndex\":0,\"windowTint\":-1,\"modSmokeEnabled\":false,\"modAirFilter\":-1,\"modRoof\":-1,\"modAerials\":-1,\"modHydrolic\":-1,\"modShifterLeavers\":-1,\"modDial\":-1,\"modEngineBlock\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"modBackWheels\":-1,\"modDashboard\":-1,\"modDoorSpeaker\":-1,\"modTrunk\":-1,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"fuelLevel\":65.0,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modAPlate\":-1,\"dirtLevel\":3.0,\"neonEnabled\":[false,false,false,false],\"extras\":[],\"color1\":32,\"modSpoilers\":-1,\"modEngine\":-1,\"modOrnaments\":-1}', 1000, 0),
(13, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'TurismoR', 'turismor', 'TV 343TV', '{\"modTransmission\":-1,\"modHydrolic\":-1,\"modAerials\":-1,\"modEngineBlock\":-1,\"modFender\":-1,\"color2\":0,\"modAPlate\":-1,\"modRearBumper\":-1,\"modFrame\":-1,\"modSeats\":-1,\"engineHealth\":1000.0,\"tyreSmokeColor\":[255,255,255],\"modFrontWheels\":-1,\"modSideSkirt\":-1,\"bodyHealth\":1000.0,\"modSuspension\":-1,\"model\":408192225,\"neonEnabled\":[false,false,false,false],\"modEngine\":-1,\"modDial\":-1,\"modSmokeEnabled\":false,\"color1\":1,\"modAirFilter\":-1,\"modLivery\":-1,\"modExhaust\":-1,\"modBackWheels\":-1,\"modTank\":-1,\"wheels\":7,\"modShifterLeavers\":-1,\"modRightFender\":-1,\"fuelLevel\":60.0,\"dirtLevel\":2.0,\"modStruts\":-1,\"modBrakes\":-1,\"modXenon\":false,\"plate\":\"TV 343TV\",\"modSpoilers\":-1,\"windowTint\":-1,\"modDoorSpeaker\":-1,\"modGrille\":-1,\"modDashboard\":-1,\"modHorns\":-1,\"wheelColor\":156,\"modArchCover\":-1,\"modRoof\":-1,\"modWindows\":-1,\"modOrnaments\":-1,\"neonColor\":[255,0,255],\"extras\":[],\"modTrimB\":-1,\"modTrimA\":-1,\"tankHealth\":1000.0,\"modSteeringWheel\":-1,\"xenonColor\":255,\"modTurbo\":false,\"plateIndex\":0,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"modSpeakers\":-1,\"modFrontBumper\":-1,\"modTrunk\":-1,\"modHood\":-1,\"modArmor\":-1,\"pearlescentColor\":4}', 1000, 0),
(14, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'Autrach', 'autarch', 'EG 017EG', '{\"modRightFender\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modTrimA\":-1,\"tankHealth\":1000.0,\"color2\":36,\"modLivery\":-1,\"modXenon\":false,\"modTurbo\":false,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"extras\":[],\"wheelColor\":12,\"modHorns\":-1,\"modTank\":-1,\"modWindows\":-1,\"modAirFilter\":-1,\"tyreSmokeColor\":[255,255,255],\"modHydrolic\":-1,\"wheels\":7,\"modArmor\":-1,\"modTransmission\":-1,\"modRearBumper\":-1,\"modVanityPlate\":-1,\"modArchCover\":-1,\"plateIndex\":0,\"modTrimB\":-1,\"modFrame\":-1,\"fuelLevel\":65.0,\"modFrontWheels\":-1,\"modRoof\":-1,\"modShifterLeavers\":-1,\"modDial\":-1,\"modStruts\":-1,\"modHood\":-1,\"modEngine\":-1,\"modBrakes\":-1,\"modTrunk\":-1,\"model\":-313185164,\"modOrnaments\":-1,\"modExhaust\":-1,\"modAerials\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modSpoilers\":-1,\"dirtLevel\":3.0,\"modAPlate\":-1,\"neonColor\":[255,0,255],\"modFender\":-1,\"modGrille\":-1,\"color1\":36,\"modSeats\":-1,\"bodyHealth\":1000.0,\"modEngineBlock\":-1,\"pearlescentColor\":88,\"modBackWheels\":-1,\"modSideSkirt\":-1,\"plate\":\"EG 017EG\",\"engineHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modSuspension\":-1,\"modPlateHolder\":-1,\"xenonColor\":255,\"modSmokeEnabled\":false}', 1000, 0),
(15, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'GT500', 'gt500', 'ST 880ST', '{\"modRightFender\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modTrimA\":-1,\"tankHealth\":1000.0,\"color2\":111,\"modLivery\":-1,\"modXenon\":false,\"modTurbo\":false,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"extras\":[],\"wheelColor\":111,\"modHorns\":-1,\"modTank\":-1,\"modWindows\":-1,\"modAirFilter\":-1,\"tyreSmokeColor\":[255,255,255],\"modHydrolic\":-1,\"wheels\":2,\"modArmor\":-1,\"modTransmission\":-1,\"modRearBumper\":-1,\"modVanityPlate\":-1,\"modArchCover\":-1,\"plateIndex\":0,\"modTrimB\":-1,\"modFrame\":-1,\"fuelLevel\":65.0,\"modFrontWheels\":-1,\"modRoof\":-1,\"modShifterLeavers\":-1,\"modDial\":-1,\"modStruts\":-1,\"modHood\":-1,\"modEngine\":-1,\"modBrakes\":-1,\"modTrunk\":-1,\"model\":-2079788230,\"modOrnaments\":-1,\"modExhaust\":-1,\"modAerials\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modSpoilers\":-1,\"dirtLevel\":4.0,\"modAPlate\":-1,\"neonColor\":[255,0,255],\"modFender\":-1,\"modGrille\":-1,\"color1\":111,\"modSeats\":-1,\"bodyHealth\":1000.0,\"modEngineBlock\":-1,\"pearlescentColor\":111,\"modBackWheels\":-1,\"modSideSkirt\":-1,\"plate\":\"ST 880ST\",\"engineHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modSuspension\":-1,\"modPlateHolder\":-1,\"xenonColor\":255,\"modSmokeEnabled\":false}', 1000, 0),
(16, '3b2fee7e9c7169d893241dded5753d8d6ddd0e1a', 'GB200', 'gb200', 'RN 823RN', '{\"modHydrolic\":-1,\"modSeats\":-1,\"plateIndex\":0,\"xenonColor\":255,\"modArmor\":-1,\"modFrame\":-1,\"modAirFilter\":-1,\"tankHealth\":1000.0,\"modSteeringWheel\":-1,\"modSpeakers\":-1,\"modFender\":-1,\"wheels\":7,\"modSmokeEnabled\":false,\"modEngineBlock\":-1,\"model\":1909189272,\"windowTint\":-1,\"pearlescentColor\":18,\"modHood\":-1,\"modTank\":-1,\"modTrunk\":-1,\"modShifterLeavers\":-1,\"modAerials\":-1,\"engineHealth\":1000.0,\"modBackWheels\":-1,\"modTrimB\":-1,\"fuelLevel\":65.0,\"color1\":12,\"modHorns\":-1,\"modXenon\":false,\"modVanityPlate\":-1,\"modTransmission\":-1,\"modExhaust\":-1,\"modStruts\":-1,\"modDial\":-1,\"extras\":[],\"modTrimA\":-1,\"color2\":12,\"wheelColor\":158,\"modTurbo\":false,\"modPlateHolder\":-1,\"modArchCover\":-1,\"tyreSmokeColor\":[255,255,255],\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"modLivery\":-1,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"modDashboard\":-1,\"modSpoilers\":-1,\"modWindows\":-1,\"modFrontWheels\":-1,\"modFrontBumper\":-1,\"modOrnaments\":-1,\"modSideSkirt\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"neonEnabled\":[false,false,false,false],\"modRoof\":-1,\"plate\":\"RN 823RN\",\"dirtLevel\":13.0,\"modGrille\":-1,\"bodyHealth\":1000.0,\"modAPlate\":-1}', 1000, 0);

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
-- Index pour la table `users_vehicles`
--
ALTER TABLE `users_vehicles`
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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
