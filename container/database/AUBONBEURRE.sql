-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Jeu 22 Août 2019 à 09:24
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

--
-- Structure de la table `JOB`
--

CREATE TABLE `JOB` (
  `id` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `PRODUCTION_UNIT`
--

CREATE TABLE `PRODUCTION_UNIT` (
  `id` int(11) NOT NULL,
  `unit_number` int(11) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `SUITABLE`
--

CREATE TABLE `SUITABLE` (
  `id` int(11) NOT NULL,
  `id_PRODUCTION_UNIT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `SYSTEM_DETAILS`
--

CREATE TABLE `SYSTEM_DETAILS` (
  `id` int(11) NOT NULL,
  `tank_temperature` float NOT NULL,
  `outside_temperature` float NOT NULL,
  `milk_weight` float NOT NULL,
  `measure_pH` float NOT NULL,
  `measure_Kplus` int(11) NOT NULL,
  `NaCI_concentration` float NOT NULL,
  `salmonelle_bacterian_level` int(11) NOT NULL,
  `E_coli_bacterian_level` int(11) NOT NULL,
  `Listeria_bactiera_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `SYSTEM_MAIN`
--

CREATE TABLE `SYSTEM_MAIN` (
  `id` int(11) NOT NULL,
  `system_number` varchar(255) NOT NULL,
  `number_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `USERS`
--

CREATE TABLE `USERS` (
  `id_users` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `id_JOB` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `JOB`
--
ALTER TABLE `JOB`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `JOB_USERS0_AK` (`id_users`);

--
-- Index pour la table `PRODUCTION_UNIT`
--
ALTER TABLE `PRODUCTION_UNIT`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PRODUCTION_UNIT_USERS0_AK` (`id_users`);

--
-- Index pour la table `SUITABLE`
--
ALTER TABLE `SUITABLE`
  ADD PRIMARY KEY (`id`,`id_PRODUCTION_UNIT`),
  ADD KEY `SUITABLE_PRODUCTION_UNIT1_FK` (`id_PRODUCTION_UNIT`);

--
-- Index pour la table `SYSTEM_DETAILS`
--
ALTER TABLE `SYSTEM_DETAILS`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `SYSTEM_MAIN`
--
ALTER TABLE `SYSTEM_MAIN`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`id_users`),
  ADD UNIQUE KEY `USERS_PRODUCTION_UNIT0_AK` (`id`),
  ADD UNIQUE KEY `USERS_JOB1_AK` (`id_JOB`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `JOB`
--
ALTER TABLE `JOB`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `PRODUCTION_UNIT`
--
ALTER TABLE `PRODUCTION_UNIT`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `SYSTEM_DETAILS`
--
ALTER TABLE `SYSTEM_DETAILS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `SYSTEM_MAIN`
--
ALTER TABLE `SYSTEM_MAIN`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `USERS`
--
ALTER TABLE `USERS`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `JOB`
--
ALTER TABLE `JOB`
  ADD CONSTRAINT `JOB_USERS0_FK` FOREIGN KEY (`id_users`) REFERENCES `USERS` (`id_users`);

--
-- Contraintes pour la table `PRODUCTION_UNIT`
--
ALTER TABLE `PRODUCTION_UNIT`
  ADD CONSTRAINT `PRODUCTION_UNIT_USERS0_FK` FOREIGN KEY (`id_users`) REFERENCES `USERS` (`id_users`);

--
-- Contraintes pour la table `SUITABLE`
--
ALTER TABLE `SUITABLE`
  ADD CONSTRAINT `SUITABLE_PRODUCTION_UNIT1_FK` FOREIGN KEY (`id_PRODUCTION_UNIT`) REFERENCES `PRODUCTION_UNIT` (`id`),
  ADD CONSTRAINT `SUITABLE_SYSTEM_MAIN0_FK` FOREIGN KEY (`id`) REFERENCES `SYSTEM_MAIN` (`id`);

--
-- Contraintes pour la table `USERS`
--
ALTER TABLE `USERS`
  ADD CONSTRAINT `USERS_JOB1_FK` FOREIGN KEY (`id_JOB`) REFERENCES `JOB` (`id`),
  ADD CONSTRAINT `USERS_PRODUCTION_UNIT0_FK` FOREIGN KEY (`id`) REFERENCES `PRODUCTION_UNIT` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
