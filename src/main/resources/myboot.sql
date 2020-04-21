/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.20-log : Database - myboot
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myboot` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `myboot`;

/*Table structure for table `t_dept` */

DROP TABLE IF EXISTS `t_dept`;

CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deptName` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `deptDesc` varchar(200) DEFAULT NULL COMMENT '部门描述',
  `enable` int(3) DEFAULT NULL COMMENT '0 启用 1 禁用<!-- "{\\"formType\\":\\"select\\",\\"options\\":[{\\"optText\\":\\"启用\\",\\"optValue\\":0},{\\"optText\\":\\"禁用\\",\\"optValue\\":1}]}" -->',
  `parentId` int(11) DEFAULT NULL COMMENT '上级部们<!-- "{\\"formType\\":\\"foreignKey\\",\\"fKName\\":\\"dept_dept_fk\\"}" -->',
  `sort` int(3) DEFAULT NULL COMMENT '排序',
  `parentName` varchar(100) DEFAULT NULL COMMENT '上级部们名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10205 DEFAULT CHARSET=utf8;

/*Data for the table `t_dept` */

insert  into `t_dept`(`id`,`deptName`,`deptDesc`,`enable`,`parentId`,`sort`,`parentName`) values 
(1,'航天信息河南有限公司总部','航信河南总部',0,0,1,NULL),
(101,'郑州东区分公司','东区分公司',0,1,101,'航天信息河南有限公司总部'),
(102,'总部物联网产业部','总部物联网',0,1,102,'航天信息河南有限公司总部'),
(103,'总部IT产业部','总部IT产业部',0,1,103,'航天信息河南有限公司总部'),
(10101,'郑州东区分公司金穗产业部','东区分公司金穗产业部',0,101,10101,'郑州东区分公司'),
(10102,'郑州东区分公司金融产业部','东区分公司金融产业部',0,101,10102,'郑州东区分公司'),
(10103,'郑州东区分公司物联网产业部','东区分公司物联网产业部',0,101,10103,'郑州东区分公司'),
(10104,'郑州东区分公司金盾产业部','东区分公司金盾产业部',0,101,10104,'郑州东区分公司'),
(10105,'郑州东区分公司IT产业部','东区分公司IT产业部',0,101,10105,'郑州东区分公司'),
(10201,'物联网研发小组','研发小组',0,102,10201,'总部物联网产业部'),
(10202,'物联网施工小组','施工小组',0,102,10202,'总部物联网产业部'),
(10203,'test','test',0,103,12211,'总部IT产业部'),
(10204,'test2','test2',0,10203,112221,'test');

/*Table structure for table `t_fkeys` */

DROP TABLE IF EXISTS `t_fkeys`;

CREATE TABLE `t_fkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fkName` varchar(50) DEFAULT NULL COMMENT '外键名称',
  `mTableName` varchar(50) DEFAULT NULL COMMENT '主表名',
  `mColumnName` varchar(50) DEFAULT NULL COMMENT '主表关联列名',
  `rTableName` varchar(50) DEFAULT NULL COMMENT '从表名',
  `rColumnName` varchar(50) DEFAULT NULL COMMENT '从表关联列名',
  `rType` int(2) DEFAULT NULL COMMENT '关联查询类型<!-- "{\\"formType\\":\\"select\\",\\"options\\":[{\\"optText\\":\\"一对一\\",\\"optValue\\":0},{\\"optText\\":\\"列表\\",\\"optValue\\":1},{\\"optText\\":\\"树\\",\\"optValue\\":2}]}" -->',
  `rSql` varchar(200) DEFAULT NULL COMMENT '关联查询语句',
  `coverOtherValueColumn` varchar(100) DEFAULT NULL COMMENT '主表取值查询视图的列对应',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_fkeys` */

insert  into `t_fkeys`(`id`,`fkName`,`mTableName`,`mColumnName`,`rTableName`,`rColumnName`,`rType`,`rSql`,`coverOtherValueColumn`) values 
(1,'user_dept_fk','t_user','deptId','t_dept','id',2,'SELECT t.id AS id ,t.deptName AS name ,t.parentId pId, \'true\' as open,\"other\" as otherColumn FROM t_dept t','[{ \"mTable\":\"deptId\" ,\"rSql\":\"id\" }, {\"mTable\":\"deptName\", \"rSql\":\"name\"}]'),
(2,'dept_dept_fk','t_dept','parentId','t_dept','id',2,'SELECT  t.id AS id, t.deptName AS `name`, t.parentId pId , \'true\' AS `open` FROM t_dept t','[{ \"mTable\":\"parentId\" ,\"rSql\":\"id\" }, {\"mTable\":\"parentName\", \"rSql\":\"name\"}]');

/*Table structure for table `t_resources` */

DROP TABLE IF EXISTS `t_resources`;

CREATE TABLE `t_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '资源名称',
  `resKey` int(11) DEFAULT NULL COMMENT '资源id',
  `resUrl` varchar(100) DEFAULT NULL COMMENT '资源链接',
  `presKey` int(11) DEFAULT NULL COMMENT '父资源id',
  `pName` varchar(100) DEFAULT NULL COMMENT '父资源名称',
  `sort` int(11) DEFAULT NULL COMMENT '资源排序',
  `type` int(11) DEFAULT NULL COMMENT '0 启用 1 禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1403 DEFAULT CHARSET=utf8;

