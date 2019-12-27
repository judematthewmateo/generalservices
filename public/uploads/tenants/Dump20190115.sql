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
-- Table structure for table `b_adjustments`
--

DROP TABLE IF EXISTS `b_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_adjustments` (
  `adjustment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_no` varchar(255) NOT NULL DEFAULT '',
  `tenant_id` int(11) NOT NULL DEFAULT '0',
  `period_id` int(11) NOT NULL DEFAULT '0',
  `month_id` int(11) NOT NULL DEFAULT '0',
  `app_year` int(11) NOT NULL DEFAULT '0',
  `adjustment_type` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `notes` varchar(500) DEFAULT '',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adjustment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `discounted_total_amount_due` decimal(15,5) DEFAULT '0.00000',
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_company_settings`
--

DROP TABLE IF EXISTS `b_company_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_company_settings` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(345) DEFAULT '',
  `company_address` varchar(500) DEFAULT '',
  `email_address` varchar(245) DEFAULT '',
  `mobile_number` varchar(145) DEFAULT '',
  `landline` varchar(145) DEFAULT '',
  `logo` varchar(1000) DEFAULT '',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `contract_advance_rent` decimal(15,5) DEFAULT '0.00000',
  `power_meter_deposit` decimal(15,5) DEFAULT '0.00000',
  `security_deposit` decimal(15,5) DEFAULT '0.00000',
  `water_meter_deposit` decimal(15,5) DEFAULT '0.00000',
  `construction_deposit` decimal(15,5) DEFAULT '0.00000',
  `contract_escalation_percent` decimal(15,5) DEFAULT '0.00000',
  `contract_floor_area` decimal(15,5) DEFAULT '0.00000',
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `sort_key` int(11) DEFAULT '0',
  PRIMARY KEY (`contract_misc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `sort_key` int(11) DEFAULT '0',
  PRIMARY KEY (`contract_othr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `sort_key` int(11) DEFAULT '0',
  PRIMARY KEY (`contract_util_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_module_list`
--

DROP TABLE IF EXISTS `b_module_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module_list` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(145) DEFAULT '',
  `module_group` varchar(145) DEFAULT '',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_module_rights`
--

DROP TABLE IF EXISTS `b_module_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module_rights` (
  `module_right_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(11) DEFAULT NULL,
  `right_desc` varchar(45) DEFAULT '',
  PRIMARY KEY (`module_right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_user_groups`
--

DROP TABLE IF EXISTS `b_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_groups` (
  `user_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_group` varchar(145) NOT NULL DEFAULT '',
  `user_group_desc` varchar(245) NOT NULL DEFAULT '',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Dumping events for database 'smct_11062018'
--

--
-- Dumping routines for database 'smct_11062018'
--
/*!50003 DROP FUNCTION IF EXISTS `CreateAdjustmentNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CreateAdjustmentNo`() RETURNS varchar(20) CHARSET latin1
BEGIN
	DECLARE vCtrLastVal DOUBLE;
    DECLARE vCurrentYear VARCHAR(5);

    SET vCurrentYear=CAST(YEAR(NOW())as CHAR); 
    SET vCtrLastVal=(SELECT IFNULL(MAX(m.Ctr),0)+1 FROM
    	(
    		SELECT MAX(CAST(SUBSTRING(adjustment_no,10,7) AS UNSIGNED))as Ctr
        	FROM b_adjustments
    	)
    	as m);
  RETURN CONCAT(vCurrentYear,'-ADJ-',LPAD(vCtrLastVal,6,0));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
						WHERE pi.payment_date < DATE(DATE_ADD(CONCAT(app_year, "-", month_id, "-9"), INTERVAL -1 MONTH)) AND
                        pi.is_canceled = 0 AND pi.tenant_id = tenant_id) as A using(billing_id)
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
/*!50003 DROP FUNCTION IF EXISTS `GetLatePayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetLatePayment`(month_id INT, app_year INT, tenant_id INT) RETURNS decimal(20,5)
BEGIN
	DECLARE latePayment DOUBLE;
    SET latePayment=(SELECT IFNULL(late_payment,0) FROM
    	(
    		SELECT
				SUM(IFNULL(amount_paid, 0)) as late_payment
			FROM b_payment_info as pi
			WHERE
				payment_date BETWEEN DATE(DATE_ADD(CONCAT(app_year, "-", month_id, "-21"), INTERVAL -1 MONTH)) AND DATE(DATE_ADD(CONCAT(app_year, "-", month_id, "-28"), INTERVAL -1 MONTH)) AND
				pi.tenant_id = tenant_id AND
				pi.is_canceled = 0
					)
    	as m);
  RETURN latePayment;
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
                        WHERE pi.payment_date < DATE(DATE_ADD(CONCAT(app_year, "-", month_id, "-28"), INTERVAL -1 MONTH)) AND
                        pi.is_canceled = 0 AND pi.tenant_id = tenant_id) as A using(billing_id)
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

-- Dump completed on 2019-01-15 16:19:49
