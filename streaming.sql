-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : ven. 06 oct. 2023 à 12:38
-- Version du serveur : 8.1.0
-- Version de PHP : 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `streaming`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`%` PROCEDURE `GetMoviesByDirectorId` (IN `dir_id` INT)   BEGIN
    SELECT * 
    FROM movie
    WHERE director_id = dir_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `actor`
--

CREATE TABLE `actor` (
  `actor_id` int NOT NULL,
  `actor_first_name` varchar(100) NOT NULL,
  `actor_last_name` varchar(100) NOT NULL,
  `actor_birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `actor`
--

INSERT INTO `actor` (`actor_id`, `actor_first_name`, `actor_last_name`, `actor_birth_date`) VALUES
(1, 'Leonardo', 'DiCaprio', '1974-11-11'),
(2, 'Jamie', 'Foxx', '1967-12-13'),
(3, 'Samuel', 'Jackson', '1948-12-21'),
(4, 'Robert', 'De Niro', '1943-08-17'),
(5, 'Kate', 'Winslet', '1975-10-05'),
(6, 'Tom', 'Holland', '1996-06-01'),
(7, 'Zendaya', 'Coleman', '1996-09-01'),
(8, 'Timothee', 'Chalamet', '1995-12-27'),
(9, 'Florence', 'Pugh', '1996-01-03'),
(10, 'Hailee', 'Steinfeld', '1996-12-11');

-- --------------------------------------------------------

--
-- Structure de la table `director`
--

CREATE TABLE `director` (
  `director_id` int NOT NULL,
  `director_first_name` varchar(100) NOT NULL,
  `director_last_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `director`
--

INSERT INTO `director` (`director_id`, `director_first_name`, `director_last_name`) VALUES
(1, 'Christopher', 'Nolan'),
(4, 'James', 'Cameron'),
(5, 'Martin', 'Scorsese'),
(2, 'Quentin', 'Tarantino'),
(3, 'Steven', 'Spielberg');

-- --------------------------------------------------------

--
-- Structure de la table `favorite_movie`
--

CREATE TABLE `favorite_movie` (
  `user_id` int NOT NULL,
  `movie_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `favorite_movie`
--

INSERT INTO `favorite_movie` (`user_id`, `movie_id`) VALUES
(1, 1),
(1, 3),
(4, 2),
(4, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

CREATE TABLE `movie` (
  `movie_id` int NOT NULL,
  `movie_title` varchar(255) NOT NULL,
  `movie_duration` int NOT NULL,
  `movie_release_year` int NOT NULL,
  `director_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `movie`
--

INSERT INTO `movie` (`movie_id`, `movie_title`, `movie_duration`, `movie_release_year`, `director_id`) VALUES
(1, 'Inception', 148, 2010, 1),
(2, 'Django Unchained', 165, 2012, 2),
(3, 'Jurassic Park', 127, 1993, 3),
(4, 'Avatar', 162, 2009, 4),
(5, 'Goodfellas', 146, 1990, 5),
(6, 'The Dark Knight', 152, 2008, 1),
(7, 'Interstellar', 169, 2014, 1),
(8, 'Memento', 113, 2000, 1),
(9, 'Pulp Fiction', 154, 1994, 2),
(10, 'Kill Bill: Vol. 1', 111, 2003, 2),
(11, 'Kill Bill: Vol. 2', 136, 2004, 2),
(12, 'E.T. the Extra-Terrestrial', 115, 1982, 3),
(13, 'Indiana Jones and the Last Crusade', 127, 1989, 3),
(14, 'Jaws', 124, 1975, 3),
(15, 'Titanic', 195, 1997, 4),
(16, 'Terminator 2: Judgment Day', 137, 1991, 4),
(17, 'Aliens', 137, 1986, 4),
(18, 'Casino', 178, 1995, 5),
(19, 'The Departed', 151, 2006, 5),
(20, 'Raging Bull', 129, 1980, 5);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `movie_id` int NOT NULL,
  `actor_id` int NOT NULL,
  `role_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `movie_id`, `actor_id`, `role_type`) VALUES
(1, 'Dom Cobb', 1, 1, 'main'),
(2, 'Dr. King Schultz', 2, 2, 'secondary'),
(3, 'Jules Winnfield', 2, 3, 'main'),
(4, 'Jimmy Conway', 5, 4, 'main'),
(5, 'Rose DeWitt Bukater', 4, 5, 'main'),
(6, 'Ariadne', 1, 5, 'secondary'),
(7, 'Stephen Miles', 1, 4, 'secondary'),
(8, 'Broomhilda', 2, 5, 'secondary'),
(9, 'Billy Costigan', 19, 1, 'secondary'),
(10, 'Max Cady', 20, 4, 'secondary');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `user_first_name` varchar(100) NOT NULL,
  `user_last_name` varchar(100) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `user_first_name`, `user_last_name`, `user_email`, `user_password`, `user_role`) VALUES
(1, 'Mike', 'Zek', 'mike@gmail.com', '12345', 'user'),
(2, 'Mitch', 'Kezman', 'mitch@gmail.com', '6789', 'admin'),
(3, 'Eric', 'Dupont', 'dupont@gmail.com', '9876', 'admin'),
(4, 'Simon', 'Laporte', 'beber@gmail.com', '4321', 'user');

--
-- Déclencheurs `user`
--
DELIMITER $$
CREATE TRIGGER `after_user_update` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
  IF OLD.user_first_name != NEW.user_first_name THEN
    INSERT INTO user_modif (user_modif_date, user_id, modif_column_name, old_value, new_value) 
    VALUES (CURRENT_TIMESTAMP, OLD.user_id, 'user_first_name', OLD.user_first_name, NEW.user_first_name);
  END IF;

  IF OLD.user_last_name != NEW.user_last_name THEN
    INSERT INTO user_modif (user_modif_date, user_id, modif_column_name, old_value, new_value) 
    VALUES (CURRENT_TIMESTAMP, OLD.user_id, 'user_last_name', OLD.user_last_name, NEW.user_last_name);
  END IF;
 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `user_modif`
--

CREATE TABLE `user_modif` (
  `user_modif_id` int NOT NULL,
  `user_modif_date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `modif_column_name` varchar(255) NOT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user_modif`
--

INSERT INTO `user_modif` (`user_modif_id`, `user_modif_date`, `user_id`, `modif_column_name`, `old_value`, `new_value`) VALUES
(1, '2023-10-06 12:27:03', 4, 'user_first_name', 'Bernard', 'Simon');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`actor_id`),
  ADD KEY `actor_last_name` (`actor_last_name`),
  ADD KEY `actor_first_name` (`actor_first_name`,`actor_last_name`),
  ADD KEY `actor_birth_date` (`actor_birth_date`);

--
-- Index pour la table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`director_id`),
  ADD UNIQUE KEY `director_first_name` (`director_first_name`,`director_last_name`);

--
-- Index pour la table `favorite_movie`
--
ALTER TABLE `favorite_movie`
  ADD PRIMARY KEY (`user_id`,`movie_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Index pour la table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`),
  ADD UNIQUE KEY `movie_title` (`movie_title`),
  ADD KEY `director_id` (`director_id`),
  ADD KEY `movie_release_year` (`movie_release_year`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `user_email_2` (`user_email`);

--
-- Index pour la table `user_modif`
--
ALTER TABLE `user_modif`
  ADD PRIMARY KEY (`user_modif_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actor`
--
ALTER TABLE `actor`
  MODIFY `actor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `director`
--
ALTER TABLE `director`
  MODIFY `director_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user_modif`
--
ALTER TABLE `user_modif`
  MODIFY `user_modif_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `favorite_movie`
--
ALTER TABLE `favorite_movie`
  ADD CONSTRAINT `favorite_movie_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `favorite_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`);

--
-- Contraintes pour la table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `director` (`director_id`);

--
-- Contraintes pour la table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  ADD CONSTRAINT `role_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`);

--
-- Contraintes pour la table `user_modif`
--
ALTER TABLE `user_modif`
  ADD CONSTRAINT `user_modif_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
