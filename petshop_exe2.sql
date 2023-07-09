-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2023 a las 03:03:51
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `petshop_exe2`
--
CREATE DATABASE IF NOT EXISTS `petshop_exe2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `petshop_exe2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'administradores'),
(2, 'cliente'),
(1, 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 17),
(2, 1, 18),
(3, 1, 19),
(4, 1, 20),
(5, 1, 25),
(6, 1, 26),
(7, 1, 27),
(8, 1, 28),
(9, 1, 30),
(10, 1, 31),
(11, 1, 32),
(12, 1, 33),
(13, 1, 34),
(14, 1, 35),
(15, 1, 36),
(16, 1, 37),
(17, 1, 38),
(18, 1, 39),
(19, 1, 40),
(20, 1, 44),
(21, 1, 49),
(22, 1, 50),
(23, 1, 51),
(24, 1, 52),
(30, 2, 20),
(32, 2, 24),
(34, 2, 28),
(25, 2, 32),
(26, 2, 36),
(27, 2, 40),
(28, 2, 44),
(29, 2, 48),
(31, 2, 52),
(33, 2, 56),
(35, 3, 1),
(36, 3, 2),
(37, 3, 3),
(38, 3, 4),
(39, 3, 5),
(40, 3, 6),
(41, 3, 7),
(42, 3, 8),
(43, 3, 9),
(44, 3, 10),
(45, 3, 11),
(46, 3, 12),
(47, 3, 13),
(48, 3, 14),
(49, 3, 15),
(50, 3, 16),
(51, 3, 17),
(52, 3, 18),
(53, 3, 19),
(54, 3, 20),
(55, 3, 21),
(56, 3, 22),
(57, 3, 23),
(58, 3, 24),
(59, 3, 25),
(60, 3, 26),
(61, 3, 27),
(62, 3, 28),
(63, 3, 29),
(64, 3, 30),
(65, 3, 31),
(66, 3, 32),
(67, 3, 33),
(68, 3, 34),
(69, 3, 35),
(70, 3, 36),
(71, 3, 37),
(72, 3, 38),
(73, 3, 39),
(74, 3, 40),
(75, 3, 41),
(76, 3, 42),
(77, 3, 43),
(78, 3, 44),
(79, 3, 45),
(80, 3, 46),
(81, 3, 47),
(82, 3, 48),
(83, 3, 49),
(84, 3, 50),
(85, 3, 51),
(86, 3, 52),
(87, 3, 53),
(88, 3, 54),
(89, 3, 55),
(90, 3, 56);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add carrito', 6, 'add_carrito'),
(22, 'Can change carrito', 6, 'change_carrito'),
(23, 'Can delete carrito', 6, 'delete_carrito'),
(24, 'Can view carrito', 6, 'view_carrito'),
(25, 'Can add empleado', 7, 'add_empleado'),
(26, 'Can change empleado', 7, 'change_empleado'),
(27, 'Can delete empleado', 7, 'delete_empleado'),
(28, 'Can view empleado', 7, 'view_empleado'),
(29, 'Can add seguimiento', 8, 'add_seguimiento'),
(30, 'Can change seguimiento', 8, 'change_seguimiento'),
(31, 'Can delete seguimiento', 8, 'delete_seguimiento'),
(32, 'Can view seguimiento', 8, 'view_seguimiento'),
(33, 'Can add tipo producto', 9, 'add_tipoproducto'),
(34, 'Can change tipo producto', 9, 'change_tipoproducto'),
(35, 'Can delete tipo producto', 9, 'delete_tipoproducto'),
(36, 'Can view tipo producto', 9, 'view_tipoproducto'),
(37, 'Can add producto', 10, 'add_producto'),
(38, 'Can change producto', 10, 'change_producto'),
(39, 'Can delete producto', 10, 'delete_producto'),
(40, 'Can view producto', 10, 'view_producto'),
(41, 'Can add orden', 11, 'add_orden'),
(42, 'Can change orden', 11, 'change_orden'),
(43, 'Can delete orden', 11, 'delete_orden'),
(44, 'Can view orden', 11, 'view_orden'),
(45, 'Can add item carrito', 12, 'add_itemcarrito'),
(46, 'Can change item carrito', 12, 'change_itemcarrito'),
(47, 'Can delete item carrito', 12, 'delete_itemcarrito'),
(48, 'Can view item carrito', 12, 'view_itemcarrito'),
(49, 'Can add user', 13, 'add_usuariocustom'),
(50, 'Can change user', 13, 'change_usuariocustom'),
(51, 'Can delete user', 13, 'delete_usuariocustom'),
(52, 'Can view user', 13, 'view_usuariocustom'),
(53, 'Can add item orden', 14, 'add_itemorden'),
(54, 'Can change item orden', 14, 'change_itemorden'),
(55, 'Can delete item orden', 14, 'delete_itemorden'),
(56, 'Can view item orden', 14, 'view_itemorden');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carrito`
--

DROP TABLE IF EXISTS `core_carrito`;
CREATE TABLE `core_carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_carrito`
--

INSERT INTO `core_carrito` (`id`, `usuario_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_empleado`
--

DROP TABLE IF EXISTS `core_empleado`;
CREATE TABLE `core_empleado` (
  `id` int(11) NOT NULL,
  `nombre_empleado` varchar(80) NOT NULL,
  `cargo` varchar(250) NOT NULL,
  `descripcion_empleado` varchar(250) NOT NULL,
  `imagen_empleado` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_itemcarrito`
