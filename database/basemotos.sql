-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2018 a las 01:57:33
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
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre`, `descripcion`) VALUES
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
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `precio` int(11) NOT NULL,
  `imagenes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_moto`, `id_marca`, `nombre`, `descripcion`, `precio`, `imagenes`) VALUES
(4, 1, 'CB190R', 'En la Nueva CB 190R lo sentirás como nunca antes. Su configuración formada por un cuadro tipo diamante, suspensión monoshock y escape corto, genera una distribución de pesos y centro de gravedad ideal, que combinada con una postura de manejo deportiva, ofrece una experiencia llena de adrenalina.', 77300, 'cb1.jpg     '),
(7, 2, 'MT-03 ABS', 'La poderosa y agresiva MT-03 representa una nueva dirección en el diseño de motocicletas. De carácte', 12000, 'y1.jpg'),
(8, 2, 'Yamaha Ybr 125 Z ', 'saasa', 15000, 'ybrz.jpg'),
(11, 1, 'XR150', 'Con una combinación de estilo y eficiencia, la nueva Honda XR150 está pensada para acompañarte en cualquier ocasión. Este nuevo modelo te permite realizar tus recorridos multipropósito con estilo. Viene con un diseño gráfico novedoso, siguiendo la línea de su hermana mayor, la XR190L.', 70300, 'XR150.jpg '),
(12, 1, 'Wave', 'Renovada por completo, sus líneas aerodinámicas proyectan un estilo más deportivo y moderno.', 42400, 'wave.jpg'),
(13, 1, 'CG150 Titan', 'Hay una nueva Honda CG 150 Titan. Se renovó su diseño, se renovaron tus horizontes.', 62900, 'cg1.jpg'),
(14, 19, 'Z650', 'MOTOR 4 TIEMPOS, 2 CILINDROS, ÁRBOL DE LEVAS DOBLE EN CABEZA (DOHC), REFRIGERADO CON LÍQUIDO', 66999, 'z650.jpg'),
(15, 19, 'KLX140', 'MOTOR 4 TIEMPOS, 1 CILINDRO, SOHC, REFRIGERADO CON AIRE', 66999, 'klx140.jpg'),
(16, 19, 'Versys 650', 'MOTOR BICILÍNDRICO EN PARALELO, 4 TIEMPOS, 2 CILINDROS, ÁRBOL DE LEVAS DOBLE EN CABEZA (DOHC), REFRIGERADO CON LÍQUIDO, 4 VÁLVULAS POR CILINDRO', 99999, 'versys650.jpg'),
(17, 18, 'RD150L', 'Monocilindrico. 4 tiempos', 29400, 'rd150.jpg'),
(18, 3, 'BLITZ 110', 'La nueva Blitz 110 V8, presenta un diseño totalmente renovado, de estilo joven y urbano; con divertidas y variadas gráficas para el hombre y la mujer de hoy en día. Equipada con un nuevo sistema de balizas, asiento biplaza de doble costura y material antideslizante, un espacioso baúl porta casco, ta', 16800, 'blitz.png');

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
(0, 'mateo', '$2y$10$NiHwENbfJf3nM9xEncMATuwSWaLoD1lucdelVBDLdCdniRKWM5pnG', 'mateo@gmail.com', 1),
(0, 'juan perez', '$2y$10$BgFkTjvHTHioHM2v5XiRJuGCprUNo4Z2T4JYOxvRXUviTNRk8BuW2', 'juan@gmail.com', 2);

--
-- Índices para tablas volcadas
--

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
  ADD KEY `id_marca` (`id_marca`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_moto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
