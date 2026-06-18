/*
SQLyog v10.2 
MySQL - 8.4.0 : Database - hot
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hot`;

/*Table structure for table `a_hot` */

CREATE TABLE `a_hot` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '红人',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `arch_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '档案名',
  `state` int DEFAULT NULL COMMENT '状态',
  `dead_date` date DEFAULT NULL,
  `reason` text COLLATE utf8mb4_bin,
  `create_user` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `a_hot` */

insert  into `a_hot`(`id`,`name`,`arch_name`,`state`,`dead_date`,`reason`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (5,'导入2026-06-15 10:59:19','导入2026-06-15 10:59:20',1,NULL,NULL,'1','2026-06-15 10:59:20','1','2026-06-15 10:59:20','0');

/*Table structure for table `a_hot_basic` */

CREATE TABLE `a_hot_basic` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '红人详情',
  `hot_id` int DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '渠道',
  `hots_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '红人ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '红人昵称',
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '国家',
  `contact` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系方式',
  `hot_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '红人量级',
  `hot_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '红人类型',
  `follower` bigint DEFAULT NULL COMMENT '粉丝量',
  `juxing_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '聚星平台链接',
  `url_link` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'URL链接',
  `avg_play_count` bigint DEFAULT NULL COMMENT '平均播放量',
  `avg_iact_rate` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '平均互动率',
  `long_avg_views` bigint DEFAULT NULL COMMENT '最近10个长视频平均观看量',
  `long_iact_rate` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '最近10个长视频互动率',
  `short_avg_views` bigint DEFAULT NULL COMMENT '最近10个短视频平均观看量',
  `score_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '评分等级',
  `is_match` int DEFAULT NULL COMMENT '是否匹配（红人ID、红人昵称、渠道同步时与聚星平台数据是否匹配）',
  `create_user` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='红人信息表';

/*Data for the table `a_hot_basic` */

