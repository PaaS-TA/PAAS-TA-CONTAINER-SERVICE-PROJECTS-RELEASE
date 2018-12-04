UPDATE mysql.user SET password=PASSWORD('<%= p("admin_user.password") %>') WHERE user='<%= p("admin_user.id") %>';
GRANT ALL PRIVILEGES ON *.* TO '<%= p("admin_user.id") %>'@'%' IDENTIFIED BY '<%= p("admin_user.password") %>' WITH GRANT OPTION;
FLUSH PRIVILEGES;

/*
MySQL - 10.1.22-MariaDB : Database - CaaS broker & dashboard
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`broker` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `broker`;

/*Table structure for table `admin_token` */

DROP TABLE IF EXISTS `admin_token`;

CREATE TABLE `admin_token` (
  `token_name` varchar(255) NOT NULL,
  `token_value` varchar(1000) NOT NULL,
  PRIMARY KEY (`token_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `service_instances` */

DROP TABLE IF EXISTS `service_instance`;

CREATE TABLE `service_instance` (
  `service_instance_id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `caas_account_token_name` varchar(255) DEFAULT NULL,
  `caas_account_name` varchar(255) DEFAULT NULL,
  `caas_namespace` varchar(255) DEFAULT NULL,
  `dashboard_url` varchar(255) DEFAULT NULL,
  `organization_guid` varchar(255) DEFAULT NULL,
  `plan_id` varchar(255) DEFAULT NULL,
  `service_definition_id` varchar(255) DEFAULT NULL,
  `space_guid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE DATABASE /*!32312 IF NOT EXISTS*/`caas` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `caas`;

/*Table structure for table `admin_token` */
DROP TABLE IF EXISTS `admin_token`;

CREATE TABLE `admin_token` (
  `token_name` varchar(255) NOT NULL,
  `token_value` varchar(1000) NOT NULL,
  PRIMARY KEY (`token_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `user` */
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `service_instance_id` varchar(255) NOT NULL,
  `caas_namespace` varchar(255) NOT NULL,
  `caas_account_token_name` varchar(255) DEFAULT NULL,
  `caas_account_name` varchar(255) DEFAULT NULL,
  `organization_guid` varchar(255) DEFAULT NULL,
  `space_guid` varchar(255) DEFAULT NULL,
  `role_set_code` char(6) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_description` varchar(255) DEFAULT NULL,
  `created` varchar(255) NOT NULL,
  `last_modified` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `caas_user_role_set` */
DROP TABLE IF EXISTS `caas_user_role_set`;

CREATE TABLE `caas_user_role_set` ( 
  `role_set_code` char(6) NOT NULL,
  `resource_code` varchar(20) NOT NULL,
  `verb_code` varchar(20) NOT NULL,
  `description` varchar(400) DEFAULT NULL, 
  `created` varchar(20) DEFAULT NULL,
  PRIMARY KEY (role_set_code, resource_code, verb_code)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*INSERT INIT DATA*/
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.administrator_code") %>', 'user_management', 'create', '', now());
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.administrator_code") %>', 'user_management', 'delete', '', now());
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.administrator_code") %>', 'user_management', 'get', '', now());
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.administrator_code") %>', 'user_management', 'list', '', now());
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.administrator_code") %>', 'user_management', 'patch', '', now());
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.administrator_code") %>', 'user_management', 'update', '', now());
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.administrator_code") %>', 'user_management', 'watch', '', now());

INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.regular_user_code") %>', 'user_management', 'get', '', now());
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.regular_user_code") %>', 'user_management', 'list', '', now());
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.regular_user_code") %>', 'user_management', 'watch', '', now());

INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.init_user_code") %>', 'user_management', 'get', '', now());
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.init_user_code") %>', 'user_management', 'list', '', now());
INSERT INTO `caas`.`caas_user_role_set`(`role_set_code`, `resource_code`, `verb_code`, `description`, `created`) VALUES ('<%= p("role_set.init_user_code") %>', 'user_management', 'watch', '', now());
