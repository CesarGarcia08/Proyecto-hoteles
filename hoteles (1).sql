-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 20-07-2025 a las 02:34:55
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hoteles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `telefono`, `contraseña`, `fecha_registro`) VALUES
(1, 'Andres Garcia', 'Andres09@gmail.com', '64155555', '$2y$10$GkwbtQED9ts.7mKC1i62zel16MohaPtx3r5bh16g.fe18SBKgiZ22', '2025-07-16 13:50:13'),
(2, 'Olga Pulgarin', 'mari01@gmail.com', '12345678', '$2y$10$B6QofDU1dljSnFWOqXtqsel2pRKcEzilIpFfrPeih6/TJFyE43mSa', '2025-07-17 16:46:47'),
(3, 'Sergio', 'tello@gmail.com', '654323456', '$2y$10$8mrksODkGl3tonCh8.612eBQmPEo7zLnm0zTqY3aXPzLZSmbarIdW', '2025-07-17 16:50:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoteles`
--

DROP TABLE IF EXISTS `hoteles`;
CREATE TABLE IF NOT EXISTS `hoteles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `ubicacion` varchar(300) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `publicar` tinyint(1) DEFAULT '0',
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `numero_habitaciones` int NOT NULL DEFAULT '1',
  `tipos_habitacion` varchar(255) NOT NULL DEFAULT '',
  `wifi` tinyint(1) DEFAULT '0',
  `piscina` tinyint(1) DEFAULT '0',
  `parking` tinyint(1) DEFAULT '0',
  `gimnasio` tinyint(1) DEFAULT '0',
  `restaurante` tinyint(1) DEFAULT '0',
  `servicio_habitaciones` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `hoteles`
--

INSERT INTO `hoteles` (`id`, `titulo`, `descripcion`, `ubicacion`, `provincia`, `costo`, `autor`, `publicar`, `activo`, `fecha_creacion`, `fecha_actualizacion`, `numero_habitaciones`, `tipos_habitacion`, `wifi`, `piscina`, `parking`, `gimnasio`, `restaurante`, `servicio_habitaciones`) VALUES
(9, 'Riu Plaza Panamá', 'El Riu Plaza Panama está ubicado en el distrito financiero y ofrece habitaciones elegantes con WiFi gratuita. Tiene piscina al aire libre con bañera de hidromasaje. Se halla a solo 300 metros del santuario nacional del Corazón de María.\r\n\r\nLas habitaciones son amplias, presentan una decoración floral colorida y disponen de zona de estar y TV de pantalla plana con canales por cable. Se ofrece café gratuito a la llegada. Algunas habitaciones tienen vistas a la ciudad.\r\n\r\nEl hotel alberga el Sushi Lounge, el restaurante Arts, el Capital Take Away, el Studio 50 y el Ibiza Lounge, donde se puede tomar una copa junto a la piscina.\r\n\r\nEl Riu Plaza tiene gimnasio y sala de conferencias.\r\n\r\nEl parque nacional Metropolitano queda a 3 km.', 'Calle 50 con 53 Este, Marbella, Bellavista.', 'Panamá', 50.00, 'Local', 1, 1, '2025-07-18 15:46:05', '2025-07-18 15:46:05', 1, 'sencilla, doble, suite', 1, 0, 1, 0, 1, 1),
(8, 'Ramada Plaza by Wyndham Panama Punta Pacifica', 'El Ramada Plaza Panamá - Punta Pacífica cuenta con piscina exterior, spa y centro de bienestar, y está situado en la Ciudad de Panamá. El establecimiento ofrece vistas panorámicas a la ciudad y WiFi gratuita.\r\n\r\nLas habitaciones incluyen aire acondicionado, TV de pantalla plana, minibar, soporte para iPod, zona de estar y cafetera.\r\n\r\nEl Ramada Plaza Panamá - Punta Pacífica alberga un restaurante, centro de fitness, instalaciones para reuniones, salón compartido y mostrador de información turística. También facilita aparcamiento gratuito.\r\n\r\nEl establecimiento está a 15 minutos en coche del canal de Panamá, a 10 minutos a pie del centro comercial MultiPlaza Pacific y a 8 km del aeropuerto internacional de Tocumen.', 'Vía Israel y Calle 71 San Francisco, Panamá, Panamá.', 'Panamá', 50.00, 'Cesar', 1, 1, '2025-07-18 15:27:25', '2025-07-18 15:41:30', 1, 'sencilla, doble, suite', 1, 1, 1, 1, 1, 1),
(10, 'Sheraton Grand Panama', 'El Sheraton Grand Panama se encuentra en Panamá, frente al centro de convenciones de Atlapa y a 10 minutos en coche del aeropuerto internacional de Tocumen. El establecimiento cuenta con piscina al aire libre y spa.\r\n\r\nLas habitaciones del Sheraton Grand Panama presentan una decoración agradable y disponen de aire acondicionado, TV de pantalla plana y set de té/café. El baño cuenta con secador de pelo y artículos de aseo.\r\n\r\nEl restaurante Cafe Bahia prepara comidas buffet para desayunar, almorzar y cenar. El bar asador Crostini tiene una cocina abierta y sirve varios tipos de bebidas y platos, como carne de vacuno importada y marisco fresco. La panadería Las Hadas está abierta las 24 horas y el hotel alberga un bar en el vestíbulo principal.\r\n\r\nEl spa del Sheraton cuenta con bañera de hidromasaje, baño de vapor y sauna. Los tratamientos incluyen masajes y tratamientos faciales. El gimnasio abre las 24 horas y ofrece clases de aeróbic, pilates y baile de forma gratuita.\r\n\r\nEl Sheraton Grand Panama cuenta con varias tiendas, un salón de belleza y un mostrador de alquiler de coches. A unos 5 minutos a pie del hotel se pueden encontrar varios bares y restaurantes. El establecimiento también alberga un centro de negocios con ordenadores, conexión a internet e impresora. El centro comercial Multiplaza está a poca distancia a pie o a 5 minutos en coche', 'Vía Israel y Calle 77 San Francisco.', 'Panamá', 45.00, 'Admin', 1, 1, '2025-07-18 15:49:59', '2025-07-18 15:49:59', 1, 'sencilla, doble, suite', 1, 1, 1, 1, 1, 1),
(11, 'JW Marriott Panama', 'Este hotel de 5 estrellas está ubicado en la bahía de Panamá y alberga varios restaurantes. Las habitaciones son amplias, presentan una decoración moderna y disponen de balcón privado con vistas al mar.\r\n\r\nEl JW Marriott Panama se encuentra en el centro de la zona de negocios de Panamá y cuenta con piscinas de borde infinito con vistas espectaculares a la bahía de Panamá y balcones amplios. Cada habitación del JW Marriott Panama dispone de reproductor de CD/DVD y TV HD con pantalla plana de 42 pulgadas. Disponen de suelo de mármol, encimeras de granito y bañera profunda.\r\n\r\nEste hotel de lujo también es perfecto para familias. Los 3 restaurantes y bares del establecimiento brindan una experiencia gastronómica y coctelera diversa con platos exquisitos elaborados por el jefe de cocina.\r\n\r\nEl JW Marriott Panama tiene una gran zona de terraza y piscina con un restaurante frente al agua. Ofrece una planta completa con tiendas de diseño.', 'Calle Punta Colon, Punta Pacífica, 0833-00321 Panamá, Panamá.', 'Panamá', 45.00, 'Maria Rodriguez', 1, 1, '2025-07-18 15:53:37', '2025-07-18 15:53:37', 1, 'doble, suite', 1, 1, 1, 1, 1, 1),
(14, 'Megapolis Hotel Panama', 'Descubre cómo se sienten las estrellas con el mejor servicio en el Megapolis Hotel Panama\r\nEl Hotel Panama Megapolis ocupa una impresionante torre de 66 plantas con vistas al mar de Panamá y cuenta con spa, piscina al aire libre, 2 restaurantes, 3 bares y conexión wifi gratuita.\r\n\r\nLas habitaciones del Hotel Panama Megapolis son amplias y elegantes. Presentan una decoración moderna. Hay TV, aire acondicionado y baño con artículos de aseo de spa. La tarifa incluye conexión gratuita a internet.\r\n\r\nEl hotel alberga un spa con sauna y baños de vapor. La piscina infinita ofrece terraza con tumbonas, bar y vistas panorámicas a la ciudad. Este hotel también alberga un centro de fitness.\r\n\r\nEl centro comercial Megapolis Outlets y el casino Majestic se encuentran junto al hotel. El parque Cinta Costera está situado frente al mar, a 100 metros.\r\n\r\nEste hotel se halla a 10 minutos en coche del canal de Panamá y a 3 km del parque natural Metropolitano. El aeropuerto internacional Marcos A. Gelabert queda a 15 minutos en coche.', 'Avenida Balboa Boulevard Elhayek , 0000 Panamá.', 'Panamá', 60.00, 'Maria Olga', 1, 1, '2025-07-18 16:07:42', '2025-07-18 16:07:42', 1, 'doble, suite, sencilla', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_hoteles`
--

DROP TABLE IF EXISTS `imagenes_hoteles`;
CREATE TABLE IF NOT EXISTS `imagenes_hoteles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `ruta` varchar(500) NOT NULL,
  `nombre_original` varchar(255) DEFAULT NULL,
  `fecha_subida` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `imagenes_hoteles`
--

INSERT INTO `imagenes_hoteles` (`id`, `hotel_id`, `ruta`, `nombre_original`, `fecha_subida`) VALUES
(1, 1, '../uploads/hoteles/1/6873d4b66f86f_1752421558.png', 'Yoo.png', '2025-07-13 09:45:58'),
(2, 2, '../uploads/hoteles/2/6873e1065acb8_1752424710.jpeg', 'WhatsApp Image 2025-04-09 at 3.25.04 PM (2).jpeg', '2025-07-13 10:38:30'),
(3, 3, '../uploads/hoteles/3/6873e8045112f_1752426500.png', 'Yoo.png', '2025-07-13 11:08:20'),
(4, 4, '../uploads/hoteles/4/6873eb7928629_1752427385.webp', 'manzana.webp', '2025-07-13 11:23:05'),
(5, 5, '../uploads/hoteles/5/68797014e3132_1752789012.jpg', 'Лазурь.jpg', '2025-07-17 15:50:12'),
(6, 6, '../uploads/hoteles/6/68797a20ccb5d_1752791584.jpg', 'Wallpaper neon city dark street art - Wallpapers HD.jpg', '2025-07-17 16:33:04'),
(7, 7, '../uploads/hoteles/7/68797ab19cf1f_1752791729.jpg', 'Wallpaper neon city dark street art - Wallpapers HD.jpg', '2025-07-17 16:35:29'),
(8, 8, '../uploads/hoteles/8/687abc3d4bd28_1752874045.jpg', 'hotel1.jpg', '2025-07-18 15:27:25'),
(9, 8, '../uploads/hoteles/8/687abc3d4ee94_1752874045.jpg', 'hotel1.1.jpg', '2025-07-18 15:27:25'),
(10, 8, '../uploads/hoteles/8/687abc3d502cc_1752874045.jpg', 'hotel1.2.jpg', '2025-07-18 15:27:25'),
(11, 9, '../uploads/hoteles/9/687ac09d5f28c_1752875165.jpg', 'hotel2.jpg', '2025-07-18 15:46:05'),
(12, 9, '../uploads/hoteles/9/687ac09d60fc1_1752875165.jpg', 'hotel2.1.jpg', '2025-07-18 15:46:05'),
(13, 9, '../uploads/hoteles/9/687ac09d62a79_1752875165.jpg', 'hotel2.2.jpg', '2025-07-18 15:46:05'),
(14, 9, '../uploads/hoteles/9/687ac09d63df3_1752875165.jpg', 'hotel2.3.jpg', '2025-07-18 15:46:05'),
(15, 10, '../uploads/hoteles/10/687ac18751be7_1752875399.jpg', 'hotel3.jpg', '2025-07-18 15:49:59'),
(16, 10, '../uploads/hoteles/10/687ac18752064_1752875399.jpg', 'hotel3.1.jpg', '2025-07-18 15:49:59'),
(17, 10, '../uploads/hoteles/10/687ac18753492_1752875399.jpg', 'hotel3.2.jpg', '2025-07-18 15:49:59'),
(18, 10, '../uploads/hoteles/10/687ac187540c8_1752875399.jpg', 'hotel3.3.jpg', '2025-07-18 15:49:59'),
(19, 11, '../uploads/hoteles/11/687ac26141ac9_1752875617.jpg', 'hotel4.jpg', '2025-07-18 15:53:37'),
(20, 11, '../uploads/hoteles/11/687ac26142bba_1752875617.jpg', 'hotel4.1.jpg', '2025-07-18 15:53:37'),
(21, 11, '../uploads/hoteles/11/687ac26143bd7_1752875617.jpg', 'hotel4.2.jpg', '2025-07-18 15:53:37'),
(22, 11, '../uploads/hoteles/11/687ac26144fb8_1752875617.jpg', 'hotel4.3.jpg', '2025-07-18 15:53:37'),
(23, 12, '../uploads/hoteles/12/687ac48232b0c_1752876162.jpg', 'hotel4.jpg', '2025-07-18 16:02:42'),
(24, 12, '../uploads/hoteles/12/687ac482331a0_1752876162.jpg', 'hotel4.1.jpg', '2025-07-18 16:02:42'),
(25, 12, '../uploads/hoteles/12/687ac4823378e_1752876162.jpg', 'hotel4.2.jpg', '2025-07-18 16:02:42'),
(26, 12, '../uploads/hoteles/12/687ac48233fdb_1752876162.jpg', 'hotel4.3.jpg', '2025-07-18 16:02:42'),
(27, 13, '../uploads/hoteles/13/687ac49ebd601_1752876190.jpg', 'hotel4.jpg', '2025-07-18 16:03:10'),
(28, 13, '../uploads/hoteles/13/687ac49ebe929_1752876190.jpg', 'hotel4.1.jpg', '2025-07-18 16:03:10'),
(29, 13, '../uploads/hoteles/13/687ac49ebeffe_1752876190.jpg', 'hotel4.2.jpg', '2025-07-18 16:03:10'),
(30, 13, '../uploads/hoteles/13/687ac49ebf75c_1752876190.jpg', 'hotel4.3.jpg', '2025-07-18 16:03:10'),
(31, 14, '../uploads/hoteles/14/687ac5ae54c4a_1752876462.jpg', 'hotel5.jpg', '2025-07-18 16:07:42'),
(32, 14, '../uploads/hoteles/14/687ac5ae57470_1752876462.jpg', 'hotel5.1.jpg', '2025-07-18 16:07:42'),
(33, 14, '../uploads/hoteles/14/687ac5ae57d6e_1752876462.jpg', 'hptel5.1.jpg', '2025-07-18 16:07:42'),
(34, 14, '../uploads/hoteles/14/687ac5ae58598_1752876462.jpg', 'hotel5.2.jpg', '2025-07-18 16:07:42'),
(35, 14, '../uploads/hoteles/14/687ac5ae58a19_1752876462.jpg', 'hotel5.4.jpg', '2025-07-18 16:07:42'),
(36, 15, '../uploads/hoteles/15/687ac6e821f7a_1752876776.jpg', 'hotel5.jpg', '2025-07-18 16:12:56'),
(37, 15, '../uploads/hoteles/15/687ac6e8225c1_1752876776.jpg', 'hotel5.1.jpg', '2025-07-18 16:12:56'),
(38, 15, '../uploads/hoteles/15/687ac6e8227d6_1752876776.jpg', 'hptel5.1.jpg', '2025-07-18 16:12:56'),
(39, 15, '../uploads/hoteles/15/687ac6e822b70_1752876776.jpg', 'hotel5.2.jpg', '2025-07-18 16:12:56'),
(40, 15, '../uploads/hoteles/15/687ac6e822f2a_1752876776.jpg', 'hotel5.4.jpg', '2025-07-18 16:12:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

DROP TABLE IF EXISTS `reservas`;
CREATE TABLE IF NOT EXISTS `reservas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `fecha_entrada` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `personas` int NOT NULL,
  `fecha_reserva` datetime NOT NULL,
  `numero_habitaciones` int DEFAULT NULL,
  `tipo_habitacion` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `cliente_id`, `hotel_id`, `fecha_entrada`, `fecha_salida`, `personas`, `fecha_reserva`, `numero_habitaciones`, `tipo_habitacion`) VALUES
