-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: my_shop
-- ------------------------------------------------------
-- Server version	5.7.21

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `admin_menu` VALUES (1,0,1,'Index','fa-bar-chart','/',NULL,NULL),(2,0,2,'管理员','fa-tasks',NULL,NULL,'2018-08-01 07:50:22'),(3,2,3,'Users','fa-users','auth/users',NULL,NULL),(4,2,4,'Roles','fa-user','auth/roles',NULL,NULL),(5,2,5,'Permission','fa-ban','auth/permissions',NULL,NULL),(6,2,6,'Menu','fa-bars','auth/menu',NULL,NULL),(7,2,7,'Operation log','fa-history','auth/logs',NULL,NULL),(8,0,0,'文章管理','fa-adn',NULL,'2018-07-19 07:52:08','2018-07-19 07:52:08'),(9,8,0,'文章列表','fa-bars','/article','2018-07-19 07:53:26','2018-08-01 08:03:49'),(10,0,0,'用户管理','fa-android',NULL,'2018-07-31 07:07:15','2018-07-31 07:09:04'),(11,10,0,'用户列表','fa-bars','/users','2018-07-31 07:09:29','2018-07-31 07:09:29'),(12,0,0,'分类树','fa-align-left',NULL,'2018-08-21 07:33:04','2018-08-22 08:09:10'),(13,12,0,'分类列表','fa-bars','/category','2018-08-22 08:09:30','2018-08-22 08:09:30'),(14,0,0,'图片库','fa-image',NULL,'2018-08-23 07:17:07','2018-08-23 07:17:07'),(15,14,0,'图片列表','fa-bars','/image','2018-08-23 07:17:24','2018-08-23 07:17:24'),(16,0,0,'监控和告警','fa-area-chart',NULL,'2018-09-18 05:19:58','2018-09-18 05:19:58'),(17,16,0,'告警列表','fa-bars','/alarms','2018-09-18 05:23:51','2018-09-18 05:23:51');

--
-- Table structure for table `admin_operation_log`
--
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
);


--
-- Dumping data for table `admin_operation_log`
--

--
-- Table structure for table `admin_permissions`
--
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
);

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),(6,'文章管理权限','article','','/article*','2018-08-27 08:26:21','2018-08-27 08:29:42');
--
-- Table structure for table `admin_role_menu`
--
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
);

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL),(1,8,NULL,NULL),(1,9,NULL,NULL),(1,10,NULL,NULL),(1,11,NULL,NULL),(1,12,NULL,NULL),(1,13,NULL,NULL),(1,14,NULL,NULL),(1,15,NULL,NULL),(2,8,NULL,NULL),(2,9,NULL,NULL),(1,16,NULL,NULL),(1,17,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
);

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL),(2,3,NULL,NULL),(2,6,NULL,NULL),(2,2,NULL,NULL),(2,4,NULL,NULL);

--
-- Table structure for table `admin_role_users`
--
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
);


--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;

--
-- Table structure for table `admin_roles`
--
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
);
--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2018-07-19 07:46:25','2018-07-19 07:46:25'),(2,'访客','visitor','2018-08-27 08:23:34','2018-08-27 08:23:34');

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
);
--
-- Dumping data for table `admin_user_permissions`
--

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
);
--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$O7i/u3E9HXP8IeGvNIdy1eJeqJcQ62v21nFSJ9SffAtdQPzBKLdQC','Administrator',NULL,'9mV8EFsIY4ylF7P3w1oV32O3jmf7xV6giOfMvWrc2Ra5aOV4fe8blW4ozvAz','2018-07-19 07:46:25','2018-07-19 07:46:25');

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` bigint(20) unsigned NOT NULL COMMENT '自增ID',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `content` text NOT NULL COMMENT '文章内容',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除，1表示已删除',
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `article`
--

INSERT INTO `article` VALUES (5,'用户管理',0,'<p>发生范德萨</p>','2018-08-07 06:29:07','2018-08-07 14:55:12',1),(14,'f',0,'<p>f</p>','2018-08-20 08:05:48','2018-08-20 08:12:41',1),(15,'3232',0,'<p>412141242</p>','2018-08-20 08:13:29','2018-08-20 08:13:35',1),(16,'我的文章',3,'<p>今天天气不错！！</p>','2018-08-20 08:17:44','2018-08-23 06:53:38',0);

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL COMMENT '自增ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `title` varchar(45) NOT NULL DEFAULT '' COMMENT '分类名称',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除，1表示已删除',
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` VALUES (1,0,'文章分类',1,'2018-08-22 08:09:51','2018-08-22 08:14:05',0),(2,1,'测试新闻',2,'2018-08-22 08:10:11','2018-08-22 08:14:05',0),(3,1,'动态',3,'2018-08-22 08:14:30','2018-08-22 08:14:40',0),(4,0,'商品',0,'2018-08-27 08:19:10','2018-08-27 08:19:10',0),(5,4,'服装',0,'2018-08-27 08:19:21','2018-08-27 08:19:21',0);


--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL COMMENT '自增ID',
  `title` varchar(45) NOT NULL DEFAULT '' COMMENT '图片名称',
  `image_url` varchar(128) NOT NULL DEFAULT '' COMMENT '图片地址',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除，1表示已删除',
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `images`
--

INSERT INTO `images` VALUES (1,'xiaofeng','images/192bc0e34b0ed2e09f2830203158a90d.JPG','2018-08-27 08:06:18','2018-08-27 08:07:13',0);

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_04_173148_create_admin_tables',1);

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
);

--
-- Dumping data for table `password_resets`
--

--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
);

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES (1,'zhibin','haha@163.com',' ',' ','2018-07-31 02:00:00','2018-07-31 02:00:00');

-- Dump completed on 2018-10-16 23:39:05
