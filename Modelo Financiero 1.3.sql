-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-05-2021 a las 17:36:17
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `finanzas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientocontabledetalle`
--
CREATE DATABASE finanzas;
USE finanzas;

CREATE TABLE `asientocontabledetalle` (
  `Codigo_DetalleAsiento` varchar(100) NOT NULL,
  `CuentaContable_Asiento` varchar(100) NOT NULL,
  `Partida_Asiento` varchar(100) NOT NULL,
  `Encabezado_Asiento` varchar(100) NOT NULL,
  `Tipo_Asiento` varchar(100) NOT NULL,
  `Monto_Debe` varchar(100) NOT NULL,
  `Monto_Haber` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asientocontabledetalle`
--

INSERT INTO `asientocontabledetalle` (`Codigo_DetalleAsiento`, `CuentaContable_Asiento`, `Partida_Asiento`, `Encabezado_Asiento`, `Tipo_Asiento`, `Monto_Debe`, `Monto_Haber`) VALUES
('0000001', 'A001-Caja', '0000001', '0000001', 'AO1', '800', '0'),
('0000002', 'A002-Bancos', '0000001', '0000001', 'AO1', '0', '800'),
('0000003', 'C001-Compras', '0000002', '0000001', 'AO1', '850000', '0'),
('0000004', 'A001-IVAPC', '0000002', '0000001', 'AO1', '102000', '0'),
('0000005', 'A001-Caja', '0000002', '0000001', 'AO1', '0', '952000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `Codigo_Banco` varchar(100) NOT NULL,
  `Nombre_Banco` varchar(100) NOT NULL,
  `Clave_Banco` varchar(100) NOT NULL,
  `Telefono_Banco` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cheque`
--

CREATE TABLE `cheque` (
  `Num_Cheque` varchar(255) NOT NULL,
  `Fecha_Cheque` date NOT NULL,
  `FK_Banco` varchar(255) NOT NULL,
  `FK_Cuenta` varchar(255) NOT NULL,
  `FK_Cuentahabiente` varchar(255) NOT NULL,
  `Monto_Cheque` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacioncuenta`
--

CREATE TABLE `clasificacioncuenta` (
  `Codigo_clasificacion` varchar(100) NOT NULL,
  `Clasificacion_CuentaNombre` varchar(100) DEFAULT NULL,
  `Descripcion_Clasificacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clasificacioncuenta`
--

INSERT INTO `clasificacioncuenta` (`Codigo_clasificacion`, `Clasificacion_CuentaNombre`, `Descripcion_Clasificacion`) VALUES
('A001', 'Activo Corriente', 'Activos que se movilizan en la empresa en un período menor o igual a un año.'),
('A002', 'Activo No Corriente', 'Activos que se movilizan en un período mayor a un año y menor a 3 años.'),
('C001', 'Resultados', 'Capital de la Empresa'),
('C002', 'Estado de Resultados', 'Resultados'),
('P001', 'Pasivo Corriente', 'Pasivos que se movilizan en un período menor a un año.'),
('P002', 'Pasivo No Corriente', 'Pasivos que circulan entre uno y tres años.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentabancaria`
--

CREATE TABLE `cuentabancaria` (
  `Numero_CuentaBancaria` varchar(100) NOT NULL,
  `Moneda_Cuenta` varchar(100) NOT NULL,
  `CuentaHabiente_Cuenta` varchar(100) NOT NULL,
  `Banco_Cuenta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentacontable`
--

CREATE TABLE `cuentacontable` (
  `Codigo_CuentaContable` varchar(100) NOT NULL,
  `Nombre_CuentaContable` varchar(100) DEFAULT NULL,
  `Clasificacion_CuentaContable` varchar(100) DEFAULT NULL,
  `Estado_CuentaContable` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Monto_CuentaContable` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentacontable`
--

INSERT INTO `cuentacontable` (`Codigo_CuentaContable`, `Nombre_CuentaContable`, `Clasificacion_CuentaContable`, `Estado_CuentaContable`, `Monto_CuentaContable`) VALUES
('A001-Caja', 'Caja', 'A001', 'A', '15000'),
('A001-IVAPC', 'IVA por pagar', 'A001', 'A', '0'),
('A002-Bancos', 'Bancos', 'A002', 'I', '8000'),
('A002-MOBYEQU', 'Mobiliario y Equipo', 'A002', 'A', '0'),
('C001-Compras', 'Compras', 'C001', 'A', '0'),
('P001-DOCPC', 'Documentos por Pagar', 'P001', 'A', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentahabiente`
--

CREATE TABLE `cuentahabiente` (
  `Codigo_CuentaHabiente` varchar(100) NOT NULL,
  `Nombre_CuentaHabiente` varchar(100) NOT NULL,
  `ApellidoP_CuentaHabiente` varchar(100) NOT NULL,
  `ApellidoM_CuentaHabiente` varchar(100) NOT NULL,
  `TipoPersona_CuentaHabiente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentahabiente`
--

INSERT INTO `cuentahabiente` (`Codigo_CuentaHabiente`, `Nombre_CuentaHabiente`, `ApellidoP_CuentaHabiente`, `ApellidoM_CuentaHabiente`, `TipoPersona_CuentaHabiente`) VALUES
('A001CB', 'Juan', 'Pérez', 'López', 'PN1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encabezadoasientocontable`
--

CREATE TABLE `encabezadoasientocontable` (
  `Codigo_EncabezadoAsiento` varchar(100) NOT NULL,
  `Fecha_AsientoContable` varchar(100) NOT NULL,
  `Moneda_Asiento` varchar(100) NOT NULL,
  `Descripcion_Asiento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encabezadoasientocontable`
--

INSERT INTO `encabezadoasientocontable` (`Codigo_EncabezadoAsiento`, `Fecha_AsientoContable`, `Moneda_Asiento`, `Descripcion_Asiento`) VALUES
('0000001', '09/05/2021', 'GTQ', 'Libro diario del mes de mayo.'),
('0000002', '01/06/2021', 'GTQ', 'Libro Diario de Junio 2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `Codigo_Moneda` varchar(100) NOT NULL,
  `Nombre_Moneda` varchar(100) NOT NULL,
  `Simbolo_Moneda` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`Codigo_Moneda`, `Nombre_Moneda`, `Simbolo_Moneda`) VALUES
('GTQ', 'Quetzal guatemalteco', 'Q');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidacontable`
--

CREATE TABLE `partidacontable` (
  `Codigo_PartidaContable` varchar(100) NOT NULL,
  `Fecha_PartidaContable` varchar(100) NOT NULL,
  `Periodo_FiscalPartida` varchar(100) NOT NULL,
  `Glosa_PartidaContable` varchar(100) NOT NULL,
  `Monto_DeCuadre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `partidacontable`
--

INSERT INTO `partidacontable` (`Codigo_PartidaContable`, `Fecha_PartidaContable`, `Periodo_FiscalPartida`, `Glosa_PartidaContable`, `Monto_DeCuadre`) VALUES
('0000001', '09/05/2021', 'PF2021', 'Depósito de Caja a Bancos', '0'),
('0000002', '13/05/2021', 'PF2021', 'Compras al contado según Fac. No. 1566 de Seprodi.S.A.', '0'),
('0000003', '13/05/2021', 'PF2021', 'Compra de una fotocopiadora para uso de La empresa pagando el iva en efectivo.', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodofiscal`
--

CREATE TABLE `periodofiscal` (
  `Codigo_PeriodoFiscal` varchar(100) NOT NULL,
  `Periodo_FiscalAño` varchar(100) NOT NULL,
  `Estado_PeriodoFiscal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodofiscal`
--

INSERT INTO `periodofiscal` (`Codigo_PeriodoFiscal`, `Periodo_FiscalAño`, `Estado_PeriodoFiscal`) VALUES
('PF2021', '2021', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopersona`
--

CREATE TABLE `tipopersona` (
  `Codigo_TipoPersona` varchar(100) NOT NULL,
  `TipoPersona_Nombres` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipopersona`
--

INSERT INTO `tipopersona` (`Codigo_TipoPersona`, `TipoPersona_Nombres`) VALUES
('PN1', 'Persona Natural');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotransaccion`
--

CREATE TABLE `tipotransaccion` (
  `Codigo_TipoTransaccion` varchar(100) NOT NULL,
  `Transaccion_Tipo` varchar(100) NOT NULL,
  `Efecto_TipoTransaccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_asiento`
--

CREATE TABLE `tipo_asiento` (
  `Codigo_TipoAsiento` varchar(100) NOT NULL,
  `Tipo_AsientoDesc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_asiento`
--

INSERT INTO `tipo_asiento` (`Codigo_TipoAsiento`, `Tipo_AsientoDesc`) VALUES
('AA1', 'Asiento de Ajustes'),
('AO1', 'Asiento Ordinario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccionbancaria`
--

CREATE TABLE `transaccionbancaria` (
  `Codigo_Transaccion` varchar(100) NOT NULL,
  `Fecha_Transaccion` varchar(100) NOT NULL,
  `Beneficiario` varchar(100) NOT NULL,
  `Cuenta_Bancaria` varchar(100) NOT NULL,
  `Tipo_Transaccion` varchar(100) NOT NULL,
  `Monto_Transaccion` varchar(100) NOT NULL,
  `Concepto_Transaccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;