CREATE DATABASE  IF NOT EXISTS `smct_11062018` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `smct_11062018`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: smct_11062018
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_classes`
--

DROP TABLE IF EXISTS `account_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_classes` (
  `account_class_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_class` varchar(755) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `account_type_id` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` date DEFAULT '0000-00-00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`account_class_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_classes`
--

LOCK TABLES `account_classes` WRITE;
/*!40000 ALTER TABLE `account_classes` DISABLE KEYS */;
INSERT INTO `account_classes` VALUES (1,'Current Assets','',1,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(2,'Non-Current Assets','',1,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(3,'Current Liabilities','',2,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(4,'Long-term Liabilities','',2,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(5,'Owners Equity','',3,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(6,'Operating Expense','',5,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(7,'Income','',4,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0');
/*!40000 ALTER TABLE `account_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_integration`
--

DROP TABLE IF EXISTS `account_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_integration` (
  `integration_id` int(11) NOT NULL,
  `input_tax_account_id` bigint(20) DEFAULT '0',
  `payable_account_id` bigint(20) DEFAULT '0',
  `payable_discount_account_id` bigint(20) DEFAULT '0',
  `payment_to_supplier_id` bigint(20) DEFAULT '0',
  `output_tax_account_id` bigint(20) DEFAULT '0',
  `receivable_account_id` bigint(20) DEFAULT '0',
  `receivable_discount_account_id` bigint(20) DEFAULT '0',
  `payment_from_customer_id` bigint(20) DEFAULT '0',
  `retained_earnings_id` bigint(20) DEFAULT '0',
  `petty_cash_account_id` int(11) DEFAULT '0',
  `sales_invoice_inventory` bit(1) DEFAULT NULL,
  `depreciation_expense_debit_id` bigint(20) DEFAULT '0',
  `depreciation_expense_credit_id` bigint(20) DEFAULT '0',
  `cash_invoice_debit_id` bigint(20) DEFAULT '0',
  `cash_invoice_credit_id` bigint(20) DEFAULT '0',
  `cash_invoice_inventory` bit(1) DEFAULT NULL,
  `dispatching_invoice_inventory` bit(1) DEFAULT b'0',
  `supplier_inventory_debit_account_id` bigint(20) DEFAULT '0',
  `purchases_department_id` bigint(20) DEFAULT '0',
  `revolving_fund_account_id` bigint(20) DEFAULT '0',
  `other_income_receivable_account_id` bigint(20) DEFAULT '0',
  `supplier_wtax_account_id` bigint(20) DEFAULT '0',
  `customer_wtax_account_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`integration_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_integration`
--

LOCK TABLES `account_integration` WRITE;
/*!40000 ALTER TABLE `account_integration` DISABLE KEYS */;
INSERT INTO `account_integration` VALUES (1,88,22,54,3,90,6,84,3,42,4,'',15,16,0,0,'','\0',52,7,5,6,33,87);
/*!40000 ALTER TABLE `account_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_titles`
--

DROP TABLE IF EXISTS `account_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_titles` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(75) DEFAULT '',
  `account_title` varchar(755) DEFAULT '',
  `account_class_id` int(11) DEFAULT '0',
  `parent_account_id` int(11) DEFAULT '0',
  `grand_parent_id` int(11) DEFAULT '0',
  `description` varchar(1000) DEFAULT '',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_titles`
--

LOCK TABLES `account_titles` WRITE;
/*!40000 ALTER TABLE `account_titles` DISABLE KEYS */;
INSERT INTO `account_titles` VALUES (1,'1110','Cash',1,0,1,'','2018-11-06 13:51:41','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(2,'1112','Cash in Bank - MBTC-SR #102-3-10250688-0',1,1,1,'','2018-11-06 13:52:29','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(3,'1113','Cash on Hand',1,1,1,'','2018-11-06 13:53:16','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(4,'1114','Petty Cash Fund',1,1,1,'','2018-11-06 13:53:40','2018-11-06 13:53:56','0000-00-00 00:00:00',1,1,0,'','\0'),(5,'1115','Revolving Fund',1,1,1,'','2018-11-06 13:54:08','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(6,'1120','Accounts Receivable',1,0,6,'','2018-11-06 17:08:21','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(7,'1130','Supplies',1,0,7,'','2018-11-06 17:08:31','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(8,'1140','Prepaid Expenses',1,0,8,'','2018-11-06 17:10:02','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(9,'1150','Short Term Advances',1,0,9,'','2018-11-06 17:10:14','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(10,'1151','Short Term Advances - Salary Cash Advance',1,9,9,'','2018-11-06 17:10:27','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(11,'1152','Short Term Advances - Health Care',1,9,9,'','2018-11-06 17:10:43','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(12,'1210','Property and Equipment',2,0,12,'','2018-11-06 17:12:40','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(13,'1211','Land',2,12,12,'','2018-11-06 17:15:24','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(14,'1212','Leasehold Improvements',2,12,12,'','2018-11-06 17:15:40','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(15,'1213','Furniture and Fixtures',2,12,12,'','2018-11-06 17:16:03','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(16,'1214','Accumulated Depreciation - Furniture and Fixtures',2,15,12,'','2018-11-06 17:17:08','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(17,'1215','Equipment',2,12,12,'','2018-11-06 17:17:21','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(18,'1216','Accumulated Depreciation - Equipment',2,17,12,'','2018-11-06 17:17:36','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(19,'1217','Elevator',2,12,12,'','2018-11-06 17:17:58','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(20,'1218','Accumulated Depreciation - Elevator',2,19,12,'','2018-11-06 17:18:44','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(21,'1220','Long term Advances',2,0,21,'','2018-11-06 17:20:52','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(22,'2110','Accounts Payable',3,0,22,'','2018-11-06 17:21:09','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(23,'2111','Accounts Payable - PDC-MBTC SR',3,22,22,'','2018-11-06 17:21:38','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(24,'2120','Accrued Expenses',3,0,24,'','2018-11-06 17:21:52','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(25,'2130','Payable to SSS',3,0,25,'','2018-11-06 17:22:05','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(26,'2131','SSS Contribution Payable',3,25,25,'','2018-11-06 17:22:17','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(27,'2132','SSS Loan Payable',3,25,25,'','2018-11-06 17:22:27','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(28,'2140','Payable to HMDF/Pag-ibig',3,0,28,'','2018-11-06 17:23:14','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(29,'2141','HDMF/Pag-ibig Contribution Payable',3,28,28,'','2018-11-06 17:23:37','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(30,'2142','HDMF/Pag-ibig Loan Payable',3,28,28,'','2018-11-06 17:24:05','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(31,'2150','Phil.Health Contribution Payable',3,0,31,'','2018-11-06 17:24:21','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(32,'2160','Payable to BIR',3,0,32,'','2018-11-06 17:24:35','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(33,'2161','Withholding Tax Payable',3,32,32,'','2018-11-06 17:24:49','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(34,'2162','VAT Payable',3,32,32,'','2018-11-06 17:25:03','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(35,'2163','Income Tax Payable',3,32,32,'','2018-11-06 17:25:54','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(36,'2180','Cash Bond - Employees',3,0,36,'','2018-11-06 17:26:15','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(37,'2190','Meter Deposits',3,0,37,'','2018-11-06 17:26:27','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(38,'2191','Meter Deposits - Electric',3,37,37,'','2018-11-06 17:26:49','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(39,'2192','Meter Deposits - Water',3,37,37,'','2018-11-06 17:27:04','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(40,'3100','Share Capital',5,0,40,'','2018-11-06 17:28:23','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(41,'3200','Share Premium',5,0,41,'','2018-11-06 17:28:31','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(42,'330','Retained Earnings',5,0,42,'','2018-11-06 17:28:40','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(43,'4000','INCOME',5,0,43,'','2018-11-06 17:30:31','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(44,'4100','RENTAL INCOME',5,0,44,'','2018-11-06 17:30:39','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(45,'4110','Monthly Rent Income',5,44,44,'','2018-11-06 17:30:56','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(46,'4120','CUSA',5,44,44,'','2018-11-06 17:31:12','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(47,'4200','Other Income',5,0,47,'','2018-11-06 17:31:24','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(48,'4220','Interest Income',5,47,47,'','2018-11-06 17:31:55','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(49,'4131','Penalties and Charges',5,47,47,'','2018-11-06 17:32:16','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(50,'4132','Job Orders',5,47,47,'','2018-11-06 17:32:32','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(51,'5000','EXPENSES',6,0,51,'','2018-11-06 17:34:20','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(52,'5100','Purchases',6,0,52,'','2018-11-06 17:34:33','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(53,'5110','Purchases Return',6,52,52,'','2018-11-06 17:34:46','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(54,'5110','Purchases Discount',6,52,52,'','2018-11-06 17:35:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(55,'5200','Salaries and Wages',6,0,55,'','2018-11-06 17:35:11','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(56,'5210','13th Month Pay',6,55,55,'','2018-11-06 17:35:28','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(57,'5220','Government Contributions',6,55,55,'','2018-11-06 17:35:43','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(58,'5221','SSS ECC Contribution',6,57,55,'','2018-11-06 17:35:55','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(59,'5222','HDMF/Pag-ibig Fund Premium',6,57,55,'','2018-11-06 17:36:07','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(60,'5223','Phil. Health Premium',6,57,55,'','2018-11-06 17:36:31','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(61,'5300','Utilities Expense',6,0,61,'','2018-11-06 17:38:32','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(62,'5321','Utilities - Electricity',6,61,61,'','2018-11-06 17:39:20','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(63,'5322','Utilities - Telephone and Telegraph',6,61,61,'','2018-11-06 17:43:57','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(64,'5323','Utilities - Water',6,61,61,'','2018-11-06 17:44:12','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(65,'5400','Ads and Promo',6,0,65,'','2018-11-06 17:44:24','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(66,'5410','Advertising Expense',6,65,65,'','2018-11-06 17:44:38','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(67,'5420','Magic Card Classic - Free',6,65,65,'','2018-11-06 17:44:50','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(68,'5500','Taxes and Licenses',6,0,68,'','2018-11-06 17:45:48','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(69,'5510','Business Permits',6,68,68,'','2018-11-06 17:45:59','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(70,'5511','Barangay Permit',6,69,68,'','2018-11-06 17:46:14','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(71,'5512','Mayor\'s Permit',6,69,68,'','2018-11-06 17:46:32','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(72,'5520','Income Tax Expense',6,68,68,'','2018-11-06 17:47:50','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(73,'5530','Real Property Taxes',6,68,68,'','2018-11-06 17:48:02','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(74,'5600','Agency Fee',6,0,74,'','2018-11-06 17:48:20','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(75,'5610','Manpower Agency Fee',6,74,74,'','2018-11-06 17:48:31','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(76,'5620','Security Agency Fee',6,74,74,'','2018-11-06 17:48:43','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(77,'5700','Other Expenses',6,0,77,'','2018-11-06 17:50:47','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(78,'5710','Commission Expense',6,77,77,'','2018-11-06 17:51:09','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(79,'5720','Director\'s Fee',6,77,77,'','2018-11-06 17:51:19','2018-11-06 17:52:14','0000-00-00 00:00:00',1,1,0,'','\0'),(80,'5730','Gas, Fuel and Oil',6,77,77,'','2018-11-06 17:51:27','2018-11-06 17:52:29','0000-00-00 00:00:00',1,1,0,'','\0'),(81,'5740','Insurance Expense',6,77,77,'','2018-11-06 17:51:38','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(82,'5750','Professional Fee',6,77,77,'','2018-11-06 17:52:51','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(83,'5760','Repairs and Maintenance',6,77,77,'','2018-11-06 17:53:02','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(84,'5770','Representation Expense',6,77,77,'','2018-11-06 17:53:16','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(85,'5780','Training and Development',6,77,77,'','2018-11-06 17:53:32','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(86,'5790','Transportation Expense',6,77,77,'','2018-11-06 17:53:45','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(87,'1141','Prepaid Income Tax',1,8,8,'','2018-11-07 09:21:14','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(88,'5800','Input Tax',6,0,88,'','2018-11-07 09:22:13','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(89,'5900','Cost of Goods Sold',6,0,89,'','2018-11-07 09:22:40','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(90,'1130','Output Tax',1,0,90,'','2018-11-07 09:27:50','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0');
/*!40000 ALTER TABLE `account_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_types` (
  `account_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` varchar(155) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  PRIMARY KEY (`account_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
INSERT INTO `account_types` VALUES (1,'Asset',''),(2,'Liability',''),(3,'Capital',''),(4,'Income',''),(5,'Expense','');
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_year`
--

DROP TABLE IF EXISTS `account_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_year` (
  `account_year_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_year` varchar(100) DEFAULT '',
  `description` varchar(755) DEFAULT '',
  `status` varchar(100) DEFAULT NULL,
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `date_closed` datetime DEFAULT '0000-00-00 00:00:00',
  `closed_by_user` int(11) DEFAULT '0',
  PRIMARY KEY (`account_year_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_year`
--

LOCK TABLES `account_year` WRITE;
/*!40000 ALTER TABLE `account_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_period`
--

DROP TABLE IF EXISTS `accounting_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_period` (
  `accounting_period_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `period_start` date DEFAULT '0000-00-00',
  `period_end` date DEFAULT '0000-00-00',
  `closed_by_user` bigint(20) DEFAULT '0',
  `date_time_closed` datetime DEFAULT '0000-00-00 00:00:00',
  `remarks` varchar(1000) DEFAULT '',
  PRIMARY KEY (`accounting_period_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_period`
--

LOCK TABLES `accounting_period` WRITE;
/*!40000 ALTER TABLE `accounting_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjustment_info`
--

DROP TABLE IF EXISTS `adjustment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjustment_info` (
  `adjustment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adjustment_code` varchar(75) DEFAULT '',
  `department_id` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `adjustment_type` varchar(20) DEFAULT 'IN',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `total_tax_amount` decimal(20,2) unsigned zerofill DEFAULT '000000000000000000.00',
  `date_adjusted` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT NULL,
  `posted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `pos_is_received` bit(1) DEFAULT b'0',
  `is_for_pos` bit(1) DEFAULT b'0',
  `is_journal_posted` tinyint(1) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT '0',
  `is_returns` bit(1) DEFAULT b'0',
  `inv_no` varchar(145) DEFAULT '',
  PRIMARY KEY (`adjustment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustment_info`
--

LOCK TABLES `adjustment_info` WRITE;
/*!40000 ALTER TABLE `adjustment_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjustment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjustment_items`
--

DROP TABLE IF EXISTS `adjustment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjustment_items` (
  `adjustment_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `adjust_qty` decimal(20,2) DEFAULT '0.00',
  `adjust_price` decimal(20,4) DEFAULT '0.0000',
  `adjust_discount` decimal(20,4) DEFAULT '0.0000',
  `adjust_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `adjust_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `adjust_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `adjust_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `adjust_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`adjustment_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustment_items`
--

LOCK TABLES `adjustment_items` WRITE;
/*!40000 ALTER TABLE `adjustment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjustment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_status`
--

DROP TABLE IF EXISTS `approval_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_status` (
  `approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval_status` varchar(100) DEFAULT '',
  `approval_description` varchar(555) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`approval_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_status`
--

LOCK TABLES `approval_status` WRITE;
/*!40000 ALTER TABLE `approval_status` DISABLE KEYS */;
INSERT INTO `approval_status` VALUES (1,'Approved','','','\0'),(2,'Pending','','','\0'),(3,'Cancelled','','','\0');
/*!40000 ALTER TABLE `approval_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_trans`
--

DROP TABLE IF EXISTS `ar_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_trans` (
  `ar_trans_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ar_trans_name` varchar(245) DEFAULT NULL,
  `ar_trans_desc` varchar(245) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ar_trans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_trans`
--

LOCK TABLES `ar_trans` WRITE;
/*!40000 ALTER TABLE `ar_trans` DISABLE KEYS */;
INSERT INTO `ar_trans` VALUES (1,'Charge Invoice','Charge Invoice','','\0'),(2,'Purchase Order','Purchase Order','','\0'),(3,'Magic Card Gold External','Magic Card Gold External','','\0'),(4,'Various Customers','Various Customers','','\0');
/*!40000 ALTER TABLE `ar_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_property_status`
--

DROP TABLE IF EXISTS `asset_property_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_property_status` (
  `asset_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_property_status` varchar(50) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`asset_status_id`) USING BTREE,
  UNIQUE KEY `asset_property_id` (`asset_status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_property_status`
--

LOCK TABLES `asset_property_status` WRITE;
/*!40000 ALTER TABLE `asset_property_status` DISABLE KEYS */;
INSERT INTO `asset_property_status` VALUES (1,'Active',1,0),(2,'Inactive',1,0),(3,'Obsolete',1,0),(4,'Lost',1,0),(5,'Damage',1,0);
/*!40000 ALTER TABLE `asset_property_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_billing_info`
--

DROP TABLE IF EXISTS `b_billing_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_billing_info` (
  `billing_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `billing_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `period_id` int(11) NOT NULL DEFAULT '0',
  `tenant_id` int(11) NOT NULL DEFAULT '0',
  `contract_id` int(11) NOT NULL DEFAULT '0',
  `month_id` int(11) NOT NULL DEFAULT '0',
  `app_year` int(11) NOT NULL DEFAULT '0',
  `due_date` datetime DEFAULT NULL,
  `total_fixed_rent` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `total_util_charges` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `total_misc_charges` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `total_othr_charges` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `sub_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `vatable_amount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `discounted_vatable_amount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `vat_percent` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `total_vat` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `total_amount_due` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `total_adjusted_in` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `total_adjusted_out` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `wtax_amount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `wtax_percent` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`billing_id`),
  UNIQUE KEY `b_billing_info_billing_no_unique` (`billing_no`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_billing_info`
--

LOCK TABLES `b_billing_info` WRITE;
/*!40000 ALTER TABLE `b_billing_info` DISABLE KEYS */;
INSERT INTO `b_billing_info` VALUES (9,'2018-BN-000010',1,2,11,11,2018,'2018-12-05 00:00:00',15000.00000,0.00000,0.00000,0.00000,15000.00000,15000.00000,12500.00000,12.00000,1800.00000,16050.00000,0.00000,0.00000,0,750.00000,5.00000,'2018-12-12 01:10:24',1,'2018-12-17 05:02:16',1,NULL,NULL,0),(11,'2018-BN-000012',2,2,11,12,2018,'2019-01-20 00:00:00',15000.00000,750.00000,750.00000,1231.50000,17731.50000,15000.00000,12500.00000,0.00000,0.00000,17731.50000,0.00000,0.00000,0,0.00000,0.00000,'2018-12-13 03:21:01',1,'2018-12-17 05:03:45',1,NULL,NULL,0),(12,'2018-BN-000013',2,2,11,12,2018,'2019-01-20 00:00:00',15000.00000,0.00000,0.00000,535.50000,15535.50000,15000.00000,0.00000,0.00000,0.00000,15535.50000,0.00000,0.00000,0,0.00000,0.00000,'2018-12-17 01:12:57',1,NULL,NULL,'2018-12-17 01:25:34',1,1),(13,'2018-BN-000014',3,2,11,1,2019,'2019-02-19 00:00:00',15000.00000,750.00000,750.00000,750.00000,17250.00000,15000.00000,0.00000,0.00000,0.00000,17250.00000,0.00000,0.00000,0,0.00000,0.00000,'2018-12-17 04:18:46',1,NULL,NULL,NULL,NULL,0),(14,'2018-BN-000015',4,2,11,2,2019,'2019-03-18 00:00:00',15000.00000,0.00000,0.00000,6.00000,15006.00000,15000.00000,12500.00000,0.00000,0.00000,15006.00000,0.00000,0.00000,0,0.00000,0.00000,'2018-12-17 09:18:20',1,'2018-12-18 01:29:06',1,NULL,NULL,0),(25,'2018-BN-000016',4,2,11,2,2019,'2019-03-18 00:00:00',15000.00000,0.00000,0.00000,0.00000,15000.00000,15000.00000,0.00000,0.00000,0.00000,15000.00000,0.00000,0.00000,0,0.00000,0.00000,'2018-12-17 09:42:53',1,NULL,NULL,'2018-12-17 09:46:11',1,1),(26,'2018-BN-000017',4,2,11,2,2019,'2019-03-18 00:00:00',15000.00000,0.00000,0.00000,0.00000,15000.00000,15000.00000,0.00000,0.00000,0.00000,15000.00000,0.00000,0.00000,0,0.00000,0.00000,'2018-12-17 09:44:18',1,NULL,NULL,'2018-12-17 09:46:14',1,1),(27,'2018-BN-000018',4,2,11,2,2019,'2019-03-18 00:00:00',15000.00000,0.00000,0.00000,0.00000,15000.00000,15000.00000,0.00000,0.00000,0.00000,15000.00000,0.00000,0.00000,0,0.00000,0.00000,'2018-12-17 09:45:17',1,NULL,NULL,'2018-12-17 09:46:16',1,1),(28,'2018-BN-000019',4,2,11,2,2019,'2019-03-18 00:00:00',15000.00000,0.00000,0.00000,0.00000,15000.00000,15000.00000,0.00000,0.00000,0.00000,15000.00000,0.00000,0.00000,0,0.00000,0.00000,'2018-12-17 09:45:47',1,NULL,NULL,'2018-12-17 09:46:22',1,1);
/*!40000 ALTER TABLE `b_billing_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_billing_misc_charges`
--

DROP TABLE IF EXISTS `b_billing_misc_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_billing_misc_charges` (
  `billing_misc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `billing_id` int(11) DEFAULT '0',
  `charge_id` int(11) DEFAULT '0',
  `billing_misc_rate` decimal(15,5) DEFAULT '0.00000',
  `billing_misc_reading` decimal(15,5) DEFAULT '0.00000',
  `billing_misc_line_total` decimal(15,5) DEFAULT '0.00000',
  `billing_misc_is_vatted` tinyint(4) NOT NULL DEFAULT '0',
  `billing_misc_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`billing_misc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_billing_misc_charges`
--

LOCK TABLES `b_billing_misc_charges` WRITE;
/*!40000 ALTER TABLE `b_billing_misc_charges` DISABLE KEYS */;
INSERT INTO `b_billing_misc_charges` VALUES (42,12,7,0.00000,0.00000,0.00000,0,NULL),(44,12,7,0.00000,0.00000,0.00000,0,NULL),(46,13,7,25.00000,30.00000,750.00000,0,NULL),(48,11,7,25.00000,30.00000,750.00000,0,NULL),(53,15,7,0.00000,0.00000,0.00000,0,NULL),(54,16,7,0.00000,0.00000,0.00000,0,NULL),(56,17,7,0.00000,0.00000,0.00000,0,NULL),(57,18,7,0.00000,0.00000,0.00000,0,NULL),(58,19,7,0.00000,0.00000,0.00000,0,NULL),(59,20,7,0.00000,0.00000,0.00000,0,NULL),(60,21,7,0.00000,0.00000,0.00000,0,NULL),(61,22,7,0.00000,0.00000,0.00000,0,NULL),(64,23,7,0.00000,0.00000,0.00000,0,NULL),(65,24,7,0.00000,0.00000,0.00000,0,NULL),(66,25,7,0.00000,0.00000,0.00000,0,NULL),(67,26,7,0.00000,0.00000,0.00000,0,NULL),(68,27,7,0.00000,0.00000,0.00000,0,NULL),(69,28,7,0.00000,0.00000,0.00000,0,NULL),(78,14,7,0.00000,0.00000,0.00000,0,NULL);
/*!40000 ALTER TABLE `b_billing_misc_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_billing_othr_charges`
--

DROP TABLE IF EXISTS `b_billing_othr_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_billing_othr_charges` (
  `billing_othr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `billing_id` int(11) DEFAULT '0',
  `charge_id` int(11) DEFAULT '0',
  `billing_othr_rate` decimal(15,5) DEFAULT '0.00000',
  `billing_othr_reading` decimal(15,5) DEFAULT '0.00000',
  `billing_othr_line_total` decimal(15,5) DEFAULT '0.00000',
  `billing_othr_is_vatted` tinyint(4) NOT NULL DEFAULT '0',
  `billing_othr_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`billing_othr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_billing_othr_charges`
--

LOCK TABLES `b_billing_othr_charges` WRITE;
/*!40000 ALTER TABLE `b_billing_othr_charges` DISABLE KEYS */;
INSERT INTO `b_billing_othr_charges` VALUES (53,12,3,0.00000,0.00000,0.00000,0,NULL),(54,12,1,0.00000,17850.00000,0.00000,0,NULL),(57,12,3,0.00000,0.00000,0.00000,0,NULL),(58,12,1,0.03000,17850.00000,535.50000,0,NULL),(61,13,3,25.00000,30.00000,750.00000,0,NULL),(64,11,3,25.00000,30.00000,750.00000,0,NULL),(65,11,1,0.03000,16050.00000,481.50000,0,NULL),(70,15,3,0.00000,0.00000,0.00000,0,NULL),(71,16,3,0.00000,0.00000,0.00000,0,NULL),(73,17,3,0.00000,0.00000,0.00000,0,NULL),(74,18,3,0.00000,0.00000,0.00000,0,NULL),(75,19,3,0.00000,0.00000,0.00000,0,NULL),(76,20,3,0.00000,0.00000,0.00000,0,NULL),(77,21,3,0.00000,0.00000,0.00000,0,NULL),(78,22,3,0.00000,0.00000,0.00000,0,NULL),(81,23,3,0.00000,0.00000,0.00000,0,NULL),(82,24,3,0.00000,0.00000,0.00000,0,NULL),(83,25,3,0.00000,0.00000,0.00000,0,NULL),(84,26,3,0.00000,0.00000,0.00000,0,NULL),(85,27,3,0.00000,0.00000,0.00000,0,NULL),(86,28,3,0.00000,0.00000,0.00000,0,NULL),(95,14,3,3.00000,2.00000,6.00000,0,NULL);
/*!40000 ALTER TABLE `b_billing_othr_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_billing_schedule`
--

DROP TABLE IF EXISTS `b_billing_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_billing_schedule` (
  `billing_schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `billing_id` int(11) DEFAULT '0',
  `month_id` int(11) DEFAULT '0',
  `app_year` int(11) DEFAULT '0',
  `line_total` decimal(15,5) DEFAULT '0.00000',
  `is_vatted` tinyint(4) NOT NULL DEFAULT '0',
  `billing_schedule_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`billing_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_billing_schedule`
--

LOCK TABLES `b_billing_schedule` WRITE;
/*!40000 ALTER TABLE `b_billing_schedule` DISABLE KEYS */;
INSERT INTO `b_billing_schedule` VALUES (42,12,1,2019,15000.00000,1,NULL),(44,12,1,2019,15000.00000,1,NULL),(46,13,2,2019,15000.00000,1,NULL),(48,9,12,2018,15000.00000,1,NULL),(49,11,1,2019,15000.00000,1,NULL),(54,15,3,2019,15000.00000,1,NULL),(55,16,3,2019,15000.00000,1,NULL),(57,17,3,2019,15000.00000,1,NULL),(58,18,3,2019,15000.00000,1,NULL),(59,19,3,2019,15000.00000,1,NULL),(60,20,3,2019,15000.00000,1,NULL),(61,21,3,2019,15000.00000,1,NULL),(62,22,3,2019,15000.00000,1,NULL),(65,23,3,2019,15000.00000,1,NULL),(66,24,3,2019,15000.00000,1,NULL),(67,25,3,2019,15000.00000,1,NULL),(68,26,3,2019,15000.00000,1,NULL),(69,27,3,2019,15000.00000,1,NULL),(70,28,3,2019,15000.00000,1,NULL),(79,14,3,2019,15000.00000,1,NULL);
/*!40000 ALTER TABLE `b_billing_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_billing_util_charges`
--

DROP TABLE IF EXISTS `b_billing_util_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_billing_util_charges` (
  `billing_util_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `billing_id` int(11) DEFAULT '0',
  `charge_id` int(11) DEFAULT '0',
  `billing_util_rate` decimal(15,5) DEFAULT '0.00000',
  `billing_util_reading` decimal(15,5) DEFAULT '0.00000',
  `billing_util_line_total` decimal(15,5) DEFAULT '0.00000',
  `billing_util_is_vatted` tinyint(4) NOT NULL DEFAULT '0',
  `billing_util_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`billing_util_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_billing_util_charges`
--

LOCK TABLES `b_billing_util_charges` WRITE;
/*!40000 ALTER TABLE `b_billing_util_charges` DISABLE KEYS */;
INSERT INTO `b_billing_util_charges` VALUES (42,12,7,0.00000,0.00000,0.00000,0,NULL),(44,12,7,0.00000,0.00000,0.00000,0,NULL),(46,13,7,25.00000,30.00000,750.00000,0,NULL),(48,11,7,25.00000,30.00000,750.00000,0,NULL),(53,15,7,0.00000,0.00000,0.00000,0,NULL),(54,16,7,0.00000,0.00000,0.00000,0,NULL),(56,17,7,0.00000,0.00000,0.00000,0,NULL),(57,18,7,0.00000,0.00000,0.00000,0,NULL),(58,19,7,0.00000,0.00000,0.00000,0,NULL),(59,20,7,0.00000,0.00000,0.00000,0,NULL),(60,21,7,0.00000,0.00000,0.00000,0,NULL),(61,22,7,0.00000,0.00000,0.00000,0,NULL),(64,23,7,0.00000,0.00000,0.00000,0,NULL),(65,24,7,0.00000,0.00000,0.00000,0,NULL),(66,25,7,0.00000,0.00000,0.00000,0,NULL),(67,26,7,0.00000,0.00000,0.00000,0,NULL),(68,27,7,0.00000,0.00000,0.00000,0,NULL),(69,28,7,0.00000,0.00000,0.00000,0,NULL),(78,14,7,0.00000,0.00000,0.00000,0,NULL);
/*!40000 ALTER TABLE `b_billing_util_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_contract_info`
--

DROP TABLE IF EXISTS `b_contract_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_contract_info` (
  `contract_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tenant_id` int(11) DEFAULT '0',
  `contract_billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `contract_type_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `commencement_date` datetime DEFAULT NULL,
  `termination_date` datetime DEFAULT NULL,
  `start_billing_date` datetime DEFAULT NULL,
  `location_id` int(11) DEFAULT '0',
  `contract_signatory` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `contract_terms` int(11) DEFAULT NULL,
  `contract_approved_merch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `contract_fixed_rent` decimal(15,5) DEFAULT NULL,
  `contract_discounted_rent` decimal(15,5) DEFAULT NULL,
  `power_meter_deposit` decimal(15,5) DEFAULT NULL,
  `security_deposit` decimal(15,5) DEFAULT NULL,
  `contract_escalation_percent` decimal(15,5) DEFAULT NULL,
  `contract_floor_area` decimal(15,5) DEFAULT NULL,
  `department_id` int(11) DEFAULT '0',
  `nature_of_business_id` int(11) DEFAULT '0',
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  `is_closed` tinyint(4) NOT NULL DEFAULT '0',
  `approved_by` int(11) DEFAULT '0',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT '0',
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contract_id`),
  UNIQUE KEY `b_contract_info_contract_no_unique` (`contract_no`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_contract_info`
--

LOCK TABLES `b_contract_info` WRITE;
/*!40000 ALTER TABLE `b_contract_info` DISABLE KEYS */;
INSERT INTO `b_contract_info` VALUES (2,'2018-CN-000001',1,'Balibago, Angeles City',1,1,'2018-11-06 00:00:00','2018-11-06 00:00:00','2018-11-06 00:00:00',1,'Sarah Pabustan',1,NULL,15000.00000,0.00000,0.00000,0.00000,5.00000,0.00000,1,1,0,0,0,'2018-12-01 05:46:42',1,NULL,0,'2018-12-05 04:02:23',1,0),(6,'2018-CN-000007',1,'Balibago, Angeles City',1,1,'2018-11-07 00:00:00','2018-11-07 00:00:00','2018-11-30 00:00:00',1,'Sarah Pabustan',5,'',15000.00000,0.00000,0.00000,0.00000,5.00000,25.00000,1,1,0,0,0,'2018-11-07 11:13:03',1,NULL,0,'2018-12-05 04:02:52',1,0),(7,'2018-CN-000008',NULL,'Balibago, Angeles City',NULL,NULL,'2018-11-25 00:00:00','2019-11-24 00:00:00','2018-11-25 00:00:00',NULL,'Sarah Pabustan',12,'123',15000.00000,0.00000,0.00000,0.00000,5.00000,0.00000,NULL,NULL,0,0,0,'2018-11-25 13:56:44',1,NULL,0,NULL,0,0),(8,'2018-CN-000009',2,'Balibago, Angeles City',1,44,'2018-11-25 00:00:00','2019-11-24 00:00:00','2018-11-25 00:00:00',1,'Sarah Pabustan',12,'123',15000.00000,0.00000,0.00000,0.00000,5.00000,0.00000,1,1,0,0,0,'2018-11-25 14:06:25',1,NULL,0,NULL,0,0),(9,'2018-CN-000010',2,'Balibago, Angeles City',1,44,'2018-11-25 00:00:00','2019-11-24 00:00:00','2018-11-25 00:00:00',1,'Sarah Pabustan',12,NULL,15000.00000,0.00000,0.00000,0.00000,5.00000,0.00000,1,1,0,0,0,'2018-11-25 14:10:43',1,NULL,0,NULL,0,0),(10,'2018-CN-000011',2,'Balibago, Angeles City',1,44,'2018-11-25 00:00:00','2019-11-24 00:00:00','2018-11-25 00:00:00',1,'Sarah Pabustan',12,NULL,15000.00000,0.00000,0.00000,0.00000,5.00000,0.00000,1,1,0,0,0,'2018-11-26 01:28:27',1,NULL,0,NULL,0,0),(11,'2018-CN-000012',2,'Balibago, Angeles City',1,44,'2018-11-25 00:00:00','2019-11-24 00:00:00','2018-11-25 00:00:00',1,'Sarah Pabustan',12,NULL,15000.00000,12500.00000,0.00000,0.00000,5.00000,0.00000,1,1,0,0,0,'2018-12-13 03:28:26',1,NULL,0,NULL,0,0),(12,'2018-CN-000013',1,'Balibago, Angeles City',1,40,'2018-11-25 00:00:00','2018-11-25 00:00:00','2018-11-25 00:00:00',1,'Sarah Pabustan',1,NULL,7.00000,0.00000,0.00000,0.00000,5.00000,0.00000,1,1,0,0,0,'2018-11-25 14:20:06',1,NULL,0,NULL,0,0),(13,'2018-CN-000014',2,'Balibago, Angeles City',1,43,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,'erick',12.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 05:35:47',1,NULL,0,NULL,0,0),(14,'2018-CN-000015',NULL,NULL,NULL,NULL,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',NULL,NULL,0,NULL,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,NULL,NULL,0,0,0,'2018-12-01 05:36:04',1,NULL,0,NULL,0,0),(15,'2018-CN-000016',1,'Balibago, Angeles City',1,40,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,'123',123.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 05:37:55',1,NULL,0,NULL,0,0),(16,'2018-CN-000017',2,'Balibago, Angeles City',1,44,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,'jason',123.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-02 14:37:51',1,NULL,0,NULL,0,0),(17,'2018-CN-000018',NULL,NULL,NULL,NULL,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',NULL,NULL,0,NULL,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,NULL,NULL,0,0,0,'2018-12-01 05:39:44',1,NULL,0,NULL,0,0),(18,'2018-CN-000019',2,'Balibago, Angeles City',1,44,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,NULL,1312.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 05:40:53',1,NULL,0,NULL,0,0),(19,'2018-CN-000020',NULL,NULL,NULL,NULL,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',NULL,NULL,0,NULL,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,NULL,NULL,0,0,0,'2018-12-01 05:40:57',1,NULL,0,NULL,0,0),(20,'2018-CN-000021',2,'Balibago, Angeles City',1,40,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,NULL,123123.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 05:42:51',1,NULL,0,NULL,0,0),(21,'2018-CN-000022',2,'Balibago, Angeles City',1,44,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,NULL,123.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 05:44:28',1,NULL,0,NULL,0,0),(22,'2018-CN-000023',2,'Balibago, Angeles City',1,40,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,NULL,123123.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 05:45:48',1,NULL,0,NULL,0,0),(23,'2018-CN-000024',2,'Balibago, Angeles City',1,44,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,NULL,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 05:46:23',1,NULL,0,NULL,0,0),(24,'2018-CN-000025',2,'Balibago, Angeles City',1,41,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,NULL,15000.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 05:47:51',1,NULL,0,NULL,0,0),(25,'2018-CN-000026',2,'Balibago, Angeles City',1,43,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,NULL,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 05:57:37',1,NULL,0,NULL,0,0),(26,'2018-CN-000027',2,'Balibago, Angeles City',1,44,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,'jason',15000.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 05:58:55',1,NULL,0,NULL,0,0),(27,'2018-CN-000028',2,'Balibago, Angeles City',1,44,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,'jason',0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 06:00:26',1,NULL,0,NULL,0,0),(28,'2018-CN-000029',2,'Balibago, Angeles City',1,43,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,'jason',123123.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 09:06:11',1,NULL,0,NULL,0,0),(29,'2018-CN-000030',2,'Balibago, Angeles City',1,44,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,NULL,123.00000,0.00000,0.00000,0.00000,0.00000,12.00000,1,1,0,0,0,'2018-12-01 09:21:36',1,NULL,0,'2018-12-05 04:06:02',1,0),(30,'2018-CN-000031',2,'Balibago, Angeles City',1,43,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,NULL,1500.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 09:25:34',1,NULL,0,'2018-12-05 04:05:49',1,0),(31,'2018-CN-000032',2,'Balibago, Angeles City',1,44,'2018-12-01 00:00:00','2018-12-01 00:00:00','2018-12-01 00:00:00',1,'Sarah Pabustan',1,NULL,123123.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,0,0,0,'2018-12-01 09:30:43',1,NULL,0,'2018-12-05 04:05:27',1,0),(32,'2018-CN-000033',NULL,NULL,NULL,NULL,'2018-12-18 00:00:00','2018-12-18 00:00:00','2018-12-18 00:00:00',NULL,NULL,1,NULL,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,NULL,NULL,0,0,0,'2018-12-18 01:45:54',1,NULL,0,'2018-12-18 01:46:27',1,1),(33,'2018-CN-000034',NULL,NULL,NULL,NULL,'2018-12-18 00:00:00','2018-12-18 00:00:00','2018-12-18 00:00:00',NULL,NULL,1,NULL,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,NULL,NULL,0,0,0,'2018-12-18 02:01:05',1,NULL,0,'2018-12-18 02:01:08',1,1);
/*!40000 ALTER TABLE `b_contract_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_contract_misc_charges`
--

DROP TABLE IF EXISTS `b_contract_misc_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_contract_misc_charges` (
  `contract_misc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) DEFAULT '0',
  `charge_id` int(11) DEFAULT '0',
  `contract_misc_rate` decimal(15,5) DEFAULT '0.00000',
  `contract_misc_default_reading` decimal(15,5) DEFAULT '0.00000',
  `contract_misc_is_vatted` tinyint(4) NOT NULL DEFAULT '0',
  `contract_misc_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`contract_misc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_contract_misc_charges`
--

LOCK TABLES `b_contract_misc_charges` WRITE;
/*!40000 ALTER TABLE `b_contract_misc_charges` DISABLE KEYS */;
INSERT INTO `b_contract_misc_charges` VALUES (1,9,8,150.00000,0.00000,0,''),(6,6,3,1500.00000,0.00000,0,''),(7,5,1,12312312.00000,0.00000,0,''),(8,3,1,1500.00000,0.00000,0,''),(11,4,4,15000.00000,0.00000,0,''),(13,12,2,0.00000,0.00000,0,NULL),(20,10,3,0.00000,0.00000,0,NULL),(21,13,4,0.00000,0.00000,0,NULL),(22,15,2,0.00000,0.00000,0,NULL),(23,15,1,0.00000,0.00000,0,NULL),(26,18,4,0.00000,0.00000,0,NULL),(27,18,3,0.00000,0.00000,0,NULL),(28,20,4,0.00000,0.00000,0,NULL),(29,20,3,0.00000,0.00000,0,NULL),(30,21,7,0.00000,0.00000,0,NULL),(31,21,4,0.00000,0.00000,0,NULL),(32,26,3,0.00000,0.00000,0,NULL),(33,26,2,0.00000,0.00000,0,NULL),(34,27,2,0.00000,0.00000,0,NULL),(35,27,1,0.00000,0.00000,0,NULL),(36,16,2,0.00000,0.00000,0,NULL),(37,16,1,0.00000,0.00000,0,NULL),(39,11,7,0.00000,0.00000,0,NULL);
/*!40000 ALTER TABLE `b_contract_misc_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_contract_othr_charges`
--

DROP TABLE IF EXISTS `b_contract_othr_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_contract_othr_charges` (
  `contract_othr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) DEFAULT '0',
  `charge_id` int(11) DEFAULT '0',
  `contract_othr_rate` decimal(15,5) DEFAULT '0.00000',
  `contract_othr_default_reading` decimal(15,5) DEFAULT '0.00000',
  `contract_othr_is_vatted` tinyint(4) NOT NULL DEFAULT '0',
  `contract_othr_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`contract_othr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_contract_othr_charges`
--

LOCK TABLES `b_contract_othr_charges` WRITE;
/*!40000 ALTER TABLE `b_contract_othr_charges` DISABLE KEYS */;
INSERT INTO `b_contract_othr_charges` VALUES (1,9,7,650.00000,0.00000,0,''),(9,6,2,1500.00000,0.00000,0,''),(10,6,1,1500.00000,0.00000,0,''),(11,5,8,123.00000,0.00000,0,''),(12,5,7,123.00000,0.00000,0,''),(13,5,4,123.00000,0.00000,0,''),(14,3,3,1500.00000,0.00000,0,''),(17,4,2,15000.00000,0.00000,0,''),(19,12,7,0.00000,0.00000,0,NULL),(23,10,1,0.00000,0.00000,0,NULL),(24,13,1,0.00000,0.00000,0,NULL),(25,15,2,0.00000,0.00000,0,NULL),(26,15,1,0.00000,0.00000,0,NULL),(29,18,2,0.00000,0.00000,0,NULL),(30,18,1,0.00000,0.00000,0,NULL),(31,20,2,0.00000,0.00000,0,NULL),(32,20,1,0.00000,0.00000,0,NULL),(33,21,2,0.00000,0.00000,0,NULL),(34,21,1,0.00000,0.00000,0,NULL),(35,26,2,0.00000,0.00000,0,NULL),(36,26,1,0.00000,0.00000,0,NULL),(37,27,2,0.00000,0.00000,0,NULL),(38,27,1,0.00000,0.00000,0,NULL),(39,16,7,0.00000,0.00000,0,NULL),(40,16,4,0.00000,0.00000,0,NULL),(42,11,3,0.00000,0.00000,0,NULL);
/*!40000 ALTER TABLE `b_contract_othr_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_contract_schedule`
--

DROP TABLE IF EXISTS `b_contract_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_contract_schedule` (
  `contract_schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) DEFAULT '0',
  `month_id` int(11) DEFAULT '0',
  `app_year` int(11) DEFAULT '0',
  `fixed_rent` decimal(15,5) DEFAULT '0.00000',
  `escalation_percent` decimal(15,5) DEFAULT '0.00000',
  `amount_due` decimal(15,5) DEFAULT '0.00000',
  `is_vatted` tinyint(4) NOT NULL DEFAULT '0',
  `contract_schedule_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`contract_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_contract_schedule`
--

LOCK TABLES `b_contract_schedule` WRITE;
/*!40000 ALTER TABLE `b_contract_schedule` DISABLE KEYS */;
INSERT INTO `b_contract_schedule` VALUES (2,7,12,2018,15000.00000,0.00000,15000.00000,0,''),(3,9,12,2018,15000.00000,0.00000,15000.00000,0,''),(10,6,11,2018,15000.00000,0.00000,15000.00000,0,''),(11,6,12,2018,15000.00000,0.00000,15000.00000,0,''),(12,6,1,2018,15000.00000,0.00000,15000.00000,0,''),(13,6,2,2018,15000.00000,0.00000,15000.00000,0,''),(14,6,3,2018,15000.00000,0.00000,15000.00000,0,''),(15,6,4,2018,15000.00000,0.00000,15000.00000,0,''),(16,5,11,2018,15000.00000,0.00000,15000.00000,0,''),(17,5,12,2018,15000.00000,0.00000,15000.00000,0,''),(18,3,11,2019,15000.00000,5.00000,15750.00000,0,''),(19,3,12,2019,15750.00000,0.00000,15750.00000,0,''),(23,4,12,2018,15000.00000,5.00000,15750.00000,0,''),(24,4,12,2018,15750.00000,50.00000,23625.00000,0,''),(25,4,1,2018,23625.00000,0.00000,23625.00000,0,''),(39,12,11,2018,7.00000,0.00000,7.00000,0,NULL),(40,12,12,2018,7.00000,0.00000,7.00000,0,NULL),(80,10,11,2018,15000.00000,0.00000,15000.00000,0,NULL),(81,10,12,2018,15000.00000,0.00000,15000.00000,0,NULL),(82,10,1,2019,15000.00000,0.00000,15000.00000,0,NULL),(83,10,2,2019,15000.00000,0.00000,15000.00000,0,NULL),(84,10,3,2019,15000.00000,0.00000,15000.00000,0,NULL),(85,10,4,2019,15000.00000,0.00000,15000.00000,0,NULL),(86,10,5,2019,15000.00000,0.00000,15000.00000,0,NULL),(87,10,6,2019,15000.00000,0.00000,15000.00000,0,NULL),(88,10,7,2019,15000.00000,0.00000,15000.00000,0,NULL),(89,10,8,2019,15000.00000,0.00000,15000.00000,0,NULL),(90,10,9,2019,15000.00000,0.00000,15000.00000,0,NULL),(91,10,10,2019,15000.00000,0.00000,15000.00000,0,NULL),(92,10,11,2019,15000.00000,5.00000,15750.00000,0,NULL),(93,13,12,2018,12.00000,0.00000,12.00000,0,NULL),(94,13,1,2019,12.00000,0.00000,12.00000,0,NULL),(95,15,12,2018,123.00000,0.00000,123.00000,0,NULL),(96,15,1,2019,123.00000,0.00000,123.00000,0,NULL),(99,18,12,2018,1312.00000,0.00000,1312.00000,0,NULL),(100,18,1,2019,1312.00000,0.00000,1312.00000,0,NULL),(101,20,12,2018,123123.00000,0.00000,123123.00000,0,NULL),(102,20,1,2019,123123.00000,0.00000,123123.00000,0,NULL),(103,21,12,2018,123.00000,0.00000,123.00000,0,NULL),(104,21,1,2019,123.00000,0.00000,123.00000,0,NULL),(105,25,12,2018,0.00000,0.00000,0.00000,0,NULL),(106,25,1,2019,0.00000,0.00000,0.00000,0,NULL),(107,26,12,2018,15000.00000,0.00000,15000.00000,0,NULL),(108,26,1,2019,15000.00000,0.00000,15000.00000,0,NULL),(109,27,12,2018,0.00000,0.00000,0.00000,0,NULL),(110,27,1,2019,0.00000,0.00000,0.00000,0,NULL),(111,28,12,2018,123123.00000,0.00000,123123.00000,0,NULL),(112,28,1,2019,123123.00000,0.00000,123123.00000,0,NULL),(113,29,12,2018,0.00000,0.00000,0.00000,0,NULL),(114,29,1,2019,0.00000,0.00000,0.00000,0,NULL),(115,30,12,2018,1500.00000,0.00000,1500.00000,0,NULL),(116,30,1,2019,1500.00000,0.00000,1500.00000,0,NULL),(117,31,12,2018,123123.00000,0.00000,123123.00000,0,NULL),(118,31,1,2019,123123.00000,0.00000,123123.00000,0,NULL),(119,16,12,2018,123.00000,0.00000,123.00000,1,NULL),(120,16,1,2019,123.00000,0.00000,123.00000,1,NULL),(134,11,11,2018,15000.00000,0.00000,15000.00000,1,NULL),(135,11,12,2018,15000.00000,0.00000,15000.00000,1,NULL),(136,11,1,2019,15000.00000,0.00000,15000.00000,1,NULL),(137,11,2,2019,15000.00000,0.00000,15000.00000,1,NULL),(138,11,3,2019,15000.00000,0.00000,15000.00000,1,NULL),(139,11,4,2019,15000.00000,0.00000,15000.00000,1,NULL),(140,11,5,2019,15000.00000,0.00000,15000.00000,1,NULL),(141,11,6,2019,15000.00000,0.00000,15000.00000,1,NULL),(142,11,7,2019,15000.00000,0.00000,15000.00000,1,NULL),(143,11,8,2019,15000.00000,0.00000,15000.00000,1,NULL),(144,11,9,2019,15000.00000,0.00000,15000.00000,1,NULL),(145,11,10,2019,15000.00000,0.00000,15000.00000,1,NULL),(146,11,11,2019,15000.00000,5.00000,15750.00000,1,NULL);
/*!40000 ALTER TABLE `b_contract_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_contract_util_charges`
--

DROP TABLE IF EXISTS `b_contract_util_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_contract_util_charges` (
  `contract_util_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) DEFAULT '0',
  `charge_id` int(11) DEFAULT '0',
  `contract_util_rate` decimal(15,5) DEFAULT '0.00000',
  `contract_util_default_reading` decimal(15,5) DEFAULT '0.00000',
  `contract_util_is_vatted` tinyint(4) NOT NULL DEFAULT '0',
  `contract_util_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`contract_util_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_contract_util_charges`
--

LOCK TABLES `b_contract_util_charges` WRITE;
/*!40000 ALTER TABLE `b_contract_util_charges` DISABLE KEYS */;
INSERT INTO `b_contract_util_charges` VALUES (1,7,1,5000.00000,0.00000,0,''),(2,9,8,350.00000,0.00000,0,''),(8,6,8,15000.00000,0.00000,0,''),(9,5,7,123.00000,0.00000,0,''),(10,5,3,123.00000,0.00000,0,''),(11,5,8,0.00000,0.00000,0,''),(12,3,3,1500.00000,0.00000,0,''),(15,4,1,15000.00000,0.00000,0,''),(17,12,7,0.00000,0.00000,0,NULL),(23,10,7,0.00000,0.00000,0,NULL),(24,13,7,0.00000,0.00000,0,NULL),(25,15,2,0.00000,0.00000,0,NULL),(26,15,1,0.00000,0.00000,0,NULL),(29,18,3,0.00000,0.00000,0,NULL),(30,20,2,0.00000,0.00000,0,NULL),(31,20,1,0.00000,0.00000,0,NULL),(32,21,7,0.00000,0.00000,0,NULL),(33,21,4,0.00000,0.00000,0,NULL),(34,25,3,0.00000,0.00000,0,NULL),(35,25,2,0.00000,0.00000,0,NULL),(36,26,7,0.00000,0.00000,0,NULL),(37,26,4,0.00000,0.00000,0,NULL),(38,26,2,0.00000,0.00000,0,NULL),(39,26,1,0.00000,0.00000,0,NULL),(40,27,3,0.00000,0.00000,0,NULL),(41,27,2,0.00000,0.00000,0,NULL),(42,16,3,0.00000,0.00000,0,NULL),(43,16,1,0.00000,0.00000,0,NULL),(45,11,7,0.00000,0.00000,0,NULL);
/*!40000 ALTER TABLE `b_contract_util_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_password_resets`
--

DROP TABLE IF EXISTS `b_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `b_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_password_resets`
--

LOCK TABLES `b_password_resets` WRITE;
/*!40000 ALTER TABLE `b_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_payment_details`
--

DROP TABLE IF EXISTS `b_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_payment_details` (
  `payment_details_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `billing_id` int(11) NOT NULL DEFAULT '0',
  `discount` decimal(15,5) DEFAULT '0.00000',
  `amount_paid` decimal(15,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`payment_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_payment_details`
--

LOCK TABLES `b_payment_details` WRITE;
/*!40000 ALTER TABLE `b_payment_details` DISABLE KEYS */;
INSERT INTO `b_payment_details` VALUES (1,1,9,0.00000,17550.00000),(2,1,11,0.00000,17250.00000),(3,2,9,0.00000,300.00000),(4,3,9,2500.00000,13550.00000),(5,3,11,2500.00000,15231.50000),(6,3,13,0.00000,0.00000),(7,4,13,0.00000,17250.00000);
/*!40000 ALTER TABLE `b_payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_payment_info`
--

DROP TABLE IF EXISTS `b_payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_payment_info` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_no` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `reference_no` varchar(145) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tenant_id` int(11) NOT NULL DEFAULT '0',
  `payment_type` int(11) NOT NULL DEFAULT '0',
  `amount_paid` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `payment_date` datetime DEFAULT NULL,
  `check_type_id` int(11) DEFAULT '0',
  `check_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `check_date` datetime DEFAULT NULL,
  `balance_paid` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `advance` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `discount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `remarks` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT '0',
  `canceled_datetime` datetime DEFAULT NULL,
  `canceled_by` int(11) DEFAULT '0',
  `is_canceled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_payment_info`
--

LOCK TABLES `b_payment_info` WRITE;
/*!40000 ALTER TABLE `b_payment_info` DISABLE KEYS */;
INSERT INTO `b_payment_info` VALUES (1,'2018-TN-000001','123123',2,0,35100.00000,'2018-12-22 00:00:00',NULL,NULL,'1970-01-01 00:00:00',35100.00000,0.00000,0.00000,NULL,'2018-12-16 12:49:55',1,NULL,0,1),(2,'2018-TN-000002','123123',2,0,300.00000,'2018-12-22 00:00:00',NULL,NULL,'1970-01-01 00:00:00',300.00000,0.00000,0.00000,NULL,'2018-12-16 12:51:23',1,'2018-12-16 14:00:36',1,1),(3,'2018-TN-000003','123123',2,0,28781.50000,'2018-12-23 00:00:00',NULL,NULL,'1970-01-01 00:00:00',28781.50000,0.00000,5000.00000,'ok','2018-12-17 08:04:37',1,NULL,0,0),(4,'2018-TN-000004',NULL,2,0,17250.00000,'2019-01-23 00:00:00',NULL,NULL,'1970-01-01 00:00:00',17250.00000,0.00000,0.00000,'ok','2018-12-17 09:11:41',1,NULL,0,0);
/*!40000 ALTER TABLE `b_payment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_refbillingperiod`
--

DROP TABLE IF EXISTS `b_refbillingperiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_refbillingperiod` (
  `period_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `period_start_date` datetime NOT NULL,
  `period_end_date` datetime NOT NULL,
  `month_id` int(11) NOT NULL,
  `app_year` int(11) NOT NULL,
  `period_due_date` datetime NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_refbillingperiod`
--

LOCK TABLES `b_refbillingperiod` WRITE;
/*!40000 ALTER TABLE `b_refbillingperiod` DISABLE KEYS */;
INSERT INTO `b_refbillingperiod` VALUES (1,'2018-11-08 00:00:00','2018-12-08 00:00:00',11,2018,'2018-12-05 00:00:00',0,'2018-11-08 09:34:29',1,'2018-11-09 14:16:43',1,'2018-12-05 03:59:22',1,0),(2,'2018-12-07 00:00:00','2019-01-07 00:00:00',12,2018,'2019-01-20 00:00:00',0,'2018-12-12 04:29:40',1,NULL,NULL,NULL,NULL,0),(3,'2019-01-07 00:00:00','2019-02-07 00:00:00',1,2019,'2019-02-19 00:00:00',0,'2018-12-17 01:42:46',1,NULL,NULL,NULL,NULL,0),(4,'2019-02-07 00:00:00','2019-03-06 00:00:00',2,2019,'2019-03-18 00:00:00',0,'2018-12-17 09:12:35',1,'2018-12-17 09:50:29',1,NULL,NULL,0);
/*!40000 ALTER TABLE `b_refbillingperiod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_refcategory`
--

DROP TABLE IF EXISTS `b_refcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_refcategory` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_refcategory`
--

LOCK TABLES `b_refcategory` WRITE;
/*!40000 ALTER TABLE `b_refcategory` DISABLE KEYS */;
INSERT INTO `b_refcategory` VALUES (1,'3333','Category 1','2018-11-16 06:10:08',NULL,NULL,NULL,NULL,NULL,0),(2,'102','Category','2018-11-16 06:14:22',NULL,NULL,NULL,NULL,NULL,0),(3,'asdf','asdf','2018-11-16 06:22:53',NULL,NULL,NULL,NULL,NULL,0),(4,'123','123','2018-11-16 06:26:58',NULL,NULL,NULL,NULL,NULL,0),(5,'4324','234234','2018-11-16 06:27:22',NULL,NULL,NULL,NULL,NULL,0),(6,'asdf','asdfff','2018-11-16 06:28:46',NULL,NULL,NULL,NULL,NULL,0),(7,'123','312','2018-11-16 06:29:48',NULL,NULL,NULL,NULL,NULL,0),(8,'101','123','2018-11-16 06:40:20',NULL,NULL,NULL,NULL,NULL,0),(9,'102','22','2018-11-16 06:43:47',NULL,NULL,NULL,NULL,NULL,0),(10,'askdjf','askdjfh','2018-11-16 06:47:31',NULL,NULL,NULL,NULL,NULL,0),(11,'123','123','2018-11-16 06:51:56',NULL,NULL,NULL,NULL,NULL,0),(12,'123','123','2018-11-16 06:54:11',NULL,NULL,NULL,NULL,NULL,0),(13,'Jason','Jason','2018-11-16 08:52:39',NULL,NULL,NULL,NULL,NULL,0),(14,'rick','rick','2018-11-16 08:53:35',NULL,NULL,NULL,NULL,NULL,0),(15,'ash','ash','2018-11-16 08:55:38',NULL,NULL,NULL,NULL,NULL,0),(16,'raf','raf','2018-11-16 08:56:01',NULL,NULL,NULL,NULL,NULL,0),(17,'sarah','sarah','2018-11-16 08:56:43',NULL,NULL,NULL,NULL,NULL,0),(18,'teng','teng','2018-11-16 08:57:07',NULL,NULL,NULL,NULL,NULL,0),(19,'jo','jo','2018-11-16 08:57:29',NULL,NULL,NULL,NULL,NULL,0),(20,'asdf','asdf',NULL,NULL,NULL,NULL,NULL,NULL,0),(21,'asdf','asdf',NULL,NULL,NULL,NULL,NULL,NULL,0),(22,'123123','123123123',NULL,NULL,NULL,NULL,NULL,NULL,0),(23,'f','f',NULL,NULL,NULL,NULL,NULL,NULL,0),(24,'1231','123',NULL,NULL,NULL,NULL,NULL,NULL,0),(25,'123123','123123',NULL,NULL,NULL,NULL,NULL,NULL,0),(26,'123','123',NULL,NULL,NULL,NULL,NULL,NULL,0),(27,'123','333',NULL,NULL,NULL,NULL,NULL,NULL,0),(28,'123','123',NULL,NULL,NULL,NULL,NULL,NULL,0),(29,'123123','123123',NULL,NULL,NULL,NULL,NULL,NULL,0),(30,'123123','123123',NULL,NULL,NULL,NULL,NULL,NULL,0),(31,'11','gg',NULL,NULL,NULL,NULL,NULL,NULL,0),(32,'222','ff',NULL,NULL,NULL,NULL,NULL,NULL,0),(33,'jj','jj',NULL,NULL,NULL,NULL,NULL,NULL,0),(34,'aa','aa',NULL,NULL,NULL,NULL,NULL,NULL,0),(35,'33','33',NULL,NULL,NULL,NULL,NULL,NULL,0),(36,'55','55',NULL,NULL,NULL,NULL,NULL,NULL,0),(37,'666','666',NULL,NULL,NULL,NULL,NULL,NULL,0),(38,'777','777',NULL,NULL,NULL,NULL,NULL,NULL,0),(39,'13123','123123',NULL,NULL,NULL,NULL,NULL,NULL,0),(40,'5454','5454',NULL,NULL,NULL,NULL,NULL,NULL,0),(41,'999','5454',NULL,NULL,NULL,NULL,NULL,NULL,0),(42,'2','66666',NULL,NULL,NULL,NULL,NULL,NULL,0),(43,'324234','234234',NULL,NULL,NULL,NULL,NULL,NULL,0),(44,'12356','123123',NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `b_refcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_refcharges`
--

DROP TABLE IF EXISTS `b_refcharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_refcharges` (
  `charge_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `charge_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `charge_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `account_id` int(11) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_refcharges`
--

LOCK TABLES `b_refcharges` WRITE;
/*!40000 ALTER TABLE `b_refcharges` DISABLE KEYS */;
INSERT INTO `b_refcharges` VALUES (1,'Penalty 3%','Penalty 3%',17,'2018-10-11 17:32:01',1,'2018-12-04 01:02:42',1,'2018-12-05 03:33:44',1,0),(2,'102','Water',NULL,'2018-10-12 10:00:28',1,NULL,NULL,'2018-10-12 11:23:53',1,0),(3,'103','Aircon',NULL,'2018-10-12 11:12:19',1,NULL,NULL,'2018-10-12 11:23:26',1,0),(4,'104','Refrigerator',NULL,'2018-10-12 11:12:33',1,'2018-10-12 11:13:28',1,'2018-10-12 11:23:18',1,0),(7,'105','Heater',3,'2018-10-12 11:33:14',1,'2018-12-04 01:47:01',1,'2018-12-05 03:33:39',1,1),(8,'106','1231231123123',NULL,'2018-10-16 17:46:16',1,'2018-11-12 17:43:12',1,'2018-11-12 17:43:15',1,1),(9,'asdf','asdf',1,'2018-12-03 09:47:22',1,'2018-12-03 09:50:10',1,'2018-12-05 03:33:32',1,1),(10,'123123','123123',1,'2018-12-03 09:48:03',1,'2018-12-04 01:02:28',1,'2018-12-05 03:29:45',1,1);
/*!40000 ALTER TABLE `b_refcharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_refchecktype`
--

DROP TABLE IF EXISTS `b_refchecktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_refchecktype` (
  `check_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `check_type_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `check_type_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`check_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_refchecktype`
--

LOCK TABLES `b_refchecktype` WRITE;
/*!40000 ALTER TABLE `b_refchecktype` DISABLE KEYS */;
INSERT INTO `b_refchecktype` VALUES (1,'101','Metrobank','2018-12-16 08:14:31',1,'2018-12-16 08:15:05',1,'2018-12-16 08:14:42',1,0);
/*!40000 ALTER TABLE `b_refchecktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_refcontracttype`
--

DROP TABLE IF EXISTS `b_refcontracttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_refcontracttype` (
  `contract_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_type_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contract_type_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contract_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_refcontracttype`
--

LOCK TABLES `b_refcontracttype` WRITE;
/*!40000 ALTER TABLE `b_refcontracttype` DISABLE KEYS */;
INSERT INTO `b_refcontracttype` VALUES (1,'101','Contract Type 1','2018-10-24 11:05:27',1,'2018-12-13 06:59:58',1,'2018-12-05 03:43:31',1,0),(2,'102','Contract Type 2','2018-12-13 06:58:42',1,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `b_refcontracttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_refdepartments`
--

DROP TABLE IF EXISTS `b_refdepartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_refdepartments` (
  `department_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `department_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_refdepartments`
--

LOCK TABLES `b_refdepartments` WRITE;
/*!40000 ALTER TABLE `b_refdepartments` DISABLE KEYS */;
INSERT INTO `b_refdepartments` VALUES (1,'10','Department 1','2018-10-12 11:45:58',1,'2018-12-05 05:58:46',1,'2018-12-05 06:57:48',1,0);
/*!40000 ALTER TABLE `b_refdepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_reflocations`
--

DROP TABLE IF EXISTS `b_reflocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_reflocations` (
  `location_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `location_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_reflocations`
--

LOCK TABLES `b_reflocations` WRITE;
/*!40000 ALTER TABLE `b_reflocations` DISABLE KEYS */;
INSERT INTO `b_reflocations` VALUES (1,'101','Location 1','2018-10-12 14:39:41',1,'2018-11-12 17:45:36',1,'2018-12-05 03:38:37',1,0);
/*!40000 ALTER TABLE `b_reflocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_refmonths`
--

DROP TABLE IF EXISTS `b_refmonths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_refmonths` (
  `month_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `month_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`month_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_refmonths`
--

LOCK TABLES `b_refmonths` WRITE;
/*!40000 ALTER TABLE `b_refmonths` DISABLE KEYS */;
INSERT INTO `b_refmonths` VALUES (1,'January'),(2,'February'),(3,'March'),(4,'April'),(5,'May'),(6,'June'),(7,'July'),(8,'August'),(9,'September'),(10,'October'),(11,'November'),(12,'December');
/*!40000 ALTER TABLE `b_refmonths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_refnatureofbusiness`
--

DROP TABLE IF EXISTS `b_refnatureofbusiness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_refnatureofbusiness` (
  `nature_of_business_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nature_of_business_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nature_of_business_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nature_of_business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_refnatureofbusiness`
--

LOCK TABLES `b_refnatureofbusiness` WRITE;
/*!40000 ALTER TABLE `b_refnatureofbusiness` DISABLE KEYS */;
INSERT INTO `b_refnatureofbusiness` VALUES (1,'101','Business 12','2018-10-24 11:11:18',1,'2018-10-24 11:11:22',1,'2018-12-05 03:47:54',1,0);
/*!40000 ALTER TABLE `b_refnatureofbusiness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_tenants`
--

DROP TABLE IF EXISTS `b_tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_tenants` (
  `tenant_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `trade_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `space_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `business_concept` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `head_office_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact_person` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `designation` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact_number` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tin_number` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_auto` tinyint(4) NOT NULL DEFAULT '0',
  `business_permit` tinyint(4) NOT NULL DEFAULT '0',
  `tenant_information_sheet` tinyint(4) NOT NULL DEFAULT '0',
  `valid_id` tinyint(4) NOT NULL DEFAULT '0',
  `tin_cor` tinyint(4) NOT NULL DEFAULT '0',
  `dti_sec` tinyint(4) NOT NULL DEFAULT '0',
  `notarized_contract` tinyint(4) NOT NULL DEFAULT '0',
  `proof_of_billing` tinyint(4) NOT NULL DEFAULT '0',
  `others` tinyint(4) NOT NULL DEFAULT '0',
  `others_specify` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tenant_id`),
  UNIQUE KEY `b_tenants_tenant_code_unique` (`tenant_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_tenants`
--

LOCK TABLES `b_tenants` WRITE;
/*!40000 ALTER TABLE `b_tenants` DISABLE KEYS */;
INSERT INTO `b_tenants` VALUES (1,'2018-TC-000001','JDEV IT Business Solutions','JDEV IT SOLUTIONS','205-206','IT','Balibago, Angeles City','Balibago, Angeles City','Sarah Pabustan','CEO','09090909090','aa','123123',1,1,1,1,1,1,1,0,0,NULL,'2018-12-13 07:41:09',1,'2018-11-13 08:47:57',1,'2018-11-13 08:48:01',1,0),(2,'2018-TC-000002','Greenwich','Greenwich','209-210','IT','Balibago, Angeles City','Balibago, Angeles City','Sarah Pabustan','CEO','09090909090','aa','123123',1,1,1,1,1,1,1,0,0,NULL,'2018-12-13 07:41:45',1,'2018-11-13 08:47:57',1,'2018-11-13 08:48:01',1,0),(3,'2018-TC-000003','AB&CDe','AB&C','207-208','AB&C','AB&C','AB&C','AB&C','AB&C','AB&C','AB&C','AB&C',1,1,0,1,0,1,1,1,1,'AB&C','2018-12-13 07:41:20',1,NULL,NULL,'2018-12-05 02:48:38',1,0),(4,'2018-TC-000004','123123','123','123123','123','123','123','123','123','123','12312312312','123',0,1,1,1,1,1,1,1,1,'adf','2018-12-13 07:40:40',1,NULL,NULL,'2018-12-13 07:41:12',1,1);
/*!40000 ALTER TABLE `b_tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_users`
--

DROP TABLE IF EXISTS `b_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `middlename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `b_users_username_unique` (`username`),
  UNIQUE KEY `b_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_users`
--

LOCK TABLES `b_users` WRITE;
/*!40000 ALTER TABLE `b_users` DISABLE KEYS */;
INSERT INTO `b_users` VALUES (1,'jason','Pogi','Jose','Patawaran','patawaranjason17@gmail.com',NULL,'$2y$10$ZwoY0lj84.npcAcVN7SMauYOPQX9Vx2qTdxAIjYCSmWC2sRXa5O9S','Kq1Jsknl2cINUjN5ndgfrkEzbZUM8juZqw0rkMnGpuNK9lfvQSoe7ssN0tYr',NULL,NULL,'2018-12-04 09:42:11',1,'2018-12-05 02:23:06',1,0),(2,'erick','Erick',NULL,'Peco','asdfasd@asdf.com',NULL,'$2y$10$N3wVLiKREnjkY1XnbO0DyuPZduk1eXBX5lz7zcmkI4ZzalrxizFlC',NULL,'2018-12-04 09:28:32',1,'2018-12-04 09:29:34',1,'2018-12-05 02:21:59',1,1);
/*!40000 ALTER TABLE `b_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_code` varchar(20) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `account_type` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'0001','chinabank','6655662',1,1,0);
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_reconciliation`
--

DROP TABLE IF EXISTS `bank_reconciliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_reconciliation` (
  `bank_recon_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT '0',
  `date_reconciled` date DEFAULT '0000-00-00',
  `reconciled_by` int(11) DEFAULT '0',
  `account_id` int(11) DEFAULT '0',
  `account_balance` decimal(10,0) DEFAULT '0',
  `bank_service_charge` decimal(10,0) DEFAULT '0',
  `nsf_check` decimal(10,0) DEFAULT '0',
  `check_printing_charge` decimal(10,0) DEFAULT '0',
  `interest_earned` decimal(10,0) DEFAULT '0',
  `notes_receivable` decimal(10,0) DEFAULT '0',
  `actual_balance` decimal(10,0) DEFAULT '0',
  `outstanding_checks` decimal(10,0) DEFAULT '0',
  `deposit_in_transit` decimal(10,0) DEFAULT '0',
  `journal_adjusted_collection` decimal(10,0) DEFAULT '0',
  `bank_adjusted_collection` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`bank_recon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_reconciliation`
--

LOCK TABLES `bank_reconciliation` WRITE;
/*!40000 ALTER TABLE `bank_reconciliation` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_reconciliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_reconciliation_details`
--

DROP TABLE IF EXISTS `bank_reconciliation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_reconciliation_details` (
  `bank_recon_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_recon_id` int(11) DEFAULT '0',
  `journal_id` int(11) DEFAULT '0',
  `check_status` int(11) DEFAULT '0' COMMENT '0 = no selected\n1 = outstanding\n2 = good check',
  PRIMARY KEY (`bank_recon_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_reconciliation_details`
--

LOCK TABLES `bank_reconciliation_details` WRITE;
/*!40000 ALTER TABLE `bank_reconciliation_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_reconciliation_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_info`
--

DROP TABLE IF EXISTS `batch_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_info` (
  `batch_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(75) DEFAULT '',
  `date_replenished` datetime DEFAULT '0000-00-00 00:00:00',
  `replenished_by` int(11) DEFAULT '0',
  PRIMARY KEY (`batch_id`) USING BTREE,
  UNIQUE KEY `batch_id` (`batch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_info`
--

LOCK TABLES `batch_info` WRITE;
/*!40000 ALTER TABLE `batch_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'12','\0','');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `card_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_code` varchar(100) NOT NULL,
  `card_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (7,'000007-2017','VISA','\0',''),(8,'000008-2017','Master Card','\0',''),(9,'000009-2017','Diners Card','\0',''),(10,'000010-2017','Discover Card','\0',''),(11,'000011-2017','American Express','\0',''),(12,'000012-2017','Trial','\0',''),(24,'0','VISA','\0',''),(25,'0','Diners Card','\0',''),(26,'0','Discover Card','\0',''),(27,'0','American Express','\0',''),(28,'0','Trial','\0',''),(29,'0','VISA','\0',''),(30,'0','Diners Card','\0','');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carf_trans`
--

DROP TABLE IF EXISTS `carf_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carf_trans` (
  `carf_trans_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carf_trans_name` varchar(245) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`carf_trans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carf_trans`
--

LOCK TABLES `carf_trans` WRITE;
/*!40000 ALTER TABLE `carf_trans` DISABLE KEYS */;
INSERT INTO `carf_trans` VALUES (1,'Vale','','\0'),(2,'Subject for Liquidation (SFL)','','\0'),(3,'Borrowings','','\0');
/*!40000 ALTER TABLE `carf_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_invoice`
--

DROP TABLE IF EXISTS `cash_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_invoice` (
  `cash_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cash_inv_no` varchar(75) DEFAULT '',
  `sales_order_id` bigint(20) DEFAULT '0',
  `sales_order_no` varchar(75) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  `email_address` varchar(75) DEFAULT NULL,
  `contact_no` varchar(75) DEFAULT NULL,
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0',
  `for_dispatching` bit(1) DEFAULT b'0',
  PRIMARY KEY (`cash_invoice_id`) USING BTREE,
  UNIQUE KEY `cash_inv_no` (`cash_inv_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_invoice`
--

LOCK TABLES `cash_invoice` WRITE;
/*!40000 ALTER TABLE `cash_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_invoice_items`
--

DROP TABLE IF EXISTS `cash_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_invoice_items` (
  `cash_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cash_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,2) DEFAULT '0.00',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`cash_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_invoice_items`
--

LOCK TABLES `cash_invoice_items` WRITE;
/*!40000 ALTER TABLE `cash_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_code` bigint(20) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_desc` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,'12','12',NULL,'0000-00-00 00:00:00','\0','');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `chat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chat_code` varchar(150) DEFAULT '0',
  `message` varchar(160) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_layout`
--

DROP TABLE IF EXISTS `check_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_layout` (
  `check_layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `check_layout` varchar(755) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `particular_pos_left` decimal(20,0) DEFAULT '0',
  `particular_pos_top` decimal(20,0) DEFAULT '0',
  `particular_font_family` varchar(555) DEFAULT 'Tahoma',
  `particular_font_size` varchar(20) DEFAULT '12pt',
  `particular_is_italic` varchar(55) DEFAULT 'normal',
  `particular_is_bold` varchar(55) DEFAULT 'bold',
  `words_pos_left` decimal(20,4) DEFAULT '0.0000',
  `words_pos_top` decimal(20,4) DEFAULT '0.0000',
  `words_font_family` varchar(555) DEFAULT 'Tahoma',
  `words_font_size` varchar(20) DEFAULT '12pt',
  `words_is_italic` varchar(55) DEFAULT 'normal',
  `words_is_bold` varchar(55) DEFAULT 'bold',
  `amount_pos_left` decimal(20,4) DEFAULT '0.0000',
  `amount_pos_top` decimal(20,4) DEFAULT '0.0000',
  `amount_font_family` varchar(555) DEFAULT '',
  `amount_font_size` varchar(20) DEFAULT '12pt',
  `amount_is_italic` varchar(55) DEFAULT 'normal',
  `amount_is_bold` varchar(20) DEFAULT 'bold',
  `date_pos_left` decimal(20,4) DEFAULT '0.0000',
  `date_pos_top` decimal(20,4) DEFAULT '0.0000',
  `date_font_family` varchar(555) DEFAULT '',
  `date_font_size` varchar(20) DEFAULT '12pt',
  `date_is_italic` varchar(55) DEFAULT 'normal',
  `date_is_bold` varchar(55) DEFAULT 'bold',
  `is_portrait` bit(1) DEFAULT b'1',
  `posted_by_user` bigint(20) DEFAULT '0',
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` bigint(20) DEFAULT '0',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` bigint(20) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`check_layout_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_layout`
--

LOCK TABLES `check_layout` WRITE;
/*!40000 ALTER TABLE `check_layout` DISABLE KEYS */;
INSERT INTO `check_layout` VALUES (1,'Security Bank','',49,840,'Tahoma','16px','normal','bold',49.7500,875.7190,'Tahoma','16px','normal','bold',527.6250,826.6250,'Segoe UI, Source Sans Pro, Calibri, Candara, Arial, sans-serif','16px','normal','bold',528.7110,797.6520,'Segoe UI, Source Sans Pro, Calibri, Candara, Arial, sans-serif','16px','normal','bold','',1,'2017-09-13 11:47:30',0,'2018-10-09 13:57:39',0,'0000-00-00 00:00:00','','\0'),(2,'China Bank for Deskjet ','China Bank',110,931,'Tahoma','16px','normal','bold',109.0000,966.0000,'Tahoma','16px','normal','bold',567.0000,911.0000,'Segoe UI, Source Sans Pro, Calibri, Candara, Arial, sans-serif','16px','normal','bold',568.0000,878.0000,'Segoe UI, Source Sans Pro, Calibri, Candara, Arial, sans-serif','16px','normal','bold','',1,'2018-10-09 13:55:53',0,'2018-10-09 13:56:32',0,'0000-00-00 00:00:00','','\0');
/*!40000 ALTER TABLE `check_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_info`
--

DROP TABLE IF EXISTS `company_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_info` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(555) DEFAULT '',
  `company_address` varchar(755) DEFAULT '',
  `email_address` varchar(155) DEFAULT '',
  `mobile_no` varchar(125) DEFAULT '',
  `landline` varchar(125) DEFAULT '',
  `tin_no` varchar(55) DEFAULT NULL,
  `tax_type_id` int(11) DEFAULT '0',
  `registered_to` varchar(555) DEFAULT '',
  `logo_path` varchar(555) DEFAULT '',
  `rdo_no` varchar(55) DEFAULT NULL,
  `nature_of_business` varchar(155) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `registered_address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `telephone_no` varchar(255) DEFAULT NULL,
  `industry_classification` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_info`
--

LOCK TABLES `company_info` WRITE;
/*!40000 ALTER TABLE `company_info` DISABLE KEYS */;
INSERT INTO `company_info` VALUES (1,'SMCT REALTY AND HOLDING COMPANY, INC.','Romulo Blvd, Tarlac City, Tarlac','sample@gmail.com','','','',1,'','assets/img/company/5bd7ae9cdb951.PNG','','',3,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `company_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_photos`
--

DROP TABLE IF EXISTS `customer_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT '0',
  `photo_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_photos`
--

LOCK TABLES `customer_photos` WRITE;
/*!40000 ALTER TABLE `customer_photos` DISABLE KEYS */;
INSERT INTO `customer_photos` VALUES (1,1,'assets/img/anonymous-icon.png'),(2,2,'assets/img/anonymous-icon.png'),(3,3,'assets/img/anonymous-icon.png'),(4,4,'assets/img/anonymous-icon.png'),(5,5,'assets/img/anonymous-icon.png'),(6,6,'assets/img/anonymous-icon.png');
/*!40000 ALTER TABLE `customer_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_type`
--

DROP TABLE IF EXISTS `customer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_type` (
  `customer_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_type_name` varchar(145) DEFAULT NULL,
  `customer_type_description` varchar(145) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`customer_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_type`
--

LOCK TABLES `customer_type` WRITE;
/*!40000 ALTER TABLE `customer_type` DISABLE KEYS */;
INSERT INTO `customer_type` VALUES (1,'Wholesaler','Wholesaler','','\0'),(2,'Dealer','Dealer','','\0'),(3,'Distributor','Distributor','','\0'),(4,'Reseller','Reseller','','\0');
/*!40000 ALTER TABLE `customer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pos_customer_id` bigint(20) DEFAULT '0',
  `hotel_customer_id` bigint(20) DEFAULT '0',
  `customer_code` varchar(255) DEFAULT '',
  `customer_name` varchar(255) DEFAULT '',
  `contact_name` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `email_address` varchar(255) DEFAULT '',
  `contact_no` varchar(100) DEFAULT '',
  `term` varchar(100) DEFAULT '',
  `customer_type_id` bigint(20) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0',
  `link_department_id` int(11) DEFAULT '0',
  `refcustomertype_id` bigint(20) DEFAULT '0',
  `tin_no` varchar(100) DEFAULT '',
  `photo_path` varchar(500) DEFAULT '',
  `total_receivable_amount` decimal(19,2) DEFAULT '0.00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `credit_limit` decimal(20,4) DEFAULT '0.0000',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `office_fax_number` varchar(145) DEFAULT '',
  `business_organization` varchar(145) DEFAULT '',
  `ar_trans_id` bigint(20) DEFAULT '0',
  `payment_term_desc` varchar(145) DEFAULT '',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,0,0,'','Various Customer','None','None','None','None',NULL,0,NULL,0,NULL,'None','assets/img/anonymous-icon.png',0.00,'2018-10-29 08:19:34','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL,0,0,'\0','\0','','None','None',4,'None'),(2,0,0,'','SUTHERLAND','A','A','A','A',NULL,1,NULL,0,NULL,'A','assets/img/anonymous-icon.png',-5000.00,'2018-10-30 07:28:50','0000-00-00 00:00:00','0000-00-00 00:00:00',3,NULL,0,0,'\0','\0','','A','A',1,'30 DAYS'),(3,0,0,'','various customer','a','a','a','a',NULL,0,NULL,0,NULL,'a','assets/img/anonymous-icon.png',0.00,'2018-10-30 07:29:49','0000-00-00 00:00:00','2018-10-30 07:30:09',3,NULL,0,3,'\0','','','a','a',4,'a'),(4,0,0,'','vicky','a','a','a','a',NULL,0,NULL,0,NULL,'a','assets/img/anonymous-icon.png',0.00,'2018-10-30 07:40:01','0000-00-00 00:00:00','0000-00-00 00:00:00',3,NULL,0,0,'\0','\0','','a','a',2,'30 days'),(5,0,0,'','MAJA','A','A','A','A',NULL,0,NULL,0,NULL,'A','assets/img/anonymous-icon.png',0.00,'2018-10-30 08:06:30','0000-00-00 00:00:00','0000-00-00 00:00:00',3,NULL,0,0,'\0','\0','','A','A',2,'30 DAYS'),(6,0,0,'','GIL-SAN','A','A','A','A',NULL,0,NULL,0,NULL,'A','assets/img/anonymous-icon.png',0.00,'2018-10-30 08:11:24','0000-00-00 00:00:00','0000-00-00 00:00:00',3,NULL,0,0,'\0','\0','','A','A',2,'30 DAYS');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_invoice`
--

DROP TABLE IF EXISTS `delivery_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_invoice` (
  `dr_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dr_invoice_no` varchar(75) DEFAULT '',
  `purchase_order_id` int(11) DEFAULT '0',
  `external_ref_no` varchar(75) DEFAULT '',
  `contact_person` varchar(155) DEFAULT '',
  `terms` varchar(55) DEFAULT '',
  `duration` varchar(75) DEFAULT '',
  `supplier_id` int(11) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0',
  `tax_type_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `remarks` varchar(555) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) NOT NULL,
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `date_due` date DEFAULT '0000-00-00',
  `date_delivered` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `batch_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dr_invoice_id`) USING BTREE,
  UNIQUE KEY `dr_invoice_no` (`dr_invoice_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_invoice`
--

LOCK TABLES `delivery_invoice` WRITE;
/*!40000 ALTER TABLE `delivery_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_invoice_items`
--

DROP TABLE IF EXISTS `delivery_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_invoice_items` (
  `dr_invoice_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `dr_qty` decimal(20,2) DEFAULT '0.00',
  `dr_discount` decimal(20,4) DEFAULT '0.0000',
  `dr_price` decimal(20,4) DEFAULT '0.0000',
  `dr_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `dr_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `dr_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `dr_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `dr_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `dr_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`dr_invoice_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_invoice_items`
--

LOCK TABLES `delivery_invoice_items` WRITE;
/*!40000 ALTER TABLE `delivery_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `department_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_code` varchar(20) DEFAULT '',
  `department_name` varchar(255) DEFAULT '',
  `department_desc` varchar(255) DEFAULT '',
  `delivery_address` varchar(755) DEFAULT '',
  `default_cost` tinyint(4) DEFAULT '1' COMMENT '1=Purchase Cost 1, 2=Purchase Cost 2',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'','Admin','','',1,'2018-10-29 08:18:03','0000-00-00 00:00:00','\0','');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depreciation_expense`
--

DROP TABLE IF EXISTS `depreciation_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depreciation_expense` (
  `de_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `de_date` date NOT NULL,
  `de_expense_total` decimal(20,4) NOT NULL,
  `de_remarks` text NOT NULL,
  `de_ref_no` varchar(75) NOT NULL,
  `date_posted` date NOT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `is_journal_posted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depreciation_expense`
--

LOCK TABLES `depreciation_expense` WRITE;
/*!40000 ALTER TABLE `depreciation_expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `depreciation_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `discount_id` bigint(100) NOT NULL AUTO_INCREMENT,
  `discount_code` bigint(100) DEFAULT NULL,
  `discount_type` varchar(200) DEFAULT NULL,
  `discount_desc` varchar(200) DEFAULT NULL,
  `discount_percent` bigint(100) DEFAULT NULL,
  `discount_amount` bigint(100) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`discount_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatching_invoice`
--

DROP TABLE IF EXISTS `dispatching_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatching_invoice` (
  `dispatching_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dispatching_inv_no` varchar(75) DEFAULT '',
  `sales_invoice_id` bigint(20) DEFAULT '0',
  `sales_inv_no` varchar(245) DEFAULT '',
  `cash_invoice_id` bigint(20) DEFAULT '0',
  `cash_inv_no` varchar(245) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`dispatching_invoice_id`) USING BTREE,
  UNIQUE KEY `dispatching_inv_no` (`dispatching_inv_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatching_invoice`
--

LOCK TABLES `dispatching_invoice` WRITE;
/*!40000 ALTER TABLE `dispatching_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispatching_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatching_invoice_items`
--

DROP TABLE IF EXISTS `dispatching_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatching_invoice_items` (
  `dispatching_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dispatching_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,2) DEFAULT '0.00',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`dispatching_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatching_invoice_items`
--

LOCK TABLES `dispatching_invoice_items` WRITE;
/*!40000 ALTER TABLE `dispatching_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispatching_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_settings`
--

DROP TABLE IF EXISTS `email_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_settings` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `email_from` varchar(150) NOT NULL,
  `name_from` varchar(50) NOT NULL,
  `default_message` varchar(500) NOT NULL,
  `email_to` varchar(175) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_settings`
--

LOCK TABLES `email_settings` WRITE;
/*!40000 ALTER TABLE `email_settings` DISABLE KEYS */;
INSERT INTO `email_settings` VALUES (1,'example@gmail.com','example','','BIG-A DEPARTMENT STORE INC.','This is the Default message from the Accounting System of Big-A Department Store Inc.',NULL),(2,'example@gmail.com','example','','BIG-A DEPARTMENT STORE INC.','This is a system generation report sent to you from the Accounting System of Big-A Department Store Inc.','example@gmail.com');
/*!40000 ALTER TABLE `email_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_assets`
--

DROP TABLE IF EXISTS `fixed_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixed_assets` (
  `fixed_asset_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_code` varchar(55) DEFAULT '',
  `asset_description` varchar(555) DEFAULT '',
  `serial_no` varchar(155) DEFAULT '',
  `location_id` int(11) DEFAULT '0',
  `department_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `acquisition_cost` decimal(20,4) DEFAULT '0.0000',
  `salvage_value` decimal(20,4) DEFAULT '0.0000',
  `life_years` int(11) DEFAULT '0',
  `asset_status_id` int(11) DEFAULT '0',
  `date_acquired` date DEFAULT '0000-00-00',
  `remarks` varchar(1000) DEFAULT NULL,
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`fixed_asset_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_assets`
--

LOCK TABLES `fixed_assets` WRITE;
/*!40000 ALTER TABLE `fixed_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `fixed_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_2307`
--

DROP TABLE IF EXISTS `form_2307`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_2307` (
  `form_2307_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) DEFAULT '0',
  `supplier_id` bigint(20) DEFAULT '0',
  `txn_no` varchar(255) DEFAULT NULL,
  `date` date DEFAULT '0000-00-00',
  `payee_tin` varchar(145) DEFAULT NULL,
  `payee_name` varchar(245) DEFAULT NULL,
  `payee_address` varchar(445) DEFAULT NULL,
  `payor_name` varchar(245) DEFAULT NULL,
  `payor_tin` varchar(145) DEFAULT NULL,
  `payor_address` varchar(445) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `gross_amount` decimal(20,2) DEFAULT '0.00',
  `deducted_amount` decimal(20,2) DEFAULT '0.00',
  `date_created` date DEFAULT '0000-00-00',
  `created_by_user` bigint(20) DEFAULT '0',
  `date_deleted` date DEFAULT '0000-00-00',
  `deleted_by_user` bigint(20) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `atc` varchar(255) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`form_2307_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_2307`
--

LOCK TABLES `form_2307` WRITE;
/*!40000 ALTER TABLE `form_2307` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_2307` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_2551m`
--

DROP TABLE IF EXISTS `form_2551m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_2551m` (
  `form_2551m_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT '0000-00-00',
  `payor_tin` varchar(255) DEFAULT NULL,
  `payor_name` varchar(255) DEFAULT NULL,
  `payor_address` varchar(255) DEFAULT NULL,
  `rdo_no` varchar(255) DEFAULT NULL,
  `nature_of_business` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `telephone_no` varchar(255) DEFAULT NULL,
  `month_id` int(11) DEFAULT '0',
  `year` bigint(20) DEFAULT '0',
  `taxable_amount` decimal(20,5) DEFAULT '0.00000',
  `tax_rate` decimal(20,5) DEFAULT '0.00000',
  `tax_due` decimal(20,5) DEFAULT '0.00000',
  `industry_classification` varchar(255) DEFAULT NULL,
  `atc` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT '0000-00-00',
  `date_modified` date DEFAULT '0000-00-00',
  `date_deleted` date DEFAULT '0000-00-00',
  `created_by_user` int(12) DEFAULT '0',
  `modified_by_user` int(12) DEFAULT '0',
  `deleted_by_user` int(12) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`form_2551m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_2551m`
--

LOCK TABLES `form_2551m` WRITE;
/*!40000 ALTER TABLE `form_2551m` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_2551m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generics`
--

DROP TABLE IF EXISTS `generics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generics` (
  `generic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `generic_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`generic_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generics`
--

LOCK TABLES `generics` WRITE;
/*!40000 ALTER TABLE `generics` DISABLE KEYS */;
/*!40000 ALTER TABLE `generics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giftcards`
--

DROP TABLE IF EXISTS `giftcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giftcards` (
  `giftcard_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `giftcard_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`giftcard_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giftcards`
--

LOCK TABLES `giftcards` WRITE;
/*!40000 ALTER TABLE `giftcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `giftcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_items`
--

DROP TABLE IF EXISTS `hotel_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_items` (
  `hotel_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(45) DEFAULT NULL,
  `department_id` bigint(45) DEFAULT '0',
  `sales_date` datetime DEFAULT '0000-00-00 00:00:00',
  `shift` varchar(45) DEFAULT '0',
  `adv_cash` decimal(20,5) DEFAULT '0.00000',
  `adv_check` decimal(20,5) DEFAULT '0.00000',
  `adv_card` decimal(20,5) DEFAULT '0.00000',
  `adv_charge` decimal(20,5) DEFAULT '0.00000',
  `adv_bank` decimal(20,5) DEFAULT '0.00000',
  `cash_amount` decimal(20,5) DEFAULT '0.00000',
  `check_amount` decimal(20,5) DEFAULT '0.00000',
  `card_amount` decimal(20,5) DEFAULT '0.00000',
  `charge_amount` decimal(20,5) DEFAULT '0.00000',
  `bank_amount` decimal(20,5) DEFAULT '0.00000',
  `room_sales` decimal(20,5) DEFAULT '0.00000',
  `bar_sales` decimal(20,5) DEFAULT '0.00000',
  `other_sales` decimal(20,5) DEFAULT '0.00000',
  `advance_sales` decimal(20,5) DEFAULT '0.00000',
  `is_posted` tinyint(1) DEFAULT '0',
  `posted_by` bigint(20) DEFAULT '0',
  `posted_date` datetime DEFAULT '0000-00-00 00:00:00',
  `journal_id` bigint(20) DEFAULT '0',
  `file_path` varchar(245) DEFAULT '',
  PRIMARY KEY (`hotel_items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_items`
--

LOCK TABLES `hotel_items` WRITE;
/*!40000 ALTER TABLE `hotel_items` DISABLE KEYS */;
INSERT INTO `hotel_items` VALUES (1,'ADV',2,'2018-03-20 00:00:00','06 AM - 02 PM',8700.00000,2250.00000,1000.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,11950.00000,0,0,'0000-00-00 00:00:00',0,'POLV-03202018.jdev'),(2,'ADV',2,'2018-04-17 00:00:00','06 AM - 02 PM',10700.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,10700.00000,1,1,'2018-04-17 11:11:27',1,'POLV-04172018.jdev'),(3,'COUT',2,'2018-04-17 00:00:00','06 AM - 02 PM',0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1700.00000,0.00000,0.00000,1700.00000,1,1,'2018-04-17 11:11:39',3,'POLV-04172018.jdev'),(4,'REV',2,'2018-04-17 00:00:00','06 AM - 02 PM',1700.00000,0.00000,0.00000,0.00000,0.00000,1700.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,1,'2018-04-17 11:11:32',2,'POLV-04172018.jdev');
/*!40000 ALTER TABLE `hotel_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_settings`
--

DROP TABLE IF EXISTS `hotel_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_settings` (
  `hotel_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_cash_id` bigint(20) DEFAULT '0',
  `adv_check_id` bigint(20) DEFAULT '0',
  `adv_card_id` bigint(20) DEFAULT '0',
  `adv_charge_id` bigint(20) DEFAULT '0',
  `adv_bank_id` bigint(20) DEFAULT '0',
  `cash_id` bigint(20) DEFAULT '0',
  `check_id` bigint(20) DEFAULT '0',
  `card_id` bigint(20) DEFAULT '0',
  `charge_id` bigint(20) DEFAULT '0',
  `bank_id` bigint(20) DEFAULT '0',
  `room_sales_id` bigint(20) DEFAULT '0',
  `bar_sales_id` bigint(20) DEFAULT '0',
  `other_sales_id` bigint(20) DEFAULT '0',
  `adv_sales_id` bigint(20) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`hotel_settings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_settings`
--

LOCK TABLES `hotel_settings` WRITE;
/*!40000 ALTER TABLE `hotel_settings` DISABLE KEYS */;
INSERT INTO `hotel_settings` VALUES (2,51,51,52,50,25,4,33,50,49,52,17,19,37,38,17),(3,1,1,1,1,1,1,2,1,5,2,1,1,1,1,5),(4,NULL,NULL,NULL,NULL,NULL,1,2,1,5,2,1,1,1,NULL,3),(5,NULL,NULL,NULL,NULL,NULL,1,2,1,5,2,1,1,1,NULL,2);
/*!40000 ALTER TABLE `hotel_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `initial_setup`
--

DROP TABLE IF EXISTS `initial_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `initial_setup` (
  `initial_setup_id` int(11) NOT NULL,
  `setup_company_info` bit(1) DEFAULT NULL,
  `setup_general_configuration` bit(1) DEFAULT NULL,
  `setup_user_account` bit(1) DEFAULT NULL,
  `setup_complete` bit(1) DEFAULT NULL,
  PRIMARY KEY (`initial_setup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initial_setup`
--

LOCK TABLES `initial_setup` WRITE;
/*!40000 ALTER TABLE `initial_setup` DISABLE KEYS */;
INSERT INTO `initial_setup` VALUES (1,'','','','');
/*!40000 ALTER TABLE `initial_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_counter`
--

DROP TABLE IF EXISTS `invoice_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_counter` (
  `counter_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `counter_start` bigint(20) DEFAULT '0',
  `counter_end` bigint(20) DEFAULT '0',
  `last_invoice` bigint(20) DEFAULT '0',
  PRIMARY KEY (`counter_id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_counter`
--

LOCK TABLES `invoice_counter` WRITE;
/*!40000 ALTER TABLE `invoice_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_department_info`
--

DROP TABLE IF EXISTS `issuance_department_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_department_info` (
  `issuance_department_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trn_no` varchar(75) DEFAULT '',
  `to_department_id` bigint(20) DEFAULT '0',
  `from_department_id` bigint(20) DEFAULT '0',
  `date_issued` date DEFAULT '0000-00-00',
  `terms` varchar(50) DEFAULT NULL,
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_tax_amount` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted_from` bit(1) DEFAULT b'0',
  `posted_by_from` int(11) DEFAULT '0',
  `date_posted_from` datetime DEFAULT '0000-00-00 00:00:00',
  `journal_id_from` bigint(20) DEFAULT '0',
  `is_journal_posted_to` bit(1) DEFAULT b'0',
  `posted_by_to` int(11) DEFAULT '0',
  `date_posted_to` datetime DEFAULT '0000-00-00 00:00:00',
  `journal_id_to` bigint(20) DEFAULT '0',
  PRIMARY KEY (`issuance_department_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_department_info`
--

LOCK TABLES `issuance_department_info` WRITE;
/*!40000 ALTER TABLE `issuance_department_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuance_department_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_department_items`
--

DROP TABLE IF EXISTS `issuance_department_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_department_items` (
  `issuance_department_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issuance_department_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `issue_qty` decimal(20,2) DEFAULT '0.00',
  `issue_price` decimal(20,2) DEFAULT '0.00',
  `issue_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_rate` decimal(11,2) DEFAULT '0.00',
  `issue_line_total_price` decimal(20,2) DEFAULT '0.00',
  `issue_line_total_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_amount` decimal(20,2) DEFAULT '0.00',
  `issue_non_tax_amount` decimal(20,2) DEFAULT '0.00',
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`issuance_department_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_department_items`
--

LOCK TABLES `issuance_department_items` WRITE;
/*!40000 ALTER TABLE `issuance_department_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuance_department_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_info`
--

DROP TABLE IF EXISTS `issuance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_info` (
  `issuance_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slip_no` varchar(75) DEFAULT '',
  `issued_department_id` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `issued_to_person` varchar(155) DEFAULT '',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_tax_amount` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `date_issued` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `customer_id` int(11) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `terms` varchar(50) DEFAULT NULL,
  `is_for_pos` bit(1) DEFAULT b'0',
  `is_received` bit(1) DEFAULT b'0',
  `is_journal_posted` tinyint(1) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`issuance_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_info`
--

LOCK TABLES `issuance_info` WRITE;
/*!40000 ALTER TABLE `issuance_info` DISABLE KEYS */;
INSERT INTO `issuance_info` VALUES (1,'SLP-20180529-1',4,'','',0.00,3571.42,428.58,4000.00,'2018-05-29','2018-05-29 16:37:54','2018-05-29 08:38:40','0000-00-00 00:00:00',1,1,0,'','\0',NULL,NULL,'12','\0','\0',0,0);
/*!40000 ALTER TABLE `issuance_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_items`
--

DROP TABLE IF EXISTS `issuance_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_items` (
  `issuance_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issuance_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `issue_qty` decimal(20,2) DEFAULT '0.00',
  `issue_price` decimal(20,2) DEFAULT '0.00',
  `issue_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_rate` decimal(11,2) DEFAULT '0.00',
  `issue_line_total_price` decimal(20,2) DEFAULT '0.00',
  `issue_line_total_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_amount` decimal(20,2) DEFAULT '0.00',
  `issue_non_tax_amount` decimal(20,2) DEFAULT '0.00',
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`issuance_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_items`
--

LOCK TABLES `issuance_items` WRITE;
/*!40000 ALTER TABLE `issuance_items` DISABLE KEYS */;
INSERT INTO `issuance_items` VALUES (5,1,12,1,5,1.00,2000.00,0.00,12.00,2000.00,0.00,214.29,1785.71,0,'0000-00-00',''),(6,1,12,1,5,1.00,2000.00,0.00,12.00,2000.00,0.00,214.29,1785.71,0,'0000-00-00','');
/*!40000 ALTER TABLE `issuance_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_types`
--

DROP TABLE IF EXISTS `item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_types` (
  `item_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type_code` varchar(20) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`item_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_types`
--

LOCK TABLES `item_types` WRITE;
/*!40000 ALTER TABLE `item_types` DISABLE KEYS */;
INSERT INTO `item_types` VALUES (1,'IP','Inventory','','','\0'),(2,'NP','Non-inventory','','','\0'),(3,'CP','Services','','','\0');
/*!40000 ALTER TABLE `item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_unit`
--

DROP TABLE IF EXISTS `item_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_unit` (
  `item_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_unit_name` varchar(255) DEFAULT NULL,
  `item_unit_desc` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`item_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_unit`
--

LOCK TABLES `item_unit` WRITE;
/*!40000 ALTER TABLE `item_unit` DISABLE KEYS */;
INSERT INTO `item_unit` VALUES (1,'N/A','N/A','\0','');
/*!40000 ALTER TABLE `item_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(255) DEFAULT NULL,
  `item_desc` varchar(255) DEFAULT NULL,
  `item_unit_id` bigint(20) DEFAULT '0',
  `income_account_id` bigint(20) DEFAULT '0',
  `item_amount` decimal(25,2) DEFAULT '0.00',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `created_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'001','metotape',1,94,100.00,'','\0',0,0,0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_billing`
--

DROP TABLE IF EXISTS `jo_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_billing` (
  `jo_billing_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jo_billing_no` varchar(75) DEFAULT NULL,
  `job_order_id` bigint(20) DEFAULT '0',
  `department_id` int(11) DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  `salesperson_id` int(11) DEFAULT '0',
  `requested_by` varchar(145) DEFAULT '',
  `address` varchar(150) DEFAULT NULL,
  `total_amount` decimal(25,2) DEFAULT '0.00',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_amount_after_discount` decimal(20,4) DEFAULT '0.0000',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_start` date DEFAULT '0000-00-00',
  `date_due` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `remarks` text,
  `is_journal_posted` bit(1) DEFAULT b'0',
  `journal_id` bigint(20) DEFAULT '0',
  `contact_person` varchar(175) DEFAULT NULL,
  PRIMARY KEY (`jo_billing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_billing`
--

LOCK TABLES `jo_billing` WRITE;
/*!40000 ALTER TABLE `jo_billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `jo_billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_billing_items`
--

DROP TABLE IF EXISTS `jo_billing_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_billing_items` (
  `jo_billing_item_id` bigint(25) NOT NULL AUTO_INCREMENT,
  `jo_billing_id` bigint(25) DEFAULT '0',
  `job_id` int(11) DEFAULT '0',
  `job_unit` int(11) DEFAULT '0',
  `job_price` decimal(25,2) DEFAULT '0.00',
  `job_qty` int(11) DEFAULT '0',
  `job_line_total` decimal(25,2) DEFAULT '0.00',
  `job_line_total_after_global` decimal(25,4) DEFAULT '0.0000',
  `job_code` varchar(245) DEFAULT '',
  `job_desc` varchar(245) DEFAULT '',
  PRIMARY KEY (`jo_billing_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_billing_items`
--

LOCK TABLES `jo_billing_items` WRITE;
/*!40000 ALTER TABLE `jo_billing_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `jo_billing_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_unit`
--

DROP TABLE IF EXISTS `job_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_unit` (
  `job_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_unit_name` varchar(255) DEFAULT NULL,
  `job_unit_desc` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`job_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_unit`
--

LOCK TABLES `job_unit` WRITE;
/*!40000 ALTER TABLE `job_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_code` varchar(255) DEFAULT NULL,
  `job_desc` varchar(255) DEFAULT NULL,
  `job_unit` varchar(255) DEFAULT NULL,
  `expense_account_id` bigint(20) DEFAULT '0',
  `job_amount` decimal(25,2) DEFAULT '0.00',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `created_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_accounts`
--

DROP TABLE IF EXISTS `journal_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_accounts` (
  `journal_account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) DEFAULT '0',
  `account_id` int(11) DEFAULT '0',
  `memo` varchar(700) DEFAULT '',
  `dr_amount` decimal(25,2) DEFAULT '0.00',
  `cr_amount` decimal(25,2) DEFAULT '0.00',
  PRIMARY KEY (`journal_account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_accounts`
--

LOCK TABLES `journal_accounts` WRITE;
/*!40000 ALTER TABLE `journal_accounts` DISABLE KEYS */;
INSERT INTO `journal_accounts` VALUES (1,1,16,'',5000.00,0.00),(2,1,74,'',0.00,5000.00),(3,2,19,'',2000.00,0.00),(4,2,83,'',0.00,2000.00),(5,3,148,'',2000.00,0.00),(6,3,83,'',0.00,2000.00),(7,4,148,'',2000.00,0.00),(8,4,3,'',0.00,2000.00),(9,5,149,'',2000.00,0.00),(10,5,83,'',0.00,2000.00),(11,6,3,'',58000.00,0.00),(12,6,70,'',0.00,58000.00);
/*!40000 ALTER TABLE `journal_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_entry_templates`
--

DROP TABLE IF EXISTS `journal_entry_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_entry_templates` (
  `entry_template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_id` bigint(20) DEFAULT '0',
  `account_id` bigint(20) DEFAULT '0',
  `memo` varchar(1000) DEFAULT '',
  `dr_amount` decimal(20,4) DEFAULT '0.0000',
  `cr_amount` decimal(20,4) DEFAULT '0.0000',
  `department_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`entry_template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_entry_templates`
--

LOCK TABLES `journal_entry_templates` WRITE;
/*!40000 ALTER TABLE `journal_entry_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_entry_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_info`
--

DROP TABLE IF EXISTS `journal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_info` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `txn_no` varchar(55) DEFAULT '',
  `department_id` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  `remarks` varchar(555) DEFAULT '',
  `book_type` varchar(20) DEFAULT '',
  `date_txn` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` int(11) DEFAULT '0',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` int(11) DEFAULT '0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `payment_method_id` int(11) DEFAULT '0',
  `bank` varchar(10) DEFAULT '',
  `check_no` varchar(20) DEFAULT '',
  `check_date` date DEFAULT '0000-00-00',
  `ref_type` varchar(4) DEFAULT '',
  `ref_no` varchar(25) DEFAULT '',
  `amount` decimal(10,2) DEFAULT '0.00',
  `or_no` varchar(50) DEFAULT '',
  `check_status` tinyint(4) DEFAULT '0',
  `accounting_period_id` bigint(20) DEFAULT '0',
  `is_replenished` tinyint(1) DEFAULT '0',
  `batch_id` int(11) DEFAULT '0',
  `bank_id` int(11) DEFAULT '0',
  `is_reconciled` tinyint(4) DEFAULT '0',
  `is_sales` tinyint(4) DEFAULT '0',
  `pos_integration_id` bigint(20) DEFAULT '0',
  `hotel_integration_id` bigint(20) DEFAULT '0',
  `carf_trans_id` bigint(20) DEFAULT '0',
  `is_carf_collection` bit(1) DEFAULT b'0',
  `path_2307` varchar(445) DEFAULT '',
  PRIMARY KEY (`journal_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='carf_trans_id = 1 for Vale 2 for SFL and 3 for Borrowings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_info`
--

LOCK TABLES `journal_info` WRITE;
/*!40000 ALTER TABLE `journal_info` DISABLE KEYS */;
INSERT INTO `journal_info` VALUES (1,'TXN-20181030-1',1,2,0,'','SJE','2018-10-30','2018-10-30 07:32:08',3,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0,0,'\0',''),(2,'TXN-20181030-2',1,4,0,'','SJE','2018-10-30','2018-10-30 07:48:11',3,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0,0,'\0',''),(3,'TXN-20181030-3',1,4,0,'','SJE','2018-10-30','2018-10-30 08:04:22',3,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0,0,'\0',''),(4,'TXN-20181030-4',1,5,0,'','SJE','2018-10-30','2018-10-30 08:08:47',3,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0,0,'\0',''),(5,'TXN-20181030-5',1,6,0,'','SJE','2018-10-30','2018-10-30 08:13:21',3,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0,0,'\0',''),(6,'TXN-20181030-6',NULL,1,0,'','CRJ','2018-10-30','2018-10-30 08:45:35',8,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',1,'',NULL,'1970-01-01','',NULL,58000.00,'',0,0,0,0,1,0,0,0,0,0,'\0','');
/*!40000 ALTER TABLE `journal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_templates_info`
--

DROP TABLE IF EXISTS `journal_templates_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_templates_info` (
  `template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_code` varchar(155) DEFAULT '',
  `payee` varchar(1000) DEFAULT '',
  `template_description` varchar(1000) DEFAULT '',
  `supplier_id` bigint(20) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT '0',
  `method_id` bigint(20) DEFAULT '0',
  `amount` decimal(20,4) DEFAULT '0.0000',
  `remarks` varchar(1000) DEFAULT '',
  `posted_by` int(11) DEFAULT NULL,
  `book_type` varchar(5) DEFAULT '',
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `carf_trans_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_templates_info`
--

LOCK TABLES `journal_templates_info` WRITE;
/*!40000 ALTER TABLE `journal_templates_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_templates_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`location_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (4,'2014_10_12_100000_create_password_resets_table',1),(5,'2018_10_09_024444_create_refcharges_table',1),(6,'2018_10_12_112549_create_refdepartments_table',1),(7,'2018_10_12_142353_create_reflocations_table',1),(8,'2018_10_12_144402_create_refnatureofbusiness_table',1),(9,'2018_10_12_151827_create_refcontracttype_table',1),(10,'2018_10_16_093305_create_refcategory_table',1),(11,'2018_10_16_120259_create_tenants_table',1),(12,'2018_10_22_102923_create_contract_info_table',1),(13,'2018_10_22_104933_create_contract_schedule_table',1),(14,'2018_10_22_105700_create_contract_util_charges_table',1),(15,'2018_10_22_110003_create_contract_misc_charges_table',1),(16,'2018_10_22_110234_create_contract_othr_charges_table',1),(17,'2018_10_25_164452_create_refmonths_table',1),(18,'2018_11_07_120352_create_refbillingperiod_table',1),(20,'2018_11_08_100913_create_billing_util_charges_table',1),(21,'2018_11_08_101105_create_billing_misc_charges_table',1),(22,'2018_11_08_101217_create_billing_othr_charges_table',1),(23,'2018_11_29_035017_create_billing_schedule_table',2),(25,'2014_10_12_000000_create_users_table',3),(26,'2018_11_08_100203_create_billing_info_table',4),(27,'2018_12_14_013258_create_payment_info_table',5),(28,'2018_12_14_015702_create_payment_details_table',5),(29,'2018_12_14_020749_create_refchecktype_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_layout`
--

DROP TABLE IF EXISTS `module_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_layout` (
  `module_layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) DEFAULT '0',
  `display_text` varchar(100) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `pos_top` decimal(10,0) DEFAULT NULL,
  `pos_bottom` decimal(10,0) DEFAULT NULL,
  `pos_left` decimal(10,0) DEFAULT NULL,
  `pos_right` decimal(10,0) DEFAULT NULL,
  `font` varchar(100) DEFAULT NULL,
  `font_color` varchar(45) DEFAULT NULL,
  `font_size` decimal(10,0) DEFAULT NULL,
  `is_bold` varchar(120) DEFAULT '0',
  `is_italic` varchar(120) DEFAULT '0',
  `height` decimal(10,0) DEFAULT NULL,
  `width` decimal(10,0) DEFAULT NULL,
  `tag` varchar(45) DEFAULT NULL,
  `parent` varchar(50) DEFAULT 'header',
  PRIMARY KEY (`module_layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_layout`
--

LOCK TABLES `module_layout` WRITE;
/*!40000 ALTER TABLE `module_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `months`
--

DROP TABLE IF EXISTS `months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `months` (
  `month_id` int(12) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(255) DEFAULT NULL,
  `quarter` int(12) DEFAULT NULL,
  `quarterly` int(12) DEFAULT NULL,
  PRIMARY KEY (`month_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `months`
--

LOCK TABLES `months` WRITE;
/*!40000 ALTER TABLE `months` DISABLE KEYS */;
INSERT INTO `months` VALUES (1,'January',1,1),(2,'February',2,1),(3,'March',3,1),(4,'April',1,2),(5,'May',2,2),(6,'June',3,2),(7,'July',1,3),(8,'August',2,3),(9,'September',3,3),(10,'October',1,4),(11,'November',2,4),(12,'December',3,4);
/*!40000 ALTER TABLE `months` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_source`
--

DROP TABLE IF EXISTS `order_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_source` (
  `order_source_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_source_name` varchar(145) DEFAULT '',
  `order_source_description` varchar(145) DEFAULT '',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`order_source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_source`
--

LOCK TABLES `order_source` WRITE;
/*!40000 ALTER TABLE `order_source` DISABLE KEYS */;
INSERT INTO `order_source` VALUES (1,'Walk In','Walk In','\0',''),(2,'Lazada','','',''),(3,'Facebook','','\0',''),(4,'Shoppee','','\0',''),(5,'Alibaba','','\0',''),(6,'edi','wow','',''),(7,'11','11','',''),(8,'aa','aa','',''),(9,'Viber','Viber','\0','');
/*!40000 ALTER TABLE `order_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status` varchar(75) DEFAULT '',
  `order_description` varchar(555) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`order_status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'Open','','','\0'),(2,'Closed','','','\0'),(3,'Partially received','','','\0');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_invoice`
--

DROP TABLE IF EXISTS `other_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_invoice` (
  `other_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `other_invoice_no` varchar(75) DEFAULT NULL,
  `department_id` int(11) DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT NULL,
  `total_amount` decimal(25,2) DEFAULT '0.00',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_amount_after_discount` decimal(20,4) DEFAULT '0.0000',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_due` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `remarks` text,
  `is_journal_posted` bit(1) DEFAULT b'0',
  `journal_id` bigint(20) DEFAULT '0',
  `contact_person` varchar(175) DEFAULT NULL,
  PRIMARY KEY (`other_invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_invoice`
--

LOCK TABLES `other_invoice` WRITE;
/*!40000 ALTER TABLE `other_invoice` DISABLE KEYS */;
INSERT INTO `other_invoice` VALUES (1,'OTH-INV-20181030-1',1,3,NULL,'231 MH DEL PILAR ST POBLACION BULACAN',500.00,0.0000,0.0000,500.0000,'2018-10-30','2018-10-30','2018-10-30 09:10:53','0000-00-00 00:00:00','0000-00-00 00:00:00',6,0,0,'','\0','','\0',0,'JONNAH');
/*!40000 ALTER TABLE `other_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_invoice_items`
--

DROP TABLE IF EXISTS `other_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_invoice_items` (
  `other_invoice_item_id` bigint(25) NOT NULL AUTO_INCREMENT,
  `other_invoice_id` bigint(25) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `item_unit_id` int(11) DEFAULT '0',
  `oi_price` decimal(25,2) DEFAULT '0.00',
  `oi_qty` int(11) DEFAULT '0',
  `oi_line_total` decimal(25,2) DEFAULT '0.00',
  `oi_line_total_after_global` decimal(25,4) DEFAULT '0.0000',
  `item_desc` varchar(445) DEFAULT '',
  PRIMARY KEY (`other_invoice_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_invoice_items`
--

LOCK TABLES `other_invoice_items` WRITE;
/*!40000 ALTER TABLE `other_invoice_items` DISABLE KEYS */;
INSERT INTO `other_invoice_items` VALUES (1,1,1,1,100.00,5,500.00,500.0000,'metotape');
/*!40000 ALTER TABLE `other_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payable_payments`
--

DROP TABLE IF EXISTS `payable_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payable_payments` (
  `payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(75) DEFAULT '',
  `supplier_id` bigint(20) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `receipt_type` varchar(55) DEFAULT '',
  `department_id` bigint(20) DEFAULT '0',
  `payment_method_id` int(11) DEFAULT '0',
  `check_date_type` tinyint(4) DEFAULT '1' COMMENT '1 is Date, 2 is PDC',
  `check_date` date DEFAULT '0000-00-00',
  `check_no` varchar(100) DEFAULT '',
  `remarks` varchar(755) DEFAULT '',
  `total_paid_amount` decimal(20,2) DEFAULT '0.00',
  `date_paid` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` int(11) DEFAULT '0',
  `created_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_posted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`payment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payable_payments`
--

LOCK TABLES `payable_payments` WRITE;
/*!40000 ALTER TABLE `payable_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payable_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payable_payments_list`
--

DROP TABLE IF EXISTS `payable_payments_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payable_payments_list` (
  `payment_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_id` bigint(20) DEFAULT '0',
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `payable_amount` decimal(20,2) DEFAULT '0.00',
  `payment_amount` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`payment_list_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payable_payments_list`
--

LOCK TABLES `payable_payments_list` WRITE;
/*!40000 ALTER TABLE `payable_payments_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `payable_payments_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(100) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`payment_method_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'Cash','','\0'),(2,'Check','','\0'),(3,'Card','','\0');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_attachments`
--

DROP TABLE IF EXISTS `po_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `po_attachments` (
  `po_attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) DEFAULT '0',
  `orig_file_name` varchar(255) DEFAULT '',
  `server_file_directory` varchar(800) DEFAULT '',
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by_user` int(11) DEFAULT '0',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`po_attachment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_attachments`
--

LOCK TABLES `po_attachments` WRITE;
/*!40000 ALTER TABLE `po_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `po_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_messages`
--

DROP TABLE IF EXISTS `po_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `po_messages` (
  `po_message_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `message` text,
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`po_message_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_messages`
--

LOCK TABLES `po_messages` WRITE;
/*!40000 ALTER TABLE `po_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `po_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prime_hotel_integration`
--

DROP TABLE IF EXISTS `prime_hotel_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prime_hotel_integration` (
  `prime_hotel_integration_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(45) DEFAULT '',
  `shift_date` date DEFAULT '0000-00-00',
  `adv_cash_total` decimal(20,5) DEFAULT '0.00000',
  `adv_check_total` decimal(20,5) DEFAULT '0.00000',
  `adv_card_total` decimal(20,5) DEFAULT '0.00000',
  `adv_charge_total` decimal(20,5) DEFAULT '0.00000',
  `adv_bank_dep_total` decimal(20,5) DEFAULT '0.00000',
  `cash_sales` decimal(20,5) DEFAULT '0.00000',
  `check_sales` decimal(20,5) DEFAULT '0.00000',
  `card_sales` decimal(20,5) DEFAULT '0.00000',
  `charge_sales` decimal(20,5) DEFAULT '0.00000',
  `bank_dep_sales` decimal(20,5) DEFAULT '0.00000',
  `room_sales` decimal(20,5) DEFAULT '0.00000',
  `bar_sales` decimal(20,5) DEFAULT '0.00000',
  `other_sales` decimal(20,5) DEFAULT '0.00000',
  `adv_sales` decimal(20,5) DEFAULT '0.00000',
  `guest_id` bigint(20) DEFAULT '0',
  `guest_name` varchar(245) DEFAULT '',
  `ar_guest_id` bigint(20) DEFAULT '0',
  `ar_guest_name` varchar(245) DEFAULT '',
  `check_no` varchar(145) DEFAULT '',
  `check_date` date DEFAULT '0000-00-00',
  `check_type_id` bigint(20) DEFAULT '0',
  `check_type_name` varchar(145) DEFAULT '',
  `card_no` varchar(45) DEFAULT '',
  `card_type_name` varchar(45) DEFAULT '',
  `or_no` varchar(145) DEFAULT '',
  `folio_no` varchar(145) DEFAULT '',
  `receipt_no` varchar(145) DEFAULT '',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `posted_by_user` bigint(20) DEFAULT '0',
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `journal_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`prime_hotel_integration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prime_hotel_integration`
--

LOCK TABLES `prime_hotel_integration` WRITE;
/*!40000 ALTER TABLE `prime_hotel_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `prime_hotel_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prime_hotel_integration_settings`
--

DROP TABLE IF EXISTS `prime_hotel_integration_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prime_hotel_integration_settings` (
  `prime_hotel_integration_settings_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adv_cash_id` bigint(20) DEFAULT '0',
  `adv_check_id` bigint(20) DEFAULT '0',
  `adv_card_id` bigint(20) DEFAULT '0',
  `adv_charge_id` bigint(20) DEFAULT '0',
  `adv_bank_dep_id` bigint(20) DEFAULT '0',
  `cash_id` bigint(20) DEFAULT '0',
  `check_id` bigint(20) DEFAULT '0',
  `card_id` bigint(20) DEFAULT '0',
  `charge_id` bigint(20) DEFAULT '0',
  `bank_dep_id` bigint(20) DEFAULT '0',
  `room_sales_id` bigint(20) DEFAULT '0',
  `bar_sales_id` bigint(20) DEFAULT '0',
  `other_sales_id` bigint(20) DEFAULT '0',
  `adv_sales_id` bigint(20) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`prime_hotel_integration_settings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prime_hotel_integration_settings`
--

LOCK TABLES `prime_hotel_integration_settings` WRITE;
/*!40000 ALTER TABLE `prime_hotel_integration_settings` DISABLE KEYS */;
INSERT INTO `prime_hotel_integration_settings` VALUES (1,46,47,48,49,50,1,52,53,5,54,19,21,20,51,1,1);
/*!40000 ALTER TABLE `prime_hotel_integration_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `print_layout`
--

DROP TABLE IF EXISTS `print_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_name` varchar(755) NOT NULL,
  `layout_description` varchar(1000) DEFAULT NULL,
  `is_portrait` bit(1) NOT NULL DEFAULT b'1',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `print_layout`
--

LOCK TABLES `print_layout` WRITE;
/*!40000 ALTER TABLE `print_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `print_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_batch_inventory`
--

DROP TABLE IF EXISTS `product_batch_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_batch_inventory` (
  `product_key` varchar(100) NOT NULL,
  `product_id` bigint(20) DEFAULT '0',
  `batch_no` varchar(55) DEFAULT '',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_exp_on_hand` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`product_key`) USING BTREE,
  UNIQUE KEY `product_key` (`product_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_batch_inventory`
--

LOCK TABLES `product_batch_inventory` WRITE;
/*!40000 ALTER TABLE `product_batch_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_batch_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(255) DEFAULT '',
  `product_desc` varchar(255) DEFAULT '',
  `product_desc1` varchar(255) DEFAULT '',
  `is_bulk` tinyint(1) DEFAULT '0',
  `primary_unit` bit(1) DEFAULT b'1',
  `parent_unit_id` bigint(20) DEFAULT '0',
  `child_unit_desc` varchar(175) DEFAULT '0',
  `child_unit_id` bigint(20) DEFAULT '0',
  `size` varchar(255) DEFAULT '',
  `supplier_id` bigint(20) DEFAULT '0',
  `tax_type_id` bigint(20) DEFAULT '0',
  `refproduct_id` int(10) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `department_id` int(11) DEFAULT '2' COMMENT '1 - Hotel , 2 -  POS',
  `equivalent_points` decimal(20,2) DEFAULT '0.00',
  `product_warn` decimal(16,2) DEFAULT '0.00',
  `product_ideal` decimal(16,2) DEFAULT '0.00',
  `purchase_cost` decimal(20,4) DEFAULT '0.0000',
  `purchase_cost_2` decimal(20,4) DEFAULT '0.0000',
  `markup_percent` decimal(16,4) DEFAULT '0.0000',
  `sale_price` decimal(16,4) DEFAULT '0.0000',
  `whole_sale` decimal(16,4) DEFAULT '0.0000',
  `retailer_price` decimal(16,4) DEFAULT '0.0000',
  `special_disc` decimal(16,4) DEFAULT '0.0000',
  `discounted_price` decimal(16,4) DEFAULT '0.0000',
  `dealer_price` decimal(16,4) DEFAULT '0.0000',
  `distributor_price` decimal(16,4) DEFAULT '0.0000',
  `public_price` decimal(16,4) DEFAULT '0.0000',
  `valued_customer` decimal(16,4) DEFAULT '0.0000',
  `income_account_id` bigint(20) DEFAULT '0',
  `expense_account_id` bigint(20) DEFAULT '0',
  `on_hand` decimal(20,2) DEFAULT '0.00',
  `item_type_id` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_inventory` bit(1) DEFAULT b'1',
  `is_tax_exempt` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `brand_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'12','12','12',0,'',1,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,0.0000,0.0000,0.0000,12.0000,0.0000,0.0000,0.0000,12.0000,0.0000,0.0000,0.0000,0.0000,1,3,0.00,1,'2018-11-06 14:05:09','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','\0','',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proforma_invoice`
--

DROP TABLE IF EXISTS `proforma_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proforma_invoice` (
  `proforma_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proforma_inv_no` varchar(75) DEFAULT '',
  `sales_order_id` bigint(20) DEFAULT '0',
  `sales_order_no` varchar(75) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `customer_name` varchar(175) NOT NULL,
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  PRIMARY KEY (`proforma_invoice_id`) USING BTREE,
  UNIQUE KEY `proforma_inv_no` (`proforma_inv_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proforma_invoice`
--

LOCK TABLES `proforma_invoice` WRITE;
/*!40000 ALTER TABLE `proforma_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `proforma_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proforma_invoice_items`
--

DROP TABLE IF EXISTS `proforma_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proforma_invoice_items` (
  `proforma_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proforma_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,0) DEFAULT '0',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`proforma_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proforma_invoice_items`
--

LOCK TABLES `proforma_invoice_items` WRITE;
/*!40000 ALTER TABLE `proforma_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `proforma_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_integration`
--

DROP TABLE IF EXISTS `purchase_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_integration` (
  `purchase_integration_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) DEFAULT '0',
  `invoice_no` varchar(245) DEFAULT '',
  `date_invoice` date DEFAULT '0000-00-00',
  `pos_supplier_id` bigint(20) DEFAULT '0',
  `pos_supplier_name` varchar(245) DEFAULT '',
  `total_amount` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `remarks` varchar(755) DEFAULT '',
  `external_ref_no` varchar(245) DEFAULT '',
  `terms` varchar(245) DEFAULT '',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `journal_id` bigint(20) DEFAULT '0',
  `posted_by_user` bigint(20) DEFAULT '0',
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `filename` varchar(775) DEFAULT '',
  `is_txt_file` bit(1) DEFAULT b'0',
  `uploaded_by` bigint(20) DEFAULT '0',
  `date_uploaded` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`purchase_integration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_integration`
--

LOCK TABLES `purchase_integration` WRITE;
/*!40000 ALTER TABLE `purchase_integration` DISABLE KEYS */;
INSERT INTO `purchase_integration` VALUES (67,204797,'5941','2018-10-02',114,'KARLAS MARKETING',59077.5400,6329.7400,52747.8000,'','','3\r\n','\0',0,0,'0000-00-00 00:00:00','2018-10-02.jdev','',5,'0000-00-00 00:00:00'),(68,204798,'GV30436392','2018-10-02',196,'SELECTA-DAIRY',19480.6900,2087.2200,17393.4700,'','','6\r\n','\0',0,0,'0000-00-00 00:00:00','2018-10-02.jdev','',5,'0000-00-00 00:00:00'),(69,204799,'2381615','2018-10-02',308,'Marby Food Ventures Corp.',13545.0000,1451.2500,12093.7500,'','','0\r\n','\0',0,0,'0000-00-00 00:00:00','2018-10-02.jdev','',5,'0000-00-00 00:00:00'),(70,204800,'2381616','2018-10-02',308,'Marby Food Ventures Corp.',7506.9000,804.3100,6702.5900,'','','0\r\n','\0',0,0,'0000-00-00 00:00:00','2018-10-02.jdev','',5,'0000-00-00 00:00:00'),(71,204801,'0054','2018-10-02',152,'NEW ANCHOR TRADING',5000.0000,535.7100,4464.2900,'','','6\r\n','\0',0,0,'0000-00-00 00:00:00','2018-10-02.jdev','',5,'0000-00-00 00:00:00'),(72,204802,'5942','2018-10-02',114,'KARLAS MARKETINGasd',9774.5700,1047.2800,8727.2900,'','','3\r\n','\0',0,0,'0000-00-00 00:00:00','2018-10-02.jdev','',5,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `purchase_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `purchase_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(75) DEFAULT '',
  `terms` varchar(55) DEFAULT '',
  `duration` varchar(55) DEFAULT '',
  `deliver_to_address` varchar(755) DEFAULT '',
  `supplier_id` int(11) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0',
  `tax_type_id` int(11) DEFAULT '0',
  `contact_person` varchar(100) DEFAULT '',
  `remarks` varchar(155) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) NOT NULL,
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `approval_id` int(11) DEFAULT '2',
  `order_status_id` int(11) DEFAULT '1',
  `is_email_sent` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_approved` datetime DEFAULT '0000-00-00 00:00:00',
  `approved_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `cancel_reason` varchar(245) DEFAULT '',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` bigint(20) DEFAULT '0',
  PRIMARY KEY (`purchase_order_id`) USING BTREE,
  UNIQUE KEY `po_no` (`po_no`) USING BTREE,
  UNIQUE KEY `po_no_2` (`po_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES (1,'PO-20181106-1','12',NULL,'121',1,1,1,'','',0.0000,148794.6400,17855.3600,166650.0000,0.0000,0.0000,166650.0000,1,1,'\0','','\0','2018-11-06 14:05:30','2018-11-06 06:05:40','0000-00-00 00:00:00','2018-11-06 14:05:40',1,1,0,0,'','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_items`
--

DROP TABLE IF EXISTS `purchase_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_items` (
  `po_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` int(11) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `po_price` decimal(20,4) DEFAULT '0.0000',
  `po_discount` decimal(20,4) DEFAULT '0.0000',
  `po_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `po_tax_rate` decimal(11,4) DEFAULT '0.0000',
  `po_qty` decimal(20,2) DEFAULT '0.00',
  `po_line_total` decimal(20,4) DEFAULT '0.0000',
  `tax_amount` decimal(20,4) DEFAULT '0.0000',
  `non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `po_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`po_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_items`
--

LOCK TABLES `purchase_order_items` WRITE;
/*!40000 ALTER TABLE `purchase_order_items` DISABLE KEYS */;
INSERT INTO `purchase_order_items` VALUES (1,1,1,1,1,11110.0000,0.0000,0.0000,12.0000,15.00,166650.0000,17855.3600,148794.6400,166650.0000);
/*!40000 ALTER TABLE `purchase_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasing_integration`
--

DROP TABLE IF EXISTS `purchasing_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchasing_integration` (
  `purchasing_integration_id` int(11) NOT NULL DEFAULT '0',
  `iss_supplier_id` bigint(20) DEFAULT '0',
  `iss_debit_id` bigint(20) DEFAULT '0',
  `iss_credit_id` bigint(20) DEFAULT '0',
  `adj_supplier_id` bigint(20) DEFAULT '0',
  `adj_debit_id` bigint(20) DEFAULT '0',
  `adj_credit_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`purchasing_integration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasing_integration`
--

LOCK TABLES `purchasing_integration` WRITE;
/*!40000 ALTER TABLE `purchasing_integration` DISABLE KEYS */;
INSERT INTO `purchasing_integration` VALUES (1,1,89,0,1,77,1);
/*!40000 ALTER TABLE `purchasing_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receivable_payments`
--

DROP TABLE IF EXISTS `receivable_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivable_payments` (
  `payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(20) DEFAULT '',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `receipt_type` varchar(55) DEFAULT 'AR',
  `department_id` int(11) DEFAULT '0',
  `payment_method_id` int(11) DEFAULT '0',
  `check_date_type` tinyint(4) DEFAULT '1' COMMENT '1 is Date, 2 is PDC',
  `check_date` date DEFAULT '0000-00-00',
  `check_no` varchar(100) DEFAULT '',
  `remarks` varchar(755) DEFAULT '',
  `total_paid_amount` decimal(20,2) DEFAULT '0.00',
  `date_paid` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` int(11) DEFAULT '0',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `is_posted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receivable_payments`
--

LOCK TABLES `receivable_payments` WRITE;
/*!40000 ALTER TABLE `receivable_payments` DISABLE KEYS */;
INSERT INTO `receivable_payments` VALUES (1,'100014',2,0,'AR',1,1,1,'0000-00-00','','',2500.00,'2018-10-30','2018-10-30 08:39:51','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,8,0,0,'\0','\0','','\0'),(2,'52525',2,0,'AR',1,1,1,'0000-00-00','','',2500.00,'2018-10-30','2018-10-30 08:41:07','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,8,0,0,'\0','\0','','\0');
/*!40000 ALTER TABLE `receivable_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receivable_payments_list`
--

DROP TABLE IF EXISTS `receivable_payments_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivable_payments_list` (
  `payment_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_id` bigint(20) DEFAULT '0',
  `sales_invoice_id` bigint(20) DEFAULT '0',
  `service_invoice_id` bigint(20) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `receivable_amount` decimal(20,2) DEFAULT '0.00',
  `payment_amount` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`payment_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receivable_payments_list`
--

LOCK TABLES `receivable_payments_list` WRITE;
/*!40000 ALTER TABLE `receivable_payments_list` DISABLE KEYS */;
INSERT INTO `receivable_payments_list` VALUES (1,1,0,0,1,5000.00,2500.00),(2,2,0,0,1,2500.00,2500.00);
/*!40000 ALTER TABLE `receivable_payments_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refcustomertype`
--

DROP TABLE IF EXISTS `refcustomertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refcustomertype` (
  `refcustomertype_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `modified_by_user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`refcustomertype_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refcustomertype`
--

LOCK TABLES `refcustomertype` WRITE;
/*!40000 ALTER TABLE `refcustomertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `refcustomertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refdiscounttype`
--

DROP TABLE IF EXISTS `refdiscounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refdiscounttype` (
  `discount_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_type_code` varchar(65) DEFAULT '',
  `discount_type_name` varchar(254) DEFAULT '',
  `discount_type_desc` varchar(500) DEFAULT '',
  `discount_percent` decimal(19,5) DEFAULT '0.00000',
  `sort_key` int(11) DEFAULT '0',
  `created_by` int(11) DEFAULT '0',
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT '0',
  `modified_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT '0',
  `deleted_datetime` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`discount_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refdiscounttype`
--

LOCK TABLES `refdiscounttype` WRITE;
/*!40000 ALTER TABLE `refdiscounttype` DISABLE KEYS */;
INSERT INTO `refdiscounttype` VALUES (1,'SC','Senior Citizen','Senior Citizen',20.00000,-1,0,NULL,0,NULL,1,NULL,0),(2,'MD','Manual Discount','Manual Discount',0.00000,0,0,NULL,1,'2017-08-11 12:01:36',1,'2017-08-11 12:01:42',0),(3,'5% Percent','5% Percent','5% Percent',5.00000,0,1,'2017-08-11 12:02:10',1,'2018-03-27 10:12:16',0,NULL,0),(4,'10% Percent','10% Percent','10% Percent',10.00000,0,1,'2018-03-27 10:12:32',0,NULL,0,NULL,0),(5,'15% Percent','15% Percent','15% Percent',15.00000,0,1,'2018-03-27 10:12:49',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `refdiscounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refproduct`
--

DROP TABLE IF EXISTS `refproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refproduct` (
  `refproduct_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `modified_by_user_id` int(10) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`refproduct_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refproduct`
--

LOCK TABLES `refproduct` WRITE;
/*!40000 ALTER TABLE `refproduct` DISABLE KEYS */;
INSERT INTO `refproduct` VALUES (1,'Companion Animals','Common house pets',0,0,'2017-07-05 11:51:47','0000-00-00 00:00:00',0),(2,'Livestock Animals','Farm animals',0,0,'2017-07-05 11:51:47','0000-00-00 00:00:00',0),(3,'All Product type','',0,0,'2017-07-05 11:51:47','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `refproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights_links`
--

DROP TABLE IF EXISTS `rights_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights_links` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_code` varchar(100) DEFAULT '',
  `link_code` varchar(20) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT '',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights_links`
--

LOCK TABLES `rights_links` WRITE;
/*!40000 ALTER TABLE `rights_links` DISABLE KEYS */;
INSERT INTO `rights_links` VALUES (1,'1','1-1','General Journal'),(2,'1','1-2','Cash Disbursement'),(3,'1','1-3','Purchase Journal'),(4,'1','1-4','Sales Journal'),(5,'1','1-5','Cash Receipt'),(6,'2','2-1','Purchase Order'),(7,'2','2-2','Purchase Invoice'),(8,'2','2-3','Record Payment'),(10,'15','15-3','Item Adjustment'),(11,'3','3-1','Sales Order'),(12,'3','3-2','Sales Invoice'),(13,'3','3-3','Collection Entry'),(14,'4','4-2','Category Management'),(15,'4','4-3','Department Management'),(16,'4','4-4','Unit Management'),(17,'5','5-1','Product Management'),(18,'5','5-2','Supplier Management'),(19,'5','5-3','Customer Management'),(20,'6','6-1','Setup Tax'),(21,'6','6-2','Setup Chart of Accounts'),(22,'6','6-3','Account Integration'),(23,'6','6-4','Setup User Group'),(24,'6','6-5','Create User Account'),(25,'6','6-6','Setup Company Info'),(26,'7','7-1','Purchase Order for Approval'),(27,'9','9-1','Balance Sheet Report'),(28,'9','9-2','Income Statement'),(29,'4','4-1','Account Classification'),(30,'8','8-1','Sales Report'),(31,'15','15-4','Inventory Report'),(32,'5','5-4','Salesperson Management'),(33,'2','2-6','Item Adjustment (Out)'),(34,'8','8-3','Export Sales Summary'),(35,'9','9-3','Export Trial Balance'),(36,'6','6-7','Setup Check Layout'),(37,'9','9-4','AR Schedule'),(38,'9','9-6','Customer Subsidiary'),(39,'9','9-8','Account Subsidiary'),(40,'9','9-7','Supplier Subsidiary'),(41,'9','9-5','AP Schedule'),(42,'8','8-4','Purchase Invoice Report'),(43,'4','4-5','Locations Management'),(44,'10','10-1','Fixed Asset Management'),(45,'9','9-9','Annual Income Statement'),(46,'6','6-8','Recurring Template'),(47,'9','9-10','VAT Relief Report'),(48,'1','1-6','Petty Cash Journal'),(49,'9','9-13','Replenishment Report'),(50,'6','6-9','Backup Database'),(51,'9','9-14','Book of Accounts'),(52,'9','9-16','Comparative Income'),(53,'4','4-6','Bank Reference Management'),(54,'10','10-2','Depreciation Expense Report'),(55,'11','11-1','Bank Reconciliation'),(57,'12','12-1','Voucher Registry Report'),(58,'12','12-2','Check Registry Report'),(59,'12','12-3','Collection List Report'),(60,'12','12-4','Open Purchase Report'),(61,'12','12-5','Open Sales Report'),(62,'9','9-11','Schedule of Expense'),(63,'9','9-15','AR Reports'),(64,'9','9-12','Cost of Goods'),(65,'13','13-1','Service Invoice'),(66,'13','13-2','Service Journal'),(67,'13','13-3','Service Unit Management'),(68,'13','13-4','Service Management'),(69,'9','9-17','Aging of Receivables'),(70,'9','9-18','Aging of Payables'),(71,'9','9-19','Statement of Account'),(72,'6','6-10','Email Settings'),(73,'14','14-1','Treasury'),(74,'9','9-20','Replenishment Batch Report'),(75,'9','9-21','General Ledger'),(76,'6','6-11','Email Report'),(77,'12','12-6','Product Reorder (Pick-list)'),(78,'12','12-7','Product List Report'),(79,'2','2-8','Purchase History'),(80,'2','2-7','Purchase Monitoring'),(82,'15','15-1','Product Management (Inventory Tab)'),(83,'3','3-4','Cash Invoice'),(84,'6','6-13','Audit Trail'),(85,'15','15-5','Item Transfer to Department'),(86,'15','15-6','Stock Card / Bin Card'),(87,'3','3-5','Warehouse Dispatching'),(88,'4','4-7','Brands'),(89,'2','2-9','Purchasing Integration'),(90,'14','14-2','Cash Advance Request Form (CARF)'),(91,'14','14-3','Revolving Fund Journal'),(92,'14','14-4','Revolving Fund Monitor'),(93,'16','16-1','Items Management'),(94,'16','16-2','Item Units Management'),(95,'16','16-3','Other Income Invoice'),(96,'6','6-14','Statement of Accounts Settings'),(97,'17','17-1','Certificate of Creditable Tax'),(98,'17','17-2','Monthly Percentage Tax Return'),(99,'17','17-3','Quarterly Percentage Tax Return');
/*!40000 ALTER TABLE `rights_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice`
--

DROP TABLE IF EXISTS `sales_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoice` (
  `sales_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sales_inv_no` varchar(75) DEFAULT '',
  `sales_order_id` bigint(20) DEFAULT '0',
  `sales_order_no` varchar(75) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0',
  `for_dispatching` bit(1) DEFAULT b'0',
  PRIMARY KEY (`sales_invoice_id`) USING BTREE,
  UNIQUE KEY `sales_inv_no` (`sales_inv_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice`
--

LOCK TABLES `sales_invoice` WRITE;
/*!40000 ALTER TABLE `sales_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice_items`
--

DROP TABLE IF EXISTS `sales_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoice_items` (
  `sales_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sales_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,2) DEFAULT '0.00',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`sales_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice_items`
--

LOCK TABLES `sales_invoice_items` WRITE;
/*!40000 ALTER TABLE `sales_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order` (
  `sales_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `so_no` varchar(75) DEFAULT '',
  `customer_id` bigint(20) DEFAULT '0',
  `department_id` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,2) DEFAULT '0.00',
  `order_status_id` int(11) DEFAULT '1',
  `date_order` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `salesperson_id` int(11) DEFAULT '0',
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`sales_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order`
--

LOCK TABLES `sales_order` WRITE;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_items`
--

DROP TABLE IF EXISTS `sales_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_items` (
  `sales_order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '1',
  `so_qty` decimal(20,2) DEFAULT '0.00',
  `so_price` decimal(20,4) DEFAULT '0.0000',
  `so_discount` decimal(20,4) DEFAULT '0.0000',
  `so_gross` decimal(20,4) DEFAULT '0.0000',
  `so_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `so_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `so_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `so_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `so_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `exp_date` date DEFAULT '0000-00-00',
  `dr_invoice_id` int(11) DEFAULT NULL,
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`sales_order_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_items`
--

LOCK TABLES `sales_order_items` WRITE;
/*!40000 ALTER TABLE `sales_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesperson`
--

DROP TABLE IF EXISTS `salesperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesperson` (
  `salesperson_id` int(11) NOT NULL AUTO_INCREMENT,
  `salesperson_code` varchar(55) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `acr_name` varchar(10) DEFAULT NULL,
  `contact_no` varchar(100) NOT NULL,
  `department_id` int(2) NOT NULL,
  `tin_no` varchar(100) NOT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  PRIMARY KEY (`salesperson_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesperson`
--

LOCK TABLES `salesperson` WRITE;
/*!40000 ALTER TABLE `salesperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sched_expense_integration`
--

DROP TABLE IF EXISTS `sched_expense_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sched_expense_integration` (
  `sched_expense_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) DEFAULT '0',
  `group_id` int(11) DEFAULT '0',
  PRIMARY KEY (`sched_expense_id`) USING BTREE,
  UNIQUE KEY `account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sched_expense_integration`
--

LOCK TABLES `sched_expense_integration` WRITE;
/*!40000 ALTER TABLE `sched_expense_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `sched_expense_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_invoice`
--

DROP TABLE IF EXISTS `service_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_invoice` (
  `service_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_invoice_no` varchar(75) DEFAULT NULL,
  `department_id` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT NULL,
  `total_amount` decimal(25,2) DEFAULT '0.00',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_amount_after_discount` decimal(20,4) DEFAULT '0.0000',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_due` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `remarks` text,
  `is_journal_posted` bit(1) DEFAULT b'0',
  `journal_id` bigint(20) DEFAULT '0',
  `contact_person` varchar(175) DEFAULT NULL,
  PRIMARY KEY (`service_invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_invoice`
--

LOCK TABLES `service_invoice` WRITE;
/*!40000 ALTER TABLE `service_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_invoice_items`
--

DROP TABLE IF EXISTS `service_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_invoice_items` (
  `service_item_id` bigint(25) NOT NULL AUTO_INCREMENT,
  `service_invoice_id` bigint(25) DEFAULT '0',
  `service_id` int(11) DEFAULT '0',
  `service_unit` int(11) DEFAULT '0',
  `service_price` decimal(25,2) DEFAULT '0.00',
  `service_qty` int(11) DEFAULT '0',
  `service_line_total` decimal(25,2) DEFAULT '0.00',
  `service_line_total_after_global` decimal(25,4) DEFAULT '0.0000',
  PRIMARY KEY (`service_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_invoice_items`
--

LOCK TABLES `service_invoice_items` WRITE;
/*!40000 ALTER TABLE `service_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_unit`
--

DROP TABLE IF EXISTS `service_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_unit` (
  `service_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_unit_name` varchar(255) DEFAULT NULL,
  `service_unit_desc` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`service_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_unit`
--

LOCK TABLES `service_unit` WRITE;
/*!40000 ALTER TABLE `service_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `service_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(255) DEFAULT NULL,
  `service_desc` varchar(255) DEFAULT NULL,
  `service_unit` varchar(255) DEFAULT NULL,
  `income_account_id` bigint(20) DEFAULT '0',
  `expense_account_id` bigint(20) DEFAULT '0',
  `service_amount` decimal(25,2) DEFAULT '0.00',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `created_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soa_settings`
--

DROP TABLE IF EXISTS `soa_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soa_settings` (
  `soa_settings_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `soa_account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`soa_settings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soa_settings`
--

LOCK TABLES `soa_settings` WRITE;
/*!40000 ALTER TABLE `soa_settings` DISABLE KEYS */;
INSERT INTO `soa_settings` VALUES (1,6);
/*!40000 ALTER TABLE `soa_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_photos`
--

DROP TABLE IF EXISTS `supplier_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT '0',
  `photo_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_photos`
--

LOCK TABLES `supplier_photos` WRITE;
/*!40000 ALTER TABLE `supplier_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_code` varchar(125) DEFAULT '',
  `pos_supplier_id` bigint(20) DEFAULT '0',
  `supplier_name` varchar(255) DEFAULT '',
  `contact_name` varchar(255) DEFAULT '',
  `contact_person` varchar(155) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `email_address` varchar(255) DEFAULT '',
  `contact_no` varchar(255) DEFAULT '',
  `tin_no` varchar(255) DEFAULT '',
  `term` varchar(255) DEFAULT '',
  `tax_type_id` int(11) DEFAULT '1',
  `photo_path` varchar(500) DEFAULT '',
  `total_payable_amount` decimal(19,2) DEFAULT '0.00',
  `posted_by_user` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `credit_limit` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `deleted_by_user` int(11) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `tax_output` int(11) DEFAULT '0',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'N/A',0,'N/A','','','','','','','',1,'',0.00,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,'\0','',0,'0000-00-00 00:00:00',0),(2,'',0,'MARBY FOOD VENTURES CORPORATION','JENNY','','BALUBAD, BULACAN','',NULL,'','',0,'assets/img/anonymous-icon.png',0.00,4,'2018-10-30 07:37:00','0000-00-00 00:00:00',NULL,'\0','',0,'0000-00-00 00:00:00',0),(3,'',0,'UNITED LINK PHARMACEUTICAL DISTRIBUTION','JONNAH','','231 MH DEL PILAR ST POBLACION BULACAN','',NULL,'','',0,'assets/img/anonymous-icon.png',0.00,4,'2018-10-30 07:51:41','0000-00-00 00:00:00',NULL,'\0','',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_types`
--

DROP TABLE IF EXISTS `tax_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_types` (
  `tax_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_type` varchar(155) DEFAULT '',
  `tax_rate` decimal(11,2) DEFAULT '0.00',
  `description` varchar(555) DEFAULT '',
  `is_default` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`tax_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_types`
--

LOCK TABLES `tax_types` WRITE;
/*!40000 ALTER TABLE `tax_types` DISABLE KEYS */;
INSERT INTO `tax_types` VALUES (1,'Non-vat',0.00,'','\0','\0'),(2,'Vatted',12.00,'','','\0');
/*!40000 ALTER TABLE `tax_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans`
--

DROP TABLE IF EXISTS `trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trans` (
  `trans_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT '0',
  `trans_key_id` bigint(20) DEFAULT NULL,
  `trans_type_id` bigint(20) DEFAULT NULL,
  `trans_log` varchar(745) DEFAULT NULL,
  `trans_date` datetime DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans`
--

LOCK TABLES `trans` WRITE;
/*!40000 ALTER TABLE `trans` DISABLE KEYS */;
INSERT INTO `trans` VALUES (1,1,7,43,'User Log Out :System  Administrator','2018-10-29 08:18:03'),(2,0,10,43,'Login Attempt using username: admin','2018-10-29 08:18:10'),(3,0,10,43,'Login Attempt using username: admin','2018-10-29 08:18:16'),(4,1,6,43,'User Log in: System Administrator ','2018-10-29 08:18:21'),(5,1,1,52,'Created a new customer: None','2018-10-29 08:19:34'),(6,5,7,43,'User Log Out :raf  raf','2018-10-29 09:51:39'),(7,0,10,43,'Login Attempt using username: admin','2018-10-30 00:43:00'),(8,1,6,43,'User Log in: System Administrator ','2018-10-30 00:43:04'),(9,1,7,43,'User Log Out :System Administrator ','2018-10-30 01:05:42'),(10,0,10,43,'Login Attempt using username: admin','2018-10-30 01:06:03'),(11,1,6,43,'User Log in: System Administrator ','2018-10-30 01:06:07'),(12,1,2,60,'Modified Company Information','2018-10-30 01:06:47'),(13,1,7,43,'User Log Out :System Administrator ','2018-10-30 01:06:57'),(14,1,6,43,'User Log in: System Administrator ','2018-10-30 01:07:03'),(15,1,7,43,'User Log Out :System Administrator ','2018-10-30 01:11:05'),(16,1,6,43,'User Log in: System Administrator ','2018-10-30 01:11:09'),(17,1,6,43,'User Log in: System Administrator ','2018-10-30 01:16:37'),(18,1,7,43,'User Log Out :System Administrator ','2018-10-30 01:18:21'),(19,1,6,43,'User Log in: System Administrator ','2018-10-30 01:18:27'),(20,1,7,43,'User Log Out :System Administrator ','2018-10-30 01:39:53'),(21,1,6,43,'User Log in: System Administrator ','2018-10-30 01:40:01'),(22,1,7,43,'User Log Out :System Administrator ','2018-10-30 01:40:48'),(23,1,7,43,'User Log Out :System Administrator ','2018-10-30 02:46:36'),(24,0,10,43,'Login Attempt using username: admin','2018-10-30 02:46:41'),(25,1,6,43,'User Log in: System Administrator ','2018-10-30 02:46:46'),(26,1,6,43,'User Log in: System Administrator ','2018-10-30 02:47:48'),(27,1,7,43,'User Log Out :System Administrator ','2018-10-30 02:49:42'),(28,1,7,43,'User Log Out :System Administrator ','2018-10-30 02:53:39'),(29,1,6,43,'User Log in: System Administrator ','2018-10-30 03:06:23'),(30,1,6,43,'User Log in: System Administrator ','2018-10-30 06:28:45'),(31,1,1,43,'Created User: mellim','2018-10-30 06:30:22'),(32,1,7,43,'User Log Out :System Administrator ','2018-10-30 06:30:27'),(33,2,6,43,'User Log in: Amelia  Lim','2018-10-30 06:30:36'),(34,2,1,59,'Created User Group : AP Clerk','2018-10-30 06:31:22'),(35,2,2,59,'Updated User Rights Links: ID(2)','2018-10-30 06:40:25'),(36,2,1,59,'Created User Group : AR Clerk','2018-10-30 06:41:18'),(37,2,2,59,'Updated User Rights Links: ID(3)','2018-10-30 06:43:12'),(38,2,2,59,'Updated User Rights Links: ID(3)','2018-10-30 06:43:24'),(39,2,1,59,'Created User Group : CD Clerk-Acctg','2018-10-30 06:44:49'),(40,2,2,59,'Updated User Rights Links: ID(4)','2018-10-30 06:46:39'),(41,2,1,59,'Created User Group : Petty cash Custodian','2018-10-30 06:47:14'),(42,2,2,59,'Updated User Rights Links: ID(5)','2018-10-30 06:48:05'),(43,2,2,59,'Updated User Rights Links: ID(2)','2018-10-30 06:48:31'),(44,2,1,43,'Created User: Vicky','2018-10-30 07:11:32'),(45,0,10,43,'Login Attempt using username: ','2018-10-30 07:12:23'),(46,3,6,43,'User Log in: Victoria Garcia Tomas','2018-10-30 07:12:23'),(47,2,1,43,'Created User: Janilyn ','2018-10-30 07:12:57'),(48,2,1,43,'Created User: Gil-san','2018-10-30 07:14:50'),(49,3,2,43,'Updated User : Vicky ID(3)','2018-10-30 07:17:53'),(50,2,1,59,'Created User Group : Price Controller','2018-10-30 07:20:59'),(51,2,1,43,'Created User: Jem','2018-10-30 07:21:45'),(52,2,2,59,'Updated User Rights Links: ID(6)','2018-10-30 07:23:49'),(53,2,7,43,'User Log Out :Amelia  Lim','2018-10-30 07:26:51'),(54,3,1,52,'Created a new customer: A','2018-10-30 07:28:50'),(55,3,1,52,'Created a new customer: a','2018-10-30 07:29:49'),(56,3,3,52,'Deleted : various customer','2018-10-30 07:30:09'),(57,3,1,4,'Created Sales Journal Entry TXN-20181030-1','2018-10-30 07:32:08'),(58,4,6,43,'User Log in: Janilyn S Castillo','2018-10-30 07:34:21'),(59,4,1,51,'Created a Supplier: MARBY FOOD VENTURES CORPORATION','2018-10-30 07:37:00'),(60,3,1,52,'Created a new customer: a','2018-10-30 07:40:01'),(61,3,1,4,'Created Sales Journal Entry TXN-20181030-2','2018-10-30 07:48:11'),(62,4,1,51,'Created a Supplier: UNITED LINK PHARMACEUTICAL DISTRIBUTION','2018-10-30 07:51:41'),(63,2,6,43,'User Log in: Amelia  Lim','2018-10-30 08:00:18'),(64,2,2,59,'Updated User Rights Links: ID(3)','2018-10-30 08:01:19'),(65,3,7,43,'User Log Out :Victoria Garcia Tomas','2018-10-30 08:01:37'),(66,2,7,43,'User Log Out :Amelia  Lim','2018-10-30 08:01:40'),(67,3,6,43,'User Log in: Maria Victoria Garcia Tomas','2018-10-30 08:01:45'),(68,3,1,56,'Created a new Account : AR-Charges to staff-SMCT','2018-10-30 08:03:25'),(69,3,1,4,'Created Sales Journal Entry TXN-20181030-3','2018-10-30 08:04:22'),(70,3,1,52,'Created a new customer: A','2018-10-30 08:06:30'),(71,3,1,4,'Created Sales Journal Entry TXN-20181030-4','2018-10-30 08:08:47'),(72,0,10,43,'Login Attempt using username: admin','2018-10-30 08:10:20'),(73,3,1,56,'Created a new Account : AR-Charges to staff-BADS','2018-10-30 08:10:21'),(74,1,6,43,'User Log in: System Administrator ','2018-10-30 08:10:29'),(75,3,1,52,'Created a new customer: A','2018-10-30 08:11:24'),(76,3,1,4,'Created Sales Journal Entry TXN-20181030-5','2018-10-30 08:13:21'),(77,1,1,43,'Created User: jerry','2018-10-30 08:14:04'),(78,1,7,43,'User Log Out :System Administrator ','2018-10-30 08:14:22'),(79,7,6,43,'User Log in: jerry iglesia arellano','2018-10-30 08:14:42'),(80,7,2,43,'Updated User : jerry ID(7)','2018-10-30 08:15:22'),(81,7,1,59,'Created User Group : Treasury Supervisor','2018-10-30 08:17:25'),(82,7,2,59,'Updated User Rights Links: ID(7)','2018-10-30 08:20:06'),(83,7,1,59,'Created User Group : CD Clerk Treasury','2018-10-30 08:21:28'),(84,7,2,59,'Updated User Rights Links: ID(8)','2018-10-30 08:24:39'),(85,7,1,43,'Created User: Edison','2018-10-30 08:26:47'),(86,7,1,59,'Created User Group : Cash Receipts Clerk','2018-10-30 08:28:02'),(87,7,1,43,'Created User: James','2018-10-30 08:28:09'),(88,7,1,43,'Created User: Lloyd','2018-10-30 08:28:57'),(89,7,2,59,'Updated User Rights Links: ID(9)','2018-10-30 08:30:17'),(90,7,2,59,'Updated User Rights Links: ID(9)','2018-10-30 08:30:21'),(91,8,6,43,'User Log in: Edison  Corpuz','2018-10-30 08:32:06'),(92,8,2,43,'Updated User : Edison ID(8)','2018-10-30 08:34:09'),(93,8,7,43,'User Log Out :Edison  Corpuz','2018-10-30 08:34:25'),(94,8,6,43,'User Log in: Edison Ribaya Corpuz','2018-10-30 08:34:43'),(95,8,7,43,'User Log Out :Edison Ribaya Corpuz','2018-10-30 08:37:57'),(96,0,10,43,'Login Attempt using username: admin','2018-10-30 08:38:03'),(97,1,6,43,'User Log in: System Administrator ','2018-10-30 08:38:13'),(98,1,2,59,'Updated User Rights Links: ID(7)','2018-10-30 08:38:38'),(99,1,7,43,'User Log Out :System Administrator ','2018-10-30 08:38:41'),(100,8,6,43,'User Log in: Edison Ribaya Corpuz','2018-10-30 08:38:51'),(101,8,1,18,'Posted Payment No: 100014 to Collection Entry','2018-10-30 08:39:51'),(102,8,1,18,'Posted Payment No: 52525 to Collection Entry','2018-10-30 08:41:07'),(103,8,1,49,'Created Bank: chinabank','2018-10-30 08:45:23'),(104,8,1,6,'Created Cash Receipt Journal Entry TXN-20181030-6','2018-10-30 08:45:35'),(105,8,7,43,'User Log Out :Edison Ribaya Corpuz','2018-10-30 08:50:24'),(106,8,6,43,'User Log in: Edison Ribaya Corpuz','2018-10-30 08:50:41'),(107,1,6,43,'User Log in: System Administrator ','2018-10-30 09:00:21'),(108,1,1,43,'Created User: ylimej06','2018-10-30 09:01:59'),(109,1,7,43,'User Log Out :System Administrator ','2018-10-30 09:02:12'),(110,11,6,43,'User Log in: jemily  mamauag','2018-10-30 09:02:20'),(111,11,7,43,'User Log Out :jemily  mamauag','2018-10-30 09:04:08'),(112,6,6,43,'User Log in: Jem  Mamaoag','2018-10-30 09:04:14'),(113,4,7,43,'User Log Out :Janilyn S Castillo','2018-10-30 09:04:38'),(114,0,10,43,'Login Attempt using username: patrick','2018-10-30 09:04:58'),(115,0,10,43,'Login Attempt using username: victoria','2018-10-30 09:05:07'),(116,3,6,43,'User Log in: Maria Victoria Garcia Tomas','2018-10-30 09:05:12'),(117,6,2,43,'Updated User : Jem ID(6)','2018-10-30 09:05:15'),(118,6,7,43,'User Log Out :Jem  Mamaoag','2018-10-30 09:05:21'),(119,11,6,43,'User Log in: jemily  mamauag','2018-10-30 09:05:27'),(120,3,7,43,'User Log Out :Maria Victoria Garcia Tomas','2018-10-30 09:06:01'),(121,11,2,59,'Updated User Rights Links: ID(6)','2018-10-30 09:06:25'),(122,11,7,43,'User Log Out :jemily  mamauag','2018-10-30 09:06:32'),(123,6,6,43,'User Log in: Jem  Mamauag','2018-10-30 09:06:35'),(124,6,7,43,'User Log Out :Jem  Mamauag','2018-10-30 09:13:12'),(125,3,7,43,'User Log Out :Maria Victoria Garcia Tomas','2018-10-30 09:41:00'),(126,0,10,43,'Login Attempt using username: jdev','2018-11-01 04:34:24'),(127,1,6,43,'User Log in: System Administrator ','2018-11-01 04:34:30'),(128,1,6,43,'User Log in: System Administrator ','2018-11-05 00:33:10'),(129,0,10,43,'Login Attempt using username: admin','2018-11-05 02:22:29'),(130,1,1,43,'Created User: maryjanecampos','2018-11-05 02:23:09'),(131,1,7,43,'User Log Out :System Administrator ','2018-11-05 02:23:12'),(132,12,6,43,'User Log in: Mary Jane  Campos','2018-11-05 02:23:16'),(133,12,6,43,'User Log in: Mary Jane  Campos','2018-11-05 02:24:05'),(134,12,7,43,'User Log Out :Mary Jane  Campos','2018-11-05 02:42:09'),(135,0,10,43,'Login Attempt using username: EDISON RIBAYA CORPUZ','2018-11-06 03:36:21'),(136,0,10,43,'Login Attempt using username: EDISON RIBAYA CORPUZ','2018-11-06 03:36:32'),(137,0,10,43,'Login Attempt using username: EDISON RIBAYA CORPUZ','2018-11-06 03:36:35'),(138,0,10,43,'Login Attempt using username: edison ribaya corpuz','2018-11-06 03:36:53'),(139,0,10,43,'Login Attempt using username: edison ribaya corpuz','2018-11-06 03:37:07'),(140,0,10,43,'Login Attempt using username: EDISON RIBAYA CORPUZ','2018-11-06 03:37:37'),(141,0,10,43,'Login Attempt using username: EDISON RIBAYA CORPUZ','2018-11-06 03:37:40'),(142,0,10,43,'Login Attempt using username: admin','2018-11-06 13:38:40'),(143,1,6,43,'User Log in: System Administrator ','2018-11-06 13:38:44'),(144,1,2,60,'Modified Company Information','2018-11-06 13:40:50'),(145,1,1,56,'Created a new Account : Cash','2018-11-06 13:51:41'),(146,1,1,56,'Created a new Account : Cash in Bank - MBTC-SR #102-3-10250688-0','2018-11-06 13:52:29'),(147,1,1,56,'Created a new Account : Cash on Hand','2018-11-06 13:53:16'),(148,1,1,56,'Created a new Account : Petty Cash Fund','2018-11-06 13:53:41'),(149,1,2,56,'Updated Account : Petty Cash Fund ID(4)','2018-11-06 13:53:56'),(150,1,1,56,'Created a new Account : Revolving Fund','2018-11-06 13:54:08'),(151,1,1,45,'Created Category: 12','2018-11-06 14:04:58'),(152,1,1,47,'Created  Unit: 12','2018-11-06 14:05:02'),(153,1,1,50,'Created a new Product: 12','2018-11-06 14:05:09'),(154,1,1,11,'Created Purchase Order No: PO-20181106-1','2018-11-06 14:05:31'),(155,0,10,43,'Login Attempt using username: admin','2018-11-06 17:05:22'),(156,1,6,43,'User Log in: System Administrator ','2018-11-06 17:05:26'),(157,1,1,56,'Created a new Account : Accounts Receivable','2018-11-06 17:08:22'),(158,1,1,56,'Created a new Account : Supplies','2018-11-06 17:08:31'),(159,1,1,56,'Created a new Account : Prepaid Expenses','2018-11-06 17:10:02'),(160,1,1,56,'Created a new Account : Short Term Advances','2018-11-06 17:10:14'),(161,1,1,56,'Created a new Account : Short Term Advances - Salary Cash Advance','2018-11-06 17:10:27'),(162,1,1,56,'Created a new Account : Short Term Advances - Health Care','2018-11-06 17:10:44'),(163,1,1,56,'Created a new Account : Property and Equipment','2018-11-06 17:12:41'),(164,1,1,56,'Created a new Account : Land','2018-11-06 17:15:24'),(165,1,1,56,'Created a new Account : Leasehold Improvements','2018-11-06 17:15:40'),(166,1,1,56,'Created a new Account : Furniture and Fixtures','2018-11-06 17:16:03'),(167,1,1,56,'Created a new Account : Accumulated Depreciation - Furniture and Fixtures','2018-11-06 17:17:08'),(168,1,1,56,'Created a new Account : Equipment','2018-11-06 17:17:21'),(169,1,1,56,'Created a new Account : Accumulated Depreciation - Equipment','2018-11-06 17:17:36'),(170,1,1,56,'Created a new Account : Elevator','2018-11-06 17:17:58'),(171,1,1,56,'Created a new Account : Accumulated Depreciation - Elevator','2018-11-06 17:18:44'),(172,1,1,56,'Created a new Account : Long term Advances','2018-11-06 17:20:52'),(173,1,1,56,'Created a new Account : Accounts Payable','2018-11-06 17:21:09'),(174,1,1,56,'Created a new Account : Accounts Payable - PDC-MBTC SR','2018-11-06 17:21:38'),(175,1,1,56,'Created a new Account : Accrued Expenses','2018-11-06 17:21:52'),(176,1,1,56,'Created a new Account : Payable to SSS','2018-11-06 17:22:06'),(177,1,1,56,'Created a new Account : SSS Contribution Payable','2018-11-06 17:22:17'),(178,1,1,56,'Created a new Account : SSS Loan Payable','2018-11-06 17:22:27'),(179,1,1,56,'Created a new Account : Payable to HMDF/Pag-ibig','2018-11-06 17:23:14'),(180,1,1,56,'Created a new Account : HDMF/Pag-ibig Contribution Payable','2018-11-06 17:23:37'),(181,1,1,56,'Created a new Account : HDMF/Pag-ibig Loan Payable','2018-11-06 17:24:05'),(182,1,1,56,'Created a new Account : Phil.Health Contribution Payable','2018-11-06 17:24:21'),(183,1,1,56,'Created a new Account : Payable to BIR','2018-11-06 17:24:35'),(184,1,1,56,'Created a new Account : Withholding Tax Payable','2018-11-06 17:24:49'),(185,1,1,56,'Created a new Account : VAT Payable','2018-11-06 17:25:03'),(186,1,1,56,'Created a new Account : Income Tax Payable','2018-11-06 17:25:54'),(187,1,1,56,'Created a new Account : Cash Bond - Employees','2018-11-06 17:26:15'),(188,1,1,56,'Created a new Account : Meter Deposits','2018-11-06 17:26:27'),(189,1,1,56,'Created a new Account : Meter Deposits - Electric','2018-11-06 17:26:49'),(190,1,1,56,'Created a new Account : Meter Deposits - Water','2018-11-06 17:27:04'),(191,1,1,56,'Created a new Account : Share Capital','2018-11-06 17:28:23'),(192,1,1,56,'Created a new Account : Share Premium','2018-11-06 17:28:31'),(193,1,1,56,'Created a new Account : Retained Earnings','2018-11-06 17:28:40'),(194,1,1,56,'Created a new Account : INCOME','2018-11-06 17:30:31'),(195,1,1,56,'Created a new Account : RENTAL INCOME','2018-11-06 17:30:39'),(196,1,1,56,'Created a new Account : Monthly Rent Income','2018-11-06 17:30:56'),(197,1,1,56,'Created a new Account : CUSA','2018-11-06 17:31:12'),(198,1,1,56,'Created a new Account : Other Income','2018-11-06 17:31:24'),(199,1,1,56,'Created a new Account : Interest Income','2018-11-06 17:31:55'),(200,1,1,56,'Created a new Account : Penalties and Charges','2018-11-06 17:32:16'),(201,1,1,56,'Created a new Account : Job Orders','2018-11-06 17:32:32'),(202,1,1,56,'Created a new Account : EXPENSES','2018-11-06 17:34:20'),(203,1,1,56,'Created a new Account : Purchases','2018-11-06 17:34:33'),(204,1,1,56,'Created a new Account : Purchases Return','2018-11-06 17:34:46'),(205,1,1,56,'Created a new Account : Purchases Discount','2018-11-06 17:35:00'),(206,1,1,56,'Created a new Account : Salaries and Wages','2018-11-06 17:35:11'),(207,1,1,56,'Created a new Account : 13th Month Pay','2018-11-06 17:35:28'),(208,1,1,56,'Created a new Account : Government Contributions','2018-11-06 17:35:43'),(209,1,1,56,'Created a new Account : SSS ECC Contribution','2018-11-06 17:35:55'),(210,1,1,56,'Created a new Account : HDMF/Pag-ibig Fund Premium','2018-11-06 17:36:08'),(211,1,1,56,'Created a new Account : Phil. Health Premium','2018-11-06 17:36:31'),(212,1,1,56,'Created a new Account : Utitilies Expense','2018-11-06 17:38:32'),(213,1,1,56,'Created a new Account : Utilities - Electricity','2018-11-06 17:39:20'),(214,1,1,56,'Created a new Account : Utilities - Telephone and Telegraph','2018-11-06 17:43:57'),(215,1,1,56,'Created a new Account : Utilities - Water','2018-11-06 17:44:12'),(216,1,1,56,'Created a new Account : Ads and Promo','2018-11-06 17:44:25'),(217,1,1,56,'Created a new Account : Advertising Expense','2018-11-06 17:44:38'),(218,1,1,56,'Created a new Account : Magic Card Classic - Free','2018-11-06 17:44:50'),(219,1,1,56,'Created a new Account : Taxes and Licenses','2018-11-06 17:45:49'),(220,1,1,56,'Created a new Account : Business Permits','2018-11-06 17:46:00'),(221,1,1,56,'Created a new Account : Barangay Permit','2018-11-06 17:46:14'),(222,1,1,56,'Created a new Account : Mayor\'s Permit','2018-11-06 17:46:32'),(223,1,2,56,'Updated Account : Barangay Permit ID(70)','2018-11-06 17:46:58'),(224,1,1,56,'Created a new Account : Income Tax Expense','2018-11-06 17:47:50'),(225,1,1,56,'Created a new Account : Real Property Taxes','2018-11-06 17:48:03'),(226,1,1,56,'Created a new Account : Agency Fee','2018-11-06 17:48:20'),(227,1,1,56,'Created a new Account : Manpower Agency Fee','2018-11-06 17:48:31'),(228,1,1,56,'Created a new Account : Security Agency Fee','2018-11-06 17:48:43'),(229,1,1,56,'Created a new Account : Other Expenses','2018-11-06 17:50:47'),(230,1,1,56,'Created a new Account : Commission Expense','2018-11-06 17:51:09'),(231,1,1,56,'Created a new Account : Director\'s Fee','2018-11-06 17:51:19'),(232,1,1,56,'Created a new Account : Gas, Fuel and Oil','2018-11-06 17:51:27'),(233,1,1,56,'Created a new Account : Insurance Expense','2018-11-06 17:51:38'),(234,1,2,56,'Updated Account : Director\'s Fee ID(79)','2018-11-06 17:52:14'),(235,1,2,56,'Updated Account : Gas, Fuel and Oil ID(80)','2018-11-06 17:52:29'),(236,1,1,56,'Created a new Account : Professional Fee','2018-11-06 17:52:51'),(237,1,1,56,'Created a new Account : Repairs and Maintenance','2018-11-06 17:53:02'),(238,1,1,56,'Created a new Account : Representation Expense','2018-11-06 17:53:16'),(239,1,1,56,'Created a new Account : Training and Development','2018-11-06 17:53:33'),(240,1,1,56,'Created a new Account : Transportation Expense','2018-11-06 17:53:45'),(241,0,10,43,'Login Attempt using username: admin','2018-11-07 08:41:55'),(242,1,6,43,'User Log in: System Administrator ','2018-11-07 08:41:58'),(243,1,1,56,'Created a new Account : Prepaid Income Tax','2018-11-07 09:21:14'),(244,1,1,56,'Created a new Account : Input Tax','2018-11-07 09:22:13'),(245,1,1,56,'Created a new Account : Cost of Goods Sold','2018-11-07 09:22:40'),(246,1,2,57,'Updated Supplier Configuration','2018-11-07 09:25:28'),(247,1,2,57,'Updated Supplier Configuration','2018-11-07 09:25:40'),(248,1,1,56,'Created a new Account : Output Tax','2018-11-07 09:27:50'),(249,1,2,57,'Updated System General Configuration Customer','2018-11-07 09:28:30'),(250,1,2,57,'Updated System General Configuration','2018-11-07 09:29:15'),(251,1,2,58,'Updated System Purchasing Configuration Adjustments','2018-11-07 09:29:34'),(252,1,2,58,'Updated System Purchasing Configuration Item Transfer','2018-11-07 09:29:41');
/*!40000 ALTER TABLE `trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans_key`
--

DROP TABLE IF EXISTS `trans_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trans_key` (
  `trans_key_id` bigint(20) NOT NULL,
  `trans_key_desc` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`trans_key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans_key`
--

LOCK TABLES `trans_key` WRITE;
/*!40000 ALTER TABLE `trans_key` DISABLE KEYS */;
INSERT INTO `trans_key` VALUES (1,'Create'),(2,'Update'),(3,'Delete'),(4,'Cancel'),(6,'Log In'),(7,'Log Out'),(8,'Finalize'),(9,'Uncancel'),(10,'Login Attempts');
/*!40000 ALTER TABLE `trans_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans_type`
--

DROP TABLE IF EXISTS `trans_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trans_type` (
  `trans_type_id` bigint(20) NOT NULL,
  `trans_type_desc` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans_type`
--

LOCK TABLES `trans_type` WRITE;
/*!40000 ALTER TABLE `trans_type` DISABLE KEYS */;
INSERT INTO `trans_type` VALUES (1,'General Journal'),(2,'Cash Disbursement'),(3,'Purchase Journal'),(4,'Sales Journal'),(5,'Petty Cash Journal'),(6,'Cash Receipt Journal'),(7,'Service Invoice'),(8,'Service Journal'),(9,'Service Unit'),(10,'Services'),(11,'Purchase Order'),(12,'Purchase Invoice'),(13,'Record Payment'),(14,'Item Issuance'),(15,'Item Adjustment'),(16,'Sales Order'),(17,'Sales Invoice'),(18,'Collection Entry'),(43,'User Accounts'),(44,'Account Classification'),(45,'Category Management'),(46,'Department Management'),(47,'Unit Management'),(48,'Locations Management'),(49,'Bank Management'),(50,'Product Management'),(51,'Supplier Management'),(52,'Customer Management'),(53,'Salesperson Management'),(54,'Fixed Asset Management'),(55,'Setup Tax'),(56,'Setup Chart of Accounts'),(57,'General Configuration'),(58,'Purchasing Configuration'),(59,'User Rights'),(60,'Company Info'),(61,'Check Layout'),(62,'Recurring Template'),(63,'Email Settings'),(64,'Email Report Settings'),(65,'Cash Invoice'),(66,'Issuance to Department'),(67,'Order Source'),(68,'Job Order');
/*!40000 ALTER TABLE `trans_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `unit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unit_code` bigint(20) DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  `unit_desc` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,NULL,'12','12',NULL,'0000-00-00 00:00:00','\0','');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_accounts` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT '',
  `user_pword` varchar(500) DEFAULT '',
  `user_lname` varchar(100) DEFAULT '',
  `user_fname` varchar(100) DEFAULT '',
  `user_mname` varchar(100) DEFAULT '',
  `user_address` varchar(155) DEFAULT '',
  `user_email` varchar(100) DEFAULT '',
  `user_mobile` varchar(100) DEFAULT '',
  `user_telephone` varchar(100) DEFAULT '',
  `user_bdate` date DEFAULT '0000-00-00',
  `user_group_id` int(11) DEFAULT '0',
  `photo_path` varchar(555) DEFAULT '',
  `file_directory` varchar(666) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_online` tinyint(4) DEFAULT '0',
  `last_seen` datetime DEFAULT NULL,
  `token_id` text NOT NULL,
  `user_department` bigint(20) DEFAULT '0',
  `journal_prepared_by` varchar(145) DEFAULT '',
  `journal_approved_by` varchar(145) DEFAULT '',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accounts`
--

LOCK TABLES `user_accounts` WRITE;
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` VALUES (1,'admin','47b4fc9be4e05deb697b109001519b4b2f96455f','','System','Administrator','Angeles City, Pampanga','jdevtechsolution@gmail.com','0955-283-3018','','0000-00-00',1,'assets/img/user/5a5c0f806f8d9.png',NULL,'','\0',NULL,'2018-11-07 02:17:28',0,0,0,0,1,'2018-11-07 10:17:28','240f018cde482e6ff913dc3db4646f8b',0,'',''),(2,'mellim','356a192b7913b04c54574d18c28d46e6395428ab','Lim','Amelia','','','','','','2018-10-30',1,'assets/img/anonymous-icon.png',NULL,'','\0','2018-10-30 06:30:22','2018-10-30 08:01:40',0,0,1,0,0,'2018-10-30 16:00:33','7f0aa05d18dbab239eadb0873e7eb903',0,'',''),(3,'Vicky','356a192b7913b04c54574d18c28d46e6395428ab','Tomas','Maria Victoria','Garcia','','victoria.tomas16@yahoo.com','','470-81-51','1993-04-16',3,'assets/img/anonymous-icon.png',NULL,'','\0','2018-10-30 07:11:32','2018-10-30 09:06:01',0,3,2,0,0,'2018-10-30 17:05:54','48e6106cf03202bb6bac9fa3e035fc12',0,'Maria Victoria G. Tomas','Amelia T. Lim'),(4,'Janilyn ','356a192b7913b04c54574d18c28d46e6395428ab','Castillo','Janilyn','S','','','','','1970-01-01',2,'assets/img/anonymous-icon.png',NULL,'','\0','2018-10-30 07:12:57','2018-10-30 09:04:38',0,0,2,0,0,'2018-10-30 17:03:56','dd2ab24cff18cb257122703096a77140',0,'Janilyn S. Castillo','Amelia T. Lim'),(5,'Gil-san','356a192b7913b04c54574d18c28d46e6395428ab','Balagtas','Gil-san','Rafol','','','','','1970-01-01',4,'assets/img/anonymous-icon.png',NULL,'','\0','2018-10-30 07:14:50','0000-00-00 00:00:00',0,0,2,0,0,NULL,'',0,'Gil-san R. Balagtas','Amelia T. Lim'),(6,'Jem','356a192b7913b04c54574d18c28d46e6395428ab','Mamauag','Jem','','','','','','1970-01-01',6,'assets/img/anonymous-icon.png',NULL,'','\0','2018-10-30 07:21:45','2018-10-30 09:13:12',0,6,2,0,0,'2018-10-30 17:12:21','c1afc6f9b278be151938284aee9d7431',0,'',''),(7,'jerry','5b405f2e05623e3f27f90b167c8dc336b7fed8bc','arellano','jerry','iglesia','','','','','2018-10-30',1,'assets/img/anonymous-icon.png',NULL,'','\0','2018-10-30 08:14:04','2018-10-30 08:29:15',0,7,1,0,1,'2018-10-30 16:29:15','4d55f0c62368acf62499d362654918f4',0,'',''),(8,'Edison','8e6cad7c1598cdf370ad2a50f09f02f26de56dcf','Corpuz','Edison','Ribaya','','','','','2018-10-30',7,'assets/img/anonymous-icon.png',NULL,'','\0','2018-10-30 08:26:47','2018-10-30 08:56:25',0,8,7,0,1,'2018-10-30 16:56:25','78b60030c2b8d73b402523dde9904c88',0,'',''),(9,'James','356a192b7913b04c54574d18c28d46e6395428ab','Gonzales','James','','','','','','1970-01-01',9,'assets/img/anonymous-icon.png',NULL,'','\0','2018-10-30 08:28:09','0000-00-00 00:00:00',0,0,7,0,0,NULL,'',0,'',''),(10,'Lloyd','356a192b7913b04c54574d18c28d46e6395428ab','Mugas','Lloyd','','','','','','1970-01-01',8,'assets/img/anonymous-icon.png',NULL,'','\0','2018-10-30 08:28:57','0000-00-00 00:00:00',0,0,7,0,0,NULL,'',0,'',''),(11,'ylimej06','5efb35a6b5eb00b780bd59180807d728ed930738','mamauag','jemily','','','','','','2018-10-30',1,'assets/img/anonymous-icon.png',NULL,'','\0','2018-10-30 09:01:59','2018-10-30 09:06:32',0,0,1,0,0,'2018-10-30 17:05:50','297a8232e266844bffe787ff9dfb576d',0,'',''),(12,'maryjanecampos','7eb84db75ee44445c2fc958aab5072c612545973','Campos','Mary Jane','','','','','','2018-11-05',1,'assets/img/anonymous-icon.png',NULL,'','\0','2018-11-05 02:23:09','2018-11-05 03:59:48',0,0,1,0,1,'2018-11-05 11:59:48','395ef0a0ecc15d2b237aaa6ff1812a63',0,'','');
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_rights`
--

DROP TABLE IF EXISTS `user_group_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_rights` (
  `user_rights_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) DEFAULT '0',
  `link_code` varchar(20) DEFAULT '',
  PRIMARY KEY (`user_rights_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_rights`
--

LOCK TABLES `user_group_rights` WRITE;
/*!40000 ALTER TABLE `user_group_rights` DISABLE KEYS */;
INSERT INTO `user_group_rights` VALUES (1,1,'1-1'),(2,1,'1-2'),(3,1,'1-3'),(4,1,'1-4'),(5,1,'1-5'),(6,1,'2-1'),(7,1,'2-2'),(8,1,'2-3'),(10,1,'15-3'),(11,1,'3-1'),(12,1,'3-2'),(13,1,'3-3'),(14,1,'4-2'),(15,1,'4-3'),(16,1,'4-4'),(17,1,'5-1'),(18,1,'5-2'),(19,1,'5-3'),(20,1,'6-1'),(21,1,'6-2'),(22,1,'6-3'),(23,1,'6-4'),(24,1,'6-5'),(25,1,'6-6'),(26,1,'7-1'),(27,1,'9-1'),(28,1,'9-2'),(29,1,'4-1'),(30,1,'8-1'),(31,1,'15-4'),(32,1,'5-4'),(33,1,'2-6'),(34,1,'8-3'),(35,1,'9-3'),(36,1,'6-7'),(37,1,'9-4'),(38,1,'9-6'),(39,1,'9-8'),(40,1,'9-7'),(41,1,'9-5'),(42,1,'8-4'),(43,1,'4-5'),(44,1,'10-1'),(45,1,'9-9'),(46,1,'6-8'),(47,1,'9-10'),(48,1,'1-6'),(49,1,'9-13'),(50,1,'6-9'),(51,1,'9-14'),(52,1,'9-16'),(53,1,'4-6'),(54,1,'10-2'),(55,1,'11-1'),(57,1,'12-1'),(58,1,'12-2'),(59,1,'12-3'),(60,1,'12-4'),(61,1,'12-5'),(62,1,'9-11'),(63,1,'9-15'),(64,1,'9-12'),(65,1,'13-1'),(66,1,'13-2'),(67,1,'13-3'),(68,1,'13-4'),(69,1,'9-17'),(70,1,'9-18'),(71,1,'9-19'),(72,1,'6-10'),(73,1,'14-1'),(74,1,'9-20'),(75,1,'9-21'),(76,1,'6-11'),(77,1,'12-6'),(78,1,'12-7'),(79,1,'2-8'),(80,1,'2-7'),(82,1,'15-1'),(83,1,'3-4'),(84,1,'6-13'),(85,1,'15-5'),(86,1,'15-6'),(87,1,'3-5'),(88,1,'4-7'),(89,1,'2-9'),(90,1,'14-2'),(91,1,'14-3'),(92,1,'14-4'),(93,1,'16-1'),(94,1,'16-2'),(95,1,'16-3'),(96,1,'6-14'),(97,1,'17-1'),(98,1,'17-2'),(99,1,'17-3'),(123,4,'1-1'),(124,4,'1-2'),(125,4,'1-6'),(126,4,'9-13'),(127,4,'9-20'),(128,4,'12-1'),(129,5,'1-6'),(130,5,'9-13'),(131,5,'9-20'),(132,2,'1-3'),(133,2,'2-3'),(134,2,'2-7'),(135,2,'2-8'),(136,2,'2-9'),(137,2,'5-2'),(138,2,'9-5'),(139,2,'9-7'),(140,2,'16-3'),(144,3,'1-4'),(145,3,'5-3'),(146,3,'6-2'),(147,3,'9-4'),(148,3,'9-6'),(149,3,'9-8'),(150,3,'9-15'),(151,3,'9-17'),(152,3,'9-19'),(161,8,'1-2'),(162,8,'12-1'),(163,8,'12-2'),(164,8,'14-1'),(165,8,'14-2'),(166,8,'14-3'),(167,8,'14-4'),(170,9,'1-5'),(171,9,'3-3'),(172,7,'1-2'),(173,7,'1-5'),(174,7,'3-3'),(175,7,'12-1'),(176,7,'12-2'),(177,7,'14-1'),(178,7,'14-2'),(179,7,'14-3'),(180,7,'14-4'),(181,6,'6-4'),(182,6,'6-5'),(183,6,'16-1'),(184,6,'16-2'),(185,6,'16-3');
/*!40000 ALTER TABLE `user_group_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group` varchar(135) DEFAULT '',
  `user_group_desc` varchar(500) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'System Administrator','Can access all features.','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'AP Clerk','AP Clerk','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'AR Clerk','AR Clerk','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'CD Clerk-Acctg','CD Clerk-Acctg','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Petty cash Custodian','Petty cash Custodian','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Price Controller','Price Controller','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'Treasury Supervisor','Treasury Supervisor','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'CD Clerk Treasury','CD Clerk Treasury','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'Cash Receipts Clerk','','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'smct_11062018'
--

--
-- Dumping routines for database 'smct_11062018'
--
/*!50003 DROP FUNCTION IF EXISTS `CreateBillingNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CreateBillingNo`() RETURNS varchar(20) CHARSET latin1
BEGIN
	DECLARE vCtrLastVal DOUBLE;
    DECLARE vCurrentYear VARCHAR(5);

    SET vCurrentYear=CAST(YEAR(NOW())as CHAR); 
    SET vCtrLastVal=(SELECT IFNULL(MAX(m.Ctr),0)+1 FROM
    	(
    		SELECT MAX(CAST(SUBSTRING(billing_no,9,6) AS UNSIGNED))as Ctr
        	FROM b_billing_info
    	)
    	as m);
  RETURN CONCAT(vCurrentYear,'-BN-',LPAD(vCtrLastVal,6,0));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CreateContractNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CreateContractNo`() RETURNS varchar(20) CHARSET latin1
BEGIN
	DECLARE vCtrLastVal DOUBLE;
    DECLARE vCurrentYear VARCHAR(5);

    SET vCurrentYear=CAST(YEAR(NOW())as CHAR); 
    SET vCtrLastVal=(SELECT IFNULL(MAX(m.Ctr),0)+1 FROM
    	(
    		SELECT MAX(CAST(SUBSTRING(contract_no,9,6) AS UNSIGNED))as Ctr
        	FROM b_contract_info
    	)
    	as m);
  RETURN CONCAT(vCurrentYear,'-CN-',LPAD(vCtrLastVal,6,0));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CreateTenantCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CreateTenantCode`() RETURNS varchar(20) CHARSET latin1
BEGIN
	DECLARE vCtrLastVal DOUBLE;
    DECLARE vCurrentYear VARCHAR(5);

    SET vCurrentYear=CAST(YEAR(NOW())as CHAR); 
    SET vCtrLastVal=(SELECT IFNULL(MAX(m.Ctr),0)+1 FROM
    	(
    		SELECT MAX(CAST(SUBSTRING(tenant_code,9,6) AS UNSIGNED))as Ctr
        	FROM b_tenants
    	)
    	as m);
  RETURN CONCAT(vCurrentYear,'-TC-',LPAD(vCtrLastVal,6,0));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CreateTransactionNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CreateTransactionNo`() RETURNS varchar(20) CHARSET latin1
BEGIN
	DECLARE vCtrLastVal DOUBLE;
    DECLARE vCurrentYear VARCHAR(5);

    SET vCurrentYear=CAST(YEAR(NOW())as CHAR); 
    SET vCtrLastVal=(SELECT IFNULL(MAX(m.Ctr),0)+1 FROM
    	(
    		SELECT MAX(CAST(SUBSTRING(transaction_no,9,6) AS UNSIGNED))as Ctr
        	FROM b_payment_info
    	)
    	as m);
  RETURN CONCAT(vCurrentYear,'-TN-',LPAD(vCtrLastVal,6,0));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetAsOfBalance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetAsOfBalance`(month_id INT, app_year INT, tenant_id INT) RETURNS decimal(20,5)
BEGIN
	DECLARE prevBalance DOUBLE;
    SET prevBalance=(SELECT IFNULL(as_of_bal,0) FROM
    	(
    		SELECT
				(SUM(IFNULL(total_amount_due, 0)) + SUM(IFNULL(total_adjusted_in, 0)) - SUM(IFNULL(total_adjusted_out, 0))) - IFNULL(A.amount_paid,0) as as_of_bal
			FROM b_billing_info as bi
			LEFT JOIN (SELECT 
							billing_id,
							IFNULL(SUM(pd.amount_paid), 0) + IFNULL(SUM(pd.discount),0) as amount_paid
						FROM b_payment_details as pd
						LEFT JOIN b_payment_info as pi ON pi.payment_id = pd.payment_id
						WHERE pi.payment_date < DATE(DATE_ADD(CONCAT(app_year, "-", month_id, "-21"), INTERVAL -1 MONTH)) AND
                        pi.is_canceled = 0) as A using(billing_id)
			WHERE
				DATE(CONCAT(bi.app_year,  "-", bi.month_id, "-01")) < DATE(CONCAT(app_year, "-", month_id, "-01")) AND
				bi.tenant_id = 2 AND
				bi.is_deleted = 0
					)
    	as m);
  RETURN prevBalance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetPreviousBalance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPreviousBalance`(month_id INT, app_year INT, tenant_id INT) RETURNS decimal(20,5)
BEGIN
	DECLARE prevBalance DOUBLE;
    SET prevBalance=(SELECT IFNULL(prev_bal,0) FROM
    	(
    		SELECT 
				SUM(IFNULL(total_amount_due, 0)) + SUM(IFNULL(total_adjusted_in, 0)) - SUM(IFNULL(total_adjusted_out, 0)) - IFNULL(A.amount_paid, 0) as prev_bal
        	FROM b_billing_info as bi
            LEFT JOIN (SELECT 
							billing_id,
							SUM(IFNULL(pd.amount_paid, 0)) + SUM(IFNULL(pd.discount, 0)) as amount_paid
						FROM b_payment_details as pd
                        LEFT JOIN b_payment_info as pi ON pi.payment_id = pd.payment_id
                        WHERE pi.payment_date < DATE(CONCAT(app_year, "-", month_id, "-21")) AND
                        pi.is_canceled = 0) as A using(billing_id)
            WHERE
				DATE(CONCAT(bi.app_year,  "-", bi.month_id, "-01")) < DATE(CONCAT(app_year, "-", month_id, "-01")) AND
                bi.tenant_id = tenant_id AND
                bi.is_deleted = 0
    	)
    	as m);
  RETURN prevBalance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-18 10:04:52