insert  into `a_hot_basic`(`id`,`hot_id`,`channel`,`hots_id`,`nickname`,`country`,`contact`,`hot_level`,`hot_type`,`follower`,`juxing_url`,`url_link`,`avg_play_count`,`avg_iact_rate`,`long_avg_views`,`long_iact_rate`,`short_avg_views`,`score_level`,`is_match`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (4,5,'YT','1','1','1','1','1','1',1,'1','1',1,'1',1,'1',1,'1',NULL,'1','2026-06-15 10:59:20','1','2026-06-15 10:59:20','0'),(5,5,'YT','2','2','2','2','2','2',2,'2','2',2,'2',2,'2',2,'2',NULL,'1','2026-06-15 10:59:20','1','2026-06-15 10:59:20','0');

/*Table structure for table `a_hot_coop` */

CREATE TABLE `a_hot_coop` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '合作单',
  `doc_num` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '单据号',
  `bd_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'BD名称',
  `hotb_id` int DEFAULT NULL COMMENT '红人详情id',
  `hots_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '红人id',
  `channel` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '渠道',
  `country` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '国家',
  `invit_id` int DEFAULT NULL COMMENT '合作邀约单id',
  `project_id` int DEFAULT NULL COMMENT '项目Id',
  `state` int NOT NULL DEFAULT '1' COMMENT '状态',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `a_hot_coop` */

insert  into `a_hot_coop`(`id`,`doc_num`,`bd_name`,`hotb_id`,`hots_id`,`channel`,`country`,`invit_id`,`project_id`,`state`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (1,'1','1',1,'1','1','1',1,1,1,NULL,NULL,NULL,NULL,'0'),(2,'COOP1780969593553','admin',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','2026-06-09 09:46:33','1','2026-06-09 09:46:33','0'),(3,'COOP1780969784699','admin',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','2026-06-09 09:49:45','1','2026-06-09 09:49:45','0');

/*Table structure for table `a_hot_coop_data` */

CREATE TABLE `a_hot_coop_data` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '内容数据',
  `coop_id` int DEFAULT NULL,
  `rele_chan` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发布渠道',
  `rele_acct` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发布账号',
  `amount` decimal(26,4) DEFAULT NULL COMMENT '付款金额',
  `apply_time` datetime DEFAULT NULL COMMENT '请款时间',
  `pay_time` datetime DEFAULT NULL COMMENT '完成付款时间',
  `reles_date` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '需求的发布排期',
  `vid_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视频类型（长/短）',
  `vid_draft_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视频草稿链接',
  `mate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '广告素材名称',
  `pro_draft_time` datetime DEFAULT NULL COMMENT '提供草稿时间',
  `rele_time` datetime DEFAULT NULL COMMENT '发布时间',
  `online_url` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上线链接',
  `ad_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '广告授权码',
  `ad_code_expiry` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '广告授权码有效期',
  `duration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '监控时长',
  `creativ` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内容创意度',
  `score` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '评分',
  `score_level` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '评分等级',
  `views` bigint DEFAULT NULL COMMENT '观看量',
  `likes` bigint DEFAULT NULL COMMENT '点赞数',
  `comments` bigint DEFAULT NULL COMMENT '评论数',
  `shares` bigint DEFAULT NULL COMMENT '分享数',
  `favors` bigint DEFAULT NULL COMMENT '收藏数',
  `rate_nox` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '互动率 Nox',
  `dlj_clicks` bigint DEFAULT NULL COMMENT '短链点击数',
  `cpm` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'CPM 千次展示成本',
  `cpc` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'CPC 单次点击成本',
  `period` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '投放期',
  `spend` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '消耗金额',
  `plays` bigint DEFAULT NULL COMMENT '播放量',
  `clicks` bigint DEFAULT NULL COMMENT '点击量',
  `conve` bigint DEFAULT NULL COMMENT '转化量',
  `roas` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '广告 ROAS',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='内容数据表';

/*Data for the table `a_hot_coop_data` */

insert  into `a_hot_coop_data`(`id`,`coop_id`,`rele_chan`,`rele_acct`,`amount`,`apply_time`,`pay_time`,`reles_date`,`vid_type`,`vid_draft_url`,`mate_name`,`pro_draft_time`,`rele_time`,`online_url`,`ad_code`,`ad_code_expiry`,`duration`,`creativ`,`score`,`score_level`,`views`,`likes`,`comments`,`shares`,`favors`,`rate_nox`,`dlj_clicks`,`cpm`,`cpc`,`period`,`spend`,`plays`,`clicks`,`conve`,`roas`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (1,1,'1','1','1.0000','2026-06-09 09:12:53','2026-06-09 09:12:58','1','1','1','1','2026-06-09 09:13:08','2026-06-09 09:13:10','1','1','1','1','1','1','1',1,1,1,1,1,'1',1,'1','1','1','1',1,1,1,'1','1','2026-06-09 09:13:34',NULL,NULL,'0');

/*Table structure for table `a_hot_coop_form` */

CREATE TABLE `a_hot_coop_form` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '合作的形式',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `comm` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `a_hot_coop_form` */

insert  into `a_hot_coop_form`(`id`,`name`,`comm`,`del_flag`) values (1,'纯佣金+固定费用',NULL,'0'),(2,'置换+固定费用',NULL,'0'),(3,'固定费用+固定费用',NULL,'0'),(4,'佣金+固定费用',NULL,'0');

/*Table structure for table `a_hot_coop_product` */

CREATE TABLE `a_hot_coop_product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '产品信息',
  `coop_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL COMMENT '产品id',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品型号',
  `product_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品颜色',
  `video_auth` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视频授权',
  `video_auth_pur` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视频授权用途',
  `ad_auth` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '广告授权',
  `coop_form` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作的形式',
  `comm_rate` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '佣金比例',
  `pay_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '付款方式',
  `plat_form` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品销售平台',
  `pay_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收款信息',
  `pay_addres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收款地址',
  `coop_fee` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作费用',
  `sash_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '寄样单号',
  `carrier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '运输商',
  `sash_time` datetime DEFAULT NULL COMMENT '寄样时间',
  `wl_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '物流状态',
  `dh_date` date DEFAULT NULL COMMENT '到货日期',
  `utm_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'UTM追踪链接',
  `sales_period` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '销售期',
  `clicks` bigint DEFAULT NULL COMMENT '访问量/点击量',
  `sales` bigint DEFAULT NULL COMMENT '销售数量',
  `dis_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '折扣代码',
  `gmv` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'GMV',
  `roas` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ROAS',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='产品合作信息表';

/*Data for the table `a_hot_coop_product` */

insert  into `a_hot_coop_product`(`id`,`coop_id`,`product_id`,`product_name`,`product_model`,`product_color`,`video_auth`,`video_auth_pur`,`ad_auth`,`coop_form`,`comm_rate`,`pay_method`,`plat_form`,`pay_info`,`pay_addres`,`coop_fee`,`sash_no`,`carrier`,`sash_time`,`wl_status`,`dh_date`,`utm_url`,`sales_period`,`clicks`,`sales`,`dis_code`,`gmv`,`roas`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (1,1,1,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','2026-06-09 09:13:55','1','2026-06-09','1','1',1,1,'1','1','1','1','2026-06-09 09:14:06',NULL,NULL,'0'),(2,1,2,'2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2026-06-10 09:37:23','2','2026-06-10','2','2',2,2,'2','2','2','1','2026-06-10 09:37:45',NULL,NULL,'0');

/*Table structure for table `a_hot_coop_sett` */

CREATE TABLE `a_hot_coop_sett` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '结算数据',
  `coop_id` int DEFAULT NULL,
  `apply_time` datetime DEFAULT NULL COMMENT '请款时间',
  `pay_time` datetime DEFAULT NULL COMMENT '完成付款时间',
  `pay_amount` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '付款金额',
  `create_user` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `a_hot_coop_sett` */

insert  into `a_hot_coop_sett`(`id`,`coop_id`,`apply_time`,`pay_time`,`pay_amount`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (1,1,'2026-06-09 09:14:18','2026-06-09 09:14:20','1','1','2026-06-09 09:14:23',NULL,NULL,'0');

/*Table structure for table `a_hot_factor` */

CREATE TABLE `a_hot_factor` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `channel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '渠道(YT/IG/TK等)',
  `video_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视频类型',
  `sales_k1` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '销售数据分摊系数K1',
  `coop_k2` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作费用分摊系数K2',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除标志(0:正常 1:删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='渠道分摊系数表';

/*Data for the table `a_hot_factor` */

insert  into `a_hot_factor`(`id`,`channel`,`video_type`,`sales_k1`,`coop_k2`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (1,'1','1','1','1',NULL,NULL,NULL,NULL,'0');

/*Table structure for table `a_hot_invit` */

CREATE TABLE `a_hot_invit` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '邀约单',
  `doc_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '单据号',
  `bd_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'BD名称',
  `conn_time` datetime DEFAULT NULL COMMENT '建联时间',
  `agcc_time` datetime DEFAULT NULL COMMENT '同意沟通合作时间',
  `hotb_id` int DEFAULT NULL COMMENT '红人详情id',
  `hots_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '红人id',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '渠道',
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '国家',
  `state` int NOT NULL DEFAULT '1' COMMENT '状态',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `a_hot_invit` */

insert  into `a_hot_invit`(`id`,`doc_num`,`bd_name`,`conn_time`,`agcc_time`,`hotb_id`,`hots_id`,`channel`,`country`,`state`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (4,'1','1','2026-06-10 10:52:49','2026-06-10 10:52:52',1,'1','1','1',1,'1','2026-06-10 10:53:05',NULL,NULL,'0');

/*Table structure for table `a_hot_invit_dema` */

CREATE TABLE `a_hot_invit_dema` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '邀约单需求',
  `invit_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL COMMENT '产品id',
  `product_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品型号',
  `product_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品颜色',
  `coop_channel` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作渠道',
  `rele_acc` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发布账号',
  `rele_num` int DEFAULT NULL COMMENT '发布数量',
  `video_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视频类型',
  `video_auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视频授权',
  `auth_pupo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '授权用途',
  `ad_auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '广告授权',
  `coop_form` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作的形式',
  `comm_rate` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '佣金比例',
  `coop_fee` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作的费用',
  `plat_form` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品销售平台',
  `create_user` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='合作需求表';

/*Data for the table `a_hot_invit_dema` */

insert  into `a_hot_invit_dema`(`id`,`invit_id`,`product_id`,`product_name`,`product_model`,`product_color`,`coop_channel`,`rele_acc`,`rele_num`,`video_type`,`video_auth`,`auth_pupo`,`ad_auth`,`coop_form`,`comm_rate`,`coop_fee`,`plat_form`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (1,4,1,'1','1','1','1','1',1,'1','1','1','1','1','1','1','1','1','2026-06-10 10:53:26',NULL,NULL,'0');

/*Table structure for table `a_hot_target` */

CREATE TABLE `a_hot_target` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '内容目标配置',
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '国家',
  `channel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '渠道(YT/IG/TK等)',
  `hot_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '红人类型',
  `hot_level` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '红人量级',
  `video_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视频类型',
  `view_target` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '观看量目标',
  `iactr_target` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '互动率目标',
  `clickr_target` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '点击率目标',
  `conver_target` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '转化率目标',
  `cpm_target` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'CPM目标',
  `roas_target` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ROAS目标',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除标志(0:正常 1:删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='红人合作目标表';

/*Data for the table `a_hot_target` */

insert  into `a_hot_target`(`id`,`country`,`channel`,`hot_type`,`hot_level`,`video_type`,`view_target`,`iactr_target`,`clickr_target`,`conver_target`,`cpm_target`,`roas_target`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (1,'1','1','1','1','1','1','1','1','1','1','1',NULL,NULL,'1','2026-06-14 17:51:06','1');

/*Table structure for table `a_product` */

CREATE TABLE `a_product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品库',
  `erp_code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ERP编码',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品名称',
  `model` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品型号',
  `color` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品颜色',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `a_product` */

insert  into `a_product`(`id`,`erp_code`,`name`,`model`,`color`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (1,'1','1','1','1','1','2026-06-10 10:53:35',NULL,'2026-06-14 20:37:31','0');

/*Table structure for table `a_project` */

CREATE TABLE `a_project` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '项目',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `a_project` */

insert  into `a_project`(`id`,`name`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (1,'测试','1','2026-06-08 14:41:31','1','2026-06-08 14:53:03','0');

/*Table structure for table `erp_material` */

CREATE TABLE `erp_material` (
  `material_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '物料编码',
  `model_number` varchar(100) DEFAULT NULL COMMENT '产品型号',
  `color` varchar(30) DEFAULT NULL COMMENT '颜色',
  `create_time` datetime DEFAULT NULL COMMENT '数据拉取时间',
  `update_time` datetime DEFAULT NULL COMMENT '数据更新时间',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='erp物料表';

/*Data for the table `erp_material` */

/*Table structure for table `sys_butt` */

CREATE TABLE `sys_butt` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '按钮管理',
  `menu_id` int DEFAULT NULL COMMENT '菜单id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `sign` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `sort` int NOT NULL COMMENT '排序',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_butt` */

/*Table structure for table `sys_butt_role` */

CREATE TABLE `sys_butt_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_butt_role` */

insert  into `sys_butt_role`(`id`,`name`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (4,'','1','2026-06-05 14:56:50','1','2026-06-05 14:56:50','0');

/*Table structure for table `sys_butt_role_data` */

CREATE TABLE `sys_butt_role_data` (
  `butt_id` int NOT NULL,
  `butt_role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_butt_role_data` */

/*Table structure for table `sys_data` */

CREATE TABLE `sys_data` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '类型',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_data` */

insert  into `sys_data`(`id`,`name`,`type`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (10,'1','a_hot_coop',NULL,NULL,'1','2026-06-17 18:20:38','1'),(11,'2','a_hot_coop','1','2026-06-17 18:16:34','1','2026-06-17 18:16:34','0'),(12,'2','a_hot_coop','1','2026-06-17 18:17:34','1','2026-06-17 18:17:34','0'),(13,'2','a_hot_coop','1','2026-06-17 18:18:30','1','2026-06-17 18:18:30','0'),(14,'2','a_hot_coop','1','2026-06-17 18:19:48','1','2026-06-17 18:19:48','0');

/*Table structure for table `sys_data_field` */

CREATE TABLE `sys_data_field` (
  `data_id` int DEFAULT NULL,
  `field_id` int DEFAULT NULL,
  `role` int DEFAULT NULL,
  KEY `data_id` (`data_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_data_field` */

insert  into `sys_data_field`(`data_id`,`field_id`,`role`) values (10,1,0),(10,2,0),(10,3,0),(10,4,0),(10,66,0),(14,1,2);

/*Table structure for table `sys_dict` */

CREATE TABLE `sys_dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '字典',
  `value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL COMMENT '类型',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `value` (`value`,`type`,`del_flag`),
  KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`value`,`label`,`type`,`sort`,`del_flag`) values (1,'1','阶段性暂停合作','hot_coop_state','10','0'),(2,'2','黑名单','hot_coop_state','20','0'),(3,'1','是','video_auth','10','0'),(4,'2','否','video_auth','20','0'),(5,'3','待定','video_auth','30','0'),(6,'1','产品付款','pay_method','10','0'),(7,'2','内容付款','pay_method','20','0'),(8,'1','TikTok shop','plat_form','10','0'),(9,'2','Amazon','plat_form','20','0'),(10,'3','Mercado Libre','plat_form','30','0'),(11,'4','Ozon','plat_form','40','0'),(12,'5','Wildberries','plat_form','50','0'),(13,'6','Yandex market','plat_form','60','0'),(14,'7','Shopify','plat_form','70','0'),(15,'1','长','vid_type','10','0'),(16,'2','短','vid_type','20','0'),(17,'1','打开','hot_state','10','0'),(18,'2','关闭','hot_state','20','0'),(19,'1','匹配','is_match','10','0'),(20,'2','不匹配','is_match','20','0'),(21,'1','科技类','hot_type','10','0'),(22,'2','其他类','hot_type','20','0'),(23,'YT','YT','hot_channel','10','0'),(24,'IG','IG','hot_channel','20','0'),(25,'TK','TK','hot_channel','30','0'),(26,'1','开发中','hot_states','10','0'),(27,'2','已关闭','hot_states','20','0'),(28,'a_hot_coop','合作单','sys_data_type','10','0');

/*Table structure for table `sys_field` */

CREATE TABLE `sys_field` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `fields` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `field_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_field` */

insert  into `sys_field`(`id`,`type`,`table`,`field`,`fields`,`field_msg`) values (2,'a_hot_coop','a_hot_coop','doc_num','docNum','单据号'),(3,'a_hot_coop','a_hot_coop','bd_name','bdName','BD名称'),(5,'a_hot_coop','a_hot_coop','hots_id','hotsId','红人id'),(6,'a_hot_coop','a_hot_coop','channel','channel','渠道'),(7,'a_hot_coop','a_hot_coop','country','country','国家'),(18,'a_hot_coop','a_hot_coop_data','rele_chan','releChan','发布渠道'),(19,'a_hot_coop','a_hot_coop_data','rele_acct','releAcct','发布账号'),(20,'a_hot_coop','a_hot_coop_data','amount','amount','付款金额'),(21,'a_hot_coop','a_hot_coop_data','apply_time','applyTime','请款时间'),(22,'a_hot_coop','a_hot_coop_data','pay_time','payTime','完成付款时间'),(23,'a_hot_coop','a_hot_coop_data','reles_date','relesDate','需求的发布排期'),(24,'a_hot_coop','a_hot_coop_data','vid_type','vidType','视频类型（长/短）'),(25,'a_hot_coop','a_hot_coop_data','vid_draft_url','vidUrl','视频草稿链接'),(26,'a_hot_coop','a_hot_coop_data','mate_name','mateName','广告素材名称'),(27,'a_hot_coop','a_hot_coop_data','pro_draft_time','proTime','提供草稿时间'),(28,'a_hot_coop','a_hot_coop_data','rele_time','releTime','发布时间'),(29,'a_hot_coop','a_hot_coop_data','online_url','onlineUrl','上线链接'),(30,'a_hot_coop','a_hot_coop_data','ad_code','adCode','广告授权码'),(31,'a_hot_coop','a_hot_coop_data','ad_code_expiry','adExpiry','广告授权码有效期'),(32,'a_hot_coop','a_hot_coop_data','duration','duration','监控时长'),(33,'a_hot_coop','a_hot_coop_data','creativ','creativ','内容创意度'),(34,'a_hot_coop','a_hot_coop_data','score','score','评分'),(35,'a_hot_coop','a_hot_coop_data','score_level','scoreLevel','评分等级'),(36,'a_hot_coop','a_hot_coop_data','views','views','观看量'),(37,'a_hot_coop','a_hot_coop_data','likes','likes','点赞数'),(38,'a_hot_coop','a_hot_coop_data','comments','comments','评论数'),(39,'a_hot_coop','a_hot_coop_data','shares','shares','分享数'),(40,'a_hot_coop','a_hot_coop_data','favors','favors','收藏数'),(41,'a_hot_coop','a_hot_coop_data','rate_nox','rateNox','互动率 Nox'),(42,'a_hot_coop','a_hot_coop_data','dlj_clicks','dljClicks','短链点击数'),(43,'a_hot_coop','a_hot_coop_data','cpm','cpm','CPM 千次展示成本'),(44,'a_hot_coop','a_hot_coop_data','cpc','cpc','CPC 单次点击成本'),(45,'a_hot_coop','a_hot_coop_data','period','period','投放期'),(46,'a_hot_coop','a_hot_coop_data','spend','spend','消耗金额'),(47,'a_hot_coop','a_hot_coop_data','plays','plays','播放量'),(48,'a_hot_coop','a_hot_coop_data','clicks','clicks','点击量'),(49,'a_hot_coop','a_hot_coop_data','conve','conve','转化量'),(50,'a_hot_coop','a_hot_coop_data','roas','roas','广告 ROAS'),(59,'a_hot_coop','a_hot_coop_product','product_name','productName','产品名称'),(60,'a_hot_coop','a_hot_coop_product','product_model','productModel','产品型号'),(61,'a_hot_coop','a_hot_coop_product','product_color','productColor','产品颜色'),(62,'a_hot_coop','a_hot_coop_product','video_auth','videoAuth','视频授权'),(63,'a_hot_coop','a_hot_coop_product','video_auth_pur','videoPur','视频授权用途'),(64,'a_hot_coop','a_hot_coop_product','ad_auth','adAuth','广告授权'),(65,'a_hot_coop','a_hot_coop_product','coop_form','coopForm','合作的形式'),(66,'a_hot_coop','a_hot_coop_product','comm_rate','commRate','佣金比例'),(67,'a_hot_coop','a_hot_coop_product','pay_method','payMethod','付款方式'),(68,'a_hot_coop','a_hot_coop_product','plat_form','platForm','产品销售平台'),(69,'a_hot_coop','a_hot_coop_product','pay_info','payInfo','收款信息'),(70,'a_hot_coop','a_hot_coop_product','pay_addres','payAddres','收款地址'),(71,'a_hot_coop','a_hot_coop_product','coop_fee','coopFee','合作费用'),(72,'a_hot_coop','a_hot_coop_product','sash_no','sashNo','寄样单号'),(73,'a_hot_coop','a_hot_coop_product','carrier','carrier','运输商'),(74,'a_hot_coop','a_hot_coop_product','sash_time','sashTime','寄样时间'),(75,'a_hot_coop','a_hot_coop_product','wl_status','wlStatus','物流状态'),(76,'a_hot_coop','a_hot_coop_product','dh_date','dhDate','到货日期'),(77,'a_hot_coop','a_hot_coop_product','utm_url','utmUrl','UTM追踪链接'),(78,'a_hot_coop','a_hot_coop_product','sales_period','salesPeriod','销售期'),(79,'a_hot_coop','a_hot_coop_product','clicks','clicks','访问量/点击量'),(80,'a_hot_coop','a_hot_coop_product','sales','sales','销售数量'),(81,'a_hot_coop','a_hot_coop_product','dis_code','disCode','折扣代码'),(82,'a_hot_coop','a_hot_coop_product','gmv','gmv','GMV'),(83,'a_hot_coop','a_hot_coop_product','roas','roas','ROAS'),(91,'a_hot_coop','a_hot_coop_sett','apply_time','applyTime','请款时间'),(92,'a_hot_coop','a_hot_coop_sett','pay_time','payTime','完成付款时间'),(93,'a_hot_coop','a_hot_coop_sett','pay_amount','payAmount','付款金额');

/*Table structure for table `sys_log` */

CREATE TABLE `sys_log` (
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_log` */

/*Table structure for table `sys_menu` */

CREATE TABLE `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单管理',
  `parent_id` int NOT NULL COMMENT '父级编号',
  `parent_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '所有父级编号',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由',
  `component` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由组件',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '组件标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `sort` int NOT NULL COMMENT '排序',
  `type` int DEFAULT NULL COMMENT '菜单类型 1:PC端，2:移动端',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '创建用户',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '修改用户',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_menu` */

/*Table structure for table `sys_menu_role` */

CREATE TABLE `sys_menu_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_menu_role` */

insert  into `sys_menu_role`(`id`,`name`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values (9,'','1','2026-06-05 14:31:04','1','2026-06-05 14:31:04','0'),(10,'测试','1','2026-06-08 17:04:54','1','2026-06-08 17:04:54','0'),(11,'测试','1','2026-06-08 17:24:20','1','2026-06-08 17:24:20','0');

/*Table structure for table `sys_menu_role_data` */

CREATE TABLE `sys_menu_role_data` (
  `menu_id` int NOT NULL,
  `menu_role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_menu_role_data` */

insert  into `sys_menu_role_data`(`menu_id`,`menu_role_id`) values (1,10),(2,10),(1,11),(2,11);

/*Table structure for table `sys_modu` */

CREATE TABLE `sys_modu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '模块管理',
  `menu_id` int DEFAULT NULL COMMENT '菜单id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由',
  `component` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由组件',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '组件标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `sort` int NOT NULL COMMENT '排序',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_modu` */

/*Table structure for table `sys_modu_role` */

CREATE TABLE `sys_modu_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_modu_role` */

/*Table structure for table `sys_modu_role_data` */

CREATE TABLE `sys_modu_role_data` (
  `modu_id` int NOT NULL,
  `modu_role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_modu_role_data` */

/*Table structure for table `sys_user` */

CREATE TABLE `sys_user` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '姓名',
  `login_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '登陆名',
  `pass_word` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `per_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '人员编码',
  `depname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门',
  `user_type` int DEFAULT NULL COMMENT '用户类型',
  `login_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '1' COMMENT '是否可登录 0:否 1:是 2:锁定',
  `passw_time` datetime DEFAULT NULL COMMENT '密码修改时间',
  `error_time` datetime DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `menu_role` int NOT NULL DEFAULT '0' COMMENT '菜单权限 1：所有权限，0：指定权限',
  `modu_role` int NOT NULL DEFAULT '0' COMMENT '模块权限 1：所有权限，0：指定权限',
  `butt_role` int NOT NULL DEFAULT '0' COMMENT '按钮权限 1：所有权限，0：指定权限',
  `data_role` int NOT NULL DEFAULT '0' COMMENT '数据权限 1：所有权限，0：指定权限',
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '修改用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`name`,`login_name`,`pass_word`,`per_code`,`depname`,`user_type`,`login_ip`,`login_date`,`login_flag`,`passw_time`,`error_time`,`error_count`,`menu_role`,`modu_role`,`butt_role`,`data_role`,`create_user`,`create_time`,`update_user`,`update_time`,`remarks`,`del_flag`) values ('1','admin','admin','$2a$10$i3lfK8UZXTQPF8seOrJHUe9lJfSpJXzXkDJg0glkV/6Ix7/obJEH6','1','1',NULL,'0:0:0:0:0:0:0:1','2026-06-18 10:00:48','1',NULL,NULL,0,1,1,1,1,NULL,NULL,'1','2026-06-10 13:44:00',NULL,'0');

/*Table structure for table `sys_user_butt` */

CREATE TABLE `sys_user_butt` (
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `butt_role_id` int NOT NULL,
  KEY `user_id` (`user_id`,`butt_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_user_butt` */

insert  into `sys_user_butt`(`user_id`,`butt_role_id`) values ('1',1),('1',2);

/*Table structure for table `sys_user_data` */

CREATE TABLE `sys_user_data` (
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `data_id` int NOT NULL,
  KEY `user_id` (`user_id`,`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_user_data` */

insert  into `sys_user_data`(`user_id`,`data_id`) values ('1',1),('1',2);

/*Table structure for table `sys_user_menu` */

CREATE TABLE `sys_user_menu` (
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `menu_role_id` int NOT NULL,
  KEY `user_id` (`user_id`,`menu_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_user_menu` */

insert  into `sys_user_menu`(`user_id`,`menu_role_id`) values ('1',1),('1',2);

/*Table structure for table `sys_user_modu` */

CREATE TABLE `sys_user_modu` (
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `modu_role_id` int NOT NULL,
  KEY `user_id` (`user_id`,`modu_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sys_user_modu` */

insert  into `sys_user_modu`(`user_id`,`modu_role_id`) values ('1',1),('1',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
