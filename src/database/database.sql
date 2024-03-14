/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - senalearn
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`senalearn` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `senalearn`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `Id_Cat` varchar(100) NOT NULL,
  `Nom_Cat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`Id_Cat`,`Nom_Cat`) values 
('1','Programación'),
('2','mamawebos'),
('2fquk70wlt28m5c0','desarrollo web'),
('2fquk70wlt28mn9b','diseño gráfico'),
('2fquk70wlt28muiz','marketing digital'),
('2fquk70wlt28n9fi','negocios y emprendimiento'),
('2fquk70wlt28nixt','ciencia de datos'),
('2fquk70wlt28np26','arte y creatividad'),
('2fquk70wlt28ogue','salud y bienestar'),
('2fquk70wlt28ors4','cocina y gastronomía'),
('2fquk73olt36rfar','petristas'),
('3','Marketing'),
('4','Idiomas'),
('5','SOFTWARE'),
('ahyv6j0lt7mmmac','lolala');

/*Table structure for table `certificados` */

DROP TABLE IF EXISTS `certificados`;

CREATE TABLE `certificados` (
  `Tit_Cert` varchar(255) DEFAULT NULL,
  `Descp_Cert` varchar(255) DEFAULT NULL,
  `Fec_Crea_Cert` date DEFAULT NULL,
  `Firm_Dig_Cert` blob DEFAULT NULL,
  `Id_User_FK` varchar(100) NOT NULL,
  `Id_Cur_FK` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_User_FK`,`Id_Cur_FK`),
  KEY `Id_Cur_FK` (`Id_Cur_FK`),
  CONSTRAINT `certificados_ibfk_2` FOREIGN KEY (`Id_Cur_FK`) REFERENCES `cursos` (`Id_Cur`),
  CONSTRAINT `certificados_ibfk_3` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `certificados` */

/*Table structure for table `comentarios` */

DROP TABLE IF EXISTS `comentarios`;

CREATE TABLE `comentarios` (
  `Id_Com` int(255) NOT NULL,
  `Id_User_FK` varchar(100) DEFAULT NULL,
  `Id_Cursos_FK` varchar(100) DEFAULT NULL,
  `Fecha_Pub_Com` date DEFAULT NULL,
  `Desc_Comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Com`),
  KEY `Id_User_FK` (`Id_User_FK`),
  KEY `Id_Cursos_FK` (`Id_Cursos_FK`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`Id_Cursos_FK`) REFERENCES `cursos` (`Id_Cur`),
  CONSTRAINT `comentarios_ibfk_3` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `comentarios` */

/*Table structure for table `contenido_modulo` */

DROP TABLE IF EXISTS `contenido_modulo`;

