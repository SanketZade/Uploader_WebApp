/*
MySQL Backup
Source Server Version: 5.7.27
Source Database: medical_repository_spml
Date: 8/5/2019 11:33:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `tbl_imgsig_disease_label`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_imgsig_disease_label`;
CREATE TABLE `tbl_imgsig_disease_label` (
  `examination_id` varchar(255) NOT NULL,
  `diseasecode` text,
  `diseasename` text,
  KEY `tbl_imgsig_disease_label_ibfk_1` (`examination_id`),
  CONSTRAINT `tbl_imgsig_disease_label_ibfk_1` FOREIGN KEY (`examination_id`) REFERENCES `tbl_medicaldata_entry` (`examination_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tbl_medicaldata_clinical_master`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_medicaldata_clinical_master`;
CREATE TABLE `tbl_medicaldata_clinical_master` (
  `medical_data_id` varchar(45) NOT NULL,
  `patient_name` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `entry_by` varchar(255) DEFAULT NULL,
  `access_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`medical_data_id`),
  KEY `entry_by` (`entry_by`),
  CONSTRAINT `tbl_medicaldata_clinical_master_ibfk_1` FOREIGN KEY (`entry_by`) REFERENCES `tbl_professional_account_master` (`pro_userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tbl_medicaldata_entry`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_medicaldata_entry`;
CREATE TABLE `tbl_medicaldata_entry` (
  `examination_id` varchar(255) NOT NULL,
  `medical_data_id` varchar(45) NOT NULL,
  `examination_type` varchar(45) DEFAULT NULL,
  `entry_by` varchar(45) DEFAULT NULL,
  `entry_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`examination_id`),
  KEY `medical_data_id` (`medical_data_id`),
  KEY `entry_by` (`entry_by`),
  CONSTRAINT `tbl_medicaldata_entry_ibfk_1` FOREIGN KEY (`medical_data_id`) REFERENCES `tbl_medicaldata_clinical_master` (`medical_data_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_medicaldata_entry_ibfk_2` FOREIGN KEY (`entry_by`) REFERENCES `tbl_professional_account_master` (`pro_userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tbl_medicaldata_img_sig`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_medicaldata_img_sig`;
CREATE TABLE `tbl_medicaldata_img_sig` (
  `imgsig_id` varchar(45) NOT NULL,
  `examination_id` varchar(45) NOT NULL,
  `medicaldata_imgsignal` longtext NOT NULL,
  PRIMARY KEY (`imgsig_id`),
  KEY `examination_id` (`examination_id`),
  CONSTRAINT `tbl_medicaldata_img_sig_ibfk_1` FOREIGN KEY (`examination_id`) REFERENCES `tbl_medicaldata_entry` (`examination_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tbl_medicaldata_img_sig_annotation`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_medicaldata_img_sig_annotation`;
CREATE TABLE `tbl_medicaldata_img_sig_annotation` (
  `imgsig_id` varchar(45) NOT NULL,
  `label_info` text,
  `annotated_by` varchar(45) DEFAULT NULL,
  `disease_code` text,
  `entry_time` timestamp(6) NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  KEY `imgsig_id` (`imgsig_id`),
  KEY `annotated_by` (`annotated_by`),
  CONSTRAINT `tbl_medicaldata_img_sig_annotation_ibfk_1` FOREIGN KEY (`imgsig_id`) REFERENCES `tbl_medicaldata_img_sig` (`imgsig_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_medicaldata_img_sig_annotation_ibfk_2` FOREIGN KEY (`annotated_by`) REFERENCES `tbl_professional_account_master` (`pro_userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tbl_professional_account_master`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_professional_account_master`;
CREATE TABLE `tbl_professional_account_master` (
  `pro_userid` varchar(45) NOT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `affiliation` varchar(45) DEFAULT NULL,
  `institute` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pro_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tbl_professional_login_account`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_professional_login_account`;
CREATE TABLE `tbl_professional_login_account` (
  `pro_userid` varchar(45) NOT NULL,
  `pro_username` varchar(45) NOT NULL,
  `pro_password` varchar(45) NOT NULL,
  `account_active` varchar(45) NOT NULL,
  KEY `pro_userid` (`pro_userid`),
  CONSTRAINT `tbl_professional_login_account_ibfk_1` FOREIGN KEY (`pro_userid`) REFERENCES `tbl_professional_account_master` (`pro_userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tbl_professional_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_professional_login_log`;
CREATE TABLE `tbl_professional_login_log` (
  `pro_userid` varchar(45) NOT NULL,
  `accesstype` varchar(45) DEFAULT NULL,
  `accesstime` timestamp(6) NULL DEFAULT NULL,
  KEY `pro_userid` (`pro_userid`),
  CONSTRAINT `tbl_professional_login_log_ibfk_1` FOREIGN KEY (`pro_userid`) REFERENCES `tbl_professional_account_master` (`pro_userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tbl_professional_role`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_professional_role`;
CREATE TABLE `tbl_professional_role` (
  `pro_userid` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  KEY `pro_userid` (`pro_userid`),
  CONSTRAINT `tbl_professional_role_ibfk_1` FOREIGN KEY (`pro_userid`) REFERENCES `tbl_professional_account_master` (`pro_userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records 
-- ----------------------------
