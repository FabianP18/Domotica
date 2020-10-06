-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para pos
CREATE DATABASE IF NOT EXISTS `pos` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `pos`;

# script de la tabla de temperatura
	-- Volcando estructura para tabla pos.temp_habitaciones
	CREATE TABLE IF NOT EXISTS `temp_habitaciones` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `nombre` varchar(50) DEFAULT NULL,
	  `temp` varchar(50) DEFAULT NULL,
	  `hum` varchar(50) DEFAULT NULL,
	  `tvo` varchar(50) DEFAULT NULL,
	  PRIMARY KEY (`id`)
	) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

	# se crean datos de ejemplo.

	-- Volcando datos para la tabla pos.temp_habitaciones: ~5 rows (aproximadamente)
	/*!40000 ALTER TABLE `temp_habitaciones` DISABLE KEYS */;
	INSERT INTO `temp_habitaciones` (`id`, `nombre`, `temp`, `hum`, `tvo`) VALUES
	  (1, 'Fabian', '20c°', '15', '12'),
	  (2, 'Chile', '25c°', '16', '8'),
	  (3, 'German', '55c°', '66', '10'),
	  (5, 'oscar', '25c°', '25%', '25%');
	/*!40000 ALTER TABLE `temp_habitaciones` ENABLE KEYS */;

# script de la tabla de ventanas

-- Volcando estructura para tabla pos.registro_ventana_abierta
CREATE TABLE IF NOT EXISTS `registro_ventana_abierta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ventana` bigint(20) DEFAULT NULL,
  `usuario` text DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `duracion` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ventana` (`id_ventana`),
  CONSTRAINT `FK_registro_ventana_abierta_ventana` FOREIGN KEY (`id_ventana`) REFERENCES `ventana` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pos.registro_ventana_abierta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `registro_ventana_abierta` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_ventana_abierta` ENABLE KEYS */;

-- Volcando estructura para tabla pos.registro_ventana_limpieza
CREATE TABLE IF NOT EXISTS `registro_ventana_limpieza` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ventana` bigint(20) DEFAULT NULL,
  `consumo_agua` float DEFAULT NULL,
  `tipo_limpieza` varchar(50) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `duracion` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_registro_ventana_limpieza_ventana` (`id_ventana`),
  CONSTRAINT `FK_registro_ventana_limpieza_ventana` FOREIGN KEY (`id_ventana`) REFERENCES `ventana` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pos.registro_ventana_limpieza: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `registro_ventana_limpieza` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_ventana_limpieza` ENABLE KEYS */;

-- Volcando estructura para tabla pos.registro_ventana_rotas
CREATE TABLE IF NOT EXISTS `registro_ventana_rotas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ventana` bigint(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_registro_ventana_rotas_ventana` (`id_ventana`),
  CONSTRAINT `FK_registro_ventana_rotas_ventana` FOREIGN KEY (`id_ventana`) REFERENCES `ventana` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pos.registro_ventana_rotas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `registro_ventana_rotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_ventana_rotas` ENABLE KEYS */;

-- Volcando estructura para tabla pos.ventana
CREATE TABLE IF NOT EXISTS `ventana` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `referencia` text DEFAULT NULL,
  `ubicacion` text DEFAULT NULL,
  `usuario_permitidos` text DEFAULT NULL,
  `dias_limpieza` varchar(100) DEFAULT NULL,
  `hora_limpieza` time DEFAULT NULL,
  `foto_ventana` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pos.ventana: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ventana` DISABLE KEYS */;
INSERT INTO `ventana` (`id`, `referencia`, `ubicacion`, `usuario_permitidos`, `dias_limpieza`, `hora_limpieza`, `foto_ventana`) VALUES
	(18, 'ventana A', 'Baño', 'juan,andres,monica', 'Miercoles,Jueves,Viernes', '11:45:00', 'images/ventanas/ventana A/381.jpg'),
	(19, 'ventana B', 'sala ', 'andres,german', 'Martes,Jueves', '11:45:00', 'images/ventanas/ventana B/214.jpg');
/*!40000 ALTER TABLE `ventana` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- Volcando estructura para tabla pos.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `perfil` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `foto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla pos.usuarios: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
	(29, 'administrador', 'admin', '$2y$10$2xdGX0v0nGMA9j/pgsZnsuC64lPAvt0D7DKiuSiuQBKZz/d4fxb3S', 'Administrador', 'images/usuarios/admin/746.png', '1', '2020-09-10 11:27:32', NULL),
	(61, 'juan valencia', 'juan', '$2y$10$jDbWrrPWtasESGaVDvs8X.Ct6XreSIR40JtelKSd4QmjMFoP0aaAS', 'Administrador', 'images/usuarios/juan/213.png', '1', '2020-05-14 16:45:02', NULL),
	(65, 'andres gonzales', 'andres', '$2y$10$yu4EH9H19oJvVusekRhmkO7o/YXClDimJdEFFa2SGrJMrW68OoNXa', 'Invitado', 'images/usuarios/andres/302.png', '0', '2020-05-13 22:48:35', NULL),
	(71, 'monica aristizabal', 'monica', '$2y$10$sm3lslO0b5gpYZgaJSfsGOofljBWkAzDZvSpePLXWEiF05yz3N2BC', 'Invitado', 'images/usuarios/monica/966.png', '0', '2020-05-11 13:50:07', NULL),
	(73, 'german ramirez', 'german', '$2y$10$QH8Uky5T8uVes6S1NJ292epvzug3E1rgQxQl5OXsHe1pBt7ox/vwq', 'Invitado', 'images/usuarios/german/888.png', '1', '2020-05-14 16:45:52', NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

