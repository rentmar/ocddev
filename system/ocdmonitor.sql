-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-06-2021 a las 21:38:31
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ocdmonitor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor`
--

CREATE TABLE `actor` (
  `idactor` smallint(4) UNSIGNED NOT NULL,
  `nombre_actor` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `actor`
--

INSERT INTO `actor` (`idactor`, `nombre_actor`) VALUES
(1, 'Pertenece al Organo Legislativo'),
(2, 'Pertenece al Organo Ejecutivo'),
(3, 'Pertenece al Organo Judicial'),
(4, 'Pertenece al Organo Electoral'),
(5, 'Pertenece a un partido politico'),
(6, 'Pertenece a la sociedad civil'),
(7, 'Pertenece al Organo Ejecutivo Departamental'),
(8, 'Pertenece al Organo Legislativo Departamental'),
(9, 'Pertenece al Organo Ejecutivo Municipal'),
(10, 'Pertenece al Organo Legislativo Municipal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `iddepartamento` smallint(3) UNSIGNED NOT NULL,
  `nombre_departamento` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`iddepartamento`, `nombre_departamento`) VALUES
(1, 'La Paz'),
(2, 'Santa Cruz'),
(3, 'Oruro'),
(4, 'Cochabamba'),
(5, 'Sucre'),
(6, 'Tarija'),
(7, 'Beni'),
(8, 'Pando'),
(9, 'Potosi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'miembros', 'Usuarios generales, docentes'),
(3, 'monitores', 'Alumnos registrados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(1, '127.0.0.1', 'admin', 1624862573);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medio_comunicacion`
--

