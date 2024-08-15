-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para mepoupe
CREATE DATABASE IF NOT EXISTS `mepoupe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `mepoupe`;

-- Copiando estrutura para tabela mepoupe.account
CREATE TABLE IF NOT EXISTS `account` (
  `AccountId` int(5) NOT NULL AUTO_INCREMENT,
  `UserId` int(5) NOT NULL,
  `AccountName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela mepoupe.account: ~3 rows (aproximadamente)
DELETE FROM `account`;
INSERT INTO `account` (`AccountId`, `UserId`, `AccountName`) VALUES
	(1, 1, 'Dinheiro'),
	(2, 1, 'Conta'),
	(3, 1, 'Cartão');

-- Copiando estrutura para tabela mepoupe.assets
CREATE TABLE IF NOT EXISTS `assets` (
  `AssetsId` int(5) NOT NULL AUTO_INCREMENT,
  `UserId` int(5) NOT NULL,
  `Title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Date` date NOT NULL,
  `CategoryId` int(5) NOT NULL,
  `AccountId` int(5) NOT NULL,
  `Amount` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`AssetsId`),
  KEY `fk_test` (`AccountId`),
  CONSTRAINT `fk_test` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela mepoupe.assets: ~1 rows (aproximadamente)
DELETE FROM `assets`;
INSERT INTO `assets` (`AssetsId`, `UserId`, `Title`, `Date`, `CategoryId`, `AccountId`, `Amount`, `Description`) VALUES
	(1, 1, 'Serviço Obrigatório militar', '2024-08-15', 1, 1, '1080', 'Ganhei do bolsonaro');

-- Copiando estrutura para tabela mepoupe.bills
CREATE TABLE IF NOT EXISTS `bills` (
  `BillsId` int(5) NOT NULL AUTO_INCREMENT,
  `UserId` int(5) NOT NULL,
  `Title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Dates` date NOT NULL,
  `CategoryId` int(5) NOT NULL,
  `AccountId` int(5) NOT NULL,
  `Amount` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`BillsId`),
  KEY `fk_testt` (`AccountId`),
  CONSTRAINT `fk_testt` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela mepoupe.bills: ~0 rows (aproximadamente)
DELETE FROM `bills`;
INSERT INTO `bills` (`BillsId`, `UserId`, `Title`, `Dates`, `CategoryId`, `AccountId`, `Amount`, `Description`) VALUES
	(1, 1, 'Volante pro Gol', '2024-08-15', 8, 2, '320', 'Volantão pro Gol'),
	(2, 1, 'Sinuca', '2024-08-15', 5, 1, '220', 'Vai faltar');

-- Copiando estrutura para tabela mepoupe.budget
CREATE TABLE IF NOT EXISTS `budget` (
  `BudgetId` int(5) NOT NULL AUTO_INCREMENT,
  `UserId` int(5) NOT NULL,
  `CategoryId` int(5) NOT NULL,
  `Dates` date NOT NULL,
  `Amount` int(10) NOT NULL,
  PRIMARY KEY (`BudgetId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela mepoupe.budget: ~0 rows (aproximadamente)
DELETE FROM `budget`;
INSERT INTO `budget` (`BudgetId`, `UserId`, `CategoryId`, `Dates`, `Amount`) VALUES
	(1, 1, 5, '2024-08-15', 200);

-- Copiando estrutura para tabela mepoupe.category
CREATE TABLE IF NOT EXISTS `category` (
  `CategoryId` int(5) NOT NULL AUTO_INCREMENT,
  `UserId` int(5) NOT NULL,
  `CategoryName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Level` int(2) NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela mepoupe.category: ~14 rows (aproximadamente)
DELETE FROM `category`;
INSERT INTO `category` (`CategoryId`, `UserId`, `CategoryName`, `Level`) VALUES
	(1, 1, 'Salario', 1),
	(2, 1, 'Mesada', 1),
	(3, 1, 'Gorjeta', 1),
	(4, 1, 'Bonus', 1),
	(5, 1, 'Alimentação', 2),
	(6, 1, 'Vida Social', 2),
	(7, 1, 'Aprendizado', 2),
	(8, 1, 'Transporte', 2),
	(9, 1, 'Cultura', 2),
	(10, 1, 'Casa', 2),
	(11, 1, 'Vestuário', 2),
	(12, 1, 'Beleza e Cuidado', 2),
	(13, 1, 'Saúde', 2),
	(14, 1, 'Presentes', 2),
	(15, 1, 'Renda Extra', 1);

-- Copiando estrutura para tabela mepoupe.totals
CREATE TABLE IF NOT EXISTS `totals` (
  `TotalsId` int(5) NOT NULL AUTO_INCREMENT,
  `UserId` int(5) NOT NULL,
  `AccountId` int(5) NOT NULL,
  `Totals` int(10) NOT NULL,
  PRIMARY KEY (`TotalsId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela mepoupe.totals: ~3 rows (aproximadamente)
DELETE FROM `totals`;
INSERT INTO `totals` (`TotalsId`, `UserId`, `AccountId`, `Totals`) VALUES
	(1, 1, 1, 860),
	(2, 1, 2, -320),
	(3, 1, 3, 0);

-- Copiando estrutura para tabela mepoupe.user
CREATE TABLE IF NOT EXISTS `user` (
  `UserId` int(5) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LastName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela mepoupe.user: ~1 rows (aproximadamente)
DELETE FROM `user`;
INSERT INTO `user` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `Currency`) VALUES
	(1, 'Emerson', 'Renaki', 'emersonrenaki0@gmail.com', 'ZUFiU1RtbkFFVi9xMk41M0dYMHMrZz09', 'R$');

-- Copiando estrutura para trigger mepoupe.GenerateAccount
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `GenerateAccount` AFTER INSERT ON `account`
 FOR EACH ROW INSERT INTO totals(UserId, AccountId, totals) values (new.UserId, new.AccountId, '0')//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger mepoupe.GenerateDefaultAccount
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `GenerateDefaultAccount` AFTER INSERT ON `user`
 FOR EACH ROW INSERT INTO account (UserId, AccountName) VALUES (new.UserId, 'Cash'), (new.UserId, 'Account'), (new.UserId, 'Card')//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger mepoupe.GenerateExpense
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `GenerateExpense` AFTER INSERT ON `bills`
 FOR EACH ROW UPDATE totals SET totals.totals=totals.totals - new.amount where totals.userid=new.userid and totals.accountid=new.accountid//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger mepoupe.GenerateTotalAccount
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `GenerateTotalAccount` AFTER INSERT ON `assets`
 FOR EACH ROW UPDATE totals SET totals.totals=totals.totals + new.amount where totals.userid=new.userid and totals.accountid=new.accountid//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger mepoupe.GenerateTotalUpdate
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `GenerateTotalUpdate` AFTER UPDATE ON `assets`
 FOR EACH ROW UPDATE totals SET totals.totals=(select sum(Amount) from assets where assets.userid=new.userid and assets.accountid=new.accountid) where totals.userid=new.userid and totals.accountid=new.accountid//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;