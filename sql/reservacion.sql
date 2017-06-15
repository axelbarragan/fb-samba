-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2017 a las 04:10:07
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
(1, 1, 'Habitación Sencilla', 'Esta es una habitación sencilla', 8, 800, 1),
(2, 1, 'Habitación Doble', 'Esta es una habitación para 4 personas', 5, 1200, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int(11) NOT NULL,
  `nombre_hotel` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `direccion_hotel` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_hotel` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `correo_usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `status_hotel` tinyint(1) NOT NULL,
  `fecha_registro` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `hora_registro` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `url_imagen` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `nombre_hotel`, `direccion_hotel`, `telefono_hotel`, `correo_usuario`, `status_hotel`, `fecha_registro`, `hora_registro`, `url_imagen`) VALUES
(1, 'Hotel Yaocalli', 'San Martín', '5512345678', 'cliente@mail.com', 1, '', '', ''),
(0, 'Flubox', 'Pendiente', '5555555', 'axel@mail.com', 1, '', '', ''),
(29, 'Hotel Yaocalli', 'Pendiente', '12345678', 'hola@hotelyaocalli.com.mx', 1, '', '', ''),
(53, 'tw', 'tw', 'tw', 'tw', 1, '14-06-2017', '17:42:05', '9136-2.png');

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
  `nombre_servicio` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicios_habitaciones`
--

INSERT INTO `servicios_habitaciones` (`id_servicio`, `nombre_servicio`) VALUES
(1, 'Agua caliente'),
(2, 'Desayuno Continental'),
(3, 'TV con cable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_habitacion`
--

CREATE TABLE `servicio_habitacion` (
  `id_servicio_hab` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_hab` int(11) NOT NULL,
  `precio_serv` varchar(8) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicio_habitacion`
--

INSERT INTO `servicio_habitacion` (`id_servicio_hab`, `id_servicio`, `id_hab`, `precio_serv`) VALUES
(1, 1, 1, '800'),
(2, 2, 1, '100');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `id_sesion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `correo_usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pass_usuario` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `id_hotel` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sesion`
--

INSERT INTO `sesion` (`id_sesion`, `id_usuario`, `correo_usuario`, `pass_usuario`, `tipo_usuario`, `id_hotel`) VALUES
(1, 1, 'axel@mail.com', '4e4feaea959d426155a480dc07ef92f4754ee93edbe56d993d74f131497e66fb', 'Administrador', 0),
(2, 2, 'cliente@mail.com', '4e4feaea959d426155a480dc07ef92f4754ee93edbe56d993d74f131497e66fb', 'Usuario', 1),
(4, 4, 'hola@hotelyaocalli.com.mx', '4e4feaea959d426155a480dc07ef92f4754ee93edbe56d993d74f131497e66fb', 'Usuario', 29),
(28, 28, 'tw', 'fcd494d0f5f6d06b08b5b519e2c94f39e429c9a137a8942c9fa30588976000c0', 'Usuario', 53);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_registrohotel`
--

CREATE TABLE `t_registrohotel` (
  `id_registro` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `hora` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_reg_hotel`
--

CREATE TABLE `t_reg_hotel` (
  `id_reg` int(50) NOT NULL,
  `usuario_reg` varchar(30) NOT NULL,
  `fecha_reg` varchar(15) NOT NULL,
  `hora_reg` varchar(15) NOT NULL,
  `hotel_reg` varchar(20) NOT NULL,
  `desc_reg` varchar(700) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_salt`
--

CREATE TABLE `t_salt` (
  `id_salt` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `salt` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` char(15) CHARACTER SET latin1 NOT NULL,
  `apellidos_usuario` char(30) CHARACTER SET latin1 NOT NULL,
  `id_hotel` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellidos_usuario`, `id_hotel`) VALUES
(1, 'Axel', 'Barragan', 0),
(2, 'Pancho', 'Jolote', 1),
(4, 'Jorge', 'Gómez', 29),
(28, 'tw', 'tw', 53);

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
-- Indices de la tabla `t_registrohotel`
--
ALTER TABLE `t_registrohotel`
  ADD PRIMARY KEY (`id_registro`);

--
-- Indices de la tabla `t_salt`
--
ALTER TABLE `t_salt`
  ADD PRIMARY KEY (`id_salt`);

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
  MODIFY `id_hab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id_reservacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `servicios_habitaciones`
--
ALTER TABLE `servicios_habitaciones`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `servicio_habitacion`
--
ALTER TABLE `servicio_habitacion`
  MODIFY `id_servicio_hab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sesion`
--
ALTER TABLE `sesion`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `t_registrohotel`
--
ALTER TABLE `t_registrohotel`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `t_salt`
--
ALTER TABLE `t_salt`
  MODIFY `id_salt` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
