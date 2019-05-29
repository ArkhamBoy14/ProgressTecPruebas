-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2019 a las 21:07:36
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desarrollatec`
--

-- --------------------------------------------------------

SET time_zone = "-05:00";
drop database if exists desarrollatec;
create database desarrollatec;
use desarrollatec;

CREATE TABLE `accessos_rol` (
  `Modulo_URL` int(11) NOT NULL,
  `Cve_Rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_alumnos`
--

CREATE TABLE `cat_alumnos` (
  `Cve_Alumnos` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Matricula` varchar(45) DEFAULT NULL,
  `Cve_Semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cat_alumnos`
--

INSERT INTO `cat_alumnos` (`Cve_Alumnos`, `Nombre`, `Apellido`, `Matricula`, `Cve_Semestre`) VALUES
(1, 'Juan', 'Requena', '15300963', 1),
(2, 'Cristo', 'Lopez', '15300986', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_alumnos_has_materia`
--

CREATE TABLE `cat_alumnos_has_materia` (
  `Cve_Alumno` int(11) NOT NULL,
  `Cve_Materia` int(11) NOT NULL,
  `Cve_Semestre` int(11) NOT NULL,
  `Calificacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cat_alumnos_has_materia`
--

INSERT INTO `cat_alumnos_has_materia` (`Cve_Alumno`, `Cve_Materia`, `Cve_Semestre`, `Calificacion`) VALUES
(1, 11, 1, '6'),
(1, 1, 1, '7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_materias`
--

CREATE TABLE `cat_materias` (
  `Cve_Materia` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Cve_Semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cat_materias`
--

INSERT INTO `cat_materias` (`Cve_Materia`, `Nombre`, `Cve_Semestre`) VALUES
(1, 'Calculo Diferencial', 1),
(2, 'Fundamentos de Programación', 1),
(3, 'Taller de Etica', 1),
(4, 'Matematicas Discretas', 1),
(5, 'Taller de Administracion', 1),
(6, 'Fundamentos de Investigacion', 1),
(7, 'Calculo Integral', 2),
(8, 'Programacion Orientada a Objetos', 2),
(9, 'Contabilidad Financiera', 2),
(10, 'Quimica', 2),
(11, 'Algebra Lineal', 2),
(12, 'Probabilidad y Estadistica', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_semestre`
--

CREATE TABLE `cat_semestre` (
  `Cve_Semestre` int(11) NOT NULL,
  `Semestre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cat_semestre`
--

INSERT INTO `cat_semestre` (`Cve_Semestre`, `Semestre`) VALUES
(1, 'Primer semestre'),
(2, 'Segundo semestre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_usuarios`
--

CREATE TABLE `cat_usuarios` (
  `Cve_Usuarios` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Nickname` varchar(45) DEFAULT NULL,
  `Pass` varchar(45) DEFAULT NULL,
  `Cve_Rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_usuarios_rol`
--

CREATE TABLE `cat_usuarios_rol` (
  `Cve_Rol` varchar(10) NOT NULL,
  `Cve_Acceso` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accessos_rol`
--
ALTER TABLE `accessos_rol`
  ADD PRIMARY KEY (`Modulo_URL`,`Cve_Rol`),
  ADD KEY `fk_ACCESSOS_ROL_CAT_USUARIOS_ROL1_idx` (`Cve_Rol`);

--
-- Indices de la tabla `cat_alumnos`
--
ALTER TABLE `cat_alumnos`
  ADD PRIMARY KEY (`Cve_Alumnos`,`Cve_Semestre`),
  ADD UNIQUE KEY `Cve_Usuarios_UNIQUE` (`Cve_Alumnos`),
  ADD KEY `fk_CAT_ALUMNOS_CAT_SEMESTRE1_idx` (`Cve_Semestre`);

--
-- Indices de la tabla `cat_alumnos_has_materia`
--
ALTER TABLE `cat_alumnos_has_materia`
  ADD KEY `fk_CAT_ALUMNOS_HAS_MATERIA` (`Cve_Alumno`),
  ADD KEY `fk_CAT_ALUMNOS_CAT_MATERIA` (`Cve_Materia`),
  ADD KEY `fk_CAT_ALUMNOS_HAS_SEMESTRE` (`Cve_Semestre`);

--
-- Indices de la tabla `cat_materias`
--
ALTER TABLE `cat_materias`
  ADD PRIMARY KEY (`Cve_Materia`,`Cve_Semestre`),
  ADD UNIQUE KEY `Cve_Materia_UNIQUE` (`Cve_Materia`),
  ADD KEY `fk_CAT_MATERIAS_CAT_SEMESTRE1_idx` (`Cve_Semestre`);

--
-- Indices de la tabla `cat_semestre`
--
ALTER TABLE `cat_semestre`
  ADD PRIMARY KEY (`Cve_Semestre`);

--
-- Indices de la tabla `cat_usuarios`
--
ALTER TABLE `cat_usuarios`
  ADD PRIMARY KEY (`Cve_Usuarios`,`Cve_Rol`),
  ADD KEY `fk_CAT_USUARIOS_CAT_USUARIOS_ROL_idx` (`Cve_Rol`);

--
-- Indices de la tabla `cat_usuarios_rol`
--
ALTER TABLE `cat_usuarios_rol`
  ADD PRIMARY KEY (`Cve_Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cat_alumnos`
--
ALTER TABLE `cat_alumnos`
  MODIFY `Cve_Alumnos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cat_materias`
--
ALTER TABLE `cat_materias`
  MODIFY `Cve_Materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accessos_rol`
--
ALTER TABLE `accessos_rol`
  ADD CONSTRAINT `fk_ACCESSOS_ROL_CAT_USUARIOS_ROL1` FOREIGN KEY (`Cve_Rol`) REFERENCES `cat_usuarios_rol` (`Cve_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cat_alumnos`
--
ALTER TABLE `cat_alumnos`
  ADD CONSTRAINT `fk_CAT_ALUMNOS_CAT_SEMESTRE1` FOREIGN KEY (`Cve_Semestre`) REFERENCES `cat_semestre` (`Cve_Semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cat_alumnos_has_materia`
--
ALTER TABLE `cat_alumnos_has_materia`
  ADD CONSTRAINT `fk_CAT_ALUMNOS_CAT_MATERIA` FOREIGN KEY (`Cve_Materia`) REFERENCES `cat_materias` (`Cve_Materia`),
  ADD CONSTRAINT `fk_CAT_ALUMNOS_HAS_MATERIA` FOREIGN KEY (`Cve_Alumno`) REFERENCES `cat_alumnos` (`Cve_Alumnos`),
  ADD CONSTRAINT `fk_CAT_ALUMNOS_HAS_SEMESTRE` FOREIGN KEY (`Cve_Semestre`) REFERENCES `cat_semestre` (`Cve_Semestre`);

--
-- Filtros para la tabla `cat_materias`
--
ALTER TABLE `cat_materias`
  ADD CONSTRAINT `fk_CAT_MATERIAS_CAT_SEMESTRE1` FOREIGN KEY (`Cve_Semestre`) REFERENCES `cat_semestre` (`Cve_Semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cat_usuarios`
--
ALTER TABLE `cat_usuarios`
  ADD CONSTRAINT `fk_CAT_USUARIOS_CAT_USUARIOS_ROL` FOREIGN KEY (`Cve_Rol`) REFERENCES `cat_usuarios_rol` (`Cve_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;