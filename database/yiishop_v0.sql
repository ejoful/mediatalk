-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-06-24 11:51:42
-- 服务器版本： 10.0.30-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yiishop`
--
CREATE DATABASE IF NOT EXISTS `yiishop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `yiishop`;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_migration`
--

DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1497701611),
('m140209_132017_init', 1497701616),
('m140403_174025_create_account_table', 1497701618),
('m140504_113157_update_tables', 1497701621),
('m140504_130429_create_token_table', 1497701622),
('m140830_171933_fix_ip_field', 1497701623),
('m140830_172703_change_account_table_name', 1497701623),
('m141222_110026_update_ip_field', 1497701624),
('m141222_135246_alter_username_length', 1497701625),
('m150614_103145_update_social_account_table', 1497701626),
('m150623_212711_fix_username_notnull', 1497701626),
('m151218_234654_add_timezone_to_profile', 1497701627),
('m160929_103127_add_last_login_at_to_user_table', 1497701627);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_onlinecourse`
--

DROP TABLE IF EXISTS `tbl_onlinecourse`;
CREATE TABLE IF NOT EXISTS `tbl_onlinecourse` (
  `id` int(11) unsigned NOT NULL,
  `course_name` int(11) NOT NULL COMMENT '课程名字',
  `list_pic` varchar(255) NOT NULL COMMENT '列表图片',
  `home_pic` varchar(255) NOT NULL COMMENT '首页图片',
  `teacher_id` int(11) NOT NULL COMMENT '授课教师',
  `price` decimal(10,0) NOT NULL COMMENT '价格',
  `discount` decimal(10,0) NOT NULL COMMENT '优惠价格',
  `recommend` tinyint(1) NOT NULL COMMENT '是否推荐',
  `onlinecourse_cat_id` int(11) NOT NULL COMMENT '网课分类',
  `job_id` int(11) NOT NULL COMMENT '适合岗位',
  `description` text NOT NULL COMMENT '网课详情',
  `view` int(11) NOT NULL COMMENT '浏览基数',
  `selfcourse` tinyint(1) NOT NULL COMMENT '内部课程',
  `online` tinyint(1) NOT NULL COMMENT '是否可用',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_onlinecourse_category`
--

DROP TABLE IF EXISTS `tbl_onlinecourse_category`;
CREATE TABLE IF NOT EXISTS `tbl_onlinecourse_category` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `parent_id` int(11) NOT NULL COMMENT '父级分类',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_profile`
--

DROP TABLE IF EXISTS `tbl_profile`;
CREATE TABLE IF NOT EXISTS `tbl_profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_social_account`
--

DROP TABLE IF EXISTS `tbl_social_account`;
CREATE TABLE IF NOT EXISTS `tbl_social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_token`
--

DROP TABLE IF EXISTS `tbl_token`;
CREATE TABLE IF NOT EXISTS `tbl_token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_migration`
--
ALTER TABLE `tbl_migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tbl_onlinecourse`
--
ALTER TABLE `tbl_onlinecourse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_onlinecourse_category`
--
ALTER TABLE `tbl_onlinecourse_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_social_account`
--
ALTER TABLE `tbl_social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_account_unique` (`provider`,`client_id`),
  ADD UNIQUE KEY `tbl_account_unique_code` (`code`),
  ADD KEY `tbl_fk_user_account` (`user_id`);

--
-- Indexes for table `tbl_token`
--
ALTER TABLE `tbl_token`
  ADD UNIQUE KEY `tbl_token_unique` (`user_id`,`code`,`type`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_user_unique_username` (`username`),
  ADD UNIQUE KEY `tbl_user_unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_onlinecourse`
--
ALTER TABLE `tbl_onlinecourse`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_onlinecourse_category`
--
ALTER TABLE `tbl_onlinecourse_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_social_account`
--
ALTER TABLE `tbl_social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `tbl_profile`
--
ALTER TABLE `tbl_profile`
  ADD CONSTRAINT `tbl_fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- 限制表 `tbl_social_account`
--
ALTER TABLE `tbl_social_account`
  ADD CONSTRAINT `tbl_fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- 限制表 `tbl_token`
--
ALTER TABLE `tbl_token`
  ADD CONSTRAINT `tbl_fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
