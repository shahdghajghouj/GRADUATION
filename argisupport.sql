-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17 أكتوبر 2026 الساعة 18:12
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `argisupport`
--

-- --------------------------------------------------------

--
-- بنية الجدول `crops`
--

CREATE TABLE `crops` (
  `CropsId` int(11) NOT NULL,
  `CropsType` varchar(255) NOT NULL,
  `CropsImage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `lands_crops`
--

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

-- --------------------------------------------------------

--
-- بنية الجدول `livestock`
--

CREATE TABLE `livestock` (
  `LivestockId` int(11) NOT NULL,
  `LivestockType` varchar(255) NOT NULL,
  `LivestockImage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `livestock_lands`
--

CREATE TABLE `livestock_lands` (
  `LivestockLandsId` int(11) NOT NULL,
  `LandId` int(11) NOT NULL,
  `LivestockId` int(11) NOT NULL,
  `LivestockNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crops`
--
ALTER TABLE `crops`
  ADD PRIMARY KEY (`CropsId`);

--
-- Indexes for table `lands_crops`
--
ALTER TABLE `lands_crops`
  ADD PRIMARY KEY (`LandscropsId`);

--
-- Indexes for table `livestock`
--
ALTER TABLE `livestock`
  ADD PRIMARY KEY (`LivestockId`);

--
-- Indexes for table `livestock_lands`
--
ALTER TABLE `livestock_lands`
  ADD PRIMARY KEY (`LivestockLandsId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crops`
--
ALTER TABLE `crops`
  MODIFY `CropsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lands_crops`
--
ALTER TABLE `lands_crops`
  MODIFY `LandscropsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `livestock`
--
ALTER TABLE `livestock`
  MODIFY `LivestockId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `livestock_lands`
--
ALTER TABLE `livestock_lands`
  MODIFY `LivestockLandsId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
