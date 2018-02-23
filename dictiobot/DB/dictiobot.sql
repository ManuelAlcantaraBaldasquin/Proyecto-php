-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2018 a las 21:32:41
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dictiobot`
--
CREATE DATABASE IF NOT EXISTS `dictiobot` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `dictiobot`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diccionario`
--

CREATE TABLE `diccionario` (
  `IDdiccionario` int(11) NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `idioma` varchar(20) NOT NULL,
  `descripcion` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `IDuser` int(11) NOT NULL,
  `IDidioma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `diccionario`
--

INSERT INTO `diccionario` (`IDdiccionario`, `nombre`, `idioma`, `descripcion`, `fecha`, `IDuser`, `IDidioma`) VALUES
(1, 'English', 'Inglés', 'Mi diccionario de inglés', '2018-02-10', 1, 1),
(2, 'Alemán', 'Alemán', 'Primer diccionario de Alemán', '2018-02-10', 2, 2),
(3, 'chinese', 'Chino', 'dicc de chino', '2018-02-10', 1, 3),
(4, 'Inglés', 'Inglés', 'notas de clase', '2018-02-10', 2, 1),
(5, 'ruso', 'Ruso', 'primer año de ruso', '2018-02-10', 2, 5),
(6, 'nipón', 'Japonés', 'mis primeras palabras japonesas', '2018-02-23', 2, 4),
(7, 'Chino', 'Chino', 'mis andaduras por un idioma asiático', '2018-02-23', 1, 3),
(8, 'japo', 'Japonés', 'nuevo curso de Japonés', '2018-02-23', 1, 4),
(9, 'secundario', 'Inglés', 'notas varias de inglés', '2018-02-10', 1, 1),
(10, 'Inglés v2', 'Inglés', 'Palabras importantes', '2018-02-10', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE `idioma` (
  `IDidioma` int(11) NOT NULL,
  `idioma` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `idioma`
--

INSERT INTO `idioma` (`IDidioma`, `idioma`) VALUES
(1, 'Inglés'),
(2, 'Alemán'),
(3, 'Chino'),
(4, 'Japonés'),
(5, 'Ruso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `palabras`
--

CREATE TABLE `palabras` (
  `IDpalabras` int(11) NOT NULL,
  `palabra` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `significado` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `ejemplo` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `IDdiccionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de palabras';

--
-- Volcado de datos para la tabla `palabras`
--

INSERT INTO `palabras` (`IDpalabras`, `palabra`, `significado`, `ejemplo`, `IDdiccionario`) VALUES
(1, 'cat', 'gato', 'my cat', 1),
(2, 'car', 'cochecito', 'the car leré', 1),
(3, 'car', 'cochecito', 'the car leré', 1),
(4, 'car', 'cochecito', 'the car leré', 1),
(5, 'car', 'cochecito', 'the car leré', 1),
(6, 'car', 'cochecito', 'the car leré', 1),
(7, 'car', 'cochecito', 'the car leré', 1),
(8, 'car', 'cochecito', 'the car leré', 1),
(9, 'car', 'cochecito', 'the car leré', 1),
(10, 'car', 'cochecito', 'the car leré', 1),
(11, 'car', 'cochecito', 'the car leré', 1),
(12, 'car', 'cochecito', 'the car leré', 1),
(13, 'car', 'cochecito', 'the car leré', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IDuser` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabal del usuario';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IDuser`, `admin`, `user`, `password`, `fechaCreacion`) VALUES
(1, 0, 'user', 'user', '2017-11-21'),
(2, 0, 'usuario', 'usuario', '2018-02-10'),
(3, 1, 'admin', 'admin', '2018-02-21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `diccionario`
--
ALTER TABLE `diccionario`
  ADD PRIMARY KEY (`IDdiccionario`),
  ADD KEY `ID user` (`IDuser`),
  ADD KEY `ID idioma` (`IDidioma`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`IDidioma`);

--
-- Indices de la tabla `palabras`
--
ALTER TABLE `palabras`
  ADD PRIMARY KEY (`IDpalabras`,`IDdiccionario`),
  ADD KEY `ID diccionario` (`IDdiccionario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IDuser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `diccionario`
--
ALTER TABLE `diccionario`
  MODIFY `IDdiccionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `idioma`
--
ALTER TABLE `idioma`
  MODIFY `IDidioma` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `palabras`
--
ALTER TABLE `palabras`
  MODIFY `IDpalabras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IDuser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `diccionario`
--
ALTER TABLE `diccionario`
  ADD CONSTRAINT `diccionario_ibfk_1` FOREIGN KEY (`IDuser`) REFERENCES `usuarios` (`IDuser`),
  ADD CONSTRAINT `diccionario_ibfk_2` FOREIGN KEY (`IDidioma`) REFERENCES `idioma` (`Ididioma`);

--
-- Filtros para la tabla `palabras`
--
ALTER TABLE `palabras`
  ADD CONSTRAINT `palabras_ibfk_1` FOREIGN KEY (`IDdiccionario`) REFERENCES `diccionario` (`IDdiccionario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
