-- Merged database: argisupport
-- Sources: argisupport (1).sql and argisupport.sql
-- Preserves the original tables, seed data, indexes and foreign keys.
-- No tables are dropped. Import into an empty database.

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `argisupport`
  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `argisupport`;

START TRANSACTION;

-- Tables
CREATE TABLE `equipment` (
  `EqId` int(11) NOT NULL,
  `EqType` varchar(255) NOT NULL,
  `EqPhoto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `farmerdoc` (
  `DocumentId` int(11) NOT NULL,
  `FarmerId` int(11) NOT NULL,
  `IdentityImagePath` varchar(500) NOT NULL,
  `ArgiculturalLicensePath` varchar(500) NOT NULL,
  `UploadedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `DocStatus` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `RejectionReason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `farmereq` (
  `FarmerEqId` int(11) NOT NULL,
  `EqNum` int(11) NOT NULL,
  `FarmerId` int(11) NOT NULL,
  `EqId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `farmers` (
  `FarmerId` int(11) NOT NULL,
  `GovId` int(11) NOT NULL,
  `FullName` varchar(150) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `BirthDate` date NOT NULL,
  `SocialStatus` enum(' متزوج',' أعزب') NOT NULL,
  `ChildrenCount` int(11) NOT NULL DEFAULT 0,
  `HealthAffects` tinyint(1) NOT NULL DEFAULT 0,
  `HealthDetails` text DEFAULT NULL,
  `OtherJob` tinyint(1) NOT NULL DEFAULT 0,
  `OtherJobType` varchar(255) DEFAULT NULL,
  `AccStatus` varchar(20) NOT NULL DEFAULT 'active',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `HasChildren` tinyint(1) NOT NULL DEFAULT 0,
  `UpdateAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `EduLevel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `governorates` (
  `GovId` int(11) NOT NULL,
  `GovName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `lands` (
  `LandId` int(11) NOT NULL,
  `LandNum` int(11) NOT NULL,
  `SoilType` varchar(255) NOT NULL,
  `LandSpace` double NOT NULL,
  `LandType` varchar(255) NOT NULL,
  `WellsNum` int(11) NOT NULL DEFAULT 0,
  `IrrigationType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `crops` (
  `CropsId` int(11) NOT NULL,
  `CropsType` varchar(255) NOT NULL,
  `CropsImage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `lands_crops` (
  `LandId` int(11) NOT NULL,
  `CropsId` int(11) NOT NULL,
  `LandscropsId` int(11) NOT NULL,
  `AgricultureDate` date NOT NULL,
  `HarvestDate` date NOT NULL,
  `FruitTrees` int(11) NOT NULL,
  `TreesNum` int(11) NOT NULL,
  `QuantityCrop` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `livestock` (
  `LivestockId` int(11) NOT NULL,
  `LivestockType` varchar(255) NOT NULL,
  `LivestockImage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `livestock_lands` (
  `LivestockLandsId` int(11) NOT NULL,
  `LandId` int(11) NOT NULL,
  `LivestockId` int(11) NOT NULL,
  `LivestockNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Initial data
INSERT INTO `governorates` (`GovId`, `GovName`) VALUES
(1, 'دمشق'),
(2, 'ريف دمشق'),
(3, 'حلب'),
(4, 'حمص'),
(5, 'حماة'),
(6, 'اللاذقية'),
(7, 'طرطوس'),
(8, 'إدلب'),
(9, 'دير الزور'),
(10, 'الرقة'),
(11, 'الحسكة'),
(12, 'درعا'),
(13, 'السويداء'),
(14, 'القنيطرة');

-- Primary keys, indexes, auto-increment and foreign keys
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`EqId`);

ALTER TABLE `farmerdoc`
  ADD PRIMARY KEY (`DocumentId`),
  ADD KEY `fk_FarmerId` (`FarmerId`);

ALTER TABLE `farmereq`
  ADD PRIMARY KEY (`FarmerEqId`),
  ADD KEY `FarmerId` (`FarmerId`),
  ADD KEY `EqId` (`EqId`);

ALTER TABLE `farmers`
  ADD PRIMARY KEY (`FarmerId`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `fk_Gov_Id` (`GovId`);

ALTER TABLE `governorates`
  ADD PRIMARY KEY (`GovId`);

ALTER TABLE `lands`
  ADD PRIMARY KEY (`LandId`);

ALTER TABLE `equipment`
  MODIFY `EqId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `farmerdoc`
  MODIFY `DocumentId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `farmereq`
  MODIFY `FarmerEqId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `farmers`
  MODIFY `FarmerId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `governorates`
  MODIFY `GovId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

ALTER TABLE `lands`
  MODIFY `LandId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `farmerdoc`
  ADD CONSTRAINT `fk_FarmerId` FOREIGN KEY (`FarmerId`) REFERENCES `farmers` (`FarmerId`);

ALTER TABLE `farmereq`
  ADD CONSTRAINT `farmereq_ibfk_1` FOREIGN KEY (`FarmerId`) REFERENCES `farmers` (`FarmerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `farmereq_ibfk_2` FOREIGN KEY (`EqId`) REFERENCES `equipment` (`EqId`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `farmers`
  ADD CONSTRAINT `fk_Gov_Id` FOREIGN KEY (`GovId`) REFERENCES `governorates` (`GovId`);

ALTER TABLE `crops`
  ADD PRIMARY KEY (`CropsId`);

ALTER TABLE `lands_crops`
  ADD PRIMARY KEY (`LandscropsId`);

ALTER TABLE `livestock`
  ADD PRIMARY KEY (`LivestockId`);

ALTER TABLE `livestock_lands`
  ADD PRIMARY KEY (`LivestockLandsId`);

ALTER TABLE `crops`
  MODIFY `CropsId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `lands_crops`
  MODIFY `LandscropsId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livestock`
  MODIFY `LivestockId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livestock_lands`
  MODIFY `LivestockLandsId` int(11) NOT NULL AUTO_INCREMENT;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

