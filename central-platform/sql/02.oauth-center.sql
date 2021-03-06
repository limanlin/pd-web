# 导出 oauth-center 的数据库结构
CREATE DATABASE IF NOT EXISTS `oauth-center` DEFAULT CHARACTER SET = utf8mb4;
Use `oauth-center`;
#
# Structure for table "oauth_client_details"
#

DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_id` varchar(48) NOT NULL COMMENT '应用标识',
  `resource_ids` varchar(256) DEFAULT NULL COMMENT '资源限定串(逗号分割)',
  `client_secret` varchar(256) DEFAULT NULL COMMENT '应用密钥(bcyt) 加密',
  `client_secret_str` varchar(256) DEFAULT NULL COMMENT '应用密钥(明文)',
  `scope` varchar(256) DEFAULT NULL COMMENT '范围',
  `authorized_grant_types` varchar(256) DEFAULT NULL COMMENT '5种oauth授权方式(authorization_code,password,refresh_token,client_credentials)',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL COMMENT '回调地址 ',
  `authorities` varchar(256) DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) DEFAULT NULL COMMENT 'access_token有效期',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT 'refresh_token有效期',
  `additional_information` varchar(4096) DEFAULT '{}' COMMENT '{}',
  `autoapprove` varchar(256) DEFAULT NULL COMMENT '是否自动授权 是-true',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "oauth_client_details"
#

INSERT INTO `oauth_client_details` VALUES (1,'app',NULL,'$2a$10$i3F515wEDiB4Gvj9ym9Prui0dasRttEUQ9ink4Wpgb4zEDCAlV8zO','app','app','password,refresh_token',NULL,NULL,180000,NULL,'{}','true'),(2,'mobile','mobile,test','$2a$10$ULxRssv/4NWOc388lZFbyus3IFfsbcpG/BZOq4TRxDhsx5HHIR7Jm','mobile','all','password,refresh_token',NULL,NULL,180000,NULL,'{}','true'),(4,'webApp',NULL,'$2a$10$06msMGYRH8nrm4iVnKFNKOoddB8wOwymVhbUzw/d3ZixD7Nq8ot72','webApp','app','authorization_code,password,refresh_token,client_credentials',NULL,NULL,180000,NULL,'{}','true'),(5,'beck','','$2a$10$56LGyH.2wOFNNp3ScUkspOMdyRnenYhnWEnfI0itIFfsXsd5ZhKh.','beck','all','authorization_code,password,refresh_token,client_credentials','http://www.baidu.com','',180000,NULL,'{}','true'),(6,'owen',NULL,'$2a$10$a1ZEXiZQr604LN.wVxet.etPm6RvDs.HIaXP48J2HKRaEnZORTVwe','owen','app','authorization_code,password,refresh_token,client_credentials','http://127.0.0.1:9997/clientOne/login',NULL,180000,NULL,'{}','true');

#
# Structure for table "sys_client_service"
#

DROP TABLE IF EXISTS `sys_client_service`;
CREATE TABLE `sys_client_service` (
  `clientId` int(11) NOT NULL COMMENT '应用标识',
  `serviceId` int(11) NOT NULL COMMENT '服务权限标识',
  PRIMARY KEY (`clientId`,`serviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "sys_client_service"
#


#
# Structure for table "sys_service"
#

DROP TABLE IF EXISTS `sys_service`;
CREATE TABLE `sys_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `css` varchar(32) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `isMenu` int(11) DEFAULT NULL COMMENT '是否菜单 1 是 2 不是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

#
# Data for table "sys_service"
#

INSERT INTO `sys_service` VALUES (1,-1,'用户中心','javascript:;',NULL,'layui-icon-set',0,'2017-11-17 16:56:59','2018-08-20 10:20:42',1),(2,1,'用户管理','#!user','system/user.html','',2,'2017-11-17 16:56:59','2018-08-20 10:03:26',1),(3,1,'角色管理','#!role','system/role.html','',3,'2017-11-17 16:56:59','2018-08-20 10:03:35',1),(4,1,'菜单管理','#!menus','system/menus.html','',4,'2017-11-17 16:56:59','2018-08-20 10:03:40',1),(5,1,'权限管理','#!permissions','system/permissions.html','',5,'2017-11-17 16:56:59','2018-08-20 10:03:46',1),(7,-1,'注册中心','#!register','http://127.0.0.1:1111','layui-icon-engine',7,'2017-11-17 16:56:59','2018-08-20 11:50:29',1),(8,-1,'监控中心','#!monitor','http://127.0.0.1:9001/#/wallboard','layui-icon-util\r\n',8,'2017-11-17 16:56:59','2018-08-20 10:43:13',1),(9,-1,'文件中心','#!files','files/files.html','layui-icon-file',10,'2017-11-17 16:56:59','2018-08-23 17:43:14',1),(10,-1,'文档中心','#!swagger','http://127.0.0.1:9200/swagger-ui.html','layui-icon-app',9,'2017-11-17 16:56:59','2018-08-22 17:58:13',1),(11,1,'我的信息','#!myInfo','system/myInfo.html','',10,'2017-11-17 16:56:59','2018-08-21 11:56:12',1),(12,-1,'认证中心','javascript:;','','layui-icon-set',1,'2017-11-17 16:56:59','2018-08-21 12:48:13',1),(13,12,'token管理','#!token','attestation/token.html',NULL,10,'2017-11-17 16:56:59','2018-08-16 17:03:04',1),(35,12,'应用管理','#!app','attestation/app.html','',11,'2018-08-23 12:17:52','2018-08-23 12:17:52',1),(36,12,'服务管理','#!services','attestation/services.html','',10,'2018-08-23 16:42:22','2018-08-23 16:42:22',2);
