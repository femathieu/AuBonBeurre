-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Jeu 22 Août 2019 à 11:05
-- Version du serveur :  10.1.38-MariaDB-0+deb9u1
-- Version de PHP :  7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `AUBONBEURRE`
--

-- --------------------------------------------------------

use aubonbeurre;

--
-- Structure de la table `PRODUCTION_UNIT`
--

CREATE TABLE `production_unit` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `unit_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `SYSTEM_DETAILS`
--

CREATE TABLE `system_detail` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `system_main_id` int NOT NULL,
  `tank_temperature` float NOT NULL,
  `outside_temperature` float NOT NULL,
  `milk_weight` float NOT NULL,
  `pH` float NOT NULL,
  `Kplus` int NOT NULL,
  `NaCI` float NOT NULL,
  `salmonelle` int NOT NULL,
  `E_coli` int NOT NULL,
  `Listeria` int(11) NOT NULL,
  `unix_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `SYSTEM_MAIN`
--

CREATE TABLE `system_main` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `system_number` int NOT NULL,
  `system_type` varchar(255),
  `production_unit_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables exportées
--

alter table system_detail
	ADD CONSTRAINT constraint_name_1 FOREIGN KEY fk_system_main_id(system_main_id) REFERENCES system_main(id);

ALTER TABLE system_main
    ADD FOREIGN KEY (id) REFERENCES production_unit(id);

INSERT INTO production_unit (unit_number) VALUE (1);
INSERT INTO system_main (system_number, system_type, production_unit_id) VALUES (1, 'custom_type', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
