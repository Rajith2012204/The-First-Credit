-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.12 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for first_credit
DROP DATABASE IF EXISTS `first_credit`;
CREATE DATABASE IF NOT EXISTS `first_credit` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `first_credit`;


-- Dumping structure for table first_credit.fc_customer
DROP TABLE IF EXISTS `fc_customer`;
CREATE TABLE IF NOT EXISTS `fc_customer` (
  `customer_id` varchar(20) NOT NULL,
  `salutaion_id` varchar(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(1) NOT NULL COMMENT 'Male -M\\\\\\\\nFemale - F',
  `id_type` varchar(100) DEFAULT NULL,
  `customer_identification_no` varchar(255) DEFAULT NULL,
  `issude_country` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `no_of_family_members` varchar(2) DEFAULT NULL,
  `no_of_dependents` varchar(2) DEFAULT NULL,
  `first_address` varchar(255) DEFAULT NULL,
  `second_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `image_id` varchar(20) DEFAULT NULL,
  `description` text,
  `modified_by` varchar(20) NOT NULL,
  `modified_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `comments` tinytext,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `FK_fc_customer_fc_image_bank` (`image_id`),
  CONSTRAINT `FK_fc_customer_fc_image_bank` FOREIGN KEY (`image_id`) REFERENCES `fc_image_bank` (`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_customer: ~1 rows (approximately)
/*!40000 ALTER TABLE `fc_customer` DISABLE KEYS */;
INSERT INTO `fc_customer` (`customer_id`, `salutaion_id`, `first_name`, `middle_name`, `last_name`, `date_of_birth`, `gender`, `id_type`, `customer_identification_no`, `issude_country`, `occupation`, `no_of_family_members`, `no_of_dependents`, `first_address`, `second_address`, `city`, `province`, `image_id`, `description`, `modified_by`, `modified_date`, `status`, `comments`, `added_by`, `added_date`) VALUES
	('1000001', 'Mr.', '1231', '1231', '23123', '1971-02-18', '1', 'NIC', NULL, 'asda', 'asdasd', '1', '1', 'asdas', '', 'asddas', 'asdas', NULL, NULL, 'admin', '2017-02-20 10:47:10', 'Active', NULL, 'admin', '2017-02-20 10:47:10');
/*!40000 ALTER TABLE `fc_customer` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_customer_contact
DROP TABLE IF EXISTS `fc_customer_contact`;
CREATE TABLE IF NOT EXISTS `fc_customer_contact` (
  `customer_id` varchar(20) NOT NULL,
  `contact_category` varchar(20) NOT NULL,
  `contact_type` varchar(20) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `description` text,
  `modified_by` varchar(20) NOT NULL,
  `modified_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`contact_type`,`contact_category`),
  CONSTRAINT `FK_fc_customer_contact_fc_customer` FOREIGN KEY (`customer_id`) REFERENCES `fc_customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_customer_contact: ~2 rows (approximately)
/*!40000 ALTER TABLE `fc_customer_contact` DISABLE KEYS */;
INSERT INTO `fc_customer_contact` (`customer_id`, `contact_category`, `contact_type`, `contact`, `description`, `modified_by`, `modified_date`, `status`, `added_by`, `added_date`) VALUES
	('1000001', 'Primary', 'Email', 'asdas@gmail.com', NULL, 'admin', '2017-02-20', 'Active', 'admin', '2017-02-20 10:47:10'),
	('1000001', 'Primary', 'Telephone', '1231231', NULL, 'admin', '2017-02-20', 'Active', 'admin', '2017-02-20 10:47:10');
/*!40000 ALTER TABLE `fc_customer_contact` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_employee
DROP TABLE IF EXISTS `fc_employee`;
CREATE TABLE IF NOT EXISTS `fc_employee` (
  `employee_id` varchar(20) NOT NULL,
  `employee_category_id` varchar(45) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `nationality_id` varchar(20) NOT NULL,
  `salutaion_id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(1) NOT NULL COMMENT 'Male - M\\nFemal - F',
  `image_id` varchar(20) DEFAULT NULL,
  `date_joined` date NOT NULL,
  `nic_no` varchar(20) DEFAULT NULL,
  `primary_address` varchar(255) DEFAULT NULL,
  `tel_no` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime DEFAULT NULL,
  `modified_by` varchar(20) NOT NULL,
  `modified_date` date NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `FK_fc_employee_fsms_image_bank` FOREIGN KEY (`image_id`) REFERENCES `fc_image_bank` (`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_employee: ~1 rows (approximately)
/*!40000 ALTER TABLE `fc_employee` DISABLE KEYS */;
INSERT INTO `fc_employee` (`employee_id`, `employee_category_id`, `job_title`, `nationality_id`, `salutaion_id`, `first_name`, `middle_name`, `last_name`, `date_of_birth`, `gender`, `image_id`, `date_joined`, `nic_no`, `primary_address`, `tel_no`, `email`, `description`, `status`, `added_by`, `added_date`, `modified_by`, `modified_date`) VALUES
	('E001', 'staff', 'Admin', 'Sri Lankan', 'Mr.', 'Super', NULL, 'Admin', '2017-02-12', '1', NULL, '2017-02-12', NULL, NULL, NULL, NULL, NULL, 'Active', 'admin', '2017-02-12 02:45:53', 'admin', '2017-02-12');
/*!40000 ALTER TABLE `fc_employee` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_group
DROP TABLE IF EXISTS `fc_group`;
CREATE TABLE IF NOT EXISTS `fc_group` (
  `group_id` varchar(50) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `date_of_establishment` datetime NOT NULL,
  `employee` varchar(20) NOT NULL COMMENT 'group_officer',
  `meeting_date` datetime NOT NULL,
  `branch` varchar(100) NOT NULL,
  `primary_address` varchar(255) DEFAULT NULL,
  `primary_contact` varchar(255) DEFAULT NULL,
  `description` text,
  `status` varchar(20) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  `modified_by` varchar(20) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `FK_fc_group_fc_employee` (`employee`),
  CONSTRAINT `FK_fc_group_fc_employee` FOREIGN KEY (`employee`) REFERENCES `fc_employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_group: ~3 rows (approximately)
/*!40000 ALTER TABLE `fc_group` DISABLE KEYS */;
INSERT INTO `fc_group` (`group_id`, `group_name`, `date_of_establishment`, `employee`, `meeting_date`, `branch`, `primary_address`, `primary_contact`, `description`, `status`, `added_by`, `added_date`, `modified_by`, `modified_date`) VALUES
	('GRP001', 'group 1', '2017-02-28 00:00:00', 'E001', '2017-02-21 00:00:00', 'nugegoda', '02/21/2017', '0775944833', 'asdas', 'Active', 'admin', '2017-02-20 00:04:34', 'admin', '2017-02-20 00:04:34'),
	('GRP002', 'group 2', '2017-02-15 00:00:00', 'E001', '2017-02-14 00:00:00', 'Maharagama', '02/14/2017', '972423423', 'asd', 'Active', 'admin', '2017-02-20 00:07:39', 'admin', '2017-02-20 00:07:39'),
	('GRP003', 'group 3', '2017-03-01 00:00:00', 'E001', '2017-02-22 00:00:00', 'Mahara', '02/22/2017', '1231231', 'asda', 'Active', 'admin', '2017-02-20 00:09:46', 'admin', '2017-02-20 00:09:46');
/*!40000 ALTER TABLE `fc_group` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_image_bank
DROP TABLE IF EXISTS `fc_image_bank`;
CREATE TABLE IF NOT EXISTS `fc_image_bank` (
  `image_id` varchar(20) NOT NULL,
  `image_type_id` varchar(20) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `description` text,
  `status` varchar(20) NOT NULL,
  `modified_date` datetime NOT NULL,
  `modified_by` varchar(20) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FKfsms_image449621` (`image_type_id`),
  CONSTRAINT `FKfsms_image449621` FOREIGN KEY (`image_type_id`) REFERENCES `fc_image_type` (`image_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_image_bank: ~0 rows (approximately)
/*!40000 ALTER TABLE `fc_image_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_image_bank` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_image_type
DROP TABLE IF EXISTS `fc_image_type`;
CREATE TABLE IF NOT EXISTS `fc_image_type` (
  `image_type_id` varchar(20) NOT NULL,
  `description` text,
  `status` varchar(20) NOT NULL,
  `modified_date` datetime NOT NULL,
  `modified_by` varchar(20) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`image_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_image_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `fc_image_type` DISABLE KEYS */;
INSERT INTO `fc_image_type` (`image_type_id`, `description`, `status`, `modified_date`, `modified_by`, `added_by`, `added_date`) VALUES
	('Bitmap', '', 'Active', '2014-09-04 00:00:00', 'admin', 'admin', '2014-09-04 00:00:00'),
	('JPEG', '', 'Active', '2014-09-04 00:00:00', 'admin', 'admin', '2014-09-04 00:00:00'),
	('PNG', '', 'Active', '2014-09-04 00:00:00', 'admin', 'admin', '2014-09-04 00:00:00');
/*!40000 ALTER TABLE `fc_image_type` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_privilege
DROP TABLE IF EXISTS `fc_privilege`;
CREATE TABLE IF NOT EXISTS `fc_privilege` (
  `privilege_name` varchar(50) NOT NULL,
  `privilege_code` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `description` text,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`privilege_name`),
  UNIQUE KEY `privilege_code` (`privilege_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_privilege: ~0 rows (approximately)
/*!40000 ALTER TABLE `fc_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_privilege` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_role
DROP TABLE IF EXISTS `fc_role`;
CREATE TABLE IF NOT EXISTS `fc_role` (
  `role_code` varchar(20) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  `description` longtext,
  `modified_by` varchar(20) NOT NULL,
  `modified_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `user_category` varchar(50) NOT NULL,
  PRIMARY KEY (`role_code`),
  KEY `FK_fc_role_user_category` (`user_category`,`user_type`),
  CONSTRAINT `FK_fc_role_user_category` FOREIGN KEY (`user_category`, `user_type`) REFERENCES `fc_user_category` (`user_category`, `user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_role: ~0 rows (approximately)
/*!40000 ALTER TABLE `fc_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_role` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_role_privilege
DROP TABLE IF EXISTS `fc_role_privilege`;
CREATE TABLE IF NOT EXISTS `fc_role_privilege` (
  `role_code` varchar(20) NOT NULL,
  `privilege_name` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`role_code`,`privilege_name`),
  KEY `FKfc_role_414486` (`role_code`),
  KEY `FKfc_role_534322` (`privilege_name`),
  CONSTRAINT `FKfc_role_534322` FOREIGN KEY (`privilege_name`) REFERENCES `fc_privilege` (`privilege_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_fc_role_privilege_fsms_role` FOREIGN KEY (`role_code`) REFERENCES `fc_role` (`role_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_role_privilege: ~0 rows (approximately)
/*!40000 ALTER TABLE `fc_role_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_role_privilege` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_user
DROP TABLE IF EXISTS `fc_user`;
CREATE TABLE IF NOT EXISTS `fc_user` (
  `user_name` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `first_time_login` tinyint(1) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `employee_id` varchar(20) DEFAULT NULL,
  `approve_mode` varchar(20) NOT NULL,
  `description` text,
  `modified_by` varchar(20) NOT NULL,
  `modified_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`user_name`),
  KEY `FKfc_user359704` (`employee_id`),
  CONSTRAINT `FKfc_user359704` FOREIGN KEY (`employee_id`) REFERENCES `fc_employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `fc_user` DISABLE KEYS */;
INSERT INTO `fc_user` (`user_name`, `password`, `user_type`, `first_time_login`, `last_login_time`, `employee_id`, `approve_mode`, `description`, `modified_by`, `modified_date`, `status`, `added_by`, `added_date`) VALUES
	('admin', '$2a$10$upNlurIcUu7BXA9i24HewuA5eQMq57mCq9jkmGQ8IbYtewRDZRX.a', 'Employee', 0, '2017-03-24 09:39:43', 'E001', 'Approved', NULL, 'admin', '2017-02-12', 'Active', 'admin', '2017-02-12 02:49:56');
/*!40000 ALTER TABLE `fc_user` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_user_category
DROP TABLE IF EXISTS `fc_user_category`;
CREATE TABLE IF NOT EXISTS `fc_user_category` (
  `added_by` varchar(20) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `description` longtext,
  `modified_by` varchar(20) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `user_category` varchar(50) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  PRIMARY KEY (`user_category`,`user_type`),
  KEY `FK_fc_user_category_user_type` (`user_type`),
  CONSTRAINT `FK_fc_user_category_user_type` FOREIGN KEY (`user_type`) REFERENCES `fc_user_type` (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_user_category: ~2 rows (approximately)
/*!40000 ALTER TABLE `fc_user_category` DISABLE KEYS */;
INSERT INTO `fc_user_category` (`added_by`, `added_date`, `description`, `modified_by`, `modified_date`, `status`, `user_category`, `user_type`) VALUES
	('admin', '2015-12-08 10:40:11', NULL, 'admin', '2015-12-08 10:40:17', 'Active', 'Admin', 'Admin'),
	('admin', '2015-12-11 16:54:46', NULL, 'admin', '2015-12-11 16:54:46', 'Active', 'Staff', 'Employee');
/*!40000 ALTER TABLE `fc_user_category` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_user_password_audit
DROP TABLE IF EXISTS `fc_user_password_audit`;
CREATE TABLE IF NOT EXISTS `fc_user_password_audit` (
  `id` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `description` text,
  `modified_by` varchar(20) NOT NULL,
  `modified_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fc_user_password_audit_fsms_user` (`user_name`),
  CONSTRAINT `FK_fc_user_password_audit_fc_user` FOREIGN KEY (`user_name`) REFERENCES `fc_user` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_user_password_audit: ~0 rows (approximately)
/*!40000 ALTER TABLE `fc_user_password_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_user_password_audit` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_user_role_link
DROP TABLE IF EXISTS `fc_user_role_link`;
CREATE TABLE IF NOT EXISTS `fc_user_role_link` (
  `user_name` varchar(20) NOT NULL,
  `role_code` varchar(20) NOT NULL,
  `description` text,
  `modified_by` varchar(20) NOT NULL,
  `modified_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`user_name`,`role_code`),
  KEY `FK__fsms_role` (`role_code`),
  CONSTRAINT `FK__fc_role` FOREIGN KEY (`role_code`) REFERENCES `fc_role` (`role_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__fc_user` FOREIGN KEY (`user_name`) REFERENCES `fc_user` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_user_role_link: ~0 rows (approximately)
/*!40000 ALTER TABLE `fc_user_role_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_user_role_link` ENABLE KEYS */;


-- Dumping structure for table first_credit.fc_user_type
DROP TABLE IF EXISTS `fc_user_type`;
CREATE TABLE IF NOT EXISTS `fc_user_type` (
  `user_type` varchar(50) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_date` datetime NOT NULL,
  `description` text,
  `modified_by` varchar(20) NOT NULL,
  `modified_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table first_credit.fc_user_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `fc_user_type` DISABLE KEYS */;
INSERT INTO `fc_user_type` (`user_type`, `added_by`, `added_date`, `description`, `modified_by`, `modified_date`, `status`) VALUES
	('Admin', 'admin', '2015-12-08 10:39:21', NULL, 'admin', '2015-12-08 10:39:27', 'Active'),
	('Customer', 'admin', '2015-12-11 12:49:45', NULL, 'admin', '2015-12-11 12:49:50', 'Active'),
	('Employee', 'admin', '2015-12-11 12:49:28', NULL, 'admin', '2015-12-11 12:49:34', 'Active');
/*!40000 ALTER TABLE `fc_user_type` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
