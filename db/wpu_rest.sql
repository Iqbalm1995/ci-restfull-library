/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.37-MariaDB : Database - wpu_rest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wpu_rest` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `wpu_rest`;

/*Table structure for table `keys` */

DROP TABLE IF EXISTS `keys`;

CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `keys` */

insert  into `keys`(`id`,`user_id`,`key`,`level`,`ignore_limits`,`is_private_key`,`ip_addresses`,`date_created`) values 
(1,1,'wpu123',1,0,0,NULL,1);

/*Table structure for table `limits` */

DROP TABLE IF EXISTS `limits`;

CREATE TABLE `limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `limits` */

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` char(9) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `jurusan` varchar(64) NOT NULL,
  `create_by` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(200) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nip` (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`id`,`nip`,`nama`,`email`,`jurusan`,`create_by`,`create_date`,`update_by`,`update_date`,`is_delete`) values 
(1,'043040001','Doddy Ferdiansyah','doy@gmail.com','Teknik Mesin','admin','2020-02-27 14:12:54','API_POST','2020-02-28 05:24:23',1),
(2,'023040123','Erik','erik@gmail.com','Teknik Industri','admin','2020-02-27 14:12:54',NULL,NULL,0),
(3,'043040321','Rommy Fauzi','rommy@gmail.com','Teknik Planologi','admin','2020-02-27 14:12:54',NULL,NULL,0),
(4,'033040023','Fajar Darmawan ','fajar@yahoo.com','Teknik Informatika','admin','2020-02-27 14:12:54',NULL,NULL,0),
(5,'113040321','Ferry Mulyanto','ferry@yahoo.com','Manajemen','admin','2020-02-27 14:12:54',NULL,NULL,1),
(8,'10115449','Mohamad Iqbal Musyaffa','iqbalm1995@gmail.com','Teknik Informatika','API_POST','2020-02-27 09:51:12',NULL,NULL,0),
(9,'10115472','Rangga Djatikusuma Lukman','djatikisuma.data@gmail.com','Teknik Informatika','API_POST','2020-02-28 05:22:05',NULL,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
