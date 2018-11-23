-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2018 a las 03:05:41
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basemotos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `fk_id_moto` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL,
  `comentario` varchar(300) NOT NULL,
  `puntaje` tinyint(4) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `fk_id_moto`, `fk_id_usuario`, `comentario`, `puntaje`, `fecha`) VALUES
(33, 11, 2, 'UNA NAVE', 4, '2018-11-21 18:38:00'),
(38, 11, 2, 'UHHH ESTA RE FLAMA', 2, '2018-11-22 19:59:42'),
(42, 11, 2, 'TIRA ALTO CORTE', 5, '2018-11-22 20:07:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id_imagen` int(11) NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `fk_id_moto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id_imagen`, `ruta`, `fk_id_moto`) VALUES
(20, 'img/product-img/5bf4d36b8bfae', 4),
(21, 'img/product-img/5bf4d3784c31c', 11),
(22, 'img/product-img/5bf4d3883d365', 12),
(25, 'img/product-img/5bf4d40bc7407', 7),
(27, 'img/product-img/5bf4d42c704c5', 18),
(28, 'img/product-img/5bf4d43e6aaab', 17),
(29, 'img/product-img/5bf4d44dee68e', 14),
(30, 'img/product-img/5bf4d4606d4d2', 15),
(31, 'img/product-img/5bf4d4701c020', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(50) NOT NULL,
  `descripcion_marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`, `descripcion_marca`) VALUES
(1, 'Honda', 'LALALA'),
(2, 'Yamaha', 'LALALA'),
(3, 'Motomel', 'LALALA'),
(18, 'Mondial', 'sdads'),
(19, 'Kawasaki', 'A'),
(20, 'Zanella', 'B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_moto` int(11) NOT NULL,
  `fk_id_marca` int(11) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion_producto` varchar(300) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_moto`, `fk_id_marca`, `nombre_producto`, `descripcion_producto`, `precio`) VALUES
(4, 1, 'CB190R', 'En la Nueva CB 190R lo sentirás como nunca antes. Su configuración formada por un cuadro tipo diamante, suspensión monoshock y escape corto, genera una distribución de pesos y centro de gravedad ideal, que combinada con una postura de manejo deportiva, ofrece una experiencia llena de adrenalina.', 77300),
(7, 2, 'MT-03 ABS', 'La poderosa y agresiva MT-03 representa una nueva dirección en el diseño de motocicletas. De carácte', 12000),
(11, 1, 'XR150', 'Con una combinación de estilo y eficiencia, la nueva Honda XR150 está pensada para acompañarte en cualquier ocasión. Este nuevo modelo te permite realizar tus recorridos multipropósito con estilo. Viene con un diseño gráfico novedoso, siguiendo la línea de su hermana mayor, la XR190L.', 70300),
(12, 1, 'Wave', 'Renovada por completo, sus líneas aerodinámicas proyectan un estilo más deportivo y moderno.', 42400),
(14, 19, 'Z650', 'MOTOR 4 TIEMPOS, 2 CILINDROS, ÁRBOL DE LEVAS DOBLE EN CABEZA (DOHC), REFRIGERADO CON LÍQUIDO', 66999),
(15, 19, 'KLX140', 'MOTOR 4 TIEMPOS, 1 CILINDRO, SOHC, REFRIGERADO CON AIRE', 66999),
(16, 19, 'Versys 650', 'MOTOR BICILÍNDRICO EN PARALELO, 4 TIEMPOS, 2 CILINDROS, ÁRBOL DE LEVAS DOBLE EN CABEZA (DOHC), REFRIGERADO CON LÍQUIDO, 4 VÁLVULAS POR CILINDRO', 99999),
(17, 18, 'RD150L', 'Monocilindrico. 4 tiempos', 29400),
(18, 3, 'BLITZ 110', 'La nueva Blitz 110 V8, presenta un diseño totalmente renovado, de estilo joven y urbano; con divertidas y variadas gráficas para el hombre y la mujer de hoy en día. Equipada con un nuevo sistema de balizas, asiento biplaza de doble costura y material antideslizante, un espacioso baúl porta casco, ta', 16800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rol` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `password`, `email`, `rol`) VALUES
(1, 'juan perez', '$2y$10$BgFkTjvHTHioHM2v5XiRJuGCprUNo4Z2T4JYOxvRXUviTNRk8BuW2', 'juan@gmail.com', 0),
(2, 'mateo', '$2y$10$NiHwENbfJf3nM9xEncMATuwSWaLoD1lucdelVBDLdCdniRKWM5pnG', 'mateo@gmail.com', 1),
(3, 'Yamil', '$2y$10$IKe6Vu1Ewaixpar3f4Rioem4ieZVAYzPr6QGfyqc.rhr2F90SW6KG', 'yamil@gmail.com', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `fk_id_moto` (`fk_id_moto`),
  ADD KEY `fk_id_usuario` (`fk_id_usuario`) USING BTREE,
  ADD KEY `fk_id_moto_2` (`fk_id_moto`) USING BTREE;

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `ruta` (`ruta`),
  ADD KEY `fk_id_moto` (`fk_id_moto`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_marca_2` (`id_marca`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_moto`),
  ADD KEY `id_marca` (`fk_id_marca`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_moto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`fk_id_moto`) REFERENCES `producto` (`id_moto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`fk_id_moto`) REFERENCES `producto` (`id_moto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`fk_id_marca`) REFERENCES `marca` (`id_marca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
