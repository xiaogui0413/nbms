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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `tab_devstockinmngt` */

insert  into `tab_devstockinmngt`(`sn`,`nDevType`,`nSubtype`,`sDevID`,`sDevLabel`,`sDevName`,`sStockIntType`,`sStorageName`,`sSupplierName`,`sRegistrant`,`StorageTime`,`sRemark`,`Spare1`,`Spare2`) values (1,0,0,'1001',NULL,'发电机001',NULL,'仓库Ａ','供应商Ａ','刘工','2017-09-06 10:30:56','1',NULL,NULL),(2,0,0,'1002',NULL,'汽油发电机01',NULL,'仓库Ｂ','供应商Ａ','王工','2017-09-15 14:50:03','11',NULL,NULL),(3,1,1,'1003',NULL,'汽油发电机02',NULL,'仓库Ｂ','供应商Ａ','王工','2017-09-15 14:50:03','111',NULL,NULL),(4,2,0,'1004',NULL,'测试001','入库类型1','测试','测试哦','测试','2017-09-14 05:25:15','测试',NULL,NULL),(6,1,1,'1006',NULL,'汽油发电机测试','入库类型1','仓库A','供应商A','小A','2017-09-07 10:50:25','1',NULL,NULL),(7,1,1,'1007',NULL,'发电机A','入库类型1','仓库A','供应商A','111','2017-09-07 10:30:01','1',NULL,NULL),(8,1,1,'1008',NULL,'1','入库类型1','6556','89','23','2017-09-02 07:15:21','55',NULL,NULL),(9,1,1,'1202',NULL,'1202','入库类型1','1202','1202','1202','2017-09-08 02:10:45','1202',NULL,NULL),(10,1,1,'1203',NULL,'发电机','入库类型1','仓库1203','1','1','2017-09-25 11:40:52','1203',NULL,NULL),(17,1,1,'110',NULL,'发电机01','入库类型1','仓库A','供应商A','小Q','2017-09-02 03:15:48','测试',NULL,NULL);

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
  `state` tinyint(2) DEFAULT NULL COMMENT '出库状态',
  `Spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `tab_devstockoutmngt` */

insert  into `tab_devstockoutmngt`(`sn`,`nDevType`,`nSubtype`,`sDevID`,`sDevLabel`,`sDevName`,`sStockOutType`,`sStorageName`,`sUnitName`,`sResponsiblePerson`,`sTelphone`,`sRegistrant`,`StockOutTime`,`sRemark`,`state`,`Spare2`) values (3,1,0,NULL,NULL,'哈哈','外借','仓库BB','哈哈','哈哈','哈哈','哈哈','2017-09-14 09:45:43','哈哈',1,NULL),(4,1,0,NULL,NULL,'发电机001','外借','仓库ZZ','深圳伊戈尔','老王','13886620444','李工','2017-09-06 09:25:31','测试',1,NULL),(8,1,0,NULL,NULL,'汽油发电机02','外借','仓库Ｂ','放松放松','放松放松','13886620000','小A','2017-09-07 06:30:18','11',1,NULL),(9,2,NULL,NULL,NULL,'测试001','外借','测试','AA','小N','138625659664','小红','2017-09-01 07:35:13','无',1,NULL),(10,1,NULL,NULL,NULL,'汽油发电机测试','测试BBB','仓库A','1111','1111','1111','1111','1899-12-01 07:15:00','11111',1,NULL);

/*Table structure for table `tab_nbms_dev_hisdata` */

DROP TABLE IF EXISTS `tab_nbms_dev_hisdata`;

CREATE TABLE `tab_nbms_dev_hisdata` (
  `sn` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nDevType` int(11) DEFAULT NULL COMMENT '设备类型',
  `nSubtype` int(11) DEFAULT NULL COMMENT '设备子类型',
  `nDevAddr` int(20) DEFAULT NULL COMMENT '设备地址',
  `sDevID` varchar(50) DEFAULT NULL COMMENT '设备ID',
  `nLocaMode` int(11) DEFAULT NULL COMMENT '定位方式 1:LBS基站定位 2:GPS定位',
  `sDevName` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `x_pos` double DEFAULT NULL COMMENT '经度',
  `y_pos` double DEFAULT NULL COMMENT '纬度',
  `fHop` double DEFAULT NULL COMMENT '可信度，米',
  `fBatteryVolt` double DEFAULT NULL COMMENT '电池电压',
  `fRSOC` double DEFAULT NULL COMMENT '剩余电量 (百分比)',
  `fVolt` double DEFAULT NULL COMMENT '供电电压',
  `SamplingTime` varchar(50) DEFAULT NULL COMMENT '数据采集时间',
  `sRemark` varchar(50) DEFAULT NULL COMMENT '备注',
  `Spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `Spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `tab_nbms_dev_hisdata` */

