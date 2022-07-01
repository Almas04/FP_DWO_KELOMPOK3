-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2022 at 11:32 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dwo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `AddressLine` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `PostalCode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressID`, `AddressLine`, `City`, `PostalCode`) VALUES
(1, 'asdasdasdasdasdasdasd', 'asdasd', '61272');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `AccountNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `AccountNumber`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ListPrice` int(11) NOT NULL,
  `SafetyStockLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `ListPrice`, `SafetyStockLevel`) VALUES
(1, 'asdadads', 20000, 200);

-- --------------------------------------------------------

--
-- Table structure for table `salesfact`
--

CREATE TABLE `salesfact` (
  `ProductID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `TimeID` int(11) NOT NULL,
  `BusinessEntityID` int(11) NOT NULL,
  `OrderQty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesfact`
--

INSERT INTO `salesfact` (`ProductID`, `CustomerID`, `TimeID`, `BusinessEntityID`, `OrderQty`) VALUES
(1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipmentfact`
--

CREATE TABLE `shipmentfact` (
  `ProductID` int(11) NOT NULL,
  `TimelD` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `ShiplD` int(11) NOT NULL,
  `Freight` decimal(10,0) NOT NULL,
  `TaxAmt` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipmentfact`
--

INSERT INTO `shipmentfact` (`ProductID`, `TimelD`, `AddressID`, `ShiplD`, `Freight`, `TaxAmt`) VALUES
(1, 1, 1, 1, '2', '2'),
(1, 2, 1, 1, '3', '2'),
(1, 1, 1, 2, '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `shipmentmethod`
--

CREATE TABLE `shipmentmethod` (
  `ShiplD` int(11) NOT NULL,
  `ShipName` varchar(100) NOT NULL,
  `ShipRate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipmentmethod`
--

INSERT INTO `shipmentmethod` (`ShiplD`, `ShipName`, `ShipRate`) VALUES
(1, 'JNE', '10000'),
(2, 'J&T', '3000\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `BusinessEntitylD` int(11) NOT NULL,
  `StoreName` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`BusinessEntitylD`, `StoreName`) VALUES
(1, 'Gudang');

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE `time` (
  `TimeD` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Month` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`TimeD`, `Date`, `Month`, `Year`) VALUES
(1, '2022-06-30', 'Juni', '2022'),
(2, '2022-07-07', 'Februari', '2022');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `salesfact`
--
ALTER TABLE `salesfact`
  ADD KEY `fk_CustomerID` (`CustomerID`),
  ADD KEY `fk_TimelD` (`TimeID`),
  ADD KEY `fk_BusinessEntityID` (`BusinessEntityID`),
  ADD KEY `fk_ProductID` (`ProductID`);

--
-- Indexes for table `shipmentfact`
--
ALTER TABLE `shipmentfact`
  ADD KEY `dk_ProductID` (`ProductID`),
  ADD KEY `dk_TimeID` (`TimelD`),
  ADD KEY `dk_AddressID` (`AddressID`),
  ADD KEY `dk_ShiplD` (`ShiplD`);

--
-- Indexes for table `shipmentmethod`
--
ALTER TABLE `shipmentmethod`
  ADD PRIMARY KEY (`ShiplD`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`BusinessEntitylD`);

--
-- Indexes for table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`TimeD`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `salesfact`
--
ALTER TABLE `salesfact`
  ADD CONSTRAINT `fk_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `store` (`BusinessEntitylD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TimelD` FOREIGN KEY (`TimeID`) REFERENCES `time` (`TimeD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shipmentfact`
--
ALTER TABLE `shipmentfact`
  ADD CONSTRAINT `dk_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dk_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dk_ShiplD` FOREIGN KEY (`ShiplD`) REFERENCES `shipmentmethod` (`ShiplD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dk_TimeID` FOREIGN KEY (`TimelD`) REFERENCES `time` (`TimeD`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