CREATE TABLE `contenido_modulo` (
  `Id_Cont` varchar(100) NOT NULL,
  `Tip_Cont` int(50) DEFAULT NULL COMMENT '1:audio, 2:video, 3: texto, 4:documento',
  `Url_Cont` varchar(255) DEFAULT NULL,
  `Tit_Cont` varchar(255) DEFAULT NULL,
  `Id_Mod_FK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Cont`),
  KEY `Id_Mod_FK` (`Id_Mod_FK`),
  CONSTRAINT `contenido_modulo_ibfk_1` FOREIGN KEY (`Id_Mod_FK`) REFERENCES `modulocurso` (`Id_Mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `contenido_modulo` */

/*Table structure for table `cursos` */

DROP TABLE IF EXISTS `cursos`;

CREATE TABLE `cursos` (
  `Id_Cur` varchar(100) NOT NULL,
  `Nom_Cur` varchar(255) DEFAULT NULL,
  `Des_Cur` varchar(255) DEFAULT NULL,
  `Hor_Cont_Total` int(11) DEFAULT NULL,
  `Fech_Crea_Cur` date DEFAULT NULL,
  `Id_Cat_FK` varchar(100) DEFAULT NULL,
  `Fot_Cur` varchar(200) DEFAULT NULL,
  `Est_Cur` int(1) DEFAULT NULL COMMENT '1:CREADO, 2: PUBLICADO, 3:ELIMINADO',
  PRIMARY KEY (`Id_Cur`),
  KEY `Id_Cat_FK` (`Id_Cat_FK`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`Id_Cat_FK`) REFERENCES `categorias` (`Id_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cursos` */

insert  into `cursos`(`Id_Cur`,`Nom_Cur`,`Des_Cur`,`Hor_Cont_Total`,`Fech_Crea_Cur`,`Id_Cat_FK`,`Fot_Cur`,`Est_Cur`) values 
('1','Curso de Programación Avanzada','Este curso cubre temas avanzados de programación en varios lenguajes.',40,'2024-02-07','1','https://ejemplo.com/imagen_curso.jpg',2),
('2','Fundamentos del Diseño Gráfico','Domina los elementos esenciales del diseño gráfico',40,'2023-02-01','2',NULL,2),
('2fquk2aclt1pzzry','Curso de COSTURA','Este curso cubre temas avanzados de COSTURA.',100,'2024-02-07','4','https://ejemplo.com/imagen_curso.jpg',1),
('2fquk3a8lt1q1ddf','Curso de COSTURA','Este curso cubre temas avanzados de COSTURA.',100,'2024-02-07','4','https://ejemplo.com/imagen_curso.jpg',1),
('2fquk3eklt3iqtu1','edsfdsfdf','dsfsdfdsfdsfdf',10,'2024-02-07','1','fdsdfdsfdsfsdf',1),
('2fquk5t0lt1q0tbv','Curso de COSTURA','Este curso cubre temas avanzados de COSTURA.',100,'2024-02-07','4','https://ejemplo.com/imagen_curso.jpg',1),
('2fqukuklt1puwas','Curso de COSTURA','Este curso cubre temas avanzados de COSTURA.',100,'2024-02-07','4','https://ejemplo.com/imagen_curso.jpg',1),
('3','Estrategias de Marketing Digital','Explora estrategias efectivas de marketing digital',40,'2023-03-01','3',NULL,2),
('4','Inglés Intermedio','Desarrolla habilidades en el idioma inglés',15,'2023-04-01','4',NULL,2),
('5','Gestión Financiera Personal','Aprende a manejar tus finanzas personales',18,'2023-05-01','5',NULL,2),
('ahyv2bslt0x9d1j','Curso de Programación Avanzada','Este curso cubre temas avanzados de programación en varios lenguajes.',40,'2024-02-05','1','https://ejemplo.com/imagen_curso.jpg',1),
('ahyv5bolsxp9nxs','Costura Basica','Este curso cubre temas avanzados de programación en varios lenguajes.',40,'2024-02-05','1','https://ejemplo.com/imagen_curso.jpg',1),
('ahyv8bslsxtrcct','Costura Basica','Este curso cubre temas avanzados de programación en varios lenguajes.',40,'2024-02-05','1','https://ejemplo.com/imagen_curso.jpg',1);

/*Table structure for table `evaluacion` */

DROP TABLE IF EXISTS `evaluacion`;

CREATE TABLE `evaluacion` (
  `Id_Eva` int(11) NOT NULL,
  `Tit_Eva` varchar(255) DEFAULT NULL,
  `Des_Eva` varchar(255) DEFAULT NULL,
  `Fec_Crea` date DEFAULT NULL,
  `Fec_Cer` date DEFAULT NULL,
  `Id_Mod_Cur_FK` varchar(100) DEFAULT NULL,
  `Not_Min_Apr_Eva` decimal(5,2) DEFAULT NULL,
  `Estado_Eval` varchar(50) DEFAULT NULL,
  `Intentos_Eval` int(11) DEFAULT NULL,
  `Tipo_Eval` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Eva`),
  KEY `Id_Mod_Cur_FK` (`Id_Mod_Cur_FK`),
  CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`Id_Mod_Cur_FK`) REFERENCES `modulocurso` (`Id_Mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `evaluacion` */

/*Table structure for table `inscripciones` */

DROP TABLE IF EXISTS `inscripciones`;

CREATE TABLE `inscripciones` (
  `Id_User_FK` varchar(100) NOT NULL,
  `Id_Cur_FK` varchar(100) NOT NULL,
  `Prog_Cur` varchar(50) DEFAULT NULL,
  `fecha_insc` date DEFAULT NULL,
  PRIMARY KEY (`Id_User_FK`,`Id_Cur_FK`),
  KEY `Id_Cur_FK` (`Id_Cur_FK`),
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`Id_Cur_FK`) REFERENCES `cursos` (`Id_Cur`),
  CONSTRAINT `inscripciones_ibfk_3` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `inscripciones` */

insert  into `inscripciones`(`Id_User_FK`,`Id_Cur_FK`,`Prog_Cur`,`fecha_insc`) values 
('ahyv6wlt7qkine','1','25%','2024-03-07');

/*Table structure for table `localizacion` */

DROP TABLE IF EXISTS `localizacion`;

CREATE TABLE `localizacion` (
  `Id_Loc` int(11) NOT NULL AUTO_INCREMENT,
  `Dir_Ip` varchar(255) DEFAULT NULL,
  `Id_User_FK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Loc`),
  KEY `Id_User_FK` (`Id_User_FK`),
  CONSTRAINT `localizacion_ibfk_1` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `localizacion` */

insert  into `localizacion`(`Id_Loc`,`Dir_Ip`,`Id_User_FK`) values 
(41,'192.168.0.1','ahyv6wlt7qkine'),
(42,'192.168.1.6','ahyv6wlt7qkine'),
(43,'192.178.4.44','ahyv6wlt7qkine');

/*Table structure for table `modulocurso` */

DROP TABLE IF EXISTS `modulocurso`;

CREATE TABLE `modulocurso` (
  `Id_Mod` varchar(100) NOT NULL,
  `Tit_Mod` varchar(255) DEFAULT NULL,
  `Est_Mod` int(1) DEFAULT NULL COMMENT '0: creado, 1:activo, 2: bloqueado',
  `Id_Cur_FK` varchar(100) DEFAULT NULL,
  `Horas_Cont_Mod` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Mod`),
  KEY `Id_Cur_FK` (`Id_Cur_FK`),
  CONSTRAINT `modulocurso_ibfk_1` FOREIGN KEY (`Id_Cur_FK`) REFERENCES `cursos` (`Id_Cur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `modulocurso` */

/*Table structure for table `objetivos_cursos` */

DROP TABLE IF EXISTS `objetivos_cursos`;

CREATE TABLE `objetivos_cursos` (
  `Id_Objetivo` varchar(100) NOT NULL,
  `Desc_Objetivo` varchar(255) DEFAULT NULL,
  `Id_Cur_FK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Objetivo`),
  KEY `Id_Cur_FK` (`Id_Cur_FK`),
  CONSTRAINT `objetivos_cursos_ibfk_1` FOREIGN KEY (`Id_Cur_FK`) REFERENCES `cursos` (`Id_Cur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objetivos_cursos` */

/*Table structure for table `opciones` */

DROP TABLE IF EXISTS `opciones`;

CREATE TABLE `opciones` (
  `id_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_opcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `opciones` */

insert  into `opciones`(`id_opcion`,`nombre_opcion`) values 
(1,'mamawebos'),
(2,'lilala'),
(3,'categorias');

/*Table structure for table `preguntaseval` */

DROP TABLE IF EXISTS `preguntaseval`;

CREATE TABLE `preguntaseval` (
  `Id_Preg_Eval` int(11) NOT NULL,
  `Text_Preg_Eval` varchar(255) DEFAULT NULL,
  `Id_Eval_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Preg_Eval`),
  KEY `Id_Eval_FK` (`Id_Eval_FK`),
  CONSTRAINT `preguntaseval_ibfk_1` FOREIGN KEY (`Id_Eval_FK`) REFERENCES `evaluacion` (`Id_Eva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `preguntaseval` */

/*Table structure for table `respuestaseval` */

DROP TABLE IF EXISTS `respuestaseval`;

CREATE TABLE `respuestaseval` (
  `Id_Res_Eval` int(11) NOT NULL,
  `Text_Resp_Eval` varchar(255) DEFAULT NULL,
  `Resp_Correcta_Eval` tinyint(1) DEFAULT NULL,
  `Id_Preg_Eval_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Res_Eval`),
  KEY `Id_Preg_Eval_FK` (`Id_Preg_Eval_FK`),
  CONSTRAINT `respuestaseval_ibfk_1` FOREIGN KEY (`Id_Preg_Eval_FK`) REFERENCES `preguntaseval` (`Id_Preg_Eval`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `respuestaseval` */

/*Table structure for table `resultados_evaluacion` */

DROP TABLE IF EXISTS `resultados_evaluacion`;

CREATE TABLE `resultados_evaluacion` (
  `Id_Res_Eval` int(11) NOT NULL,
  `Id_Eval_FK` int(11) DEFAULT NULL,
  `Id_User_FK` varchar(100) DEFAULT NULL,
  `Puntuacion` decimal(5,2) DEFAULT NULL,
  `Fech_Real_Eval` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Res_Eval`),
  KEY `Id_Eval_FK` (`Id_Eval_FK`),
  KEY `Id_User_FK` (`Id_User_FK`),
  CONSTRAINT `resultados_evaluacion_ibfk_1` FOREIGN KEY (`Id_Eval_FK`) REFERENCES `evaluacion` (`Id_Eva`),
  CONSTRAINT `resultados_evaluacion_ibfk_2` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resultados_evaluacion` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `Id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`Id_Rol`,`Nom_Rol`) values 
