-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2017 a las 22:51:04
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reservacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `id_hab` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `titulo_habitacion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_habitacion` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad_habitacion` int(5) NOT NULL,
  `precio_hab` int(5) NOT NULL,
  `status_hab` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`id_hab`, `id_hotel`, `titulo_habitacion`, `descripcion_habitacion`, `cantidad_habitacion`, `precio_hab`, `status_hab`) VALUES
(1, 1, 'Habitación Sencilla', 'Esta es una habitación sencilla', 8, 800, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int(11) NOT NULL,
  `nombre_hotel` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `direccion_hotel` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_hotel` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `nombre_hotel`, `direccion_hotel`, `telefono_hotel`) VALUES
(1, 'Hotel Yaocalli', 'pendiente', 'pendiente'),
(2, 'Yaocalli', 'Pendiente', '123456789'),
(3, 'Yaocalli', 'Pendiente', '123456789'),
(4, 'Yaocalli', 'Pendiente', '123456789'),
(5, 'Yaocalli', 'Pendiente', '123456789'),
(6, '', '', ''),
(7, 'El Quinto Sol', 'Pendiente', '5578941'),
(27, 'Barragán', 'jojo', '1234'),
(26, 'Barragán', 'jojo', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_usuario`
--

CREATE TABLE `nivel_usuario` (
  `id_nivel` int(11) NOT NULL,
  `nivel` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `user` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `nivel_usuario`
--

INSERT INTO `nivel_usuario` (`id_nivel`, `nivel`, `user`, `descripcion`) VALUES
(1, 'a', 'Administrador', 'Puede administrar todo'),
(2, 'b', 'Usuario', 'Es un usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `id_reservacion` int(11) NOT NULL,
  `id_hab` int(11) NOT NULL,
  `fechaEntrada` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `fechaSalida` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `costoTotal` int(5) NOT NULL,
  `nombreCliente` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`id_reservacion`, `id_hab`, `fechaEntrada`, `fechaSalida`, `costoTotal`, `nombreCliente`) VALUES
(1, 1, '26/05/2017', '27/05/2017', 800, 'Pepito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_habitaciones`
--

CREATE TABLE `servicios_habitaciones` (
  `id_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `precio_servicio` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicios_habitaciones`
--

INSERT INTO `servicios_habitaciones` (`id_servicio`, `nombre_servicio`, `precio_servicio`) VALUES
(1, 'Agua caliente', 0),
(2, 'Desayuno Continental', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_habitacion`
--

CREATE TABLE `servicio_habitacion` (
  `id_servicio_hab` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_hab` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicio_habitacion`
--

INSERT INTO `servicio_habitacion` (`id_servicio_hab`, `id_servicio`, `id_hab`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `id_sesion` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pass_usuario` varchar(65) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sesion`
--

INSERT INTO `sesion` (`id_sesion`, `id_nivel`, `id_usuario`, `nombre_usuario`, `pass_usuario`) VALUES
(1, 1, 1, 'axel@mail.com', '4e4feaea959d426155a480dc07ef92f4754ee93edbe56d993d74f131497e66fb'),
(2, 2, 2, 'cliente@mail.com', '4e4feaea959d426155a480dc07ef92f4754ee93edbe56d993d74f131497e66fb'),
(3, 2, 3, 'barragan@mail.com', '4e4feaea959d426155a480dc07ef92f4754ee93edbe56d993d74f131497e66fb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` char(15) CHARACTER SET latin1 NOT NULL,
  `apellidos_usuario` char(30) CHARACTER SET latin1 NOT NULL,
  `empresa` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellidos_usuario`, `empresa`) VALUES
(1, 'Axel', 'Barragan', 'Flubox'),
(2, 'Pancho', 'Jolote', ''),
(3, 'Akzel', 'Barragán', '27');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`id_hab`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`);

--
-- Indices de la tabla `nivel_usuario`
--
ALTER TABLE `nivel_usuario`
  ADD PRIMARY KEY (`id_nivel`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`id_reservacion`);

--
-- Indices de la tabla `servicios_habitaciones`
--
ALTER TABLE `servicios_habitaciones`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `servicio_habitacion`
--
ALTER TABLE `servicio_habitacion`
  ADD PRIMARY KEY (`id_servicio_hab`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id_sesion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `id_hab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `nivel_usuario`
--
ALTER TABLE `nivel_usuario`
  MODIFY `id_nivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id_reservacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `servicios_habitaciones`
--
ALTER TABLE `servicios_habitaciones`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `servicio_habitacion`
--
ALTER TABLE `servicio_habitacion`
  MODIFY `id_servicio_hab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sesion`
--
ALTER TABLE `sesion`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