/*Data for the table `t_resources` */

insert  into `t_resources`(`id`,`name`,`resKey`,`resUrl`,`presKey`,`pName`,`sort`,`type`) values 
(1,'系统管理',1,'#',0,NULL,1,0),
(1371,'部门管理',1001,'dept/list',1,'系统管理',1001,0),
(1372,'部门新增',1001001,'dept/add',1001,'部门管理',1001001,0),
(1373,'部门修改',1001002,'dept/update',1001,'部门管理',1001002,0),
(1374,'部门刪除',1001003,'dept/delete',1001,'部门管理',1001003,0),
(1375,'外键管理管理',1002,'fkeys/list',1,'系统管理',1002,0),
(1376,'外键管理新增',1002001,'fkeys/add',1002,'外键管理管理',1002001,0),
(1377,'外键管理修改',1002002,'fkeys/update',1002,'外键管理管理',1002002,0),
(1378,'外键管理刪除',1002003,'fkeys/delete',1002,'外键管理管理',1002003,0),
(1379,'资源管理',1003,'resources/list',1,'系统管理',1003,0),
(1380,'资源新增',1003001,'resources/add',1003,'资源管理',1003001,0),
(1381,'资源修改',1003002,'resources/update',1003,'资源管理',1003002,0),
(1382,'资源刪除',1003003,'resources/delete',1003,'资源管理',1003003,0),
(1383,'角色管理',1004,'role/list',1,'系统管理',1004,0),
(1384,'角色新增',1004001,'role/add',1004,'角色管理',1004001,0),
(1385,'角色修改',1004002,'role/update',1004,'角色管理',1004002,0),
(1386,'角色刪除',1004003,'role/delete',1004,'角色管理',1004003,0),
(1387,'角色资源管理',1005,'roleResources/list',1,'系统管理',1005,0),
(1388,'角色资源新增',1005001,'roleResources/add',1005,'角色资源管理',1005001,0),
(1389,'角色资源修改',1005002,'roleResources/update',1005,'角色资源管理',1005002,0),
(1390,'角色资源刪除',1005003,'roleResources/delete',1005,'角色资源管理',1005003,0),
(1391,'系统配置管理',1006,'sysConfig/list',1,'系统管理',1006,0),
(1392,'系统配置新增',1006001,'sysConfig/add',1006,'系统配置管理',1006001,0),
(1393,'系统配置修改',1006002,'sysConfig/update',1006,'系统配置管理',1006002,0),
(1394,'系统配置刪除',1006003,'sysConfig/delete',1006,'系统配置管理',1006003,0),
(1395,'用户管理',1007,'user/list',1,'系统管理',1007,0),
(1396,'用户新增',1007001,'user/add',1007,'用户管理',1007001,0),
(1397,'用户修改',1007002,'user/update',1007,'用户管理',1007002,0),
(1398,'用户刪除',1007003,'user/delete',1007,'用户管理',1007003,0),
(1399,'用户角色管理',1008,'userRole/list',1,'系统管理',1008,0),
(1400,'用户角色新增',1008001,'userRole/add',1008,'用户角色管理',1008001,0),
(1401,'用户角色修改',1008002,'userRole/update',1008,'用户角色管理',1008002,0),
(1402,'用户角色刪除',1008003,'userRole/delete',1008,'用户角色管理',1008003,0);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roleKey` varchar(100) NOT NULL COMMENT '角色id',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `pRoleKey` varchar(100) DEFAULT NULL COMMENT '父角色id',
  `pRoleDesc` varchar(255) DEFAULT NULL COMMENT '父角色描述',
  `enable` int(3) DEFAULT NULL COMMENT '0 启用 1 禁用',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`roleKey`,`roleDesc`,`pRoleKey`,`pRoleDesc`,`enable`,`sort`) values 
(1,'1','超级管理员','0',NULL,0,1),
(2,'2','航信河南总部总经理','1','超级管理员',0,2),
(3,'2001','航信河南总部副总经理','2','航信河南总部总经理',0,2001),
(4,'2002','航信河南分公司总经理','2','航信河南总部总经理',0,2002),
(5,'2002001','航信河南分公司副总经理','2002','航信河南分公司总经理',0,2002001),
(6,'2001001','航信河南总部研发部经理','2001','航信河南总部副总经理',0,2001001),
(7,'2001002','航信河南总部物联网部经理','2001','航信河南总部副总经理',0,2001002),
(8,'2001003','航信河南总部金融产业部经理','2001','航信河南总部副总经理',0,2001003),
(9,'2001001001','航信河南总部研发部员工','2001001','航信河南总部研发部经理',0,2001001001),
(10,'2001002001','航信河南总部物联网部员工','2001002','航信河南总部物联网部经理',0,2001002001),
(11,'2001002002','航信河南分公司金穗产业部经理','2002001','航信河南分公司副总经理',0,2001002002),
(12,'2001002003','航信河南总部金融产业部员工','2001003','航信河南总部金融产业部经理',0,2001002003),
(13,'2001002004','航信河南分公司金穗产业部员工','2001002002','航信河南分公司金穗产业部经理',0,2001002004);

/*Table structure for table `t_role_resources` */

DROP TABLE IF EXISTS `t_role_resources`;

CREATE TABLE `t_role_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roleKey` varchar(100) NOT NULL COMMENT '角色id',
  `resKey` varchar(100) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`,`roleKey`,`resKey`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