(1,'ESTUDIANTE'),
(2,'ADMIN'),
(3,'INSTRUCTOR'),
(6,'VOCERO');

/*Table structure for table `roles_opciones` */

DROP TABLE IF EXISTS `roles_opciones`;

CREATE TABLE `roles_opciones` (
  `Id_Rol_fk` int(11) NOT NULL,
  `id_opcion_fk` int(11) NOT NULL,
  PRIMARY KEY (`Id_Rol_fk`,`id_opcion_fk`),
  KEY `id_opcion_fk` (`id_opcion_fk`),
  CONSTRAINT `roles_opciones_ibfk_2` FOREIGN KEY (`id_opcion_fk`) REFERENCES `opciones` (`id_opcion`),
  CONSTRAINT `roles_opciones_ibfk_3` FOREIGN KEY (`Id_Rol_fk`) REFERENCES `roles` (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles_opciones` */

insert  into `roles_opciones`(`Id_Rol_fk`,`id_opcion_fk`) values 
(1,2),
(2,1),
(2,2),
(2,3);

/*Table structure for table `tokens` */

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `Id_Token` int(11) NOT NULL AUTO_INCREMENT,
  `Token` varchar(255) DEFAULT NULL,
  `Fec_Caducidad` varchar(100) DEFAULT NULL,
  `User_Id_FK` varchar(100) DEFAULT NULL,
  `Tipo_token` char(1) DEFAULT NULL COMMENT '1: inicio Sesion, 2: verificacion Email, 3: recuperacion de contraseña, 4: Verificar IP',
  PRIMARY KEY (`Id_Token`),
  KEY `Usuario_Id` (`User_Id_FK`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`User_Id_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tokens` */

insert  into `tokens`(`Id_Token`,`Token`,`Fec_Caducidad`,`User_Id_FK`,`Tipo_token`) values 
(132,'207177','1709242624','ahyv6wlt7qkine','2'),
(133,'840892','1709243437','ahyv6wlt7qkine','4'),
(145,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTM5NjY1MiwiZXhwIjoxNzA5NDExMDUyfQ.VroqlHRbwu8NEsf7R-1Mzw8Qq0aGgsHB1ubn_VtQd0c','1709411052','ahyv6wlt7qkine','1'),
(213,'xdfff','27-02-2023',NULL,'1'),
(214,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTQ3NjcwNywiZXhwIjoxNzA5NDkxMTA3fQ._Di9L5L5dWYyJAo9w8DEXdkWH43I8Vlqm6xoo7RTOlM','1709491107','ahyv6wlt7qkine','1'),
(215,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5MzYyOSwiZXhwIjoxNzA5NjA4MDI5fQ.pjO6P-ltuWQLESsCUnY0O6aXrIAPREm9r-WAjOSBo-Y','1709608029','ahyv6wlt7qkine','1'),
(216,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5MzY1OCwiZXhwIjoxNzA5NjA4MDU4fQ.GAsI9P9RNIYPuMAWhBq2-MQwBxs-9Fr8joV5NXPa9rw','1709608058','ahyv6wlt7qkine','1'),
(217,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5MzY3OSwiZXhwIjoxNzA5NjA4MDc5fQ.kQDxTX5T0OR6g6P968szHROIzK5jZ6xvHND12fXMOvg','1709608079','ahyv6wlt7qkine','1'),
(218,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5Mzc1MCwiZXhwIjoxNzA5NjA4MTUwfQ.GHIZDrsRd-AakNprdORlGT8XNCiSPogmr-pck18cQp8','1709608150','ahyv6wlt7qkine','1'),
(219,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5Mzc3MSwiZXhwIjoxNzA5NjA4MTcxfQ.Z_ytxzOyuJ3bFmTNoaqJWiLakKt1g65K_MjRGLoVt7U','1709608171','ahyv6wlt7qkine','1'),
(220,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5Mzc4NSwiZXhwIjoxNzA5NjA4MTg1fQ.ABJat5AlqWSZ0UDGNJQZypxaAuVeG5PN8ORn99GJ2oY','1709608185','ahyv6wlt7qkine','1'),
(221,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5Mzg2OSwiZXhwIjoxNzA5NjA4MjY5fQ.xJyJOXec2DNNlmc0LnlB0P2JMiMtLpGHv0fSEiKzDSU','1709608269','ahyv6wlt7qkine','1'),
(222,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5MzkxNCwiZXhwIjoxNzA5NjA4MzE0fQ.EZSk7nDqBBEjzC7285VKJdJ7Cu-aH7yL8X2QXqY9fzY','1709608314','ahyv6wlt7qkine','1'),
(223,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5Mzk4MSwiZXhwIjoxNzA5NjA4MzgxfQ.q9LiBbbK2Fo81007Yz9kmnR4rLo41WQHuJXntMck2FA','1709608381','ahyv6wlt7qkine','1'),
(224,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5NDA4NSwiZXhwIjoxNzA5NjA4NDg1fQ.uFbuuO_3CP_QboZfi7_VIR-ynloMKZdqbvBiCULF7JQ','1709608485','ahyv6wlt7qkine','1'),
(225,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5NDU2NSwiZXhwIjoxNzA5NjA4OTY1fQ.yuJkwVyh_heCcRHj5jzhzPS6pE_A5utCCISx4Kgros8','1709608965','ahyv6wlt7qkine','1'),
(226,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5NTg2OCwiZXhwIjoxNzA5NjEwMjY4fQ.LGIqkGZRIXkiGj_dSBk9_cZeXkvT-uLD01YY3uGP0yw','1709610268','ahyv6wlt7qkine','1'),
(227,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5NTk3MiwiZXhwIjoxNzA5NjEwMzcyfQ.cH3G6h6MmTVXv-OWmCv787g_d0KLy7k5NbEZ1tbmLmI','1709610372','ahyv6wlt7qkine','1'),
(228,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5NTk3NCwiZXhwIjoxNzA5NjEwMzc0fQ.Mr3m5ePqkXuhChfzIw3dQomR9_pJfvfnH1D889XKrNU','1709610374','ahyv6wlt7qkine','1'),
(229,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTU5NTk3NSwiZXhwIjoxNzA5NjEwMzc1fQ.7MF7iH4_rPAE_evpa4Z4kz1vFzp0emegAVYjqJXDW2k','1709610375','ahyv6wlt7qkine','1'),
(230,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMTY0MiwiZXhwIjoxNzA5NjE2MDQyfQ.g90cewCGdkw3fjSj4TF-uEKjDWiLgvcx-Qzig9A6r7E','1709616042','ahyv6wlt7qkine','1'),
(231,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMTc3OCwiZXhwIjoxNzA5NjE2MTc4fQ.wxkDTVaJyjFnB1zS4i7AISRZ3nc2OWRIlkCIP9nOCQg','1709616178','ahyv6wlt7qkine','1'),
(232,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMjg1NywiZXhwIjoxNzA5NjE3MjU3fQ.vg67Q8lcvhkolK-3deF1sjf8KV96vVNWE69oPB8JZqE','1709617257','ahyv6wlt7qkine','1'),
(233,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzA3OCwiZXhwIjoxNzA5NjE3NDc4fQ.pTIc-zwabWEKdTXJDflh7g48MZS1Bk9IsP6zw_2yGhE','1709617478','ahyv6wlt7qkine','1'),
(234,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzIwNSwiZXhwIjoxNzA5NjE3NjA1fQ.r02vAWV2zfXuPyu-fvjaNGTP5FSj0r1ZZ9L7um8lpNY','1709617605','ahyv6wlt7qkine','1'),
(235,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzM1NiwiZXhwIjoxNzA5NjE3NzU2fQ.iy44hbK5HhrcV5G78eAF3MxBp3R_ZzXJQGwCVDJxOl0','1709617756','ahyv6wlt7qkine','1'),
(236,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzM1NywiZXhwIjoxNzA5NjE3NzU3fQ.Q4ohEDOj94kzJ2RgSWM-iGH39Z6VX-i1Ex-Vstk6GJY','1709617757','ahyv6wlt7qkine','1'),
(237,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzM1NywiZXhwIjoxNzA5NjE3NzU3fQ.Q4ohEDOj94kzJ2RgSWM-iGH39Z6VX-i1Ex-Vstk6GJY','1709617757','ahyv6wlt7qkine','1'),
(238,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzM1OCwiZXhwIjoxNzA5NjE3NzU4fQ.0oIrRFr0azTsj_ONzQNvqY7deBO3bRZ6koA4j4olZgQ','1709617758','ahyv6wlt7qkine','1'),
(239,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzM1OCwiZXhwIjoxNzA5NjE3NzU4fQ.0oIrRFr0azTsj_ONzQNvqY7deBO3bRZ6koA4j4olZgQ','1709617758','ahyv6wlt7qkine','1'),
(240,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzM1OCwiZXhwIjoxNzA5NjE3NzU4fQ.0oIrRFr0azTsj_ONzQNvqY7deBO3bRZ6koA4j4olZgQ','1709617758','ahyv6wlt7qkine','1'),
(241,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzM1OCwiZXhwIjoxNzA5NjE3NzU4fQ.0oIrRFr0azTsj_ONzQNvqY7deBO3bRZ6koA4j4olZgQ','1709617758','ahyv6wlt7qkine','1'),
(242,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzM1OSwiZXhwIjoxNzA5NjE3NzU5fQ.jHhpfEacYriCiRl4F7ys5lZ_f0hnFo_eO9Z3ic9gYno','1709617759','ahyv6wlt7qkine','1'),
(243,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzM2NCwiZXhwIjoxNzA5NjE3NzY0fQ.1Wu1OhywLJXedv-LPmqUfi79UNDbLlAeKU9mXCi62fk','1709617764','ahyv6wlt7qkine','1'),
(244,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzM2NCwiZXhwIjoxNzA5NjE3NzY0fQ.1Wu1OhywLJXedv-LPmqUfi79UNDbLlAeKU9mXCi62fk','1709617764','ahyv6wlt7qkine','1'),
(245,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTYwMzUwNywiZXhwIjoxNzA5NjE3OTA3fQ.PqbFjdew2JiXsOnsGESJaEB1R4_mvEu8BSEscMd3FxU','1709617907','ahyv6wlt7qkine','1'),
(246,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTY3NjgxOCwiZXhwIjoxNzA5NjkxMjE4fQ.0092ZM4IIFxk1bYwtn_mAsffSETu6N7EePgUgC3QV0k','1709691218','ahyv6wlt7qkine','1'),
(247,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTY3Njg3OCwiZXhwIjoxNzA5NjkxMjc4fQ.0jxw_irpGxbGD8QgXQ_xWFBf9SX9U5hFGa5zimH7GNw','1709691278','ahyv6wlt7qkine','1'),
(248,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgxNjU2MiwiZXhwIjoxNzA5ODMwOTYyfQ.eenfkf9fagqTit-s5g6NyJjXQe8NyME0u8-CKCmHXxg','1709830962','ahyv6wlt7qkine','1'),
(249,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgxNjcxNCwiZXhwIjoxNzA5ODMxMTE0fQ.HD75TQ0whPF8K0GOSY_A7jBrmeZ2otL-czCIPZqBcXU','1709831114','ahyv6wlt7qkine','1'),
(250,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMDcwNiwiZXhwIjoxNzA5ODM1MTA2fQ.JhI8VO_hQFixb3MjdzeoROWZkMC-IH0YMa0nfV5PAWo','1709835106','ahyv6wlt7qkine','1'),
(251,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMDcwNywiZXhwIjoxNzA5ODM1MTA3fQ.N6Zam-FEH7UpVFwhk1RBUPdz-CvHgfx6SWhqgYNMTLM','1709835107','ahyv6wlt7qkine','1'),
(252,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMDc2NywiZXhwIjoxNzA5ODM1MTY3fQ.1Xm-7N96fn4sY4a71RsW4rjV9FWcCYQU8VgzdWY0-8g','1709835167','ahyv6wlt7qkine','1'),
(253,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMDg2OCwiZXhwIjoxNzA5ODM1MjY4fQ.qLovlpP7Iw8LOhXSHdhV9k9lgbGvGNwX4fG06KvlD64','1709835268','ahyv6wlt7qkine','1'),
(254,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMDg2OCwiZXhwIjoxNzA5ODM1MjY4fQ.qLovlpP7Iw8LOhXSHdhV9k9lgbGvGNwX4fG06KvlD64','1709835268','ahyv6wlt7qkine','1'),
(255,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMTkwNSwiZXhwIjoxNzA5ODM2MzA1fQ.K8AdfFy6i55w7wwbI69nashjbQXGVVqg5QRsl3EuNzg','1709836305','ahyv6wlt7qkine','1'),
(256,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMTkzMywiZXhwIjoxNzA5ODM2MzMzfQ.EQasTMN-Bj2_GJ2hxf6XyyILFdsZiHjqYDG-BfTyUKU','1709836333','ahyv6wlt7qkine','1'),
(257,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMTk2MSwiZXhwIjoxNzA5ODM2MzYxfQ.Mu6jrIVh2BbAgqGLAHVFs5Z3hVtyBiWcde0gpiCyRMo','1709836361','ahyv6wlt7qkine','1'),
(258,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjQ4NywiZXhwIjoxNzA5ODM2ODg3fQ.3HAEW3SElpLsk5M-v0CPtJPBquBKFj49oTBBg04aMOE','1709836887','ahyv6wlt7qkine','1'),
(259,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjUyMywiZXhwIjoxNzA5ODM2OTIzfQ.f7705lDlfv4EIvRG1fVmKcLF1D6TAy3YGaobNv0aXA0','1709836923','ahyv6wlt7qkine','1'),
(260,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjUyNSwiZXhwIjoxNzA5ODM2OTI1fQ.-lAQqAo5Kv20_TGvq9Dsiw8tdD9LonegONAMf73o8Gs','1709836925','ahyv6wlt7qkine','1'),
(261,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjUyNSwiZXhwIjoxNzA5ODM2OTI1fQ.-lAQqAo5Kv20_TGvq9Dsiw8tdD9LonegONAMf73o8Gs','1709836925','ahyv6wlt7qkine','1'),
(262,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjUyNSwiZXhwIjoxNzA5ODM2OTI1fQ.-lAQqAo5Kv20_TGvq9Dsiw8tdD9LonegONAMf73o8Gs','1709836925','ahyv6wlt7qkine','1'),
(263,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjUyNiwiZXhwIjoxNzA5ODM2OTI2fQ.TjDIn8RzJ9cxpokxXnDXQgsJHaVmZAEDKet-HyBWc9s','1709836926','ahyv6wlt7qkine','1'),
(264,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjUyNiwiZXhwIjoxNzA5ODM2OTI2fQ.TjDIn8RzJ9cxpokxXnDXQgsJHaVmZAEDKet-HyBWc9s','1709836926','ahyv6wlt7qkine','1'),
(265,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjU3MSwiZXhwIjoxNzA5ODM2OTcxfQ.eTJ8c5HxnHw4JbpcF5ABwqogc7bQ8NlzjDcDnyRQgJU','1709836971','ahyv6wlt7qkine','1'),
(266,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjU3MywiZXhwIjoxNzA5ODM2OTczfQ.YhNMHLzPC3VXm4c5TzF1ITVHPC8ige-y0GjNIbI4iPo','1709836973','ahyv6wlt7qkine','1'),
(267,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjU3MywiZXhwIjoxNzA5ODM2OTczfQ.YhNMHLzPC3VXm4c5TzF1ITVHPC8ige-y0GjNIbI4iPo','1709836973','ahyv6wlt7qkine','1'),
(268,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjU3NCwiZXhwIjoxNzA5ODM2OTc0fQ.Z-V_cNiUebFwuj20s5eqmmt58wRRwP04oPVjMkuE608','1709836974','ahyv6wlt7qkine','1'),
(269,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjY2MywiZXhwIjoxNzA5ODM3MDYzfQ.JuOQUIDWLbneaELOo1lWG6eZkOvyJAcLCn8rR93cNuA','1709837063','ahyv6wlt7qkine','1'),
(270,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg2MiwiZXhwIjoxNzA5ODM3MjYyfQ.D4HlZ8l4adhqqNzg4fd6yzmj53B07MkaQcxRtVLMc4s','1709837262','ahyv6wlt7qkine','1'),
(271,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg2MiwiZXhwIjoxNzA5ODM3MjYyfQ.D4HlZ8l4adhqqNzg4fd6yzmj53B07MkaQcxRtVLMc4s','1709837262','ahyv6wlt7qkine','1'),
(272,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg2OCwiZXhwIjoxNzA5ODM3MjY4fQ.SnUDqRn2WpnurGR9jxoxjODsjN8aaHhs0-CSQEQG8TA','1709837268','ahyv6wlt7qkine','1'),
(273,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg2OSwiZXhwIjoxNzA5ODM3MjY5fQ.KNjTaRg4sKzFzGrrxttAdPgFrczihPepl6Vg1bAlZLE','1709837269','ahyv6wlt7qkine','1'),
(274,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg3MCwiZXhwIjoxNzA5ODM3MjcwfQ.z1Hp1lQz0X93JuZsm7NQQ9hIISMHn1aSVPNVHDB_5uI','1709837270','ahyv6wlt7qkine','1'),
(275,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg3MSwiZXhwIjoxNzA5ODM3MjcxfQ.GYkh1AcVurZA7oDR61poh5SVvMszeXmy-f2E2fNnkLU','1709837271','ahyv6wlt7qkine','1'),
(276,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg3MSwiZXhwIjoxNzA5ODM3MjcxfQ.GYkh1AcVurZA7oDR61poh5SVvMszeXmy-f2E2fNnkLU','1709837271','ahyv6wlt7qkine','1'),
(277,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg3MSwiZXhwIjoxNzA5ODM3MjcxfQ.GYkh1AcVurZA7oDR61poh5SVvMszeXmy-f2E2fNnkLU','1709837271','ahyv6wlt7qkine','1'),
(278,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg3MiwiZXhwIjoxNzA5ODM3MjcyfQ.pDQXK9dMlMGWWpPK1Iq_KfoyHaWcnu0FC1Q3Z9Vnw4E','1709837272','ahyv6wlt7qkine','1'),
(279,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg3OSwiZXhwIjoxNzA5ODM3Mjc5fQ.sDbJXLEm7bJ1chR6DRk4oKfSVezct2y7x4_VWKEsgLM','1709837279','ahyv6wlt7qkine','1'),
(280,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg5NSwiZXhwIjoxNzA5ODM3Mjk1fQ.YDz7TwqMUrT29XTJUF5kj6MumIKKfn0rPQIv4Fft1ZU','1709837295','ahyv6wlt7qkine','1'),
(281,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg5NiwiZXhwIjoxNzA5ODM3Mjk2fQ.sCJLNm5srzJUsu-L8fQdhnqe0Bejbxix3sF6MZa6C1c','1709837296','ahyv6wlt7qkine','1'),
(282,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg5NiwiZXhwIjoxNzA5ODM3Mjk2fQ.sCJLNm5srzJUsu-L8fQdhnqe0Bejbxix3sF6MZa6C1c','1709837296','ahyv6wlt7qkine','1'),
(283,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg5NywiZXhwIjoxNzA5ODM3Mjk3fQ.mCpA8U7PfLpR9SFOpNAmxfhd5aYsyAP0fObele1WkyE','1709837297','ahyv6wlt7qkine','1'),
(284,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMjg5NywiZXhwIjoxNzA5ODM3Mjk3fQ.mCpA8U7PfLpR9SFOpNAmxfhd5aYsyAP0fObele1WkyE','1709837297','ahyv6wlt7qkine','1'),
(285,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzIzMiwiZXhwIjoxNzA5ODM3NjMyfQ.9INlMZVOeRZ931ox0-8d237B3Tx51f6AY2mBjaw3lHQ','1709837632','ahyv6wlt7qkine','1'),
(286,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzIzMiwiZXhwIjoxNzA5ODM3NjMyfQ.9INlMZVOeRZ931ox0-8d237B3Tx51f6AY2mBjaw3lHQ','1709837632','ahyv6wlt7qkine','1'),
(287,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzY2MywiZXhwIjoxNzA5ODM4MDYzfQ.rTmiDhbl0ByDSThcPNNrp3ojqgrY6N4F5I-lTl8zXBA','1709838063','ahyv6wlt7qkine','1'),
(288,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzY3OSwiZXhwIjoxNzA5ODM4MDc5fQ.DBgN4iZu72J2FhsqRwwqdwWhoRRyxW519QyCW7PIzgM','1709838079','ahyv6wlt7qkine','1'),
(289,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzY4MCwiZXhwIjoxNzA5ODM4MDgwfQ.8hITOw4CPtpBFN6YAAQjY9VjFoVVfhtNeYQkHzozjB4','1709838080','ahyv6wlt7qkine','1'),
(290,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzY4MCwiZXhwIjoxNzA5ODM4MDgwfQ.8hITOw4CPtpBFN6YAAQjY9VjFoVVfhtNeYQkHzozjB4','1709838080','ahyv6wlt7qkine','1'),
(291,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzY4MCwiZXhwIjoxNzA5ODM4MDgwfQ.8hITOw4CPtpBFN6YAAQjY9VjFoVVfhtNeYQkHzozjB4','1709838080','ahyv6wlt7qkine','1'),
(292,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzY4MSwiZXhwIjoxNzA5ODM4MDgxfQ.7C_KGO7-5mU9vDR3ddFz4GBuG8wLLo99mPmCQtU2f9Q','1709838081','ahyv6wlt7qkine','1'),
(293,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzY4MSwiZXhwIjoxNzA5ODM4MDgxfQ.7C_KGO7-5mU9vDR3ddFz4GBuG8wLLo99mPmCQtU2f9Q','1709838081','ahyv6wlt7qkine','1'),
(294,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzY4MSwiZXhwIjoxNzA5ODM4MDgxfQ.7C_KGO7-5mU9vDR3ddFz4GBuG8wLLo99mPmCQtU2f9Q','1709838081','ahyv6wlt7qkine','1'),
(295,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzY4MiwiZXhwIjoxNzA5ODM4MDgyfQ.CXfZFX2T50AtoLDJ7YcaCi7B_3BIogNrOt6TSFRfmn8','1709838082','ahyv6wlt7qkine','1'),
(296,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzkxMywiZXhwIjoxNzA5ODM4MzEzfQ.y2M_Td7HOUkUhHk9xXp4GLh1vVH_-Mh-pQ8pGpyv-fE','1709838313','ahyv6wlt7qkine','1'),
(297,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzkxNywiZXhwIjoxNzA5ODM4MzE3fQ.jys7JZB5Nv11aKzZOHG89UES8zOw1Zni9lR41uJVHY8','1709838317','ahyv6wlt7qkine','1'),
(298,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzkxNywiZXhwIjoxNzA5ODM4MzE3fQ.jys7JZB5Nv11aKzZOHG89UES8zOw1Zni9lR41uJVHY8','1709838317','ahyv6wlt7qkine','1'),
(299,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyMzkxOCwiZXhwIjoxNzA5ODM4MzE4fQ.YK0iCtDbUENwvItI_pp1BcftQ1sWmgaV-V9rCbF5qXU','1709838318','ahyv6wlt7qkine','1'),
(300,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyNDI2MiwiZXhwIjoxNzA5ODM4NjYyfQ.SdmyVEU8X412AlfdAiUOi1JyxDPvolaNL-Hi8REzB-Q','1709838662','ahyv6wlt7qkine','1'),
(301,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyNDI5MCwiZXhwIjoxNzA5ODM4NjkwfQ.Pqk25R_5Vbkl4zhDghWFoy142r90EpbgnoQmbY6ucMQ','1709838690','ahyv6wlt7qkine','1'),
(302,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTgyNDI5NCwiZXhwIjoxNzA5ODM4Njk0fQ.Tr4njEJp3Af-Amq2dGjJ9vr4aSNCFnE7Yq7jyQTP-sw','1709838694','ahyv6wlt7qkine','1'),
(303,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTg1ODgwNSwiZXhwIjoxNzA5ODczMjA1fQ.EKHIduu8FNLP-wQlhs3LvoY0vqEvQoPIW0ar8rkbAIo','1709873205','ahyv6wlt7qkine','1'),
(304,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTg1ODgzNywiZXhwIjoxNzA5ODczMjM3fQ.GnHtpp5JSzZovgcPTgktLT7BFuBT82cOOSK5y0sPNcQ','1709873237','ahyv6wlt7qkine','1'),
(305,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTg1ODg1NCwiZXhwIjoxNzA5ODczMjU0fQ.4CI_mD4Hws_qOe4Ele2b141jKUbzP8Z0c_E9-bcuh2M','1709873254','ahyv6wlt7qkine','1'),
(306,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTg1ODg1NiwiZXhwIjoxNzA5ODczMjU2fQ.BZm-CyhWCUZRYfmotQdpIMUIeFGoPY_OWZhDTlooHso','1709873256','ahyv6wlt7qkine','1'),
(307,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTg1ODg1NywiZXhwIjoxNzA5ODczMjU3fQ.w-xo42TgH7qy8U7WU3LXoeP0Z3MWBmAe-mtt-YeAT14','1709873257','ahyv6wlt7qkine','1'),
(308,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTg1ODg1OSwiZXhwIjoxNzA5ODczMjU5fQ.oRGImWiCr_S0WW7Bx8r6FOwAM5iqawzN7T5HFk2nzBg','1709873259','ahyv6wlt7qkine','1'),
(309,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTg1ODg2MSwiZXhwIjoxNzA5ODczMjYxfQ.jaLjFWJpQ5tNuCH1jvVMMHwNfTGRbEpF_b_TnE7i7D8','1709873261','ahyv6wlt7qkine','1'),
(310,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTg1ODg2MiwiZXhwIjoxNzA5ODczMjYyfQ.mAJB3_LxcdoBRIB1d84TJvdXvPvZBPU_VPPDXm7tslA','1709873262','ahyv6wlt7qkine','1'),
(311,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTk0MTcyMCwiZXhwIjoxNzA5OTU2MTIwfQ.xGsmFKTTCPD_cvq0S3kuTy37emb9Jmf3TwIhwGKRDCE','1709956120','ahyv6wlt7qkine','1'),
(312,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTk4ODgzNCwiZXhwIjoxNzEwMDAzMjM0fQ.mM7cXIgj2dM9z0YWQOb1SZ8K3lSjGBobw3CjM95Fcf0','1710003234','ahyv6wlt7qkine','1'),
(313,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTk4ODg2MCwiZXhwIjoxNzEwMDAzMjYwfQ.YSOIAzSRR9BF_wZpBrJ4R9LkAswpzhrptZ53DTYdyXQ','1710003260','ahyv6wlt7qkine','1'),
(314,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTk5NDE5NCwiZXhwIjoxNzEwMDA4NTk0fQ.OtSnAKdH78NK8hnLj7uDquZ2JlRo5gIP_Bv_MDGfI6Q','1710008594','ahyv6wlt7qkine','1'),
(315,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOiJhaHl2NndsdDdxa2luZSIsIkVtYV9Vc2VyIjoieW9pbmVycGVydHV6QGdtYWlsLmNvbSIsIklkX1JvbF9GSyI6Mn0sImlhdCI6MTcwOTk5NDIyOCwiZXhwIjoxNzEwMDA4NjI4fQ.LxgH-xRn2qvXTeohwu0BLM8Hpwemq51PcilcrvbkTAc','1710008628','ahyv6wlt7qkine','1');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `Id_User` varchar(100) NOT NULL,
  `Nom_User` varchar(255) DEFAULT NULL,
  `Ape_User` varchar(255) DEFAULT NULL,
  `Tel_User` varchar(20) DEFAULT NULL,
  `Ema_User` varchar(255) DEFAULT NULL,
  `Pass_User` varchar(255) DEFAULT NULL,
  `Id_Rol_FK` int(11) DEFAULT NULL,
  `Fot_User` varchar(255) DEFAULT NULL,
  `Est_Email_User` int(1) DEFAULT 0 COMMENT '0: No verificado, 1: verificado',
  PRIMARY KEY (`Id_User`),
  KEY `Id_Rol_FK` (`Id_Rol_FK`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`Id_Rol_FK`) REFERENCES `roles` (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`Id_User`,`Nom_User`,`Ape_User`,`Tel_User`,`Ema_User`,`Pass_User`,`Id_Rol_FK`,`Fot_User`,`Est_Email_User`) values 
('ahyv6wlt7qkine','YOINER','PERTUZ',NULL,'yoinerpertuz@gmail.com','$2b$10$mHcGTUCOGvIge8euSLfGA.ydTVcxNO7neqEvtMCITOdMFWQeu4lGK',2,NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
