-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018 年 08 月 22 日 08:32
-- 伺服器版本: 10.1.30-MariaDB
-- PHP 版本： 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `penghufile`
--

-- --------------------------------------------------------

--
-- 資料表結構 `clothes`
--

CREATE TABLE `clothes` (
  `pId` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `education`
--

CREATE TABLE `education` (
  `pId` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `food`
--

CREATE TABLE `food` (
  `pId` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `fun`
--

CREATE TABLE `fun` (
  `pId` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `house`
--

CREATE TABLE `house` (
  `pId` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `publication`
--

CREATE TABLE `publication` (
  `pId` int(11) NOT NULL,
  `pName` varchar(100) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `author` varchar(40) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `issue_place` varchar(30) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `authorize` tinyint(1) DEFAULT NULL,
  `cost` int(225) DEFAULT NULL,
  `ISBN` varchar(13) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `link` varchar(1000) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `uploadTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `tag`
--

CREATE TABLE `tag` (
  `pId` int(11) NOT NULL,
  `tId` int(11) NOT NULL,
  `tName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `uId` int(11) NOT NULL,
  `sId` varchar(20) NOT NULL,
  `usergroup` varchar(100) NOT NULL,
  `gName` varchar(20) DEFAULT NULL,
  `reponse` varchar(15) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `logined` tinyint(4) NOT NULL DEFAULT '0',
  `enabled` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `users`
--

INSERT INTO `users` (`uId`, `sId`, `usergroup`, `gName`, `reponse`, `year`, `phone`, `address`, `url`, `username`, `password`, `logined`, `enabled`) VALUES
(1, 'adm-0001', '管理團隊', 'Admin', '王大明', 1996, '0966483210', 'XXX-XXX-XXXX', 'http://XXX.gov.tw', 'awalker0215', 'e10adc3949ba59abbe56e057f20f883e', 1, 1),
(2, 'UG-0001', '工會團體', '澎湖醫師公會(更新)', '林醫師', 1911, '061234567', '澎湖縣湖西鄉XXX', 'http://pghhospital.gov.tw', 'UG0001', 'e10adc3949ba59abbe56e057f20f883e', 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user_roles`
--

CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES
(1, 'awalker0215', 'ROLE_ADMIN'),
(2, 'UG0001', 'ROLE_USER');

-- --------------------------------------------------------

--
-- 資料表結構 `walk`
--

CREATE TABLE `walk` (
  `pId` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `clothes`
--
ALTER TABLE `clothes`
  ADD PRIMARY KEY (`pId`,`detail`);

--
-- 資料表索引 `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`pId`,`detail`);

--
-- 資料表索引 `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`pId`,`detail`);

--
-- 資料表索引 `fun`
--
ALTER TABLE `fun`
  ADD PRIMARY KEY (`pId`,`detail`);

--
-- 資料表索引 `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`pId`,`detail`);

--
-- 資料表索引 `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`pId`);

--
-- 資料表索引 `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tId`,`pId`),
  ADD KEY `pId` (`pId`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uId`),
  ADD UNIQUE KEY `sId` (`sId`,`gName`);

--
-- 資料表索引 `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_role_id`);

--
-- 資料表索引 `walk`
--
ALTER TABLE `walk`
  ADD PRIMARY KEY (`pId`,`detail`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `publication`
--
ALTER TABLE `publication`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `tag`
--
ALTER TABLE `tag`
  MODIFY `tId` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `uId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `clothes`
--
ALTER TABLE `clothes`
  ADD CONSTRAINT `clothes_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `publication` (`pId`) ON UPDATE CASCADE;

--
-- 資料表的 Constraints `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `publication` (`pId`) ON UPDATE CASCADE;

--
-- 資料表的 Constraints `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `publication` (`pId`) ON UPDATE CASCADE;

--
-- 資料表的 Constraints `fun`
--
ALTER TABLE `fun`
  ADD CONSTRAINT `fun_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `publication` (`pId`) ON UPDATE CASCADE;

--
-- 資料表的 Constraints `house`
--
ALTER TABLE `house`
  ADD CONSTRAINT `house_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `publication` (`pId`) ON UPDATE CASCADE;

--
-- 資料表的 Constraints `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `publication` (`pId`) ON UPDATE CASCADE;

--
-- 資料表的 Constraints `walk`
--
ALTER TABLE `walk`
  ADD CONSTRAINT `walk_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `publication` (`pId`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
