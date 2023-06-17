-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2023 a las 06:02:04
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
-- Base de datos: `petshop_exe1`
--
CREATE DATABASE IF NOT EXISTS `petshop_exe1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `petshop_exe1`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(29, 'Can add tipo producto', 8, 'add_tipoproducto'),
(30, 'Can change tipo producto', 8, 'change_tipoproducto'),
(31, 'Can delete tipo producto', 8, 'delete_tipoproducto'),
(32, 'Can view tipo producto', 8, 'view_tipoproducto'),
(33, 'Can add producto', 9, 'add_producto'),
(34, 'Can change producto', 9, 'change_producto'),
(35, 'Can delete producto', 9, 'delete_producto'),
(36, 'Can view producto', 9, 'view_producto'),
(37, 'Can add item carrito', 10, 'add_itemcarrito'),
(38, 'Can change item carrito', 10, 'change_itemcarrito'),
(39, 'Can delete item carrito', 10, 'delete_itemcarrito'),
(40, 'Can view item carrito', 10, 'view_itemcarrito'),
(41, 'Can add user', 11, 'add_usuariocustom'),
(42, 'Can change user', 11, 'change_usuariocustom'),
(43, 'Can delete user', 11, 'delete_usuariocustom'),
(44, 'Can view user', 11, 'view_usuariocustom');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carrito`
--

DROP TABLE IF EXISTS `core_carrito`;
CREATE TABLE `core_carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipoproducto`
--

DROP TABLE IF EXISTS `core_tipoproducto`;
CREATE TABLE `core_tipoproducto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(10, 'core', 'itemcarrito'),
(9, 'core', 'producto'),
(8, 'core', 'tipoproducto'),
(5, 'sessions', 'session'),
(11, 'usuario', 'usuariocustom');

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
(1, 'contenttypes', '0001_initial', '2023-06-17 03:51:16.388102'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-06-17 03:51:16.418464'),
(3, 'auth', '0001_initial', '2023-06-17 03:51:16.457852'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-06-17 03:51:16.558174'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-06-17 03:51:16.563228'),
(6, 'auth', '0004_alter_user_username_opts', '2023-06-17 03:51:16.567308'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-06-17 03:51:16.572872'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-06-17 03:51:16.574899'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-06-17 03:51:16.579026'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-06-17 03:51:16.583221'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-06-17 03:51:16.590043'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-06-17 03:51:16.603438'),
(13, 'auth', '0011_update_proxy_permissions', '2023-06-17 03:51:16.608548'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-06-17 03:51:16.613100'),
(15, 'usuario', '0001_initial', '2023-06-17 03:51:16.660152'),
(16, 'admin', '0001_initial', '2023-06-17 03:51:16.774776'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-06-17 03:51:16.823653'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-17 03:51:16.830007'),
(19, 'core', '0001_initial', '2023-06-17 03:51:16.912200'),
(20, 'sessions', '0001_initial', '2023-06-17 03:51:16.984754');

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
('1kpcduh70tjy6uwkwiup1u2lhq4nni27', '.eJxVjMsOwiAQRf-FtSEMj4Iu3fcbyAwMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxYXocXpdyNMD247yHdst1mmua3LRHJX5EG7HOfMz-vh_h1U7PVbu-KtxgTsUiFgdtYMGhAosGHPrDFY7wuqohVZxQMaAgMuICg6By3eH_WGN-Y:1qAN6y:R-e8Y52ikjdQTUcOwhmV80aip3cn44Tk2S2xCRhwsR4', '2023-07-01 04:00:28.292246');

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
(1, 'pbkdf2_sha256$216000$D3C6Vd3Hb887$UVdak34CqCBYEdqn/okTBv5JIsc3WxCQGjpBEVwaQmU=', '2023-06-17 03:57:36.401247', 1, 'admin', '', '', 'ex.albornoz@duocuc.cl', 1, 1, '2023-06-17 03:52:26.113562', 0),
(2, 'pbkdf2_sha256$216000$LPa0f94LmLVh$XWCZEW+vif3tpWPqM0NUUYuHRxeBQxfgd1dsOfn/ldk=', '2023-06-17 04:00:28.290511', 0, 'cliente', '', '', 'cliente1@gmail.com', 0, 1, '2023-06-17 04:00:19.181952', 0);

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
-- Indices de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` (`tipo_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_empleado`
--
ALTER TABLE `core_empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_itemcarrito`
--
ALTER TABLE `core_itemcarrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuario_usuariocustom`
--
ALTER TABLE `usuario_usuariocustom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario_usuariocustom_groups`
--
ALTER TABLE `usuario_usuariocustom_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
