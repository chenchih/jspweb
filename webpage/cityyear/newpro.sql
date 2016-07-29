-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.24a-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema abc
--

CREATE DATABASE IF NOT EXISTS abc;
USE abc;

--
-- Definition of table `abc`.`city`
--

DROP TABLE IF EXISTS `abc`.`city`;
CREATE TABLE  `abc`.`city` (
  `id` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `name` varchar(45) character set big5 NOT NULL,
  `zip` varchar(5) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `abc`.`city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `abc`.`city` (`id`,`sid`,`name`,`zip`) VALUES 
 (1,1,'仁愛區','200'),
 (2,1,'信義區','201'),
 (3,1,'中正區','202'),
 (4,1,'中山區','203'),
 (5,1,'安樂區','204'),
 (6,1,'暖暖區','205'),
 (7,1,'七堵區','206'),
 (8,2,'中正區','100'),
 (9,2,'大同區','103'),
 (10,2,'中山區','104'),
 (11,2,'松山區','105'),
 (12,2,'大安區','106'),
 (13,2,'萬華區','108'),
 (14,2,'信義區','110'),
 (15,2,'士林區','111'),
 (16,2,'北投區','112'),
 (17,2,'內湖區','114'),
 (18,2,'南港區','115'),
 (19,2,'文山區','116'),
 (20,3,'萬里','207'),
 (21,3,'金山','208'),
 (22,3,'板橋','220'),
 (23,3,'汐止','221'),
 (24,3,'深坑','222'),
 (25,3,'石碇','223'),
 (26,3,'瑞芳','224'),
 (27,3,'平溪','226'),
 (28,3,'雙溪','227'),
 (29,3,'貢寮','228'),
 (30,3,'新店','231'),
 (31,3,'坪林','232'),
 (32,3,'烏來','233'),
 (33,3,'永和','234'),
 (34,3,'中和','235'),
 (35,3,'土城','236'),
 (36,3,'三峽','237'),
 (37,3,'樹林','238'),
 (38,3,'鶯歌','239'),
 (39,3,'三重','241');
INSERT INTO `abc`.`city` (`id`,`sid`,`name`,`zip`) VALUES 
 (40,3,'新莊','242'),
 (41,3,'泰山','243'),
 (42,3,'林口','244'),
 (43,3,'蘆洲','247'),
 (44,3,'五股','248'),
 (45,3,'八里','249'),
 (46,3,'淡水','251'),
 (47,3,'三芝','252'),
 (48,3,'石門','253'),
 (49,4,'中壢','320'),
 (50,4,'平鎮','324'),
 (51,4,'龍潭','325'),
 (52,4,'楊梅','326'),
 (53,4,'新屋','327'),
 (54,4,'觀音','328'),
 (55,4,'桃園','330'),
 (56,4,'龜山','333'),
 (57,4,'八德','334'),
 (58,4,'大溪','335'),
 (59,4,'復興','336'),
 (60,4,'大園','337'),
 (61,4,'蘆竹','338'),
 (62,6,'竹北','302'),
 (63,6,'湖口','303'),
 (64,6,'新豐','304'),
 (65,6,'新埔','305'),
 (66,6,'關西','306'),
 (67,6,'芎林','307'),
 (68,6,'寶山','308'),
 (69,6,'竹東','310'),
 (70,6,'五峰','311'),
 (71,6,'橫山','312'),
 (72,6,'尖石','313'),
 (73,6,'北埔','314'),
 (74,6,'峨眉','315'),
 (75,7,'竹南','350'),
 (76,7,'頭份','351'),
 (77,7,'三灣','352'),
 (78,7,'南庄','353'),
 (79,7,'獅潭','354'),
 (80,7,'後龍','356');
INSERT INTO `abc`.`city` (`id`,`sid`,`name`,`zip`) VALUES 
 (81,7,'通霄','357'),
 (82,7,'苑裡','358'),
 (83,7,'苗栗','360'),
 (84,7,'造橋','361'),
 (85,7,'頭屋','362'),
 (86,7,'公館','363'),
 (87,7,'大湖','364'),
 (88,7,'泰安','365'),
 (89,7,'銅鑼','366'),
 (90,7,'三義','367'),
 (91,7,'西湖','368'),
 (92,7,'卓蘭','369'),
 (93,8,'中區','400'),
 (94,8,'東區','401'),
 (95,8,'南區','402'),
 (96,8,'西區','403'),
 (97,8,'北區','404'),
 (98,8,'北屯區','406'),
 (99,8,'西屯區','407'),
 (100,8,'南屯區','408'),
 (101,9,'太平','411'),
 (102,9,'大里','412'),
 (103,9,'霧峰','413'),
 (104,9,'烏日','414'),
 (105,9,'豐原','420'),
 (106,9,'后里','421'),
 (107,9,'石岡','422'),
 (108,9,'東勢','423'),
 (109,9,'和平','424'),
 (110,9,'新社','426'),
 (111,9,'潭子','427'),
 (112,9,'大雅','428'),
 (113,9,'神岡','429'),
 (114,9,'大肚','432'),
 (115,9,'沙鹿','433'),
 (116,9,'龍井','434'),
 (117,9,'梧棲','435'),
 (118,9,'清水','436'),
 (119,9,'大甲','437'),
 (120,9,'外埔','438');
INSERT INTO `abc`.`city` (`id`,`sid`,`name`,`zip`) VALUES 
 (121,9,'大安','439'),
 (122,10,'彰化','500'),
 (123,10,'芬園','502'),
 (124,10,'花壇','503'),
 (125,10,'秀水','504'),
 (126,10,'鹿港','505'),
 (127,10,'福興','506'),
 (128,10,'線西','507'),
 (129,10,'和美','508'),
 (130,10,'伸港','509'),
 (131,10,'員林','510'),
 (132,10,'社頭','511'),
 (133,10,'永靖','512'),
 (134,10,'埔心','513'),
 (135,10,'溪湖','514'),
 (136,10,'大村','515'),
 (137,10,'埔鹽','516'),
 (138,10,'田中','520'),
 (139,10,'北斗','521'),
 (140,10,'田尾','522'),
 (141,10,'埤頭','523'),
 (142,10,'溪州','524'),
 (143,10,'竹塘','525'),
 (144,10,'二林','526'),
 (145,11,'大城','527'),
 (146,11,'芳苑','528'),
 (147,11,'二水','530'),
 (148,11,'南投','540'),
 (149,11,'中寮','541'),
 (150,11,'草屯','542'),
 (151,11,'國姓','544'),
 (152,11,'埔里','545'),
 (153,11,'仁愛','546'),
 (154,11,'名間','551'),
 (155,11,'集集','552'),
 (156,11,'水里','553'),
 (157,11,'魚池','555'),
 (158,11,'信義','556');
INSERT INTO `abc`.`city` (`id`,`sid`,`name`,`zip`) VALUES 
 (159,11,'竹山','557'),
 (160,11,'鹿谷','558'),
 (161,12,'斗南','630'),
 (162,12,'大埤','631'),
 (163,12,'虎尾','632'),
 (164,12,'土庫','633'),
 (165,12,'褒忠','634'),
 (166,12,'東勢','635'),
 (167,12,'臺西','636'),
 (168,12,'崙背','637'),
 (169,12,'麥寮','638'),
 (170,12,'斗六','640'),
 (171,12,'林內','643'),
 (172,12,'古坑','646'),
 (173,12,'莿桐','647'),
 (174,12,'西螺','648'),
 (175,12,'二崙','649'),
 (176,12,'北港','651'),
 (177,12,'水林','652'),
 (178,12,'口湖','653'),
 (179,12,'四湖','654'),
 (180,12,'元長','655'),
 (181,14,'番路','602'),
 (182,14,'梅山','603'),
 (183,14,'竹崎','604'),
 (184,14,'阿里山','605'),
 (185,14,'中埔','606'),
 (186,14,'大埔','607'),
 (187,14,'水上','608'),
 (188,14,'鹿草','611'),
 (189,14,'太保','612'),
 (190,14,'朴子','613'),
 (191,14,'東石','614'),
 (192,14,'六腳','615'),
 (193,14,'新港','616'),
 (194,14,'民雄','621'),
 (195,14,'大林','622'),
 (196,14,'溪口','623');
INSERT INTO `abc`.`city` (`id`,`sid`,`name`,`zip`) VALUES 
 (197,14,'義竹','624'),
 (198,14,'布袋','625'),
 (199,15,'中西區','700'),
 (200,15,'東區','701'),
 (201,15,'南區','702'),
 (202,15,'北區','704'),
 (203,15,'安平區','708'),
 (204,15,'安南區','709'),
 (205,16,'永康','710'),
 (206,16,'歸仁','711'),
 (207,16,'新化','712'),
 (208,16,'左鎮','713'),
 (209,16,'玉井','714'),
 (210,16,'楠西','715'),
 (211,16,'南化','716'),
 (212,16,'仁德','717'),
 (213,16,'關廟','718'),
 (214,16,'龍崎','719'),
 (215,16,'官田','720'),
 (216,16,'麻豆','721'),
 (217,16,'佳里','722'),
 (218,16,'西港','723'),
 (219,16,'七股','724'),
 (220,16,'將軍','725'),
 (221,16,'學甲','726'),
 (222,16,'北門','727'),
 (223,16,'新營','730'),
 (224,16,'後壁','731'),
 (225,16,'白河','732'),
 (226,16,'東山','733'),
 (227,16,'六甲','734'),
 (228,16,'下營','735'),
 (229,16,'柳營','736'),
 (230,16,'鹽水','737'),
 (231,16,'善化','741'),
 (232,16,'大內','742'),
 (233,16,'山上','743');
INSERT INTO `abc`.`city` (`id`,`sid`,`name`,`zip`) VALUES 
 (234,16,'新市','744'),
 (235,16,'安定','745'),
 (236,17,'新興區','800'),
 (237,17,'前金區','801'),
 (238,17,'苓雅區','802'),
 (239,17,'鹽埕區','803'),
 (240,17,'鼓山區','804'),
 (241,17,'旗津區','805'),
 (242,17,'前鎮區','806'),
 (243,17,'三民區','807'),
 (244,17,'楠梓區','811'),
 (245,17,'小港區','812'),
 (246,17,'左營區','813'),
 (247,18,'仁武','814'),
 (248,18,'大社','815'),
 (249,18,'岡山','820'),
 (250,18,'路竹','821'),
 (251,18,'阿蓮','822'),
 (252,18,'田寮','823'),
 (253,18,'燕巢','824'),
 (254,18,'橋頭','825'),
 (255,18,'梓官','826'),
 (256,18,'彌陀','827'),
 (257,18,'永安','828'),
 (258,18,'湖內','829'),
 (259,18,'鳳山','830'),
 (260,18,'大寮','831'),
 (261,18,'林園','832'),
 (262,18,'鳥松','833'),
 (263,18,'大樹','840'),
 (264,18,'旗山','842'),
 (265,18,'美濃','843'),
 (266,18,'六龜','844'),
 (267,18,'內門','845'),
 (268,18,'杉林','846'),
 (269,18,'甲仙','847');
INSERT INTO `abc`.`city` (`id`,`sid`,`name`,`zip`) VALUES 
 (270,18,'桃源','848'),
 (271,18,'三民','849'),
 (272,18,'茂林','851'),
 (273,18,'茄萣','852'),
 (274,19,'屏東','900'),
 (275,19,'三地門','901'),
 (276,19,'霧臺','902'),
 (277,19,'瑪家','903'),
 (278,19,'九如','904'),
 (279,19,'里港','905'),
 (280,19,'高樹','906'),
 (281,19,'盬埔','907'),
 (282,19,'長治','908'),
 (283,19,'麟洛','909'),
 (284,19,'竹田','911'),
 (285,19,'內埔','912'),
 (286,19,'萬丹','913'),
 (287,19,'潮州','920'),
 (288,19,'泰武','921'),
 (289,20,'臺東','950'),
 (290,20,'綠島','951'),
 (291,20,'蘭嶼','952'),
 (292,20,'延平','953'),
 (293,20,'卑南','954'),
 (294,20,'鹿野','955'),
 (295,20,'關山','956'),
 (296,20,'海端','957'),
 (297,20,'池上','958'),
 (298,20,'東河','959'),
 (299,20,'成功','961'),
 (300,20,'長濱','962'),
 (301,20,'太麻里','963'),
 (302,20,'金峰','964'),
 (303,20,'大武','965'),
 (304,20,'達仁','966'),
 (305,21,'花蓮','970'),
 (306,21,'新城','971');
INSERT INTO `abc`.`city` (`id`,`sid`,`name`,`zip`) VALUES 
 (307,21,'秀林','972'),
 (308,21,'吉安','973'),
 (309,21,'壽豐','974'),
 (310,21,'鳳林','975'),
 (311,21,'光復','976'),
 (312,21,'豐濱','977'),
 (313,21,'瑞穗','978'),
 (314,21,'萬榮','979'),
 (315,21,'玉里','981'),
 (316,21,'卓溪','982'),
 (317,21,'富里','983'),
 (318,22,'宜蘭','260'),
 (319,22,'頭城','261'),
 (320,22,'礁溪','262'),
 (321,22,'壯圍','263'),
 (322,22,'員山','264'),
 (323,22,'羅東','265'),
 (324,22,'三星','266'),
 (325,22,'大同','267'),
 (326,22,'五結','268'),
 (327,22,'冬山','269'),
 (328,22,'蘇澳','270'),
 (329,22,'南澳','272'),
 (330,23,'馬公','880'),
 (331,23,'西嶼','881'),
 (332,23,'望安','882'),
 (333,23,'七美','883'),
 (334,23,'白沙','884'),
 (335,23,'湖西','885'),
 (336,24,'金沙','890'),
 (337,24,'金湖','891'),
 (338,24,'金寧','892'),
 (339,24,'金城','893'),
 (340,24,'烈嶼','894'),
 (341,24,'烏坵','896'),
 (342,25,'南竿','209'),
 (343,25,'北竿','210'),
 (344,25,'莒光','211');
INSERT INTO `abc`.`city` (`id`,`sid`,`name`,`zip`) VALUES 
 (345,25,'東引','212'),
 (346,26,'東沙','817'),
 (347,26,'南沙','819'),
 (348,5,'*','300'),
 (349,13,'*','600');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


--
-- Definition of table `abc`.`member`
--

DROP TABLE IF EXISTS `abc`.`member`;
CREATE TABLE  `abc`.`member` (
  `id` varchar(20) NOT NULL,
  `city` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `pwd` varchar(15) NOT NULL,
  `state` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `abc`.`member`
--

/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `abc`.`member` (`id`,`city`,`email`,`userid`,`pwd`,`state`) VALUES 
 ('20070406160109',342,'arlu300@yahoo.com.tw','arlu.yen','000000',25);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


--
-- Definition of table `abc`.`months`
--

DROP TABLE IF EXISTS `abc`.`months`;
CREATE TABLE  `abc`.`months` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `month` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `abc`.`months`
--

/*!40000 ALTER TABLE `months` DISABLE KEYS */;
INSERT INTO `abc`.`months` (`id`,`month`) VALUES 
 (1,1),
 (2,2),
 (3,3),
 (4,4),
 (5,5),
 (6,6),
 (7,7),
 (8,8),
 (9,9),
 (10,10),
 (11,11),
 (12,12);
/*!40000 ALTER TABLE `months` ENABLE KEYS */;


--
-- Definition of table `abc`.`state`
--

DROP TABLE IF EXISTS `abc`.`state`;
CREATE TABLE  `abc`.`state` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) character set big5 NOT NULL,
  `abs_name` varchar(5) character set big5 NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `abc`.`state`
--

/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `abc`.`state` (`id`,`name`,`abs_name`) VALUES 
 (1,'基隆市','1'),
 (2,'台北市','2'),
 (3,'台北縣','3'),
 (4,'桃園縣','4'),
 (5,'新竹市','5'),
 (6,'新竹縣','6'),
 (7,'苗栗縣','7'),
 (8,'台中市','8'),
 (9,'台中縣','9'),
 (10,'彰化縣','10'),
 (11,'南投縣','11'),
 (12,'雲林縣','12'),
 (13,'嘉義市','13'),
 (14,'嘉義縣','14'),
 (15,'台南市','15'),
 (16,'台南縣','16'),
 (17,'高雄市','17'),
 (18,'高雄縣','18'),
 (19,'屏東縣','19'),
 (20,'台東縣','20'),
 (21,'花蓮縣','21'),
 (22,'宜蘭縣','22'),
 (23,'澎湖縣','23'),
 (24,'金門縣','24'),
 (25,'連江縣','25');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;


--
-- Definition of table `abc`.`years`
--

DROP TABLE IF EXISTS `abc`.`years`;
CREATE TABLE  `abc`.`years` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `year` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `abc`.`years`
--

/*!40000 ALTER TABLE `years` DISABLE KEYS */;
INSERT INTO `abc`.`years` (`id`,`year`) VALUES 
 (1,1980),
 (2,1981),
 (3,1982),
 (4,1983),
 (5,1984);
/*!40000 ALTER TABLE `years` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
