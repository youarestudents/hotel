/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.29 : Database - demo1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `demo1`;

/*Table structure for table `house` */

DROP TABLE IF EXISTS `house`;

CREATE TABLE `house` (
  `housename` char(10) DEFAULT NULL,
  `cometime` date DEFAULT NULL,
  `gotime` date DEFAULT NULL,
  `id` char(18) DEFAULT NULL,
  `houseid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `house` */

insert  into `house`(`housename`,`cometime`,`gotime`,`id`,`houseid`) values ('豪华房','2024-04-20','2024-04-21','130227200409250029',1017),('大床房','2024-04-26','2024-04-27','130227200409250029',1002),('双人床','2024-04-09','2024-04-12','130981200407014432',1012),('大床房','2024-04-30','2024-05-01','130981200507014432',1003);

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `admin` char(11) DEFAULT NULL,
  `name` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `manager` */

insert  into `manager`(`admin`,`name`) values ('19527269139','12345678'),('15612166097','gaorenhe');

/*Table structure for table `nullhouse` */

DROP TABLE IF EXISTS `nullhouse`;

CREATE TABLE `nullhouse` (
  `houseid` int DEFAULT NULL,
  `type1` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `nullhouse` */

insert  into `nullhouse`(`houseid`,`type1`) values (1004,'大床房'),(1005,'大床房'),(1006,'大床房'),(1007,'大床房'),(1008,'大床房'),(1009,'大床房'),(1010,'大床房'),(1013,'双人床'),(1014,'双人床'),(1016,'双人床'),(1018,'豪华房'),(1019,'豪华房'),(1020,'豪华房'),(1015,'双人床');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` char(18) NOT NULL,
  `username` char(10) DEFAULT NULL,
  `password` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`) values ('130227200409250029','何秋岳','812925'),('130981200407014432','高仁和','1234567'),('130981200507014432','高仨和','gaorenhe123'),('130981200607014432','高四和','gaorenhe123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