(1, 1, 4, '2025-07-16', '2025-07-19', 2, '2025-07-16 14:41:05', NULL, ''),
(2, 1, 4, '2025-07-17', '2025-07-19', 2, '2025-07-17 15:24:03', NULL, ''),
(3, 1, 5, '2025-07-17', '2025-07-19', 2, '2025-07-17 16:05:22', NULL, '1'),
(4, 1, 11, '2025-07-18', '2025-07-21', 2, '2025-07-18 15:54:28', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rol` enum('admin','usuario') NOT NULL DEFAULT 'usuario',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `cedula`, `email`, `password`, `activo`, `creado_en`, `rol`) VALUES
(1, 'Cesar', '8-087-345', 'crandres08@gmail.com', '$2y$10$nahasd6JH7Dx98bFnCOIUO6ar36dnv8sbeOhOnM1JRyUpA0uFdxWq', 1, '2025-07-12 17:08:54', 'admin'),
(9, 'Olga', '9-56543-3456', 'maria@gmail.com', '$2y$10$ts/wg/2CPNzruIbJa/6m.e331pDH7lGA71M9YP2Q/Olq5IM4IUq4y', 1, '2025-07-12 22:25:52', 'usuario'),
(10, 'Carlos', '5-45654-345', 'admin@correo.com', '$2y$10$LCSSGGi/nfMVpmXY1w4/LuuFMt5hXri5HxVhXBRsEI7GmgdQLg41.', 1, '2025-07-12 22:27:05', 'usuario'),
(11, 'Andres', '7-456-7654', 'Andres09@gmail.com', '$2y$10$9pRSwZpp3yuyRAQyfYhg8.QWmceY01pmU.2/yE3Mt8KoCghhdTv2W', 1, '2025-07-15 14:23:17', 'admin'),
(12, 'Angela', '8-321-1234', 'angela@gmail.com', '$2y$10$Vce8ljRFHMWGNYRdSKi55uU1ik/XGmmgEr4LPRJUNInfbIGgCzChi', 1, '2025-07-18 13:49:24', 'usuario'),
(13, 'Angel', '8-23-1234', 'angel21@gmail.com', '$2y$10$anDcOKmuzcQr1maTQC88suQuoRQ1kwK2JOqc.2rrA8e3zAkDO3n6G', 1, '2025-07-18 13:52:58', 'usuario'),
(14, 'Sergio', '1-234-345', 'sergio@gmail.com', '$2y$10$gTF/enIS4gUF337OglxKk.TQ3Q5LkfcAxOatuC74hRO6IV2sl2rOC', 1, '2025-07-18 14:28:11', 'admin'),
(15, 'Valentin', '3-35-65432', 'valen@gmail.com', '$2y$10$vaRrQvkRG2S05Emzi9vDr.Ho9jTmAEgs1i0wDgSYwoDYtZ0mv5Fea', 1, '2025-07-18 15:05:24', 'usuario');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