insert  into `tab_nbms_dev_hisdata`(`sn`,`nDevType`,`nSubtype`,`nDevAddr`,`sDevID`,`nLocaMode`,`sDevName`,`x_pos`,`y_pos`,`fHop`,`fBatteryVolt`,`fRSOC`,`fVolt`,`SamplingTime`,`sRemark`,`Spare1`,`Spare2`) values (10,1,1,1,'1002',1,'柴油发电机',114.219984,30.59902,0,4.12,50,220,'2017/09/23 14:05:35','8080','',''),(21,1,1,1,'1002',1,'柴油发电机',114.219984,30.59902,0,4.12,50,220,'2017/09/23 14:05:35','8080','',''),(24,1,1,1,'1001',1,'汽油直流发电机',114.219984,30.59902,0,4.13,50,220,'2017/09/23 14:10:13','8080','','');

/*Table structure for table `tab_nbms_dev_rtdata` */

DROP TABLE IF EXISTS `tab_nbms_dev_rtdata`;

CREATE TABLE `tab_nbms_dev_rtdata` (
  `sn` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nDevType` int(11) DEFAULT NULL COMMENT '设备类型',
  `nSubtype` int(11) DEFAULT NULL COMMENT '设备子类型',
  `nDevAddr` int(20) DEFAULT NULL COMMENT '设备地址',
  `sDevID` varchar(50) DEFAULT NULL COMMENT '设备ID',
  `nLocaMode` int(11) DEFAULT NULL COMMENT '定位方式 1:LBS基站定位 2:GPS定位',
  `sDevName` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `x_pos` double DEFAULT NULL COMMENT '经度',
  `y_pos` double DEFAULT NULL COMMENT '纬度',
  `fHop` double DEFAULT NULL COMMENT '可信度，米',
  `fBatteryVolt` double DEFAULT NULL COMMENT '电池电压',
  `fRSOC` double DEFAULT NULL COMMENT '剩余电量 (百分比)',
  `fVolt` double DEFAULT NULL COMMENT '供电电压',
  `nAlarm` int(11) DEFAULT NULL COMMENT '告警状态　1:告警  0:正常',
  `nState` int(11) DEFAULT NULL COMMENT '在线状态　1:在线  0:不在线',
  `SamplingTime` varchar(50) DEFAULT NULL COMMENT '数据采集时间',
  `sIPAddr` varchar(50) DEFAULT NULL COMMENT 'IP地',
  `nPort` int(11) DEFAULT NULL COMMENT '端口号',
  `sRemark` varchar(50) DEFAULT NULL COMMENT '备注',
  `Spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `Spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tab_nbms_dev_rtdata` */

insert  into `tab_nbms_dev_rtdata`(`sn`,`nDevType`,`nSubtype`,`nDevAddr`,`sDevID`,`nLocaMode`,`sDevName`,`x_pos`,`y_pos`,`fHop`,`fBatteryVolt`,`fRSOC`,`fVolt`,`nAlarm`,`nState`,`SamplingTime`,`sIPAddr`,`nPort`,`sRemark`,`Spare1`,`Spare2`) values (1,1,1,1,'1001',1,'汽油直流发电机',114.219984,30.59902,0,4.13,50,220,0,1,'2017/09/23 14:10:13','/127.0.0.1',57472,'8080','',''),(2,1,1,1,'1001',1,'汽油直流发电机',114.219984,30.59902,0,4.13,50,220,NULL,NULL,'2017/09/23 14:10:13',NULL,NULL,'8080','',''),(3,1,1,1,'1002',1,'柴油发电机',114.219984,30.59902,0,4.12,50,220,0,1,'2017/09/23 14:05:35','/127.0.0.1',57472,'8080','',''),(10,1,1,1,'1002',1,'柴油发电机',114.219984,30.59902,0,4.12,50,220,NULL,NULL,'2017/09/23 14:05:35',NULL,NULL,'8080','','');

/*Table structure for table `tab_nbms_devattr` */

DROP TABLE IF EXISTS `tab_nbms_devattr`;

CREATE TABLE `tab_nbms_devattr` (
  `sn` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nDevType` int(11) NOT NULL COMMENT '设备类型',
  `nSubtype` int(11) DEFAULT NULL COMMENT '设备子类型',
  `sDevID` varchar(50) DEFAULT NULL COMMENT '设备编号',
  `nLocaMode` varchar(11) DEFAULT NULL COMMENT '定位方式 1:LBS基站定位 2:GPS定位',
  `sDevName` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `x_pos` double DEFAULT NULL COMMENT '经度',
  `y_pos` double DEFAULT NULL COMMENT '纬度',
  `fHop` double DEFAULT NULL COMMENT '可信度，米',
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
  PRIMARY KEY (`sn`),
  KEY `FK_tab_nbms_devattr` (`nSubtype`),
  CONSTRAINT `FK_tab_nbms_devattr` FOREIGN KEY (`nSubtype`) REFERENCES `tab_subtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `tab_nbms_devattr` */

insert  into `tab_nbms_devattr`(`sn`,`nDevType`,`nSubtype`,`sDevID`,`nLocaMode`,`sDevName`,`x_pos`,`y_pos`,`fHop`,`fBatteryVolt`,`nRSOC`,`nAlarm`,`nState`,`SamplingTime`,`sIPAddr`,`nPort`,`sRemark`,`Spare1`,`Spare2`) values (1,1,1,'1001','GPS','汽油发电机001',113.92083,22.519327,5,4.8,1,1,1,'2017-09-28 12:12:20',NULL,9000,'无',NULL,NULL);

/*Table structure for table `tab_subtype` */

DROP TABLE IF EXISTS `tab_subtype`;

CREATE TABLE `tab_subtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` int(11) NOT NULL COMMENT '分类代码',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `image_path` varchar(50) DEFAULT NULL COMMENT '图片路径',
  `detail` varchar(200) DEFAULT NULL COMMENT '分类描述',
  `parentCode` int(11) DEFAULT NULL COMMENT '父分类id',
  PRIMARY KEY (`id`),
  KEY `FK_tab_subtype` (`parentCode`),
  CONSTRAINT `FK_tab_subtype` FOREIGN KEY (`parentCode`) REFERENCES `tab_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tab_subtype` */

insert  into `tab_subtype`(`id`,`code`,`name`,`image_path`,`detail`,`parentCode`) values (1,0,'汽油发电机',NULL,NULL,1);

/*Table structure for table `tab_type` */

DROP TABLE IF EXISTS `tab_type`;

CREATE TABLE `tab_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(50) DEFAULT NULL COMMENT '分类代码',
  `name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `detail` varchar(200) DEFAULT NULL COMMENT '类别描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tab_type` */

insert  into `tab_type`(`id`,`code`,`name`,`detail`) values (1,'1001','发电机','发电机类'),(2,'1002','冲锋艇','AAAAA');

/*Table structure for table `tab_userdata` */

DROP TABLE IF EXISTS `tab_userdata`;

CREATE TABLE `tab_userdata` (
  `id` varchar(50) NOT NULL COMMENT '用户ID',
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

insert  into `tab_userdata`(`id`,`clerkName`,`clerkType`,`password`,`gsm_phone`,`contact`,`address`,`emailAddr`,`memo`,`del_state`,`last_login`) values ('1','admin',0,'000000','13886620499','13886620495','广东深圳','13886620499@qq.com','11',0,NULL),('636ec5b165944807ac3b6dc2be68da4e','胡贵齐',0,'111111',NULL,'123','广东深圳白石洲','456','无12',1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
