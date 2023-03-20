-- Adminer 4.8.1 MySQL 8.0.32 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `drone`;
CREATE TABLE `drone` (
  `id` int NOT NULL,
  `nimi` varchar(45) DEFAULT NULL,
  `merkki` varchar(45) DEFAULT NULL,
  `malli` varchar(45) DEFAULT NULL,
  `info` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `käyttäjä_nimi` varchar(45) NOT NULL,
  `dronen kuvat` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_drone_käyttäjä_idx` (`käyttäjä_nimi`),
  KEY `fk_drone_dronen kuvat1_idx` (`dronen kuvat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `drone` (`id`, `nimi`, `merkki`, `malli`, `info`, `status`, `käyttäjä_nimi`, `dronen kuvat`) VALUES
(1,	'Mini 3 Pro',	'DJI',	'Mini 3 Pro',	'Vuoden paras drone',	'Käytössä',	'Jussi',	1),
(2,	'Mini 3',	'DJI',	'Mini 3',	'Vuoden 2. paras drone',	'Käytössä',	'Jonne',	2),
(3,	'Mavic 3',	'DJI',	'Mavic 3',	'Vuoden 3. paras drone',	'Ei Käytössä',	'Mortti',	0),
(4,	'Air 2S',	'DJI',	'Air 2S',	'Vuoden 4. paras drone',	'Ei Käytössä',	'Monni',	10),
(5,	'Evo Lite+',	'Autel',	'Evo Lite+',	'Vuoden 5. paras drone',	'Ei Käytössä',	'Pentti',	7);

DROP TABLE IF EXISTS `dronen kuvat`;
CREATE TABLE `dronen kuvat` (
  `id` int NOT NULL,
  `nimi` varchar(45) DEFAULT NULL,
  `kuvaus` varchar(45) DEFAULT NULL,
  `paikkatieto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ajankohta` varchar(45) DEFAULT NULL,
  `drone_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dronen kuvat_drone1_idx` (`drone_id`),
  CONSTRAINT `fk_dronen kuvat_drone1` FOREIGN KEY (`drone_id`) REFERENCES `drone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `dronen kuvat` (`id`, `nimi`, `kuvaus`, `paikkatieto`, `ajankohta`, `drone_id`) VALUES
(1,	'Vuoria',	'muutama vuori',	'Lat: 27.986065 Long: 86.922623',	'23:44',	1),
(2,	'Lentokoneita',	'muutama lentsikka',	'Lat: 32.1500000 Long: -110.8358333',	'21:12',	2),
(3,	'Rakennus',	'Aatun lempi rakennus',	'Lat: 32.6761667 Long: -117.1576667',	'14:55',	2),
(4,	'Vene',	'Iso vene keskellä mitä??',	'Lat: 22.3041667 Long: 114.1900278',	'12:56',	4),
(5,	'Antonov',	'Maailman ex isoin lentokone',	'Lat: 50.587200 Long: 30.210618',	'09:13',	4);

DROP TABLE IF EXISTS `käyttäjä`;
CREATE TABLE `käyttäjä` (
  `nimi` varchar(45) NOT NULL,
  `tunnus` int DEFAULT NULL,
  `salasana` varchar(16) DEFAULT NULL,
  `token` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`nimi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `käyttäjä` (`nimi`, `tunnus`, `salasana`, `token`) VALUES
('Jonne',	23456,	'pwd1',	'c2h1fkn2yh8s39g3ton14rst6ecgorl2s'),
('Jussi',	12345,	'pwd',	'vvtoocjp1dqgfea7gjblzhi1g4j7ss4kp'),
('Monni',	45678,	'pwd3',	'glerbcydfbrb1vw4rstl5c3xgtm4ak5xu'),
('Mortti',	34567,	'pwd2',	's0r5ozcy0hbrdno8j61jkhcfpq87rqm'),
('Pentti',	56789,	'pwd4',	'a92xgqbbtg5flws1xc3oqtbukyhbgks');

DROP TABLE IF EXISTS `lähetysosoite`;
CREATE TABLE `lähetysosoite` (
  `osoite` varchar(45) NOT NULL,
  `dronen kuvat` int NOT NULL,
  PRIMARY KEY (`osoite`),
  KEY `fk_lähetysosoite_dronen kuvat1_idx` (`dronen kuvat`),
  CONSTRAINT `fk_lähetysosoite_dronen kuvat1` FOREIGN KEY (`dronen kuvat`) REFERENCES `dronen kuvat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `lähetysosoite` (`osoite`, `dronen kuvat`) VALUES
('www.example-db/kuvat.com',	1),
('www.example-db1/kuvat.com',	2),
('www.example-db5/kuvat.com',	3),
('www.example-db6/kuvat.com',	3),
('www.example-db3/kuvat.com',	5);

-- 2023-03-20 13:50:58
