/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - cafeteriadb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cafeteriadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `cafeteriadb`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `Id_Cat` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Cat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categorias` */

/*Table structure for table `inventario` */

DROP TABLE IF EXISTS `inventario`;

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_idFK` int(11) DEFAULT NULL,
  `cantidad_disponible` int(11) DEFAULT NULL,
  `fecha_actualizacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_idFK` (`producto_idFK`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`producto_idFK`) REFERENCES `productos` (`id_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `inventario` */

/*Table structure for table `localizacion` */

DROP TABLE IF EXISTS `localizacion`;

CREATE TABLE `localizacion` (
  `Id_Loc` int(11) NOT NULL AUTO_INCREMENT,
  `Dir_Ip` varchar(255) DEFAULT NULL,
  `Id_User_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Loc`),
  KEY `Id_User_FK` (`Id_User_FK`),
  CONSTRAINT `localizacion_ibfk_1` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `localizacion` */

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id_Pro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_Pro` varchar(100) DEFAULT NULL,
  `descripcion_Pro` text DEFAULT NULL,
  `precio_Pro` decimal(10,2) DEFAULT NULL,
  `categoria_idFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Pro`),
  KEY `categoria_idFK` (`categoria_idFK`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_idFK`) REFERENCES `categorias` (`Id_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productos` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `Id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

/*Table structure for table `tokens` */

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `Id_Token` int(11) NOT NULL AUTO_INCREMENT,
  `Token` varchar(255) DEFAULT NULL,
  `Fec_Caducidad` varchar(100) DEFAULT NULL,
  `User_Id_FK` int(11) DEFAULT NULL,
  `Tipo_token` char(1) DEFAULT NULL COMMENT '1: inicio Sesion, 2: verificacion Email, 3: recuperacion de contraseña, 4: Verificar IP',
  PRIMARY KEY (`Id_Token`),
  KEY `Usuario_Id` (`User_Id_FK`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`User_Id_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tokens` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `Id_User` int(11) NOT NULL AUTO_INCREMENT,
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

/*Table structure for table `ventas` */

DROP TABLE IF EXISTS `ventas`;

CREATE TABLE `ventas` (
  `id_Ventas` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idFK` int(11) DEFAULT NULL,
  `producto_idFK` int(11) DEFAULT NULL,
  `cantidad_vendida` int(11) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  PRIMARY KEY (`id_Ventas`),
  KEY `usuario_idFK` (`usuario_idFK`),
  KEY `producto_idFK` (`producto_idFK`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`usuario_idFK`) REFERENCES `usuarios` (`Id_User`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`producto_idFK`) REFERENCES `productos` (`id_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ventas` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
