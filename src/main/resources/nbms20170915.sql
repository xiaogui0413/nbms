/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.56 : Database - nbms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nbms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `nbms`;

/*Table structure for table `tab_devstockinmngt` */

DROP TABLE IF EXISTS `tab_devstockinmngt`;

CREATE TABLE `tab_devstockinmngt` (
  `sn` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nDevType` int(11) DEFAULT NULL COMMENT '设备类型',
  `nSubtype` int(11) DEFAULT NULL COMMENT '设备子类型',
  `sDevID` varchar(50) DEFAULT NULL COMMENT '设备ID',
  `sDevLabel` varchar(50) DEFAULT NULL COMMENT '设备标签',
  `sDevName` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `sStockIntType` varchar(50) DEFAULT NULL COMMENT '入库类型(外购入库/受托代理入库/退还入库/赠送入库)',
  `sStorageName` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `sSupplierName` varchar(50) DEFAULT NULL COMMENT '供货商名称',
  `sRegistrant` varchar(50) DEFAULT NULL COMMENT '登记人员',
  `StorageTime` varchar(50) DEFAULT NULL COMMENT '入库时间',
  `sRemark` varchar(50) DEFAULT NULL COMMENT '备注',
  `Spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `Spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tab_devstockinmngt` */

insert  into `tab_devstockinmngt`(`sn`,`nDevType`,`nSubtype`,`sDevID`,`sDevLabel`,`sDevName`,`sStockIntType`,`sStorageName`,`sSupplierName`,`sRegistrant`,`StorageTime`,`sRemark`,`Spare1`,`Spare2`) values (1,0,0,NULL,NULL,'发电机００１',NULL,'仓库Ａ','供应商Ａ','刘工','2017-09-06 10:30:56','1',NULL,NULL),(2,0,0,NULL,NULL,'汽油发电机',NULL,'仓库Ｂ','供应商Ａ','王工','2017-09-15 14:50:03','11',NULL,NULL);

/*Table structure for table `tab_devstockoutmngt` */

DROP TABLE IF EXISTS `tab_devstockoutmngt`;

CREATE TABLE `tab_devstockoutmngt` (
  `sn` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nDevType` int(11) DEFAULT NULL COMMENT '设备类型',
  `nSubtype` int(11) DEFAULT NULL COMMENT '设备子类型',
  `sDevID` varchar(50) DEFAULT NULL COMMENT '设备ID',
  `sDevLabel` varchar(50) DEFAULT NULL COMMENT '设备标签',
  `sDevName` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `sStockOutType` varchar(50) DEFAULT NULL COMMENT '出库类型(外借/赠送/报销/送修)',
  `sStorageName` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `sUnitName` varchar(50) DEFAULT NULL COMMENT '单位',
  `sResponsiblePerson` varchar(50) DEFAULT NULL COMMENT '负责人',
  `sTelphone` varchar(50) DEFAULT NULL COMMENT '联系号码',
  `sRegistrant` varchar(50) DEFAULT NULL COMMENT '登记人员',
  `StockOutTime` varchar(50) DEFAULT NULL COMMENT '出库时间',
  `sRemark` varchar(50) DEFAULT NULL COMMENT '备注',
  `Spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `Spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tab_devstockoutmngt` */

insert  into `tab_devstockoutmngt`(`sn`,`nDevType`,`nSubtype`,`sDevID`,`sDevLabel`,`sDevName`,`sStockOutType`,`sStorageName`,`sUnitName`,`sResponsiblePerson`,`sTelphone`,`sRegistrant`,`StockOutTime`,`sRemark`,`Spare1`,`Spare2`) values (3,1,NULL,NULL,NULL,'哈哈','外借','仓库ＢＢ','哈哈','哈哈','哈哈','哈哈','2017-09-14 09:45:43','哈哈',NULL,NULL),(4,1,NULL,NULL,NULL,'发电机001','外借','仓库ＡＡ','深圳伊戈尔','老王','13886620444','李工','2017-09-06 09:25:31','测试',NULL,NULL);

/*Table structure for table `tab_nbms_devattr` */

DROP TABLE IF EXISTS `tab_nbms_devattr`;

CREATE TABLE `tab_nbms_devattr` (
  `sn` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nDevType` int(11) NOT NULL COMMENT '设备类型',
  `nSubtype` int(11) DEFAULT NULL COMMENT '设备子类型',
  `sDevID` varchar(50) DEFAULT NULL COMMENT '设备编号',
  `nLocaMode` tinyint(2) DEFAULT NULL COMMENT '定位方式 1:LBS基站定位 2:GPS定位',
  `sDevName` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `x_pos` double DEFAULT NULL COMMENT '经度',
  `y_pos` double DEFAULT NULL COMMENT '纬度',
  `fHop` int(11) DEFAULT NULL COMMENT '可信度，米',
  `fBatteryVolt` float DEFAULT NULL COMMENT '电池电压',
  `nRSOC` float DEFAULT NULL COMMENT '剩余电量 (百分比)',
  `nAlarm` int(11) DEFAULT NULL COMMENT '告警状态　1:告警  0:正常',
  `nState` tinyint(2) DEFAULT NULL COMMENT '在线状态　1:在线  0:不在线',
  `SamplingTime` varchar(50) DEFAULT NULL COMMENT '数据采集时间',
  `sIPAddr` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `nPort` int(1) DEFAULT NULL COMMENT '端口号',
  `sRemark` varchar(50) DEFAULT NULL COMMENT '备注',
  `Spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `Spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tab_nbms_devattr` */

insert  into `tab_nbms_devattr`(`sn`,`nDevType`,`nSubtype`,`sDevID`,`nLocaMode`,`sDevName`,`x_pos`,`y_pos`,`fHop`,`fBatteryVolt`,`nRSOC`,`nAlarm`,`nState`,`SamplingTime`,`sIPAddr`,`nPort`,`sRemark`,`Spare1`,`Spare2`) values (1,1,1,'1',1,'发电机001',113.928235,22.494423,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,1,'1',1,'发电机002',113.926263,22.500359,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,1,'1',1,'发电机003',113.906263,22.510359,NULL,NULL,NULL,NULL,-1,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,1,'1',1,'发电机004',113.916263,22.508359,NULL,NULL,NULL,NULL,-1,NULL,NULL,NULL,NULL,NULL,'   ');

/*Table structure for table `tab_userdata` */

DROP TABLE IF EXISTS `tab_userdata`;

CREATE TABLE `tab_userdata` (
  `id` varchar(20) NOT NULL COMMENT '用户ID',
  `clerkName` varchar(30) NOT NULL COMMENT '用户名',
  `clerkType` int(4) DEFAULT NULL COMMENT '用户类型',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `gsm_phone` varchar(30) DEFAULT NULL COMMENT '手机',
  `contact` varchar(50) DEFAULT NULL COMMENT '联系方式',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `emailAddr` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `memo` varchar(50) DEFAULT NULL COMMENT '备注',
  `del_state` tinyint(2) DEFAULT NULL COMMENT '删除状态',
  `last_login` varchar(50) DEFAULT NULL COMMENT '最后登入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tab_userdata` */

insert  into `tab_userdata`(`id`,`clerkName`,`clerkType`,`password`,`gsm_phone`,`contact`,`address`,`emailAddr`,`memo`,`del_state`,`last_login`) values ('1','0',NULL,'000000','13886620499','13886620495','湖北武汉','13886620499@qq.com','11',0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
