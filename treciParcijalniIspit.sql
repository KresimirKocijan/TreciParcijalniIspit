-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2022 at 03:54 PM
-- Server version: 8.0.31-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `treciParcijalniIspit`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `prosjekPlacaZaposlenika` ()  BEGIN 
SELECT
AVG(placa)
FROM place;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prosjekPlacaZaposlenika_2` ()  BEGIN 
SELECT
AVG(placa)
FROM place;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `odjeli`
--

CREATE TABLE `odjeli` (
  `odjelID` int UNSIGNED NOT NULL,
  `imeOdjela` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `odjeli`
--

INSERT INTO `odjeli` (`odjelID`, `imeOdjela`) VALUES
(1, 'računovodstvo'),
(2, 'prodaja'),
(3, 'marketing');

-- --------------------------------------------------------

--
-- Table structure for table `odjelZaposlenik`
--

CREATE TABLE `odjelZaposlenik` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjelID` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `odjelZaposlenik`
--

INSERT INTO `odjelZaposlenik` (`zaposlenikID`, `odjelID`, `odDatuma`, `doDatuma`) VALUES
(1, 1, '2001-01-01', '2004-01-01'),
(2, 1, '2003-01-01', '2006-01-01'),
(3, 2, '2002-01-01', '2005-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `placa` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`zaposlenikID`, `placa`, `odDatuma`, `doDatuma`) VALUES
(1, 8000, '2020-01-01', '2020-11-12'),
(2, 9000, '2020-01-02', '2020-11-13'),
(3, 800, '2020-01-03', '2020-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `radnoMjesto`
--

CREATE TABLE `radnoMjesto` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `radnoMjesto` varchar(255) NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `radnoMjesto`
--

INSERT INTO `radnoMjesto` (`zaposlenikID`, `radnoMjesto`, `odDatuma`, `doDatuma`) VALUES
(1, 'računovođa', '2019-01-01', '2021-01-01'),
(2, 'direktor', '2001-01-01', '2022-01-01'),
(3, 'tajnica', '2018-01-01', '2019-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `voditeljOdjela`
--

CREATE TABLE `voditeljOdjela` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjelID` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voditeljOdjela`
--

INSERT INTO `voditeljOdjela` (`zaposlenikID`, `odjelID`, `odDatuma`, `doDatuma`) VALUES
(1, 3, '2002-01-01', '2003-01-01'),
(2, 2, '2003-01-01', '2004-01-01'),
(3, 1, '2004-01-01', '2005-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `zaposlenici`
--

CREATE TABLE `zaposlenici` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `datumRodjenja` date NOT NULL,
  `spol` varchar(255) NOT NULL,
  `datumZaposlenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaposlenici`
--

INSERT INTO `zaposlenici` (`zaposlenikID`, `ime`, `prezime`, `datumRodjenja`, `spol`, `datumZaposlenja`) VALUES
(1, 'luka', 'modrić', '2001-01-01', 'muški', '2021-01-01'),
(2, 'dejan', 'lovren', '2002-01-01', 'muški', '2022-01-01'),
(3, 'dua', 'lipa', '2003-01-01', 'ženski', '2023-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `odjeli`
--
ALTER TABLE `odjeli`
  ADD PRIMARY KEY (`odjelID`);

--
-- Indexes for table `odjelZaposlenik`
--
ALTER TABLE `odjelZaposlenik`
  ADD PRIMARY KEY (`zaposlenikID`,`odjelID`),
  ADD KEY `odjelID` (`odjelID`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`zaposlenikID`,`odDatuma`);

--
-- Indexes for table `radnoMjesto`
--
ALTER TABLE `radnoMjesto`
  ADD PRIMARY KEY (`zaposlenikID`,`radnoMjesto`,`odDatuma`);

--
-- Indexes for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD PRIMARY KEY (`zaposlenikID`,`odjelID`),
  ADD KEY `odjelID` (`odjelID`);

--
-- Indexes for table `zaposlenici`
--
ALTER TABLE `zaposlenici`
  ADD PRIMARY KEY (`zaposlenikID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `odjelZaposlenik`
--
ALTER TABLE `odjelZaposlenik`
  ADD CONSTRAINT `odjelZaposlenik_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `odjelZaposlenik_ibfk_2` FOREIGN KEY (`odjelID`) REFERENCES `odjeli` (`odjelID`) ON DELETE CASCADE;

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `radnoMjesto`
--
ALTER TABLE `radnoMjesto`
  ADD CONSTRAINT `radnoMjesto_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD CONSTRAINT `voditeljOdjela_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `voditeljOdjela_ibfk_2` FOREIGN KEY (`odjelID`) REFERENCES `odjeli` (`odjelID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