--

DROP TABLE IF EXISTS `core_itemcarrito`;
CREATE TABLE `core_itemcarrito` (
  `id` int(11) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL CHECK (`cantidad` >= 0),
  `carrito_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_itemorden`
--

DROP TABLE IF EXISTS `core_itemorden`;
CREATE TABLE `core_itemorden` (
  `id` int(11) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL CHECK (`cantidad` >= 0),
  `orden_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_itemorden`
--

INSERT INTO `core_itemorden` (`id`, `cantidad`, `orden_id`, `producto_id`) VALUES
(1, 1, 8, 1),
(2, 3, 9, 1),
(3, 2, 10, 1),
(4, 2, 11, 1),
(5, 1, 12, 4),
(6, 1, 12, 2),
(7, 1, 12, 3),
(8, 1, 8, 3),
(9, 1, 9, 3),
(10, 1, 13, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_orden`
--

DROP TABLE IF EXISTS `core_orden`;
CREATE TABLE `core_orden` (
  `id` int(11) NOT NULL,
  `numero` varchar(36) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `carrito_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_orden`
--

INSERT INTO `core_orden` (`id`, `numero`, `fecha`, `carrito_id`, `estado_id`) VALUES
(8, 'ce4f4e3c-8ac4-4cc2-8cb5-b50ff8b9eb45', '2023-06-26 00:07:02.020766', 1, 1),
(9, '9df582e2-2c87-497b-8215-69a7e87f6ef8', '2023-06-26 00:21:35.244596', 1, 1),
(10, 'f2a81016-2b73-4674-9c1b-6c65a6211636', '2023-06-26 00:22:46.355465', 2, 1),
(11, '16290f1b-4959-4380-ada1-01656e41dada', '2023-06-26 00:28:01.641931', 2, 1),
(12, '8e999f1e-9bc1-4a36-997e-0438ce8105ab', '2023-06-26 01:04:16.977142', 3, 1),
(13, '1696d968-e28c-41cb-8771-67f328ddeac9', '2023-06-26 02:10:00.194918', 1, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_producto`
--

DROP TABLE IF EXISTS `core_producto`;
CREATE TABLE `core_producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `vencimiento` date NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_producto`
--

INSERT INTO `core_producto` (`id`, `nombre`, `precio`, `stock`, `descripcion`, `vencimiento`, `imagen`, `tipo_id`) VALUES
(1, 'BANDANA PARA PERRO COLOR ROSA', 2990, 44, 'BANDANA PARA PERRO COLOR ROSA, AMIGABLE Y BONITA PARA SU PERRO.', '2048-01-01', 'bandana_perro_rosada_xUt6nKY.jpg', 1),
(2, 'CORREA PARA GATO', 1990, 21, 'CORREO PARA GATO, RESISTENTE Y SUAVE PARA EL ANIMAL.', '2053-06-06', 'IMG_1274_720x.webp', 3),
(3, 'IDENTIFICADOR PARA MASCOTAS DE PLATINO', 1200, 6, 'IDENTIFICADOR QUE LE DA EL FLOW A TU MASCOTA (MEO CORTE)', '2060-06-15', 'identificador-para-mascotas.jpg', 2),
(4, 'CORREA PARA PERRO EXTENSIBLE', 3400, 16, 'CORREA EXTENSIBLE DE TELA PARA PERROS DE TAMAÑO GRANDE', '2048-03-19', 'correa_4xWA5f4.jpg', 3),
(5, 'CORREA DE PERRO AZUL', 1700, 41, 'CORREO DE PERRO DE COLOR AZUL CON COBERTO PARA MAYOR COMODIDAD.', '2033-06-01', 'Arnes-perro.jpg', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_seguimiento`
--

DROP TABLE IF EXISTS `core_seguimiento`;
CREATE TABLE `core_seguimiento` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_seguimiento`
--

INSERT INTO `core_seguimiento` (`id`, `descripcion`) VALUES
(1, 'SOLICITUD INGRESADA'),
(2, 'EN PREPARACIÓN'),
(3, 'EN RUTA'),
(4, 'ENTREGADO'),
(5, 'EN PREPARACIÓN'),
(6, 'EN PREPARACIÓN'),
(7, 'ENTREGADO'),
(8, 'SOLICITUD INGRESADA'),
(9, 'SOLICITUD INGRESADA'),
(10, 'EN RUTA'),
(11, 'ENTREGADO'),
(12, 'ENTREGADO'),
(13, 'ENTREGADO'),
(14, 'ENTREGADO'),
(15, 'EN RUTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipoproducto`
--

DROP TABLE IF EXISTS `core_tipoproducto`;
CREATE TABLE `core_tipoproducto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_tipoproducto`
--

INSERT INTO `core_tipoproducto` (`id`, `descripcion`) VALUES
(1, 'BANDANA'),
(2, 'IDENTIFICADOR'),
(3, 'CORREA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-06-25 19:05:00.930043', '1', 'SOLICITUD INGRESADA', 1, '[{\"added\": {}}]', 8, 1),
(2, '2023-06-25 19:05:05.882139', '2', 'EN PREPARACIÓN', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-06-25 19:05:08.824364', '3', 'ENVIADO', 1, '[{\"added\": {}}]', 8, 1),
(4, '2023-06-25 19:05:12.487033', '4', 'ENTREGADO', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-06-25 19:05:34.939453', '3', 'EN RUTA', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 8, 1),
(6, '2023-06-25 19:08:23.788983', '1', 'BANDANA', 1, '[{\"added\": {}}]', 9, 1),
(7, '2023-06-25 19:08:26.972421', '2', 'IDENTIFICADOR', 1, '[{\"added\": {}}]', 9, 1),
(8, '2023-06-25 19:08:30.814653', '3', 'CORREA', 1, '[{\"added\": {}}]', 9, 1),
(9, '2023-06-25 19:24:02.853815', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 13, 1),
(10, '2023-06-25 23:01:50.799777', '4', 'Orden #e3e7eb42-3f3e-43bb-88b0-8a5ed30c12e7', 3, '', 11, 1),
(11, '2023-06-25 23:01:50.800799', '3', 'Orden #ace82ae2-c165-4ca8-97b6-d531f8ef51cc', 3, '', 11, 1),
(12, '2023-06-25 23:01:50.801835', '2', 'Orden #81a61eb9-7b6a-4f10-8c13-c27065e4277b', 3, '', 11, 1),
(13, '2023-06-25 23:01:50.802888', '1', 'Orden #15836369-f5bf-4dd1-8945-ca234bc1a7b5', 3, '', 11, 1),
(14, '2023-06-26 00:00:40.449941', '6', 'Orden #d43ea756-391e-46bf-97ec-b255188dc093', 3, '', 11, 1),
(15, '2023-06-26 00:00:40.450942', '5', 'Orden #32548a01-da14-446d-83e4-27a26f7c0dce', 3, '', 11, 1),
(16, '2023-06-26 00:10:04.692111', '7', 'Orden #3b45120b-5d6f-420e-99c0-dfaf2d3a327d', 3, '', 11, 1),
(17, '2023-06-26 02:05:38.375418', '16', 'IDENTIFICADOR PARA MASCOTAS DE PLATINO - admin', 3, '', 12, 1),
(18, '2023-07-09 00:38:34.054931', '1', 'Vendedor', 1, '[{\"added\": {}}]', 3, 1),
(19, '2023-07-09 00:39:53.453904', '2', 'Cliente', 1, '[{\"added\": {}}]', 3, 1),
(20, '2023-07-09 00:40:40.898931', '3', 'Administradores', 1, '[{\"added\": {}}]', 3, 1),
(21, '2023-07-09 00:40:48.464709', '3', 'administradores', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(22, '2023-07-09 00:40:53.067179', '2', 'cliente', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(23, '2023-07-09 00:40:57.493736', '1', 'vendedor', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(24, '2023-07-09 00:41:52.574859', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 13, 1),
(25, '2023-07-09 00:41:57.121770', '2', 'juan', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 13, 1),
(26, '2023-07-09 00:42:05.928675', '3', 'Exequiel', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(6, 'core', 'carrito'),
(7, 'core', 'empleado'),
(12, 'core', 'itemcarrito'),
(14, 'core', 'itemorden'),
(11, 'core', 'orden'),
(10, 'core', 'producto'),
(8, 'core', 'seguimiento'),
(9, 'core', 'tipoproducto'),
(5, 'sessions', 'session'),
(13, 'usuario', 'usuariocustom');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-25 19:03:41.787538'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-06-25 19:03:41.820768'),
(3, 'auth', '0001_initial', '2023-06-25 19:03:41.858380'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-06-25 19:03:41.967294'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-06-25 19:03:41.972056'),
(6, 'auth', '0004_alter_user_username_opts', '2023-06-25 19:03:41.977202'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-06-25 19:03:41.982189'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-06-25 19:03:41.984435'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-06-25 19:03:41.989532'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-06-25 19:03:41.995182'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-06-25 19:03:41.998406'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-06-25 19:03:42.010598'),
(13, 'auth', '0011_update_proxy_permissions', '2023-06-25 19:03:42.016094'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-06-25 19:03:42.020700'),
(15, 'usuario', '0001_initial', '2023-06-25 19:03:42.059849'),
(16, 'admin', '0001_initial', '2023-06-25 19:03:42.175807'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-06-25 19:03:42.224005'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-25 19:03:42.230705'),
(19, 'core', '0001_initial', '2023-06-25 19:03:42.321876'),
(20, 'core', '0002_carrito_usuario', '2023-06-25 19:03:42.475836'),
(21, 'sessions', '0001_initial', '2023-06-25 19:03:42.488843'),
(22, 'core', '0003_auto_20230625_1506', '2023-06-25 19:06:26.897337'),
(23, 'core', '0004_auto_20230625_1512', '2023-06-25 19:12:15.549993'),
(24, 'core', '0005_itemorden', '2023-06-25 23:01:06.784291'),
(25, 'core', '0006_itemorden_cantidad', '2023-06-25 23:09:54.401464'),
(26, 'core', '0007_delete_itemorden', '2023-06-25 23:18:01.899626'),
(27, 'core', '0008_auto_20230625_1931', '2023-06-25 23:31:05.057070');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('d2jlibdbi6gdzty35s5t96xhcqpba4a3', '.eJxVjMsOwiAQRf-FtSHlMYAu3fcbyDCMUjWQlHZl_HfbpAvd3nPOfYuI61Li2nmOUxYXocTpd0tIT647yA-s9yap1WWektwVedAux5b5dT3cv4OCvWy1JasYiRhsPgNbh2HQROgBCIwjtl5pCsTeocpBGcO0KcPNoFYQkvh8AfdDOCA:1qIIlv:LSbvIimSEnbmspJHMz7SUbe6nU6whyhJvRBEGN0_IFA', '2023-07-23 00:59:31.283052'),
('l4sy2rdsun9d1g3o6lt6czxdlhqbt3wj', '.eJxVjMsOwiAQRf-FtSHlMYAu3fcbyDCMUjWQlHZl_HfbpAvd3nPOfYuI61Li2nmOUxYXocTpd0tIT647yA-s9yap1WWektwVedAux5b5dT3cv4OCvWy1JasYiRhsPgNbh2HQROgBCIwjtl5pCsTeocpBGcO0KcPNoFYQkvh8AfdDOCA:1qDbUx:MJeeBjSsyxJbFNAEA4Et95hOUtP7R_BQ423Nl_1Xr8k', '2023-07-10 01:58:35.391283');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuariocustom`
--

DROP TABLE IF EXISTS `usuario_usuariocustom`;
CREATE TABLE `usuario_usuariocustom` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `suscriptor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_usuariocustom`
--

INSERT INTO `usuario_usuariocustom` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `suscriptor`) VALUES
(1, 'pbkdf2_sha256$216000$OusIqdo2MjB7$OjTHQNVe7MlvclrBh8f1FaisiR/lKHEpohkZXkPWEVU=', '2023-07-09 00:59:31.277068', 1, 'admin', '', '', 'admin@admin.cl', 1, 1, '2023-06-25 19:03:54.000000', 0),
(2, 'pbkdf2_sha256$216000$Po6FAc7aY371$neI+eQam2MsE4+KbF0RoSZWqcvcgjDuMf75JtEy2fDE=', '2023-07-09 00:58:12.581207', 0, 'juan', '', '', 'juan@trigo.com', 0, 1, '2023-06-26 00:22:19.000000', 1),
(3, 'pbkdf2_sha256$216000$gNZNe3Zb44hP$N45f/5cWPlW+NS+4gY2TovDrWIQczQaVtXBlXbCtFAY=', '2023-07-09 00:58:32.532140', 0, 'Exequiel', '', '', 'exe1@gmail.com', 0, 1, '2023-06-26 01:03:29.000000', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuariocustom_groups`
--

DROP TABLE IF EXISTS `usuario_usuariocustom_groups`;
CREATE TABLE `usuario_usuariocustom_groups` (
  `id` int(11) NOT NULL,
  `usuariocustom_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_usuariocustom_groups`
--

INSERT INTO `usuario_usuariocustom_groups` (`id`, `usuariocustom_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 2),
(5, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuariocustom_user_permissions`
--

DROP TABLE IF EXISTS `usuario_usuariocustom_user_permissions`;
CREATE TABLE `usuario_usuariocustom_user_permissions` (
  `id` int(11) NOT NULL,
  `usuariocustom_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `core_empleado`
--
ALTER TABLE `core_empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_itemcarrito`
--
ALTER TABLE `core_itemcarrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_itemcarrito_carrito_id_427071c4_fk_core_carrito_id` (`carrito_id`),
  ADD KEY `core_itemcarrito_producto_id_eea3400e_fk_core_producto_id` (`producto_id`);

--
-- Indices de la tabla `core_itemorden`
--
ALTER TABLE `core_itemorden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_itemorden_orden_id_e87280e7_fk_core_orden_id` (`orden_id`),
  ADD KEY `core_itemorden_producto_id_3dc0db76_fk_core_producto_id` (`producto_id`);

--
-- Indices de la tabla `core_orden`
--
ALTER TABLE `core_orden`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `core_orden_carrito_id_11b53be9_fk_core_carrito_id` (`carrito_id`),
  ADD KEY `core_orden_estado_id_d3872fec_fk_core_seguimiento_id` (`estado_id`);

--
-- Indices de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` (`tipo_id`);

--
-- Indices de la tabla `core_seguimiento`
--
ALTER TABLE `core_seguimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_usuario_usuariocustom_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `usuario_usuariocustom`
--
ALTER TABLE `usuario_usuariocustom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `usuario_usuariocustom_groups`
--
ALTER TABLE `usuario_usuariocustom_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_usuariocustom_gr_usuariocustom_id_group_i_e07ef4d6_uniq` (`usuariocustom_id`,`group_id`),
  ADD KEY `usuario_usuariocustom_groups_group_id_f2e7608e_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `usuario_usuariocustom_user_permissions`
--
ALTER TABLE `usuario_usuariocustom_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_usuariocustom_us_usuariocustom_id_permiss_c31cc8d6_uniq` (`usuariocustom_id`,`permission_id`),
  ADD KEY `usuario_usuariocusto_permission_id_a7fbfbf3_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_empleado`
--
ALTER TABLE `core_empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_itemcarrito`
--
ALTER TABLE `core_itemcarrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `core_itemorden`
--
ALTER TABLE `core_itemorden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `core_orden`
--
ALTER TABLE `core_orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `core_seguimiento`
--
ALTER TABLE `core_seguimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `usuario_usuariocustom`
--
ALTER TABLE `usuario_usuariocustom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario_usuariocustom_groups`
--
ALTER TABLE `usuario_usuariocustom_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario_usuariocustom_user_permissions`
--
ALTER TABLE `usuario_usuariocustom_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  ADD CONSTRAINT `core_carrito_usuario_id_9eafcb26_fk_usuario_usuariocustom_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuariocustom` (`id`);

--
-- Filtros para la tabla `core_itemcarrito`
--
ALTER TABLE `core_itemcarrito`
  ADD CONSTRAINT `core_itemcarrito_carrito_id_427071c4_fk_core_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `core_carrito` (`id`),
  ADD CONSTRAINT `core_itemcarrito_producto_id_eea3400e_fk_core_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `core_producto` (`id`);

--
-- Filtros para la tabla `core_itemorden`
--
ALTER TABLE `core_itemorden`
  ADD CONSTRAINT `core_itemorden_orden_id_e87280e7_fk_core_orden_id` FOREIGN KEY (`orden_id`) REFERENCES `core_orden` (`id`),
  ADD CONSTRAINT `core_itemorden_producto_id_3dc0db76_fk_core_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `core_producto` (`id`);

--
-- Filtros para la tabla `core_orden`
--
ALTER TABLE `core_orden`
  ADD CONSTRAINT `core_orden_carrito_id_11b53be9_fk_core_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `core_carrito` (`id`),
  ADD CONSTRAINT `core_orden_estado_id_d3872fec_fk_core_seguimiento_id` FOREIGN KEY (`estado_id`) REFERENCES `core_seguimiento` (`id`);

--
-- Filtros para la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD CONSTRAINT `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` FOREIGN KEY (`tipo_id`) REFERENCES `core_tipoproducto` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_usuario_usuariocustom_id` FOREIGN KEY (`user_id`) REFERENCES `usuario_usuariocustom` (`id`);

--
-- Filtros para la tabla `usuario_usuariocustom_groups`
--
ALTER TABLE `usuario_usuariocustom_groups`
  ADD CONSTRAINT `usuario_usuariocusto_usuariocustom_id_3cf3c88e_fk_usuario_u` FOREIGN KEY (`usuariocustom_id`) REFERENCES `usuario_usuariocustom` (`id`),
  ADD CONSTRAINT `usuario_usuariocustom_groups_group_id_f2e7608e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `usuario_usuariocustom_user_permissions`
--
ALTER TABLE `usuario_usuariocustom_user_permissions`
  ADD CONSTRAINT `usuario_usuariocusto_permission_id_a7fbfbf3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `usuario_usuariocusto_usuariocustom_id_e4c3a412_fk_usuario_u` FOREIGN KEY (`usuariocustom_id`) REFERENCES `usuario_usuariocustom` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