/*Data for the table `t_role_resources` */

insert  into `t_role_resources`(`id`,`roleKey`,`resKey`) values 
(92,'2001','1'),
(93,'2001','1003'),
(94,'2001','1004'),
(95,'2','1'),
(96,'2','1002'),
(97,'2','1003'),
(98,'2','1004'),
(99,'2','2'),
(100,'2','2001'),
(101,'2','2002'),
(102,'2','2003'),
(103,'2','2004'),
(142,'1','1'),
(143,'1','1002'),
(144,'1','1003'),
(145,'1','1004'),
(146,'1','2'),
(147,'1','2001'),
(148,'2002001','1'),
(149,'2002001','1002'),
(150,'2002001','1003'),
(151,'2002001','1004'),
(152,'2002001','2'),
(153,'2002001','2001'),
(154,'2002001','2002'),
(155,'2002001','2003'),
(156,'2002001','2004');

/*Table structure for table `t_sys_config` */

DROP TABLE IF EXISTS `t_sys_config`;

CREATE TABLE `t_sys_config` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `sysConfigIndex` int(11) NOT NULL COMMENT '配置索引',
  `delStatus` tinyint(2) DEFAULT '0' COMMENT '配置状态0启用1禁用',
  PRIMARY KEY (`id`,`sysConfigIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_sys_config` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userName` varchar(33) DEFAULT NULL COMMENT '名称',
  `password` varchar(33) DEFAULT NULL COMMENT '密码',
  `enable` int(10) DEFAULT NULL COMMENT '状态0启用1禁用<!-- "{\\"formType\\":\\"select\\",\\"options\\":[{\\"optText\\":\\"启用\\",\\"optValue\\":0},{\\"optText\\":\\"禁用\\",\\"optValue\\":1}]}" -->',
  `phoneNo` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `mail` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `addTime` date DEFAULT NULL COMMENT '添加时间<!-- "{\\"formType\\":\\"datePicker\\"}" -->',
  `deptId` int(11) DEFAULT NULL COMMENT '部门ID<!-- "{\\"formType\\":\\"foreignKey\\",\\"fKName\\":\\"user_dept_fk\\"}" -->',
  `deptName` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `sex` int(3) DEFAULT NULL COMMENT '性别',
  `info` varchar(500) DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`userName`,`password`,`enable`,`phoneNo`,`mail`,`addTime`,`deptId`,`deptName`,`sex`,`info`) values 
(1,'admin','E10ADC3949BA59ABBE56E057F20F883E',0,'12311122211','adafs','2019-10-06',112,'122121',1,'adsfa'),
(66,'1','1',1,'12','12','2019-06-01',112,'12',1,'121221'),
(67,'1','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(68,'1','1',1,'1','1','2019-09-01',111,'1',1,'1'),
(69,'1','1',1,'1','1','2019-06-01',1,'11',1,'1'),
(70,'1','1',1,'1','1','2019-06-01',1,'1',1,'1'),
(71,'1','1',1,'1','1','2019-06-01',111,'11',1,'1'),
(72,'1','1',1,'1','1','2019-06-01',11,'11',1,'1'),
(73,'1','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(74,'11','1',1,'1','1','2019-06-01',1,'1',1,'1'),
(75,'1','1',1,'1','1','2019-01-01',11,'11',1,'1'),
(76,'1','1',1,'1','1','2019-09-01',11,'1',1,'1'),
(77,'11','1',1,'1','1','2019-01-01',11,'11',1,'1'),
(78,'1','1',1,'1','1','2019-09-01',11,'1',1,'1'),
(79,'1','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(80,'1','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(81,'1','1',1,'1','1','2019-01-09',11,'11',11,'11'),
(82,'1','1',1,'1','1','2019-01-09',11,'11',11,'11'),
(83,'1','1',1,'1','1','2019-09-01',1,'1',1,'1'),
(84,'111','11',11,'11','11','2019-06-01',11,'11',1,'1'),
(85,'2','2',1,'1','1','2019-06-01',11,'11',1,'1'),
(86,'1','2',1,'11','11','2019-06-01',11,'11',1,'1'),
(87,'1','1',1,'1','1','2019-09-01',11,'1',1,'1'),
(88,'1','1',1,'1','1','2019-09-01',1,'1',1,'1'),
(89,'11','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(90,'1','1',1,'1','1','2019-06-01',1,'1',1,'1'),
(91,'11','11',1,'11','1','2019-06-01',11,'11',1,'1'),
(92,'1','1',1,'1','1','2019-06-01',11,'1',1,'1'),
(93,'1','1',1,'1','1','2019-06-01',11,'11',1,'1'),
(94,'1','1',1,'1','1','2019-06-01',11,'1',1,'1'),
(95,'1','1',1,'1','1','2019-01-01',11,'1',1,'1'),
(96,'111','1',1,'1','1','2019-01-01',11,'1',1,'1'),
(97,'11','1',1,'1','1','2019-01-01',111,'1',1,'1'),
(98,'11','1',1,'1','1','2019-01-01',11,'11',1,'1'),
(99,'1','1',1,'1','1','2019-06-01',1,'1',1,'1'),
(101,'1','1',1,'1','1','2019-06-02',1,'1',1,'1'),
(102,'1','1',1,'1','1','2019-01-01',11,'1',1,'1'),
(103,'1','1',1,'1','1','2019-07-01',1,'1',1,'1'),
(104,'1','1',1,'1','1','2019-09-01',1,'1',1,'1'),
(105,'1','1',1,'1','1','2019-08-01',1,'1',1,'1'),
(106,'1','1',1,'1','1','2019-01-01',11,'11',1,'1'),
(107,'1','1',1,'1','1','2019-04-01',1,'1',1,'1'),
(108,'1','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(109,'1','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(110,'1','1',1,'1','1','2019-01-01',11,'1',1,'1'),
(111,'1','1',1,'1','1','2019-06-01',1,'1',1,'1'),
(113,'1','1',1,'1','1','2019-01-01',11,'11',1,'1'),
(114,'1','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(115,'1','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(116,'1','1',1,'1','1','2019-01-01',11,'1',1,'1'),
(117,'1','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(118,'1','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(119,'11','11',1,'1','1','2019-01-01',11,'1',1,'1'),
(122,'11','1',1,'1','1','2019-06-01',12,'11',1,'1'),
(126,'12','1',1,'1','1','2019-01-01',1,'1',1,'1'),
(127,'1','1',1,'1','1','2019-01-02',11,'1',1,'1'),
(128,'1','1',1,'1','1','2019-01-01',11,'11',1,'1'),
(129,'1','1',1,'1','1','2019-01-01',11,'11',1,'1'),
(130,'1','1',1,'1','1','2019-09-01',12,'12',1,'1'),
(131,'1','1',1,'1','1','2019-04-01',12,'1',1,'1'),
(132,'1','1',1,'1','1','2019-01-01',11,'1',1,'1'),
(133,'6666','1',1,'1','1','2019-01-01',11,'11',1,'1'),
(134,'1','1',0,'11','11','2019-06-01',21,'11',1,'1'),
(135,'11','11',0,'111','2019-06-01','2019-01-01',11,'1',1,'1'),
(136,'11','11',0,'1','11','2019-10-11',11,'1',1,'1'),
(137,'112','11',0,'11','11','2019-10-14',11,'1',1,'1'),
(138,'1','1',0,'11','11','2019-10-29',10201,'物联网研发小组',1,'1'),
(139,'1','1',0,'12','12','2019-10-22',102,'总部物联网产业部',1,'1'),
(140,'1','1',0,'1','1','2019-10-23',10104,'郑州东区分公司金盾产业部',1,'1'),
(141,'1','1',0,'1','1','2019-10-22',10201,'物联网研发小组',1,'1'),
(142,'1','1',0,'1','1','2019-10-22',103,'总部IT产业部',1,'1');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `roleKey` varchar(100) DEFAULT NULL COMMENT '角色识别key',
  PRIMARY KEY (`id`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
