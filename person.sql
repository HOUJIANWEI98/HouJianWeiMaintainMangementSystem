/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.30-log : Database - person
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`person` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `person`;

/*Table structure for table `checkwork_inf` */

DROP TABLE IF EXISTS `checkwork_inf`;

CREATE TABLE `checkwork_inf` (
  `ID` int(11) NOT NULL,
  `DEPT_ID` int(11) NOT NULL,
  `JOB_ID` int(11) NOT NULL,
  `EMP_ID` int(11) NOT NULL,
  `WORKINGDAYS` int(18) NOT NULL,
  `DAYSLEAVE` int(50) NOT NULL,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DAYSOUT` int(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`EMP_ID`),
  KEY `FK_EMP_DEPT` (`DEPT_ID`),
  KEY `FK_EMP_JOB` (`JOB_ID`),
  KEY `ID` (`ID`),
  KEY `checkwork_inf_ibfk_3` (`EMP_ID`),
  CONSTRAINT `che_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `employee_inf` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `che_2` FOREIGN KEY (`JOB_ID`) REFERENCES `employee_inf` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `che_3` FOREIGN KEY (`EMP_ID`) REFERENCES `employee_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `checkwork_inf` */

insert  into `checkwork_inf`(`ID`,`DEPT_ID`,`JOB_ID`,`EMP_ID`,`WORKINGDAYS`,`DAYSLEAVE`,`CREATEDATE`,`DAYSOUT`) values (4,1,6,4,23,0,'2020-05-12 15:05:02',0),(5,3,1,5,15,8,'2020-05-17 16:34:24',1);

/*Table structure for table `code_inf` */

DROP TABLE IF EXISTS `code_inf`;

CREATE TABLE `code_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `code_inf` */

insert  into `code_inf`(`id`,`code`,`createdate`) values (1,'89G9YUWRH','2020-05-19 14:56:00');

/*Table structure for table `completion_inf` */

DROP TABLE IF EXISTS `completion_inf`;

CREATE TABLE `completion_inf` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `completion_inf` */

insert  into `completion_inf`(`id`,`name`) values (1,'优秀'),(2,'良好'),(3,'不合格');

/*Table structure for table `confidentialitycontract_inf` */

DROP TABLE IF EXISTS `confidentialitycontract_inf`;

CREATE TABLE `confidentialitycontract_inf` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `confidentialitycontract_inf` */

insert  into `confidentialitycontract_inf`(`id`,`name`) values (1,'已签'),(2,'未签');

/*Table structure for table `contract_inf` */

DROP TABLE IF EXISTS `contract_inf`;

CREATE TABLE `contract_inf` (
  `ID` int(11) NOT NULL,
  `DEPT_ID` int(11) NOT NULL,
  `JOB_ID` int(11) NOT NULL,
  `STATUS_ID` int(11) DEFAULT '0',
  `EMP_ID` int(11) NOT NULL,
  `TRAIN_CONTRACT` int(18) NOT NULL,
  `LABOR_CONTRACT` int(50) NOT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CONFIDENTIALITY_CONTRACT` int(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EMP_DEPT` (`DEPT_ID`),
  KEY `FK_EMP_JOB` (`JOB_ID`),
  KEY `ID` (`ID`),
  KEY `checkwork_inf_ibfk_3` (`EMP_ID`),
  CONSTRAINT `con_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `employee_inf` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `con_2` FOREIGN KEY (`JOB_ID`) REFERENCES `employee_inf` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `con_3` FOREIGN KEY (`EMP_ID`) REFERENCES `employee_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contract_inf` */

insert  into `contract_inf`(`ID`,`DEPT_ID`,`JOB_ID`,`STATUS_ID`,`EMP_ID`,`TRAIN_CONTRACT`,`LABOR_CONTRACT`,`CREATE_DATE`,`CONFIDENTIALITY_CONTRACT`) values (4,1,6,0,4,1,1,'2020-05-18 10:02:47',1);

/*Table structure for table `dept_inf` */

DROP TABLE IF EXISTS `dept_inf`;

CREATE TABLE `dept_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `dept_inf` */

insert  into `dept_inf`(`id`,`name`,`remark`) values (1,'技术部','技术研发'),(2,'运营部','运营部'),(3,'财务部','财务分析与统计计划'),(5,'总公办','总公办'),(6,'市场部','市场部'),(7,'教学部','教学部');

/*Table structure for table `document_inf` */

DROP TABLE IF EXISTS `document_inf`;

CREATE TABLE `document_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `filename` varchar(300) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `document_inf` */

insert  into `document_inf`(`id`,`title`,`filename`,`remark`,`createdate`,`user_id`) values (1,'实习协议','实习协议.pdf','实习协议文档','2020-03-22 10:37:39',1),(22,'测试文档','新建文本文档.txt','这是测试有文档','2020-05-08 09:13:22',1),(23,'测试文档','上班.xlsx','这是个测试文档','2020-05-10 17:16:25',1),(24,'参考文献','参考文献.docx','可供使用参考文献','2020-05-18 10:11:55',1),(25,'开会纪要','4.27开会.docx','四月第一次开会纪要','2020-05-18 10:26:08',1);

/*Table structure for table `education_inf` */

DROP TABLE IF EXISTS `education_inf`;

CREATE TABLE `education_inf` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `education_inf` */

insert  into `education_inf`(`id`,`name`) values (1,'大专'),(2,'本科'),(3,'硕士'),(4,'博士');

/*Table structure for table `employee_inf` */

DROP TABLE IF EXISTS `employee_inf`;

CREATE TABLE `employee_inf` (
  `id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `card_id` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `education_id` int(10) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_EMP_DEPT` (`dept_id`),
  KEY `FK_EMP_JOB` (`job_id`),
  CONSTRAINT `FK_EMP_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `dept_inf` (`id`),
  CONSTRAINT `FK_EMP_JOB` FOREIGN KEY (`job_id`) REFERENCES `job_inf` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employee_inf` */

insert  into `employee_inf`(`id`,`dept_id`,`job_id`,`name`,`card_id`,`address`,`phone`,`sex_id`,`education_id`,`createdate`,`user_id`) values (1,1,7,'喵喵喵','432801197711251052','浙江省杭州市','13902001111',2,3,'2020-05-07 21:28:19',1),(2,7,1,'尼古拉斯赵四','370400123411111234','河南省郑州市','18512345678',1,3,'2020-05-09 16:29:41',2),(3,6,1,'嘿嘿嘿好','432801197711251023','江苏省南京市','13512345678',1,1,'2020-05-08 09:11:46',3),(4,1,6,'侯建伟','370283199807267010','山东省青岛市','15653148960',1,2,'2020-05-08 10:42:52',5),(5,3,1,'李四','370400123411111234','山东省烟台市','15512345600',2,3,'2020-05-02 10:46:37',NULL);

/*Table structure for table `job_inf` */

DROP TABLE IF EXISTS `job_inf`;

CREATE TABLE `job_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `job_inf` */

insert  into `job_inf`(`id`,`name`,`remark`) values (1,'职员','职员'),(2,'Java开发工程师','Java开发工程师'),(3,'Java中级开发工程师','Java中级开发工作'),(6,'架构师','架构师'),(7,'主管','主管'),(9,'总经理','负责项目总体工作');

/*Table structure for table `jobtype_inf` */

DROP TABLE IF EXISTS `jobtype_inf`;

CREATE TABLE `jobtype_inf` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jobtype_inf` */

insert  into `jobtype_inf`(`id`,`name`) values (1,'人才项目'),(2,'技术方向'),(3,'设计方向'),(4,'产品方向'),(5,'客户服务'),(6,'金融方向'),(7,'市场与职能方向');

/*Table structure for table `laborcontract_inf` */

DROP TABLE IF EXISTS `laborcontract_inf`;

CREATE TABLE `laborcontract_inf` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `laborcontract_inf` */

insert  into `laborcontract_inf`(`id`,`name`) values (1,'已签'),(2,'未签');

/*Table structure for table `leave_inf` */

DROP TABLE IF EXISTS `leave_inf`;

CREATE TABLE `leave_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `startdata` varchar(255) DEFAULT NULL,
  `enddata` varchar(255) DEFAULT NULL,
  `leavedays` varchar(255) DEFAULT NULL,
  `leavetype` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `leavestatus` int(11) DEFAULT '2',
  `leavetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `lea_1` (`emp_id`),
  KEY `lea_2` (`dept_id`),
  KEY `lea_3` (`job_id`),
  CONSTRAINT `lea_1` FOREIGN KEY (`emp_id`) REFERENCES `employee_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lea_2` FOREIGN KEY (`dept_id`) REFERENCES `employee_inf` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lea_3` FOREIGN KEY (`job_id`) REFERENCES `employee_inf` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `leave_inf` */

insert  into `leave_inf`(`id`,`emp_id`,`dept_id`,`job_id`,`startdata`,`enddata`,`leavedays`,`leavetype`,`content`,`leavestatus`,`leavetime`) values (12,1,6,7,'2020-05-07','2020-05-16','9',1,'感冒',1,'2020-05-08 09:18:51'),(13,4,1,6,'2020-04-11','2020-04-13','2',1,'感冒了',2,'2020-04-11 10:46:39'),(14,4,1,6,'2020-05-15','2020-05-18','3',2,'回老家',2,'2020-05-12 10:00:23');

/*Table structure for table `leavestatus_inf` */

DROP TABLE IF EXISTS `leavestatus_inf`;

CREATE TABLE `leavestatus_inf` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `leavestatus_inf` */

insert  into `leavestatus_inf`(`id`,`name`) values (1,'批准'),(2,'未批准');

/*Table structure for table `leavetype_inf` */

DROP TABLE IF EXISTS `leavetype_inf`;

CREATE TABLE `leavetype_inf` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `leavetype_inf` */

insert  into `leavetype_inf`(`id`,`name`) values (1,'病假'),(2,'事假');

/*Table structure for table `notice_inf` */

DROP TABLE IF EXISTS `notice_inf`;

CREATE TABLE `notice_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notice` (`user_id`),
  CONSTRAINT `user_notice` FOREIGN KEY (`user_id`) REFERENCES `user_inf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `notice_inf` */

insert  into `notice_inf`(`id`,`title`,`content`,`createdate`,`user_id`) values (1,'你好','明天就是你自己的生日了','2020-04-22 15:06:36',1),(2,'下午开会','技术部下午3.00开会,请各部门准时参加会议','2020-04-08 15:13:24',2),(3,'五一放假','五一放假安排时间调整及时通知','2020-04-27 19:06:23',1),(4,'发布新消息','在普通用户页面实时提示！！！','2019-04-14 17:21:30',1),(8,'这是个新公告','这是一个新公告啊！','2020-05-10 17:13:00',1);

/*Table structure for table `punchclock_inf` */

DROP TABLE IF EXISTS `punchclock_inf`;

CREATE TABLE `punchclock_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `sgin` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `offwork` timestamp NULL DEFAULT NULL,
  `sgin_status` int(11) DEFAULT '2',
  `offwork_status` int(11) DEFAULT '1',
  `date` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `sgin_status_id` int(11) DEFAULT '1',
  `offwork_status_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `punchclock_inf` */

insert  into `punchclock_inf`(`id`,`userId`,`sgin`,`offwork`,`sgin_status`,`offwork_status`,`date`,`content`,`sgin_status_id`,`offwork_status_id`) values (4,5,'2020-04-10 20:06:55','2020-04-10 20:07:24',2,2,'2020-4-10','起晚了',2,1),(17,5,'2020-04-11 10:40:12','2020-04-11 10:43:37',2,2,'2020-4-11','发烧了',1,2),(18,5,'2020-05-07 21:36:48',NULL,2,1,'2020-5-7',NULL,2,1),(19,5,'2020-05-08 09:50:46',NULL,2,1,'2020-5-8',NULL,2,1),(20,8,'2020-05-10 10:19:11',NULL,2,1,'2020-5-10',NULL,2,1),(21,5,'2020-05-12 09:59:20','2020-05-12 21:29:57',2,2,'2020-5-12','堵车',2,1);

/*Table structure for table `punchtime_inf` */

DROP TABLE IF EXISTS `punchtime_inf`;

CREATE TABLE `punchtime_inf` (
  `id` int(11) NOT NULL,
  `am` varchar(255) DEFAULT NULL,
  `pm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `punchtime_inf` */

insert  into `punchtime_inf`(`id`,`am`,`pm`) values (1,'09:00','18:00');

/*Table structure for table `recruitment_inf` */

DROP TABLE IF EXISTS `recruitment_inf`;

CREATE TABLE `recruitment_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobtype` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `peoplenum` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `enddate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `recruitment_inf` */

insert  into `recruitment_inf`(`id`,`jobtype`,`content`,`peoplenum`,`status`,`enddate`) values (1,1,'管培生',10,1,'2020-06-30'),(2,2,'java初级工程师',2,2,'2020-04-17'),(3,3,'UI设计工程师',5,1,'2020-06-30'),(6,6,'会计师',1,2,'2020-04-01'),(7,7,'行政专员',2,2,'2020-03-30'),(8,2,'算法工程师',2,1,'2020-07-01'),(9,2,'C++开发工程师',1,1,'2020-05-23'),(10,2,'Java专家',1,1,'2020-06-30'),(11,4,'产品经理',1,2,'2020-04-30'),(12,6,'高级会计师',1,1,'2020-06-30'),(13,5,'高级客服专员',2,1,'2020-06-30'),(14,5,'电话客服',5,1,'2020-09-30');

/*Table structure for table `recruitmentstatus_inf` */

DROP TABLE IF EXISTS `recruitmentstatus_inf`;

CREATE TABLE `recruitmentstatus_inf` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `recruitmentstatus_inf` */

insert  into `recruitmentstatus_inf`(`id`,`name`) values (1,'正在招聘'),(2,'已结束');

/*Table structure for table `resume_inf` */

DROP TABLE IF EXISTS `resume_inf`;

CREATE TABLE `resume_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobtype` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `education_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT '2',
  `filename` varchar(255) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `resume_inf` */

insert  into `resume_inf`(`id`,`jobtype`,`content`,`name`,`email`,`sex_id`,`education_id`,`phone`,`status_id`,`filename`,`createdate`) values (6,'人才项目','管培生','哎哎哎','122@qq.com',1,2,'13512345678',1,'青岛理工大学-侯建伟-Java开发工程师.pdf','2020-05-14 15:06:18'),(7,'人才项目','管培生','啊啊','123@qq.com',2,4,'13234567890',2,'简历照片.jpg','2020-05-10 10:25:20'),(8,'设计方向','UI设计工程师','嘿嘿嘿','123@qq.com',1,3,'13512345678',1,'上班.xlsx','2020-05-10 18:26:56'),(9,'金融方向','高级会计师','张三','132344@foxmail.com',1,3,'13578556930',2,'简历.txt','2020-05-16 17:38:10'),(10,'人才项目','管培生','王二麻子','wangermaz@163.com',1,1,'13578945612',2,'新建 Microsoft Word 文档.docx','2020-05-19 11:41:42');

/*Table structure for table `salary_inf` */

DROP TABLE IF EXISTS `salary_inf`;

CREATE TABLE `salary_inf` (
  `ID` int(11) NOT NULL,
  `DEPT_ID` int(11) NOT NULL,
  `JOB_ID` int(11) NOT NULL,
  `EMP_ID` int(11) NOT NULL,
  `SALARY_STATION` int(18) NOT NULL,
  `SALARY_LEVEL` int(50) NOT NULL,
  `SENIORITY_PAY` int(50) DEFAULT NULL,
  `PERFORMANCE` int(16) DEFAULT NULL,
  `INDIVIDUAL_INCOME` float(11,0) NOT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `FK_EMP_DEPT` (`DEPT_ID`),
  KEY `FK_EMP_JOB` (`JOB_ID`),
  KEY `ID` (`ID`),
  KEY `salary_inf_ibfk_3` (`EMP_ID`),
  CONSTRAINT `sal_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `employee_inf` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sal_2` FOREIGN KEY (`JOB_ID`) REFERENCES `employee_inf` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sal_3` FOREIGN KEY (`EMP_ID`) REFERENCES `employee_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salary_inf` */

insert  into `salary_inf`(`ID`,`DEPT_ID`,`JOB_ID`,`EMP_ID`,`SALARY_STATION`,`SALARY_LEVEL`,`SENIORITY_PAY`,`PERFORMANCE`,`INDIVIDUAL_INCOME`,`CREATE_DATE`) values (1,6,7,1,6050,3,620,150,690,'2020-04-23 09:12:08'),(3,6,1,3,5000,3,450,360,500,'2019-04-19 09:12:53'),(4,1,6,4,7500,2,1200,300,750,'2020-05-18 10:03:39');

/*Table structure for table `sex_inf` */

DROP TABLE IF EXISTS `sex_inf`;

CREATE TABLE `sex_inf` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sex_inf` */

insert  into `sex_inf`(`id`,`name`) values (1,'男'),(2,'女');

/*Table structure for table `staticid_inf` */

DROP TABLE IF EXISTS `staticid_inf`;

CREATE TABLE `staticid_inf` (
  `staticId` int(11) NOT NULL,
  PRIMARY KEY (`staticId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `staticid_inf` */

insert  into `staticid_inf`(`staticId`) values (10);

/*Table structure for table `status_inf` */

DROP TABLE IF EXISTS `status_inf`;

CREATE TABLE `status_inf` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `status_inf` */

insert  into `status_inf`(`id`,`name`) values (1,'已审核'),(2,'未审核');

/*Table structure for table `train_inf` */

DROP TABLE IF EXISTS `train_inf`;

CREATE TABLE `train_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `startdata` varchar(255) DEFAULT NULL,
  `enddata` varchar(255) DEFAULT NULL,
  `totallength` int(11) DEFAULT NULL,
  `completion` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `traintime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `lea_1` (`emp_id`),
  KEY `lea_2` (`dept_id`),
  KEY `lea_3` (`job_id`),
  CONSTRAINT `train_inf_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `train_inf_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `employee_inf` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `train_inf_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `employee_inf` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `train_inf` */

insert  into `train_inf`(`id`,`emp_id`,`dept_id`,`job_id`,`content`,`startdata`,`enddata`,`totallength`,`completion`,`grade`,`traintime`) values (2,1,1,7,'前端技术','2020-04-01','2020-06-30',90,2,80,'2020-05-08 10:58:30'),(3,4,1,6,'java高级培训','2020-05-01','2020-05-16',15,1,95,'2020-05-16 23:04:32');

/*Table structure for table `traincontract_inf` */

DROP TABLE IF EXISTS `traincontract_inf`;

CREATE TABLE `traincontract_inf` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `traincontract_inf` */

insert  into `traincontract_inf`(`id`,`name`) values (1,'已签'),(2,'未签');

/*Table structure for table `traindata_inf` */

DROP TABLE IF EXISTS `traindata_inf`;

CREATE TABLE `traindata_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `filename` varchar(300) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `traindata_inf` */

insert  into `traindata_inf`(`id`,`title`,`filename`,`remark`,`createdate`,`user_id`) values (1,'北京北京','群星 - 北京欢迎你.mp4','北京欢迎你','2020-04-03 22:12:28',1),(2,'Git使用','创建基于github的毕设项目1.mp4','Git使用说明-1','2020-05-16 22:50:57',1),(3,'Git使用2','创建基于github的毕设项目2.mp4','Git使用说明-2','2020-05-16 22:50:59',1),(4,'Git使用3','创建基于github的毕设项目3.mp4','Git使用说明-3','2020-05-16 22:52:16',1);

/*Table structure for table `user_inf` */

DROP TABLE IF EXISTS `user_inf`;

CREATE TABLE `user_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT '2',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(20) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `che_id` int(11) DEFAULT NULL,
  `con_id` int(11) DEFAULT NULL,
  `sal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `user_inf` */

insert  into `user_inf`(`id`,`loginname`,`password`,`email`,`status_id`,`createdate`,`username`,`emp_id`,`che_id`,`con_id`,`sal_id`) values (1,'admin','0f151318b2b21c951b014b0b85e1098b','',1,'2020-05-08 09:55:22','通用管理员',NULL,NULL,NULL,NULL),(2,'manager','1849bdd6681fd2f864734e8eb2208348','',1,'2020-04-11 13:52:15','总经理',NULL,NULL,NULL,NULL),(5,'houjianwei','8adddb1b6bb3c6bcd867bb5ed5b80c47','1111111111111@163.com',1,'2020-05-09 16:19:53','侯建伟',4,4,4,4),(8,'zhangsan','f9bf99f5abf9635bbbcd7110dbc3bbe3','123@163.com',1,'2020-05-10 10:17:59','张三',10,10,10,10);

/*Table structure for table `uservisit_inf` */

DROP TABLE IF EXISTS `uservisit_inf`;

CREATE TABLE `uservisit_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_time` varchar(255) DEFAULT NULL,
  `exit_time` varchar(255) DEFAULT NULL,
  `visit_ip` varchar(255) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_from` varchar(255) NOT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `loginname` varchar(255) DEFAULT NULL,
  `iphone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

/*Data for the table `uservisit_inf` */

insert  into `uservisit_inf`(`id`,`login_time`,`exit_time`,`visit_ip`,`user_address`,`user_from`,`browser`,`system`,`version`,`loginname`,`iphone`) values (83,'2020-05-07 21:26:36','2020-05-07 21:29:01','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','admin','Windows NT 10.0; Win64; x64'),(84,'2020-05-07 21:31:58','2020-05-07 21:36:29','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','admin','Windows NT 10.0; Win64; x64'),(85,'2020-05-08 09:10:24','2020-05-08 09:43:42','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','admin','Windows NT 10.0; Win64; x64'),(86,'2020-05-08 09:43:50','2020-05-08 09:53:53','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','houjianwei','Windows NT 10.0; Win64; x64'),(87,'2020-05-08 09:58:22','2020-05-08 10:06:34','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','admin','Windows NT 10.0; Win64; x64'),(88,'2020-05-08 10:37:32','2020-05-08 10:50:08','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','admin','Windows NT 10.0; Win64; x64'),(89,'2020-05-08 10:53:38','2020-05-08 10:55:43','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','houjianwei','Windows NT 10.0; Win64; x64'),(90,'2020-05-09 10:32:04','2020-05-09 10:35:39','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','admin','Windows NT 10.0; Win64; x64'),(91,'2020-05-09 13:34:39','2020-05-09 13:39:46','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','houjianwei','Windows NT 10.0; Win64; x64'),(92,'2020-05-10 09:52:12','2020-05-10 10:13:19','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','admin','Windows NT 10.0; Win64; x64'),(93,'2020-05-10 10:18:30','2020-05-10 10:23:54','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','zhangsan','Windows NT 10.0; Win64; x64'),(94,'2020-05-10 17:07:52','2020-05-10 18:01:13','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','admin','Windows NT 10.0; Win64; x64'),(95,'2020-05-11 16:13:59','2020-05-11 16:14:17','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','admin','Windows NT 10.0; Win64; x64'),(96,'2020-05-12 14:54:23','2020-05-12 15:41:11','0:0:0:0:0:0:0:1',NULL,'PC端','Firefox','Windows','76.0','admin','Windows NT 10.0; Win64; x64'),(97,'2020-05-12 16:18:16','2020-05-12 16:25:29','127.0.0.1',NULL,'PC绔�','Firefox','Windows','76.0','houjianwei','Windows NT 10.0; Win64; x64');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
