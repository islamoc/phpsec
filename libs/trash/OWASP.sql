-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 20, 2013 at 02:55 PM
-- Server version: 5.5.22
-- PHP Version: 5.3.10-1ubuntu3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `OWASP`
--

-- --------------------------------------------------------

--
-- Table structure for table `AUTH_STORAGE`
--

CREATE TABLE IF NOT EXISTS `AUTH_STORAGE` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AUTH_ID` varchar(128) DEFAULT NULL,
  `DATE_CREATED` int(10) NOT NULL,
  `USERID` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USERID` (`USERID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `PASSWORD`
--

CREATE TABLE IF NOT EXISTS `PASSWORD` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TEMP_PASS` varchar(128) NOT NULL,
  `USE_FLAG` tinyint(1) NOT NULL,
  `TEMP_TIME` int(10) NOT NULL,
  `TOTAL_LOGIN_ATTEMPTS` int(2) DEFAULT NULL,
  `LAST_LOGIN_ATTEMPT` int(10) DEFAULT NULL,
  `USERID` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERID_2` (`USERID`),
  KEY `USERID` (`USERID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=659 ;

--
-- Dumping data for table `PASSWORD`
--

INSERT INTO `PASSWORD` (`ID`, `TEMP_PASS`, `USE_FLAG`, `TEMP_TIME`, `TOTAL_LOGIN_ATTEMPTS`, `LAST_LOGIN_ATTEMPT`, `USERID`) VALUES
(570, '08a741bd0a', 1, 0, 0, 1371749548, 'rash');

-- --------------------------------------------------------

--
-- Table structure for table `SESSION`
--

CREATE TABLE IF NOT EXISTS `SESSION` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SESSION_ID` varchar(32) NOT NULL,
  `DATE_CREATED` int(10) NOT NULL,
  `LAST_ACTIVITY` int(10) NOT NULL,
  `USERID` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SESSION_ID` (`SESSION_ID`),
  KEY `USERID` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SESSION_DATA`
--

CREATE TABLE IF NOT EXISTS `SESSION_DATA` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SESSION_ID` varchar(32) NOT NULL,
  `KEY` varchar(32) NOT NULL,
  `VALUE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SESSION_ID` (`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `STATIC_SALT`
--

CREATE TABLE IF NOT EXISTS `STATIC_SALT` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATICSALT` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `STATICSALT` (`STATICSALT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `STATIC_SALT`
--

INSERT INTO `STATIC_SALT` (`ID`, `STATICSALT`) VALUES
(4, '2e4cc243bd6853a353857c41cdffdbf513c1aa5dca5f5b231de2af4665c258034470b77c3515806d587f1f419f6516a368c4c0e2f47aa2a648a2df60952a800d'),
(6, '2fa93f2d3b470fe653448e9434ba34d6a2b996d6deea808ef8e8a9369569e7b70303141b172b0f46558c6acab1aa12f9bc00c89d4f070613cb4799d19c3e5f10'),
(5, '46908be89b40f71a21b008d3472ec6af44f5ec8c5aece7d774d77e1f9b8522b2a86c1425467b53a2a74c9014ae10dfbba0a11b79916bebf23215645945c36450'),
(7, '46ad717597a5d2d4d25fdc3c7fc9edddbfa66a7c7b3ef4beecabfa52f1ce1384d3d82a0482871494566bc650c8d76b7d0619cf02bb9c3ead853a952e29460ef2'),
(2, '519fe2d93b140831e93413ee7384ed890f591bfd943494e4f96b04ce58aab9270dd7eee95398a75e8a8824b29f47c36192e4160ff3e7ad269f8276b1d7bf0f81'),
(1, '7d2cdb76dcc3c97fc55bff3dafb35724031f3e4c47512d4903b6d1fb914774405e74539ea70a49fbc4b52ededb1f5dfb7eebef3bcc89e9578e449ed93cfb2103'),
(3, '8bc7ff230273f4675e5e244fc818153116156d3eb4dc8918b0b91df511ac41fcb94b024c25c7bab4dbdcfec186cc7c284960919c455ea2d97196a18344ebbc32');

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE IF NOT EXISTS `USER` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` varchar(32) NOT NULL,
  `ACCOUNT_CREATED` int(10) NOT NULL,
  `HASH` varchar(128) NOT NULL,
  `DATE_CREATED` int(10) NOT NULL,
  `TOTAL_SESSIONS` int(2) NOT NULL DEFAULT '0',
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(60) DEFAULT NULL,
  `ALGO` varchar(15) NOT NULL,
  `DYNAMIC_SALT` varchar(128) NOT NULL,
  `STATIC_SALT` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERID` (`USERID`),
  KEY `STATIC_SALT` (`STATIC_SALT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=851 ;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`ID`, `USERID`, `ACCOUNT_CREATED`, `HASH`, `DATE_CREATED`, `TOTAL_SESSIONS`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `ALGO`, `DYNAMIC_SALT`, `STATIC_SALT`) VALUES
(762, 'rash', 1371749548, 'f2a6901ede0d7cc7f3146a4083d30f094fe4756aa662aa9f8f8add0199e7a34e', 1371749548, 0, NULL, NULL, NULL, 'haval256,5', '83b8fc20161ef8306780a7466f2f0162a2fd65a5a1a13c9fe60fab9287773dab1588071f298cea2fad8438d019c7fc16851142892b2460b6af638b3a95ecf943', '7d2cdb76dcc3c97fc55bff3dafb35724031f3e4c47512d4903b6d1fb914774405e74539ea70a49fbc4b52ededb1f5dfb7eebef3bcc89e9578e449ed93cfb2103');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AUTH_STORAGE`
--
ALTER TABLE `AUTH_STORAGE`
  ADD CONSTRAINT `AUTH_STORAGE_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `USER` (`USERID`) ON DELETE NO ACTION;

--
-- Constraints for table `PASSWORD`
--
ALTER TABLE `PASSWORD`
  ADD CONSTRAINT `PASSWORD_ibfk_3` FOREIGN KEY (`USERID`) REFERENCES `USER` (`USERID`) ON DELETE NO ACTION;

--
-- Constraints for table `SESSION`
--
ALTER TABLE `SESSION`
  ADD CONSTRAINT `SESSION_ibfk_2` FOREIGN KEY (`USERID`) REFERENCES `USER` (`USERID`) ON DELETE NO ACTION;

--
-- Constraints for table `SESSION_DATA`
--
ALTER TABLE `SESSION_DATA`
  ADD CONSTRAINT `SESSION_DATA_ibfk_5` FOREIGN KEY (`SESSION_ID`) REFERENCES `SESSION` (`SESSION_ID`) ON DELETE NO ACTION;

--
-- Constraints for table `USER`
--
ALTER TABLE `USER`
  ADD CONSTRAINT `USER_ibfk_2` FOREIGN KEY (`STATIC_SALT`) REFERENCES `STATIC_SALT` (`STATICSALT`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
