-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-10-29 16:01:36
-- 服务器版本： 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music`
--

-- --------------------------------------------------------

--
-- 表的结构 `app_adminrnews`
--

CREATE TABLE `app_adminrnews` (
  `admin_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `app_class`
--

CREATE TABLE `app_class` (
  `class_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_class`
--

INSERT INTO `app_class` (`class_name`, `class_id`) VALUES
('up', 1),
('new', 2),
('create', 3);

-- --------------------------------------------------------

--
-- 表的结构 `app_collection`
--

CREATE TABLE `app_collection` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `music_id` int(10) UNSIGNED NOT NULL,
  `colDate` date NOT NULL,
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_collection`
--

INSERT INTO `app_collection` (`user_id`, `music_id`, `colDate`, `id`) VALUES
(2, 10, '2016-02-26', 25),
(3, 5, '2016-02-18', 20),
(2, 2, '2016-02-26', 46),
(2, 1, '2016-02-26', 45),
(2, 4, '2016-02-26', 44),
(2, 5, '2016-02-26', 43),
(2, 6, '2016-02-26', 42),
(2, 8, '2016-02-26', 41),
(2, 10, '2016-02-26', 40),
(2, 7, '2016-02-26', 39),
(2, 9, '2016-02-26', 38),
(2, 3, '2016-02-26', 37),
(28, 24, '2016-06-02', 71),
(28, 4, '2016-06-02', 70),
(29, 11, '2016-06-02', 64),
(29, 2, '2016-06-02', 63),
(29, 24, '2016-06-02', 61);

-- --------------------------------------------------------

--
-- 表的结构 `app_comment`
--

CREATE TABLE `app_comment` (
  `user_id` int(11) NOT NULL,
  `music_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_comment`
--

INSERT INTO `app_comment` (`user_id`, `music_id`, `content`, `time`) VALUES
(2, 4, '纯音乐，一单就够了', '2016-06-11 07:17:25'),
(27, 4, '夏树眠，蝉在叫，人坏掉~', '2016-06-06 06:33:39'),
(28, 4, 'fefefe', '2016-06-02 18:29:31'),
(28, 4, 's', '2016-06-02 18:29:57'),
(28, 4, '好听~', '2016-06-02 18:33:41'),
(28, 4, '好听~~~~~', '2016-06-02 18:34:38'),
(28, 4, '好~~~~~~', '2016-06-02 18:35:12'),
(28, 4, '实打实大苏打', '2016-06-02 18:36:05'),
(28, 4, '呵呵', '2016-06-02 18:38:15');

-- --------------------------------------------------------

--
-- 表的结构 `app_friends`
--

CREATE TABLE `app_friends` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_friends`
--

INSERT INTO `app_friends` (`user_id`, `friend_id`, `id`) VALUES
(4, 28, 1),
(28, 2, 6),
(28, 27, 7);

-- --------------------------------------------------------

--
-- 表的结构 `app_info`
--

CREATE TABLE `app_info` (
  `user_id` int(10) NOT NULL,
  `name` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(34) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_info`
--

INSERT INTO `app_info` (`user_id`, `name`, `image`) VALUES
(2, 'Zenaro', '../../../src/home/image/face.png'),
(27, 'ASD', '../../../src/home/image/profile.jp'),
(28, 'Zenaro', '../../../src/home/image/profile.jp');

-- --------------------------------------------------------

--
-- 表的结构 `app_music`
--

CREATE TABLE `app_music` (
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `src` text COLLATE utf8_unicode_ci NOT NULL,
  `lyric` text COLLATE utf8_unicode_ci NOT NULL,
  `music_id` int(10) UNSIGNED NOT NULL,
  `listeners` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_music`
--

INSERT INTO `app_music` (`name`, `src`, `lyric`, `music_id`, `listeners`) VALUES
('V.A.-キミを思うメロディー', 'http://7xstax.com1.z0.glb.clouddn.com/VA-missing.mp3', '纯音乐无歌词', 2, 2500),
('you -- Graveyard-you', 'http://7xstax.com1.z0.glb.clouddn.com/M.Graveyard-you.mp3', '纯音乐无歌词', 4, 3200),
('ばんばんしー-in the autumn sky', 'http://7xstax.com1.z0.glb.clouddn.com/in-the-autumn-sky.mp3', '纯音乐无歌词', 11, 2233),
('相爱很难', 'http://7xstax.com1.z0.glb.clouddn.com/lrc-love.mp3', '[ti:相爱很难(张学友梅艳芳)]\r\n[ar:梅艳芳]\r\n[al:]\r\n[00:03.69] 词曲：作曲／编曲：陈辉阳 填词：林夕\r\n[00:19.78] 女：最好 有生一日都爱下去\r\n[00:26.69]  但谁人 能将恋爱当做终生兴趣\r\n[00:33.75] 男：生活 其实旨在找到个伴侣\r\n[00:40.76]  面对现实 热恋很快变长流细水\r\n[00:47.03] 女：可惜我 不智或侥倖\r\n[00:50.50]  对火花天生敏感\r\n[00:54.80] 男：不过 两只手拉得太紧\r\n[00:58.71] 合：爱到过了界那对爱人\r\n[01:01.73]  同时亦最易变成一对敌人\r\n[01:10.79] 女：也许相爱很难\r\n[01:10.50]  就难在其实双方各有各寄望\r\n[01:15.77]  怎么办\r\n[01:15.44] 男：要单恋都难\r\n[01:17.46]  受太大的礼会内疚却也无力归还\r\n[01:23.82] 女：也许不爱不难\r\n[01:25.68]  但如未成佛升仙也会怕\r\n[01:29.51]  爱情前途黯淡\r\n[01:31.96] 男：爱不爱都难\r\n[01:32.81]  未快乐先有责任给予对方面露欢颜\r\n[01:37.48] 女：得到浪漫 又要有空间\r\n[01:41.02] 男：得到定局 却怕去到终站\r\n[01:44.30] 合：然后付出多得到少不介意豁达\r\n[01:48.23]  又担心 有人看不过眼\r\n[02:04.47] 女：可惜我 不智或侥倖\r\n[02:07.22]  对火花天生敏感\r\n[02:11.59] 男：不过 两只手拉得太紧\r\n[02:14.41] 合：爱到过了界那对爱人\r\n[02:17.36]  同时亦最易变成一对敌人\r\n[02:25.95] 女：也许相爱很难\r\n[02:27.69]  就难在其实双方各有各寄望\r\n[02:31.15]  怎么办\r\n[02:32.03] 男：要单恋都难\r\n[02:34.74]  受太大的礼会内疚却也无力归还\r\n[02:39.81] 女：也许不爱不难\r\n[02:41.14]  但如未成佛升仙也会怕\r\n[02:44.29]  爱情前途黯淡\r\n[02:46.90] 男：爱不爱都难\r\n[02:48.93]  未快乐先有责任给予对方面露欢颜\r\n[02:53.14] 女：得到浪漫 又要有空间\r\n[02:56.24] 男：得到定局 却怕去到终站\r\n[03:00.91] 合：然后付出多得到少不介意豁达\r\n[03:04.70]  又担心 有人看不过眼\r\n[03:10.18] 合：无论热恋中失恋中\r\n[03:13.96] 都永远记住第一戒\r\n[03:18.64] 别要张开双眼', 24, 3500);

-- --------------------------------------------------------

--
-- 表的结构 `app_musicrclass`
--

CREATE TABLE `app_musicrclass` (
  `class_id` int(11) NOT NULL,
  `music_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_musicrclass`
--

INSERT INTO `app_musicrclass` (`class_id`, `music_id`) VALUES
(1, 2),
(1, 4),
(1, 11),
(1, 24),
(2, 2),
(2, 4),
(2, 11),
(2, 24),
(3, 2),
(3, 4),
(3, 11),
(3, 24);

-- --------------------------------------------------------

--
-- 表的结构 `app_news`
--

CREATE TABLE `app_news` (
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `pubDate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_news`
--

INSERT INTO `app_news` (`title`, `content`, `id`, `type`, `pubDate`) VALUES
('迎新年，全民福利活动Let''s Go！', '内容我已经想好了', 1, '活动', '2016-01-08'),
('银翼邮递员传递祝福！圣诞祝福征集正式开始', '下星期有活动，嗯', 2, '活动', '2016-01-07'),
('12·12线上活动，买赠大行动！', '双十二买增大活动', 3, '焦点', '2015-11-19'),
('新专辑体验资格已更新，请登录页面查询', '到场楼主就告诉你', 4, '公告', '2016-01-07'),
('猜歌无级限 活动嗨不停', '说好的推文呢？', 5, '公告', '2016-01-10'),
('节日歌单大折扣', '编辑部去旅游了，没人写稿', 6, '焦点', '2016-01-16'),
('音乐概念站·Silver Light From The Above', '音乐大礼包任性送', 7, '活动', '2016-01-22');

-- --------------------------------------------------------

--
-- 表的结构 `app_singer`
--

CREATE TABLE `app_singer` (
  `singer_id` int(11) NOT NULL,
  `singer_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `counrtry` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_singer`
--

INSERT INTO `app_singer` (`singer_id`, `singer_name`, `counrtry`, `birthday`) VALUES
(1, 'V.A.', 'Japan', '2015-11-04'),
(2, '《寒蝉鸣泣之时》原生', 'Japan', '2016-05-18'),
(3, '秋姉妹のなく頃に', 'Japan', '2016-05-13'),
(4, '李克勤--容祖儿', '香港', '2016-02-09');

-- --------------------------------------------------------

--
-- 表的结构 `app_singerrmusic`
--

CREATE TABLE `app_singerrmusic` (
  `singer_id` int(11) NOT NULL,
  `music_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_singerrmusic`
--

INSERT INTO `app_singerrmusic` (`singer_id`, `music_id`) VALUES
(1, 2),
(2, 4),
(3, 11),
(4, 24);

-- --------------------------------------------------------

--
-- 表的结构 `app_user`
--

CREATE TABLE `app_user` (
  `email` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` char(34) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL,
  `regDate` date NOT NULL,
  `root` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `app_user`
--

INSERT INTO `app_user` (`email`, `pwd`, `id`, `regDate`, `root`) VALUES
('572001239@qq.com', 'dcf44e9c52c45576ad75f04c37a52166', 2, '2016-01-24', 1),
('asd@qq.com', 'dcf44e9c52c45576ad75f04c37a52166', 27, '2016-02-26', 0),
('572001239@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 28, '2016-06-02', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_class`
--
ALTER TABLE `app_class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `app_collection`
--
ALTER TABLE `app_collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_friends`
--
ALTER TABLE `app_friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_info`
--
ALTER TABLE `app_info`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `app_music`
--
ALTER TABLE `app_music`
  ADD PRIMARY KEY (`music_id`);

--
-- Indexes for table `app_news`
--
ALTER TABLE `app_news`
  ADD PRIMARY KEY (`type`,`pubDate`,`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `app_singer`
--
ALTER TABLE `app_singer`
  ADD PRIMARY KEY (`singer_id`);

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `app_class`
--
ALTER TABLE `app_class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `app_collection`
--
ALTER TABLE `app_collection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- 使用表AUTO_INCREMENT `app_friends`
--
ALTER TABLE `app_friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `app_music`
--
ALTER TABLE `app_music`
  MODIFY `music_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `app_news`
--
ALTER TABLE `app_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `app_singer`
--
ALTER TABLE `app_singer`
  MODIFY `singer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