CREATE TABLE `medio_comunicacion` (
  `idmedio` smallint(5) UNSIGNED NOT NULL,
  `nombre_medio` varchar(50) NOT NULL,
  `rel_idtipomedio` smallint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medio_departamento`
--

CREATE TABLE `medio_departamento` (
  `idmediodepartamento` int(11) UNSIGNED NOT NULL,
  `rel_idmedio` smallint(5) UNSIGNED NOT NULL,
  `rel_iddepartamento` smallint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE `noticia` (
  `idnoticia` int(11) UNSIGNED NOT NULL,
  `fecha` int(11) NOT NULL,
  `titular` varchar(200) NOT NULL,
  `resumen` text NOT NULL,
  `url_noticia` varchar(150) DEFAULT NULL,
  `rel_idactor` smallint(4) UNSIGNED NOT NULL,
  `rel_idsubtema` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia_medio`
--

CREATE TABLE `noticia_medio` (
  `idnoticiamedio` int(11) NOT NULL,
  `rel_idnoticia` int(11) UNSIGNED NOT NULL,
  `rel_idmedio` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subtema`
--

CREATE TABLE `subtema` (
  `idsubtema` smallint(5) UNSIGNED NOT NULL,
  `nombre_subtema` varchar(150) NOT NULL,
  `rel_idtema` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

CREATE TABLE `tema` (
  `idtema` smallint(4) UNSIGNED NOT NULL,
  `nombre_tema` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tema`
--

INSERT INTO `tema` (`idtema`, `nombre_tema`) VALUES
(1, 'Presentacion de Estatutos de organizaciones politicas'),
(2, 'Competencias Jurisdicionales del TSE'),
(3, 'Redistribuicion de Escaños'),
(4, 'Circuncipciones uninominales'),
(5, 'Difusion de encuestas'),
(6, 'Inhabilitacion de candidatos'),
(7, 'Computo departamental'),
(8, 'Padron Electoral'),
(9, 'Procedimientos Tecnico Electorales'),
(10, 'Financiamiento politico y partidario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_medio`
--

CREATE TABLE `tipo_medio` (
  `idtipomedio` smallint(3) UNSIGNED NOT NULL,
  `nombre_tipo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_medio`
--

INSERT INTO `tipo_medio` (`idtipomedio`, `nombre_tipo`) VALUES
(1, 'Pagina de Red Social'),
(2, 'Canal de Television'),
(3, 'Emisora Radial'),
(4, 'Prensa Escrita');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `carnet_identidad` varchar(100) DEFAULT NULL,
  `departamento` int(11) DEFAULT NULL,
  `latitud` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `carnet_identidad`, `departamento`, `latitud`, `longitud`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$pmaBLu2uJkJgReTB1l24xuGXbtBloDuAWtAYUpc2PaGkQUhBBxW0u', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1624884941, 1, 'Admin', 'istrator', 'ADMIN', '0', NULL, NULL, NULL, ''),
(2, '127.0.0.1', 'marcelo', '$2y$10$hrJ8Cc/KVH6k9i7VC0x.2.rGXlUXs3jWrDdXcN1XW4Y8ki4FQoDta', 'MRolqueza@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1624902618, NULL, 1, 'Marcelo', 'Rolqueza', NULL, NULL, '4834568', 1, '34', '43'),
(3, '127.0.0.1', 'kevin', '$2y$10$IFZMqzy7PJG4TpW0KeDLNO5bWzL8T7CqnLUrrtOuKK.XSF4KDUBuq', 'kevin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1624906932, NULL, 1, 'Kevin T.', 'Murillo A,', NULL, NULL, '44444444', 3, '43', '34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_noticia`
--

CREATE TABLE `usuario_noticia` (
  `idusuarionoticia` int(11) NOT NULL,
  `rel_idusr` int(11) UNSIGNED NOT NULL,
  `rel_idnoticia` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`idactor`);

--
-- Indices de la tabla `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`iddepartamento`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medio_comunicacion`
--
ALTER TABLE `medio_comunicacion`
  ADD PRIMARY KEY (`idmedio`),
  ADD KEY `FK_mediocomunicaciontipo` (`rel_idtipomedio`);

--
-- Indices de la tabla `medio_departamento`
--
ALTER TABLE `medio_departamento`
  ADD PRIMARY KEY (`idmediodepartamento`),
  ADD KEY `FK_mediodepartamento` (`rel_idmedio`),
  ADD KEY `FK_departamentomedio` (`rel_iddepartamento`);

--
-- Indices de la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`idnoticia`),
  ADD KEY `FK_actornoticia` (`rel_idactor`),
  ADD KEY `FK_subtemanoticia` (`rel_idsubtema`);

--
-- Indices de la tabla `noticia_medio`
--
ALTER TABLE `noticia_medio`
  ADD PRIMARY KEY (`idnoticiamedio`),
  ADD KEY `FK_noticiamedio` (`rel_idnoticia`),
  ADD KEY `FK_medionoticia` (`rel_idmedio`);

--
-- Indices de la tabla `subtema`
--
ALTER TABLE `subtema`
  ADD PRIMARY KEY (`idsubtema`),
  ADD KEY `rel_idtema` (`rel_idtema`);

--
-- Indices de la tabla `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`idtema`);

--
-- Indices de la tabla `tipo_medio`
--
ALTER TABLE `tipo_medio`
  ADD PRIMARY KEY (`idtipomedio`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indices de la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indices de la tabla `usuario_noticia`
--
ALTER TABLE `usuario_noticia`
  ADD PRIMARY KEY (`idusuarionoticia`),
  ADD KEY `FK_usrnoticia` (`rel_idusr`),
  ADD KEY `FK_noticiausuario` (`rel_idnoticia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actor`
--
ALTER TABLE `actor`
  MODIFY `idactor` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `iddepartamento` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medio_comunicacion`
--
ALTER TABLE `medio_comunicacion`
  MODIFY `idmedio` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medio_departamento`
--
ALTER TABLE `medio_departamento`
  MODIFY `idmediodepartamento` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `noticia`
--
ALTER TABLE `noticia`
  MODIFY `idnoticia` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `noticia_medio`
--
ALTER TABLE `noticia_medio`
  MODIFY `idnoticiamedio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subtema`
--
ALTER TABLE `subtema`
  MODIFY `idsubtema` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tema`
--
ALTER TABLE `tema`
  MODIFY `idtema` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipo_medio`
--
ALTER TABLE `tipo_medio`
  MODIFY `idtipomedio` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario_noticia`
--
ALTER TABLE `usuario_noticia`
  MODIFY `idusuarionoticia` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medio_comunicacion`
--
ALTER TABLE `medio_comunicacion`
  ADD CONSTRAINT `FK_mediocomunicaciontipo` FOREIGN KEY (`rel_idtipomedio`) REFERENCES `tipo_medio` (`idtipomedio`);

--
-- Filtros para la tabla `medio_departamento`
--
ALTER TABLE `medio_departamento`
  ADD CONSTRAINT `FK_departamentomedio` FOREIGN KEY (`rel_iddepartamento`) REFERENCES `departamento` (`iddepartamento`),
  ADD CONSTRAINT `FK_mediodepartamento` FOREIGN KEY (`rel_idmedio`) REFERENCES `medio_comunicacion` (`idmedio`);

--
-- Filtros para la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD CONSTRAINT `FK_actornoticia` FOREIGN KEY (`rel_idactor`) REFERENCES `actor` (`idactor`),
  ADD CONSTRAINT `FK_subtemanoticia` FOREIGN KEY (`rel_idsubtema`) REFERENCES `subtema` (`idsubtema`);

--
-- Filtros para la tabla `noticia_medio`
--
ALTER TABLE `noticia_medio`
  ADD CONSTRAINT `FK_medionoticia` FOREIGN KEY (`rel_idmedio`) REFERENCES `medio_comunicacion` (`idmedio`),
  ADD CONSTRAINT `FK_noticiamedio` FOREIGN KEY (`rel_idnoticia`) REFERENCES `noticia` (`idnoticia`);

--
-- Filtros para la tabla `subtema`
--
ALTER TABLE `subtema`
  ADD CONSTRAINT `subtema_ibfk_1` FOREIGN KEY (`rel_idtema`) REFERENCES `tema` (`idtema`);

--
-- Filtros para la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_noticia`
--
ALTER TABLE `usuario_noticia`
  ADD CONSTRAINT `FK_noticiausuario` FOREIGN KEY (`rel_idnoticia`) REFERENCES `noticia` (`idnoticia`),
  ADD CONSTRAINT `FK_usrnoticia` FOREIGN KEY (`rel_idusr`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
