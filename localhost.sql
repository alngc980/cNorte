-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-02-2022 a las 13:41:50
-- Versión del servidor: 10.3.32-MariaDB-cll-lve
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gqouvkku_dbinterna`
--
CREATE DATABASE IF NOT EXISTS `gqouvkku_dbinterna` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gqouvkku_dbinterna`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigos`
--

CREATE TABLE `codigos` (
  `nId` int(11) NOT NULL,
  `cCodigo` int(11) DEFAULT NULL,
  `cValor` int(11) DEFAULT NULL,
  `cDescripcion` varchar(250) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dCreate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `codigos`
--

INSERT INTO `codigos` (`nId`, `cCodigo`, `cValor`, `cDescripcion`, `nFlag`, `dCreate`) VALUES
(1, 100, 100, 'Normas ', 0, '2021-06-27 15:13:49'),
(2, 100, 1, '(NC)', 0, '2021-06-27 15:14:04'),
(3, 100, 2, '(NI)', 0, '2021-06-27 15:14:17'),
(4, 100, 3, '(-)', 0, '2021-06-27 15:14:23'),
(5, 200, 1, 'Conclusiones', 0, '2021-06-27 18:58:35'),
(6, 200, 2, 'Recomendaciones', 0, '2021-06-27 18:58:51'),
(7, 200, 200, 'Conclusiones Rrecomendaciones y Acciones correctivas', 0, '2021-06-27 20:19:44'),
(8, 300, 300, 'No hay datos', 0, '2021-06-27 20:24:37'),
(9, 300, 1, 'Por defecto', 0, '2021-06-27 20:24:41'),
(10, 400, 400, 'Datos de Obra', 0, '2021-06-27 20:31:33'),
(11, 400, 1, 'Obra o Servicio', 0, '2021-06-27 20:31:56'),
(12, 400, 2, 'Residente de Obra y/o Supervisor del servicio(Contratista)', 0, '2021-06-27 20:33:00'),
(13, 400, 3, 'Ingeniero Supervisor de Seguridad ST y MA (Contratista)', 0, '2021-06-27 20:33:50'),
(14, 400, 4, 'Coordinador o Jefe de supervisión de obra o servicio por ENSA(Indicar Empresa)', 0, '2021-06-27 20:34:09'),
(15, 400, 5, 'Supervisor de obra o servicio por ENSA (Indicar Empresa)', 0, '2021-06-27 20:36:12'),
(16, 100, 4, '(NC) SUBSANADO', 0, '2021-07-21 20:59:50'),
(17, 100, 5, '(NI) REITERATIVO', 0, '2021-07-21 21:00:38'),
(18, NULL, 0, NULL, 0, '2021-07-21 21:02:49'),
(19, 500, 500, 'Motivo de Incumplimientos', 0, '2021-10-23 14:57:54'),
(20, 500, 500, 'Motivo de Incumplimientos', 0, '2021-10-23 14:58:14'),
(21, 500, 1, 'Operar equipo sin autorización', 0, '2021-10-23 15:04:06'),
(22, 500, 2, 'Omisión de advertir - Falta de Señalización', 0, '2021-10-23 15:04:06'),
(23, 500, 3, 'Omisión de Asegurar (Herramientas, Equipo o Materiales)', 0, '2021-10-23 15:04:06'),
(24, 500, 4, 'Conducir unidad movil a velocidad indebida', 0, '2021-10-23 15:04:06'),
(25, 500, 5, 'Desactivar dispositivos de seguridad', 0, '2021-10-23 15:04:06'),
(26, 500, 6, 'Usar EPP. Maquinas o Herramientas defectuoso', 0, '2021-10-23 15:04:06'),
(27, 500, 7, 'No usar el EPP o usarlo incorrectamente', 0, '2021-10-23 15:04:06'),
(28, 500, 8, 'Trasladar Carga en forma Incorrecta', 0, '2021-10-23 15:04:06'),
(29, 500, 9, 'Aplicacion incorrecta', 0, '2021-10-23 15:04:06'),
(30, 500, 10, 'Levantar incorrectamente una carga', 0, '2021-10-23 15:04:06'),
(31, 500, 11, 'Postura Inadecuada para el Trabajo', 0, '2021-10-23 15:04:06'),
(32, 500, 12, 'No cuenta con herramienytas aisladas y/o materiales adecuados o en buen estado', 0, '2021-10-23 15:04:06'),
(33, 500, 13, 'Distracción en el trabajo', 0, '2021-10-23 15:04:06'),
(34, 500, 14, 'Laborar bajo la influencia del alcohol y/o drogas', 0, '2021-10-23 15:04:06'),
(35, 500, 15, 'Uso indebido del Equipo (maquinas o herramientas)', 0, '2021-10-23 15:04:06'),
(36, 500, 16, 'Trabajar bajo carga suspendida', 0, '2021-10-23 15:04:06'),
(37, 500, 17, 'Realiza la tarea sin cumplir con el PETS.', 0, '2021-10-23 15:04:06'),
(38, 500, 18, 'No cumple con los controles establecidos en el IPERC.', 0, '2021-10-23 15:04:06'),
(39, 500, 19, 'No se cuenta con el acta de charla 5 minutos', 0, '2021-10-23 15:04:06'),
(40, 500, 20, 'No cumple con los controles establecidos en la charla 5 minutos', 0, '2021-10-23 15:04:06'),
(41, 500, 21, 'No existe supervisión o ineficiente supervisión', 0, '2021-10-23 15:04:06'),
(42, 500, 22, 'Escala o ascender estructuras defectuosas', 0, '2021-11-06 17:56:27'),
(43, 500, 23, 'Licencia de conducir no adecuada para el vehiculo', 0, '2021-11-06 17:56:27'),
(44, 500, 24, 'Licencia de conducir vencida', 0, '2021-11-06 17:59:26'),
(45, 500, 25, 'Soat vencido ', 0, '2021-11-06 17:59:26'),
(46, 500, 26, 'Iniciar actividades sin pasar controles iniciales de SSTMA', 0, '2021-11-06 18:01:08'),
(47, 500, 27, 'No contar con SCTR y/o Seguro Vida Ley', 0, '2021-11-06 18:01:08'),
(48, 500, 28, 'Transporte de personal sobrepasa el límite maximo de capacidad y/o en la tolva', 0, '2021-11-06 18:01:08'),
(49, 500, 29, 'No utilizar implementos de bioseguridad (Mascarilla, distanciamiento, alcohol en gel)', 0, '2021-11-06 18:09:55'),
(50, 500, 30, 'No contar con Orden de Trabajo', 0, '2021-11-06 18:09:55'),
(51, 500, 31, 'Orden trabajo no corresponde con la actividad realizada en campo', 0, '2021-11-06 18:09:55'),
(52, 500, 32, 'EMO vencidos y/o no los evidencian', 0, '2021-11-06 18:09:55'),
(53, 500, 33, 'No evidenciar registro de ficha de sintomatología de COVID-19', 0, '2021-11-06 18:09:55'),
(54, 500, 34, 'No contar con fotocheck de identificación en el lugar de trabajo', 0, '2021-11-06 18:09:55'),
(55, 500, 35, 'Estructuras en mal estado ', 0, '2021-11-06 18:09:55'),
(56, 500, 36, 'Guardas o Barreras Inadecuadas', 0, '2021-11-06 18:09:55'),
(57, 500, 37, 'No cuenta o mal estado de los equipos de protección', 0, '2021-11-06 18:09:55'),
(58, 500, 38, 'Equipo de protección Inadecuado', 0, '2021-11-06 18:09:55'),
(59, 500, 39, 'Herramientas, Equipo o Materiales defectuosos', 0, '2021-11-06 18:09:55'),
(60, 500, 40, 'Espacios reducidos', 0, '2021-11-06 18:09:55'),
(61, 500, 41, 'Sistema de Advertencia - Señalizaciòn Inadecuada', 0, '2021-11-06 18:09:55'),
(62, 500, 42, 'Peligros de Incendio y Explosión', 0, '2021-11-06 18:09:55'),
(63, 500, 43, 'Orden y Limpieza deficientes/ Desorden', 0, '2021-11-06 18:09:55'),
(64, 500, 44, 'Exposición al Ruido', 0, '2021-11-06 18:09:55'),
(65, 500, 45, 'Exposición a la Radiación', 0, '2021-11-06 18:09:55'),
(66, 500, 46, 'Temperaturas Extremas', 0, '2021-11-06 18:09:55'),
(67, 500, 47, 'Iluminación Deficiente', 0, '2021-11-06 18:09:55'),
(68, 500, 48, 'Ventilación Inadecuada', 0, '2021-11-06 18:09:55'),
(69, 500, 49, 'Condiciones Ambientales Peligrosas', 0, '2021-11-06 18:09:55'),
(70, 500, 50, 'Infraestructuras eléctricas en mal estado', 0, '2021-11-06 18:09:55'),
(71, 500, 51, 'Tener EPP defectuoso o no contar con EPP', 0, '2021-11-06 18:09:55'),
(72, 500, 52, 'Extintor defectuoso o vencido ', 0, '2021-11-06 18:09:55'),
(73, 500, 53, 'Auscencia de extintor', 0, '2021-11-06 18:09:55'),
(74, 500, 54, 'Botiquín incompleto y/o medicamentos vencidos', 0, '2021-11-06 18:09:55'),
(75, 500, 55, 'Ausencia de botiquín ', 0, '2021-11-06 18:09:55'),
(76, 500, 56, 'No cumplir con las 5 Reglas de Oro', 0, '2021-11-06 18:09:55'),
(77, 500, 57, 'Caminos, accesos inadecuadas', 0, '2021-11-06 18:09:55'),
(78, 500, 58, 'Líneas, redes, equipos incumpliendo DMS.', 0, '2021-11-06 18:09:55'),
(79, 500, 59, 'Otros (especificar) - Luces de emergencia, camilla, soat de uso particular, no tiene tarjeta de propiedad, carece de cable corriente, fundido', 0, '2021-11-06 18:09:55'),
(80, 500, 60, 'Revisión técnica vehícular vencida', 0, '2021-11-06 18:09:55'),
(81, 500, 61, 'Instalaciones no cuentan con licencia de funcionamiento', 0, '2021-11-06 18:09:55'),
(82, 500, 62, 'Instalaciones no cuentan con certificado de defensa civil', 0, '2021-11-06 18:09:55'),
(83, 500, 63, 'Instalaciones no cuentan con certificado de saneamiento ambiental (Fumigación, desinfección, desinsectación, desratización y limpieza de reservoriso de agua) o se encuentran vencido', 0, '2021-11-06 18:09:55'),
(84, 500, 64, 'Sillas, mesas y/o escritorios No ergonómicas', 0, '2021-11-06 18:09:55'),
(85, 500, 65, 'Fuga de hidrocarburos y derivados en el suelo.', 0, '2021-11-06 18:09:55'),
(86, 500, 66, 'No se cuenta con contenedores de residuos sólidos, mala segregación o estan saturados', 0, '2021-11-06 18:09:55'),
(87, 500, 67, 'No cuenta con jabón líquido desinfectante y/o  alcohol u otros insumos sanitarios', 0, '2021-11-06 18:09:55'),
(88, 500, 68, 'Falta de agua para beber y/o lavarse', 0, '2021-11-06 18:09:55'),
(89, 500, 69, 'Elementos de señalización en mal estado', 0, '2021-11-06 18:09:55'),
(90, 500, 70, 'Ausencia de implementos de bioseguridad  (Mascarilla, distanciamiento, alcohol en gel, etc)', 0, '2021-11-06 18:09:55'),
(91, 500, 71, 'Brazo hidráulico / grúa no cuenta con certificado de operatividad o dicho certificado no se encuentra vigente', 0, '2021-11-06 18:09:55'),
(92, 500, 72, 'OTROS (Documentos PETS E IPERC) no cuenta con documentos de seguridad, Plan de contigencia,', 0, '2021-11-06 18:09:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cumplimiento`
--

CREATE TABLE `cumplimiento` (
  `nId` int(11) NOT NULL,
  `nIdTarea` int(11) DEFAULT NULL,
  `cCodigo` varchar(6) NOT NULL,
  `cNombre` varchar(520) NOT NULL,
  `nTipo` int(11) DEFAULT NULL,
  `nOrden` int(11) DEFAULT NULL,
  `nModelo` int(11) DEFAULT 0,
  `nFlag` int(11) DEFAULT 0,
  `nEstado` int(11) DEFAULT 1,
  `dCreate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cumplimiento`
--

INSERT INTO `cumplimiento` (`nId`, `nIdTarea`, `cCodigo`, `cNombre`, `nTipo`, `nOrden`, `nModelo`, `nFlag`, `nEstado`, `dCreate`) VALUES
(1, 1, 'EPP', 'EQUIPO DE PROTECCIÓN (PERSONAL Y/O COLECTIVO)', 100, 1, 0, 0, 1, '2021-06-27 03:17:12'),
(2, 1, 'SE', 'SEÑALIZACIÓN Y DELIMITACIÓN', 100, 2, 0, 0, 1, '2021-06-27 03:21:06'),
(3, 1, 'UM', 'UNIDADES MÓVILES', 100, 3, 0, 0, 1, '2021-06-27 03:22:28'),
(4, 1, 'DOC', 'DOCUMENTACION DE SEGURIDAD', 100, 4, 0, 0, 1, '2021-06-27 03:26:13'),
(5, 1, 'CP', 'CUMPLIMIENTO DE PROCEDIMIENTO DE TRABAJO SEGURO', 100, 5, 0, 0, 1, '2021-06-27 03:27:51'),
(6, 1, 'CS', 'CONDICIONES DE SEGURIDAD', 100, 6, 0, 0, 1, '2021-06-27 03:29:19'),
(7, 1, '', 'CONCLUSIONES, RECOMENDACIONES Y ACCIONES CORRECTIVAS', 200, 7, 0, 0, 1, '2021-06-27 03:29:45'),
(8, 1, '', 'MEDIDAS DE CONTROL', 300, 8, 0, 0, 1, '2021-06-27 03:30:29'),
(9, 1, '', 'DATOS DE OBRA', 400, 9, 0, 0, 1, '2021-06-27 20:30:30'),
(10, 1, '', 'TRABAJADORES SUPERVISADOS', 0, 10, 1, 0, 1, '2021-06-29 05:35:20'),
(11, 1, '', 'UNIDADES MOVILES SUPERVISADAS', NULL, 11, 1, 0, 1, '2021-06-29 05:37:11'),
(12, 2, 'IV', 'ILUMINACION Y VENTILACION', 100, 1, 0, 0, 1, '2021-09-10 11:43:58'),
(13, 2, 'OL', 'ORDEN Y LIMPIEZA', 100, 2, 0, 0, 1, '2021-09-10 12:01:31'),
(14, 2, 'SH', 'SERVICION HIGIENICOS', 100, 3, 0, 0, 1, '2021-09-10 12:01:34'),
(15, 2, 'SS', 'SEÑALES DE SEGURIDAD', 100, 4, 0, 0, 1, '2021-09-10 12:01:36'),
(16, 2, 'EE', 'EQUIPOS DE EMERGENCIA', 100, 5, 0, 0, 1, '2021-09-10 12:01:39'),
(17, 2, 'CS', 'CONDICIONES DE SEGURIDAD', 100, 6, 0, 0, 1, '2021-09-10 12:01:41'),
(18, 2, '', 'CONCLUSIONES, RECOMENDACIONES Y ACCIONES CORRECTIVAS', 200, 7, 0, 0, 1, '2021-09-10 12:01:43'),
(19, 2, '', 'MEDIDAS DE CONTROL', 300, 8, 0, 0, 1, '2021-09-10 12:01:46'),
(20, 2, '', 'TRABAJADORES', 0, 9, 1, 0, 1, '2021-09-11 17:34:45'),
(21, 1, '', 'DOCUMENTOS ACTAS', 0, 100, 0, 2, 1, '2021-11-28 03:29:28'),
(22, 3, 'ANT', 'ANTECEDENTES DE LA EMPRESA Y DE LA OBRA Y/O SERVICO ', 300, 1, 0, 0, 1, '2021-12-11 03:59:16'),
(23, 3, 'REC', 'RECOMENDACIONES', 300, 2, 0, 0, 1, '2021-12-11 04:00:30'),
(24, 3, '', 'VISTAS FOTOGRAFICAS.', 300, 3, 2, 0, 1, '2021-12-11 04:02:19'),
(25, 3, '', 'REGISTRO DE PERSONAL ASISTENTE A CHARLA', 0, 4, 1, 0, 1, '2021-12-11 06:08:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `nId` int(11) NOT NULL,
  `cNombre` varchar(250) NOT NULL,
  `cRazonSocial` varchar(500) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `nTipo` int(11) DEFAULT 0,
  `dCreate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`nId`, `cNombre`, `cRazonSocial`, `nFlag`, `nTipo`, `dCreate`) VALUES
(1, 'CONSORCIO NORTE', 'Ejecución y supervisión de obras eléctricas,electromecánicas, civiles, minería, e industrial. Especialistas de gestión de seguridad, salud en el trabajo, calidad y medio ambiente.', 0, 1, '2021-06-26 02:51:10'),
(2, 'CONSTRUCTORA SOBERON EIRL', 'CONSTRUCTORA SOBERON EIRL', 0, 0, '2021-06-26 17:04:31'),
(5, 'OBRITEC SAC', 'OBRITEC SAC', 0, 0, '2021-09-04 18:58:26'),
(6, 'CONSORCIO AMAZONAS', 'CONSORCIO AMAZONAS', 0, 0, '2021-09-04 22:42:47'),
(8, 'ELECTRONORTE S.A.', 'ELECTRONORTE S.A.', 0, 0, '2021-09-20 20:54:18'),
(9, 'SERVICIO SANTA GABRIELA SAC', 'SERVICIO SANTA GABRIELA SAC', 0, 0, '2021-10-04 14:29:10'),
(10, 'TDEM SRL', 'Tecnología, Desarrollo y Medición SRL', 0, 0, '2021-10-29 19:16:39'),
(11, 'R&M CORPORACION SIERRA SAC', 'R&M CORPORACION SIERRA SAC', 0, 0, '2021-11-08 07:03:16'),
(12, 'T&D CORPORATION SAC', 'T&D CORPORATION SAC', 0, 0, '2021-11-09 23:11:29'),
(13, 'CONSORCIO SESGA REYSER', 'CONSORCIO SESGA REYSER', 0, 0, '2021-11-15 15:29:51'),
(14, 'GESCOM SOLUCIONES INTELIGENTES', 'GESCOM SOLUCIONES INTELIGENTES', 0, 0, '2021-11-16 15:23:01'),
(15, 'CONSORCIO ELECTRICO BAMBAMARCA', 'CONSORCIO ELECTRICO BAMBAMARCA', 0, 0, '2021-11-19 16:48:51'),
(16, 'CONSORCIO ELECTRO OUTSOURCING ', 'CONSORCIO ELECTRO OUTSOURCING S.A.C.', 0, 0, '2021-11-19 17:32:28'),
(17, 'JASA CONTRATISTAS Y SERVICIOS ', 'JASA CONTRATISTAS Y SERVICIOS ', 0, 0, '2021-11-20 15:51:29'),
(18, 'CONSORCIO ELÉCTRICO DE VILLACU', 'COELVISAC', 0, 0, '2021-12-09 19:17:23'),
(19, 'CONSORCIO ELÉCTRICO DE VILLACU', 'COELVISAC', 0, 0, '2021-12-09 19:18:12'),
(20, 'DAYRO CONTRATISTAS GENERALES S.R.L', 'DAYRO CONTRATISTAS GENERALES S.R.L', 0, 0, '2022-01-24 11:45:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_cargo`
--

CREATE TABLE `empresa_cargo` (
  `nId` int(11) NOT NULL,
  `nIdEmpresa` int(11) DEFAULT NULL,
  `cCargo` varchar(250) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa_cargo`
--

INSERT INTO `empresa_cargo` (`nId`, `nIdEmpresa`, `cCargo`, `nFlag`) VALUES
(1, 1, 'INGENIERO SUPERVISOR DE SEGURIDAD', 0),
(2, 2, 'TECNICO CONDUCTOR', 0),
(3, 2, 'TECNICO', 0),
(16, 1, 'TECNICO ELECTRICISTA', 0),
(17, 1, 'SUPERVISOR', 1),
(24, 1, 'CONDUCTOR', 0),
(30, 6, 'NUEVO CARGO', 0),
(31, 6, 'TECNICO ELECTRICISTA', 0),
(32, 1, 'TECNICO ELECTRICISTA', 0),
(33, 6, 'INGENIERO DE SEGURIDAD', 0),
(34, 1, 'CONDUCTOR', 0),
(35, 6, 'CONDUCTOR', 0),
(36, 6, 'ANALISTA', 0),
(37, 8, 'INGENIERO', 0),
(38, 1, 'LICENCIADO', 0),
(39, 8, 'TECNICO ELECTRICISTA', 0),
(40, 2, 'qweew', 0),
(41, 5, 'ppppp', 0),
(42, 2, 'YYYYYYYYYYYY', 0),
(43, 2, 'nuevo cargo x5', 0),
(44, 5, 'RESPONSABLE', 0),
(45, 9, 'TECNICO', 0),
(46, 6, 'SUPERVISOR DE SERVICIO', 0),
(47, 6, 'Desarrollador', 0),
(48, 10, 'Técnico de Inspección', 0),
(49, 9, 'SUPERVISOR DE SEGURIDAD', 0),
(50, 11, 'CAJERA', 0),
(51, 12, 'SUPERVISOR DE DISTRIBUCIÓN', 0),
(52, 5, 'NUEVO CARGO', 0),
(53, 11, 'Asistente de QA', 0),
(54, 8, 'TECNICO LINEAS ENERGIZADAS', 0),
(55, 13, 'INGENIERO RESPONSABLE', 0),
(56, 13, 'INGENIERO RESONSABLE', 0),
(57, 13, 'TECNICO ELECTRICISTA', 0),
(58, 13, 'OPERADOR DE GRÚA', 0),
(59, 13, 'TECNICO APOYO', 0),
(60, 13, 'SUPERVISOR DE SEGURIDAD', 0),
(61, 13, 'SUPERVISOR DE SERVICIO', 0),
(62, 14, 'RESPONSABLE', 0),
(63, 14, 'ENCARGADO DE MANTENIMIENTO', 0),
(64, 14, 'EJECUTIVO COMERCIAL', 0),
(65, 14, 'PERSONAL DE SEGURIDAD', 0),
(66, 8, 'OPERADOR', 0),
(67, 8, 'RESPONSABLE', 0),
(68, 5, 'TECNICO ELECTRICISTA', 0),
(69, 5, 'AYUDANTE', 0),
(70, 12, 'RESPONSABLE', 0),
(71, 12, 'TECNICO ELECTRICISTA', 0),
(72, 15, 'RESPONSABLE', 0),
(73, 16, 'SUPERVISOR DE SEGURIDAD', 0),
(74, 16, 'TECNICO ELECTRICISTA', 0),
(75, 8, 'SUPERVISOR', 0),
(76, 13, 'CONDUCTOR', 0),
(77, 13, 'ASISTENTE DE SUPERVISIÓN', 0),
(78, 17, 'TECNICO', 0),
(79, 17, 'TECNICO', 0),
(80, 17, 'CONDUCTOR', 0),
(81, 17, 'TECNICO ELECTRICISTA', 0),
(82, 15, 'OPERADOR PATIO DE LLAVES', 0),
(83, 19, 'SUPERVISOR DE SEGURIDAD', 0),
(84, 19, 'GERENTE INGENIERIA', 0),
(85, 19, 'SUPERVISOR INSTALACIONES', 0),
(86, 19, 'GERENTE GENERAL ', 0),
(87, 19, 'TECNICO', 0),
(88, 20, 'RESIDENTE DE OBRA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_cargo_trabajador`
--

CREATE TABLE `empresa_cargo_trabajador` (
  `nId` int(11) NOT NULL,
  `nIdEmpresa_Cargo` int(11) DEFAULT NULL,
  `nIdPersona` int(11) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dCese` datetime DEFAULT current_timestamp(),
  `dRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa_cargo_trabajador`
--

INSERT INTO `empresa_cargo_trabajador` (`nId`, `nIdEmpresa_Cargo`, `nIdPersona`, `nFlag`, `dCese`, `dRegistro`) VALUES
(1, 2, 2, 0, '2021-06-29 05:24:35', '2021-06-29 05:24:35'),
(2, 3, 8, 0, '2021-06-29 05:24:50', '2021-06-29 05:24:50'),
(3, 16, 11, 0, '2021-07-21 21:14:28', '2021-07-21 21:14:28'),
(4, 30, 3, 0, '2021-09-18 17:00:17', '2021-09-18 17:00:17'),
(5, 31, 35, 0, '2021-09-18 18:17:00', '2021-09-18 18:17:00'),
(6, 35, 37, 0, '2021-09-20 18:28:57', '2021-09-20 18:28:57'),
(7, 35, 37, 0, '2021-09-20 18:30:26', '2021-09-20 18:30:26'),
(8, 36, 39, 0, '2021-09-20 20:36:30', '2021-09-20 20:36:30'),
(9, 37, 18, 0, '2021-09-20 20:58:28', '2021-09-20 20:58:28'),
(10, 39, 43, 0, '2021-09-22 02:12:16', '2021-09-22 02:12:16'),
(11, 43, 52, 0, '2021-10-01 19:14:05', '2021-10-01 19:14:05'),
(12, 35, 56, 0, '2021-10-07 16:22:02', '2021-10-07 16:22:02'),
(13, 47, 57, 0, '2021-10-12 23:45:24', '2021-10-12 23:45:24'),
(14, 31, 58, 0, '2021-10-22 22:07:37', '2021-10-22 22:07:37'),
(15, 30, 59, 0, '2021-10-23 14:13:48', '2021-10-23 14:13:48'),
(16, 45, 60, 0, '2021-10-25 00:18:11', '2021-10-25 00:18:11'),
(17, 48, 63, 0, '2021-11-08 02:16:51', '2021-11-08 02:16:51'),
(18, 51, 66, 0, '2021-11-10 09:51:20', '2021-11-10 09:51:20'),
(19, 52, 67, 0, '2021-11-10 09:51:20', '2021-11-10 09:51:20'),
(20, 53, 68, 0, '2021-11-10 10:22:26', '2021-11-10 10:22:26'),
(21, 54, 70, 0, '2021-11-10 22:38:24', '2021-11-10 22:38:24'),
(22, 57, 73, 0, '2021-11-16 07:07:14', '2021-11-16 07:07:14'),
(23, 57, 74, 0, '2021-11-16 07:12:47', '2021-11-16 07:12:47'),
(24, 57, 75, 0, '2021-11-16 07:15:07', '2021-11-16 07:15:07'),
(25, 57, 76, 0, '2021-11-16 07:16:00', '2021-11-16 07:16:00'),
(26, 57, 77, 0, '2021-11-16 07:16:30', '2021-11-16 07:16:30'),
(27, 57, 78, 0, '2021-11-16 07:17:01', '2021-11-16 07:17:01'),
(28, 58, 79, 0, '2021-11-16 07:17:49', '2021-11-16 07:17:49'),
(29, 59, 80, 0, '2021-11-16 07:18:28', '2021-11-16 07:18:28'),
(30, 60, 81, 0, '2021-11-16 07:19:06', '2021-11-16 07:19:06'),
(31, 61, 82, 0, '2021-11-16 07:19:44', '2021-11-16 07:19:44'),
(32, 63, 84, 0, '2021-11-16 19:49:18', '2021-11-16 19:49:18'),
(33, 64, 85, 0, '2021-11-16 19:49:47', '2021-11-16 19:49:47'),
(34, 65, 86, 0, '2021-11-16 19:50:21', '2021-11-16 19:50:21'),
(35, 66, 88, 0, '2021-11-17 00:06:40', '2021-11-17 00:06:40'),
(36, 31, 90, 0, '2021-11-17 11:33:49', '2021-11-17 11:33:49'),
(37, 31, 91, 0, '2021-11-17 11:42:07', '2021-11-17 11:42:07'),
(38, 31, 92, 0, '2021-11-17 11:42:38', '2021-11-17 11:42:38'),
(39, 31, 93, 0, '2021-11-17 11:43:04', '2021-11-17 11:43:04'),
(40, 31, 94, 0, '2021-11-17 11:43:30', '2021-11-17 11:43:30'),
(41, 31, 95, 0, '2021-11-17 11:44:04', '2021-11-17 11:44:04'),
(42, 35, 96, 0, '2021-11-17 11:44:48', '2021-11-17 11:44:48'),
(43, 31, 97, 0, '2021-11-17 11:45:23', '2021-11-17 11:45:23'),
(44, 31, 98, 0, '2021-11-17 11:45:54', '2021-11-17 11:45:54'),
(45, 35, 99, 0, '2021-11-17 11:46:31', '2021-11-17 11:46:31'),
(46, 31, 100, 0, '2021-11-17 11:47:01', '2021-11-17 11:47:01'),
(47, 39, 101, 0, '2021-11-17 13:13:56', '2021-11-17 13:13:56'),
(48, 68, 103, 0, '2021-11-17 22:05:06', '2021-11-17 22:05:06'),
(49, 69, 104, 0, '2021-11-17 22:06:20', '2021-11-17 22:06:20'),
(50, 69, 105, 0, '2021-11-17 22:06:53', '2021-11-17 22:06:53'),
(51, 69, 106, 0, '2021-11-17 22:06:57', '2021-11-17 22:06:57'),
(52, 69, 107, 0, '2021-11-17 22:07:31', '2021-11-17 22:07:31'),
(53, 69, 108, 0, '2021-11-17 22:08:07', '2021-11-17 22:08:07'),
(54, 69, 109, 0, '2021-11-17 22:08:31', '2021-11-17 22:08:31'),
(55, 69, 110, 0, '2021-11-17 22:10:56', '2021-11-17 22:10:56'),
(56, 68, 111, 0, '2021-11-17 23:01:55', '2021-11-17 23:01:55'),
(57, 69, 112, 0, '2021-11-17 23:02:21', '2021-11-17 23:02:21'),
(58, 69, 113, 0, '2021-11-17 23:02:47', '2021-11-17 23:02:47'),
(59, 69, 114, 0, '2021-11-17 23:02:50', '2021-11-17 23:02:50'),
(60, 71, 115, 0, '2021-11-17 23:38:05', '2021-11-17 23:38:05'),
(61, 72, 117, 0, '2021-11-19 17:02:33', '2021-11-19 17:02:33'),
(62, 74, 119, 0, '2021-11-19 18:20:23', '2021-11-19 18:20:23'),
(63, 74, 120, 0, '2021-11-19 18:20:58', '2021-11-19 18:20:58'),
(64, 39, 122, 0, '2021-11-19 20:14:03', '2021-11-19 20:14:03'),
(65, 39, 123, 0, '2021-11-19 20:14:26', '2021-11-19 20:14:26'),
(66, 39, 124, 0, '2021-11-19 20:14:59', '2021-11-19 20:14:59'),
(67, 39, 125, 0, '2021-11-19 20:15:07', '2021-11-19 20:15:07'),
(68, 75, 126, 0, '2021-11-19 20:15:38', '2021-11-19 20:15:38'),
(69, 57, 127, 0, '2021-11-20 15:25:59', '2021-11-20 15:25:59'),
(70, 57, 128, 0, '2021-11-20 15:26:23', '2021-11-20 15:26:23'),
(71, 76, 129, 0, '2021-11-20 15:27:00', '2021-11-20 15:27:00'),
(72, 57, 130, 0, '2021-11-20 15:27:37', '2021-11-20 15:27:37'),
(73, 57, 131, 0, '2021-11-20 15:28:01', '2021-11-20 15:28:01'),
(74, 57, 132, 0, '2021-11-20 15:28:24', '2021-11-20 15:28:24'),
(75, 58, 133, 0, '2021-11-20 15:29:07', '2021-11-20 15:29:07'),
(76, 60, 134, 0, '2021-11-20 15:29:35', '2021-11-20 15:29:35'),
(77, 61, 135, 0, '2021-11-20 15:32:41', '2021-11-20 15:32:41'),
(78, 59, 136, 0, '2021-11-20 15:33:29', '2021-11-20 15:33:29'),
(79, 57, 137, 0, '2021-11-20 15:34:04', '2021-11-20 15:34:04'),
(80, 77, 138, 0, '2021-11-20 15:35:18', '2021-11-20 15:35:18'),
(81, 59, 139, 0, '2021-11-20 15:35:52', '2021-11-20 15:35:52'),
(82, 80, 141, 0, '2021-11-20 16:13:56', '2021-11-20 16:13:56'),
(83, 81, 142, 0, '2021-11-20 16:14:26', '2021-11-20 16:14:26'),
(84, 82, 144, 0, '2021-11-22 16:58:54', '2021-11-22 16:58:54'),
(85, 39, 146, 0, '2021-11-24 07:24:07', '2021-11-24 07:24:07'),
(86, 39, 147, 0, '2021-11-24 07:24:34', '2021-11-24 07:24:34'),
(87, 75, 148, 0, '2021-11-24 07:25:01', '2021-11-24 07:25:01'),
(88, 39, 150, 0, '2021-12-06 20:47:32', '2021-12-06 20:47:32'),
(89, 84, 152, 0, '2021-12-09 20:29:08', '2021-12-09 20:29:08'),
(90, 85, 153, 0, '2021-12-09 20:31:11', '2021-12-09 20:31:11'),
(91, 86, 154, 0, '2021-12-09 20:32:12', '2021-12-09 20:32:12'),
(92, 87, 155, 0, '2021-12-09 20:32:48', '2021-12-09 20:32:48'),
(93, 87, 156, 0, '2021-12-09 20:33:34', '2021-12-09 20:33:34'),
(94, 39, 158, 0, '2021-12-15 12:09:13', '2021-12-15 12:09:13'),
(95, 39, 159, 0, '2021-12-15 12:09:47', '2021-12-15 12:09:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_normas`
--

CREATE TABLE `empresa_normas` (
  `nId` int(11) NOT NULL,
  `nIdEmpresa` int(11) NOT NULL,
  `cDescripcion` varchar(250) DEFAULT NULL,
  `nTipo` int(11) DEFAULT 0,
  `nFlag` int(11) DEFAULT 0,
  `dRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa_normas`
--

INSERT INTO `empresa_normas` (`nId`, `nIdEmpresa`, `cDescripcion`, `nTipo`, `nFlag`, `dRegistro`) VALUES
(1, 1, 'UNIFORME DE TRABAJO', 0, 0, '2021-06-29 05:20:16'),
(2, 1, 'PAPELETA', 1, 0, '2021-06-29 17:28:55'),
(3, 1, 'CRITERIO DE INSPECCIÓN', 2, 0, '2021-07-11 15:37:06'),
(4, 1, 'FOTOCHECK', 0, 0, '2021-11-08 01:41:23'),
(5, 1, 'CASCO DIELECTRICO		', 0, 0, '2021-11-08 01:46:11'),
(6, 1, 'Lentes de Seguridad', 0, 0, '2021-11-08 01:47:41'),
(7, 1, 'Pantalla de Protección Fácial', 0, 0, '2021-11-08 01:48:57'),
(8, 1, 'Protección buconasaL', 0, 0, '2021-11-08 01:50:26'),
(9, 1, 'Guantes de hilo', 0, 0, '2021-11-08 01:50:26'),
(10, 1, 'Guantes de jebe (nitrilo o neoprene)', 0, 0, '2021-11-08 01:53:47'),
(11, 1, 'Guantes dieectricos', 0, 0, '2021-11-08 01:53:47'),
(12, 1, 'Sobreguantes', 0, 0, '2021-11-08 01:54:27'),
(13, 1, 'Calzado dielectrico', 0, 0, '2021-11-08 01:54:27'),
(14, 1, 'Botas de Jebe', 0, 0, '2021-11-08 01:55:10'),
(15, 1, 'Chalecos con cintas reflectivas', 0, 0, '2021-11-08 01:55:50'),
(16, 1, 'Chalecos con cintas reflectivas', 0, 0, '2021-11-08 01:55:50'),
(17, 1, 'Orden de trabajo', 0, 0, '2021-11-08 01:57:25'),
(18, 1, 'Pasos', 0, 0, '2021-11-08 01:57:25'),
(19, 1, 'Escaleras', 0, 0, '2021-11-08 01:57:50'),
(20, 1, 'Herramientas aisladas', 0, 0, '2021-11-08 01:59:32'),
(21, 1, 'Unidades móviles - Camión grúa con brazo hidráulico', 1, 0, '2021-11-08 01:59:32'),
(22, 1, 'Señalización', 1, 0, '2021-11-08 02:01:10'),
(23, 1, 'Charla de  minutos', 0, 0, '2021-11-08 02:01:10'),
(24, 1, 'Boletas de seguridad', 0, 0, '2021-11-08 02:01:10'),
(25, 1, 'Procedimiento Escrito de Trabajo Seguro (PETS) y Análisis de Trabajo Seguro (ATS)', 0, 0, '2021-11-08 02:01:10'),
(26, 1, 'SCTR Salud, SCTR Pensiones', 0, 0, '2021-11-08 02:02:28'),
(27, 1, 'Condiciones de Seguridad.', 0, 0, '2021-11-08 02:02:28'),
(28, 1, '-', 0, 0, '2021-11-16 07:21:13'),
(29, 1, '-', 1, 0, '2021-11-16 07:37:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_normas_observacion`
--

CREATE TABLE `empresa_normas_observacion` (
  `nId` int(11) NOT NULL,
  `nId_empresa_norma` int(11) DEFAULT NULL,
  `cValor` varchar(4) DEFAULT NULL,
  `cObservacion` varchar(500) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa_normas_observacion`
--

INSERT INTO `empresa_normas_observacion` (`nId`, `nId_empresa_norma`, `cValor`, `cObservacion`, `nFlag`, `dRegistro`) VALUES
(1, 1, 'M1', 'No Tiene', 0, '2021-06-29 05:42:36'),
(2, 1, 'M2', 'En mal estado', 0, '2021-06-29 17:45:28'),
(4, 1, 'M3', 'No usa, no usa adecuadamente', 0, '2021-07-21 21:12:18'),
(5, 4, 'A1', 'No tiene, No usa', 0, '2021-07-21 21:12:35'),
(10, 4, 'A2', 'En mal estado', 0, '2021-11-08 01:43:52'),
(11, 4, 'A3', 'Vencido', 0, '2021-11-08 01:45:32'),
(12, 5, 'B1', 'No tiene casco', 0, '2021-11-08 01:46:54'),
(13, 5, 'B2', 'Casco en mal estado', 0, '2021-11-08 01:46:54'),
(14, 5, 'B3', 'Tafilete roto', 0, '2021-11-08 01:46:54'),
(15, 5, 'B4', 'Casco no normado', 0, '2021-11-08 01:46:54'),
(16, 5, 'B5', 'No tiene barbiquejo o en mal estado', 0, '2021-11-08 01:46:54'),
(17, 5, 'B6', 'No usa, no usa adecuadamente', 0, '2021-11-08 01:46:54'),
(18, 6, 'C1', 'No tiene', 0, '2021-11-08 01:48:08'),
(19, 6, 'C2', 'En mal estado', 0, '2021-11-08 01:48:08'),
(20, 6, 'C3', 'No normado', 0, '2021-11-08 01:48:08'),
(21, 6, 'C4', 'No usa, no usa adecuadamente', 0, '2021-11-08 01:48:08'),
(22, 7, 'E1', 'No tiene', 0, '2021-11-08 01:49:23'),
(23, 7, 'E2', 'En mal estado', 0, '2021-11-08 01:49:23'),
(24, 7, 'E3', 'No adecuada', 0, '2021-11-08 01:49:23'),
(25, 7, 'E4', 'No usa, no usa adecuadamente', 0, '2021-11-08 01:49:23'),
(26, 8, 'F1', 'No tiene', 0, '2021-11-08 01:51:06'),
(27, 8, 'F2', 'En mal estado', 0, '2021-11-08 01:51:06'),
(28, 8, 'F3', 'No adecuada', 0, '2021-11-08 01:51:06'),
(29, 8, 'F4', 'No usa, no usa adecuadamente', 0, '2021-11-08 01:51:06'),
(30, 9, 'G1', 'No tiene', 0, '2021-11-08 01:51:41'),
(31, 9, 'G2', 'En mal estado', 0, '2021-11-08 01:51:41'),
(32, 9, 'G3', 'No usa, no usa adecuadamente', 0, '2021-11-08 01:51:41'),
(33, 10, 'H1', 'No tiene', 0, '2021-11-08 02:05:13'),
(34, 10, 'H2', 'En mal estado', 0, '2021-11-08 02:05:13'),
(35, 10, 'H3', 'No usa, no usa adecuadamente', 0, '2021-11-08 02:05:13'),
(36, 11, 'I1', 'No tiene', 0, '2021-11-08 02:05:13'),
(37, 11, 'I2', 'En mal estado', 0, '2021-11-08 02:05:13'),
(38, 11, 'I3', 'No usa, no usa adecuadamente', 0, '2021-11-08 02:05:13'),
(39, 12, 'J1', 'No tiene', 0, '2021-11-08 02:05:13'),
(40, 12, 'J2', 'En mal estado', 0, '2021-11-08 02:05:13'),
(41, 12, 'J3', 'No usa, no usa adecuadamente', 0, '2021-11-08 02:05:13'),
(42, 13, 'K1', 'No tiene', 0, '2021-11-08 02:05:13'),
(43, 13, 'K2', 'En mal estado', 0, '2021-11-08 02:05:13'),
(44, 13, 'K3', 'No normado', 0, '2021-11-08 02:05:13'),
(45, 14, 'L1', 'No tiene', 0, '2021-11-08 02:05:13'),
(46, 14, 'L2', 'En mal estado', 0, '2021-11-08 02:05:13'),
(47, 14, 'L3', 'No usa, no usa adecuadamente', 0, '2021-11-08 02:05:13'),
(48, 15, 'N1', 'No tiene', 0, '2021-11-08 02:06:12'),
(49, 15, 'N2', 'En mal estado', 0, '2021-11-08 02:06:12'),
(50, 15, 'N3', 'No usa', 0, '2021-11-08 02:06:12'),
(51, 16, '01', 'No tiene', 0, '2021-11-08 02:06:12'),
(52, 16, '02', 'En mal estado', 0, '2021-11-08 02:06:12'),
(53, 16, '03', 'No normado', 0, '2021-11-08 02:06:12'),
(54, 16, '04', 'Falta faja de anclaje', 0, '2021-11-08 02:06:12'),
(55, 16, '05', 'Falta linea de vida', 0, '2021-11-08 02:06:12'),
(56, 16, '06', 'No usa, no usa adecuadamente', 0, '2021-11-08 02:06:12'),
(57, 16, '07', 'No adecuado', 0, '2021-11-08 02:06:12'),
(58, 17, 'P1', 'No tiene', 0, '2021-11-08 02:06:12'),
(59, 17, 'P2', 'No firmadas por responsables', 0, '2021-11-08 02:06:12'),
(60, 17, 'P3', 'No incluye a personal participante', 0, '2021-11-08 02:06:12'),
(61, 17, 'P4', 'No especifica actividad a realizar', 0, '2021-11-08 02:06:12'),
(62, 18, 'Q1', 'No tiene', 0, '2021-11-08 02:06:12'),
(63, 18, 'Q2', 'En mal estado', 0, '2021-11-08 02:06:12'),
(64, 19, 'R1', 'En mal estado', 0, '2021-11-08 02:06:12'),
(65, 19, 'R2', 'Sin Jebes antideslizantes', 0, '2021-11-08 02:06:12'),
(66, 19, 'R3', 'No contar con escalera telescócipa', 0, '2021-11-08 02:06:12'),
(67, 19, 'R4', 'No Contar con escalera embonable', 0, '2021-11-08 02:06:12'),
(68, 20, 'S1', 'No tiene o Kit incompleto', 0, '2021-11-08 02:06:12'),
(69, 20, 'S2', 'En mal estado o sin aislamiento', 0, '2021-11-08 02:06:12'),
(70, 20, 'S3', 'No normada', 0, '2021-11-08 02:06:12'),
(71, 21, 'T1', 'Sin extintor, extintor vencido', 0, '2021-11-08 02:06:12'),
(72, 21, 'T2', 'Sin botiquin, no implementado', 0, '2021-11-08 02:06:12'),
(73, 21, 'T3', 'Luce en mal estado, falta luces', 0, '2021-11-08 02:06:12'),
(74, 21, 'T4', 'Sin cinturon, en mal estado', 0, '2021-11-08 02:06:12'),
(75, 21, 'T5', 'Sin alarma de retroceso', 0, '2021-11-08 02:06:12'),
(76, 21, 'T6', 'Sin Triangulo de seguridad, sin conos', 0, '2021-11-08 02:06:12'),
(77, 21, 'T7', 'Conductor sin licencia', 0, '2021-11-08 02:06:12'),
(78, 21, 'T8', 'Errores en la documentación', 0, '2021-11-08 02:06:12'),
(79, 21, 'T9', 'Vehiculos sin revisión técnica', 0, '2021-11-08 02:06:12'),
(80, 21, 'T10', 'Vehiculos sin tacos tipo cuña', 0, '2021-11-08 02:06:12'),
(81, 21, 'T11', 'Neumático en mal estado', 0, '2021-11-08 02:06:12'),
(82, 21, 'T12', 'Camión grua con brazo no adecuado', 0, '2021-11-08 02:06:12'),
(83, 21, 'T13', 'Gancho de brazo sin seguro (Grua)', 0, '2021-11-08 02:06:12'),
(84, 21, 'T14', 'Fuga de hidrolina (derrames aceites)', 0, '2021-11-08 02:06:12'),
(85, 21, 'T15', 'No instalar gatos hidráulicos (Grúa)', 0, '2021-11-08 02:06:12'),
(86, 21, 'T16', 'Vehiculo sin SOAT', 0, '2021-11-08 02:06:12'),
(87, 22, 'U1', 'Mal señalizado, señalización parcial', 0, '2021-11-08 02:06:12'),
(88, 22, 'U2', 'Sin señalizar.', 0, '2021-11-08 02:06:12'),
(89, 22, 'U3', 'Mal delimitado', 0, '2021-11-08 02:06:12'),
(90, 22, 'U4', 'Sin delimitar.', 0, '2021-11-08 02:06:12'),
(91, 23, 'V1', 'No se realizó, no se registró', 0, '2021-11-08 02:06:12'),
(92, 23, 'V2', 'Mal realizada, No firmada', 0, '2021-11-08 02:06:12'),
(93, 24, 'W1', 'Personal sin boleta de seguridad', 0, '2021-11-08 02:06:12'),
(94, 24, 'W2', 'Boletas de seguridad no firmadas', 0, '2021-11-08 02:06:12'),
(95, 25, 'X1', 'No contar con PETS Y ATS en campo', 0, '2021-11-08 02:06:12'),
(96, 25, 'X2', 'No conocer PETS Y ATS de la actividad', 0, '2021-11-08 02:06:12'),
(97, 26, 'Y1', 'No tiene póliza', 0, '2021-11-08 02:06:12'),
(98, 26, 'Y2', 'Póliza vencida', 0, '2021-11-08 02:06:12'),
(99, 27, 'Z1', 'Trabajos en Redes Áreas de MT y BT (Trabajos en altura - Caida a distinto Nivel)', 0, '2021-11-08 02:06:12'),
(100, 27, 'Z2', 'Estructuras en mal estado (Caida a distinto Nivel)', 0, '2021-11-08 02:06:12'),
(101, 27, 'Z3', 'Realizar trabajos a medio vano', 0, '2021-11-08 02:06:12'),
(102, 27, 'Z4', 'Trabajos en caliente (Descarga Eléctrica, Arco Eléctrico)', 0, '2021-11-08 02:06:12'),
(103, 27, 'Z5', 'Trabajos cerca de lineas energizadas (Induccion Eléctrica. Arco Eléctrico)', 0, '2021-11-08 02:06:12'),
(104, 27, 'Z6', 'Camión grúa sin conexión a tierra (Descarga Eléctrica)', 0, '2021-11-08 02:06:12'),
(105, 27, 'Z7', 'Accesorios Mensulas, crucelas en mal estado (golpes por objetos, contusiones)', 0, '2021-11-08 02:06:12'),
(106, 27, 'Z8', 'Terreno Inestable (caida al mismo Nivel, atrapamientos).', 0, '2021-11-08 02:06:12'),
(107, 27, 'Z9', 'Equipos de maniobras PT. Pértigas en mal estado', 0, '2021-11-08 02:06:12'),
(108, 27, 'Z10', 'Ejecutar trabajos sin instalar puestas a tierras o mal instalada', 0, '2021-11-08 02:06:12'),
(109, 27, 'Z11', 'Revelador de tensión en mal estado', 0, '2021-11-08 02:06:12'),
(110, 27, 'Z12', 'Supervision inadecuada de los trabajos de campo (no evaluar riesgos)', 0, '2021-11-08 02:06:12'),
(111, 27, 'Z13', 'Transito vehicular (no advertir)', 0, '2021-11-08 02:06:12'),
(112, 27, 'Z14', 'Ambiente con exceso de ruido (exposición al ruido)', 0, '2021-11-08 02:06:12'),
(113, 27, 'Z15', 'Presencia de Gases en el ambiente (Inhalacion de gases)', 0, '2021-11-08 02:06:12'),
(114, 27, 'Z16', 'Zonas Peligrosas (vandalismo agresion fisica)', 0, '2021-11-08 02:06:12'),
(115, 27, 'Z17', 'No contar con procedimientos estandares de trabajo', 0, '2021-11-08 02:06:12'),
(116, 27, 'Z18', 'Efectuar labores sin contar con Autorización de Maniobra', 0, '2021-11-08 02:06:12'),
(117, 28, '-', '-', 0, '2021-11-16 07:21:49'),
(118, 29, '-', '-', 0, '2021-11-16 07:37:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_vehiculo`
--

CREATE TABLE `empresa_vehiculo` (
  `nId` int(11) NOT NULL,
  `nIdEmpresa` int(11) DEFAULT NULL,
  `nTipoVehiculo` int(11) DEFAULT NULL,
  `cPlaca` varchar(12) DEFAULT NULL,
  `nFlag` int(11) DEFAULT NULL,
  `dRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa_vehiculo`
--

INSERT INTO `empresa_vehiculo` (`nId`, `nIdEmpresa`, `nTipoVehiculo`, `cPlaca`, `nFlag`, `dRegistro`) VALUES
(20, 5, 2, 'xs33y', 0, '2021-10-12 09:57:11'),
(21, 6, 1, 'zcxcs', 0, '2021-10-22 22:08:04'),
(22, 6, 1, 'XSXSXSXSXSXS', 0, '2021-10-23 14:16:18'),
(23, 9, 1, 'fvfvfvfvf', 0, '2021-10-25 00:19:39'),
(24, 2, 1, 'XDCTTT', 0, '2021-11-08 02:09:22'),
(25, 10, 1, '444r4r4', 0, '2021-11-08 02:21:19'),
(26, 11, 3, 'PRUEBA 01', 0, '2021-11-10 09:22:48'),
(27, 11, 1, 'dedededed', 0, '2021-11-10 09:56:19'),
(28, 11, 1, 'dedededed', 0, '2021-11-10 09:56:25'),
(29, 11, 3, '585858558', 0, '2021-11-10 10:14:05'),
(30, 11, 2, 'QA0000000', 0, '2021-11-10 10:22:51'),
(31, 8, 1, 'B6M-880', 0, '2021-11-10 21:43:13'),
(32, 8, 1, 'B6M-880', 0, '2021-11-10 21:45:30'),
(33, 8, 1, 'B6M-880', 0, '2021-11-10 23:16:06'),
(34, 13, 4, 'C9P - 770', 0, '2021-11-16 07:30:33'),
(35, 13, 6, 'T9R - 821', 0, '2021-11-16 07:32:49'),
(36, 8, 6, 'BHF-731', 0, '2021-11-19 20:17:29'),
(37, 13, 4, 'CJD - 700', 0, '2021-11-20 15:36:21'),
(38, 13, 1, 'TR9 - 821', 0, '2021-11-20 15:36:41'),
(39, 13, 1, 'T5I - 871', 0, '2021-11-20 15:37:17'),
(40, 17, 1, 'M4L - 477', 0, '2021-11-20 16:15:04'),
(41, 8, 1, 'EGP-197', 0, '2021-11-24 07:27:03'),
(42, 19, 6, 'F3P-813', 0, '2021-12-09 20:38:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informe`
--

CREATE TABLE `informe` (
  `nId` int(11) NOT NULL,
  `nIdPrograma` int(11) DEFAULT NULL,
  `nIdUserRegistro` int(11) DEFAULT NULL,
  `nIdTarea` int(11) DEFAULT NULL,
  `nIdTipoDocumento` int(11) DEFAULT NULL,
  `nIdEmpresa` int(11) DEFAULT NULL,
  `nIdUUNN` int(11) DEFAULT NULL,
  `nIdCargo` int(11) DEFAULT NULL,
  `nIdResponsable` int(11) DEFAULT NULL,
  `nIdSupervision` int(11) DEFAULT NULL,
  `cNombreInforme` varchar(120) NOT NULL,
  `cActividad` varchar(500) DEFAULT NULL,
  `cObra` varchar(1200) DEFAULT NULL,
  `cLugar` varchar(500) DEFAULT NULL,
  `cArea` varchar(220) DEFAULT NULL,
  `cFecha` datetime DEFAULT current_timestamp(),
  `nActa` int(11) DEFAULT NULL,
  `cESAS` varchar(220) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `nEstado` int(11) DEFAULT 0,
  `dRegistro` datetime DEFAULT current_timestamp(),
  `cRutaActa` varchar(500) DEFAULT NULL,
  `dUpdate` datetime DEFAULT current_timestamp(),
  `nIdAux` int(11) NOT NULL,
  `cRutaActaReverso` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `informe`
--

INSERT INTO `informe` (`nId`, `nIdPrograma`, `nIdUserRegistro`, `nIdTarea`, `nIdTipoDocumento`, `nIdEmpresa`, `nIdUUNN`, `nIdCargo`, `nIdResponsable`, `nIdSupervision`, `cNombreInforme`, `cActividad`, `cObra`, `cLugar`, `cArea`, `cFecha`, `nActa`, `cESAS`, `nFlag`, `nEstado`, `dRegistro`, `cRutaActa`, `dUpdate`, `nIdAux`, `cRutaActaReverso`) VALUES
(59, 1, 3, 1, 1, 2, 1, 1, 1, 1, '', 'DGDFG', 'DFGSDF', 'DFGSDF', 'GSD', '2021-09-17 00:00:00', 1, 'ENSA', 2, 1, '2021-09-14 16:46:11', NULL, '2021-09-14 16:46:11', 0, ''),
(60, 1, 17, 1, 1, 2, 1, 1, 1, 1, '', 'FG', 'DSFGHDFGH', 'DFGH', 'DFGHDFG', '2021-09-09 00:00:00', 4, 'ENSA', 2, 1, '2021-09-14 16:46:24', NULL, '2021-09-14 16:46:24', 0, ''),
(61, 1, 3, 1, 1, 1, 1, 3, 1, 1, '', 'SFGDG', 'FHDFG', 'HFGHDFG', 'HDFGHDF', '2021-09-15 00:00:00', 12, 'ENSA', 2, 1, '2021-09-15 01:28:48', NULL, '2021-09-15 01:28:48', 0, ''),
(64, 1, 3, 1, 1, 1, 1, 1, 1, 1, '', 'ASDSA', 'ASDFASDF', 'DASd', 'ASDASD', '2021-09-15 00:00:00', 12, 'ENSA', 2, 1, '2021-09-15 01:49:50', NULL, '2021-09-15 01:49:50', 0, ''),
(65, 1, 17, 1, 1, 6, 4, 1, 19, 4, '', 'INSPECCIÓN DE SEGURIDAD (EPPS, DOCUMENTACIÓN) DEL PERSONAL CONDUCTOR, UNIDAD MÓVIL PARA INICIO DE ACTIVIDADES, CONDUCTOR DE MOTUPE.', 'SERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.”', 'CARRETERA FERNANDO BELAUNDE TERRY MOTUPE', 'DISTRIBUCION', '2021-09-01 00:00:00', 1960, 'ENSA', 2, 1, '2021-09-16 02:24:16', 'uploads/65/thumb-1920-702742.jpg', '2021-09-16 02:24:16', 0, 'uploads/65/thumb-1920-702742.jpg'),
(69, 1, 3, 2, 2, 2, 4, 3, 20, 1, '', 'FGHDFGh', 'DFGHDFH', 'FGHYHT', 'YNYTNHFGB', '2021-09-19 00:00:00', 1, 'ENSA', 2, 1, '2021-09-19 10:04:23', NULL, '2021-09-19 10:04:23', 0, ''),
(70, 1, 3, 2, 2, 2, 4, 2, 20, 1, '', 'Eg', 'EFGEFSD', 'ERGt', 'EFGDF', '2021-09-16 00:00:00', 45, 'ENSA', 2, 1, '2021-09-19 10:17:59', NULL, '2021-09-19 10:17:59', 0, ''),
(71, 1, 3, 2, 2, 2, 7, 2, 20, 1, '', 'FGSDF', 'GSDFGSD', 'FGSDFg', 'SDFG', '2021-09-15 00:00:00', 23, 'ENSA', 2, 1, '2021-09-19 11:43:32', NULL, '2021-09-19 11:43:32', 0, ''),
(72, 1, 17, 1, 1, 6, 4, 33, 19, 4, '', 'INSPECCIÓN DE SEGURIDAD (EPPS, DOCUMENTACIÓN) DEL PERSONAL CONDUCTOR, UNIDAD MÓVIL PARA INICIO DE ACTIVIDADES, CONDUCTOR DE MOTUPE.', 'SERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.”', 'CARRETERA FERNANDO BELAUNDE TERRY MOTUPE', 'DISTRIBUCION', '2021-09-01 00:00:00', 1960, 'ENSA', 2, 1, '2021-09-20 17:50:20', 'uploads/72/21.jpg', '2021-09-20 17:50:20', 0, 'uploads/72/22.jpg'),
(73, 1, 17, 1, 1, 6, 4, 33, 19, 4, '', 'INSPECCIÓN DE SEGURIDAD (EPPS, DOCUMENTACIÓN) DEL PERSONAL CONDUCTOR, UNIDAD MÓVIL PARA INICIO DE ACTIVIDADES, CONDUCTOR DE MOTUPE.', 'SERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.”', 'CARRETERA FERNANDO BELAUNDE TERRY MOTUPE', 'DISTRIBUCION', '2021-09-01 00:00:00', 1960, 'ENSA', 2, 1, '2021-09-20 20:24:22', 'uploads/73/21.jpg', '2021-09-20 20:24:22', 0, 'uploads/73/22.jpg'),
(76, 1, 17, 2, 2, 8, 4, 37, 21, 4, '', '', '', 'CALLE EMILIANO NIÑO Nº 468 - LAMBAYEQUE', 'OFICINA (TECNICA / ADMINISTRATIVA)', '2021-09-10 00:00:00', 0, 'ENSA', 2, 1, '2021-09-20 21:01:27', NULL, '2021-09-20 21:01:27', 0, ''),
(78, 1, 18, 1, 1, 8, 8, 39, 21, 4, '', 'MANTENIMIENTO PREVENTIVO Y CAMBIO DE CONECTORES DEL CIRCUITO C - 233 - JLO.', 'MANTENIMIENTO DE LÍNEAS DE BAJA TENSIÓN.', 'CA. LAS YUCAS  - EL OBELISCO - JLO.', 'UMD', '2021-09-20 00:00:00', 1680, 'ENSA', 2, 1, '2021-09-22 02:15:46', NULL, '2021-09-22 02:15:46', 0, ''),
(79, 1, 20, 1, 1, 8, 7, 37, 23, 4, '', 'INSPECCION DE EPPS, HERRAMIENTAS Y EQUIPOS', 'DISTRIBUCION Y COMERCIALIZACION DE ENERGIA ELECTRICA', 'SANTA CRUZ - CAJAMARCA', 'DISTRIBUCION', '2021-09-21 00:00:00', 1871, 'ENSA', 2, 1, '2021-09-23 17:45:48', NULL, '2021-09-23 17:45:48', 0, ''),
(80, 1, 3, 1, 1, 2, 8, 3, 20, 2, '', 'SDFsf', 'GDSFG', 'DFGSd', 'FGDSf', '2021-09-09 00:00:00', 43, 'ENSA', 2, 1, '2021-09-25 11:32:10', NULL, '2021-09-25 11:32:10', 0, ''),
(82, 1, 3, 1, 1, 2, 4, 2, 24, 1, '', 'SDFASDF', 'ASDFAS', 'DFASDF', 'ASDF', '2021-09-25 00:00:00', 23, 'ENSA', 2, 1, '2021-09-25 19:34:01', NULL, '2021-09-25 19:34:01', 0, ''),
(84, 1, 3, 1, 1, 2, 4, 40, 25, 2, '', 'ERGWE', 'FGSDF', 'DFGSDF', 'GSDFG', '2021-09-22 00:00:00', 43, 'ENSA', 2, 1, '2021-09-27 01:32:00', NULL, '2021-09-27 01:32:00', 0, ''),
(85, 1, 1, 1, 1, 2, 4, 3, 27, 2, '', 'QA', 'QA', 'ASAD', 'ASDASD', '2021-09-29 00:00:00', 5152, 'ENSA', 2, 1, '2021-09-28 20:10:28', NULL, '2021-09-28 20:10:28', 0, ''),
(86, 1, 3, 1, 1, 2, 4, 2, 30, 1, '', 'SDFSDFSDFS', 'SDFSADF', 'SDFa', 'SDFASD', '2021-10-01 00:00:00', 6, 'ENSA', 2, 1, '2021-10-01 18:37:08', NULL, '2021-10-01 18:37:08', 0, ''),
(87, 1, 3, 1, 1, 2, 4, 42, 30, 1, '', 'SDFASDf', 'ASDSDF', 'ASDf', 'ASDFA', '2021-10-01 00:00:00', 345, 'ENSA', 2, 1, '2021-10-01 19:12:53', NULL, '2021-10-01 19:12:53', 0, ''),
(88, 1, 17, 1, 1, 5, 7, 41, 26, 1, '', 'INSPECCIÓN DE EPPS, VEHÍCULO PARA INICIO DE ACTIVIDADES.', 'AMPLIACIÓN DE LA ELECTRIFICACIÓN DE LAS COMUNIDADES RURALES DE HUAMBOS DEL DISTRITO DE HUAMBOS - CHOTA – CAJAMARCA” DE SU CLIENTE ELECTRONORTE S.A.', 'HUAMBOS - CHOTA', 'PROYECTOS', '2021-09-02 00:00:00', 1856, 'ENSA', 2, 1, '2021-10-02 14:22:07', 'uploads/88/8.jpg', '2021-10-02 14:22:07', 0, 'uploads/88/9.jpg'),
(89, 1, 17, 1, 1, 9, 8, 45, 33, 4, '', 'EXCAVACIÓN DE HOYOS PARA POSTES DE BAJA TENSIÓN Y RETENIDAS.', 'CONTRATACIÓN DE SUMINISTRO DE BIENES ADQUISICIÓN, EQUIPAMIENTO, MONTAJE, PRUEBAS Y PUESTA EN SERVICIO PARA AMPLIACIÓN DE REDES DE DISTRIBUCIÓN MT Y BT POR DEMANDA EN LAS UU.NN. CHICLAYO Y SUCURSALES AÑO 2020 - 2022 DE ELECTRONORTE S.A. - CONTRATO GR - 42 - 2021.', 'CA. SAN MARTÍN Y JUAN PABLO II –  DISTRITO DE SAN JOSÉ', 'UMD', '2021-09-08 00:00:00', 1668, 'ENSA', 2, 1, '2021-10-04 14:30:59', 'uploads/89/30.jpg', '2021-10-04 14:30:59', 0, ''),
(90, 1, 3, 1, 1, 2, 7, 2, 22, 1, '', 'ASDFASDF', 'ASDFASDFAs', 'ASDFa', 'SDFASDF', '2021-10-05 00:00:00', 12, 'ENSA', 2, 1, '2021-10-05 12:22:28', NULL, '2021-10-05 12:22:28', 0, ''),
(91, 1, 17, 1, 1, 6, 4, 46, 34, 4, '', 'INSPECCIÓN DE SEGURIDAD (EPPS, DOCUMENTACIÓN) DEL PERSONAL CONDUCTOR, UNIDAD MÓVIL PARA INICIO DE ACTIVIDADES, CONDUCTOR DE MOTUPE.', 'SERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.”', 'CARRETERA FERNANDO BELAUNDE TERRY MOTUPE', 'DISTRIBUCIÓN', '2021-09-01 00:00:00', 1960, 'ENSA', 2, 1, '2021-10-07 16:13:11', 'uploads/91/21.jpg', '2021-10-07 16:13:11', 0, 'uploads/91/22.jpg'),
(92, 1, 3, 1, 1, 2, 4, 43, 30, 1, '', 'HDJSJ', 'HHH', 'HJJH', 'KKKK', '2021-10-07 00:00:00', 5, 'ENSA', 2, 1, '2021-10-07 17:09:31', NULL, '2021-10-07 17:09:31', 0, ''),
(93, 1, 3, 1, 1, 2, 4, 43, 20, 1, '', 'FHFGHJ', 'HJFGHJ', 'GHJFGH', 'J', '2021-10-12 00:00:00', 78, 'ENSA', 2, 1, '2021-10-12 09:41:36', NULL, '2021-10-12 09:41:36', 0, ''),
(94, 1, 3, 1, 1, 5, 7, 41, 26, 1, '', 'DFGSDFG', 'SDFGSD', 'SDFGs', 'DFGSDFG', '2021-10-12 00:00:00', 546, 'ENSA', 2, 1, '2021-10-12 09:44:35', NULL, '2021-10-12 09:44:35', 0, ''),
(95, 1, 17, 1, 1, 6, 4, 33, 19, 4, '', 'INSPECCIÓN DE SEGURIDAD (EPPS, DOCUMENTACIÓN) DEL PERSONAL CONDUCTOR, UNIDAD MÓVIL PARA INICIO DE ACTIVIDADES, CONDUCTOR DE MOTUPE.', 'SERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.”', 'CARRETERA FERNANDO BELAUNDE TERRY MOTUPE', 'DISTRIBUCIÓN', '2021-09-01 00:00:00', 1960, 'ENSA', 2, 1, '2021-10-12 23:36:06', NULL, '2021-10-12 23:36:06', 0, ''),
(96, 1, 3, 1, 1, 2, 4, 2, 20, 1, '', 'ZFASD', 'FASDF', 'SDF', 'ASDF', '2021-10-19 00:00:00', 18, 'ENSA', 2, 1, '2021-10-19 23:50:59', NULL, '2021-10-19 23:50:59', 0, ''),
(97, 1, 3, 1, 1, 2, 4, 3, 20, 1, '', 'SDFASD', 'FASDF', 'SDFa', 'SDFASDf', '2021-10-19 00:00:00', 23, 'ENSA', 2, 1, '2021-10-20 00:49:24', NULL, '2021-10-20 00:49:24', 0, ''),
(98, 1, 3, 1, 1, 2, 4, 2, 29, 1, '', 'SDFs', 'DFSDF', 'DFSDF', 'SDFSD', '2021-10-19 00:00:00', 23, 'ENSA', 2, 1, '2021-10-20 00:59:16', NULL, '2021-10-20 00:59:16', 0, ''),
(99, 1, 3, 1, 1, 2, 4, 2, 24, 1, '', 'SDFSA', 'DFASDFASD', 'SDFas', 'DFASD', '2021-10-20 00:00:00', 233, 'ENSA', 2, 1, '2021-10-20 01:03:57', NULL, '2021-10-20 01:03:57', 0, ''),
(100, 1, 3, 1, 1, 2, 4, 2, 20, 1, '', 'CSD', 'CSDCASDC', 'SDCas', 'DCASDCASD', '2021-10-22 00:00:00', 323, 'ENSA', 2, 1, '2021-10-22 22:08:44', NULL, '2021-10-22 22:08:44', 0, ''),
(101, 1, 3, 1, 1, 2, 7, 42, 22, 1, '', 'DFSSDFSDF', 'SDFSDFSDFS', 'SDFSDFAS', 'DFASDFASDF', '2021-10-23 00:00:00', 32323, 'ENSA', 2, 1, '2021-10-23 14:39:19', NULL, '2021-10-23 14:39:19', 0, ''),
(102, 1, 1, 1, 1, 6, 4, 30, 35, 1, '', 'PRUEBA ACTIVIDAD', 'PRUEBA OBRA', 'IQUITOS', 'AREA', '2021-10-23 00:00:00', 12312, 'ENSA', 2, 1, '2021-10-23 14:54:03', NULL, '2021-10-23 14:54:03', 0, ''),
(103, 1, 3, 1, 1, 2, 4, 3, 22, 1, '', 'SDFSDFSD', 'FSDFSDF', 'DGEWTRT', 'EFWEQWE', '2021-10-23 00:00:00', 2344, 'ENSA', 2, 1, '2021-10-23 14:55:06', NULL, '2021-10-23 14:55:06', 0, ''),
(104, 1, 1, 1, 1, 8, 4, 39, 21, 1, '', 'PRUEBA', 'OBRA', 'IQUITOS', 'QUEDA', '2021-11-06 00:00:00', 12312, 'ENSA', 2, 1, '2021-10-23 15:05:40', NULL, '2021-10-23 15:05:40', 0, ''),
(105, 1, 3, 1, 1, 2, 4, 3, 30, 2, '', 'DFASDF', 'SDFASDFas', 'DFASD', 'FASDF', '2021-10-23 00:00:00', 342343, 'ENSA', 2, 1, '2021-10-23 15:27:50', NULL, '2021-10-23 15:27:50', 0, ''),
(106, 1, 1, 1, 1, 8, 7, 37, 23, 1, '', 'PRUEBA', 'OBRA', 'LUGAR', 'AREA', '2021-10-23 00:00:00', 121211, 'ENSA', 2, 1, '2021-10-23 16:20:00', NULL, '2021-10-23 16:20:00', 0, ''),
(107, 1, 3, 1, 1, 5, 8, 41, 26, 1, '', 'SDFASd', 'FASDFASd', 'FASD', 'FASDFASD', '2021-10-23 00:00:00', 2323, 'ENSA', 2, 1, '2021-10-23 16:23:01', NULL, '2021-10-23 16:23:01', 0, ''),
(108, 1, 3, 2, 1, 2, 4, NULL, NULL, 1, '', 'DFASDFASd', 'FASDFASDF', 'ASDFQW', 'RFQERFQE', '2021-10-24 00:00:00', 3434, 'ENSA', 2, 1, '2021-10-25 00:29:15', NULL, '2021-10-25 00:29:15', 0, ''),
(109, 1, 3, 1, 1, 2, 4, NULL, NULL, 1, '', 'ERQWER', 'QWERQWER', 'WERq', 'WERQWE', '2021-10-25 00:00:00', 43434, 'ENSA', 2, 1, '2021-10-25 02:09:35', NULL, '2021-10-25 02:09:35', 0, ''),
(110, 1, 1, 2, 2, 2, 7, 2, 27, 2, '', 'QA', 'QA', 'QA', 'QA', '2021-10-25 00:00:00', 112, 'ENSA', 2, 1, '2021-10-25 03:20:59', NULL, '2021-10-25 03:20:59', 0, ''),
(111, 1, 3, 1, 1, 2, 4, 3, 28, 1, '', 'Gds', 'FGDFGSDFG', 'SDFg', 'SDFGs', '2021-10-25 00:00:00', 6567567, 'ENSA', 2, 1, '2021-10-25 09:57:56', NULL, '2021-10-25 09:57:56', 0, ''),
(112, 1, 3, 2, 1, 2, 8, 3, 22, 1, '', 'FFFGd', 'FGHDFG', 'HDFGHd', 'FGH', '2021-10-25 00:00:00', 5656, 'ENSA', 2, 1, '2021-10-25 10:06:05', NULL, '2021-10-25 10:06:05', 0, ''),
(113, 1, 3, 1, 1, 2, 7, 3, 24, 1, '', 'SDFASD', 'FASDFASD', 'ASDFa', 'SDFASDF', '2021-10-29 00:00:00', 32, 'ENSA', 2, 1, '2021-10-29 20:24:18', NULL, '2021-10-29 20:24:18', 0, ''),
(114, 1, 17, 1, 1, 9, 4, 49, 41, 4, '', 'GHJNMK,L.Ñ{', 'POKJBNVCFDFGHN', 'KJHJKGJHGHJG', 'UMD', '2021-11-05 00:00:00', 1235648, 'ENSA', 2, 1, '2021-11-05 15:53:57', NULL, '2021-11-05 15:53:57', 0, ''),
(115, 1, 1, 1, 2, 2, 4, 2, 22, 1, '', 'QA', 'QA', 'QA', 'QA', '2021-11-05 00:00:00', 124, 'ENSA', 2, 1, '2021-11-05 17:21:15', NULL, '2021-11-05 17:21:15', 0, ''),
(116, 1, 3, 1, 1, 10, 8, 48, 40, 2, '', 'VBFH', 'GHJGH', 'GHG', 'HFGHJFG', '2021-11-09 00:00:00', 43, 'ENSA', 2, 1, '2021-11-08 02:15:24', NULL, '2021-11-08 02:15:24', 0, ''),
(117, 1, 3, 1, 1, 6, 4, 35, 19, 1, '', 'SDFGDF', 'GSDFG', 'DFG', 'SDFGSDF', '2021-11-09 00:00:00', 3, 'ENSA', 2, 1, '2021-11-08 02:48:40', NULL, '2021-11-08 02:48:40', 0, ''),
(118, 1, 20, 1, 1, 11, 7, 50, 43, 4, '', 'RECAUDACIÓN DE CANCELACIÓN DE RECIBOS DE ENERGÍA ELÉCTRICA Y DE RECARGAS DE ENERGÍA DE MEDIDORES', 'SERVICIO DE RECAUDACIÓN DE CANCELACIÓN DE RECIBOS DE ENERGÍA ELÉCTRICA Y DE RECARGAS DE ENERGÍA DE MEDIDORES EN LAS LOCALIDADES DE LA UNIDAD DE NEGOCIOS CAJAMARCA CENTRO', 'JR. GREGORIO MALCA N° 384 - CHOTA', 'COMERCIAL', '2021-11-04 00:00:00', 1897, 'ENSA', 0, 1, '2021-11-08 07:07:13', 'uploads/118/CamScanner 11-08-2021 07.50_1.jpg', '2021-11-08 07:07:13', 0, 'uploads/118/REVERSO DE ACTA.png'),
(119, 1, 20, 1, 1, 12, 7, 51, 44, 4, '', 'SUPERVISIÓN EN EL CAMBIO DE LUMINARIA', '“SERVICIO DE MANTENIMIENTO DE DISTRIBUCIÓN DE MEDIA TENSIÓN, SUBESTACIONES, BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO-COMERCIALES, PARA LOS SISTEMAS ELÉCTRICOS CHOTA –BAMBAMARCA-SANTACRUZ- CUTERVO, JAEN SECTOR I, SECTOR II, SECTOR III, DE LA UNIDAD DE NEGOCIOS CAJAMARCA CENTRO PERIODO 2021-2022 DE ELECTRONORTE S.A.   REFERENCIA ITEM I”', 'JR. TUPAC AMARU, CUADRA 2 - CHOTA', 'DISTRIBUCIÓN', '2021-11-09 00:00:00', 2201, 'ENSA', 0, 1, '2021-11-09 23:18:47', NULL, '2021-11-09 23:18:47', 400, ''),
(120, 1, 3, 1, 1, 5, 4, 44, 26, 1, '', 'DGHFG', 'HDFGHDFG', 'HDFG', 'HDFG', '2021-11-10 00:00:00', 465, 'ENSA', 2, 1, '2021-11-10 09:49:15', NULL, '2021-11-10 09:49:15', 401, ''),
(121, 1, 19, 1, 1, 8, 4, 37, 48, 4, '', 'INSPECCIÓN DE SEGURIDAD (EPPS, EQUIPOS Y HERRAMIENTAS) DOCUMENTACION DEL PERSONAL TÉCNICO - LAMBAYEQUE.', 'MANTENIMIENTO Y EMERGENCIAS DE DISTRIBUCIÓN - UMD- LINEAS ENERGIZADAS', 'CALLE EMILIANO NIÑO N° 469 LAMMBAYEQUE', 'DISTRIBUCION ', '2021-11-08 00:00:00', 1924, 'ENSA', 0, 1, '2021-11-10 21:02:25', 'uploads/121/IMG_3361.jpeg', '2021-11-10 21:02:25', 402, 'uploads/121/IMG_3362.jpeg'),
(124, 1, 1, 1, 1, 2, 4, 2, 22, 1, '', 'DATOS ACT', 'DATOS OBRA', 'LAGUNAS', 'LAG-INT', '2021-11-11 00:00:00', 45312, 'ENSA', 2, 1, '2021-11-11 01:16:19', 'uploads/124/t2.png', '2021-11-11 01:16:19', 403, 'uploads/124/thumb-1920-702742.jpg'),
(126, 1, 18, 1, 1, 13, 8, 55, 61, 1, '', 'IZAJE DE POSTES CAC DE MEDIA TENSIÓN', 'SERVICIO DE MANTENIMIENTO EN MEDIA TENSIÓN, SUBESTACIONES, BAJA TENSIÓN Y ALUMBRADO PÚBLICO: CHICLAYO, PERIODO 2018 - 2021 ELECTRONORTE S.A', 'GALLITO I – SAN JOSÉ', 'UMD', '2021-11-10 00:00:00', 2002, 'ENSA', 0, 1, '2021-11-16 06:49:02', 'uploads/126/40.jpg', '2021-11-16 06:49:02', 415, ''),
(127, 1, 18, 2, 2, 14, 8, 62, 62, 4, '', 'INSPECCIÓN DE SEGURIDAD A OFICINA ATENCIÓN AL CLIENTE Y COBRANZA DE LA OFICINA DE REQUE.', 'SERVICIO DE ATENCIÓN AL CLIENTE EN OFICINAS DE PERIFERIA DE LA UU.NN CHICLAYO – ELÉCTRONORTE S.A', 'CALLE SAN MARTÍN 118 – REQUE.', 'COMERCIAL', '2021-11-11 00:00:00', 0, 'ENSA', 0, 1, '2021-11-16 15:25:12', 'uploads/127/46.jpg', '2021-11-16 15:25:12', 416, 'uploads/127/47.jpg'),
(128, 1, 18, 1, 1, 14, 8, 62, 62, 4, '', 'INSPECCIÓN DE SEGURIDAD (EPPS, EQUIPOS) DEL PERSONAL DE ATC Y COBRANZA, MANTENIMIENTO (LIMPIEZA) Y VIGILANCIA – OFICINA DE LA VICTORIA.', 'SERVICIO DE ATENCIÓN AL CLIENTE EN OFICINAS DE PERIFERIA DE LA UU.NN CHICLAYO – ELECTRONORTE S.A', 'CALLE SAN MARTÍN 118 – REQUE.', 'COMERCIAL', '2021-11-11 00:00:00', 2003, 'ENSA', 0, 1, '2021-11-16 19:42:19', 'uploads/128/21.jpg', '2021-11-16 19:42:19', 417, ''),
(129, 1, 19, 1, 1, 8, 4, 66, 66, 4, '', 'INSPECCIÓN DE EPP, HERRAMIENTAS, EQUIPOS DE TRABAJO Y DOCUMENTACIÓN DE SEGURIDAD DEL OPERADOR DE LA S.E. MOTUPE', 'MANTENIMIENTO Y OPERACIÓN DE S.E.P - ELECTRONORTE S.A.', 'CARRETERA ANTIGUA PANAMERICANA NORTE MOTUPE', 'TRANSMISIÓN', '2021-11-11 00:00:00', 2101, 'ENSA', 0, 1, '2021-11-16 23:56:45', 'uploads/129/16.jpg', '2021-11-16 23:56:45', 418, 'uploads/129/17.jpg'),
(130, 1, 19, 2, 2, 8, 4, 67, 68, 1, '', 'INSPECCIÓN EN SEGURIDAD A LAS INSTALACIONES DE LA S.E MOTUPE', '', 'ANTIGUA PANAMERICANA NORTE KM 67 – MOTUPE', 'TRANSMISION', '2021-11-11 00:00:00', 0, 'ENSA', 0, 1, '2021-11-17 00:28:30', 'uploads/130/26.jpg', '2021-11-17 00:28:30', 419, ''),
(131, 1, 19, 1, 1, 6, 4, 33, 19, 4, '', 'TENDIDO DE CONDUCTOR DE M.T, REUBICACIÓN DE SED CON USO DE CAMIÓN GRÚA; LABORES CON RESTRICCIÓN DE ENERGÍA ELÉCTRICA.', 'SERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.', 'C.P EL INVERNILLO POMALCA, POM 201', 'DISTRIBUCIÓN', '2021-11-12 00:00:00', 2102, 'ENSA', 0, 1, '2021-11-17 11:22:20', 'uploads/131/46.jpg', '2021-11-17 11:22:20', 420, 'uploads/131/47.jpg'),
(132, 1, 20, 1, 1, 8, 7, 67, 51, 4, '', 'ATENCIÓN AL PÚBLICO Y A USUARIOS', 'DISTRIBUCIÓN Y COMERCIALIZACIÓN DE ENERGÍA ELÉCTRICA  ', 'AV. SAN JUAN N° 442 - CUTERVO', 'COMERCIAL', '2021-11-11 00:00:00', 2204, 'ENSA', 0, 1, '2021-11-17 13:06:29', 'uploads/132/6.jpg', '2021-11-17 13:06:29', 421, 'uploads/132/7.jpg'),
(133, 1, 20, 2, 2, 8, 7, 67, 51, 4, '', 'INSPECCIÓN EN SEGURIDAD OFICINA ADMINISTRATIVA ENSA, CUTERVO - CAJAMARCA ', '', 'DISTRITO Y PROVINCIA DE CUTERVO', 'DISTRIBUCION', '2021-11-11 00:00:00', 0, 'ENSA', 0, 1, '2021-11-17 20:29:01', 'uploads/133/16.jpg', '2021-11-17 20:29:01', 422, 'uploads/133/17.jpg'),
(135, 1, 20, 1, 1, 5, 7, 44, 81, 1, '', 'SUPERVISIÓN EN LA EJECUCIÓN DE EXCAVACIÓN DE HOYOS PARA RETENIDAS', 'AMPLIACIÓN DE LA ELECTRIFICACIÓN DE LAS COMUNIDADES RURALES DE HUAMBOS DEL DISTRITO DE HUAMBOS - CHOTA – CAJAMARCA” DE SU CLIENTE ELECTRONORTE S.A.', 'MITOCONGA - HUAMBOS', 'PROYECTOS', '2021-11-11 00:00:00', 2205, 'ENSA', 0, 1, '2021-11-17 21:53:09', 'uploads/135/13.jpg', '2021-11-17 21:53:09', 423, 'uploads/135/14.jpg'),
(136, 1, 20, 1, 1, 5, 7, 44, 81, 1, '', 'SUPERVISIÓN EN LA EJECUCIÓN DE EXCAVACIÓN DE HOYOS PARA POSTES DE BT.', 'AMPLIACIÓN DE LA ELECTRIFICACIÓN DE LAS COMUNIDADES RURALES DE HUAMBOS DEL DISTRITO DE HUAMBOS - CHOTA – CAJAMARCA” DE SU CLIENTE ELECTRONORTE S.A', 'CHORURO - HUAMBOS', 'PROYECTOS', '2021-11-11 00:00:00', 2206, 'ENSA', 0, 1, '2021-11-17 22:37:27', 'uploads/136/10.jpg', '2021-11-17 22:37:27', 424, 'uploads/136/11.jpg'),
(137, 1, 20, 1, 1, 12, 7, 70, 44, 4, '', 'SUPERVISIÓN EN LA ACTIVIDAD DE EXCAVACIÓN DE HOYOS PARA LA INSTALACIÓN DE POSTE', 'SERVICIO DE MANTENIMIENTO DE DISTRIBUCIÓN DE MEDIA TENSIÓN, SUBESTACIONES, BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO-COMERCIALES, PARA LOS SISTEMAS ELÉCTRICOS CHOTA –BAMBAMARCA-SANTACRUZ- CUTERVO, JAEN SECTOR I, SECTOR II, SECTOR III, DE LA UNIDAD DE NEGOCIOS CAJAMARCA CENTRO PERIODO 2021-2022 DE ELECTRONORTE S.A.   REFERENCIA ITEM I', 'JR. JOSÉ ARANA N° 507 - CHOTA', 'DISTRIBUCION', '2021-11-15 00:00:00', 2207, 'ENSA', 0, 1, '2021-11-17 23:28:16', 'uploads/137/10.jpg', '2021-11-17 23:28:16', 425, 'uploads/137/11.jpg'),
(138, 1, 20, 1, 1, 15, 7, 72, 95, 4, '', 'COBRANZA DE RECIBOS Y RECARGA DE MEDIDORES ', '“SERVICIO DE MANTENIMIENTO DE DISTRIBUCIÓN DE MEDIA TENSIÓN, SUBESTACIONES, BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO-COMERCIALES, PARA LOS SISTEMAS ELÉCTRICOS CHOTA –BAMBAMARCA-SANTACRUZ- CUTERVO, JAEN SECTOR I, SECTOR II, SECTOR III, DE LA UNIDAD DE NEGOCIOS CAJAMARCA CENTRO PERIODO 2021-2022 DE ELECTRONORTE S.A.   REFERENCIA ITEM II”', 'JR. SAN FERNANDO SN - HUALGAYOC', 'COMERCIAL', '2021-11-16 00:00:00', 2208, 'ENSA', 0, 1, '2021-11-19 16:50:34', 'uploads/138/8.jpg', '2021-11-19 16:50:34', 426, 'uploads/138/9.jpg'),
(139, 1, 19, 1, 1, 16, 4, 73, 97, 4, '', 'RETIRO DE MEDIDOR TRIFÁSICO', 'SERVICIO DE TERCERIZACIÓN DE LA ACTIVIDADES TÉCNICO COMERCIALES Y REDUCCIÓN DEL CONTROL DE PÉRDIDAS DE ENERGÍA EN BAJA TENSIÓN EN LAS UNIDADES DE NEGOCIOS CHICLAYO Y SUCURSALES DE ELECTRONORTE S.A.', 'CALLE EMILIANO NIÑO, CUADRA 01 LAMBAYEQUE', 'COMERCIAL', '2021-11-16 00:00:00', 2103, 'ENSA', 0, 1, '2021-11-19 17:34:14', 'uploads/139/33.png', '2021-11-19 17:34:14', 427, 'uploads/139/34.png'),
(140, 1, 18, 1, 1, 8, 8, 67, 100, 4, '', 'INSPECCIÓN DE EPPS, EQUIPOS Y HERRAMIENTAS, UNIDAD MÓVIL Y PERSONAL OPERATIVO, PREVIO AL INICIO DE ACTIVIDADES – INSTALACIÓN DE MEDIDORES POR TELEMETRÍA.', 'ACTIVIDADES TÉCNICO COMERCIALES DE CLIENTES MAYORES.', 'AV. SÁENZ PEÑA 1750 - CHICLAYO', 'COMERCIAL', '2021-11-12 00:00:00', 2004, 'ENSA', 0, 1, '2021-11-19 19:00:10', 'uploads/140/31.png', '2021-11-19 19:00:10', 428, 'uploads/140/32.png'),
(141, 1, 18, 1, 1, 13, 8, 55, 61, 1, '', 'LIMPIEZA DE AISLADORES E INSTALACIÓN DE ATERRAMIENTOS EN POSTES DE MEDIA TENSIÓN. ', 'SERVICIO DE MANTENIMIENTO EN MEDÍA TENSIÓN, SUBESTACIONES, BAJA TENSIÓN Y ALUMBRADO PÚBLICO: CHICLAYO, PERIODO 2018 - 2021 ELECTRONORTE S.A.', 'C.P. SAN LUIS – CHOSICA DEL NORTE.', 'UMD', '2021-11-13 00:00:00', 2005, 'ENSA', 0, 1, '2021-11-20 15:08:49', 'uploads/141/44.png', '2021-11-20 15:08:49', 429, ''),
(143, 1, 18, 1, 1, 17, 8, 78, 119, 4, '', 'APERTURA, SOLDADO, PINTADO Y CODIFICADO DE TAPA DE MEDIDOR.', 'CONTRATACIÓN DEL SERVICIO DE ACTIVIDADES COMPLEMENTARIAS AL CONTRASTE Y/O VERIFICACIÓN DE MEDIDORES DE ENERGÍA ELÉCTRICA EN EL ÁREA DE CONCESIÓN DE ELECTRONORTE S.A - UNIDADES DE NEGOCIO CHICLAYO Y UNIDAD DE NEGOCIO SUCURSALES', 'TUPAC AMARUC MZ 36 – LTE. 09 – CHOSICA DEL NORTE.', 'COMERCIAL', '2021-11-13 00:00:00', 2006, 'ENSA', 0, 1, '2021-11-20 15:55:13', 'uploads/143/11.png', '2021-11-20 15:55:13', 430, ''),
(144, 1, 20, 1, 1, 15, 7, 72, 122, 4, '', 'OPERACIÓN DE PATIO DE LLAVES', 'SERVICIO DE MANTENIMIENTO DE DISTRIBUCIÓN DE MEDIA TENSIÓN, SUBESTACIONES, BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO-COMERCIALES, PARA LOS SISTEMAS ELÉCTRICOS CHOTA –BAMBAMARCA-SANTACRUZ- CUTERVO, JAEN SECTOR I, SECTOR II, SECTOR III, DE LA UNIDAD DE NEGOCIOS CAJAMARCA CENTRO PERIODO 2021-2022 DE ELECTRONORTE S.A.   REFERENCIA ITEM II', 'PATIO DE LLAVES CERRO CORONA - HUALGAYOC', 'DISTRIBUCION', '2021-11-16 00:00:00', 2209, 'ENSA', 0, 1, '2021-11-22 12:38:18', 'uploads/144/10.png', '2021-11-22 12:38:18', 431, ''),
(145, 1, 20, 1, 1, 8, 7, 67, 124, 1, '', 'SE EVIDENCIA QUE EL TÉCNICO ELECTRICISTA CUENTA CON UNIFORME EN BUEN ESTADO.', 'DISTRIBUCIÓN Y COMERCIALIZACIÓN DE ENERGÍA ELÉCTRICA  ', 'OFICINA ENSA - BAMBAMARCA', 'COMERCIAL', '2021-11-16 00:00:00', 2210, 'ENSA', 0, 1, '2021-11-24 07:17:00', 'uploads/145/12.png', '2021-11-24 07:17:00', 432, 'uploads/145/13.png'),
(146, 1, 20, 1, 1, 8, 7, 67, 128, 1, '', 'OPERACIÓN DE CELDAS DE MT DE LA SET', 'DISTRIBUCIÓN Y COMERCIALIZACIÓN DE ENERGÍA ELÉCTRICA  ', 'C.T. CHOTA', 'DISTRIBUCIÓN', '2021-11-17 00:00:00', 2211, 'ENSA', 0, 1, '2021-12-06 20:20:45', NULL, '2021-12-06 20:20:45', 433, ''),
(149, 1, 19, 1, 1, 19, 4, 83, 130, 1, '', 'Inspección de seguridad (EPPs, documentación), para inicio de actividades.(Etapa de obras electromecánicas)', 'Ampliación de celdas tipo metal clad en 22.9kv – subestación de transformación pampa Pañala Olmos - Lambayeque', 'Calle Emiliano Niño Cuadra 3 Lambayeque', 'PROYECTOS', '2021-12-04 00:00:00', 2119, 'ENSA', 0, 1, '2021-12-09 20:12:29', NULL, '2021-12-09 20:12:29', 434, ''),
(150, 1, 3, 2, 1, 2, 4, 3, 20, 1, '', 'SDSAFGds', 'FDSFGS', 'SDF', 'SDFSDF', '2021-12-14 00:00:00', 123, 'ENSA', 1, 1, '2021-12-14 19:17:14', NULL, '2021-12-14 19:17:14', 0, ''),
(157, 1, 3, 2, 1, 2, 7, 3, 20, 1, '', 'VB', 'CVNGNF', 'DSFGDSF', 'GSDFG', '2021-12-14 00:00:00', 13, 'ENSA', 1, 1, '2021-12-14 19:56:30', NULL, '2021-12-14 19:56:30', 0, ''),
(158, 1, 3, 1, 1, 8, 7, 66, 23, 1, '', 'SDFSD', 'FSDFSDF', 'DFSDFS', 'DFSDF', '2021-12-14 00:00:00', 23, 'ENSA', 0, 1, '2021-12-14 19:58:02', NULL, '2021-12-14 19:58:02', 480, ''),
(159, 1, 18, 1, 1, 8, 8, 39, 136, 4, '', 'INSPECCIÓN DE SEGURIDAD (EPPS, EQUIPOS Y HERRAMIENTAS) DEL PERSONAL OPERATIVO Y UNIDAD MÓVIL.', 'MANTENIMIENTO DE TRANSFORMADORES – TALLER.', 'AV. SÁENZ PEÑA 1750 – CHICLAYO – TALLER DE TRANSFORMADORES.', 'UMD', '2021-12-06 00:00:00', 2021, 'ENSA', 0, 1, '2021-12-15 11:59:03', NULL, '2021-12-15 11:59:03', 481, ''),
(160, 1, 19, 1, 1, 20, 4, 88, 139, 1, '', 'INSPECCIÓN DE SEGURIDAD (EPP Y DOCUMENTACIÓN), UNIDAD MÓVIL, PERSONAL, SUPERVISOR Y CONDUCTOR, INGRESO DE ACTIVIDADES EN OBRA.', '“MEJORAMIENTO DEL ALIMENTADOR C-237; TRAMO ENTRE LAS SUBESTACIONES EN33 Y EN34, DISTRITO DE CHICLAYO, PROVINCIA DE CHICLAYO, DEPARTAMENTO DE LAMBAYEQUE”.', 'MZ D LOTE 28, URB. AMAUTA CHICLAYO', 'PROYECTOS', '2022-01-21 00:00:00', 2150, 'ENSA', 0, 1, '2022-01-24 11:47:48', NULL, '2022-01-24 11:47:48', 505, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inf_cumplimiento_des`
--

CREATE TABLE `inf_cumplimiento_des` (
  `nId` int(11) NOT NULL,
  `nIdInforme` int(11) DEFAULT NULL,
  `nIdCumplimiento` int(11) DEFAULT NULL,
  `nValor` int(11) NOT NULL,
  `nValorInc` int(11) NOT NULL,
  `cDescripcion` varchar(5000) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dCreate` datetime DEFAULT current_timestamp(),
  `dUpdate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inf_cumplimiento_des`
--

INSERT INTO `inf_cumplimiento_des` (`nId`, `nIdInforme`, `nIdCumplimiento`, `nValor`, `nValorInc`, `cDescripcion`, `nFlag`, `dCreate`, `dUpdate`) VALUES
(180, 65, 1, 1, 0, 'PERSONAL CONDUCTOR, CONTIENE DE IMPLEMENTOS DE PROTECCIÓN PERSONAL: ROPA DE TRABAJO, PROTECTOR BUCONASAL, CALZADO DE SEGURIDAD, CHALECO DE ALTA VISIBILIDAD, CASCO DIELÉCTRICO CON BARBIQUEJO, GUANTES, LENTES  DE SEGURIDAD.', 0, '2021-09-16 02:24:36', '2021-09-16 02:24:36'),
(181, 65, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA ABM-909 (CAMIONETA) DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN DE PRIMEROS AUXILIOS, LUCES OPERATIVAS, ALARMA DE RETROCESO Y HERRAMIENTAS VARIAS.', 0, '2021-09-16 02:26:05', '2021-09-16 02:26:05'),
(182, 65, 4, 1, 0, 'CONTRATISTA EVIDENCIA DE COPIAS DE PÓLIZAS SCTR Y VIDA LEY VIGENTES', 0, '2021-09-16 02:29:45', '2021-09-16 02:29:45'),
(183, 65, 4, 1, 0, 'PERSONAL, CUENTA CON CERTIFICADOS DE APTITUD MÉDICA PRE-OCUPACIONAL, SEGÚN PUESTO DE TRABAJO', 0, '2021-09-16 02:29:54', '2021-09-16 02:29:54'),
(184, 65, 5, 3, 0, 'PERSONAL DE CONTRATISTA, DEBE HACER USO DE LOS IMPLEMENTOS DE PROTECCIÓN, DURANTE EL DESARROLLO DE LAS ACTIVIDADES EN CAMPO E IDENTIFICAR Y EVALUAR LOS RIESGOS PROPIOS DE LA ACTIVIDAD PARA DETERMINAR LOS CONTROLES ADECUADOS, PARA PREVENIR INCIDENTES LABORALES Y LA PREVENCIÓN PARA EVITAR CONTAGIO POR COVID-19', 0, '2021-09-16 02:31:47', '2021-09-16 02:31:47'),
(185, 65, 5, 3, 0, 'PERSONAL CONDUCTOR CUENTA CON ESTANDAR DE MANEJO DEFENSIVO Y SU DIFUSIÓN.', 0, '2021-09-16 02:31:57', '2021-09-16 02:31:57'),
(186, 65, 6, 1, 0, 'CONTRATISTA HA SUMINISTRADO DE MASCARILLAS. ALCOHOL AL PERSONAL, PARA PREVENIR CONTAGIO POR COVID-19.', 0, '2021-09-16 02:33:52', '2021-09-16 02:33:52'),
(187, 65, 7, 1, 0, '1.	PERSONAL CONDUCTOR, IMPLEMENTADO CON EPPS BÁSICOS.\r\n2.	PERSONAL SE ENCUENTRA COBERTURADO EN PÓLIZA SCTR Y SEGURO VIDA LEY.\r\n3.	UNIDAD MÓVIL IMPLEMENTADA\r\n4.	CONTRATISTA HA DOTADO A SU PERSONAL DE ELEMENTOS DE BIOSEGURIDAD PARA PREVENCIÓN ANTE COVID-19.\r\n5.	SUPERVISOR DEL CONTRATISTA EN MOMENTO DE INSPECCIÓN.\r\n', 0, '2021-09-16 02:35:05', '2021-09-16 02:35:05'),
(188, 65, 7, 2, 0, '1.	DOTAR DE EPP A PERSONAL OPERATIVO SEGÚN LA\r\nACTIVIDAD A EJECUTAR Y NIVEL DE RIESGO EXPUESTO.\r\n2.	CONCIENTIZAR AL PERSONAL, SOBRE DISTANCIAMIENTO\r\n      SOCIAL, A FIN DE PREVENIR CONTAGIO POR COVID-19.\r\n\r\n3.	SUPERVISAR CONSTANTEMENTE LAS ACTIVIDADES QUE SE EJECUTA EN CAMPO, POR PARTE DE INGENIEROS DE\r\nCONTRATISTA\r\n', 0, '2021-09-16 02:35:26', '2021-09-16 02:35:26'),
(189, 65, 8, 1, 0, '1.	SE DIFUNDIÓ CHARLA DE INDUCCIÓN Y DIFUSIÓN DEL RISSTMA ENSA, PARA EL CUMPLIMIENTO DE NORMATIVAS DE SEGURIDAD Y PREVENCIÓN ANTE COVID-19, AL PERSONAL DE LA CONTRATISTA.', 0, '2021-09-16 02:35:45', '2021-09-16 02:35:45'),
(190, 65, 8, 1, 0, '2.	SE COORDINÓ CON EL SUPERVISOR DE SEGURIDAD, POR PARTE DEL CONTRATISTA, IMPLEMENTAR LAS RECOMENDACIONES DADAS EN EL PRESENTE INFORME, PARA EL DESARROLLO DE ACTIVIDADES OPERATIVAS DEL PERSONAL', 0, '2021-09-16 02:35:55', '2021-09-16 02:35:55'),
(191, 65, 9, 1, 0, 'SERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.”', 0, '2021-09-16 02:44:00', '2021-09-16 02:44:00'),
(192, 65, 9, 2, 0, 'ING. JUAN SANTISTEBAN VILCHEZ', 0, '2021-09-16 02:44:34', '2021-09-16 02:44:34'),
(193, 65, 9, 3, 0, 'ING. JESUS CASTRO PISCOYA (950207320)', 0, '2021-09-16 02:44:50', '2021-09-16 02:44:50'),
(194, 65, 9, 4, 0, 'ING. CARLOS GARCIA GONZALES (979608286)', 0, '2021-09-16 02:45:03', '2021-09-16 02:45:03'),
(195, 69, 12, 1, 0, 'DFDHRT', 0, '2021-09-19 10:04:36', '2021-09-19 10:04:36'),
(196, 69, 18, 1, 0, 'GHJFHJFGH', 0, '2021-09-19 10:04:55', '2021-09-19 10:04:55'),
(197, 69, 18, 2, 0, 'GHRYHTY', 0, '2021-09-19 10:05:00', '2021-09-19 10:05:00'),
(198, 69, 19, 1, 0, 'FGJUJMYU', 0, '2021-09-19 10:05:08', '2021-09-19 10:05:08'),
(199, 70, 18, 1, 0, 'sdfdf', 0, '2021-09-19 10:19:28', '2021-09-19 10:19:28'),
(200, 70, 19, 1, 0, 'bdgbf', 0, '2021-09-19 10:21:21', '2021-09-19 10:21:21'),
(201, 72, 1, 1, 0, 'PERSONAL CONDUCTOR, CONTIENE DE IMPLEMENTOS DE PROTECCIÓN PERSONAL: ROPA DE TRABAJO, PROTECTOR BUCONASAL, CALZADO DE SEGURIDAD, CHALECO DE ALTA VISIBILIDAD, CASCO DIELÉCTRICO CON BARBIQUEJO, GUANTES, LENTES  DE SEGURIDAD.', 0, '2021-09-20 18:01:05', '2021-09-20 18:01:05'),
(202, 72, 2, 3, 0, '', 0, '2021-09-20 18:01:59', '2021-09-20 18:01:59'),
(203, 72, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA ABM-909 (CAMIONETA) DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN DE PRIMEROS AUXILIOS, LUCES OPERATIVAS, ALARMA DE RETROCESO Y HERRAMIENTAS VARIAS.', 0, '2021-09-20 18:02:17', '2021-09-20 18:02:17'),
(204, 72, 4, 1, 0, 'CONTRATISTA EVIDENCIA DE COPIAS DE PÓLIZAS SCTR Y VIDA LEY VIGENTES', 0, '2021-09-20 18:03:09', '2021-09-20 18:03:09'),
(205, 72, 4, 1, 0, 'PERSONAL, CUENTA CON CERTIFICADOS DE APTITUD MÉDICA PRE-OCUPACIONAL, SEGÚN PUESTO DE TRABAJO', 0, '2021-09-20 18:03:17', '2021-09-20 18:03:17'),
(206, 72, 5, 3, 0, 'PERSONAL DE CONTRATISTA, DEBE HACER USO DE LOS IMPLEMENTOS DE PROTECCIÓN, DURANTE EL DESARROLLO DE LAS ACTIVIDADES EN CAMPO E IDENTIFICAR Y EVALUAR LOS RIESGOS PROPIOS DE LA ACTIVIDAD PARA DETERMINAR LOS CONTROLES ADECUADOS, PARA PREVENIR INCIDENTES LABORALES Y LA PREVENCIÓN PARA EVITAR CONTAGIO POR COVID-19', 0, '2021-09-20 18:03:54', '2021-09-20 18:03:54'),
(207, 72, 5, 3, 0, 'PERSONAL CONDUCTOR CUENTA CON ESTANDAR DE MANEJO DEFENSIVO Y SU DIFUSIÓN.', 0, '2021-09-20 18:04:04', '2021-09-20 18:04:04'),
(208, 72, 6, 1, 0, 'CONTRATISTA HA SUMINISTRADO DE MASCARILLAS. ALCOHOL AL PERSONAL, PARA PREVENIR CONTAGIO POR COVID-19.', 0, '2021-09-20 18:04:41', '2021-09-20 18:04:41'),
(209, 72, 7, 1, 0, 'PERSONAL CONDUCTOR, IMPLEMENTADO CON EPPS BÁSICOS.', 0, '2021-09-20 18:05:35', '2021-09-20 18:05:35'),
(210, 72, 7, 1, 0, 'PERSONAL SE ENCUENTRA COBERTURADO EN PÓLIZA SCTR Y SEGURO VIDA LEY.', 0, '2021-09-20 18:05:46', '2021-09-20 18:05:46'),
(211, 72, 7, 1, 0, 'UNIDAD MÓVIL IMPLEMENTADA', 0, '2021-09-20 18:05:57', '2021-09-20 18:05:57'),
(212, 72, 7, 1, 0, 'CONTRATISTA HA DOTADO A SU PERSONAL DE ELEMENTOS DE BIOSEGURIDAD PARA PREVENCIÓN ANTE COVID-19.', 0, '2021-09-20 18:06:08', '2021-09-20 18:06:08'),
(213, 72, 7, 1, 0, 'SUPERVISOR DEL CONTRATISTA EN MOMENTO DE INSPECCIÓN.', 0, '2021-09-20 18:06:19', '2021-09-20 18:06:19'),
(214, 72, 7, 2, 0, 'DOTAR DE EPP A PERSONAL OPERATIVO SEGÚN LA ACTIVIDAD A EJECUTAR Y NIVEL DE RIESGO EXPUESTO.\r\n', 0, '2021-09-20 18:06:38', '2021-09-20 18:06:38'),
(215, 72, 7, 2, 0, 'CONCIENTIZAR AL PERSONAL, SOBRE DISTANCIAMIENTO SOCIAL, A FIN DE PREVENIR CONTAGIO POR COVID-19.\r\n', 0, '2021-09-20 18:06:56', '2021-09-20 18:06:56'),
(216, 72, 7, 2, 0, 'SUPERVISAR CONSTANTEMENTE LAS ACTIVIDADES QUE SE EJECUTA EN CAMPO, POR PARTE DE INGENIEROS DE CONTRATISTA\r\n', 0, '2021-09-20 18:07:13', '2021-09-20 18:07:13'),
(217, 72, 8, 1, 0, 'SE DIFUNDIÓ CHARLA DE INDUCCIÓN Y DIFUSIÓN DEL RISSTMA ENSA, PARA EL CUMPLIMIENTO DE NORMATIVAS DE SEGURIDAD Y PREVENCIÓN ANTE COVID-19, AL PERSONAL DE LA CONTRATISTA.', 0, '2021-09-20 18:07:38', '2021-09-20 18:07:38'),
(218, 72, 8, 1, 0, 'SE COORDINÓ CON EL SUPERVISOR DE SEGURIDAD, POR PARTE DEL CONTRATISTA, IMPLEMENTAR LAS RECOMENDACIONES DADAS EN EL PRESENTE INFORME, PARA EL DESARROLLO DE ACTIVIDADES OPERATIVAS DEL PERSONAL', 0, '2021-09-20 18:07:49', '2021-09-20 18:07:49'),
(219, 72, 9, 1, 0, 'SERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.”', 0, '2021-09-20 18:17:44', '2021-09-20 18:17:44'),
(220, 72, 9, 2, 0, 'ING. JUAN SANTISTEBAN VILCHEZ', 0, '2021-09-20 18:17:54', '2021-09-20 18:17:54'),
(221, 72, 9, 3, 0, 'ING. JESUS CASTRO PISCOYA (950207320)', 0, '2021-09-20 18:18:02', '2021-09-20 18:18:02'),
(222, 72, 9, 4, 0, 'ING. CARLOS GARCIA GONZALES (979608286)', 0, '2021-09-20 18:18:13', '2021-09-20 18:18:13'),
(223, 73, 1, 1, 0, 'PERSONAL CONDUCTOR, CONTIENE DE IMPLEMENTOS DE PROTECCIÓN PERSONAL: ROPA DE TRABAJO, PROTECTOR BUCONASAL, CALZADO DE SEGURIDAD, CHALECO DE ALTA VISIBILIDAD, CASCO DIELÉCTRICO CON BARBIQUEJO, GUANTES, LENTES  DE SEGURIDAD.', 0, '2021-09-20 20:24:37', '2021-09-20 20:24:37'),
(224, 73, 2, 3, 0, '', 0, '2021-09-20 20:25:03', '2021-09-20 20:25:03'),
(225, 73, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA ABM-909 (CAMIONETA) DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN DE PRIMEROS AUXILIOS, LUCES OPERATIVAS, ALARMA DE RETROCESO Y HERRAMIENTAS VARIAS.', 0, '2021-09-20 20:25:16', '2021-09-20 20:25:16'),
(226, 73, 4, 1, 0, 'CONTRATISTA EVIDENCIA DE COPIAS DE PÓLIZAS SCTR Y VIDA LEY VIGENTES', 0, '2021-09-20 20:25:56', '2021-09-20 20:25:56'),
(227, 73, 4, 1, 0, 'PERSONAL, CUENTA CON CERTIFICADOS DE APTITUD MÉDICA PRE-OCUPACIONAL, SEGÚN PUESTO DE TRABAJO', 0, '2021-09-20 20:26:04', '2021-09-20 20:26:04'),
(228, 73, 5, 3, 0, 'PERSONAL DE CONTRATISTA, DEBE HACER USO DE LOS IMPLEMENTOS DE PROTECCIÓN, DURANTE EL DESARROLLO DE LAS ACTIVIDADES EN CAMPO E IDENTIFICAR Y EVALUAR LOS RIESGOS PROPIOS DE LA ACTIVIDAD PARA DETERMINAR LOS CONTROLES ADECUADOS, PARA PREVENIR INCIDENTES LABORALES Y LA PREVENCIÓN PARA EVITAR CONTAGIO POR COVID-19', 0, '2021-09-20 20:26:34', '2021-09-20 20:26:34'),
(229, 73, 5, 3, 0, 'PERSONAL CONDUCTOR CUENTA CON ESTANDAR DE MANEJO DEFENSIVO Y SU DIFUSIÓN.', 0, '2021-09-20 20:26:42', '2021-09-20 20:26:42'),
(230, 73, 6, 1, 0, 'CONTRATISTA HA SUMINISTRADO DE MASCARILLAS. ALCOHOL AL PERSONAL, PARA PREVENIR CONTAGIO POR COVID-19.', 0, '2021-09-20 20:27:17', '2021-09-20 20:27:17'),
(231, 73, 7, 1, 0, '1.	PERSONAL CONDUCTOR, IMPLEMENTADO CON EPPS BÁSICOS.\r\n2.	PERSONAL SE ENCUENTRA COBERTURADO EN PÓLIZA SCTR Y SEGURO VIDA LEY.\r\n3.	UNIDAD MÓVIL IMPLEMENTADA\r\n4.	CONTRATISTA HA DOTADO A SU PERSONAL DE ELEMENTOS DE BIOSEGURIDAD PARA PREVENCIÓN ANTE COVID-19.\r\n5.	SUPERVISOR DEL CONTRATISTA EN MOMENTO DE INSPECCIÓN.', 0, '2021-09-20 20:27:48', '2021-09-20 20:27:48'),
(232, 73, 7, 2, 0, '1.	DOTAR DE EPP A PERSONAL OPERATIVO SEGÚN LA ACTIVIDAD A EJECUTAR Y NIVEL DE RIESGO EXPUESTO.\r\n2.	CONCIENTIZAR AL PERSONAL, SOBRE DISTANCIAMIENTO SOCIAL, A FIN DE PREVENIR CONTAGIO POR COVID-19.\r\n\r\n3.	SUPERVISAR CONSTANTEMENTE LAS ACTIVIDADES QUE SE EJECUTA EN CAMPO, POR PARTE DE INGENIEROS DE CONTRATISTA.\r\n', 0, '2021-09-20 20:28:16', '2021-09-20 20:28:16'),
(233, 73, 8, 1, 0, '1.	SE DIFUNDIÓ CHARLA DE INDUCCIÓN Y DIFUSIÓN DEL RISSTMA ENSA, PARA EL CUMPLIMIENTO DE NORMATIVAS DE SEGURIDAD Y PREVENCIÓN ANTE COVID-19, AL PERSONAL DE LA CONTRATISTA.\r\n2.	SE COORDINÓ CON EL SUPERVISOR DE SEGURIDAD, POR PARTE DEL CONTRATISTA, IMPLEMENTAR LAS RECOMENDACIONES DADAS EN EL PRESENTE INFORME, PARA EL DESARROLLO DE ACTIVIDADES OPERATIVAS DEL PERSONAL\r\n', 0, '2021-09-20 20:28:35', '2021-09-20 20:28:35'),
(234, 73, 9, 1, 0, 'SERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.”', 0, '2021-09-20 20:32:58', '2021-09-20 20:32:58'),
(235, 73, 9, 2, 0, 'ING. JUAN SANTISTEBAN VILCHEZ', 0, '2021-09-20 20:33:08', '2021-09-20 20:33:08'),
(236, 73, 9, 3, 0, 'ING. JESUS CASTRO PISCOYA (950207320)', 0, '2021-09-20 20:33:22', '2021-09-20 20:33:22'),
(237, 73, 9, 4, 0, 'ING. CARLOS GARCIA GONZALES (979608286)', 0, '2021-09-20 20:33:35', '2021-09-20 20:33:35'),
(238, 76, 12, 1, 0, 'INSTALACIONES DE LA OFICINA DE ATENCIÓN AL CLIENTE Y COBRANZA, CUENTA CON VENTILACIÓN NATURAL;  ASÍ MISMO, DICHO RECINTO POSEE DE ILUMINACIÓN NATURAL Y ARTIFICIAL', 0, '2021-09-20 21:01:43', '2021-09-20 21:01:43'),
(239, 76, 12, 2, 0, 'INSTALACIONES DE LA OFICINA ENSA LAMBAYEQUE, CUENTA CON ILUMINACIÓN ARTIFICIAL EN AMBIENTES DE OFICINA DE CONTROL DE PERDIDAS, COMERCIAL, ATENCIÓN AL CLIENTE; SE EVIDENCIA DE LUMINARIAS (FLUORESCENTES), EN MAL ESTADO. (INCUMPLIMIENTO AL ART. 137 DEL RESESATE)', 0, '2021-09-20 21:01:53', '2021-09-20 21:01:53'),
(240, 76, 12, 3, 0, 'SE REALIZA VERIFICACIÓN DE LA LUMINOSIDAD DE LOS AMBIENTES DE OFICINA ENSA LAMBAYEQUE, CON LUXÓMETRO (DEL ALMACÉN ENSA, NO CUENTA CON CALIBRACIÓN), TENIENDO VALORES MENORES A 110 LUX. (INCUMPLIMIENTO AL C.N.E', 0, '2021-09-20 21:02:02', '2021-09-20 21:02:02'),
(241, 76, 13, 1, 0, 'AMBIENTES DE ATENCIÓN AL CLIENTE Y PÚBLICO EN GENERAL, ÁREA DE DISTRIBUCIÓN, SE ENCUENTRAN LIMPIOS Y ORDENADOS.', 0, '2021-09-20 21:02:51', '2021-09-20 21:02:51'),
(242, 76, 13, 2, 0, 'LADO POSTERIOR DE ALMACÉN DE MATERIALES EN DESUSO, SIN DELIMITAR NI SEÑALIZAR; EN PATIO, SE OBSERVAN CARRETES DE CONDUCTORES Y SIN UN LUGAR ESPECÍFICO DE ALMACENAMIENTO, ADEMÁS DE CAJAS DE CARTÓN Y FLEJES DE METAL, EN OFICINAS SE OBSERVAN CAJAS DE CARTÓN EN EL PISO, MESAS MAL UBICADAS EN ÁREA DE REUNIONES; EN ALMACÉN MERCADERÍA EN EL PISO, PASILLOS MENORES A 90 CM.(INCUMPLIMIENTOS AL ART. 111 DEL RESESATE 2013)', 0, '2021-09-20 21:03:02', '2021-09-20 21:03:02'),
(243, 76, 14, 2, 0, 'INSTALACIONES DE ENSA, CUENTAN CON (04) SERVICIOS HIGIÉNICOS (TRES EN AMBIENTE ALMACÉN DE MATERIALES EN DESUSO Y OTRO DE DAMAS CERCANO AL PATIO). PERO CARECEN DE ÚTILES DE ASEO PERSONAL (JABÓN, PAPEL HIGIÉNICO)', 0, '2021-09-20 21:03:59', '2021-09-20 21:03:59'),
(244, 76, 15, 1, 0, 'AMBIENTES CUENTAN CON PARTE DE LA SEÑALIZACIÓN DE DEFENSA CIVIL (AFORO, RIESGO ELÉCTRICO SALIDA, ZONA SEGURA Y EXTINTOR).', 0, '2021-09-20 21:04:16', '2021-09-20 21:04:16'),
(245, 76, 15, 2, 0, 'INSTALACIÓN DE ATENCIÓN AL CLIENTE Y COBRANZA, NO CUENTA CON MAPA DE RIESGOS. (INCUMPLIMIENTO AL ART. 11 (D) DEL RESESATE 2013)', 0, '2021-09-20 21:04:25', '2021-09-20 21:04:25'),
(246, 76, 15, 1, 0, 'INSTALACIÓN EVIDENCIA SEÑALÉTICA PARA PREVENCIÓN DE COVID-19.', 0, '2021-09-20 21:04:37', '2021-09-20 21:04:37'),
(247, 76, 16, 1, 0, 'INSTALACIÓN CUENTA CON 4 EXTINTORES TIPO PQS DE 06 KG VIGENTES (FV: SEPTIEMBRE 2021) Y CON REGISTRO DE TARJETA DE INSPECCIÓN AL DÍA, ADEMÁS DE 02 EXTINTOR CO2 DE 10 LB, (FV: SEPTIEMBRE Y OCTUBRE 2021)', 0, '2021-09-20 21:04:55', '2021-09-20 21:04:55'),
(248, 76, 16, 3, 0, 'INSTALACIÓN  CUENTA CON BOTIQUÍN PRIMEROS AUXILIOS, NO SE PUDO VERIFICAR CONTENIDO, DEBIDO ESTABA CON LLAVE', 0, '2021-09-20 21:05:07', '2021-09-20 21:05:07'),
(249, 76, 16, 2, 0, 'INSTALACIONES CUENTAN CON LUCES DE EMERGENCIA,  PARTE DE ELLAS NO OPERATIVAS', 0, '2021-09-20 21:05:15', '2021-09-20 21:05:15'),
(250, 76, 16, 1, 0, 'INSTALACIÓN, EVIDENCIA CAMILLA COMO PARTE DEL EQUIPAMIENTO DE EMERGENCIA FRENTE A CONTINGENCIAS LABORALES.', 0, '2021-09-20 21:05:23', '2021-09-20 21:05:23'),
(251, 76, 16, 2, 0, 'EXTINTOR EN ÁREA DE REUNIONES OBSTRUIDO POR MESAS, ADEMÁS CAJA PORTA EXTINTOR DE  VIGILANCIA NECESITA DE MANTENIMIENTO.(OXIDADO Y BROCHE DE CIERRE EN MAL ESTADO)', 0, '2021-09-20 21:05:32', '2021-09-20 21:05:32'),
(252, 76, 17, 2, 0, 'INSTALACIONES NO EVIDENCIA DE CERTIFICADO DE DEFENSA CIVIL Y LICENCIA MUNICIPAL DE FUNCIONAMIENTO. (INCUMPLIMIENTO AL ART. 3 LEY 28976 LEY DE MARCO DE LICENCIA DE FUNCIONAMIENTO, ART. 37 DS 058- 2014 PCM, REGLAMENTO DE INSPECCIONES TÉCNICAS DE SEGURIDAD DE EDIFICACIONES)', 0, '2021-09-20 21:05:54', '2021-09-20 21:05:54'),
(253, 76, 17, 2, 0, 'INSTALACIÓN, NO EVIDENCIA DE CERTIFICADO DE FUMIGACIÓN Y/O DESINFECCIÓN.', 0, '2021-09-20 21:06:02', '2021-09-20 21:06:02'),
(254, 76, 17, 1, 0, 'SE EVIDENCIA VIGILANCIA DE SEGURIDAD EN OFICINA DE ATENCIÓN AL CLIENTE, COBRANZA Y PUERTA DE INGRESO DE LAS UNIDADES MÓVILES.', 0, '2021-09-20 21:06:10', '2021-09-20 21:06:10'),
(255, 76, 17, 2, 0, 'INSTALACIÓN EVIDENCIA MATERIAL DE SEGUNDO USO Y ACCESORIOS ELÉCTRICOS DISPERSOS SIN DELIMITACIÓN Y SEÑALIZACIÓN, Y LUGAR DEFINIDO. (INCUMPLIMIENTO AL LEY 27314, LEY GENERAL DE RESIDUOS SÓLIDOS D.S N° 057-2004-PCM).', 0, '2021-09-20 21:06:23', '2021-09-20 21:06:23'),
(256, 76, 17, 2, 0, 'SE EVIDENCIA EN LA PARTE POSTERIOR DE LAS INSTALACIONES LLAVES TÉRMICAS EXPUESTAS A LA INTEMPERIE. (INCUMPLIMIENTO A LA SECCIÓN 080 Y 150 DEL CNE UTILIZACIÓN - 2006)', 0, '2021-09-20 21:06:32', '2021-09-20 21:06:32'),
(257, 76, 17, 2, 0, 'INSTALACIONES CARECEN DE KIT DE COLORES PARA RESIDUOS SÓLIDOS, SOLO SE EVIDENCIA DE UN TACHO COLOR ROJO PARA MATERIALES PELIGROSOS, PERO ESTE EN SU INTERIOR CONTIENE RESIDUOS VARIOS. (INCUMPLIMIENTO AL LEY 27314, LEY GENERAL DE RESIDUOS SÓLIDOS D.S N° 057-2004-PCM).', 0, '2021-09-20 21:06:42', '2021-09-20 21:06:42'),
(258, 76, 18, 1, 0, '1.	INSTALACIONES EVIDENCIAN DE ILUMINACIÓN ARTIFICIAL Y NATURAL DEFICIENTE, NO CUMPLE CON LO ESTABLECIDO EN CNE, PARA EL CASO DE OFICINAS\r\n2.	 AMBIENTE CUENTA CON SERVICIOS HIGIÉNICOS EN BUEN ESTADO, PERO CARECEN DE ARTÍCULOS DE ASEO PERSONAL.\r\n3.	INSTALACIONES CUENTAN CON PARTE DE LAS SEÑALIZACIONES DE DEFENSA CIVIL Y SEÑALÉTICAS DE BIOSEGURIDAD.\r\n4.	 AMBIENTES NO EVIDENCIAN CON CERTIFICADO DE FUMIGACIÓN Y LICENCIA DE FUNCIONAMIENTO.\r\n5.	INSTALACIONES CARECE DE CERTIFICADO DE DEFENSA CIVIL.\r\n6.	INSTALACIONES NO CUENTAN CON MAPA DE RIESGOS Y EVACUACIÓN.\r\n7.	INSTALACIONES CUENTAN CON MATERIAL DE SEGUNDO USO SIN ORDEN Y SEÑALIZACIÓN, OBSTRUYENDO ÁREAS DE ACCESO.\r\n', 0, '2021-09-20 21:07:03', '2021-09-20 21:07:03'),
(259, 76, 18, 2, 0, '1.	MEJORAR ILUMINACIÓN DE AMBIENTES DE OFICINAS.\r\n2.	REALIZAR LIMPIEZA DE FORMA PERMANENTE AMBIENTES DE PATIO DE INGRESO, POSTERIOR Y OFICINAS.\r\n2. REALIZAR INSPECCIONES PERIÓDICAS A EXTINTORES Y\r\nREGISTRAR EN TARJETAS DE CONTROL.\r\n3. CAPACITAR AL PERSONAL EN USO DE EXTINTORES.\r\n4. DAR TRÁMITE CORRESPONDIENTE PARA EVIDENCIAR\r\nCERTIFICADO DE DEFENSA CIVIL.\r\n5.  ORDENAR ALMACÉN DE MATERIAL DE SEGUNDO USO.\r\n6. DESECHAR RESIDUOS SÓLIDOS Y DISPONER EN LUGAR ADECUADO.\r\n', 0, '2021-09-20 21:07:10', '2021-09-20 21:07:10'),
(260, 76, 19, 1, 0, 'ELEVAR EL PRESENTE INFORME AL DEPARTAMENTO DE SEGURIDAD Y SALUD EN EL TRABAJO Y MEDIO AMBIENTE, PARA LAS COORDINACIONES CON EL ÁREA DE COMPETENCIA, CON LA FINALIDAD DE REALIZAR LAS CORRECCIONES PERTINENTES EN UN CORTO PLAZO, DE LAS DEFICIENCIAS ENCONTRADAS EN LAS INSTALACIONES DE ENSA LAMBAYEQUE, CON LA FINALIDAD DE EVITAR ACCIDENTES DE PERSONAL PROPIO O PERSONAL TERCERO Y/O PÉRDIDAS DE MATERIALES Y EQUIPOS; TENER EN CUENTA QUE INCUMPLIMIENTOS SON REITERATIVOS.', 0, '2021-09-20 21:07:22', '2021-09-20 21:07:22'),
(261, 79, 1, 1, 0, '', 0, '2021-09-23 17:46:01', '2021-09-23 17:46:01'),
(262, 79, 1, 1, 0, 'PERSONAL CUENTA CON EPPS Y UNIFORME EN BUEN ESTADO, ADEMAS CON FOTOCHECK DE IDENTIFICACION', 0, '2021-09-23 17:46:50', '2021-09-23 17:46:50'),
(263, 79, 1, 2, 0, '', 0, '2021-09-23 18:04:44', '2021-09-23 18:04:44'),
(264, 65, 2, 2, 0, 'ghfghfg', 0, '2021-09-23 19:45:29', '2021-09-23 19:45:29'),
(265, 69, 13, 1, 0, 'sdfsdf', 0, '2021-09-25 19:34:24', '2021-09-25 19:34:24'),
(266, 84, 1, 1, 0, 'EFGDSG', 1, '2021-09-27 01:32:09', '2021-09-27 01:32:09'),
(267, 88, 1, 1, 0, 'PERSONAL AYUDANTE CUENTA CON EPPS BÁSICOS PARA REALIZAR LA ACTIVIDAD (ZAPATOS DIELÉCTRICOS, CASCO DIELÉCTRICO, GUANTES DE CUERO Y LENTES DE SEGURIDAD). ', 0, '2021-10-02 14:22:21', '2021-10-02 14:22:21'),
(268, 88, 1, 3, 0, 'SE EVIDENCIA QUE EL PERSONAL AYUDANTE NO CUENTA CON FOTOCHECK', 0, '2021-10-02 14:22:35', '2021-10-02 14:22:35'),
(269, 88, 2, 1, 0, 'CUENTA CON ELEMENTOS DE SEÑALIZACIÓN Y DELIMITACIÓN.', 0, '2021-10-02 14:24:52', '2021-10-02 14:24:52'),
(270, 88, 3, 1, 0, 'SE REALIZÓ LA INSPECCIÓN DEL VEHÍCULO DE PLACA C7G – 871, CUMPLE CON LO SOLICITADO POR ENSA', 0, '2021-10-02 14:25:09', '2021-10-02 14:25:09'),
(271, 88, 3, 2, 0, 'SE EVIDENCIA QUE LA MANIJA INTERIOR QUE ABRE LA PUERTA LADO DERECHO DEL VEHÍCULO ESTÁ EN MAL ESTADO.', 0, '2021-10-02 14:25:19', '2021-10-02 14:25:19'),
(272, 88, 4, 1, 0, 'CUENTAN CON COPIA PETS, IPERC, FLUJOGRAMA ANTE UNA EMERGENCIA, PÓLIZA SCTR (SALUD Y PENSIÓN) VIGENTE Y SEGURO VIDA LEY, EXÁMENES MÉDICOS PREOCUPACIONALES.', 0, '2021-10-02 14:26:02', '2021-10-02 14:26:02'),
(273, 88, 5, 3, 0, 'NO SE EVALUÓ', 0, '2021-10-02 14:28:56', '2021-10-02 14:28:56'),
(274, 88, 6, 1, 0, 'SE LE BRINDA CHARLA DE INDUCCIÓN AL PERSONAL ANTES DE INGRESAR A LABORAR Y ENTREGA DEL REGLAMENTO INTERNO DE OBRITEC SAC.', 0, '2021-10-02 14:29:14', '2021-10-02 14:29:14'),
(275, 88, 6, 1, 0, 'SE LE PROPORCIONA MASCARILLA PARA EVITAR EL CONTAGIO DE LA COVID-19', 0, '2021-10-02 14:29:25', '2021-10-02 14:29:25'),
(276, 88, 7, 1, 0, '1.	SE ENTREGA LOS EPPS (CASCO DIELÉCTRICO, GUANTES DE CUERO, ZAPATOS DIELÉCTRICOS) Y UNIFORME AL PERSONAL AYUDANTE QUE INGRESARÁN A REALIZAR ACTIVIDADES.\r\n2.	OBRITEC CUENTA CON PETS, IPERC, PLAN DE CONTINGENCIA PARA LAS ACTIVIDADES QUE REALIZA, ADEMÁS EL PERSONAL QUE VA INGRESAR CUENTA CON PÓLIZA SCTR VIGENTE, NI PÓLIZA VIDA LEY Y SEGURO DE ACCIDENTES PERSONALES Y EXÁMENES PRE OCUPACIONALES. \r\n3.	SE LE ENTREGA MASCARILLAS PARA LA PREVENCIÓN DEL CONTAGIO DE LA COVID-19.\r\n4.	SE LE ENTREGA EL REGLAMENTO INTERNO DE OBRITEC A CADA TRABAJADOR.\r\n5.	SE EVIDENCIA QUE NO EXISTE SEPARACIÓN ENTRE EL AMBIENTE DE PASAJEROS Y LA TOLVA DEL CAMIÓN.\r\n', 0, '2021-10-02 14:30:01', '2021-10-02 14:30:01'),
(277, 88, 7, 2, 0, '1.	SE RECOMIENDA REALIZAR LA CAPACITACIÓN ESPECÍFICA EN LAS ACTIVIDADES QUE VAN A REALIZAR EL PERSONAL QUE INGRESA.\r\n2.	SE RECOMIENDA QUE EL CAMIÓN SOLO SE UTILICE SOLO PARA EL TRANSPORTE DE MATERIALES Y NO PASAJEROS.', 0, '2021-10-02 14:30:14', '2021-10-02 14:30:14'),
(278, 88, 8, 1, 0, '1.	DERIVAR A QUIEN CORRESPONDA Y LEVANTAR OBSERVACIONES E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.\r\n2.	SE LE ENTREGO FOTOCHECK AL PERSONAL.', 0, '2021-10-02 14:30:35', '2021-10-02 14:30:35'),
(279, 89, 1, 1, 0, 'PERSONAL OPERATIVO, CONTIENE DE IMPLEMENTOS BÁSICOS DE PROTECCIÓN PERSONAL: CASCO DIELÉCTRICO CON BARBIQUEJO, GUANTES CUERO, ROPA DE TRABAJO, GUANTES DIELÉCTRICOS BT, SOBREGUANTES, CHALECO DE ALTA VISIBILIDAD, PROTECCIÓN BUCONASAL, LENTES DE SEGURIDAD Y CALZADO DIELÉCTRICO.', 1, '2021-10-04 14:31:20', '2021-10-04 14:31:20'),
(280, 89, 1, 1, 0, 'PERSONAL TÉCNICO, CUENTA CON HERRAMIENTAS MANUALES (PALANAS, BARRETAS) EN ESTADO OPERATIVO.', 0, '2021-10-04 14:31:33', '2021-10-04 14:31:33'),
(281, 89, 2, 1, 0, 'GRUPO DE TRABAJO, REALIZA LA SEÑALIZACIÓN Y DELIMITACIÓN DE ÁREAS DE TRABAJO (CACHACOS, MALLA TIPO FAENA Y CINTA SEÑALIZADORA).', 0, '2021-10-04 14:32:55', '2021-10-04 14:32:55'),
(282, 89, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA T9R-831 (CAMIONETA), DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, FGHJKLÑ{CIÓN, EXTINTOR, BOTIQUÍN DE PRIMEROS AUXILIOS, ALARMA DE RETROCESO, CONOS, TACOS Y HERRAMIENTAS VARIAS.   ', 0, '2021-10-04 14:33:31', '2021-10-04 14:33:31'),
(283, 89, 4, 1, 0, '45TYFGUHIJKLÑ{}\r\nPÓLIZA DE SEGURO VIDA LEY, VIGENTES.', 0, '2021-10-04 14:34:26', '2021-10-04 14:34:26'),
(284, 89, 4, 1, 0, 'GRUPO DE TRABAJO, EVIDENCIA EL REGISTRO DE LA CHARLA DE SEGURIDAD; PREVIO AL DESARROLLO DE LA ACTIVIDAD', 0, '2021-10-04 14:34:37', '2021-10-04 14:34:37'),
(285, 89, 4, 1, 0, 'GRUPO DE TRABAJO CUENTA CON PETS, IPERC Y PLAN DE CONTINGENCIAS EN ZONA DE TRABAJO, ASÍ MISMO EVIDENCIA DIFUSIÓN RESPECTIVA.', 0, '2021-10-04 14:34:48', '2021-10-04 14:34:48'),
(286, 89, 4, 1, 0, 'CONDUCTOR EVIDENCIA LICENCIA DE CONDUCIR ACORDE A LA CATEGORÍA DEL VEHÍCULO A CONDUCIR.', 0, '2021-10-04 14:34:58', '2021-10-04 14:34:58'),
(287, 89, 5, 1, 0, 'SUPERVISIÓN POR PARTE DEL CONTRATISTA (INGENIEROS DE CAMPO Y SUPERVISOR DE SEGURIDAD), EN ZONA DE TRABAJO, DURANTE DESARROLLO DE LA ACTIVIDAD.', 0, '2021-10-04 14:36:41', '2021-10-04 14:36:41'),
(288, 89, 5, 1, 0, 'PERSONAL HACE USO DE LOS EPPS, DURANTE DESARROLLO DE SUS ACTIVIDADES. ', 0, '2021-10-04 14:36:52', '2021-10-04 14:36:52'),
(289, 89, 6, 1, 0, 'CONTRATISTA, SUMINISTRA AL GRUPO DE TRABAJO DE AGUA PARA SU CONSUMO, DURANTE EL DESARROLLO DE LAS ACTIVIDADES OPERATIVAS, EN ZONA DE TRABAJO.', 0, '2021-10-04 14:37:43', '2021-10-04 14:37:43'),
(290, 89, 6, 1, 0, 'CONTRATISTA HA SUMINISTRADO DE ALCOHOL Y MASCARILLAS (PROTECTORES BUCONASALES) A SU PERSONAL, PARA EVITAR CONTAGIO POR ENFERMEDAD DE COVID-19. ', 0, '2021-10-04 14:37:52', '2021-10-04 14:37:52'),
(291, 89, 7, 1, 0, 'PERSONAL OPERATIVO, CUENTA CON EPP BÁSICO, PARA EJECUTAR SUS ACTIVIDADES OPERATIVAS EN CAMPO.', 0, '2021-10-04 14:38:29', '2021-10-04 14:38:29'),
(292, 89, 7, 1, 0, 'PERSONAL COBERTURADO EN PÓLIZA SCTR Y SEGURO VIDA LEY.', 0, '2021-10-04 14:38:39', '2021-10-04 14:38:39'),
(293, 89, 7, 1, 0, 'CAMIONETA IMPLEMENTADA DE ACUERDO A LAS NORMAS DEL MTC', 0, '2021-10-04 14:38:48', '2021-10-04 14:38:48'),
(294, 89, 7, 1, 0, 'PRESENTAN PETS DE LA ACTIVIDAD, IPERC, CHARLA ', 0, '2021-10-04 14:39:00', '2021-10-04 14:39:00'),
(295, 89, 7, 1, 0, 'CONTRATISTA HA DOTADO DE ALCOHOL Y MASCARILLAS PARA PROTECCIÓN DE CONTAGIO DE ENFERMEDAD COVID19.', 0, '2021-10-04 14:39:19', '2021-10-04 14:39:19'),
(296, 89, 7, 2, 0, 'INSPECCIONAR PERIÓDICAMENTE LOS EPP A PERSONAL OPERATIVO SEGÚN ACTIVIDAD Y RIESGOS EXPUESTOS.', 0, '2021-10-04 14:39:32', '2021-10-04 14:39:32'),
(297, 89, 7, 2, 0, 'CONTRATISTA DEBE DIFUNDIR PETS A SU PERSONAL Y EVIDENCIAR REGISTRO DE DIFUSIÓN.\r\n', 0, '2021-10-04 14:39:48', '2021-10-04 14:39:48'),
(298, 89, 7, 2, 0, 'PARA TRANSPORTE DE PERSONAL, UNIDAD MÓVIL DEBE DE IMPLEMENTARSE BARRERAS FÍSICAS AL INTERIOR DE CABINA Y CONTAR CON PERMISO POR LA AUTORIDAD DE COMPETENCIA. ', 0, '2021-10-04 14:40:05', '2021-10-04 14:40:05'),
(299, 89, 7, 2, 0, 'SUPERVISIÓN CONSTANTE, POR PARTE DE INGENIEROS DE CONTRATISTA, DURANTE DESARROLLO DE ACTIVIDADES EN CAMPO\r\n', 0, '2021-10-04 14:40:26', '2021-10-04 14:40:26'),
(300, 89, 8, 1, 0, '1.	SE COORDINÓ CON EL ING. LUIS ALBERTO LACHE RODAS, SUPERVISOR DE SEGURIDAD, IMPLEMENTAR RECOMENDACIONES DADAS EN EL PRESENTE INFORME DANDO CUMPLIMIENTO AL RESESATE 2013 Y NORMAS DE SEGURIDAD.   ', 0, '2021-10-04 14:40:58', '2021-10-04 14:40:58'),
(301, 89, 8, 1, 0, '2.	SE DIFUNDIÓ CHARLA DE PRIMEROS AUXILIOS, AL PERSONAL DE LA CONTRATISTA. ', 0, '2021-10-04 14:41:08', '2021-10-04 14:41:08'),
(302, 90, 1, 1, 0, 'SDFASDFADSF', 0, '2021-10-05 12:25:43', '2021-10-05 12:25:43'),
(303, 91, 1, 1, 0, 'PERSONAL CONDUCTOR, CONTIENE DE IMPLEMENTOS DE PROTECCIÓN PERSONAL: ROPA DE TRABAJO, PROTECTOR BUCONASAL, CALZADO DE SEGURIDAD, CHALECO DE ALTA VISIBILIDAD, CASCO DIELÉCTRICO CON BARBIQUEJO, GUANTES, LENTES  DE SEGURIDAD.', 1, '2021-10-07 16:13:34', '2021-10-07 16:13:34'),
(304, 91, 2, 3, 0, 'NO SE VERIFICA EN INSPECCIÓN.', 0, '2021-10-07 16:14:30', '2021-10-07 16:14:30'),
(305, 91, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA ABM-909 (CAMIONETA) DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN DE PRIMEROS AUXILIOS, LUCES OPERATIVAS, ALARMA DE RETROCESO Y HERRAMIENTAS VARIAS.', 0, '2021-10-07 16:14:50', '2021-10-07 16:14:50'),
(306, 91, 4, 1, 0, 'CONTRATISTA EVIDENCIA DE COPIAS DE PÓLIZAS SCTR Y VIDA LEY VIGENTES', 0, '2021-10-07 16:15:35', '2021-10-07 16:15:35'),
(307, 91, 4, 1, 0, 'PERSONAL, CUENTA CON CERTIFICADOS DE APTITUD MÉDICA PRE-OCUPACIONAL, SEGÚN PUESTO DE TRABAJO', 0, '2021-10-07 16:15:46', '2021-10-07 16:15:46'),
(308, 91, 5, 3, 0, 'PERSONAL DE CONTRATISTA, DEBE HACER USO DE LOS IMPLEMENTOS DE PROTECCIÓN, DURANTE EL DESARROLLO DE LAS ACTIVIDADES EN CAMPO E IDENTIFICAR Y EVALUAR LOS RIESGOS PROPIOS DE LA ACTIVIDAD PARA DETERMINAR LOS CONTROLES ADECUADOS, PARA PREVENIR INCIDENTES LABORALES Y LA PREVENCIÓN PARA EVITAR CONTAGIO POR COVID-19', 0, '2021-10-07 16:16:55', '2021-10-07 16:16:55'),
(309, 91, 5, 3, 0, 'PERSONAL DE CONTRATISTA, DEBE HACER USO DE LOS IMPLEMENTOS DE PROTECCIÓN, DURANTE EL DESARROLLO DE LAS ACTIVIDADES EN CAMPO E IDENTIFICAR Y EVALUAR LOS RIESGOS PROPIOS DE LA ACTIVIDAD PARA DETERMINAR LOS CONTROLES ADECUADOS, PARA PREVENIR INCIDENTES LABORALES Y LA PREVENCIÓN PARA EVITAR CONTAGIO POR COVID-19', 0, '2021-10-07 16:16:59', '2021-10-07 16:16:59'),
(310, 91, 5, 1, 0, 'PERSONAL CONDUCTOR CUENTA CON ESTANDAR DE MANEJO DEFENSIVO Y SU DIFUSIÓN.', 0, '2021-10-07 16:17:04', '2021-10-07 16:17:04'),
(311, 91, 6, 1, 0, 'CONTRATISTA HA SUMINISTRADO DE MASCARILLAS. ALCOHOL AL PERSONAL, PARA PREVENIR CONTAGIO POR COVID-19.', 0, '2021-10-07 16:17:41', '2021-10-07 16:17:41'),
(312, 91, 7, 1, 0, '\r\n1.	PERSONAL CONDUCTOR, IMPLEMENTADO CON EPPS BÁSICOS.\r\n2.	PERSONAL SE ENCUENTRA COBERTURADO EN PÓLIZA SCTR Y SEGURO VIDA LEY.\r\n3.	UNIDAD MÓVIL IMPLEMENTADA\r\n4.	CONTRATISTA HA DOTADO A SU PERSONAL DE ELEMENTOS DE BIOSEGURIDAD PARA PREVENCIÓN ANTE COVID-19.\r\n5.	SUPERVISOR DEL CONTRATISTA EN MOMENTO DE INSPECCIÓN.\r\n', 0, '2021-10-07 16:18:13', '2021-10-07 16:18:13'),
(313, 91, 7, 2, 0, '1.	DOTAR DE EPP A PERSONAL OPERATIVO SEGÚN LA\r\nACTIVIDAD A EJECUTAR Y NIVEL DE RIESGO EXPUESTO.\r\n2.	CONCIENTIZAR AL PERSONAL, SOBRE DISTANCIAMIENTO\r\n      SOCIAL, A FIN DE PREVENIR CONTAGIO POR COVID-19.\r\n\r\n3.	SUPERVISAR CONSTANTEMENTE LAS ACTIVIDADES QUE SE EJECUTA EN CAMPO, POR PARTE DE INGENIEROS DE\r\nCONTRATISTA\r\n', 0, '2021-10-07 16:18:25', '2021-10-07 16:18:25'),
(314, 91, 8, 1, 0, '1.	SE DIFUNDIÓ CHARLA DE INDUCCIÓN Y DIFUSIÓN DEL RISSTMA ENSA, PARA EL CUMPLIMIENTO DE NORMATIVAS DE SEGURIDAD Y PREVENCIÓN ANTE COVID-19, AL PERSONAL DE LA CONTRATISTA.\r\n2.	SE COORDINÓ CON EL SUPERVISOR DE SEGURIDAD, POR PARTE DEL CONTRATISTA, IMPLEMENTAR LAS RECOMENDACIONES DADAS EN EL PRESENTE INFORME, PARA EL DESARROLLO DE ACTIVIDADES OPERATIVAS DEL PERSONAL\r\n', 0, '2021-10-07 16:18:46', '2021-10-07 16:18:46'),
(315, 91, 9, 1, 0, 'ERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.”', 0, '2021-10-07 16:20:20', '2021-10-07 16:20:20'),
(316, 91, 9, 2, 0, 'ING. JUAN SANTISTEBAN VILCHEZ', 0, '2021-10-07 16:20:40', '2021-10-07 16:20:40'),
(317, 91, 9, 3, 0, 'NG. JESUS CASTRO PISCOYA (950207320)', 0, '2021-10-07 16:20:58', '2021-10-07 16:20:58'),
(318, 91, 9, 4, 0, 'ING. CARLOS GARCIA GONZALES (979608286)', 0, '2021-10-07 16:21:13', '2021-10-07 16:21:13'),
(319, 94, 1, 1, 0, 'W2W2W2W2W2W2W2W2W\r\nZAZAZAZAZAZ', 0, '2021-10-12 09:44:41', '2021-10-12 09:44:41'),
(320, 95, 1, 1, 0, 'qwerqwer', 0, '2021-10-19 23:49:30', '2021-10-19 23:49:30'),
(321, 96, 1, 2, 0, 'SDFSDFSDSD', 1, '2021-10-19 23:51:08', '2021-10-19 23:51:08'),
(322, 95, 1, 2, 0, 'sdfasdf', 1, '2021-10-22 22:01:17', '2021-10-22 22:01:17'),
(323, 65, 7, 1, 0, 'xvbdcvbxcv', 1, '2021-10-22 22:07:04', '2021-10-22 22:07:04'),
(324, 95, 2, 1, 0, 'ccccccccccccc', 0, '2021-10-23 11:32:37', '2021-10-23 11:32:37'),
(325, 95, 8, 1, 0, 'cbvbxcv', 0, '2021-10-23 13:45:15', '2021-10-23 13:45:15'),
(326, 104, 1, 2, 13, 'PRUEBA', 0, '2021-10-23 15:09:20', '2021-10-23 15:09:20'),
(327, 104, 1, 1, 0, 'PRUENA 3', 0, '2021-10-23 15:09:29', '2021-10-23 15:09:29'),
(328, 104, 1, 5, 1, 'PRUEBA', 0, '2021-10-23 15:13:25', '2021-10-23 15:13:25'),
(329, 105, 1, 2, 1, 'SDSDFASDF', 0, '2021-10-23 15:28:14', '2021-10-23 15:28:14'),
(330, 106, 1, 5, 12, 'REGISTRO 2', 0, '2021-10-23 16:20:27', '2021-10-23 16:20:27'),
(331, 106, 1, 5, 3, 'PRUEBA 2', 0, '2021-10-23 16:22:45', '2021-10-23 16:22:45'),
(332, 106, 1, 2, 3, 'PRUEBA 3', 0, '2021-10-23 16:22:55', '2021-10-23 16:22:55'),
(333, 107, 1, 2, 1, 'DGSDF', 0, '2021-10-23 16:23:10', '2021-10-23 16:23:10'),
(334, 106, 1, 3, 0, 'TA', 0, '2021-10-23 16:23:16', '2021-10-23 16:23:16'),
(335, 107, 1, 5, 18, 'ETO', 0, '2021-10-23 16:23:16', '2021-10-23 16:23:16'),
(336, 107, 1, 3, 0, 'ASDFASDF', 1, '2021-10-23 16:23:22', '2021-10-23 16:23:22'),
(337, 107, 1, 1, 0, 'SDFASDF', 1, '2021-10-23 16:23:28', '2021-10-23 16:23:28'),
(338, 107, 1, 2, 17, 'PRUBA 1', 1, '2021-10-23 16:24:16', '2021-10-23 16:24:16'),
(339, 107, 1, 1, 0, '', 1, '2021-10-23 16:24:59', '2021-10-23 16:24:59'),
(340, 107, 1, 2, 6, 'ETP', 1, '2021-10-23 16:25:09', '2021-10-23 16:25:09'),
(341, 107, 1, 3, 0, 'SADASD', 1, '2021-10-23 16:26:20', '2021-10-23 16:26:20'),
(342, 110, 12, 5, 3, 'QA', 0, '2021-10-25 03:29:07', '2021-10-25 03:29:07'),
(343, 110, 13, 5, 1, 'QA', 0, '2021-10-25 03:29:19', '2021-10-25 03:29:19'),
(344, 110, 13, 4, 0, '', 0, '2021-10-25 03:29:23', '2021-10-25 03:29:23'),
(345, 110, 14, 3, 0, 'QA', 0, '2021-10-25 03:30:57', '2021-10-25 03:30:57'),
(346, 110, 15, 5, 6, 'QA', 0, '2021-10-25 03:31:08', '2021-10-25 03:31:08'),
(347, 110, 16, 5, 3, 'QA', 0, '2021-10-25 03:31:18', '2021-10-25 03:31:18'),
(348, 110, 17, 4, 0, 'QA', 0, '2021-10-25 03:31:26', '2021-10-25 03:31:26'),
(349, 110, 18, 2, 6, 'QA', 0, '2021-10-25 03:31:35', '2021-10-25 03:31:35'),
(350, 110, 19, 1, 0, 'QA', 0, '2021-10-25 03:31:42', '2021-10-25 03:31:42'),
(351, 65, 1, 2, 4, 'prueba3', 0, '2021-10-25 09:41:49', '2021-10-25 09:41:49'),
(352, 89, 1, 3, 0, 'GRGRTGRGT', 1, '2021-10-25 09:44:29', '2021-10-25 09:44:29'),
(353, 89, 3, 3, 0, 'GHFGJFGHJ', 1, '2021-10-25 09:45:37', '2021-10-25 09:45:37'),
(354, 89, 7, 1, 0, 'BBBBBBBBBBBBBB', 0, '2021-10-25 09:47:59', '2021-10-25 09:47:59'),
(355, 111, 1, 1, 0, 'HDFGHDFGH', 1, '2021-10-25 09:58:04', '2021-10-25 09:58:04'),
(356, 115, 1, 2, 2, 'QA', 0, '2021-11-05 17:21:28', '2021-11-05 17:21:28'),
(357, 118, 1, 2, 1, 'NO CUENTA CON UNIFORME. INCUMPLIMINETO ARTÍCULO 101° RESESATE', 0, '2021-11-08 07:09:50', '2021-11-08 07:09:50'),
(358, 118, 1, 1, 0, 'SE EVIDENCIA QUE  EL MODULO DE ATENCION CUENTA CON BARRERRA DE PROTECCION PARA PREVENIR EL CONTAGIO DE LA COVID-19.', 0, '2021-11-08 07:14:36', '2021-11-08 07:14:36'),
(359, 118, 2, 3, 0, 'NO REQUIERE', 0, '2021-11-08 07:15:20', '2021-11-08 07:15:20'),
(360, 118, 3, 3, 0, 'NO REQUIERE', 0, '2021-11-08 07:15:38', '2021-11-08 07:15:38'),
(361, 118, 4, 2, 72, 'SE EVIDENCIA QUE NO CUENTA CON COPIA DEL PETS, IPERC, PLAN DE CONTINGENCIA, MAPA DE RIESGOS Y POLIZAS DE SEGURO. INCUMPLIMINETO ARTÍCULO 37° Y 140° DEL RESESATE.', 0, '2021-11-08 07:19:32', '2021-11-08 07:19:32'),
(362, 118, 5, 3, 0, 'NO SE REALIZO POR MOTIVO QUE NO CUENTA CON COPIA DEL PETS DE LA ACTIVIDAD.', 0, '2021-11-08 07:22:26', '2021-11-08 07:22:26'),
(363, 118, 6, 2, 51, 'EL PERSONAL MANIFIESTA QUE SU EMPLEADOR NO LE PROPOPORCIONA MASCARILLA PARA LA PREVENCION DEL CONTAGIO DE LA COVID-19. INCUMPLIMINETO ARTICULO 60° DE LA LEY 31246 MOD. LEY 29783.', 0, '2021-11-08 07:25:27', '2021-11-08 07:25:27'),
(364, 118, 6, 2, 1, 'PERSONAL MANIFIESTA QUE SU EMPLEADOR NO LE PROPORCIONA PAPEL HIGIENICO Y/O PAPEL TOALLA PARA SU USO. INCUMPLIMINETO ART. 49° A) DE LA LEY 29783', 0, '2021-11-08 07:38:46', '2021-11-08 07:38:46'),
(365, 118, 6, 2, 1, 'PERSONAL MANIFIESTA QUE SU EMPLEADOR NO LE BRINDA CHARLAS Y/O CAPACITACIONES EN TEMAS REALACIONADOS A SEGURIDAD Y SALUD EN EL TRABAJO. INCUMPLIMINETO ART. 49 G) DE LA LEY 29783.', 0, '2021-11-08 07:40:16', '2021-11-08 07:40:16'),
(366, 118, 7, 1, 0, 'PERSONAL NO CUENTA CON UNIFORME Y EPPS.\r\nSE EVIDENCIA USO DE BARRERAS EN EL MODULO DE ATENCIÓN AL CLIENTE.\r\nPERSNONAL MANIFIESTA QUE SU EMPLEADOR NO LE PROPORCIONA MASCARILLAS PARA LA PREVENCIÓN DE LA COVID-19\r\nNO CUENTA CON COPIA DE LA DOCUMENTACION DE SEGURIDAD.\r\nPERSONAL MANIFIESTA QUE SU EMPLEADOR NO LE BRINDA CAPACITACIONES Y/O CHARLAS EN TEMAS DE SEGURIDAD Y SALUD EN EL TRABAJO.', 0, '2021-11-08 07:42:55', '2021-11-08 07:42:55'),
(367, 118, 7, 2, 1, 'DOTACION DE UNIFORME Y EPPS AL PERSONAL.\r\nENTREGAR COPIA DE LOS DOCUMENTOS DE SEGURIDAD AL PERSONAL ENCARGADO DE LA ACTIVIDAD.\r\nREALIZAR CAPACITACIONES Y/O CHARLAS EN TEMAS RELACIONADOS A SEGURIDAD Y SALUD EN EL TRABAJO.\r\nCUMPLIMIENTO DEL PLAN DE VIGILANCIA PARA LA PREVENCION DE LA COVID-19.', 0, '2021-11-08 07:44:38', '2021-11-08 07:44:38'),
(368, 118, 8, 1, 0, 'DERIVAR A QUIEN CORRESPONDA Y LEVANTAR OBSERVACIONES E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.', 0, '2021-11-08 07:45:41', '2021-11-08 07:45:41'),
(369, 121, 1, 1, 0, 'PERSONAL OPERATIVO, CONTIENE DE IMPLEMENTADO BÁSICOS DE PROTECCIÓN PERSONAL: CASCO DIELÉCTRICO CON BARBIQUEJO, ROPA DE TRABAJO, CALZADO DIELÉCTRICO, GUANTES DE CUERO, HILO, CHALECO Y FOTOCHECK DE IDENTIFICACIÓN.', 0, '2021-11-10 21:03:57', '2021-11-10 21:03:57'),
(370, 121, 1, 2, 6, 'TÉCNICO, HENRY HUERTAS FLORES, CUENTA CON EQUIPO DE PROTECCIÓN CONTRA CAÍDAS (ARNÉS DE SEGURIDAD TIPO LINIERO, FAJA DE ANCLAJE, LINEA DE VIDA, ESTROBO DE POSICIONAMIENTO), PERO ARNES SE ENCUENTRA EN MAL ESTADO. (INCUMPLIMIENTO AL ART.  52 DEL RESESATE 2013)', 0, '2021-11-10 21:07:37', '2021-11-10 21:07:37'),
(371, 121, 1, 1, 0, 'PERSONAL TÉCNICO EVIDENCIA DE HERRAMIENTAS  EN BUEN ESTADO, BOLSO PORTA HERRAMIENTAS, GUANTES DIELECTRICOS DE M.T, MANGAS DIELECTRICAS DE MT, EN BUEN ESTADO.', 0, '2021-11-10 21:08:45', '2021-11-10 21:08:45'),
(372, 121, 1, 2, 1, 'PERSONAL TECNICO EVIDENCIA DE PERTIGA QUE CARECE DE BOTON AL PRIMER CUERPO, ADEMAS DE PRESENTAR RAYADURAS.', 0, '2021-11-10 21:10:15', '2021-11-10 21:10:15'),
(373, 121, 2, 1, 0, 'PERSONAL CONTIENE DE CONOS PARA SEÑALIZAR ZONAS DE TRABAJO.', 0, '2021-11-10 21:21:19', '2021-11-10 21:21:19'),
(374, 121, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA B6M-880 (CAMION GRUA DE BRAZO AISLADO), DESTINADA HA LABORES EN LINEAS ENERGIZADAS, EVIDENCIA DE DOCUMENTACIÓN DE CIRCULACIÓN, CONOS, TACOS, LUCES EN BUEN ESTADO, LLANTA DE REPUESTO Y HERRAMIENTAS VARIAS, EXTINTOR.', 0, '2021-11-10 21:24:40', '2021-11-10 21:24:40'),
(375, 121, 3, 3, 0, 'UNIDAD MOVIL CAMION GRUA DE BRAZO AISLADO, EVIDENCIA DE BOTIQUIN PERO PERO SUERO Y YODOBIPIRONA ESTAN CON FECHAS EXPIRADOS.', 0, '2021-11-10 21:25:47', '2021-11-10 21:25:47'),
(376, 121, 3, 2, 39, 'OPERADOR DE CAMION GRUA DE BRAZO AISLADO, EVIDENCIA DE CERTIFICADO DE OPERADOR EXPIRADO, ADEMAS PALANCAS DE MANDO DE CANASTILLA REQUIEREN DE MANTENIMIENTO.', 0, '2021-11-10 21:33:39', '2021-11-10 21:33:39'),
(377, 121, 4, 1, 0, 'Grupo de trabajo  evidencia formato de charla de seguridad, el cual contempla riesgo por Pandemia Covid 19.', 0, '2021-11-10 21:34:54', '2021-11-10 21:34:54'),
(378, 121, 4, 2, 72, 'PERSONAL TÉCNICO, NOEVIDENCIA PETS,  NO EVIDENCIAN DE IPERC, PLAN DE CONTINGENCIAS. (INCUMPLIMIENTO AL ART. 10, 27, Y 37 DEL RESESATE 2013, PROCEDIMIENTO DE SEGURIDAD ENSA) ', 0, '2021-11-10 21:37:00', '2021-11-10 21:37:00'),
(379, 121, 5, 1, 0, 'Personal operativo, debe hacer uso de los implementos de protección, durante el desarrollo de las actividades en campo e identificar y evaluar los riesgos propios de la actividad para determinar los controles adecuados, para prevenir incidentes laborales; así mismo debe de identificar riesgos para la prevención del COVID-19.', 0, '2021-11-10 21:53:29', '2021-11-10 21:53:29'),
(380, 121, 6, 1, 0, 'ENSA ha suministrado de alcohol, Mascarillas (protectores buconasales) a su personal, para evitar contagio por enfermedad de COVID-19 (coronavirus).', 0, '2021-11-10 21:58:17', '2021-11-10 21:58:17'),
(381, 121, 7, 1, 0, '1.	Personal técnico implementado con epps básico para realizar labores.\r\n2.- Arnés de cuerpo entero en mal estado.\r\n3.	Grupo de trabajo evidencia de formato de charlas de seguridad por actividad, pero carece IPERC, Plan de contingencias Y PETS deben actualizarse.\r\n4.	Evidencian de guantes de M.T, mangas aislantes en buen estado.\r\n5.- Pértiga presenta avería en botón del primer cuerpo.\r\n6.	Personal cuenta con elementos de bioseguridad, para evitar contagio del COVID-19.\r\n7.- Unidad móvil camión grúa implementado.\r\n8.- Unidad móvil evidencia de certificado de operatividad y rigidez dieléctrica.', 0, '2021-11-10 22:07:59', '2021-11-10 22:07:59'),
(382, 121, 7, 2, 1, '1.	Planificar, previo al desarrollo de las actividades, para la implementación del personal según tarea a ejecutar.\r\n2. operador de grúa debe de contar con certificado de operador vigente.\r\n3. Implementar a grupo de trabajo de documentación de seguridad (PETS, IPERC, Plan de contingencia) \r\n4. Capacitar al personal técnico para realizar labores en redes energizadas.\r\n', 0, '2021-11-10 22:10:25', '2021-11-10 22:10:25'),
(383, 121, 8, 1, 0, '1.	Se realizó charla de capacitación; en Estilos de vida saludable; además de uso de elementos de bioseguridad para evitar contagio por Covid-19.\r\n\r\n2.- Se coordina con personal técnico elevar informe al área correspondiente y subsanar las observaciones descritas e implementar las recomendaciones descritas en el presente informe, dando cumplimiento del RESESATE 2013 y Normas de seguridad.', 0, '2021-11-10 22:16:42', '2021-11-10 22:16:42'),
(384, 121, 8, 1, 0, 'Se realiza inspección de arnés de cuerpo entero, inspección de botiquín de primeros auxilios.', 0, '2021-11-10 22:28:47', '2021-11-10 22:28:47'),
(385, 121, 9, 1, 0, 'Mantenimiento y emergencias de distribución - UMD', 0, '2021-11-10 22:42:57', '2021-11-10 22:42:57'),
(386, 121, 9, 4, 0, 'Ing. Florentino Ruiz Peralta', 0, '2021-11-10 22:43:23', '2021-11-10 22:43:23'),
(387, 124, 1, 2, 2, 'DETALLE', 0, '2021-11-11 01:16:33', '2021-11-11 01:16:33'),
(388, 124, 2, 2, 6, 'SEÑALIZACI0N', 0, '2021-11-11 01:17:06', '2021-11-11 01:17:06'),
(389, 124, 3, 4, 0, 'DETALLE UNIDADES MOVILES', 0, '2021-11-11 01:17:33', '2021-11-11 01:17:33'),
(390, 124, 4, 1, 0, 'DETALLE DOCUMENTACION DE SEGURIDAD', 0, '2021-11-11 01:18:02', '2021-11-11 01:18:02'),
(391, 124, 4, 1, 0, 'DATOS  SEG', 0, '2021-11-11 01:18:13', '2021-11-11 01:18:13'),
(392, 124, 5, 1, 0, 'PRUEBA NC', 0, '2021-11-11 01:18:38', '2021-11-11 01:18:38'),
(393, 124, 6, 1, 0, 'DATOS CONDICIONES SEGURIDAD', 0, '2021-11-11 01:19:03', '2021-11-11 01:19:03'),
(394, 124, 7, 1, 0, 'CONCLUSION 1', 0, '2021-11-11 01:19:23', '2021-11-11 01:19:23'),
(395, 124, 7, 2, 2, 'RECOMIENDA 1', 0, '2021-11-11 01:19:35', '2021-11-11 01:19:35'),
(396, 124, 7, 2, 4, 'RECOMIENDA 2', 0, '2021-11-11 01:19:44', '2021-11-11 01:19:44'),
(397, 124, 8, 1, 0, 'PRUEBA', 0, '2021-11-11 01:20:02', '2021-11-11 01:20:02'),
(398, 126, 1, 1, 0, 'PERSONAL OPERATIVO, CONTIENE DE IMPLEMENTOS BÁSICOS DE PROTECCIÓN PERSONAL: ROPA DE TRABAJO, CASCO DIELÉCTRICO CON BARBIQUEJO, CALZADO DE SEGURIDAD DIELÉCTRICO, CHALECO, GUANTES DIELÉCTRICOS BT Y MT, RESPIRADOR, MASCARILLA, RESPIRADOR CON FILTRO, LENTES DE SEGURIDAD Y HERRAMIENTAS MANUALES OPERATIVAS', 0, '2021-11-16 06:50:15', '2021-11-16 06:50:15'),
(399, 126, 1, 1, 0, 'PERSONAL TÉCNICO, CUENTA CON EQUIPO DE PROTECCIÓN CONTRA CAÍDAS (ARNÉS DE SEGURIDAD TIPO LINIERO, LÍNEA Y FAJA DE ANCLAJE) Y ESCALERA TIPO TELESCÓPICA CON SISTEMA DE ESCALAMIENTO', 0, '2021-11-16 06:50:34', '2021-11-16 06:50:34'),
(400, 126, 1, 1, 0, 'PERSONAL TÉCNICO, CUENTA CON HERRAMIENTAS MANUALES TALES COMO PALANAS, CARRETILLAS, BARRETAS EN ESTADO OPERATIVO.', 0, '2021-11-16 06:50:46', '2021-11-16 06:50:46'),
(401, 126, 2, 1, 0, 'GRUPO DE TRABAJO, REALIZA LA SEÑALIZACIÓN Y DELIMITACIÓN DE ÁREAS DE TRABAJO (BIOMBOS, CONOS DE SEGURIDAD)', 0, '2021-11-16 06:51:55', '2021-11-16 06:51:55'),
(402, 126, 3, 1, 0, 'UNIDADES MÓVILES DE PLACAS T9R-821 (CAMIONETA), DESTINADO AL TRANSPORTE DE PERSONAL Y MATERIALES, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN DE PRIMEROS AUXILIOS, ALARMA DE RETROCESO, CONOS, TACOS Y HERRAMIENTAS VARIAS', 0, '2021-11-16 06:52:35', '2021-11-16 06:52:35'),
(403, 126, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA C9P-770 (CAMIÓN GRÚA), DESTINADO AL TRANSPORTE DE MATERIAL Y TRABAJOS OPERATIVOS, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN DE PRIMEROS AUXILIOS, ALARMA DE RETROCESO, ESLINGAS, CORREAS Y FAJAS, CONOS, TACOS, HERRAMIENTAS VARIAS Y CERTIFICADO DE OPERATIVIDAD DE BRAZO HIDRÁULICO.', 0, '2021-11-16 06:52:47', '2021-11-16 06:52:47'),
(404, 126, 4, 1, 0, 'GRUPO DE TRABAJO EVIDENCIA COPIAS DE PÓLIZAS SCTR (SALUD Y PENSIÓN) Y PÓLIZA DE SEGURO VIDA LEY, VIGENTES.', 0, '2021-11-16 06:53:56', '2021-11-16 06:53:56'),
(405, 126, 4, 1, 0, 'GRUPO DE TRABAJO, EVIDENCIA EL REGISTRO DE LA CHARLA DE SEGURIDAD; PREVIO AL DESARROLLO DE LA ACTIVIDAD.', 0, '2021-11-16 06:54:10', '2021-11-16 06:54:10'),
(406, 126, 4, 1, 0, 'GRUPO DE TRABAJO CUENTA CON PETS, IPERC Y PLAN DE CONTINGENCIAS EN ZONA DE TRABAJO, ASÍ MISMO EVIDENCIA DIFUSIÓN RESPECTIVA.', 0, '2021-11-16 06:54:23', '2021-11-16 06:54:23'),
(407, 126, 4, 1, 0, 'GRUPO DE TRABAJO EVIDENCIA ORDEN DE TRABAJO, BOLETAS DE SEGURIDAD, PERMISO DE TRABAJOS EN ALTURA Y AUTORIZACIÓN DE INTERVENCIÓN', 0, '2021-11-16 06:54:33', '2021-11-16 06:54:33'),
(408, 126, 4, 1, 0, 'CONDUCTOR OMAR MEDINA RIVADENEIRA Y LUIS ESGARDO INCIO CASTILLO, CUENTA CON LICENCIA DE CONDUCIR VIGENTE Y ACORDE A CATEGORÍA DE VEHÍCULO A CONDUCIR.', 0, '2021-11-16 06:55:00', '2021-11-16 06:55:00'),
(409, 126, 5, 1, 0, 'SUPERVISIÓN POR PARTE DEL CONTRATISTA (INGENIEROS DE CAMPO Y SUPERVISOR DE SEGURIDAD), EN ZONA DE TRABAJO, DURANTE DESARROLLO DE LA ACTIVIDAD', 0, '2021-11-16 06:56:03', '2021-11-16 06:56:03'),
(410, 126, 5, 1, 0, 'PERSONAL HACE USO DE EQUIPOS DE PROTECCIÓN CONTRA CAÍDAS Y SISTEMA DE ESCALAMIENTO, SEGÚN ZONA DE TRABAJO PARA REALIZAR TRABAJOS EN ALTURA.', 0, '2021-11-16 06:56:19', '2021-11-16 06:56:19'),
(411, 126, 6, 1, 0, 'GRUPO DE TRABAJO, HACE USO DE ELEMENTOS DE BIOSEGURIDAD, CUENTAN CON BLOQUEADOR SOLAR Y AGUA PARA SU CONSUMO, DURANTE EL DESARROLLO DE LAS ACTIVIDADES OPERATIVAS, EN ZONA DE TRABAJO.  ', 0, '2021-11-16 06:58:46', '2021-11-16 06:58:46'),
(412, 126, 7, 1, 0, '1. PERSONAL OPERATIVO, CUENTA CON EPP Y EQUIPOS DE MANIOBRA, PARA EJECUCIÓN DE ACTIVIDADES OPERATIVAS.\r\n2. GRUPO DE TRABAJO REALIZA LA SEÑALIZACIÓN Y DELIMITACIÓN DE ÁREAS DE TRABAJO.\r\n3. UNIDADES MÓVILES CON EQUIPAMIENTO BÁSICO.\r\n4. GRUPO DE TRABAJO CUENTA CON DOCUMENTACIÓN DE SEGURIDAD.\r\n5. CONTRATISTA ABASTECE DE ALCOHOL Y MASCARILLAS PARA PROTECCIÓN DE CONTAGIO DE ENFERMEDAD COVID19.', 0, '2021-11-16 07:00:48', '2021-11-16 07:00:48'),
(413, 126, 7, 2, 1, '1. INSPECCIONAR PERIÓDICAMENTE EL ESTADO DE LOS EPP A PERSONAL OPERATIVO SEGÚN ACTIVIDAD Y RIESGOS EXPUESTOS.\r\n2. UNIDADES MÓVILES DEBE CONTAR CON PERMISO POR LA AUTORIDAD DE COMPETENCIA SEGÚN LO ESTIPULA EL REGLAMENTO DE TRÁNSITO DEL MTC, PARA EL TRANSPORTE DE PERSONAL.\r\n3. REALIZAR INSPECCIONES PERIÓDICAS DE ELEMENTOS DE PROTECCIÓN CONTRA CAÍDAS.\r\n4. EVALUAR RIESGOS, SEGÚN LAS ACTIVIDADES QUE SE EJECUTAN Y POR GRUPOS DE TRABAJO.\r\n5. SUPERVISAR EFICAZ Y CONSTANTEMENTE A LAS ACTIVIDADES QUE SE EJECUTA EN CAMPO.', 0, '2021-11-16 07:01:57', '2021-11-16 07:01:57'),
(414, 126, 8, 1, 0, '1. SE COORDINÓ CON SUPERVISOR DE SEGURIDAD ING. JOSÉ MOLLEDA CUEVA POR PARTE DE LA CONTRATISTA, IMPLEMENTAR RECOMENDACIONES BRINDADAS EN EL PRESENTE INFORME DANDO CUMPLIMIENTO AL RESESATE 2013 Y NORMAS DE SEGURIDAD', 0, '2021-11-16 07:04:30', '2021-11-16 07:04:30'),
(415, 126, 9, 1, 0, 'SERVICIO DE MANTENIMIENTO EN MEDIA TENSIÓN, SUBESTACIONES, BAJA TENSIÓN Y ALUMBRADO PÚBLICO: CHICLAYO, PERIODO 2018 - 2021 ELECTRONORTE S.A.', 0, '2021-11-16 08:34:28', '2021-11-16 08:34:28'),
(416, 126, 9, 2, 1, 'ING. MARCO NUNURA CHUMAN', 0, '2021-11-16 08:35:12', '2021-11-16 08:35:12'),
(417, 126, 9, 3, 0, 'ING. JOSÉ MOLLEDA CUEVAS', 0, '2021-11-16 08:35:40', '2021-11-16 08:35:40'),
(418, 127, 12, 1, 0, 'INSTALACIONES DE LA OFICINA ADMINISTRATIVA DESTINADO A SERVICIOS DE ATENCIÓN AL CLIENTE, TIENE VENTILACIÓN NATURAL E ILUMINACIÓN NATURAL Y ARTIFICIAL. ', 0, '2021-11-16 15:25:39', '2021-11-16 15:25:39'),
(419, 127, 13, 1, 0, 'AMBIENTES DE ATENCIÓN AL CLIENTE Y PÚBLICO EN GENERAL, SE ENCUENTRAN LIMPIOS Y ORDENADOS.', 0, '2021-11-16 15:37:43', '2021-11-16 15:37:43'),
(420, 127, 14, 1, 0, 'INSTALACIÓN, CUENTA CON SERVICIOS HIGIÉNICOS Y SUS RESPECTIVOS ARTÍCULOS DE LIMPIEZA, PARA PERSONAL ADMINISTRATIVO Y PERSONAL TERCERO (PÚBLICO EN GENERAL).', 0, '2021-11-16 15:38:24', '2021-11-16 15:38:24'),
(421, 127, 15, 1, 0, 'AMBIENTES CUENTAN CON SEÑALIZACIÓN DE DEFENSA CIVIL (IDENTIFICACIÓN DE RUTAS DE EVACUACIÓN Y AFORO, MAPA DE RIESGO, IPERC) Y SEÑALÉTICAS DE PREVENCIÓN POR COVID 19 (DISTANCIAMIENTO SOCIAL, TOMA DE TEMPERATURA, USO DE MASCARILLA Y USO LENTES DE PROTECCIÓN).', 0, '2021-11-16 15:39:01', '2021-11-16 15:39:01'),
(422, 127, 15, 3, 0, 'ACTUALIZAR IPERC, DE ACUERDO A LA REALIDAD DE LA OFICINA DE ATENCIÓN AL CLIENTE Y COBRANZA.', 0, '2021-11-16 15:39:12', '2021-11-16 15:39:12'),
(423, 127, 16, 1, 0, 'INSTALACIÓN, CUENTA CON BOTIQUÍN DE PRIMEROS AUXILIOS.', 0, '2021-11-16 15:40:11', '2021-11-16 15:40:11'),
(424, 127, 16, 1, 0, 'INSTALACIÓN, EVIDENCIA CAMILLA COMO PARTE DEL EQUIPAMIENTO DE EMERGENCIA FRENTE A CONTINGENCIAS LABORALES.', 0, '2021-11-16 15:40:24', '2021-11-16 15:40:24'),
(425, 127, 16, 1, 0, 'INSTALACIÓN CUENTA CON EXTINTORES DE CO2 (1) Y PQS (1), LOS CUALES SE ENCUENTRAN OPERATIVOS Y LUCES DE EMERGENCIA.', 0, '2021-11-16 15:40:35', '2021-11-16 15:40:35'),
(426, 127, 16, 3, 0, 'IMPLEMENTAR BOTIQUÍN DE PRIMEROS AUXILIOS DE ACUERDO A ESTÁNDARES DE ELECTRONORTE S.A.', 0, '2021-11-16 15:40:44', '2021-11-16 15:40:44'),
(427, 127, 17, 2, 41, 'INSTALACIÓN, CUENTA CON CERTIFICADO DE AUTORIZACIÓN MUNICIPAL DE FUNCIONAMIENTO, CERTIFICADO DE DEFENZA CIVIL, VENCIDOS, ASÍ MISMO NO EVIDENCIA AUTORIZACIÓN DE ANUNCIO PUBLICITARIO ADOSADO A LA PARED DEL ESTABLECIMIENTO.', 0, '2021-11-16 15:43:12', '2021-11-16 15:43:12'),
(428, 127, 17, 1, 0, 'INSTALACIÓN CUENTA CON CERTIFICADO DE FUMIGACIÓN Y/O DESINFECCIÓN, PROTOCOLO DE PUESTA A TIERRA, CERTIFICADO DE DESINFECCIÓN, POLÍTICAS, ', 0, '2021-11-16 15:43:28', '2021-11-16 15:43:28'),
(429, 127, 17, 1, 0, 'INSTALACIÓN CUENTA CON SILLAS ERGONÓMICAS, CONTENEDORES DE RESIDUOS, PEDILUVIO Y DISPENSADOR DE ALCOHOL', 0, '2021-11-16 15:43:38', '2021-11-16 15:43:38'),
(430, 127, 17, 1, 0, 'INSTALACIÓN CUENTA CON TERMÓMETRO PARA TOMA DE TEMPERATURA DE USUARIOS.', 0, '2021-11-16 15:43:48', '2021-11-16 15:43:48'),
(431, 127, 17, 1, 0, 'INSTALACIÓN, CUENTA CON FLUJO DE COMUNICACIÓN EN CASO DE EMERGENCIA - PLAN DE CONTINGENCIA, POLÍTICAS DE LA EMPRESA. ', 0, '2021-11-16 15:43:57', '2021-11-16 15:43:57'),
(432, 127, 17, 2, 72, 'INSTALACIÓN CUENTA CON MAPA DE RIESGOS DESACTUALIZADO (UBICACIÓN DE BOTIQUÍN, EXTINTOR Y ÁREA DE ATENCIÓN AL CLIENTE), ASÍ MISMO EVIDENCIA EXTENSIÓN CON CABLE MELLIZO.   ', 0, '2021-11-16 15:44:51', '2021-11-16 15:44:51'),
(433, 127, 17, 2, 50, 'INSTALACIÓN CUENTA CON TABLERO CON LLAVE TÉRMICA, Y POZO A TIERRA EL CUAL CARECE DE LLAVE DIFERENCIAL. (REITERATIVO).', 0, '2021-11-16 15:45:54', '2021-11-16 15:45:54');
INSERT INTO `inf_cumplimiento_des` (`nId`, `nIdInforme`, `nIdCumplimiento`, `nValor`, `nValorInc`, `cDescripcion`, `nFlag`, `dCreate`, `dUpdate`) VALUES
(434, 127, 18, 1, 0, '1.	INSTALACIONES CUENTA CON VENTILACIÓN E ILUMINACIÓN ADECUADA.\r\n2.	INSTALACIÓN CUENTA CON EXTINTORES DE PQS Y CO2 VIGENTES Y TARJETA DE INSPECCIÓN ACTUALIZADA.\r\n3. AMBIENTES CUENTA CON SERVICIOS HIGIÉNICOS EN BUEN ESTADO.\r\n4. INSTALACIONES CUENTAN CON SEÑALIZACIONES DE DEFENSA CIVIL.\r\n5. INSTALACIÓN EVIDENCIA LICENCIA DE FUNCIONAMIENTO, CERTIFICADO DE DEFENSA CIVIL VENCIDOS, ASÍ MISMO EVIDENCIA MAPA DE RIESGOS DESACTUALIZADOS.\r\n6. INSTALACIONES CUENTA CON PEDILUVIO Y TERMÓMETRO DIGITAL, PARA TOMA DE TEMPERATURA.\r\n7. INSTALACIÓN CARECE DE LLAVE DIFERENCIA, ASÍ MISMO EVIDENCIA EXTENSIÓN CON CABLE MELLIZO.', 0, '2021-11-16 15:47:18', '2021-11-16 15:47:18'),
(435, 127, 18, 2, 1, '1. REALIZAR LIMPIEZA DE FORMA PERMANENTE A      AMBIENTES DE ATENCIÓN AL CLIENTE.\r\n2. REALIZAR INSPECCIONES PERIÓDICAS A EXTINTORES Y\r\n    REGISTRAR EN TARJETAS DE CONTROL.\r\n3. CAPACITAR AL PERSONAL EN USO DE EXTINTORES.\r\n4. CONTAR CON AUTORIZACIONES MUNICIPALES VIGENTES.\r\n5. ACTUALIZAR MAPA DE RIESGO Y INSTALAR LLAVE DIFERENCIAL AL TABLERO.\r\n6. REEMPLAZAR EXTENSIÓN CON CABLE VULCANIZADO Y/O CANALETA.', 0, '2021-11-16 15:47:36', '2021-11-16 15:47:36'),
(436, 127, 19, 1, 0, '1.	SE COORDINA CON EL ENCARGADO DE OFICINA KARINA ISABEL ALTAMIRANO VARGAS, LAS DEFICIENCIAS ENCONTRADAS EN LAS INSTALACIONES, CON LA FINALIDAD DE SUBSANAR EN CORTO PLAZO LAS NO CONFORMIDADES.', 0, '2021-11-16 15:48:01', '2021-11-16 15:48:01'),
(437, 128, 1, 1, 0, 'PERSONAL DE ATENCIÓN AL CLIENTE Y COBRANZA, CUENTA CON ROPA DE TRABAJO (PANTALÓN, CAMISA Y SACO) Y ZAPATOS DE VESTIR. ', 0, '2021-11-16 19:42:32', '2021-11-16 19:42:32'),
(438, 128, 1, 3, 0, 'IMPLEMENTAR A PERSONAL DE LIMPIEZA SRA. LUPE CANTOS CHISCUL, CARECE DE FOTOCHECK DE IDENTIFICACIÓN', 0, '2021-11-16 19:42:43', '2021-11-16 19:42:43'),
(439, 128, 2, 3, 0, '', 0, '2021-11-16 19:43:34', '2021-11-16 19:43:34'),
(440, 128, 3, 3, 0, '', 0, '2021-11-16 19:43:47', '2021-11-16 19:43:47'),
(441, 128, 4, 1, 0, 'PERSONAL DE ATENCIÓN AL CLIENTE Y COBRANZA, VIGILANCIA Y MANTENIMIENTO, SE ENCUENTRA COBERTURADO EN PÓLIZA SCTR (SALUD Y PENSIÓN), SEGURO VIDA LEY Y EMOS.', 0, '2021-11-16 19:44:03', '2021-11-16 19:44:03'),
(442, 128, 4, 2, 27, 'PERSONAL DE MANTENIMIENTO, SRA. LUPE CANTOS CHISCUL, NO SE ENCUENTRA COBERTURADO EN SEGURO VIDA LEY. - INCUMPLIMIENTO AL ART. 25 P) Y 140 DEL RESESATE 2013 – DS. 0009–2020-TR.', 0, '2021-11-16 19:44:32', '2021-11-16 19:44:32'),
(443, 128, 4, 1, 0, 'PERSONAL DE ATENCIÓN AL CLIENTE Y COBRANZA, LIMPIEZA Y VIGILANCIA, CUENTA CON, PETS, IPERC Y PLAN DE CONTINGENCIA DE LAS ACTIVIDADES QUE DESARROLLAN Y HOJAS MSDS, DE LOS PRODUCTOS QUÍMICOS QUE MANIPULA (LEGÍA, ÁCIDOS Y OTROS).', 0, '2021-11-16 19:44:42', '2021-11-16 19:44:42'),
(444, 128, 4, 2, 72, 'IPERC DE LIMPIEZA NO EVALUAR RIESGOS ASOCIADOS AL MANEJO DE AGENTES QUÍMICOS EN EL DESARROLLO DE SU ACTIVIDAD.', 0, '2021-11-16 19:45:04', '2021-11-16 19:45:04'),
(445, 128, 4, 3, 0, 'INCLUIR NÚMEROS TELEFÓNICOS Y NOMBRES DE SUPERVISORES POR PARTE DE ENSA, EN PLAN DE CONTINGENCIA.', 0, '2021-11-16 19:45:16', '2021-11-16 19:45:16'),
(446, 128, 5, 3, 0, 'PERSONAL DE ATC Y COBRANZA, LIMPIEZA Y VIGILANCIA, HACE USO DE LOS IMPLEMENTOS DE PROTECCIÓN (ROPA DE TRABAJO Y PROTECCIÓN FACIAL), DURANTE EL DESARROLLO DE LAS ACTIVIDADES E IDENTIFICAR Y EVALUAR LOS RIESGOS PROPIOS DE LA ACTIVIDAD, PARA PREVENIR INCIDENTES LABORALES Y PREVENCIÓN DEL CONTAGIO POR COVID-19.', 0, '2021-11-16 19:46:02', '2021-11-16 19:46:02'),
(447, 128, 6, 1, 0, 'PERSONAL HACE USO DE ALCOHOL GEL Y MASCARILLAS (PROTECTORES BUCONASALES), PARA PREVENIR CONTAGIO POR COVID-19. ASÍ MISMO CUENTA CON AGUA PARA CONSUMO.', 0, '2021-11-16 19:46:34', '2021-11-16 19:46:34'),
(448, 128, 7, 1, 0, '. PERSONAL DE MANTENIMIENTO (LIMPIEZA) SRA. LUPE CANTOS CHISCUL, CARECE DE FOTOCHECK DE IDENTIFICACIÓN.\r\n2. PERSONAL DE MANTENIMIENTO (LIMPIEZA) SR. LUPE CANTOS CHISCUL, NO SE ENCUENTRA COBERTURADO EN SEGURO VIDA LEY.\r\n3. PERSONAL, CUENTA DE PETS, IPERC, PLAN DE CONTINGENCIA, ASÍ MISMO CARECE DE DIFUSIÓN.\r\n4. PERSONAL CUENTA CON EQUIPOS DE BIOSEGURIDAD Y DOTACIÓN DE AGUA PARA CONSUMO.', 0, '2021-11-16 19:47:08', '2021-11-16 19:47:08'),
(449, 128, 7, 2, 1, '1. IMPLEMENTAR EPPS A PERSONAL DE MANTENIMIENTO Y ORIENTADORA DE FOTOCHET, ROPA DE TRABAJO.\r\n2. TODO PERSONAL DEBE ESTAR COBERTURADO EN PÓLIZA VIDA LEY.\r\n3. PARA INGRESO DE NUEVO PERSONAL, DEBEN DE SOLICITAR INDUCCIÓN E INSPECCIÓN DE SEGURIDAD AL ÁREA RESPECTIVA DE ENSA.\r\n4. DIFUNDIR A PERSONAL OPERATIVO PETS, IPERC DE LA ACTIVIDAD Y PLAN DE CONTINGENCIA (DESARROLLO ESPECÍFICO DE LA ACTIVIDAD).', 0, '2021-11-16 19:47:20', '2021-11-16 19:47:20'),
(450, 128, 8, 1, 0, '1.	SE INFORMA AL SR. KARINA ISABEL ALTAMIRANO VARGAS, ENCARGADO DE ATC, INFORMAR LAS DEFICIENCIAS ENCONTRADAS DURANTE LA INSPECCIÓN, PARA SU COORDINACIÓN CON SU JEFATURA EN EL LEVANTAMIENTO DE LAS OBSERVACIONES, CUMPLIENDO CON LAS NORMAS DE SEGURIDAD Y NORMAS SANITARIAS.', 0, '2021-11-16 19:47:39', '2021-11-16 19:47:39'),
(451, 128, 8, 1, 0, 'SE INFORMA AL SR. KARINA ISABEL ALTAMIRANO VARGAS, ENCARGADO DE ATC, INFORMAR LAS DEFICIENCIAS ENCONTRADAS DURANTE LA INSPECCIÓN, PARA SU COORDINACIÓN CON SU JEFATURA EN EL LEVANTAMIENTO DE LAS OBSERVACIONES, CUMPLIENDO CON LAS NORMAS DE SEGURIDAD Y NORMAS SANITARIAS.', 1, '2021-11-16 19:47:56', '2021-11-16 19:47:56'),
(452, 128, 9, 1, 0, 'SERVICIO DE ATENCIÓN AL CLIENTE EN OFICINAS DE PERIFERIA DE LA UU.NN CHICLAYO - ELECTRONORTE S.A.', 0, '2021-11-16 19:52:57', '2021-11-16 19:52:57'),
(453, 128, 9, 2, 1, 'Ing. Alison Llatas', 0, '2021-11-16 19:54:06', '2021-11-16 19:54:06'),
(454, 128, 9, 3, 0, 'Ing. Katya Custodio Piscoya', 0, '2021-11-16 19:54:22', '2021-11-16 19:54:22'),
(455, 129, 1, 1, 0, 'OPERADOR DE S.E.P, CONTIENE DE IMPLEMENTOS DE PROTECCIÓN PERSONAL: CASCO DIELÉCTRICO, ROPA DE TRABAJO, LENTES, CALZADO DIELÉCTRICO,  PROTECTOR BUCONASAL, ADEMÁS DE FOTOCHECK DE IDENTIFICACIÓN.', 0, '2021-11-16 23:57:29', '2021-11-16 23:57:29'),
(456, 129, 1, 1, 0, 'OPERADOR DE S.E.P., EVIDENCIA EQUIPOS DE MANIOBRA: GUANTES DIELÉCTRICOS M.T, REVELADOR DE TENSIÓN, PÉRTIGA.', 0, '2021-11-16 23:57:37', '2021-11-16 23:57:37'),
(457, 129, 1, 1, 0, 'OPERADOR DE S.E.P, EVIDENCIA DE KIT DE HERRAMIENTAS Y MALETÍN EN BUEN ESTADO Y COMPLETO', 0, '2021-11-16 23:57:46', '2021-11-16 23:57:46'),
(458, 129, 1, 3, 0, 'OPERADOR DE S.E.P, NO CUENTA CON ARNÉS DE CUERPO ENTERO.', 0, '2021-11-16 23:57:56', '2021-11-16 23:57:56'),
(459, 129, 2, 3, 0, 'NO APLICA', 0, '2021-11-17 00:00:49', '2021-11-17 00:00:49'),
(460, 129, 3, 3, 0, 'NO APLICA', 0, '2021-11-17 00:01:00', '2021-11-17 00:01:00'),
(461, 129, 4, 2, 72, 'OPERADOR DE LA S.E. CARECE DE PETS, IPERC, PLAN DE CONTINGENCIA, (INCUMPLIMIENTO AL ART. 11 C), 20, 24, 27, Y 19 D), 37 A) DEL RESESATE 2013)', 0, '2021-11-17 00:01:25', '2021-11-17 00:01:25'),
(462, 129, 4, 1, 0, 'OPERADOR DE S.E EVIDENCIA DE REGISTRO DE CHARLA DE SEGURIDAD, PARA EL DESARROLLO DE SUS ACTIVIDADES.', 0, '2021-11-17 00:01:37', '2021-11-17 00:01:37'),
(463, 129, 5, 2, 18, 'OPERADOR DE LA S.E. OLMOS, REALIZA SUS ACTIVIDADES COMO PERSONAL ÚNICO, DESCONOCIENDO PETS, IPERC,  PREVIO AL DESARROLLO DE SUS ACTIVIDADES.', 0, '2021-11-17 00:02:48', '2021-11-17 00:02:48'),
(464, 129, 5, 3, 0, 'PARA TRABAJOS EN ALTURA, PERSONAL TÉCNICO DEBE ESTAR IMPLEMENTADO CON ARNÉS DE SEGURIDAD COMPLETO, ESCALERA Y SISTEMA DE ESCALAMIENTO', 0, '2021-11-17 00:02:59', '2021-11-17 00:02:59'),
(465, 129, 6, 1, 0, 'PERSONAL EVIDENCIA USO DE MASCARILLA (PROTECTOR BUCONASAL), ALCOHOL EN GEL, PARA EVITAR CONTAGIO POR COVID-19    (CORONAVIRUS).', 0, '2021-11-17 00:03:36', '2021-11-17 00:03:36'),
(466, 129, 6, 2, 54, 'BOTIQUÍN DE PRIMEROS AUXILIOS FALTA IMPLEMENTAR (EVIDENCIA DE MEDICAMENTOS CON FECHA DE EXPIRACIÓN)', 0, '2021-11-17 00:03:53', '2021-11-17 00:03:53'),
(467, 129, 7, 1, 0, '1.	OPERADOR DE S.E, CUENTA CON EPP PARA\r\nLABORES EN LA INSTALACIÓN.\r\n2.	OPERADOR DE S.E. CARECE DE PETS, PLAN DE CONTINGENCIAS.\r\n3.	OPERADOR EVIDENCIA DE GUANTES DE M.T, REVELADOR Y PÉRTIGA.\r\n4. PERSONAL CUENTA CON BOTIQUÍN DE PRIMEROS AUXILIOS, PERO FALTA IMPLEMENTAR.\r\n5. PERSONAL HACE USO MASCARILLA PARA PROTECCIÓN DE CONTAGIO POR COVID-19.', 0, '2021-11-17 00:04:50', '2021-11-17 00:04:50'),
(468, 129, 7, 2, 1, '1. IMPLEMENTAR A PERSONAL CON EPP SEGÚN RIESGO DE LA ACTIVIDAD QUE EJECUTA EN LA INSTALACIÓN.\r\n2. DOTAR DE PETS DE LAS ACTIVIDADES QUE REALIZA EL\r\nOPERADOR Y FORMATOS PARA ANÁLISIS DE RIESGOS DIARIOS.\r\n3. IMPLEMENTAR DE BOTIQUÍN DE PRIMEROS AUXILIOS.\r\n4. IMPLEMENTAR PLAN DE EMERGENCIA EN LA INSTALACIÓN, Y CAPACITAR A PERSONAL EN ACTIVIDADES ESPECÍFICAS DE OPERACIÓN DE LA S.E.\r\n', 0, '2021-11-17 00:05:04', '2021-11-17 00:05:04'),
(469, 129, 8, 1, 0, '1.	SE REALIZÓ CHARLA DE CAPACITACIÓN DE SEGURIDAD, CINCO REGLAS DE ORO, AL OPERADOR DE S.E OLMOS; ADEMÁS DE USO DE ELEMENTOS DE BIOSEGURIDAD PARA EVITAR CONTAGIO POR COVID-19.\r\n2.	SE REALIZA ENTRENAMIENTO EN USO DE EXTINTORES PORTÁTILES.\r\n3.	SE COORDINÓ CON EL SR. GREGORIO ÁLAMO VIDAURRE, OPERADOR DE LA S.E.P, LA EVALUACIÓN DE LOS RIESGOS EXISTENTES EN LA INSTALACIÓN E IMPLEMENTAR RECOMENDACIONES DADAS EN EL PRESENTE INFORME, EN COORDINACIÓN CON SU JEFATURA Y/O ÁREA DE SEGURIDAD SALUD EN EL TRABAJO Y MEDIO AMBIENTE DE ENSA, PARA SU IMPLEMENTACIÓN CORRESPONDIENTE EN CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.\r\n', 0, '2021-11-17 00:05:24', '2021-11-17 00:05:24'),
(470, 129, 9, 1, 0, 'MANTENIMIENTO Y OPERACIÓN DE S.E - ELECTRONORTE S.A', 0, '2021-11-17 00:08:02', '2021-11-17 00:08:02'),
(471, 129, 9, 4, 0, 'ING. CARLOS LIZA', 0, '2021-11-17 00:08:23', '2021-11-17 00:08:23'),
(472, 130, 12, 1, 0, 'LOS AMBIENTES DE PATIOS DE LLAVES CUENTAN CON ILUMINACIÓN Y VENTILACIÓN NATURAL.', 0, '2021-11-17 00:28:43', '2021-11-17 00:28:43'),
(473, 130, 12, 1, 0, 'LUMINARIAS Y REFLECTORES EN ÁREA DE PATIO DE LLAVES Y SALA DE CONTROL SE ENCUENTRA OPERATIVOS', 0, '2021-11-17 00:28:52', '2021-11-17 00:28:52'),
(474, 130, 12, 1, 0, 'AMBIENTES DE SALA DE DESCANSO DEL PERSONAL, SE ENCUENTRAN ILUMINADOS Y VENTILADOS', 0, '2021-11-17 00:29:00', '2021-11-17 00:29:00'),
(475, 130, 12, 1, 0, 'AMBIENTES DE SALA DE DESCANSO DEL PERSONAL, SE ENCUENTRAN ILUMINADOS Y VENTILADOS', 1, '2021-11-17 00:29:27', '2021-11-17 00:29:27'),
(476, 130, 13, 1, 0, 'AMBIENTE DE S.E MOTUPE SE ENCUENTRA ORDENADO Y LIMPIO', 0, '2021-11-17 00:30:16', '2021-11-17 00:30:16'),
(477, 130, 13, 1, 0, 'INSTALACIONES EVIDENCIAN DE CILINDRO ROTULADO PARA EL DESECHO DE RESIDUOS SÓLIDOS. ', 0, '2021-11-17 00:30:24', '2021-11-17 00:30:24'),
(478, 130, 14, 1, 0, 'AMBIENTES CUENTAN CON SERVICIO HIGIÉNICO, HABILITADO Y EN BUEN ESTADO; Y, CON SUS RESPECTIVOS ARTÍCULOS DE LIMPIEZA', 0, '2021-11-17 00:31:03', '2021-11-17 00:31:03'),
(479, 130, 14, 2, 35, 'PISO DE DUCHAS, PRESENTA HUMEDAD, DEBIDO A QUE CARECE DE CERÁMICA', 0, '2021-11-17 00:31:44', '2021-11-17 00:31:44'),
(480, 130, 15, 1, 0, 'SALA DE CONTROL EVIDENCIA DE SEÑALIZACIÓN DE DEFENSA CIVIL, DE EVACUACIÓN, ADEMÁS DE SEÑALIZACIÓN DE EXTINTOR,  BOTIQUÍN, RIESGO ELÉCTRICO; USO OBLIGATORIO DE EPPS.', 0, '2021-11-17 00:32:18', '2021-11-17 00:32:18'),
(481, 130, 15, 2, 72, 'CARENCIA DE MAPA DE RIESGOS, EL CUAL DEBE UBICARSE EN ZONAS VISIBLES O ZONAS DE INGRESOS A LAS INSTALACIONES DE    LA SUBESTACIÓN. (INCUMPLIMIENTO AL ART. 11 D) DEL RESESATE 2013). AL INGRESO DE INSTALACIONES NO  CUENTA CON SEÑALIZACIÓN DE USO OBLIGATORIO DE EPP.', 0, '2021-11-17 00:32:34', '2021-11-17 00:32:34'),
(482, 130, 15, 1, 0, 'INSTALACIONES CUENTA CON SEÑALÉTICAS DE PREVENCIÓN POR COVID-19 (DISTANCIAMIENTO SOCIAL, USO DE MASCARILLA Y , LAVADO DE MANOS).', 0, '2021-11-17 00:32:46', '2021-11-17 00:32:46'),
(483, 130, 16, 1, 0, 'INSTALACIONES CUENTAN CON DOS EXTINTORES DE PQS, DE 9 KG; EN BUEN ESTADO,  OPERATIVOS, TARJETA DE INSPECCIÓN HASTA EL 11 DE NOVIEMBRE DEL 2021 Y VIGENTES HASTA OCTUBRE DEL 2022.', 0, '2021-11-17 00:33:23', '2021-11-17 00:33:23'),
(484, 130, 16, 2, 54, 'INSTALACIÓN EVIDENCIA DE BOTIQUÍN PRIMEROS AUXILIOS, PERO FALTA IMPLEMENTAR.(SE EVIDENCIO MEDICAMENTOS EXPIRADOS), CARECEN DE LUCES DE EMERGENCIA', 0, '2021-11-17 00:33:43', '2021-11-17 00:33:43'),
(485, 130, 17, 2, 62, 'INSTALACIONES NO CUENTAN CON CERTIFICADO DE DEFENSA CIVIL Y LICENCIA MUNICIPAL DE FUNCIONAMIENTO. (INCUMPLIMIENTO AL ART. 3 LEY 28976 LEY DE MARCO DE LICENCIA DE FUNCIONAMIENTO, ART. 37 DS 058- 2014 PCM, REGLAMENTO DE INSPECCIONES TÉCNICAS DE SEGURIDAD DE EDIFICACIONES)', 0, '2021-11-17 00:34:34', '2021-11-17 00:34:34'),
(486, 130, 17, 1, 0, 'INSTALACIONES EVIDENCIAN CERTIFICADO DE FUMIGACIÓN VIGENTE. (06.05.2022)', 0, '2021-11-17 00:34:43', '2021-11-17 00:34:43'),
(487, 130, 17, 1, 0, 'INSTALACIONES EVIDENCIA DE CONTENEDORES DE RESIDUOS SÓLIDOS (R.S.), SEGÚN CÓDIGO DE COLORE', 0, '2021-11-17 00:34:52', '2021-11-17 00:34:52'),
(488, 130, 17, 2, 50, 'INSTALACIONES EVIDENCIAN DE TABLERO DE DISTRIBUCIÓN DE B.T. PERO CARECE DE INTERRUPTOR DIFERENCIAL.', 0, '2021-11-17 00:35:11', '2021-11-17 00:35:11'),
(489, 130, 17, 2, 2, 'INSTALACIONES EVIDENCIAN FALTA DE PORTÓN SEGURO EN INGRESO, ADEMÁS CARECE DE UNA PARTE DE CERCO PERIMÉTRICO', 0, '2021-11-17 00:35:35', '2021-11-17 00:35:35'),
(490, 130, 18, 1, 0, '1.	INSTALACIONES EVIDENCIAN DE SEÑALIZACIÓN DE DEFENSA CIVIL, COVID-19, RIESGO ELÉCTRICO Y EXTINTORES.\r\n2.	BOTIQUÍN NO IMPLEMENTADO\r\n3.	CARENCIA DE MAPA DE RIESGOS, CERTIFICADO DE DEFENSA CIVIL Y LICENCIA MUNICIPAL DE FUNCIONAMIENTO.\r\n4.	CARECEN DE LUCES DE EMERGENCIA.\r\n5.	NO EVIDENCIAN DE KIT ANTI DERRAMES.\r\n6.	TABLERO DE ENERGÍA DE B.T SIN INTERRUPTOR DIFERENCIAL.', 0, '2021-11-17 00:36:37', '2021-11-17 00:36:37'),
(491, 130, 18, 2, 1, '1.	REALIZAR INSTALAR IDENTIFICACIONES DE PELIGROS Y ACTUALIZACIONES DE MAPA DE RIESGOS EN LUGARES VISIBLES PARA EL PERSONAL QUE INGRESE A LAS INSTALACIONES.\r\n2.	CONTAR CON LICENCIA DE FUNCIONAMIENTO, CERTIFICADO DEFENSA CIVIL.\r\n3.	EVIDENCIAR DE KIT ANTI DERRAMES.\r\n4.	IMPLEMENTAR DE LUCES DE EMERGENCIA, BOTIQUÍN DE PRIMEROS AUXILIOS.', 0, '2021-11-17 00:37:01', '2021-11-17 00:37:01'),
(492, 130, 19, 1, 0, 'ELEVAR EL PRESENTE INFORME AL ÁREA DE SEGURIDAD, SALUD EN EL TRABAJO Y MEDIO AMBIENTE DE ENSA, PARA LAS COORDINACIONES CON EL ÁREA DE COMPETENCIA, CON LA FINALIDAD DE SUBSANAR LAS DEFICIENCIAS ENCONTRADAS EN LAS INSTALACIONES DE LA SUBESTACIÓN.', 0, '2021-11-17 00:37:18', '2021-11-17 00:37:18'),
(493, 131, 1, 1, 0, 'PERSONAL OPERATIVO TIENE IMPLEMENTOS DE PROTECCIÓN PERSONAL: CASCO DIELÉCTRICO CON BARBIQUEJO, LENTES, MASCARILLA, GUANTES CUERO, CALZADO DE SEGURIDAD DIELÉCTRICO, UNIFORME DE TRABAJO, CHALECO Y FOTOCHECK DE IDENTIFICACIÓN.', 0, '2021-11-17 11:22:33', '2021-11-17 11:22:33'),
(494, 131, 1, 1, 0, 'PERSONAL TÉCNICO QUE REALIZA TRABAJOS EN ALTURA, CUENTA CON 01 ESCALERAS TIPO TELESCÓPICA, EQUIPOS DE PROTECCIÓN CONTRA CAÍDAS (ARNÉS TIPO LINIERO, LÍNEA Y FAJA DE ANCLAJE) Y 01 EQUIPO DE SISTEMA DE ESCALAMIENTO (FRENO DE CUERDA).', 0, '2021-11-17 11:22:47', '2021-11-17 11:22:47'),
(495, 131, 1, 1, 0, 'GRUPO DE TRABAJO EVIDENCIA DE GUANTES DIELÉCTRICOS DE M.T, REVELADOR DE TENSIÓN, PÉRTIGA EN BUEN ESTADO.', 0, '2021-11-17 11:22:56', '2021-11-17 11:22:56'),
(496, 131, 2, 1, 0, 'PERSONAL OPERATIVO SEÑALIZA ZONAS DONDE INSTALA TIERRAS TEMPORARIAS E IDENTIFICA ÁREAS DE TRABAJO CON CONOS DE SEGURIDAD, BIOMBOS DE METAL CON MALLA Y CINTA AMARILLA.', 0, '2021-11-17 11:24:16', '2021-11-17 11:24:16'),
(497, 131, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA M7M-963 (MINIVAN), DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN DE PRIMEROS AUXILIOS, LUCES OPERATIVAS, ALARMA DE RETROCESO Y HERRAMIENTAS VARIAS', 0, '2021-11-17 11:25:14', '2021-11-17 11:25:14'),
(498, 131, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA B5P-946 (CAMIÓN GRÚA), DESTINADO AL IZAJE DE POSTES Y CARGA DE MATERIALES, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN, CONOS, TACOS, HERRAMIENTAS VARIAS; ADEMÁS DE CERTIFICADO DEL BRAZO HIDRÁULICO DE GRÚA Y CERTIFICADO DEL OPERADOR VIGENTES.', 0, '2021-11-17 11:25:24', '2021-11-17 11:25:24'),
(499, 131, 3, 3, 0, 'DOTAR DE BANDERINES PARA ESCALERAS, DE UNIDADES MÓVILES, LOS CUALES ESTÁN DETERIORADOS', 0, '2021-11-17 11:25:35', '2021-11-17 11:25:35'),
(500, 131, 4, 1, 0, 'CONTRATISTA EVIDENCIA DE COPIAS DE PÓLIZAS SCTR Y VIDA LEY VIGENTES', 0, '2021-11-17 11:26:55', '2021-11-17 11:26:55'),
(501, 131, 4, 1, 0, 'GRUPO DE TRABAJO, EVIDENCIA EL REGISTRO DE LA CHARLA DE SEGURIDAD; PREVIO AL DESARROLLO DE LA ACTIVIDAD Y EVALÚA RIESGOS POR COVID-19', 0, '2021-11-17 11:27:04', '2021-11-17 11:27:04'),
(502, 131, 4, 1, 0, 'GRUPO DE TRABAJO CUENTA CON ORDEN DE TRABAJO, BOLETAS DE SEGURIDAD, PERMISO DE TRABAJOS EN ALTURA.', 0, '2021-11-17 11:27:14', '2021-11-17 11:27:14'),
(503, 131, 4, 1, 0, 'GRUPO DE TRABAJO, CUENTA CON PETS, IPERC Y PLAN DE CONTINGENCIA; DONDE DESCRIBEN PROCEDIMIENTO PARA PREVENIR CONTAGIO POR COVID-19; ADEMÁS DE SU DIFUSIÓN', 0, '2021-11-17 11:27:32', '2021-11-17 11:27:32'),
(504, 131, 5, 1, 0, 'SUPERVISIÓN POR PARTE DEL CONTRATISTA (INGENIEROS DE CAMPO Y SUPERVISOR DE SEGURIDAD), EN ZONA DE TRABAJO, DURANTE DESARROLLO DE LA ACTIVIDAD.', 0, '2021-11-17 11:28:26', '2021-11-17 11:28:26'),
(505, 131, 5, 1, 0, 'PERSONAL HACE USO DE EQUIPOS DE PROTECCIÓN CONTRA CAÍDAS, SEGÚN ZONA DE TRABAJO PARA REALIZAR TRABAJOS EN ALTURA.', 0, '2021-11-17 11:28:34', '2021-11-17 11:28:34'),
(506, 131, 5, 1, 0, 'GRUPO DE TRABAJO CUMPLE CON LAS CINCO REGLAS DE ORO, PARA TRABAJOS CON ESTRICCIÓN DE ENERGÍA    ELÉCTRICA.', 0, '2021-11-17 11:28:43', '2021-11-17 11:28:43'),
(507, 131, 6, 1, 0, 'PERSONAL HACE USO DE ALCOHOL Y MASCARILLAS (PROTECTORES BUCONASALES COMUNITARIOS), PARA PREVENIR CONTAGIO POR COVID-19.;DEMÁS CUENTA CON AGUA PARA HIDRATARSE.', 0, '2021-11-17 11:30:24', '2021-11-17 11:30:24'),
(508, 131, 7, 1, 0, '1.	PERSONAL OPERATIVO, IMPLEMENTADO CON EPPS BÁSICOS.\r\n2.	PERSONAL SE ENCUENTRA COBERTURADO EN PÓLIZA SCTR Y SEGURO VIDA LEY.\r\n3.	UNIDAD MÓVIL IMPLEMENTADA\r\n4.	CONTRATISTA CUMPLE CON CINCO REGLAS DE ORO EN ELECTRICIDAD.\r\n5.	PERSONAL EVIDENCIA REGISTRO DE CHARLA DE CINCO MINUTOS, ORDEN DE TRABAJO, PETS E IPERC.\r\n6.	SUPERVISOR DEL CONTRATISTA EN ZONA DE TRABAJO.', 0, '2021-11-17 11:31:07', '2021-11-17 11:31:07'),
(509, 131, 7, 2, 1, '1.	DOTAR DE EPP A PERSONAL OPERATIVO SEGÚN LA ACTIVIDAD A EJECUTAR Y NIVEL DE RIESGO EXPUESTO.\r\n2.	UNIDADES MÓVILES DEBEN ESTAR EQUIPADAS FRENTE A CUALQUIER CONTINGENCIA LABORAL, ADEMÁS DE DOTAR DE BANDERINES PARA ESCALERAS.\r\n3.	CAPACITAR A PERSONAL EN DESARROLLO DE IPERC Y/O AST, EL CUAL PERMITA AL TRABAJADOR, IDENTIFICAR EL RIESGO AL CUAL ESTÁ EXPUESTO.\r\n4.	SUPERVISAR CONSTANTEMENTE LAS ACTIVIDADES QUE SE EJECUTA EN CAMPO, POR PARTE DE INGENIEROS DE CONTRATISTA\r\n', 0, '2021-11-17 11:31:49', '2021-11-17 11:31:49'),
(510, 131, 8, 1, 0, '1.	SE COORDINÓ CON ING. JESÚS CASTRO PISCOYA (SUPERVISOR DE SEGURIDAD) DE LA CONTRATISTA, IMPLEMENTAR RECOMENDACIONES DADAS EN EL PRESENTE INFORME DANDO CUMPLIMIENTO AL RESESATE 2013 Y NORMAS DE SEGURIDAD\r\n', 0, '2021-11-17 11:32:31', '2021-11-17 11:32:31'),
(511, 131, 9, 1, 0, 'SERVICIO DE MANTENIMIENTO DEL SISTEMA DE DISTRIBUCIÓN DE MEDIA TENSIÓN, DE SUBESTACIONES, DE BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO COMERCIALES PERIODO 2019 – 2022, EN LA UNIDAD DE NEGOCIOS SUCURSALES – ELECTRONORTE S.A.', 0, '2021-11-17 11:38:23', '2021-11-17 11:38:23'),
(512, 131, 9, 2, 1, 'ING. JUAN VILCHEZ SANTISTEBAN ', 0, '2021-11-17 11:38:54', '2021-11-17 11:38:54'),
(513, 131, 9, 3, 0, 'ING. JESUS CASTRO PISCOYA (950207320)', 0, '2021-11-17 11:39:09', '2021-11-17 11:39:09'),
(514, 131, 9, 4, 0, 'ING. CARLOS GARCIA GONZALES (979608286)', 0, '2021-11-17 11:39:18', '2021-11-17 11:39:18'),
(515, 132, 1, 1, 0, 'LOS TEC. ELECTRICISTA CUENTA CON UNIFORME Y EPPS EN BUEN ESTADO Y CUENTA CON FOTOCHECK.', 0, '2021-11-17 13:06:44', '2021-11-17 13:06:44'),
(516, 132, 2, 3, 0, 'NO APLICA EN LA ACTIVIDAD QUE VIENE REALIZANDO', 0, '2021-11-17 13:07:30', '2021-11-17 13:07:30'),
(517, 132, 3, 3, 0, 'NO APLICA EN LA ACTIVIDAD QUE VIENE REALIZANDO', 0, '2021-11-17 13:07:52', '2021-11-17 13:07:52'),
(518, 132, 4, 2, 72, 'NO SE EVIDENCIA COPIA DE LA PÓLIZA SCTR (SALUD Y PENSIÓN) VIGENTE, SEGURO VIDA LEY, DEL PETS, IPERC, FLUJOGRAMA ANTE UNA EMERGENCIA, MAPA DE RIESGO. INCUMPLIMIENTO ART. 37° DEL RESESATE.', 0, '2021-11-17 13:08:25', '2021-11-17 13:08:25'),
(519, 132, 5, 3, 0, 'NO SE EVALUÓ POR FALTA DEL PROCEDIMIENTO.', 0, '2021-11-17 13:08:50', '2021-11-17 13:08:50'),
(520, 132, 6, 1, 0, 'PERSONAL HACE USO DE MASCARILLAS (QUIRÚRGICAS), ALCOHOL PARA PREVENIR CONTAGIO POR COVID-19 ', 0, '2021-11-17 13:09:04', '2021-11-17 13:09:04'),
(521, 132, 6, 1, 0, 'PERSONAL HACE USO DE MASCARILLAS (QUIRÚRGICAS), ALCOHOL PARA PREVENIR CONTAGIO POR COVID-19 ', 1, '2021-11-17 13:09:46', '2021-11-17 13:09:46'),
(522, 132, 6, 1, 0, 'CUENTAN CON HERRAMIENTAS DIELÉCTRICAS EN BUEN ESTADO.', 0, '2021-11-17 13:10:17', '2021-11-17 13:10:17'),
(523, 132, 7, 1, 0, '1.	TÉCNICO ELECTRICISTA CUENTA CON EPPS Y UNIFORME Y HERRAMIENTAS DIELÉCTRICAS EN BUEN ESTADO.\r\n2.	NO CUENTAN CON DOCUMENTOS DE SEGURIDAD (PETS, IPERC, MAPA DE RIESGOS, PLAN DE CONTINGENCIA).\r\n3.	CUENTA CON MASCARILLA Y ALCOHOL PARA LA PREVENCIÓN DE LA COVID-19.', 0, '2021-11-17 13:10:54', '2021-11-17 13:10:54'),
(524, 132, 7, 2, 1, '1.	SE DEBE ALCANZAR COPIA LOS PETS, IPERC Y PLAN DE CONTINGENCIA.\r\n2.	REALIZAR CHARLA DE SEGURIDAD SOBRE LOS PETS ELABORADOS PARA CADA ACTIVIDAD.', 0, '2021-11-17 13:11:09', '2021-11-17 13:11:09'),
(525, 132, 8, 1, 0, '1.	DERIVAR A QUIEN CORRESPONDA Y LEVANTAR OBSERVACIONES E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.\r\n2.	SE REALIZÓ CHARLA SOBRE LA DIFUSIÓN DE LA POLÍTICA INTEGRADA DE GESTIÓN DE ENSA, PLAN DE CONTINGENCIA, IPERC E IMPACTOS AMBIENTALES.', 1, '2021-11-17 13:11:42', '2021-11-17 13:11:42'),
(526, 132, 8, 1, 0, '1.	DERIVAR A QUIEN CORRESPONDA Y LEVANTAR OBSERVACIONES E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.', 0, '2021-11-17 13:12:16', '2021-11-17 13:12:16'),
(527, 132, 8, 1, 0, '2.	SE REALIZÓ CHARLA SOBRE LA DIFUSIÓN DE LA POLÍTICA INTEGRADA DE GESTIÓN DE ENSA, PLAN DE CONTINGENCIA, IPERC E IMPACTOS AMBIENTALES.', 0, '2021-11-17 13:12:29', '2021-11-17 13:12:29'),
(528, 132, 9, 1, 0, 'DISTRIBUCIÓN Y COMERCIALIZACIÓN DE ENERGÍA ELÉCTRICA  ', 0, '2021-11-17 13:16:24', '2021-11-17 13:16:24'),
(529, 132, 9, 2, 1, 'ING. NEYCER VILLEGAS RIMARACHIN', 0, '2021-11-17 13:16:42', '2021-11-17 13:16:42'),
(530, 133, 12, 1, 0, 'LOS AMBIENTES DEL ESTABLECIMIENTO CUENTAN CON ILUMINACIÓN Y VENTILACIÓN NATURAL E ILUMINACIÓN ARTIFICIAL EN BUEN ESTADO.', 0, '2021-11-17 20:29:50', '2021-11-17 20:29:50'),
(531, 133, 13, 1, 0, 'LOS AMBIENTES DE LA INSTALACIÓN SE ENCUENTRAN LIMPIOS Y ORDENADOS, SE EVIDENCIA EN LAS OFICINAS ESTANTES PARA LA DISPOSICIÓN DE ARCHIVADORES.', 0, '2021-11-17 20:30:44', '2021-11-17 20:30:44'),
(532, 133, 14, 1, 0, 'EL SERVICIO HIGIÉNICO CUENTA CON ARTÍCULOS DE LIMPIEZA Y SE ENCUENTRA LIMPIO', 0, '2021-11-17 20:31:18', '2021-11-17 20:31:18'),
(533, 133, 15, 1, 0, 'SE EVIDENCIA SEÑALÉTICAS DE SEGURIDAD DE ACUERDO A LO ESTABLECIDO POR DEFENSA CIVIL Y SEÑALÉTICAS DE PREVENCIÓN DE LA COVID-19.', 0, '2021-11-17 20:31:44', '2021-11-17 20:31:44'),
(534, 133, 15, 2, 72, 'CARENCIA DE MAPA DE RIESGOS Y EVACUACIÓN, EL CUAL DEBE UBICARSE EN ZONAS VISIBLES DE LA INSTALACIÓN. (INCUMPLIMIENTO AL ART. 11 D) DEL RESESATE 2013). ', 0, '2021-11-17 20:32:04', '2021-11-17 20:32:04'),
(535, 133, 16, 1, 0, 'CUENTA CON UN EXTINTOR DE PQS Y LÁMPARAS DE EMERGENCIA (INSTALAR EN OFICINA.', 0, '2021-11-17 20:32:48', '2021-11-17 20:32:48'),
(536, 133, 16, 2, 54, 'INSTALACIÓN CUENTA CON BOTIQUÍN PRIMEROS AUXILIOS INCOMPLETO. (INCUMPLIMIENTO AL ART. 110° DEL RESESATE 2013).', 0, '2021-11-17 20:33:07', '2021-11-17 20:33:07'),
(537, 133, 16, 2, 72, 'INSTALACIÓN NO CUENTA CON FLUJO DE COMUNICACIÓN EN CASO DE EMERGENCIA. (INCUMPLIMIENTO AL ART. 24° Y 19° D) DEL RESESATE 2013).', 0, '2021-11-17 20:33:24', '2021-11-17 20:33:24'),
(538, 133, 16, 1, 0, 'INSTALACIÓN CUENTA CON TERMÓMETRO DIGITAL PARA TOMA DE TEMPERATURA PARA LOS CLIENTES Y VISITAS', 0, '2021-11-17 20:33:36', '2021-11-17 20:33:36'),
(539, 133, 17, 2, 62, 'INSTALACIONES NO CUENTAN CON CERTIFICADO DE DEFENSA CIVIL Y LICENCIA MUNICIPAL DE FUNCIONAMIENTO. (INCUMPLIMIENTO AL ART. 3 LEY 28976 LEY DE MARCO DE LICENCIA DE FUNCIONAMIENTO, ART. 37 DS 058- 2014 PCM, REGLAMENTO DE INSPECCIONES TÉCNICAS DE SEGURIDAD DE EDIFICACIONES)', 0, '2021-11-17 20:34:27', '2021-11-17 20:34:27'),
(540, 133, 17, 2, 63, 'SE EVIDENCIA CERTIFICADO DE FUMIGACIÓN NO VIGENTE.', 0, '2021-11-17 20:34:53', '2021-11-17 20:34:53'),
(541, 133, 17, 2, 41, 'NO SE EXHIBE EN UN LUGAR VISIBLE LA POLÍTICA Y OBJETIVOS DE ENSA, Y EL IPERC. (INCUMPLIMIENTO AL ART. 11° A), C) DEL RESESATE 2013).', 0, '2021-11-17 20:35:22', '2021-11-17 20:35:22'),
(542, 133, 17, 2, 1, 'LA INSTALACIÓN NO CUENTA CON DIAGRAMA Y ESQUEMA DE LOS SISTEMAS ELÉCTRICOS. (INCUMPLIMIENTO AL ART. 78° DEL RESESATE 2013).', 0, '2021-11-17 20:35:56', '2021-11-17 20:35:56'),
(543, 133, 17, 2, 66, 'LOS CONTENEDORES DE RESIDUOS SÓLIDOS NO CUMPLEN CON EL CÓDIGO DE COLORES. (INCUMPLIMIENTO NTP 900-058-2019).', 0, '2021-11-17 20:36:17', '2021-11-17 20:36:17'),
(544, 133, 18, 1, 0, '1.	SE EVIDENCIA AMBIENTES LIMPIOS Y ORDENADOS.  \r\n2.	CUENTA CON SEÑALÉTICAS DE SEGURIDAD EN LAS INSTALACIONES DEL ESTABLECIMIENTO.\r\n3.	CUENTA CON EXTINTOR PQS Y BOTIQUÍN DE PRIMEROS AUXILIOS SE EVIDENCIO INSUMOS INCOMPLETOS.\r\n4.	CARENCIA DE MAPA DE RIESGOS, CERTIFICADO DE DEFENSA CIVIL, LICENCIA DE FUNCIONAMIENTO, POLÍTICA SST Y OBJETIVOS DE ENSA, DIAGRAMA DE CIRCUITOS.\r\n5.	NO CUENTA CON CONTENEDORES DE RESIDUOS SÓLIDOS DE ACUERDO A LA NORMATIVA VIGENTE.', 0, '2021-11-17 20:37:01', '2021-11-17 20:37:01'),
(545, 133, 18, 2, 1, '1.	INSTALAR IDENTIFICACIONES DE PELIGROS Y DE MAPA DE RIESGOS Y POLÍTICA SST DE ENSA EN LUGARES VISIBLES PARA EL PERSONAL QUE INGRESE A LAS INSTALACIONES.\r\n2.	GESTIONAR EL CERTIFICADO DE DEFESA CIVIL, LICENCIA DE FUNCIONAMIENTO Y MEDICIÓN DE POZOS A TIERRA.\r\n3.	IMPLEMENTAR CONTENEDORES DE RRSS DE ACUERDO A LA NORMATIVA VIGENTE.\r\n4.	IMPLEMENTACIÓN DEL BOTIQUÍN DE PRIMEROS AUXILIOS CON LOS INSUMOS QUE FALTA.\r\n5.	INSTALAR LÁMPARA DE EMERGENCIA EN OFICINA.', 0, '2021-11-17 20:37:22', '2021-11-17 20:37:22'),
(546, 133, 19, 1, 0, 'ELEVAR EL PRESENTE INFORME AL ÁREA DE SEGURIDAD, SALUD EN EL TRABAJO Y MEDIO AMBIENTE DE ENSA, POR LAS COORDINACIONES CON EL ÁREA DE COMPETENCIA, CON LA FINALIDAD DE SUBSANAR LAS DEFICIENCIAS ENCONTRADAS EN LAS INSTALACIONES DE LA SUBESTACIÓN.', 0, '2021-11-17 20:37:43', '2021-11-17 20:37:43'),
(547, 135, 1, 1, 0, 'PARTE DEL PERSONAL AYUDANTE Y EL TÉCNICO CUENTA CON EPPS BÁSICOS PARA REALIZAR LA ACTIVIDAD (ZAPATOS DIELÉCTRICOS, GUANTES DE CUERO Y LENTES DE SEGURIDAD) Y UNIFORME (PANTALÓN Y POLO) EN BUEN ESTADO.', 0, '2021-11-17 21:53:25', '2021-11-17 21:53:25'),
(548, 135, 1, 2, 51, 'LOS AYUDANTES SEGUNDO DÍAZ CARRASCO Y NANDITO BOBADILLA GIL SE EVIDENCIA QUE CUENTAN CON ZAPATOS DIELÉCTRICOS EN MAL ESTADO.', 0, '2021-11-17 21:53:52', '2021-11-17 21:53:52'),
(549, 135, 2, 1, 0, 'SE EVIDENCIA QUE DURANTE LA EJECUCIÓN SEÑALIZAN HACIENDO USO DE CINTA DE SEÑALIZACIÓN', 0, '2021-11-17 21:54:32', '2021-11-17 21:54:32'),
(550, 135, 3, 3, 0, 'NO SE EVIDENCIA', 0, '2021-11-17 21:55:09', '2021-11-17 21:55:09'),
(551, 135, 4, 1, 0, 'EL TÉCNICO RESPONSABLE DE LA ACTIVIDAD CUENTA CON COPIA DE LA ORDEN DE TRABAJO, CHARLA DE 5 MIN, AST, PETS, IPERC, FLUJOGRAMA EN CASO DE EMERGENCIA, PÓLIZA SCTR (SALUD Y PENSIÓN) VIGENTE Y SEGURO VIDA LEY, SEGURO CONTRA ACCIDENTES PERSONAL, Y REGISTRO DE LA INSPECCIÓN DE HERRAMIENTAS Y EPPS.', 0, '2021-11-17 21:55:27', '2021-11-17 21:55:27'),
(552, 135, 5, 1, 0, 'SE EVIDENCIA QUE CUMPLEN CON EL PROCEDIMIENTO DE TRABAJO SEGURO:\r\n- REALIZAN CHARLA DE 5 MIN, ELABORAN EL AS, REALIZAN INSPECCIÓN DE HERRAMIENTAS Y EPPS, TODO EL PERSONAL INVOLUCRADO SE ENCUENTRA COBERTURADO CON PÓLIZA DE SEGUROS.\r\n- UTILIZAN HERRAMIENTAS EN BUEN ESTADO.\r\n', 0, '2021-11-17 21:56:05', '2021-11-17 21:56:05'),
(553, 135, 6, 1, 0, 'SE EVIDENCIA QUE EL PERSONAL CUENTA CON MASCARILLAS PARA LA PREVENCIÓN DE LA COVI-19.', 0, '2021-11-17 21:56:49', '2021-11-17 21:56:49'),
(554, 135, 7, 1, 0, '1.	SE EVIDENCIA QUE PARTE DE LOS AYUDANTES CUENTAN CON ZAPATOS DIELÉCTRICOS EN MAL ESTADO.\r\n2.	REALIZAN LA SEÑALIZACIÓN DE SU ÁREA DE TRABAJO.\r\n3.	CUENTAN CON COPIA DE LA DOCUMENTACIÓN DE SEGURIDAD EXIGIDA POR ENSA.\r\n4.	CUENTAN CON MASCARILLA PARA LA PREVENCIÓN DEL CONTAGIO DE LA COVID-19.', 0, '2021-11-17 21:57:21', '2021-11-17 21:57:21'),
(555, 135, 7, 1, 0, '1.	SE EVIDENCIA QUE PARTE DE LOS AYUDANTES CUENTAN CON ZAPATOS DIELÉCTRICOS EN MAL ESTADO.\r\n2.	REALIZAN LA SEÑALIZACIÓN DE SU ÁREA DE TRABAJO.\r\n3.	CUENTAN CON COPIA DE LA DOCUMENTACIÓN DE SEGURIDAD EXIGIDA POR ENSA.\r\n4.	CUENTAN CON MASCARILLA PARA LA PREVENCIÓN DEL CONTAGIO DE LA COVID-19.', 0, '2021-11-17 21:57:49', '2021-11-17 21:57:49'),
(556, 135, 7, 2, 1, '1.	REALIZAR EL CAMBIO DE LOS ZAPATOS DIELÉCTRICOS AL PERSONAL QUE LOS TIENE EN MAL ESTADO Y ADEMÁS SE RECOMIENDA REALIZAR UNA ADECUADA INSPECCIÓN DE EPPS EN CADA ACTIVIDAD.\r\n2.	REALIZAR CHARLAS AL PERSONAL SOBRE EL ADECUADO USO DE HERRAMIENTAS.\r\n3.	SE RECOMIENDA REALIZAR ENTRENAMIENTO AL PERSONAL SOBRE LA MANERA CORRECTA DE REALIZAR LA DELIMITACIÓN Y SEÑALIZACIÓN DEL ÁREA DE TRABAJO.\r\n4.	CONTINUAR CON LAS CHARLAS SOBRE LAS MEDIDAS DE PREVENCIÓN DE LA COVID-19.\r\n5.	REALIZAR LA ENTREGA DE AGUA PARA EL CONSUMO DEL PERSONAL, ASÍ COMO CONCIENTIZAR A SU PERSONAL SOBRE EL USO DEL BLOQUEADOR SOLAR.\r\n', 0, '2021-11-17 22:01:02', '2021-11-17 22:01:02'),
(557, 135, 8, 1, 0, '1.	DERIVAR A QUIEN CORRESPONDA E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.', 0, '2021-11-17 22:01:21', '2021-11-17 22:01:21'),
(558, 135, 9, 1, 0, 'AMPLIACIÓN DE LA ELECTRIFICACIÓN DE LAS COMUNIDADES RURALES DE HUAMBOS DEL DISTRITO DE HUAMBOS - CHOTA – CAJAMARCA” de su cliente ELECTRONORTE S.A.', 0, '2021-11-17 22:24:18', '2021-11-17 22:24:18'),
(559, 135, 9, 2, 1, 'ING. JUAN CERON', 0, '2021-11-17 22:24:35', '2021-11-17 22:24:35'),
(560, 135, 9, 3, 0, 'ING. JOSÉ DELGADO', 0, '2021-11-17 22:24:47', '2021-11-17 22:24:47'),
(561, 136, 1, 1, 0, 'PARTE DEL PERSONAL AYUDANTE Y EL TÉCNICO CUENTA CON EPPS BÁSICOS PARA REALIZAR LA ACTIVIDAD (ZAPATOS DIELÉCTRICOS, GUANTES DE CUERO Y LENTES DE SEGURIDAD) Y UNIFORME (PANTALÓN Y POLO) EN BUEN ESTADO.', 0, '2021-11-17 22:37:45', '2021-11-17 22:37:45'),
(562, 136, 1, 2, 51, 'EL AYUDANTE EBER CULQUI DIAZ SE APRECIA QUE LOS GUANTES DE CUERO LOS TIENE EN MAL ESTADO', 0, '2021-11-17 22:38:05', '2021-11-17 22:38:05'),
(563, 136, 2, 1, 0, 'SE EVIDENCIA QUE DURANTE LA EJECUCIÓN SEÑALIZAN HACIENDO USO DE CINTA DE SEÑALIZACIÓN', 0, '2021-11-17 22:56:47', '2021-11-17 22:56:47'),
(564, 136, 3, 3, 0, 'NO SE EVIDENCIA ', 0, '2021-11-17 22:57:31', '2021-11-17 22:57:31'),
(565, 136, 4, 1, 0, 'EL TÉCNICO RESPONSABLE DE LA ACTIVIDAD CUENTA CON COPIA DE LA ORDEN DE TRABAJO, CHARLA DE 5 MIN, AST, PETS, IPERC, FLUJOGRAMA EN CASO DE EMERGENCIA, PÓLIZA SCTR (SALUD Y PENSIÓN) VIGENTE Y SEGURO VIDA LEY, SEGURO CONTRA ACCIDENTES PERSONAL, Y REGISTRO DE LA INSPECCIÓN DE HERRAMIENTAS Y EPPS.', 0, '2021-11-17 22:57:47', '2021-11-17 22:57:47'),
(566, 136, 5, 1, 0, 'SE EVIDENCIA QUE CUMPLEN CON EL PROCEDIMIENTO DE TRABAJO SEGURO:\r\n- REALIZAN CHARLA DE 5 MIN, ELABORAN EL AS, REALIZAN INSPECCIÓN DE HERRAMIENTAS Y EPPS, TODO EL PERSONAL INVOLUCRADO SE ENCUENTRA COBERTURADO CON PÓLIZA DE SEGUROS.\r\n- UTILIZAN HERRAMIENTAS EN BUEN ESTADO.\r\n', 0, '2021-11-17 22:58:32', '2021-11-17 22:58:32'),
(567, 136, 6, 1, 0, 'SE EVIDENCIA QUE EL PERSONAL CUENTA CON MASCARILLAS PARA LA PREVENCIÓN DE LA COVI-19.', 0, '2021-11-17 22:59:16', '2021-11-17 22:59:16'),
(568, 136, 6, 1, 0, 'SE EVIDENCIA QUE EL PERSONAL CUENTA CON MASCARILLAS PARA LA PREVENCIÓN DE LA COVI-19.', 1, '2021-11-17 22:59:16', '2021-11-17 22:59:16'),
(569, 136, 7, 1, 0, '1.	SE EVIDENCIA QUE PARTE DE LOS AYUDANTES CUENTAN CON GUANTES DE CUERO EN MAL ESTADO.\r\n2.	REALIZAN LA SEÑALIZACIÓN DE SU ÁREA DE TRABAJO.\r\n3.	CUENTAN CON COPIA DE LA DOCUMENTACIÓN DE SEGURIDAD EXIGIDA POR ENSA.\r\n4.	CUENTAN CON MASCARILLA PARA LA PREVENCIÓN DEL CONTAGIO DE LA COVID-19.', 0, '2021-11-17 22:59:57', '2021-11-17 22:59:57'),
(570, 136, 7, 1, 0, '1.	SE EVIDENCIA QUE PARTE DE LOS AYUDANTES CUENTAN CON GUANTES DE CUERO EN MAL ESTADO.\r\n2.	REALIZAN LA SEÑALIZACIÓN DE SU ÁREA DE TRABAJO.\r\n3.	CUENTAN CON COPIA DE LA DOCUMENTACIÓN DE SEGURIDAD EXIGIDA POR ENSA.\r\n4.	CUENTAN CON MASCARILLA PARA LA PREVENCIÓN DEL CONTAGIO DE LA COVID-19.', 0, '2021-11-17 23:00:25', '2021-11-17 23:00:25'),
(571, 136, 7, 2, 1, '1.	REALIZAR EL CAMBIO DE LOS GUANTES DE CUERO AL PERSONAL QUE LOS TIENE EN MAL ESTADO Y ADEMÁS SE RECOMIENDA REALIZAR UNA ADECUADA INSPECCIÓN DE EPPS EN CADA ACTIVIDAD.\r\n2.	REALIZAR CHARLAS AL PERSONAL SOBRE EL ADECUADO USO DE HERRAMIENTAS.\r\n3.	SE RECOMIENDA REALIZAR ENTRENAMIENTO AL PERSONAL SOBRE LA MANERA CORRECTA DE REALIZAR LA DELIMITACIÓN Y SEÑALIZACIÓN DEL ÁREA DE TRABAJO.\r\n4.	CONTINUAR CON LAS CHARLAS SOBRE LAS MEDIDAS DE PREVENCIÓN DE LA COVID-19.\r\n5.	REALIZAR LA ENTREGA DE AGUA PARA EL CONSUMO DEL PERSONAL, ASÍ COMO CONCIENTIZAR A SU PERSONAL SOBRE EL USO DEL BLOQUEADOR SOLAR.\r\n', 0, '2021-11-17 23:00:45', '2021-11-17 23:00:45'),
(572, 136, 8, 1, 0, '1.	DERIVAR A QUIEN CORRESPONDA E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.', 0, '2021-11-17 23:01:00', '2021-11-17 23:01:00'),
(573, 136, 9, 1, 0, 'AMPLIACIÓN DE LA ELECTRIFICACIÓN DE LAS COMUNIDADES RURALES DE HUAMBOS DEL DISTRITO DE HUAMBOS - CHOTA – CAJAMARCA” de su cliente ELECTRONORTE S.A.', 0, '2021-11-17 23:06:26', '2021-11-17 23:06:26'),
(574, 136, 9, 2, 1, 'ING. JUAN CERON', 0, '2021-11-17 23:06:49', '2021-11-17 23:06:49'),
(575, 136, 9, 3, 0, 'ING. JOSÉ DELGADO', 0, '2021-11-17 23:07:08', '2021-11-17 23:07:08'),
(576, 137, 1, 2, 51, 'SE EVIDENCIA QUE EL PERSONAL TÉCNICO NO CUENTA CON LOS EPPS COMPLETOS, LE FALTA LENTES DE SEGURIDAD Y EL BARBIQUEJO PARA EL CASCO Y PROTECCIÓN BUCONASAL. INCUMPLIMIENTO ART. 54°, 105°, 106° DEL RESESATE.', 0, '2021-11-17 23:28:46', '2021-11-17 23:28:46'),
(577, 137, 2, 2, 2, 'SE EVIDENCIA QUE REALIZAN TRABAJOS EN VÍA PÚBLICA Y NO CUENTAN CON ELEMENTOS DE SEÑALIZACIÓN Y DELIMITACIÓN. INCUMPLIMIENTO ART. 47° DEL  RESESATE.', 0, '2021-11-17 23:29:33', '2021-11-17 23:29:33'),
(578, 137, 2, 2, 2, 'SE EVIDENCIA QUE REALIZAN TRABAJOS EN VÍA PÚBLICA Y NO CUENTAN CON ELEMENTOS DE SEÑALIZACIÓN Y DELIMITACIÓN. INCUMPLIMIENTO ART. 47° DEL  RESESATE.', 1, '2021-11-17 23:30:20', '2021-11-17 23:30:20'),
(579, 137, 3, 3, 0, 'NO SE EVIDENCIO UNIDAD MÓVIL', 0, '2021-11-17 23:31:01', '2021-11-17 23:31:01'),
(580, 137, 4, 2, 72, 'DURANTE LA INSPECCIÓN SE EVIDENCIA QUE NO CUENTA CON ORDEN DE TRABAJO, CHARLA DE 5 MIN, NI CON COPIA DEL PETS, IPERC, AST, FLUJOGRAMA DE REPORTE EN CASO DE EMERGENCIA, PÓLIZA SCTR (SALUD Y PENSIÓN) VIGENTE Y SEGURO VIDA LEY Y ACCIDENTES PERSONALES.', 0, '2021-11-17 23:31:29', '2021-11-17 23:31:29'),
(581, 137, 5, 2, 17, 'SE EVIDENCIA QUE LA ACTIVIDAD NO SE CUMPLE CON EL PETS: APERTURA DE HOYOS PARA POSTES C.A.C, MADERA, PUESTA TIERA Y RETENIDA - CODIGO PETS-002 PRESENTADO EN SU EXPEDIENTE DE SEGURIDAD.', 0, '2021-11-17 23:32:04', '2021-11-17 23:32:04'),
(582, 137, 6, 2, 70, 'SE EVIDENCIA QUE NO HACE USO DE MASCARILLA PARA LA PREVENCIÓN DE LA COVID-19. INCUMPLIMIENTO RM 972-2021-MINSA.', 0, '2021-11-17 23:32:51', '2021-11-17 23:32:51'),
(583, 137, 6, 2, 21, 'DURANTE LA ACTIVIDAD NO CUENTAN CON SUPERVISIÓN DE LOS ENCARGADOS DEL ÁREA DE DISTRIBUCIÓN Y/O SEGURIDAD DE LA CONTRATISTA. INCUMPLIMIENTO ART. 37° F) DEL RESESATE.', 0, '2021-11-17 23:33:22', '2021-11-17 23:33:22'),
(584, 137, 6, 2, 2, 'SE EVIDENCIA QUE EN EL JR. JOSÉ ARANA HAY EXCAVACIONES SIN DELIMITAR NI SEÑALIZAR PONIENDO EN RIESGO AL PÚBLICO. ', 0, '2021-11-17 23:33:47', '2021-11-17 23:33:47'),
(585, 137, 7, 1, 0, '1.	PERSONAL NO CUENTA CON LA TOTALIDAD DE EPPS.\r\n2.	DURANTE LA ACTIVIDAD NO CUENTAN CON ELEMENTOS DE DELIMITACIÓN Y SEÑALIZACIÓN.\r\n3.	NO SE EVIDENCIA LA ORDEN DE TRABAJO, CHARLA DE 5 MIN, AST, NI COPIA DEL PETS, IPERC, PÓLIZAS DE SEGURO Y PLAN DE CONTINGENCIA EN EL ÁREA DE TRABAJO.\r\n4.	FALTA DE SUPERVISIÓN POR PARTE DE LA CONTRATISTA EN TRABAJOS DE ALTO RIESGO.\r\n5.	NO CUMPLEN CON LO ESTABLECIDO EN EL PETS -002 DESARROLLADO POR LA CONTRATISTA PARA DICHA ACTIVIDAD.\r\n6.	NO CUMPLIMIENTO DEL PLAN DE PREVENCIÓN PARA EVITAR EL CONTAGIO DE LA COVID-19.\r\n7.	SE EVIDENCIA EXCAVACIONES SIN DELIMITAR NI SEÑALIZAR.', 0, '2021-11-17 23:34:38', '2021-11-17 23:34:38'),
(586, 137, 7, 2, 1, '1.	SE RECOMIENDA ENTREGAR Y/O RENOVAR LOS EPPS Y REALIZAR CAPACITACIÓN SOBRE EL USO ADECUADO, ESTO INCLUYE LAS MASCARILLAS PARA LA PREVENCIÓN DE LA COVID-19.\r\n2.	SE RECOMIENDA CUMPLIR CON LA DELIMITACIÓN Y SEÑALIZACIÓN DEL ÁREA DE TRABAJO.\r\n3.	TODA ACTIVIDAD DEBE CONTAR EN EL ÁREA DE TRABAJO CON LA DOCUMENTACIÓN SOLICITADA POR ENSA (PETS, IPERC, OT, CHARLA DE 5 MIN, PÓLIZAS, PLAN DE CONTINGENCIA, ETC.).\r\n4.	SE RECOMIENDA QUE LAS ACTIVIDADES LOS RESPONSABLES DE LA SUPERVISIÓN DE LA CONTRATISTA GARANTICEN EL CUMPLIMENTO DE LO DISPUESTO POR ENSA Y NORMATIVA VIGENTE. \r\n5.	REALIZAR CAPACITACIÓN PREVIA EN LOS PETS Y/O AST DE LAS ACTIVIDADES QUE REALIZAN CON LA FINALIDAD DE PREVENIR INCUMPLIMIENTOS Y/O ACCIDENTES.\r\n6.	REALIZAR CAPACITACIÓN Y ENTRENAMIENTO AL PERSONAL SOBRE DELIMITACIÓN Y SEÑALIZACIÓN DE ÁREAS DE TRABAJO.\r\n7.	REALIZAR CAPACITACIÓN SOBRE TEMAS QUE CONLLEVE A PREVENIR EL CONTAGIO DE LA COVID-19 Y USO DE EPPS.\r\n8.	TODA EXCAVACIÓN DEBE SER DELIMITADA Y SEÑALIZADA CON LA FINALIDAD DE PREVENIR ACCIDENTES DE LOS TRANSEÚNTES. ', 0, '2021-11-17 23:35:58', '2021-11-17 23:35:58'),
(587, 137, 8, 1, 0, '1.	DERIVAR A QUIEN CORRESPONDA Y LEVANTAR OBSERVACIONES E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.  ', 0, '2021-11-17 23:36:22', '2021-11-17 23:36:22'),
(588, 137, 8, 1, 0, '2.	SE COMUNICA LOS HALLAZGOS AL ING. PERCY CAMPOS VÁSQUES, QUIEN SE APRESONA AL LUGAR TRAYENDO PARTE DE LOS ELEMENTOS DE SEÑALIZACIÓN Y SE LE INFORMA LOS HALLAZGO Y AL NO HABER LEVANTADO LA TOTALIDAD DE LOS HALLAZGOS POR PREVENCION SE PARALIZA LA ACTIVIDAD DE EXCAVACIÓN DE HOYOS. Y SE PONE DE CONOCIMIENTO LA PARALIZACIÓN DE LA ACTIVIDAD AL ING. MARTIN MERA DE ENSA.', 0, '2021-11-17 23:36:38', '2021-11-17 23:36:38'),
(589, 137, 9, 1, 0, 'SERVICIO DE MANTENIMIENTO DE DISTRIBUCIÓN DE MEDIA TENSIÓN, SUBESTACIONES, BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO-COMERCIALES, PARA LOS SISTEMAS ELÉCTRICOS CHOTA –BAMBAMARCA-SANTACRUZ- CUTERVO, JAEN SECTOR I, SECTOR II, SECTOR III, DE LA UNIDAD DE NEGOCIOS CAJAMARCA CENTRO PERIODO 2021-2022 DE ELECTRONORTE S.A.   REFERENCIA ITEM I', 0, '2021-11-17 23:41:08', '2021-11-17 23:41:08'),
(590, 137, 9, 2, 1, 'ING. TEOFANES ZELADA TORRES', 0, '2021-11-17 23:42:19', '2021-11-17 23:42:19'),
(591, 137, 9, 3, 0, 'ING. PERCY CAMPOS VÁSQUES', 0, '2021-11-17 23:42:28', '2021-11-17 23:42:28'),
(592, 138, 1, 2, 51, 'PERSONAL ENCARGADO DE ATENCIÓN AL CLIENTE NO CUENTA CON UNIFORME. INCUMPLIMIENTO ART. 101° DEL RESESATE.', 0, '2021-11-19 16:51:03', '2021-11-19 16:51:03'),
(593, 138, 1, 1, 0, 'PERSONAL CUENTA CON FOTOCHECK Y MASCARILLA QUIRÚRGICA PARA LA PROTECCIÓN DE LA COVID-19.', 0, '2021-11-19 16:51:17', '2021-11-19 16:51:17'),
(594, 138, 2, 1, 0, 'SE EVIDENCIA SEÑALÉTICAS DE SEGURIDAD Y DE PREVENCIÓN DE LA COVID-19 EN EL ESTABLECIMIENTO.', 0, '2021-11-19 16:55:30', '2021-11-19 16:55:30'),
(595, 138, 2, 2, 2, 'NO SE EVIDENCIA EL MAPA DE RIESGOS DEL ESTABLECIMIENTO. INCUMPLIMIENTO ART. 111° D) DEL RESESATE.', 0, '2021-11-19 16:55:49', '2021-11-19 16:55:49'),
(596, 138, 2, 3, 0, 'LETRERO INSTALADO EN LA PARTE FRONTAL DEL ESTABLECIMIENTO HACE MENCIÓN A LA EMPRESA TRANIDE Y NO AL CONSORCIO ELECTRICO BAMBAMARCA. ', 0, '2021-11-19 16:56:24', '2021-11-19 16:56:24'),
(597, 138, 3, 3, 0, 'NO APLICA', 0, '2021-11-19 16:57:19', '2021-11-19 16:57:19'),
(598, 138, 4, 2, 72, 'NO SE EVIDENCIA COPIA DEL PETS, IPERC, PLAN DE CONTINGENCIA, EXAMEN MÉDICO PRE OCUPACIONAL, PÓLIZAS SCTR (SALUD Y PENSIÓN), SEGURO VIDA LEY, SEGURO CONTRA ACCIDENTES PERSONALES. INCUMPLIMIENTO ART. 27°, 28°, 37° Y 140°. ', 0, '2021-11-19 16:57:40', '2021-11-19 16:57:40'),
(599, 138, 5, 3, 0, 'NO SE EVALUÓ POR NO ENCONTRARSE EL PETS DE LA ACTIVIDAD.', 0, '2021-11-19 16:58:03', '2021-11-19 16:58:03'),
(600, 138, 6, 2, 53, 'ESTABLECIMIENTO NO CUENTA CON EXTINTOR PQS, ALUMBRADO DE EMERGENCIA (LÁMPARA DE EMERGENCIA SIN INSTALAR) Y NI BOTIQUÍN DE PRIMEROS AUXILIOS. INCUMPLIMIENTO ART. 54°, 44° Y 120° ', 0, '2021-11-19 16:58:27', '2021-11-19 16:58:27'),
(601, 138, 6, 2, 64, 'UTILIZACIÓN DE SILLA NO ERGONÓMICA. INCUMPLIMIENTO ART. 51°.', 0, '2021-11-19 16:58:58', '2021-11-19 16:58:58'),
(602, 138, 6, 2, 66, 'NO CUENTA CON RECIPIENTES DE ACUERDO A LA NTP 900.058:2019 PARA LA GESTIÓN DE RESIDUOS.', 0, '2021-11-19 16:59:20', '2021-11-19 16:59:20'),
(603, 138, 6, 1, 0, 'SE EVIDENCIA INSTALACIONES ELÉCTRICAS, ILUMINACIÓN Y VENTILACIÓN ADECUADAS.', 0, '2021-11-19 16:59:30', '2021-11-19 16:59:30'),
(604, 138, 6, 1, 0, 'PERSONAL HACE USO DE MASCARILLAS DURANTE LA ATENCIÓN AL PÚBLICO. ', 0, '2021-11-19 16:59:39', '2021-11-19 16:59:39'),
(605, 138, 7, 1, 0, '1.	PERSONAL NO CUENTA CON Y UNIFORME DE TRABAJO.\r\n2.	ESTABLECIMIENTO CUENTA CON SEÑALÉTICAS DE SEGURIDAD Y AVISOS DE PREVENCIÓN DE LA COVID-19.\r\n3.	PERSONAL NO EVIDENCIA COPIA DE LOS DOCUMENTOS SST SOLICITADOS POR ENSA.\r\n4.	EL ESTABLECIMIENTO NO CUENTA CON EXTINTOR PQS, NI BOTIQUÍN DE PRIMEROS AUXILIOS, Y LÁMPARA DE EMERGENCIA SIN INSTALAR Y SIN DEPÓSITOS ADECUADOS PARA RESIDUOS SÓLIDOS.', 0, '2021-11-19 17:00:22', '2021-11-19 17:00:22'),
(606, 138, 7, 2, 1, '1.	ENTREGAR UNIFORME AL PERSONAL.\r\n2.	DEJAR COPIA EN EL ESTABLECIMIENTO COPIA DEL PETS, IPERC, MAPA DE RIESGOS, CHARLA DE 5 MIN, OT Y PÓLIZAS DE SEGURO.\r\n3.	IMPLEMENTAR EXTINTOR PQS, BOTIQUÍN DE PRIMEROS AUXILIOS, RECIPIENTE PARA RESIDUOS E INSTALAR LA LÁMPARA DE EMERGENCIA.\r\n4.	REALIZAR CAPACITACIONES SOBRE TEMAS DE SEGURIDAD Y SALUD OCUPACIONAL AL PERSONAL.', 0, '2021-11-19 17:00:41', '2021-11-19 17:00:41'),
(607, 138, 8, 1, 0, '1.	DERIVAR A QUIEN CORRESPONDA Y LEVANTAR OBSERVACIONES E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.', 0, '2021-11-19 17:01:01', '2021-11-19 17:01:01'),
(608, 138, 9, 1, 0, '“SERVICIO DE MANTENIMIENTO DE DISTRIBUCIÓN DE MEDIA TENSIÓN, SUBESTACIONES, BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO-COMERCIALES, PARA LOS SISTEMAS ELÉCTRICOS CHOTA –BAMBAMARCA-SANTACRUZ- CUTERVO, JAEN SECTOR I, SECTOR II, SECTOR III, DE LA UNIDAD DE NEGOCIOS CAJAMARCA CENTRO PERIODO 2021-2022 DE ELECTRONORTE S.A.   REFERENCIA ITEM II”', 0, '2021-11-19 17:04:11', '2021-11-19 17:04:11'),
(609, 138, 9, 2, 1, 'JAIME MONDRAGON', 0, '2021-11-19 17:04:26', '2021-11-19 17:04:26'),
(610, 138, 9, 3, 0, 'CESAR GUEVARA SEMPERTEGUI.', 0, '2021-11-19 17:04:37', '2021-11-19 17:04:37'),
(611, 139, 1, 1, 0, 'PERSONAL OPERATIVO TIENE IMPLEMENTOS DE PROTECCIÓN PERSONAL: CASCO DIELÉCTRICO CON BARBIQUEJO, CHALECO DE ALTA VISIBILIDAD, MASCARILLAS, GUANTES DE CUERO, GUANTES DE HILO, GUANTES DIELÉCTRICOS BT, CALZADO DE SEGURIDAD Y FOTOCHECK DE IDENTIFICACIÓN', 0, '2021-11-19 17:34:36', '2021-11-19 17:34:36'),
(612, 139, 1, 1, 0, 'PERSONAL TÉCNICO QUE REALIZA TRABAJOS EN ALTURA, CUENTA CON EQUIPO DE PROTECCIÓN CONTRA CAÍDAS (ARNÉS DE SEGURIDAD TIPO LINIERO, LÍNEA Y FAJA DE ANCLAJE), ASÍ MISMO CUENTA CON SISTEMA DE ESCALAMIENTO PARA USO DE ESCALERA TELESCÓPICA, Y ESCALERA AUXILIAR DE MADERA PARA LABORES.', 0, '2021-11-19 17:34:57', '2021-11-19 17:34:57'),
(613, 139, 1, 3, 0, 'PERSONAL TÉCNICO EVIDENCIA DE MALETÍN PORTAHERRAMIENTAS ROTO; ADEMÁS MANIFIESTAN QUE NO HAN DOTADO UNIFORME DE TRABAJO DESDE HACE SEIS MESES.', 0, '2021-11-19 17:35:06', '2021-11-19 17:35:06'),
(614, 139, 2, 1, 0, 'GRUPO DE TRABAJO EVIDENCIA DE BIOMBOS DE PVC, CON MALLA, CINTA AMARILLA, ADEMÁS DE DOS CONOS PARA DELIMITAR Y SEÑALIZAR ZONA DE TRABAJO.', 0, '2021-11-19 17:39:44', '2021-11-19 17:39:44'),
(615, 139, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA M4E-527 (CAMIONETA), DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, TIENE DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN, ALARMA DE RETROCESO, LUCES EN BUEN ESTADO, LLANTA DE REPUESTO Y HERRAMIENTAS MÚLTIPLES PARA EL DESARROLLO DE ACTIVIDADES EN EL SERVICIO.', 0, '2021-11-19 17:40:25', '2021-11-19 17:40:25'),
(616, 139, 4, 1, 0, 'CONTRATISTA EVIDENCIA DE COPIAS DE PÓLIZAS SCTR  Y VIDA LEY VIGENTES POR MEDIO ELECTRÓNICO CELULAR.', 0, '2021-11-19 17:58:19', '2021-11-19 17:58:19'),
(617, 139, 4, 1, 0, 'PERSONAL OPERATIVO EVIDENCIA EL REGISTRO DE LA CHARLA DE SEGURIDAD; PREVIO AL DESARROLLO DE LA ACTIVIDAD. Y EVALÚA RIESGOS POR COVID-19, ES VISADA POR EL SUPERVISOR DE SEGURIDAD. ', 0, '2021-11-19 17:58:33', '2021-11-19 17:58:33'),
(618, 139, 4, 1, 0, 'GRUPO DE TRABAJO CUENTA CON ORDEN DE TRABAJO, PERMISO DE TRABAJOS EN ALTURA, VISADOS POR SUPERVISOR DE SERVICIO. (SUPERVISOR DE SEGURIDAD DEBE DE VISAR PERMISO DE TRABAJO EN ALTURA)', 0, '2021-11-19 17:58:43', '2021-11-19 17:58:43'),
(619, 139, 4, 1, 0, 'GRUPO DE TRABAJO EVIDENCIAN PROCEDIMIENTO ESCRITO DE TRABAJO SEGURO (PETS), IPERC DE LA ACTIVIDAD QUE EJECUTAN, EVIDENCIAN SU DIFUSIÓN. ', 0, '2021-11-19 17:58:52', '2021-11-19 17:58:52'),
(620, 139, 5, 1, 0, 'PERSONAL QUE REALIZA LABORES HACE USO DE EPPS DE ACUERDO CON LA ACTIVIDAD QUE DESARROLLA', 0, '2021-11-19 18:02:39', '2021-11-19 18:02:39'),
(621, 139, 5, 1, 0, 'PRESENCIA DE SUPERVISO DE SEGURIDAD EN ZONA DE TRABAJO PARA EVALUAR PELIGROS Y RIESGOS PROPIOS DE LAS ACTIVIDADES. ', 0, '2021-11-19 18:02:48', '2021-11-19 18:02:48'),
(622, 139, 6, 1, 0, 'PERSONAL HACE  USO  MASCARILLAS (PROTECTORES BUCONASALES), PARA PREVENIR CONTAGIO POR COVID-19; ADEMÁS CUENTAN CON AGUA PARA HIDRATARSE.', 0, '2021-11-19 18:03:40', '2021-11-19 18:03:40'),
(623, 139, 6, 2, 70, 'PERSONAL CARECE DE ALCOHOL, PARA PREVENIR CONTAGIO POR COVID-19', 0, '2021-11-19 18:04:06', '2021-11-19 18:04:06'),
(624, 139, 7, 1, 0, '1.	PERSONAL OPERATIVO, IMPLEMENTADO PARA REALIZAR LABORES.\r\n2.	EVIDENCIAN DE ELEMENTOS PARA DELIMITAR Y SEÑALIZAR.\r\n3.	PERSONAL SE ENCUENTRA COBERTURADO EN PÓLIZA SCTR Y DE SEGURO VIDA LEY.\r\n4.	UNIDAD MÓVIL IMPLEMENTADA\r\n5.	PERSONAL EVIDENCIA REGISTRO DE CHARLA DE CINCO MINUTOS, ORDEN DE TRABAJO, PETS, ACTIVIDADES QUE EJECUTAN, TIENEN DIFUSIÓN.\r\n6.	CONTRATISTA NO HA DOTADO DE ALCOHOL AL PERSONAL OPERATIVO.\r\n7.	PRESENCIA DE SUPERVISIÓN POR PARTE DE CONTRATISTA.', 0, '2021-11-19 18:05:17', '2021-11-19 18:05:17'),
(625, 139, 7, 2, 1, '1.	DOTAR DE EPP A PERSONAL OPERATIVO SEGÚN LA ACTIVIDAD A EJECUTAR Y NIVEL DE RIESGO EXPUESTO.\r\n2.	CAPACITAR A PERSONAL EN DESARROLLO DE IPERC Y/O AST, EL CUAL PERMITA AL TRABAJADOR, IDENTIFICAR EL\r\nRIESGO AL CUAL ESTÁ EXPUESTO.\r\n4.- DOCUMENTOS DE SEGURIDAD DEBEN SER FIRMADOS POR  EL SUPERVISOR DE SEGURIDAD.\r\n5. SUPERVISAR CONSTANTEMENTE LAS ACTIVIDADES QUE SE EJECUTA EN CAMPO, POR PARTE DE INGENIEROS DE CONTRATISTA.                                                               6.- DOTAR DE ALCOHOL PARA PREVENIR CONTAGIOS POR COVI-19.', 0, '2021-11-19 18:05:54', '2021-11-19 18:05:54'),
(626, 139, 8, 1, 0, '1.	SE DIFUNDE PLAN DE CONTINGENCIAS, ADEMÁS DE CHARLA DE PREVENCIÓN EN RIESGOS ELÉCTRICOS.\r\n2.	SE COORDINÓ CON ING. CARLOS SÁNCHEZ (SUPERVISOR DE SEGURIDAD) DE LA CONTRATISTA, DERIVAR INFORME A SUPERVISORES Y SUBSANAR LAS OBSERVACIONES E IMPLEMENTAR RECOMENDACIONES DADAS EN EL PRESENTE INFORME DANDO CUMPLIMIENTO AL RESESATE 2013 Y NORMAS DE SEGURIDAD.\r\n', 0, '2021-11-19 18:06:18', '2021-11-19 18:06:18'),
(627, 139, 9, 1, 0, 'SERVICIO DE TERCERIZACIÓN DE LAS ACTIVIDADES DE REDUCCIÓN Y CONTROL DE PÉRDIDAS EN BAJA TENSIÓN PARA ELECTRONORTE SA.', 0, '2021-11-19 18:25:16', '2021-11-19 18:25:16'),
(628, 139, 9, 2, 1, 'CRISTHIAN TESEN HERNANDEZ', 0, '2021-11-19 18:25:24', '2021-11-19 18:25:24'),
(629, 139, 9, 3, 0, 'CARLOS SANCHEZ SUAREZ', 0, '2021-11-19 18:25:32', '2021-11-19 18:25:32'),
(630, 139, 9, 4, 0, 'ING. JOSE MECHAN CAPUÑAY', 0, '2021-11-19 18:25:41', '2021-11-19 18:25:41'),
(631, 140, 1, 1, 0, 'GRUPO DE TRABAJO, CONTIENEN DE EPPS BÁSICOS: CASCO DIELÉCTRICO CON BARBIQUEJO, ROPA DE TRABAJO (ANTIFLAMA), GUANTES DE CUERO, CALZADO DIELÉCTRICO, GUANTES DE MT, CHALECO DE ALTA VISIBILIDAD Y FOTOCHECK DE IDENTIFICACIÓN.', 0, '2021-11-19 19:00:28', '2021-11-19 19:00:28'),
(632, 140, 1, 1, 0, 'GRUPO DE TRABAJO, QUE REALIZA TRABAJOS EN ALTURA CONTIENE DE ESTROBOS Ó PASOS DE ESCALAMIENTO, EQUIPO DE PROTECCIÓN CONTRA CAÍDAS (ARNÉS DE SEGURIDAD TIPO LINIERO, LÍNEA Y FAJA DE ANCLAJE) Y ESCALERA TELESCÓPICA (NUEVA) Y BANDERÍN. ', 0, '2021-11-19 19:00:36', '2021-11-19 19:00:36'),
(633, 140, 1, 1, 0, 'TÉCNICO CESAR AUGUSTO DIOSES LEZCANO, EVIDENCIA PINZA AMPERÍMETRICA CON CERTIFICADO DE CALIBRACIÓN VIGENTE. ', 0, '2021-11-19 19:00:43', '2021-11-19 19:00:43'),
(634, 140, 1, 2, 6, 'PERSONAL OPERATIVO MANUEL DÁVILA MENOR, CESAR AUGUSTO DIOSES LEZCANO, EDILBERTO RAMOS ARÉVALO, CARECE DE PANTALLA DE PROTECCIÓN FACIAL (CARETA ANTI-ARCO, ASÍ MISMO CARECEN DE SOGAS DE AMARRE Y SISTEMA DE ESCALAMIENTO PARA USO CON ESCALERA TELESCÓPICA. INCUMPLIMIENTO ART. 25 J, 45 B, 54 C, E, G, O, 102, 104, 109 B, DEL RESESATE 2013 – REGLA 411.B.2, 420 K DEL CNE SUMINISTRO 2011. ART. 60 LEY 29783', 0, '2021-11-19 19:01:14', '2021-11-19 19:01:14'),
(635, 140, 2, 1, 0, 'GRUPO DE TRABAJO, CUENTA CON MEDIOS DE SEÑALIZACIÓN MALLA TIPO FAENA Y PALITROQUES, PARA DELIMITAR ZONA DE TRABAJO. ', 0, '2021-11-19 19:03:49', '2021-11-19 19:03:49'),
(636, 140, 2, 3, 0, 'IMPLEMENTAR MAYOR CANTIDAD DE MEDIOS DE SEÑALIZACIÓN TALES COMO CONOS Y BARRAS RETRACTILES.', 0, '2021-11-19 19:04:01', '2021-11-19 19:04:01');
INSERT INTO `inf_cumplimiento_des` (`nId`, `nIdInforme`, `nIdCumplimiento`, `nValor`, `nValorInc`, `cDescripcion`, `nFlag`, `dCreate`, `dUpdate`) VALUES
(637, 140, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA (CAMIONETA), BHF-731, DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, ALARMA DE RETROCESO, CONOS, TACOS, EXTINTOR DE 6 KG Y HERRAMIENTAS VARIAS.', 0, '2021-11-19 19:04:41', '2021-11-19 19:04:41'),
(638, 140, 3, 2, 54, 'UNIDAD MÓVIL DE PLACA (CAMIONETA), BHF-731, DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, EVIDENCIA BOTIQUÍN DE PRIMEROS AUXILIOS PARCIALMENTE IMPLEMENTADO. INCUMPLIMIENTO AL ART. 41, 53, 121, 131 DEL RESESATE 2013.        ', 0, '2021-11-19 19:05:39', '2021-11-19 19:05:39'),
(639, 140, 4, 1, 0, 'GRUPO DE TRABAJO, CUENTA CON REGISTRO DE CHARLA DE 5 MINUTOS, PREVIO AL DESARROLLO DE LA ACTIVIDAD', 0, '2021-11-19 19:11:20', '2021-11-19 19:11:20'),
(640, 140, 4, 1, 0, 'GRUPO DE TRABAJO CUENTA CON PETS Y PLAN DE CONTINGENCIA, DE LAS ACTIVIDADES QUE EJECUTAN EN CAMPO. ', 0, '2021-11-19 19:11:30', '2021-11-19 19:11:30'),
(641, 140, 4, 2, 72, 'GRUPO DE TRABAJO CARECE DE IPERC, DE LAS ACTIVIDADES QUE EJECUTAN EN CAMPO. INCUMPLIMIENTO DEL ART. ART. 10, 27 A), B), C) Y D), 37, 19, 20, 24, 25 P), 140, 25 S), 30, 45 E), 47, 54 R), 45 E), 111, 130, 57, 35 Y 127 DEL RESESATE 2013).', 0, '2021-11-19 19:11:45', '2021-11-19 19:11:45'),
(642, 140, 4, 1, 0, 'CONDUCTOR DE LA UNIDAD MÓVIL (CAMIONETA BFH-731), EDILBERTO RAMOS ARÉVALO, CUENTA CON LICENCIA DE CONDUCIR VIGENTE Y SEGÚN CATEGORÍA DE VEHÍCULO A CONDUCIR.', 0, '2021-11-19 19:12:00', '2021-11-19 19:12:00'),
(643, 140, 4, 3, 0, 'IMPLEMENTAR DE ESTÁNDAR DE CONDUCCIÓN DE VEHÍCULOS (PETS). ', 0, '2021-11-19 19:12:09', '2021-11-19 19:12:09'),
(644, 140, 5, 1, 0, 'GRUPO DE TRABAJO, CUENTA CON HERRAMIENTAS Y ARNÉS COMPLETO CON ESTROBO, LÍNEA DE VIDA Y FAJA DE ANCLAJE, PARA EL DESARROLLO DE SUS ACTIVIDADES DE CAMPO.', 0, '2021-11-19 19:13:47', '2021-11-19 19:13:47'),
(645, 140, 5, 2, 72, 'GRUPO DE TRABAJO, CARECE DE IPERC, PARA EL DESARROLLO DE SUS ACTIVIDADES.', 0, '2021-11-19 19:14:09', '2021-11-19 19:14:09'),
(646, 140, 6, 1, 0, 'PERSONAL HACE USO DE MASCARILLAS (PROTECTORES BUCONASALES) Y ALCOHOL GEL O SIMILAR, PARA LA DESINFECCIÓN DE LAS PARTES EXPUESTAS, PARA PREVENIR CONTAGIO POR COVID-19.', 0, '2021-11-19 20:03:32', '2021-11-19 20:03:32'),
(647, 140, 7, 1, 0, '1.	PERSONAL OPERATIVO, CUENTA CON EPP, PARA   EJECUCIÓN DE ACTIVIDADES EN CAMPO. \r\n2.	PERSONAL OPERATIVO MANUEL DÁVILA MENOR, CESAR AUGUSTO DIOSES LEZCANO, EDILBERTO RAMOS ARÉVALO, CARECE DE PANTALLA DE PROTECCIÓN FACIAL (CARETA ANTI-ARCO, ASÍ MISMO CARECEN DE SOGAS DE AMARRE Y SISTEMA DE ESCALAMIENTO PARA USO CON ESCALERA TELESCÓPICA. \r\n3.	GRUPO DE TRABAJO CARECE DE IPERC, DE LAS ACTIVIDADES QUE EJECUTAN EN CAMPO.\r\n4.	UNIDAD MÓVIL DE PLACA (CAMIONETA), BHF-731, DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, EVIDENCIA BOTIQUÍN DE PRIMEROS AUXILIOS PARCIALMENTE IMPLEMENTADO.\r\n', 0, '2021-11-19 20:06:40', '2021-11-19 20:06:40'),
(648, 140, 7, 2, 1, '1.	INSPECCIONAR PERIÓDICAMENTE LOS EPP A PERSONAL OPERATIVO SEGÚN ACTIVIDAD Y RIESGOS EXPUESTOS.\r\n2.	PARA TRANSPORTE DE PERSONAL, UNIDAD MÓVIL DEBE DE IMPLEMENTARSE Y CONTAR CON PERMISO POR LA AUTORIDAD DE COMPETENCIA SEGÚN LO ESTIPULA EL REGLAMENTO DE TRÁNSITO DEL MTC. \r\n3.	IMPLEMENTAR Y DIFUNDIR PETS, IPERC Y PLAN DE CONTINGENCIA A PERSONAL OPERATIVO, ASÍ MISMO EVIDENCIAR PARA SU VERIFICACIÓN.\r\n4.	IMPLEMENTAR BOTIQUÍN DE PRIMEROS AUXILIOS\r\n5.  DOTAR DE AGUA PARA HIDRATACIÓN DEL PERSONAL OPERATIVO. \r\n', 0, '2021-11-19 20:06:57', '2021-11-19 20:06:57'),
(649, 140, 8, 1, 0, 'SE COORDINÓ CON EL ING. MARCO ROJAS CANO, SUBSANAR LAS OBSERVACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD ENSA', 0, '2021-11-19 20:07:57', '2021-11-19 20:07:57'),
(650, 140, 9, 1, 0, 'ACTIVIDADES TÉCNICO COMERCIALES DE CLIENTES MAYORES', 0, '2021-11-19 20:28:25', '2021-11-19 20:28:25'),
(651, 140, 9, 4, 0, 'ING. JUAN SALVADOR MORENO DESCALZI', 0, '2021-11-19 20:28:46', '2021-11-19 20:28:46'),
(652, 140, 9, 5, 1, ' ING. MONTENEGRO RAMÍREZ. ', 0, '2021-11-19 20:29:30', '2021-11-19 20:29:30'),
(653, 141, 1, 1, 0, 'PERSONAL OPERATIVO, CONTIENE DE IMPLEMENTOS BÁSICOS DE PROTECCIÓN PERSONAL: ROPA DE TRABAJO, CASCO DIELÉCTRICO CON BARBIQUEJO, CALZADO DE SEGURIDAD DIELÉCTRICO, CHALECO, GUANTES DIELÉCTRICOS BT Y MT, RESPIRADOR, MASCARILLA, LENTES DE SEGURIDAD Y HERRAMIENTAS MANUALES OPERATIVAS.', 0, '2021-11-20 15:12:17', '2021-11-20 15:12:17'),
(654, 141, 1, 1, 0, 'PERSONAL TÉCNICO, CUENTA CON EQUIPO DE PROTECCIÓN CONTRA CAÍDAS (ARNÉS DE SEGURIDAD TIPO LINIERO, LÍNEA Y FAJA DE ANCLAJE) Y ESCALERA TIPO TELESCÓPICA CON SISTEMA DE ESCALAMIENTO', 0, '2021-11-20 15:12:38', '2021-11-20 15:12:38'),
(655, 141, 1, 1, 0, 'PERSONAL TÉCNICO, CUENTA CON HERRAMIENTAS MANUALES EN ESTADO OPERATIVO.', 0, '2021-11-20 15:12:58', '2021-11-20 15:12:58'),
(656, 141, 2, 1, 0, 'GRUPO DE TRABAJO, REALIZA LA SEÑALIZACIÓN Y DELIMITACIÓN DE ÁREAS DE TRABAJO (CONOS DE SEGURIDAD Y BARRAS RETRACTILES).', 0, '2021-11-20 15:16:19', '2021-11-20 15:16:19'),
(657, 141, 3, 1, 0, 'UNIDADES MÓVILES DE PLACAS T9R-821, T5I-871 (CAMIONETAS), DESTINADO AL TRANSPORTE DE PERSONAL Y MATERIALES, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN DE PRIMEROS AUXILIOS, ALARMA DE RETROCESO, CONOS, TACOS Y HERRAMIENTAS VARIAS.', 0, '2021-11-20 15:17:12', '2021-11-20 15:17:12'),
(658, 141, 3, 1, 0, 'UNIDADES MÓVILES DE PLACA AJD-700 (CAMIÓN GRÚA), DESTINADO AL TRANSPORTE DE MATERIAL Y TRABAJOS OPERATIVOS, CUENTA CON DOCUMENTACIÓN DE CIRCULACIÓN, EXTINTOR, BOTIQUÍN DE PRIMEROS AUXILIOS, ALARMA DE RETROCESO, ESLINGAS, CORREAS Y FAJAS, CONOS, TACOS, HERRAMIENTAS VARIAS Y CERTIFICADO DE OPERATIVIDAD DE BRAZO HIDRÁULICO.', 0, '2021-11-20 15:17:20', '2021-11-20 15:17:20'),
(659, 141, 4, 1, 0, 'GRUPO DE TRABAJO EVIDENCIA COPIAS DE PÓLIZAS SCTR (SALUD Y PENSIÓN) Y PÓLIZA DE SEGURO VIDA LEY, VIGENTES', 0, '2021-11-20 15:18:50', '2021-11-20 15:18:50'),
(660, 141, 4, 1, 0, 'GRUPO DE TRABAJO, EVIDENCIA EL REGISTRO DE LA CHARLA DE SEGURIDAD; PREVIO AL DESARROLLO DE LA ACTIVIDAD', 0, '2021-11-20 15:18:59', '2021-11-20 15:18:59'),
(661, 141, 4, 1, 0, 'GRUPO DE TRABAJO CUENTA CON PETS, IPERC Y PLAN DE CONTINGENCIAS EN ZONA DE TRABAJO, ASÍ MISMO EVIDENCIA DIFUSIÓN RESPECTIVA.', 0, '2021-11-20 15:19:07', '2021-11-20 15:19:07'),
(662, 141, 4, 1, 0, 'GRUPO DE TRABAJO EVIDENCIA ORDEN DE TRABAJO, PERMISO DE TRABAJOS EN ALTURA Y AUTORIZACIÓN DE INTERVENCIÓN. ', 0, '2021-11-20 15:19:17', '2021-11-20 15:19:17'),
(663, 141, 4, 1, 0, 'CONDUCTOR MARCO A. ROQUE PINZÓN, OMAR MEDINA RIVADENEIRA, CUENTAN CON LICENCIAS DE CONDUCIR VIGENTES Y ACORDE A CATEGORÍA DE VEHÍCULO A CONDUCIR Y OPERADOR (SAÚL FUSTAMANTE FUSTAMANTE), DE CAMIÓN GRÚA CUENTA CON LICENCIA CONDUCIR VIGENTE Y CERTIFICADO DE OPERADOR VIGENTE.', 0, '2021-11-20 15:19:27', '2021-11-20 15:19:27'),
(664, 141, 5, 1, 0, 'SUPERVISIÓN POR PARTE DEL CONTRATISTA (INGENIEROS DE CAMPO Y SUPERVISOR DE SEGURIDAD), EN ZONA DE TRABAJO, DURANTE DESARROLLO DE LA ACTIVIDAD', 0, '2021-11-20 15:21:06', '2021-11-20 15:21:06'),
(665, 141, 5, 1, 0, 'PERSONAL HACE USO DE EQUIPOS DE PROTECCIÓN CONTRA CAÍDAS Y SISTEMA DE ESCALAMIENTO, SEGÚN ZONA DE TRABAJO PARA REALIZAR TRABAJOS EN ALTURA.', 0, '2021-11-20 15:21:20', '2021-11-20 15:21:20'),
(666, 141, 6, 1, 0, 'GRUPO DE TRABAJO, HACE USO DE ELEMENTOS DE BIOSEGURIDAD; Y, CONTIENE DE BLOQUEADOR SOLAR Y AGUA PARA SU CONSUMO, DURANTE EL DESARROLLO DE LAS ACTIVIDADES OPERATIVAS, EN ZONA DE TRABAJO.', 0, '2021-11-20 15:22:35', '2021-11-20 15:22:35'),
(667, 141, 7, 1, 0, '1. PERSONAL OPERATIVO, CUENTA CON EPP Y EQUIPOS DE MANIOBRA, PARA EJECUCIÓN DE ACTIVIDADES OPERATIVAS.\r\n2. GRUPO DE TRABAJO REALIZA LA SEÑALIZACIÓN Y DELIMITACIÓN DE ÁREAS DE TRABAJO.\r\n3. UNIDADES MÓVILES CON EQUIPAMIENTO BÁSICO.\r\n4. GRUPO DE TRABAJO CONTIENE DE DOCUMENTACIÓN DE SEGURIDAD.\r\n5. CONTRATISTA HA DOTADO DE ALCOHOL Y MASCARILLAS PARA PROTECCIÓN DE CONTAGIO DE ENFERMEDAD COVID19.', 0, '2021-11-20 15:23:53', '2021-11-20 15:23:53'),
(668, 141, 7, 2, 1, '1. INSPECCIONAR PERIÓDICAMENTE EL ESTADO DE LOS EPP A PERSONAL OPERATIVO SEGÚN ACTIVIDAD Y RIESGOS EXPUESTOS.\r\n2. UNIDADES MÓVILES DEBE CONTAR CON PERMISO POR LA AUTORIDAD DE COMPETENCIA SEGÚN LO ESTIPULA EL REGLAMENTO DE TRÁNSITO DEL MTC, PARA EL TRANSPORTE DE PERSONAL \r\n3. REALIZAR INSPECCIONES PERIÓDICAS DE ELEMENTOS DE PROTECCIÓN CONTRA CAÍDAS.\r\n4. EVALUAR RIESGOS, SEGÚN LAS ACTIVIDADES QUE SE EJECUTAN Y POR GRUPOS DE TRABAJO.\r\n5. SUPERVISAR EFICAZ Y CONSTANTEMENTE A LAS ACTIVIDADES QUE SE EJECUTA EN CAMPO.', 0, '2021-11-20 15:24:24', '2021-11-20 15:24:24'),
(669, 141, 8, 1, 0, '1.	SE COORDINÓ CON SUPERVISOR DE SEGURIDAD EL ING. JOSÉ MOLLEDA CUEVA, DE LA CONTRATISTA, IMPLEMENTAR RECOMENDACIONES DADAS EN EL PRESENTE INFORME DANDO CUMPLIMIENTO AL RESESATE 2013 Y NORMAS DE SEGURIDAD. ', 0, '2021-11-20 15:24:46', '2021-11-20 15:24:46'),
(670, 143, 1, 1, 0, 'PERSONAL OPERATIVO TIENE IMPLEMENTOS DE PROTECCIÓN PERSONAL: ROPA DE TRABAJO, CALZADO DE SEGURIDAD, CASCO DIELÉCTRICO CON BARBIQUEJO, LENTES, PROTECCIÓN BUCONASAL, PROTECCIÓN FACIAL, GUANTES DIELÉCTRICOS BT, SOBREGUANTE, IMPLEMENTOS PARA TRABAJOS DE SOLDADURA Y FOTOCHECK DE IDENTIFICACIÓN', 0, '2021-11-20 15:55:32', '2021-11-20 15:55:32'),
(671, 143, 1, 1, 0, 'PERSONAL OPERATIVO CUENTA CON HERRAMIENTAS MANUALES, CAJA PORTAHERRAMIENTAS Y HERRAMIENTAS PARA TRABAJOS OPERATIVOS EN CAMPO: ALICATES, DESTORNILLADORES, MÁQUINA DE SOLDAR, AMOLADORAS, COMBA Y CINCEL.', 0, '2021-11-20 15:55:42', '2021-11-20 15:55:42'),
(672, 143, 1, 1, 0, 'PERSONAL OPERATIVO CUENTA CON HERRAMIENTAS MANUALES, CAJA PORTAHERRAMIENTAS Y HERRAMIENTAS PARA TRABAJOS OPERATIVOS EN CAMPO: ALICATES, DESTORNILLADORES, MÁQUINA DE SOLDAR, AMOLADORAS, COMBA Y CINCEL.', 1, '2021-11-20 15:55:46', '2021-11-20 15:55:46'),
(673, 143, 1, 1, 0, 'PERSONAL OPERATIVO, CUENTA CON MANDIL DE CUERO, CARETA Y MANGAS DE CUERO, EN EL DESARROLLO DE LABORES COMPLEMENTARIAS DE SOLDADURA.', 0, '2021-11-20 15:56:18', '2021-11-20 15:56:18'),
(674, 143, 1, 2, 51, 'PERSONAL OPERATIVO JUAN CARLOS ARICOCHE SAAVEDRA, NO USA MANDIL DE CUERO, MANGAS DE CUERO, ESCARPINES Y GUANTES DE SOLDAR, ASÍ MISMO NO UTILIZA ADECUADAMENTE LA CARETA DE SOLDAR. CONDUCTOR FREDY JUAN CARLOS MENOR MONTENEGRO, NO USA CASCO EN EL DESARROLLO DE SUS ACTIVIDADES DE CAMPO   INCUMPLIMIENTO A LOS PROCEDIMIENTOS DE ELECTRONORTE S.A. – ART. 25 J, 54 A, Y 102 DEL RESESATE 2013. REGLA 411.B DEL CNE- SUMINISTRO 2011. ART. 60 LEY 29783. ', 0, '2021-11-20 15:56:47', '2021-11-20 15:56:47'),
(675, 143, 2, 2, 2, 'PERSONAL OPERATIVO NO UTILIZA ELEMENTOS DE SEÑALIZACIÓN Y DELIMITACIÓN TALES COMO TRANQUERAS Y/O BIOMBOS DE PVC CON MALLAS Y CINTA DE SEÑALIZACIÓN, PARA EJECUTAR SUS ACTIVIDADES.', 0, '2021-11-20 16:04:22', '2021-11-20 16:04:22'),
(676, 143, 3, 1, 0, 'UNIDAD MÓVIL DE PLACA M4L – 477, DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, CUENTA CON DOCUMENTOS DE CIRCULACIÓN, TALES COMO TARJETA DE PROPIEDAD, SOAT, REVISIÓN TÉCNICA, CABLE DE REMOLQUE Y CORRIENTE, TACOS, BOTIQUÍN DE PRIMEROS AUXILIOS Y TACOS.', 0, '2021-11-20 16:04:52', '2021-11-20 16:04:52'),
(677, 143, 3, 2, 59, 'UNIDAD MÓVIL DE PLACA M4L – 477, DESTINADA AL TRANSPORTE DE PERSONAL Y MATERIALES, EVIDENCIA EXTINTOR DE 6 KG DE PQS DESPRESURIZADO Y FALTA DE MANTENIMIENTO. INCUMPLIMIENTO AL ART.41, 53, 121 Y 131 DEL RESESATE 2013.', 0, '2021-11-20 16:05:21', '2021-11-20 16:05:21'),
(678, 143, 4, 1, 0, 'PERSONAL EVIDENCIA POR MEDIO DE CELULAR) PÓLIZAS SCTR (SALUD Y PENSIÓN) Y PÓLIZA DE SEGURO VIDA LEY', 0, '2021-11-20 16:07:37', '2021-11-20 16:07:37'),
(679, 143, 4, 1, 0, 'PERSONAL OPERATIVO EVIDENCIA EL REGISTRO DE LA CHARLA DE SEGURIDAD; PREVIO AL DESARROLLO DE LA ACTIVIDAD, E IDENTIFICA Y REGISTRA PELIGRO POR COVID-19.', 0, '2021-11-20 16:07:45', '2021-11-20 16:07:45'),
(680, 143, 4, 1, 0, 'CUENTAN CON PETS DE LA ACTIVIDAD QUE EJECUTA EN CAMPO', 0, '2021-11-20 16:07:54', '2021-11-20 16:07:54'),
(681, 143, 4, 1, 0, 'PERSONAL EVIDENCIA DE SU ORDEN DE TRABAJO, PARA EL DESARROLLO DE LA ACTIVIDAD', 0, '2021-11-20 16:08:02', '2021-11-20 16:08:02'),
(682, 143, 4, 1, 0, 'PERSONAL OPERATIVO, CUENTA CON IPERC, PLAN DE CONTINGENCIA EN ZONA DE TRABAJO Y HOJA DE SEGURIDAD DE LOS AGENTES QUÍMICOS (PINTURA). ', 0, '2021-11-20 16:08:11', '2021-11-20 16:08:11'),
(683, 143, 5, 1, 0, 'PERSONAL TÉCNICO QUE REALIZA TRABAJOS DE SOLDADURA (SOLDADO DE TAPA DE MEDIDOR), NO CUENTA CON EXTINTOR PARA MITIGAR POSIBLES AMAGOS DE INCENDIO', 0, '2021-11-20 16:09:07', '2021-11-20 16:09:07'),
(684, 143, 5, 2, 7, 'PERSONAL TÉCNICO, NO UTILIZA ADECUADAMENTE EPPS (CARETA DE SOLDAR, EXCARPINES, MANDIL Y CASCO DE ACUERDO A SUS PETS), ASÍ MISMO NO DELIMITA ZONA DE TRABAJO', 0, '2021-11-20 16:09:25', '2021-11-20 16:09:25'),
(685, 143, 5, 2, 7, 'PERSONAL CONDUCTOR, NO UTILIZA EPPS (CASCO, DE ACUERDO A SUS PETS.), ASÍ MISMO NO CUMPLE CON LAS NORMAS SANITARIAS Y DISTANCIAMIENTO SOCIAL.', 0, '2021-11-20 16:09:42', '2021-11-20 16:09:42'),
(686, 143, 6, 1, 0, 'CONTRATISTA HA SUMINISTRADO DE ELEMENTOS DE BIOSEGURIDAD A SU PERSONAL, PARA PREVENIR CONTAGIO POR COVID19.', 0, '2021-11-20 16:10:24', '2021-11-20 16:10:24'),
(687, 143, 6, 2, 7, 'PERSONAL OPERATIVO, NO DELIMITA ZONA DE TRABAJO, ASÍ MISMO NO UTILIZA ADECUADAMENTE LOS EPPS.', 0, '2021-11-20 16:10:43', '2021-11-20 16:10:43'),
(688, 143, 6, 3, 0, 'DOTAR A PERSONAL TÉCNICO AGUA PARA CONSUMO Y BLOQUEADOR SOLAR (SEGÚN CONDICIONES CLIMATOLOGÍAS DE LA ZONA DE TRABAJO).', 0, '2021-11-20 16:10:53', '2021-11-20 16:10:53'),
(689, 143, 7, 1, 0, '1.	PERSONAL OPERATIVO NO SEÑALIZA ÁREA DE TRABAJO, PARA EL DESARROLLO DE SUS ACTIVIDADES OPERATIVAS.\r\n2.	PERSONAL OPERATIVO, NO USA CORRECTAMENTE CARETA DE SOLDAR Y CASCO.\r\n3.   PERSONAL CUENTA CON PÓLIZAS SCTR Y VIDA LEY.\r\n4. UNIDAD MÓVIL, EVIDENCIA EXTINTOR DESPRESURIZADO Y FALTA DE MANTENIMIENTO.\r\n5. PERSONAL NO EVIDENCIA IPERC Y PLAN DE CONTINGENCIAS EN ZONA DE TRABAJO.\r\n6. PERSONAL HACE USO DE ELEMENTOS DE BIOSEGURIDAD, PARA PREVENCIÓN DE CONTAGIO POR COVID-19.', 0, '2021-11-20 16:11:33', '2021-11-20 16:11:33'),
(690, 143, 7, 2, 1, '1. INSPECCIONAR PERIÓDICAMENTE EL ESTADO DE LOS EPP A PERSONAL OPERATIVO SEGÚN ACTIVIDAD Y RIESGOS EXPUESTOS.\r\n2. REALIZAR REINDUCCIÓN AL PERSONAL OPERATIVO DE, PETS, IPERC Y PLAN DE CONTINGENCIAS.\r\n3. UNIDADES MÓVILES, DEBEN ESTAR IMPLEMENTADAS ANTE CONTINGENCIA LABORALES. ASÍ MISMO DAR MANTENIMIENTO A EXTINTOR.\r\n4. TRABAJOS DE SOLDADURA, REQUIERE DEL APOYO DE OTRO PERSONAL EN LA ZONA DE TRABAJO, SEGÚN PROCEDIMIENTOS DE TRABAJO.\r\n5. SUPERVISIÓN CONSTANTE A LAS ACTIVIDADES QUE SE EJECUTAN EN CAMPO, POR PARTE DE LA CONTRATISTA', 0, '2021-11-20 16:11:54', '2021-11-20 16:11:54'),
(691, 143, 8, 1, 0, 'SE COORDINA CON SR. JUAN CARLOS ARICOCHE SAAVEDRA, TÉCNICO RESPONSABLE DE LA CONTRATISTA, COORDINAR CON SU SUPERVISOR Y EMPLEADOR, PARA LEVANTAMIENTO DE LAS OBSERVACIONES E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.', 0, '2021-11-20 16:12:16', '2021-11-20 16:12:16'),
(692, 143, 9, 1, 0, 'CONTRATACIÓN DEL SERVICIO DE ACTIVIDADES COMPLEMENTARIAS AL CONTRASTE Y/O VERIFICACIÓN DE MEDIDORES DE ENERGÍA ELÉCTRICA EN EL ÁREA DE CONCESIÓN DE ELECTRONORTE S.A - UNIDADES DE NEGOCIO CHICLAYO Y UNIDAD DE NEGOCIO SUCURSALES', 0, '2021-11-20 16:19:32', '2021-11-20 16:19:32'),
(693, 143, 9, 2, 1, 'ING. CARLOS ALAN RIVERA CALONGOS.', 0, '2021-11-20 16:23:49', '2021-11-20 16:23:49'),
(694, 143, 9, 3, 0, 'ING. MARCOS JAVIER SANDOVAL VILLEGAS', 0, '2021-11-20 16:24:22', '2021-11-20 16:24:22'),
(695, 143, 9, 3, 0, 'ING. MARCOS JAVIER SANDOVAL VILLEGAS', 1, '2021-11-20 16:24:43', '2021-11-20 16:24:43'),
(696, 143, 9, 5, 1, 'INGENIEROS. CESAR HEREDIA PUSE – DANIEL ABAD', 0, '2021-11-20 16:24:57', '2021-11-20 16:24:57'),
(697, 144, 1, 1, 0, 'SE EVIDENCIA QUE EL PERSONAL TÉCNICO DE LA CONTRATISTA, CUENTA CON FOTOCHECK, CASCO DIELÉCTRICO, ZAPATOS DIELÉCTRICOS, LENTES DE SEGURIDAD, GUANTES DE CUERO Y UNIFORME EN BUEN ESTADO', 0, '2021-11-22 12:39:23', '2021-11-22 12:39:23'),
(698, 144, 1, 2, 51, 'SE EVIDENCIA QUE LOS GUANTES DIELÉCTRICOS CLASE 4, PRESENTA RASGADURA FISICA ENTRE LOS DEDOS, SOBRE GUANTES CON AGUJEROS, ARNÉS DE SEGURIDAD EN MAL ESTADO OPERATIVO(DESCASTADO Y PARTES METALICAS CON PRESENCIA DE ÓXIDO)  ', 0, '2021-11-22 12:42:27', '2021-11-22 12:42:27'),
(699, 144, 2, 1, 0, 'SE EVIDENCIA CONOS Y BARRAS RETRÁCTILES AMARILLO-NEGRAS.', 0, '2021-11-22 13:17:19', '2021-11-22 13:17:19'),
(700, 144, 3, 3, 0, 'PERSONAL SE MOVILIZA EN VEHÍCULO MENOS (MOTO LINEAL)', 0, '2021-11-22 13:20:35', '2021-11-22 13:20:35'),
(701, 144, 4, 1, 0, 'SE EVIDENCIA COPIA DEL PETS, IPERC, PLAN DE CONTINGENCIA, PÓLIZAS SCTR (SALUD Y PENSIÓN), SEGURO VIDA LEY, SEGURO CONTRA ACCIDENTES PERSONALES', 0, '2021-11-22 13:22:40', '2021-11-22 13:22:40'),
(702, 144, 5, 3, 0, 'NO SE EVALUÓ PORQUE NO SE ENCONTRÓ REALIZANDO ACTIVIDAD.', 0, '2021-11-22 13:29:20', '2021-11-22 13:29:20'),
(703, 144, 6, 1, 0, 'PERSONAL CUMPLE CON MEDIDAS SANITARIAS ANTE COVID19 (USO DE MASCARILLA Y ALCOHOL)', 0, '2021-11-22 13:31:42', '2021-11-22 13:31:42'),
(704, 144, 6, 1, 0, 'SE EVIDENCIA HERRAMIENTAS DIELÉCTRICAS EN BUEN ESTADO.', 0, '2021-11-22 13:32:00', '2021-11-22 13:32:00'),
(705, 144, 6, 2, 55, 'NO CUENTA CON EXTINTOR PQS Y BOTIQUÍN DE PRIMEROS AUXILIOS. INCUMPLIMIENTO ART. 54°, 44°', 0, '2021-11-22 16:51:01', '2021-11-22 16:51:01'),
(706, 144, 6, 2, 51, 'No cuenta con traje y careta anti arco. Incumplimiento ART. 35° y 36°.', 0, '2021-11-22 16:53:19', '2021-11-22 16:53:19'),
(707, 144, 7, 1, 0, '1.	Personal cuenta en buen estado los EPPs y uniforme.\r\n2.	Los guantes dieléctricos y sobre guantes en mal estado.\r\n3.	Cuenta con elementos de señalización y delimitación.\r\n4.	Personal evidencia copia de los documentos SSO solicitados por ENSA.\r\n5.	El arnés de seguridad, línea de vida, en mal estado, no cuenta con traje y careta ante arco eléctrico.\r\n6.	Cuenta con herramientas dieléctricas en buen estado.\r\n7.	Hace uso de mascarilla y alcohol para la prevención de la COVID-19.', 0, '2021-11-22 16:54:15', '2021-11-22 16:54:15'),
(708, 144, 7, 2, 1, '1.	Se recomienda realizar el cambio de los guantes dieléctricos clase 4 y sobre guantes.\r\n2.	Implementar con careta anti arco eléctrico al operador.\r\n3.	Implementar extintor PQS, botiquín de primeros auxilios, recipiente para residuos.', 0, '2021-11-22 16:54:33', '2021-11-22 16:54:33'),
(709, 144, 8, 1, 0, '1.	Derivar a quien corresponda y levantar observaciones e implementar las recomendaciones descritas en el presente informe, dando cumplimiento del RESESATE 2013 y Normas de seguridad.', 0, '2021-11-22 16:54:57', '2021-11-22 16:54:57'),
(710, 144, 9, 1, 0, 'SERVICIO DE MANTENIMIENTO DE DISTRIBUCIÓN DE MEDIA TENSIÓN, SUBESTACIONES, BAJA TENSIÓN, ALUMBRADO PÚBLICO Y ACTIVIDADES TÉCNICO-COMERCIALES, PARA LOS SISTEMAS ELÉCTRICOS CHOTA –BAMBAMARCA-SANTACRUZ- CUTERVO, JAEN SECTOR I, SECTOR II, SECTOR III, DE LA UNIDAD DE NEGOCIOS CAJAMARCA CENTRO PERIODO 2021-2022 DE ELECTRONORTE S.A.   REFERENCIA ITEM II', 0, '2021-11-22 16:57:14', '2021-11-22 16:57:14'),
(711, 144, 9, 2, 1, 'JAIME MONDRAGON', 0, '2021-11-22 16:57:32', '2021-11-22 16:57:32'),
(712, 144, 9, 3, 0, 'CESAR GUEVARA SEMPERTEGUI', 0, '2021-11-22 16:58:01', '2021-11-22 16:58:01'),
(713, 145, 1, 1, 0, 'SE EVIDENCIA QUE EL TÉCNICO ELECTRICISTA CUENTA CON UNIFORME EN BUEN ESTADO.', 0, '2021-11-24 07:17:14', '2021-11-24 07:17:14'),
(714, 145, 1, 2, 51, 'SE EVIDENCIA EPPS EN MAL ESTADO DEL PERSONAL TÉCNICO ELECTRICISTA. INCUMPLIMIENTO ART. 54°', 0, '2021-11-24 07:17:35', '2021-11-24 07:17:35'),
(715, 145, 2, 1, 0, 'SE EVIDENCIA ELEMENTOS DE DELIMITACIÓN Y SEÑALIZACIÓN. ', 0, '2021-11-24 07:18:32', '2021-11-24 07:18:32'),
(716, 145, 3, 1, 0, 'SE EVIDENCIA QUE LA CAMIONETA DE PLACA EGP-197, CUENTA CON SOAT Y REVISIÓN TÉCNICA VIGENTE.', 0, '2021-11-24 07:19:25', '2021-11-24 07:19:25'),
(717, 145, 3, 2, 59, 'SE OBSERVA QUE LA CAMIONETA NO CUENTA CON TACOS TIPO CUÑA, NI CONOS DE SEGURIDAD, NI HERRAMIENTAS BÁSICAS (LLAVES, DESARMADORES), NI CAJÓN PORTA HERRAMIENTAS, NI LINTERNA DE MANO.', 0, '2021-11-24 07:19:55', '2021-11-24 07:19:55'),
(718, 145, 4, 3, 0, 'NO SE REVISÓ', 0, '2021-11-24 07:20:31', '2021-11-24 07:20:31'),
(719, 145, 5, 3, 0, 'NO SE REVISÓ', 0, '2021-11-24 07:20:40', '2021-11-24 07:20:40'),
(720, 145, 6, 1, 0, 'PERSONAL HACE USO DE MASCARILLAS (QUIRÚRGICAS), ALCOHOL PARA PREVENIR CONTAGIO POR COVID-19 ', 0, '2021-11-24 07:20:56', '2021-11-24 07:20:56'),
(721, 145, 6, 1, 0, 'CUENTAN CON HERRAMIENTAS DIELÉCTRICAS EN BUEN ESTADO.', 0, '2021-11-24 07:21:07', '2021-11-24 07:21:07'),
(722, 145, 6, 1, 0, 'CUENTAN CON EQUIPOS DE PROTECCIÓN PERSONAL PARA REALIZAR TRABAJOS EN ALTURA EN BUEN ESTADO.', 0, '2021-11-24 07:21:17', '2021-11-24 07:21:17'),
(723, 145, 7, 1, 0, '1.	LOS TÉCNICOS ELECTRICISTAS CUENTAN CON ALGUNOS EPPS EN MAL ESTADO.\r\n2.	CUENTAN CON ELEMENTOS PARA DELIMITAR Y SEÑALIZAR ÁREAS DE TRABAJO.\r\n3.	VEHÍCULO CUENTA CON SOAT Y REVISIÓN TÉCNICA VEHICULAR VIGENTE, PERO LE HACE FALTA ALGUNOS IMPLEMENTOS DE SEGURIDAD.\r\n4.	PERSONAL CUENTA CON MASCARILLA Y ALCOHOL PARA LA PREVENCIÓN DE LA COVID-19.\r\n5.	SE EVIDENCIA HERRAMIENTAS Y EPPS PARA TRABAJOS EN ALTURA EN BUEN ESTADO.', 0, '2021-11-24 07:21:48', '2021-11-24 07:21:48'),
(724, 145, 7, 2, 1, '1.	SE RECOMIENDA REALIZAR LA ENTREGA Y/O REEMPLAZO DE EPPS EN MAL ESTADO.\r\n2.	REALIZAR LA ENTREGA DE COPIA DEL PEST, IPERC, PLAN DE CONTINGENCIAS AL PERSONAL ELECTRICISTA.\r\n3.	REALIZAR LA IMPLEMENTACIÓN DE ELEMENTOS DE SEGURIDAD QUE LE FALTA AL VEHÍCULO.', 0, '2021-11-24 07:22:15', '2021-11-24 07:22:15'),
(725, 145, 8, 1, 0, '1.	DERIVAR A QUIEN CORRESPONDA Y LEVANTAR OBSERVACIONES E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.\r\n2.	SE REALIZÓ LA INSPECCIÓN AL VEHÍCULO.', 0, '2021-11-24 07:22:44', '2021-11-24 07:22:44'),
(726, 145, 9, 1, 0, 'DISTRIBUCIÓN Y COMERCIALIZACIÓN DE ENERGÍA ELÉCTRICA  ', 0, '2021-11-24 07:38:25', '2021-11-24 07:38:25'),
(727, 145, 9, 1, 0, 'DISTRIBUCIÓN Y COMERCIALIZACIÓN DE ENERGÍA ELÉCTRICA  ', 1, '2021-11-24 07:38:49', '2021-11-24 07:38:49'),
(728, 145, 9, 2, 1, 'ING. ALVITER CIEZA TAPIA', 0, '2021-11-24 07:39:08', '2021-11-24 07:39:08'),
(729, 146, 1, 1, 0, 'SE EVIDENCIA QUE EL TÉCNICO ELECTRICISTA CUENTA CON EPPS Y UNIFORME EN BUEN ESTADO.', 0, '2021-12-06 20:21:05', '2021-12-06 20:21:05'),
(730, 146, 1, 1, 0, 'SE EVIDENCIA QUE EL TECNICO ELECTRICISTA CUENTA CON EPPS Y UNIFORME EN BUEN ESTADO', 1, '2021-12-06 20:21:20', '2021-12-06 20:21:20'),
(731, 146, 1, 2, 51, 'SE EVIDENCIA QUE NO CUENTA CON FAJA DE ANCLAJE Y LÍNEA DE VIDA CON ABSORBEDOR DE IMPACTO. INCUMPLIMIENTO ART. 107° DEL RESESATE', 0, '2021-12-06 20:22:51', '2021-12-06 20:22:51'),
(732, 146, 1, 1, 0, 'SE EVIDENCIA QUE EL TÉCNICO ELECTRICISTA CUENTA CON EPPS Y UNIFORME EN BUEN ESTADO.', 0, '2021-12-06 20:24:55', '2021-12-06 20:24:55'),
(733, 146, 2, 2, 2, 'NO SE EVIDENCIA ELEMENTOS DE DELIMITACIÓN Y NI SEÑALIZACIÓN. ', 0, '2021-12-06 20:25:33', '2021-12-06 20:25:33'),
(734, 146, 3, 3, 0, 'NO APLICA', 0, '2021-12-06 20:25:50', '2021-12-06 20:25:50'),
(735, 146, 4, 2, 72, 'NO SE EVIDENCIA COPIA DE PETS, IPERC Y PLAN DE CONTINGENCIA.', 0, '2021-12-06 20:27:32', '2021-12-06 20:27:32'),
(736, 146, 5, 3, 0, 'NO SE EVALUÓ', 0, '2021-12-06 20:28:03', '2021-12-06 20:28:03'),
(737, 146, 6, 1, 0, 'PERSONAL HACE USO DE MASCARILLAS (QUIRÚRGICAS), ALCOHOL PARA PREVENIR CONTAGIO POR COVID-19 ', 0, '2021-12-06 20:29:36', '2021-12-06 20:29:36'),
(738, 146, 6, 1, 0, 'CUENTAN CON HERRAMIENTAS DIELÉCTRICAS EN BUEN ESTADO.', 0, '2021-12-06 20:29:52', '2021-12-06 20:29:52'),
(739, 146, 6, 1, 0, 'CUENTA CON CAMISA RESISTENTE AL ARCO ELÉCTRICO.', 0, '2021-12-06 20:30:00', '2021-12-06 20:30:00'),
(740, 146, 6, 2, 51, 'NO CUENTA CON CARETA CONTRA ARCO ELÉCTRICO.', 0, '2021-12-06 20:30:15', '2021-12-06 20:30:15'),
(741, 146, 6, 3, 0, 'NO CUENTA CON PINZA PERIMÉTRICA PARA MEDICIÓN DE PARÁMETROS EN BT Y MT', 0, '2021-12-06 20:30:34', '2021-12-06 20:30:34'),
(742, 146, 7, 1, 0, '1.	EL TÉCNICO ELECTRICISTA CUENTA CON EPPS Y UNIFORME EN BUEN ESTADO.\r\n2.	NO CUENTA CON FAJA DE ANCLAJE Y LÍNEA DE VIDA CON ABSORBEDOR DE IMPACTO.\r\n3.	NO CUENTA CON ELEMENTOS PARA DELIMITAR Y SEÑALIZAR ÁREAS DE TRABAJO.\r\n4.	NO CUENTA CON COPIA DEL PETS, IPERC Y PLAN DE CONTINGENCIA.\r\n5.	PERSONAL CUENTA CON MASCARILLA Y ALCOHOL PARA LA PREVENCIÓN DE LA COVID-19.\r\n6.	SE EVIDENCIA HERRAMIENTAS DIELÉCTRICAS Y CAMISA RESISTENTE AL ARCO ELÉCTRICO EN BUEN ESTADO.\r\n7.	NO CUENTA CON CARETA CONTRA ARCO ELÉCTRICO.', 0, '2021-12-06 20:34:10', '2021-12-06 20:34:10'),
(743, 146, 7, 2, 1, '1.	SE RECOMIENDA REALIZAR LA ENTREGA DE LA LÍNEA DE VIDA Y FAJA DE ANCLAJE Y CARETA CONTRA ARCO ELÉCTRICO\r\n2.	REALIZAR LA ENTREGA DE COPIA DEL PEST, IPERC, PLAN DE CONTINGENCIAS AL PERSONAL ELECTRICISTA.\r\n3.	IMPLEMENTAR ELEMENTOS DE SEÑALIZACIÓN Y DELIMITACIÓN EN LA C.T. CHOTA.\r\n4.	SE RECOMIENDA IMPLEMENTAR CON PINZA AMPERIMÉTRICA DE BT Y MT PARA EL OPERADOR', 0, '2021-12-06 20:34:23', '2021-12-06 20:34:23'),
(744, 146, 8, 1, 0, '1.	DERIVAR A QUIEN CORRESPONDA Y LEVANTAR OBSERVACIONES E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.\r\n2.	SE REALIZÓ CHARLA SOBRE AMAGO DE INCENDIOS Y USO DE EXTINTOR.\r\n3.	SE REALIZÓ DEL GUANTE DIELÉCTRICO Y ARNÉS DE SEGURIDAD', 0, '2021-12-06 20:34:47', '2021-12-06 20:34:47'),
(745, 146, 8, 1, 0, '1.	DERIVAR A QUIEN CORRESPONDA Y LEVANTAR OBSERVACIONES E IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD\r\n2.	SE REALIZO CHARLA SOBRE AMAGO DE INCENDIOS Y USO DE EXTINTOR\r\n3.	SE REALIZO DEL GUANTE DIELÉCTRICO Y ARNÉS DE SEGURIDAD', 1, '2021-12-06 20:35:56', '2021-12-06 20:35:56'),
(746, 146, 9, 1, 0, 'DISTRIBUCIÓN Y COMERCIALIZACIÓN DE ENERGÍA ELÉCTRICA  ', 0, '2021-12-06 20:49:59', '2021-12-06 20:49:59'),
(747, 146, 9, 2, 1, 'ING. EDIS PERALTA', 0, '2021-12-06 20:50:10', '2021-12-06 20:50:10'),
(748, 149, 1, 1, 0, 'Personal operativo tiene implementos de protección personal: casco dieléctrico, barbiquejo mascarilla, calzado de seguridad dieléctrico, uniforme de trabajo, chaleco.', 0, '2021-12-09 20:13:21', '2021-12-09 20:13:21'),
(749, 149, 1, 1, 0, 'Personal evidencia de herramientas y equipos de poder en buen estado', 0, '2021-12-09 20:13:37', '2021-12-09 20:13:37'),
(750, 149, 1, 3, 0, 'Personal no realizara labores en altura dentro de las instalaciones de S.ET Pampa Pañala', 0, '2021-12-09 20:14:11', '2021-12-09 20:14:11'),
(751, 149, 2, 3, 0, 'Informe Técnico N°206-CN-SST-2021 - COELVISAC', 0, '2021-12-09 20:16:53', '2021-12-09 20:16:53'),
(752, 149, 3, 1, 0, 'UNIDAD MOVIL DE PLACA F3P-813 (CAMIONETA), DEDICADA AL TRANSPORTE DE PERSONAL Y MATERIALES, EVIDENCIA DE DOCUMENTACION DE CIRCULACION, TACOS, EXTINTOR, BOTIQUIN, CABLE DE REMOLQUE Y HERRAMIENTAS VARIAS', 0, '2021-12-09 20:20:59', '2021-12-09 20:20:59'),
(753, 149, 4, 1, 0, 'Contratista evidencia de copias de pólizas SCTR y vida Ley vigentes', 0, '2021-12-09 20:21:28', '2021-12-09 20:21:28'),
(754, 149, 4, 1, 0, 'Personal evidencia de certificados de aptitud Médica pre-ocupacional, según puesto de trabajo ', 0, '2021-12-09 20:21:43', '2021-12-09 20:21:43'),
(755, 149, 5, 3, 0, 'Personal de contratista, debe hacer uso de los implementos de protección, Durante el desarrollo de las actividades en campo e identificar y evaluar los riesgos propios de la actividad para determinar los controles adecuados, para prevenir incidentes laborales y la prevención para evitar contagio por Covid-19', 0, '2021-12-09 20:23:12', '2021-12-09 20:23:12'),
(756, 149, 5, 3, 0, 'Difundir Procedimiento de trabajo seguro, plan de contingencias e IPERC, a todo el Personal.', 0, '2021-12-09 20:23:27', '2021-12-09 20:23:27'),
(757, 149, 6, 1, 0, 'Contratista ha suministrado de  mascarillas, alcohol al personal, para prevenir contagio por Covid-19.', 0, '2021-12-09 20:24:09', '2021-12-09 20:24:09'),
(758, 149, 6, 3, 0, 'Contratista debe dotar  de agua bebible para hidratarse ', 0, '2021-12-09 20:24:29', '2021-12-09 20:24:29'),
(759, 149, 7, 1, 0, '1.	Personal operativo, implementado con Epps básicos.\r\n2.	evidencian de equipos y herramientas en buen estado.\r\n3.	Personal se encuentra coberturado en póliza SCTR y seguro vida ley.\r\n4.	Personal evidencia de examen médico ocupacional.\r\n5.	Contratista ha dotado a su personal de mascarilla quirúrgica, alcohol para prevención ante Covid-19.\r\n6.	Supervisor de seguridad del contratista en momento de inspección\r\n', 0, '2021-12-09 20:25:42', '2021-12-09 20:25:42'),
(760, 149, 7, 2, 1, '1.	Dotar de EPP a personal operativo según la\r\nactividad a ejecutar y nivel de riesgo expuesto.\r\n\r\n2.	Difundir procedimientos de trabajo, plan de contingencias, IPERC.\r\n3.	Concientizar al personal, sobre distanciamiento\r\n      social, a fin de prevenir contagio por Covid-19.\r\n4.- Unidades Móviles deben estar implementadas, dotar de alcohol a todo el personal.\r\n6.- Supervisar constantemente las actividades que se ejecuta en campo, por parte de ingenieros de\r\nContratista.\r\n', 0, '2021-12-09 20:26:01', '2021-12-09 20:26:01'),
(761, 149, 8, 1, 0, '1.	Se realiza inspección y regulariza charla de inducción y difusión del RISSTMA ENSA, para el cumplimiento de normativas de seguridad y prevención ante Covid-19, al personal de la contratista. (Se dio charla de inducción virtual)\r\n2.	Se coordinó con el Supervisor de seguridad, por parte del contratista, levantar observaciones descritas e implementar las recomendaciones dadas en el presente informe, para el desarrollo de actividades operativas.\r\n', 0, '2021-12-09 20:26:43', '2021-12-09 20:26:43'),
(762, 149, 9, 1, 0, 'Ampliación de celdas tipo metal clad en 22.9kv – subestación de transformación pampa Pañala Olmos - Lambayeque', 0, '2021-12-09 20:41:48', '2021-12-09 20:41:48'),
(763, 149, 9, 2, 1, 'Ing. Alfonso Avendaño López', 0, '2021-12-09 20:42:15', '2021-12-09 20:42:15'),
(764, 149, 9, 3, 0, 'Ing. Bustamante Santos Abel', 0, '2021-12-09 20:42:31', '2021-12-09 20:42:31'),
(765, 149, 9, 4, 0, 'Ing. Florentino Ruiz Garcia ', 0, '2021-12-09 20:43:04', '2021-12-09 20:43:04'),
(766, 150, 12, 1, 0, 'ZZZZZZZZZZZZZZZ', 1, '2021-12-14 19:17:23', '2021-12-14 19:17:23'),
(767, 150, 18, 1, 0, 'DSFASDFASDF', 1, '2021-12-14 19:18:21', '2021-12-14 19:18:21'),
(768, 150, 18, 1, 0, 'DDDD', 0, '2021-12-14 19:30:53', '2021-12-14 19:30:53'),
(769, 150, 19, 1, 0, 'FGHFGHFG', 0, '2021-12-14 19:31:38', '2021-12-14 19:31:38'),
(770, 158, 1, 1, 0, 'SDFSDF', 0, '2021-12-14 19:58:09', '2021-12-14 19:58:09'),
(771, 158, 3, 1, 0, 'VCNVBN', 0, '2021-12-14 19:58:20', '2021-12-14 19:58:20'),
(772, 140, 7, 1, 0, '5. GRUPO DE TRABAJO, CUENTA CON EQUIPOS DE BIOSEGURIDAD', 0, '2021-12-15 01:01:21', '2021-12-15 01:01:21'),
(773, 159, 1, 1, 0, 'EL GRUPO DE TRABAJO, CUENTA CON EPPS BÁSICOS: CASCO DIELÉCTRICO CON BARBIQUEJO, ROPA DE TRABAJO (ANTIFLAMA), GUANTES DE CUERO, CALZADO DIELÉCTRICO, GUANTES DE MT, CHALECO DE ALTA VISIBILIDAD Y FOTOCHECK DE IDENTIFICACIÓN.', 0, '2021-12-15 11:59:19', '2021-12-15 11:59:19'),
(774, 159, 1, 1, 0, 'SE EVIDENCIA QUE EL GRUPO DE TRABAJO, CUENTA CON PINZA AMPERIMETRICA Y CERTIFICADO DE CALIBRACIÓN VIGENTE, ASÍ MISMO CUENTA CON RESPIRADOR CON FILTRO', 0, '2021-12-15 11:59:32', '2021-12-15 11:59:32'),
(775, 159, 1, 1, 0, 'SE EVIDENCIA QUE EL GRUPO DE TRABAJO CUENTA CON EQUIPOS DE MANIOBRA (REVELADOR DE TENSIÓN, PÉRTIGA Y GUANTES DE MEDIA TENSIÓN) Y MEGOMETRO CON CERTIFICADO DE CALIBRACIÓN VIGENTE', 0, '2021-12-15 11:59:44', '2021-12-15 11:59:44'),
(776, 159, 1, 1, 0, 'EL PERSONAL TÉCNICO, CUENTA CON HERRAMIENTAS MANUALES (LLAVES MIXTAS, MARTILLO, ARCO DE SIERRA).', 0, '2021-12-15 12:00:00', '2021-12-15 12:00:00'),
(777, 159, 2, 3, 0, 'NO SE VERIFICÓ DURANTE LA INSPECCIÓN. ', 0, '2021-12-15 12:02:23', '2021-12-15 12:02:23'),
(778, 159, 3, 3, 0, 'NO SE VERIFICÓ DURANTE LA INSPECCIÓN. ', 0, '2021-12-15 12:03:06', '2021-12-15 12:03:06'),
(779, 159, 4, 1, 0, 'SE EVIDENCIA QUE EL GRUPO DE TRABAJO, CUENTA CON FORMATO DE CHARLA DE 5 MINUTOS, PREVIO AL DESARROLLO DE LA ACTIVIDAD', 0, '2021-12-15 12:03:21', '2021-12-15 12:03:21'),
(780, 159, 4, 1, 0, 'SE EVIDENCIA QUE EL GRUPO DE TRABAJO CUENTA CON PETS, IPERC Y PLAN DE CONTINGENCIA, DE LAS ACTIVIDADES QUE EJECUTAN EN CAMPO. ', 0, '2021-12-15 12:03:29', '2021-12-15 12:03:29'),
(781, 159, 5, 3, 0, 'NO SE EVALUÓ PROCEDIMIENTO ESCRITO DE TRABAJO SEGURO.', 0, '2021-12-15 12:04:11', '2021-12-15 12:04:11'),
(782, 159, 6, 1, 0, 'SE EVIDENCIA QUE EL GRUPO DE TRABAJO, DISPONE DE AGUA PARA SU CONSUMO, DURANTE EL DESARROLLO DE ACTIVIDADES EN CAMPO.', 0, '2021-12-15 12:04:43', '2021-12-15 12:04:43'),
(783, 159, 6, 1, 0, 'EL PERSONAL HACE USO DE MASCARILLAS (PROTECTORES BUCONASALES) Y ALCOHOL GEL O SIMILAR, PARA LA DESINFECCIÓN DE LAS PARTES EXPUESTAS, PARA PREVENIR CONTAGIO POR COVID-19', 0, '2021-12-15 12:04:53', '2021-12-15 12:04:53'),
(784, 159, 7, 1, 0, '1.	EL PERSONAL OPERATIVO, CUENTA CON EPP, PARA   EJECUCIÓN DE ACTIVIDADES EN CAMPO. \r\n2.	  EL PERSONAL CUENTA CON PINZA AMPERIMETRICA Y MEGOMETRO CON CERTIFICADO DE CALIBRACIÓN VIGENTE.\r\n3.	  EL GRUPO DE TRABAJO CUENTA CON PETS, IPERC Y PLAN DE CONTINGENCIA, PARA EL DESARROLLO DE SUS ACTIVIDADES.\r\n4.	 EL GRUPO DE TRABAJO CUENTA CON EQUIPOS DE BIOSEGURIDAD.', 0, '2021-12-15 12:05:44', '2021-12-15 12:05:44'),
(785, 159, 7, 2, 1, '1.	INSPECCIONAR PERIÓDICAMENTE LOS EPP A PERSONAL OPERATIVO SEGÚN ACTIVIDAD Y RIESGOS EXPUESTOS.\r\n2.	DIFUNDIR PETS, IPERC Y PLAN DE CONTINGENCIA A PERSONAL OPERATIVO, ASÍ MISMO EVIDENCIAR PARA SU VERIFICACIÓN.\r\n3.	SUPERVISAR EFICAZ Y CONSTANTEMENTE DE LAS ACTIVIDADES QUE SE EJECUTA EN CAMPO.\r\n', 0, '2021-12-15 12:06:16', '2021-12-15 12:06:16'),
(786, 159, 8, 1, 0, '1.	SE COORDINA CON TÉCNICO CESAR WILMER LARA MONTALVÁN, IMPLEMENTAR LAS RECOMENDACIONES DESCRITAS EN EL PRESENTE INFORME, DANDO CUMPLIMIENTO DEL RESESATE 2013 Y NORMAS DE SEGURIDAD.   ', 0, '2021-12-15 12:06:36', '2021-12-15 12:06:36'),
(787, 159, 9, 1, 0, 'MANTENIMIENTO DE TRANSFORMADORES – TALLER.', 0, '2021-12-15 12:11:54', '2021-12-15 12:11:54'),
(788, 159, 9, 2, 1, 'ING. FREDY ORTEGA VENEGAS', 0, '2021-12-15 12:12:08', '2021-12-15 12:12:08'),
(789, 159, 9, 3, 0, 'ING. JUAN MORENO DESCALZI', 0, '2021-12-15 12:12:23', '2021-12-15 12:12:23'),
(790, 160, 1, 1, 0, 'SE EVIDENCIA QUE EL PERSONAL OPERATIVO (1 MAESTRO DE OBRA, 01 TÉCNICO, 03 CONDUCTORES, 3 SUPERVISORES) CUENTA CON IMPLEMENTOS DE PROTECCIÓN PERSONAL: ROPA DE TRABAJO (PANTALÓN, CAMISA Y POLO), CALZADO DIELÉCTRICO, CASCO DIELÉCTRICO CON BARBIQUEJO, GUANTES DE ACARREO DE CUERO, PROTECTORES BUCONASALES, LENTES DE SEGURIDAD.', 0, '2022-01-24 11:48:10', '2022-01-24 11:48:10'),
(791, 160, 1, 3, 0, 'NO SE EVIDENCIA DE ARNÉS DE CUERPO ENTERO (ARNÉS, LÍNEA DE VIDA, FAJA DE ANCLAJE), SISTEMA DE ESCALAMIENTO PARA USO DE ESCALERAS PORTÁTILES, CUERDAS DE AMARRE Y  ESCALERAS EXTENSIBLES; QUE UTILIZARAN EN OBRA).', 0, '2022-01-24 11:48:21', '2022-01-24 11:48:21'),
(792, 160, 1, 3, 0, 'NO SE EVIDENCIA DE HERRAMIENTAS PARA INICIO DE LABORES (HERRAMIENTAS PARA LABORE ELÉCTRICAS, TIRCOS, RANAS; PALAS, BARRETAS Y BUGÍS)', 0, '2022-01-24 11:48:30', '2022-01-24 11:48:30'),
(793, 160, 1, 3, 0, 'SE EVIDENCIA QUE LA EMPRESA CONTRATISTA CUENTA CON MÁQUINAS DE CORTE DE PAVIMENTO.', 0, '2022-01-24 11:48:46', '2022-01-24 11:48:46'),
(794, 160, 1, 3, 0, 'NO SE INSPECCIONO AL PERSONAL OPERADOR DE GRÚA  Y RIGGER QUE REALIZARAN ACTIVIDADES DE IZAJE; TAMPOCO AL PERSONAL AYUDANTE QUE PARTICIPARA EN OBRA.', 0, '2022-01-24 11:48:56', '2022-01-24 11:48:56'),
(795, 160, 2, 1, 0, 'SE EVIDENCIA QUE LA EMPRESA CONTRATISTA EVIDENCIA DE MALLAS, CONOS, PALITROQUES, PARA DELIMITAR Y SEÑALIZAR ZONAS DE TRABAJO.', 0, '2022-01-24 11:54:16', '2022-01-24 11:54:16'),
(796, 160, 2, 3, 0, 'SE EVIDENCIA QUE LA EMPRESA CONTRATISTA DEBERÁ DE IMPLEMENTAR DE CINTAS, LETREROS PARA DELIMITAR Y SEÑALIZAR ZONAS DE TRABAJO.', 0, '2022-01-24 11:54:26', '2022-01-24 11:54:26'),
(797, 160, 3, 1, 0, 'LAS UNIDADES MÓVILES DE PLACAS T5W-890 (CAMIONETA); CUENTAN CON DOCUMENTACIÓN DE SEGURIDAD, EXTINTOR, BOTIQUÍN Y HERRAMIENTAS VARIAS, ADEMÁS DE LUCES EN BUEN ESTADO, ALARMA DE RETROCESO.', 0, '2022-01-24 11:56:12', '2022-01-24 11:56:12'),
(798, 160, 3, 3, 0, 'NO SE INSPECCIONO UNIDAD MÓVIL CAMIÓN GRÚA (RESIDENTE MANIFIESTA SE REALIZARA EN MOMENTO DE IZAJE)', 0, '2022-01-24 11:56:25', '2022-01-24 11:56:25'),
(799, 160, 3, 3, 0, 'LA EMPRESA CONTRATISTA DEBE DE IMPLEMENTAR DE UNIDADES MÓVILES DE ACUERDO AL NÚMERO DE PERSONAL QUE PARTICIPARA EN OBRA.', 0, '2022-01-24 11:56:39', '2022-01-24 11:56:39'),
(800, 160, 4, 1, 0, 'EL PERSONAL EVIDENCIA PÓLIZAS SCTR (SALUD Y PENSIÓN), PÓLIZA DE SEGURO VIDA LEY Y ACCIDENTES PERSONALES, VIGENTES', 0, '2022-01-24 12:01:00', '2022-01-24 12:01:00'),
(801, 160, 4, 1, 0, 'EL PERSONAL, CUENTA CON CERTIFICADOS DE APTITUD MÉDICA PRE-OCUPACIONAL, SEGÚN PUESTO DE TRABAJO.', 0, '2022-01-24 12:01:10', '2022-01-24 12:01:10'),
(802, 160, 5, 3, 0, 'EL PERSONAL DE CONTRATISTA, DEBE HACER USO DE LOS IMPLEMENTOS DE PROTECCIÓN, DURANTE EL DESARROLLO DE LAS ACTIVIDADES EN CAMPO E IDENTIFICAR Y EVALUAR LOS RIESGOS PROPIOS DE LA ACTIVIDAD PARA DETERMINAR LOS CONTROLES ADECUADOS, PARA PREVENIR INCIDENTES LABORALES Y LA PREVENCIÓN PARA EVITAR CONTAGIO POR COVID-19', 0, '2022-01-24 12:07:07', '2022-01-24 12:07:07'),
(803, 160, 5, 1, 0, 'SE EVIDENCIA LA PRESENCIA DE INGENIERO SUPERVISORES (SEGURIDAD Y RESIDENTE) POR PARTE DE CONTRATISTA DURANTE EL MOMENTO DE INSPECCIÓN Y CHARLA DE INDUCCIÓN', 0, '2022-01-24 12:07:26', '2022-01-24 12:07:26'),
(804, 160, 5, 3, 0, 'LA EMPRESA CONTRATISTA DEBE DIFUNDIR PETS, IPERC, PLAN DE CONTINGENCIAS  A TODO EL PERSONAL OPERATIVO', 0, '2022-01-24 12:07:39', '2022-01-24 12:07:39'),
(805, 160, 6, 1, 0, 'PERSONAL HACE USO DE MASCARILLAS (PROTECTORES BUCONASALES) Y ALCOHOL , PARA PREVENIR CONTAGIO POR COVID-19 ', 0, '2022-01-24 12:08:49', '2022-01-24 12:08:49'),
(806, 160, 6, 3, 0, 'CONTRATISTA DEBE DE DOTAR AGUA PARA HIDRATARSE Y BLOQUEADOR SOLAR DE ACUERDO A CONDICIONES CLIMÁTICAS.', 0, '2022-01-24 12:08:59', '2022-01-24 12:08:59'),
(807, 160, 7, 1, 0, '1.	PERSONAL OPERATIVO, IMPLEMENTADO CON EPPS.', 0, '2022-01-24 12:10:33', '2022-01-24 12:10:33'),
(808, 160, 7, 1, 0, '2.	UNIDAD MÓVIL IMPLEMENTADA.', 0, '2022-01-24 12:10:41', '2022-01-24 12:10:41'),
(809, 160, 7, 1, 0, '3.	PERSONAL SE ENCUENTRA COBERTURADO EN PÓLIZA SCTR Y DE SEGURO VIDA LEY.', 0, '2022-01-24 12:10:51', '2022-01-24 12:10:51'),
(810, 160, 7, 1, 0, '4.	PERSONAL EVIDENCIA DE CERTIFICADOS MÉDICOS OCUPACIONALES', 0, '2022-01-24 12:10:59', '2022-01-24 12:10:59'),
(811, 160, 7, 1, 0, '5.	CONTRATISTA HA DOTADO A SU PERSONAL DE MASCARILLAS PARA PREVENCIÓN ANTE COVID-19.', 0, '2022-01-24 12:11:08', '2022-01-24 12:11:08'),
(812, 160, 7, 1, 0, '6.	PRESENCIA DE SUPERVISOR DE SEGURIDAD Y RESIDENTE DE OBRA POR PARTE DE CONTRATISTA', 0, '2022-01-24 12:11:16', '2022-01-24 12:11:16'),
(813, 160, 7, 1, 0, '7.	NO SE INSPECCIONO UNIDAD MÓVIL CAMIÓN GRÚA, TAMPOCO PERSONAL OPERADOR DE GRÚA, EQUIPOS Y HERRAMIENTAS, ESCALERAS, ARNÉS DE CUERPO ENTERO', 0, '2022-01-24 12:11:26', '2022-01-24 12:11:26'),
(814, 160, 7, 2, 1, '1.	DOTAR DE EPP A PERSONAL OPERATIVO SEGÚN LA ACTIVIDAD A EJECUTAR Y NIVEL DE RIESGO EXPUESTO.\r\n', 0, '2022-01-24 12:11:43', '2022-01-24 12:11:43'),
(815, 160, 7, 2, 1, '2.	CAPACITAR A PERSONAL EN DESARROLLO DE IPERC Y/O AST, EL CUAL PERMITA AL TRABAJADOR, IDENTIFICAR EL RIESGO AL CUAL ESTÁ EXPUESTO\r\n', 0, '2022-01-24 12:12:01', '2022-01-24 12:12:01'),
(816, 160, 7, 2, 1, '3.	DOTAR DE AGUA, BLOQUEADOR SOLAR AL PERSONAL', 0, '2022-01-24 12:12:12', '2022-01-24 12:12:12'),
(817, 160, 7, 2, 1, '4.	SUPERVISAR CONSTANTEMENTE LAS ACTIVIDADES QUE SE EJECUTA EN CAMPO, POR PARTE DE INGENIEROS DE CONTRATISTA', 0, '2022-01-24 12:12:24', '2022-01-24 12:12:24'),
(818, 160, 7, 2, 1, '5.	TODO TRABAJADOR QUE REALICE LABORES EN ENSA DEBE DE CONTAR CON CHARLA DE INDUCCIÓN, E INSPECCIÓN DE EPPS', 0, '2022-01-24 12:12:39', '2022-01-24 12:12:39'),
(819, 160, 7, 2, 1, '6.	CONTRATISTA DEBERÁ DE COMUNICAR A ENSA, ANTES DE INICIAR ACTIVIDADES DE OBRA, INSPECCIÓN DE UNIDAD MÓVIL CAMIÓN GRÚA, EQUIPOS ANTICAIDAS, ESCALERAS, PERSONAL AYUDANTE Y OPERADOR DE GRÚA', 0, '2022-01-24 12:12:53', '2022-01-24 12:12:53'),
(820, 160, 8, 1, 0, '1.	SE DIFUNDIÓ CHARLA DE INDUCCIÓN Y DIFUSIÓN DEL RISSTMA ENSA, PARA EL CUMPLIMIENTO DE NORMATIVAS DE SEGURIDAD Y PREVENCIÓN ANTE COVID-19, AL PERSONAL DE LA CONTRATISTA (PARA REPLANTEO DE OBRA).', 0, '2022-01-24 12:13:22', '2022-01-24 12:13:22'),
(821, 160, 8, 1, 0, '2.	SE DIFUNDE PLAN DE CONTINGENCIAS Y DE SEGURIDAD AL PERSONAL DE CONTRATISTA.', 0, '2022-01-24 12:13:31', '2022-01-24 12:13:31'),
(822, 160, 8, 1, 0, '3.	SE COORDINÓ CON INGENIEROS DE CONTRATISTA (RESIDENTE DE OBRA Y SEGURIDAD) DE LA CONTRATISTA, SOLO PUEDEN REALIZAR ACTIVIDADES DE REPLANTEO DE OBRA, ADEMÁS DE IMPLEMENTAR RECOMENDACIONES DADAS EN EL PRESENTE INFORME DANDO CUMPLIMIENTO AL RESESATE 2013 Y NORMAS DE SEGURIDAD, PARA DAR INICIO A SUS LABORES.', 0, '2022-01-24 12:13:42', '2022-01-24 12:13:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inf_cumplimiento_img`
--

CREATE TABLE `inf_cumplimiento_img` (
  `nId` int(11) NOT NULL,
  `nIdInforme` int(11) DEFAULT NULL,
  `nIdCumplimiento` int(11) DEFAULT NULL,
  `cRuta` varchar(1200) DEFAULT NULL,
  `cExt` varchar(12) DEFAULT NULL,
  `cNombre` varchar(120) DEFAULT NULL,
  `cDescripcion` varchar(500) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inf_cumplimiento_img`
--

INSERT INTO `inf_cumplimiento_img` (`nId`, `nIdInforme`, `nIdCumplimiento`, `cRuta`, `cExt`, `cNombre`, `cDescripcion`, `nFlag`, `dRegistro`) VALUES
(45, 65, 1, 'uploads/65/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-09-16 02:25:31'),
(46, 65, 3, 'uploads/65/3/1.jpg', NULL, '1.jpg', NULL, 0, '2021-09-16 02:29:19'),
(47, 65, 3, 'uploads/65/3/2.jpg', NULL, '2.jpg', NULL, 0, '2021-09-16 02:29:19'),
(48, 65, 3, 'uploads/65/3/3.jpg', NULL, '3.jpg', NULL, 0, '2021-09-16 02:29:19'),
(49, 65, 3, 'uploads/65/3/4.jpg', NULL, '4.jpg', NULL, 0, '2021-09-16 02:29:19'),
(50, 65, 3, 'uploads/65/3/5.jpg', NULL, '5.jpg', NULL, 0, '2021-09-16 02:29:19'),
(51, 65, 3, 'uploads/65/3/6.jpg', NULL, '6.jpg', NULL, 0, '2021-09-16 02:29:19'),
(52, 65, 3, 'uploads/65/3/7.jpg', NULL, '7.jpg', NULL, 0, '2021-09-16 02:29:19'),
(53, 65, 3, 'uploads/65/3/8.jpg', NULL, '8.jpg', NULL, 0, '2021-09-16 02:29:19'),
(54, 65, 3, 'uploads/65/3/9.jpg', NULL, '9.jpg', NULL, 0, '2021-09-16 02:29:19'),
(55, 65, 4, 'uploads/65/4/1.png', NULL, '1.png', NULL, 0, '2021-09-16 02:31:13'),
(56, 65, 4, 'uploads/65/4/2.jpg', NULL, '2.jpg', NULL, 0, '2021-09-16 02:31:13'),
(57, 65, 4, 'uploads/65/4/3.jpg', NULL, '3.jpg', NULL, 0, '2021-09-16 02:31:13'),
(58, 65, 5, 'uploads/65/5/1.jpg', NULL, '1.jpg', NULL, 0, '2021-09-16 02:33:34'),
(59, 65, 5, 'uploads/65/5/2.jpg', NULL, '2.jpg', NULL, 0, '2021-09-16 02:33:34'),
(60, 65, 5, 'uploads/65/5/3.jpg', NULL, '3.jpg', NULL, 0, '2021-09-16 02:33:34'),
(61, 65, 6, 'uploads/65/6/1.jpg', NULL, '1.jpg', NULL, 0, '2021-09-16 02:34:29'),
(62, 65, 8, 'uploads/65/8/1.jpg', NULL, '1.jpg', NULL, 0, '2021-09-16 02:37:23'),
(63, 65, 8, 'uploads/65/8/2.jpg', NULL, '2.jpg', NULL, 0, '2021-09-16 02:37:23'),
(64, 65, 8, 'uploads/65/8/3.jpg', NULL, '3.jpg', NULL, 0, '2021-09-16 02:37:23'),
(65, 72, 1, 'uploads/72/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-09-20 18:01:30'),
(66, 72, 3, 'uploads/72/3/2.jpg', NULL, '2.jpg', NULL, 0, '2021-09-20 18:02:38'),
(67, 72, 3, 'uploads/72/3/3.jpg', NULL, '3.jpg', NULL, 0, '2021-09-20 18:02:38'),
(68, 72, 3, 'uploads/72/3/4.jpg', NULL, '4.jpg', NULL, 0, '2021-09-20 18:02:38'),
(69, 72, 3, 'uploads/72/3/5.jpg', NULL, '5.jpg', NULL, 0, '2021-09-20 18:02:38'),
(70, 72, 3, 'uploads/72/3/6.jpg', NULL, '6.jpg', NULL, 0, '2021-09-20 18:02:38'),
(71, 72, 3, 'uploads/72/3/7.jpg', NULL, '7.jpg', NULL, 0, '2021-09-20 18:02:38'),
(72, 72, 3, 'uploads/72/3/8.jpg', NULL, '8.jpg', NULL, 0, '2021-09-20 18:02:38'),
(73, 72, 3, 'uploads/72/3/9.jpg', NULL, '9.jpg', NULL, 0, '2021-09-20 18:02:38'),
(74, 72, 3, 'uploads/72/3/10.jpg', NULL, '10.jpg', NULL, 0, '2021-09-20 18:02:38'),
(75, 72, 4, 'uploads/72/4/11.jpg', NULL, '11.jpg', NULL, 0, '2021-09-20 18:03:34'),
(76, 72, 4, 'uploads/72/4/12.jpg', NULL, '12.jpg', NULL, 0, '2021-09-20 18:03:34'),
(77, 72, 4, 'uploads/72/4/13.jpg', NULL, '13.jpg', NULL, 0, '2021-09-20 18:03:34'),
(78, 72, 5, 'uploads/72/5/14.jpg', NULL, '14.jpg', NULL, 0, '2021-09-20 18:04:23'),
(79, 72, 5, 'uploads/72/5/15.jpg', NULL, '15.jpg', NULL, 0, '2021-09-20 18:04:23'),
(80, 72, 5, 'uploads/72/5/16.jpg', NULL, '16.jpg', NULL, 0, '2021-09-20 18:04:23'),
(81, 72, 6, 'uploads/72/6/17.jpg', NULL, '17.jpg', NULL, 0, '2021-09-20 18:04:57'),
(82, 72, 8, 'uploads/72/8/18.jpg', NULL, '18.jpg', NULL, 0, '2021-09-20 18:08:08'),
(83, 72, 8, 'uploads/72/8/19.jpg', NULL, '19.jpg', NULL, 0, '2021-09-20 18:08:08'),
(84, 72, 8, 'uploads/72/8/20.jpg', NULL, '20.jpg', NULL, 0, '2021-09-20 18:08:08'),
(85, 73, 1, 'uploads/73/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-09-20 20:24:48'),
(86, 73, 3, 'uploads/73/3/2.jpg', NULL, '2.jpg', NULL, 0, '2021-09-20 20:25:35'),
(87, 73, 3, 'uploads/73/3/3.jpg', NULL, '3.jpg', NULL, 0, '2021-09-20 20:25:35'),
(88, 73, 3, 'uploads/73/3/4.jpg', NULL, '4.jpg', NULL, 0, '2021-09-20 20:25:35'),
(89, 73, 3, 'uploads/73/3/5.jpg', NULL, '5.jpg', NULL, 0, '2021-09-20 20:25:35'),
(90, 73, 3, 'uploads/73/3/6.jpg', NULL, '6.jpg', NULL, 0, '2021-09-20 20:25:35'),
(91, 73, 3, 'uploads/73/3/7.jpg', NULL, '7.jpg', NULL, 0, '2021-09-20 20:25:35'),
(92, 73, 3, 'uploads/73/3/8.jpg', NULL, '8.jpg', NULL, 0, '2021-09-20 20:25:35'),
(93, 73, 3, 'uploads/73/3/9.jpg', NULL, '9.jpg', NULL, 0, '2021-09-20 20:25:35'),
(94, 73, 3, 'uploads/73/3/10.jpg', NULL, '10.jpg', NULL, 0, '2021-09-20 20:25:35'),
(95, 73, 4, 'uploads/73/4/11.jpg', NULL, '11.jpg', NULL, 0, '2021-09-20 20:26:17'),
(96, 73, 4, 'uploads/73/4/12.jpg', NULL, '12.jpg', NULL, 0, '2021-09-20 20:26:17'),
(97, 73, 4, 'uploads/73/4/13.jpg', NULL, '13.jpg', NULL, 0, '2021-09-20 20:26:17'),
(98, 73, 5, 'uploads/73/5/14.jpg', NULL, '14.jpg', NULL, 0, '2021-09-20 20:27:02'),
(99, 73, 5, 'uploads/73/5/15.jpg', NULL, '15.jpg', NULL, 0, '2021-09-20 20:27:02'),
(100, 73, 5, 'uploads/73/5/16.jpg', NULL, '16.jpg', NULL, 0, '2021-09-20 20:27:02'),
(101, 73, 6, 'uploads/73/6/17.jpg', NULL, '17.jpg', NULL, 0, '2021-09-20 20:27:24'),
(102, 73, 8, 'uploads/73/8/18.jpg', NULL, '18.jpg', NULL, 0, '2021-09-20 20:28:53'),
(103, 73, 8, 'uploads/73/8/19.jpg', NULL, '19.jpg', NULL, 0, '2021-09-20 20:28:53'),
(104, 73, 8, 'uploads/73/8/20.jpg', NULL, '20.jpg', NULL, 0, '2021-09-20 20:28:53'),
(105, 79, 1, 'uploads/79/1/20210921_111029.jpg', NULL, '20210921_111029.jpg', NULL, 0, '2021-09-23 17:50:22'),
(106, 79, 1, 'uploads/79/1/20210921_110419.jpg', NULL, '20210921_110419.jpg', NULL, 0, '2021-09-23 17:52:14'),
(107, 88, 1, 'uploads/88/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-10-02 14:22:48'),
(108, 88, 1, 'uploads/88/1/2.png', NULL, '2.png', NULL, 0, '2021-10-02 14:22:48'),
(109, 88, 3, 'uploads/88/3/3.jpg', NULL, '3.jpg', NULL, 0, '2021-10-02 14:25:34'),
(110, 88, 3, 'uploads/88/3/4.jpg', NULL, '4.jpg', NULL, 0, '2021-10-02 14:25:34'),
(111, 88, 3, 'uploads/88/3/5.jpg', NULL, '5.jpg', NULL, 0, '2021-10-02 14:25:34'),
(112, 88, 4, 'uploads/88/4/10.jpg', NULL, '10.jpg', NULL, 0, '2021-10-02 14:28:21'),
(113, 88, 4, 'uploads/88/4/11.jpg', NULL, '11.jpg', NULL, 0, '2021-10-02 14:28:21'),
(114, 88, 4, 'uploads/88/4/12.jpg', NULL, '12.jpg', NULL, 0, '2021-10-02 14:28:21'),
(115, 88, 6, 'uploads/88/6/6.jpg', NULL, '6.jpg', NULL, 0, '2021-10-02 14:29:39'),
(116, 88, 8, 'uploads/88/8/7.jpg', NULL, '7.jpg', NULL, 0, '2021-10-02 14:30:42'),
(118, 89, 1, 'uploads/89/1/2.jpg', NULL, '2.jpg', NULL, 0, '2021-10-04 14:32:14'),
(119, 89, 1, 'uploads/89/1/3.jpg', NULL, '3.jpg', NULL, 0, '2021-10-04 14:32:14'),
(120, 89, 2, 'uploads/89/2/6.jpg', NULL, '6.jpg', NULL, 0, '2021-10-04 14:33:07'),
(121, 89, 2, 'uploads/89/2/7.jpg', NULL, '7.jpg', NULL, 0, '2021-10-04 14:33:07'),
(122, 89, 3, 'uploads/89/3/8.jpg', NULL, '8.jpg', NULL, 0, '2021-10-04 14:33:59'),
(123, 89, 3, 'uploads/89/3/9.jpg', NULL, '9.jpg', NULL, 0, '2021-10-04 14:33:59'),
(124, 89, 3, 'uploads/89/3/10.jpg', NULL, '10.jpg', NULL, 0, '2021-10-04 14:33:59'),
(125, 89, 3, 'uploads/89/3/11.jpg', NULL, '11.jpg', NULL, 0, '2021-10-04 14:33:59'),
(126, 89, 3, 'uploads/89/3/12.jpg', NULL, '12.jpg', NULL, 0, '2021-10-04 14:33:59'),
(127, 89, 3, 'uploads/89/3/13.jpg', NULL, '13.jpg', NULL, 0, '2021-10-04 14:33:59'),
(128, 89, 4, 'uploads/89/4/14.jpg', NULL, '14.jpg', NULL, 0, '2021-10-04 14:35:38'),
(129, 89, 4, 'uploads/89/4/15.jpg', NULL, '15.jpg', NULL, 0, '2021-10-04 14:35:38'),
(130, 89, 4, 'uploads/89/4/16.jpg', NULL, '16.jpg', NULL, 0, '2021-10-04 14:35:38'),
(131, 89, 4, 'uploads/89/4/17.jpg', NULL, '17.jpg', NULL, 0, '2021-10-04 14:35:38'),
(132, 89, 4, 'uploads/89/4/18.jpg', NULL, '18.jpg', NULL, 0, '2021-10-04 14:35:38'),
(133, 89, 4, 'uploads/89/4/19.jpg', NULL, '19.jpg', NULL, 0, '2021-10-04 14:35:38'),
(134, 89, 4, 'uploads/89/4/20.jpg', NULL, '20.jpg', NULL, 0, '2021-10-04 14:35:38'),
(135, 89, 4, 'uploads/89/4/21.jpg', NULL, '21.jpg', NULL, 0, '2021-10-04 14:35:38'),
(136, 89, 4, 'uploads/89/4/22.jpg', NULL, '22.jpg', NULL, 0, '2021-10-04 14:36:05'),
(137, 89, 4, 'uploads/89/4/23.jpg', NULL, '23.jpg', NULL, 0, '2021-10-04 14:36:05'),
(138, 89, 5, 'uploads/89/5/24.jpg', NULL, '24.jpg', NULL, 0, '2021-10-04 14:37:21'),
(139, 89, 6, 'uploads/89/6/25.jpg', NULL, '25.jpg', NULL, 0, '2021-10-04 14:38:09'),
(140, 89, 6, 'uploads/89/6/26.jpg', NULL, '26.jpg', NULL, 0, '2021-10-04 14:38:09'),
(141, 89, 8, 'uploads/89/8/27.jpg', NULL, '27.jpg', NULL, 0, '2021-10-04 14:41:25'),
(142, 89, 8, 'uploads/89/8/28.jpg', NULL, '28.jpg', NULL, 0, '2021-10-04 14:41:25'),
(143, 89, 8, 'uploads/89/8/29.jpg', NULL, '29.jpg', NULL, 0, '2021-10-04 14:41:25'),
(144, 90, 1, 'uploads/90/1/Screenshot_2.jpg', NULL, 'Screenshot_2.jpg', NULL, 0, '2021-10-05 12:26:05'),
(145, 91, 1, 'uploads/91/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-10-07 16:14:02'),
(146, 91, 3, 'uploads/91/3/2.jpg', NULL, '2.jpg', NULL, 0, '2021-10-07 16:15:12'),
(147, 91, 3, 'uploads/91/3/3.jpg', NULL, '3.jpg', NULL, 0, '2021-10-07 16:15:12'),
(148, 91, 3, 'uploads/91/3/4.jpg', NULL, '4.jpg', NULL, 0, '2021-10-07 16:15:12'),
(149, 91, 3, 'uploads/91/3/5.jpg', NULL, '5.jpg', NULL, 0, '2021-10-07 16:15:12'),
(150, 91, 3, 'uploads/91/3/6.jpg', NULL, '6.jpg', NULL, 0, '2021-10-07 16:15:12'),
(151, 91, 3, 'uploads/91/3/7.jpg', NULL, '7.jpg', NULL, 0, '2021-10-07 16:15:12'),
(152, 91, 3, 'uploads/91/3/8.jpg', NULL, '8.jpg', NULL, 0, '2021-10-07 16:15:12'),
(153, 91, 3, 'uploads/91/3/9.jpg', NULL, '9.jpg', NULL, 0, '2021-10-07 16:15:12'),
(154, 91, 4, 'uploads/91/4/11.jpg', NULL, '11.jpg', NULL, 0, '2021-10-07 16:16:13'),
(155, 91, 4, 'uploads/91/4/12.jpg', NULL, '12.jpg', NULL, 0, '2021-10-07 16:16:13'),
(156, 91, 4, 'uploads/91/4/13.jpg', NULL, '13.jpg', NULL, 0, '2021-10-07 16:16:13'),
(157, 91, 5, 'uploads/91/5/14.jpg', NULL, '14.jpg', NULL, 0, '2021-10-07 16:17:19'),
(158, 91, 5, 'uploads/91/5/15.jpg', NULL, '15.jpg', NULL, 0, '2021-10-07 16:17:19'),
(159, 91, 5, 'uploads/91/5/16.jpg', NULL, '16.jpg', NULL, 0, '2021-10-07 16:17:19'),
(160, 91, 6, 'uploads/91/6/17.jpg', NULL, '17.jpg', NULL, 0, '2021-10-07 16:17:54'),
(161, 91, 8, 'uploads/91/8/18.jpg', NULL, '18.jpg', NULL, 0, '2021-10-07 16:19:04'),
(162, 91, 8, 'uploads/91/8/19.jpg', NULL, '19.jpg', NULL, 0, '2021-10-07 16:19:04'),
(163, 91, 8, 'uploads/91/8/20.jpg', NULL, '20.jpg', NULL, 0, '2021-10-07 16:19:04'),
(164, 95, 1, 'uploads/95/1/Screenshot_4.jpg', NULL, 'Screenshot_4.jpg', NULL, 0, '2021-10-22 22:01:50'),
(165, 65, 2, 'uploads/65/2/Screenshot_1.jpg', NULL, 'Screenshot_1.jpg', NULL, 0, '2021-10-22 22:02:46'),
(169, 95, 1, 'uploads/95/1/foto.jpg', NULL, 'foto.jpg', NULL, 0, '2021-10-23 13:44:45'),
(171, 107, 1, 'uploads/107/1/one-piece.jpg', NULL, 'one-piece.jpg', NULL, 0, '2021-10-23 16:26:30'),
(172, 107, 1, 'uploads/107/1/thumb-1920-702742.jpg', NULL, 'thumb-1920-702742.jpg', NULL, 0, '2021-10-23 16:26:30'),
(177, 118, 1, 'uploads/118/1/20211104_103714.jpg', NULL, '20211104_103714.jpg', NULL, 0, '2021-11-08 07:11:57'),
(178, 118, 1, 'uploads/118/1/20211104_104854.jpg', NULL, '20211104_104854.jpg', NULL, 0, '2021-11-08 07:12:31'),
(179, 121, 1, 'uploads/121/1/20211108_085710.jpg', NULL, '20211108_085710.jpg', NULL, 0, '2021-11-10 21:10:44'),
(180, 121, 1, 'uploads/121/1/20211108_085754.jpg', NULL, '20211108_085754.jpg', NULL, 0, '2021-11-10 21:11:11'),
(181, 121, 1, 'uploads/121/1/20211108_085429.jpg', NULL, '20211108_085429.jpg', NULL, 0, '2021-11-10 21:11:34'),
(182, 121, 1, 'uploads/121/1/20211108_090113.jpg', NULL, '20211108_090113.jpg', NULL, 0, '2021-11-10 21:11:46'),
(183, 121, 1, 'uploads/121/1/20211108_083901.jpg', NULL, '20211108_083901.jpg', NULL, 0, '2021-11-10 21:12:13'),
(184, 121, 1, 'uploads/121/1/20211108_083914.jpg', NULL, '20211108_083914.jpg', NULL, 0, '2021-11-10 21:12:17'),
(186, 121, 2, 'uploads/121/2/20211108_090937.jpg', NULL, '20211108_090937.jpg', NULL, 0, '2021-11-10 21:20:27'),
(187, 121, 2, 'uploads/121/2/20211108_090930.jpg', NULL, '20211108_090930.jpg', NULL, 0, '2021-11-10 21:20:38'),
(188, 121, 3, 'uploads/121/3/20211108_090756.jpg', NULL, '20211108_090756.jpg', NULL, 0, '2021-11-10 21:26:15'),
(189, 121, 3, 'uploads/121/3/20211108_090918.jpg', NULL, '20211108_090918.jpg', NULL, 0, '2021-11-10 21:26:43'),
(190, 121, 3, 'uploads/121/3/20211108_093429.jpg', NULL, '20211108_093429.jpg', NULL, 0, '2021-11-10 21:27:30'),
(191, 121, 3, 'uploads/121/3/20211108_093450.jpg', NULL, '20211108_093450.jpg', NULL, 0, '2021-11-10 21:27:47'),
(192, 121, 3, 'uploads/121/3/20211108_093357.jpg', NULL, '20211108_093357.jpg', NULL, 0, '2021-11-10 21:28:29'),
(193, 121, 3, 'uploads/121/3/20211108_092841.jpg', NULL, '20211108_092841.jpg', NULL, 0, '2021-11-10 21:28:51'),
(194, 121, 3, 'uploads/121/3/20211108_093113.jpg', NULL, '20211108_093113.jpg', NULL, 0, '2021-11-10 21:29:02'),
(195, 121, 3, 'uploads/121/3/20211108_092854.jpg', NULL, '20211108_092854.jpg', NULL, 0, '2021-11-10 21:29:13'),
(196, 121, 3, 'uploads/121/3/20211108_091004.jpg', NULL, '20211108_091004.jpg', NULL, 0, '2021-11-10 21:29:34'),
(197, 121, 3, 'uploads/121/3/20211108_092010.jpg', NULL, '20211108_092010.jpg', NULL, 0, '2021-11-10 21:29:48'),
(198, 121, 3, 'uploads/121/3/20211108_091235.jpg', NULL, '20211108_091235.jpg', NULL, 0, '2021-11-10 21:30:35'),
(199, 121, 3, 'uploads/121/3/20211108_091310.jpg', NULL, '20211108_091310.jpg', NULL, 0, '2021-11-10 21:31:02'),
(200, 121, 5, 'uploads/121/5/20211108_085445.jpg', NULL, '20211108_085445.jpg', NULL, 0, '2021-11-10 21:52:42'),
(201, 121, 5, 'uploads/121/5/20211108_090113.jpg', NULL, '20211108_090113.jpg', NULL, 0, '2021-11-10 21:52:58'),
(202, 121, 5, 'uploads/121/5/20211108_085705.jpg', NULL, '20211108_085705.jpg', NULL, 0, '2021-11-10 21:53:45'),
(203, 121, 1, 'uploads/121/1/20211108_090555.jpg', NULL, '20211108_090555.jpg', NULL, 0, '2021-11-10 21:54:17'),
(204, 121, 1, 'uploads/121/1/20211108_084504.jpg', NULL, '20211108_084504.jpg', NULL, 0, '2021-11-10 21:54:42'),
(207, 121, 6, 'uploads/121/6/20211108_085710.jpg', NULL, '20211108_085710.jpg', NULL, 0, '2021-11-10 21:59:37'),
(208, 121, 4, 'uploads/121/4/foto charla ensa.jpg', NULL, 'foto charla ensa.jpg', NULL, 0, '2021-11-10 22:36:07'),
(209, 124, 1, 'uploads/124/1/one-piece.jpg', NULL, 'one-piece.jpg', NULL, 0, '2021-11-11 01:16:50'),
(210, 124, 2, 'uploads/124/2/t2.png', NULL, 't2.png', NULL, 0, '2021-11-11 01:17:14'),
(211, 124, 3, 'uploads/124/3/t2.jpg', NULL, 't2.jpg', NULL, 0, '2021-11-11 01:17:45'),
(212, 124, 3, 'uploads/124/3/t2.png', NULL, 't2.png', NULL, 0, '2021-11-11 01:17:45'),
(213, 124, 3, 'uploads/124/3/thumb-1920-702742.jpg', NULL, 'thumb-1920-702742.jpg', NULL, 0, '2021-11-11 01:17:45'),
(214, 124, 4, 'uploads/124/4/FIRMA.png', NULL, 'FIRMA.png', NULL, 0, '2021-11-11 01:18:26'),
(215, 124, 4, 'uploads/124/4/one-piece.jpg', NULL, 'one-piece.jpg', NULL, 0, '2021-11-11 01:18:26'),
(216, 124, 4, 'uploads/124/4/t2.jpg', NULL, 't2.jpg', NULL, 0, '2021-11-11 01:18:26'),
(217, 124, 4, 'uploads/124/4/t2.png', NULL, 't2.png', NULL, 0, '2021-11-11 01:18:26'),
(218, 124, 4, 'uploads/124/4/thumb-1920-702742.jpg', NULL, 'thumb-1920-702742.jpg', NULL, 0, '2021-11-11 01:18:26'),
(219, 124, 5, 'uploads/124/5/t2.png', NULL, 't2.png', NULL, 0, '2021-11-11 01:18:49'),
(220, 124, 5, 'uploads/124/5/thumb-1920-702742.jpg', NULL, 'thumb-1920-702742.jpg', NULL, 0, '2021-11-11 01:18:49'),
(221, 124, 6, 'uploads/124/6/FIRMA.png', NULL, 'FIRMA.png', NULL, 0, '2021-11-11 01:19:10'),
(222, 124, 7, 'uploads/124/7/t2.png', NULL, 't2.png', NULL, 0, '2021-11-11 01:19:52'),
(223, 124, 8, 'uploads/124/8/thumb-1920-702742.jpg', NULL, 'thumb-1920-702742.jpg', NULL, 0, '2021-11-11 01:20:08'),
(224, 126, 1, 'uploads/126/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-16 06:51:25'),
(225, 126, 1, 'uploads/126/1/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-16 06:51:25'),
(226, 126, 1, 'uploads/126/1/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-16 06:51:25'),
(227, 126, 1, 'uploads/126/1/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-16 06:51:25'),
(228, 126, 1, 'uploads/126/1/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-16 06:51:25'),
(229, 126, 1, 'uploads/126/1/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-16 06:51:25'),
(230, 126, 1, 'uploads/126/1/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-16 06:51:25'),
(231, 126, 1, 'uploads/126/1/8.jpg', NULL, '8.jpg', NULL, 0, '2021-11-16 06:51:25'),
(232, 126, 1, 'uploads/126/1/9.jpg', NULL, '9.jpg', NULL, 0, '2021-11-16 06:51:25'),
(233, 126, 1, 'uploads/126/1/10.jpg', NULL, '10.jpg', NULL, 0, '2021-11-16 06:51:25'),
(234, 126, 2, 'uploads/126/2/11.jpg', NULL, '11.jpg', NULL, 0, '2021-11-16 06:52:10'),
(235, 126, 2, 'uploads/126/2/12.jpg', NULL, '12.jpg', NULL, 0, '2021-11-16 06:52:10'),
(236, 126, 2, 'uploads/126/2/13.jpg', NULL, '13.jpg', NULL, 0, '2021-11-16 06:52:10'),
(237, 126, 3, 'uploads/126/3/14.jpg', NULL, '14.jpg', NULL, 0, '2021-11-16 06:53:35'),
(238, 126, 3, 'uploads/126/3/15.jpg', NULL, '15.jpg', NULL, 0, '2021-11-16 06:53:35'),
(239, 126, 3, 'uploads/126/3/16.jpg', NULL, '16.jpg', NULL, 0, '2021-11-16 06:53:35'),
(240, 126, 3, 'uploads/126/3/17.jpg', NULL, '17.jpg', NULL, 0, '2021-11-16 06:53:35'),
(241, 126, 3, 'uploads/126/3/18.jpg', NULL, '18.jpg', NULL, 0, '2021-11-16 06:53:35'),
(242, 126, 3, 'uploads/126/3/19.jpg', NULL, '19.jpg', NULL, 0, '2021-11-16 06:53:35'),
(243, 126, 3, 'uploads/126/3/20.jpg', NULL, '20.jpg', NULL, 0, '2021-11-16 06:53:35'),
(244, 126, 3, 'uploads/126/3/21.jpg', NULL, '21.jpg', NULL, 0, '2021-11-16 06:53:35'),
(245, 126, 4, 'uploads/126/4/22.jpg', NULL, '22.jpg', NULL, 0, '2021-11-16 06:55:28'),
(246, 126, 4, 'uploads/126/4/23.jpg', NULL, '23.jpg', NULL, 0, '2021-11-16 06:55:28'),
(247, 126, 4, 'uploads/126/4/24.jpg', NULL, '24.jpg', NULL, 0, '2021-11-16 06:55:28'),
(248, 126, 4, 'uploads/126/4/25.jpg', NULL, '25.jpg', NULL, 0, '2021-11-16 06:55:28'),
(249, 126, 4, 'uploads/126/4/26.jpg', NULL, '26.jpg', NULL, 0, '2021-11-16 06:55:28'),
(250, 126, 4, 'uploads/126/4/27.jpg', NULL, '27.jpg', NULL, 0, '2021-11-16 06:55:28'),
(251, 126, 4, 'uploads/126/4/28.jpg', NULL, '28.jpg', NULL, 0, '2021-11-16 06:55:28'),
(252, 126, 4, 'uploads/126/4/29.jpg', NULL, '29.jpg', NULL, 0, '2021-11-16 06:55:28'),
(253, 126, 4, 'uploads/126/4/30.jpg', NULL, '30.jpg', NULL, 0, '2021-11-16 06:55:28'),
(254, 126, 5, 'uploads/126/5/31.jpg', NULL, '31.jpg', NULL, 0, '2021-11-16 06:57:33'),
(255, 126, 5, 'uploads/126/5/32.jpg', NULL, '32.jpg', NULL, 0, '2021-11-16 06:57:33'),
(256, 126, 5, 'uploads/126/5/33.jpg', NULL, '33.jpg', NULL, 0, '2021-11-16 06:57:33'),
(257, 126, 5, 'uploads/126/5/34.jpg', NULL, '34.jpg', NULL, 0, '2021-11-16 06:57:33'),
(258, 126, 5, 'uploads/126/5/35.jpg', NULL, '35.jpg', NULL, 0, '2021-11-16 06:57:33'),
(259, 126, 6, 'uploads/126/6/36.jpg', NULL, '36.jpg', NULL, 0, '2021-11-16 06:59:09'),
(260, 126, 6, 'uploads/126/6/37.jpg', NULL, '37.jpg', NULL, 0, '2021-11-16 06:59:09'),
(261, 126, 8, 'uploads/126/8/38.jpg', NULL, '38.jpg', NULL, 0, '2021-11-16 07:04:50'),
(262, 126, 8, 'uploads/126/8/39.jpg', NULL, '39.jpg', NULL, 0, '2021-11-16 07:04:50'),
(263, 127, 12, 'uploads/127/12/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-16 15:37:25'),
(264, 127, 12, 'uploads/127/12/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-16 15:37:25'),
(265, 127, 12, 'uploads/127/12/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-16 15:37:25'),
(266, 127, 12, 'uploads/127/12/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-16 15:37:25'),
(267, 127, 12, 'uploads/127/12/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-16 15:37:25'),
(268, 127, 13, 'uploads/127/13/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-16 15:38:03'),
(269, 127, 13, 'uploads/127/13/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-16 15:38:03'),
(270, 127, 13, 'uploads/127/13/8.jpg', NULL, '8.jpg', NULL, 0, '2021-11-16 15:38:03'),
(271, 127, 13, 'uploads/127/13/9.jpg', NULL, '9.jpg', NULL, 0, '2021-11-16 15:38:03'),
(272, 127, 13, 'uploads/127/13/10.jpg', NULL, '10.jpg', NULL, 0, '2021-11-16 15:38:03'),
(273, 127, 14, 'uploads/127/14/11.jpg', NULL, '11.jpg', NULL, 0, '2021-11-16 15:38:42'),
(274, 127, 14, 'uploads/127/14/12.jpg', NULL, '12.jpg', NULL, 0, '2021-11-16 15:38:42'),
(275, 127, 14, 'uploads/127/14/13.jpg', NULL, '13.jpg', NULL, 0, '2021-11-16 15:38:42'),
(276, 127, 15, 'uploads/127/15/14.jpg', NULL, '14.jpg', NULL, 0, '2021-11-16 15:39:51'),
(277, 127, 15, 'uploads/127/15/15.jpg', NULL, '15.jpg', NULL, 0, '2021-11-16 15:39:51'),
(278, 127, 15, 'uploads/127/15/16.jpg', NULL, '16.jpg', NULL, 0, '2021-11-16 15:39:51'),
(279, 127, 15, 'uploads/127/15/17.jpg', NULL, '17.jpg', NULL, 0, '2021-11-16 15:39:51'),
(280, 127, 15, 'uploads/127/15/18.jpg', NULL, '18.jpg', NULL, 0, '2021-11-16 15:39:51'),
(281, 127, 15, 'uploads/127/15/19.jpg', NULL, '19.jpg', NULL, 0, '2021-11-16 15:39:51'),
(282, 127, 15, 'uploads/127/15/20.jpg', NULL, '20.jpg', NULL, 0, '2021-11-16 15:39:51'),
(283, 127, 15, 'uploads/127/15/21.jpg', NULL, '21.jpg', NULL, 0, '2021-11-16 15:39:51'),
(284, 127, 15, 'uploads/127/15/22.jpg', NULL, '22.jpg', NULL, 0, '2021-11-16 15:39:51'),
(285, 127, 15, 'uploads/127/15/23.jpg', NULL, '23.jpg', NULL, 0, '2021-11-16 15:39:51'),
(286, 127, 16, 'uploads/127/16/24.jpg', NULL, '24.jpg', NULL, 0, '2021-11-16 15:41:11'),
(287, 127, 16, 'uploads/127/16/25.jpg', NULL, '25.jpg', NULL, 0, '2021-11-16 15:41:11'),
(288, 127, 16, 'uploads/127/16/26.jpg', NULL, '26.jpg', NULL, 0, '2021-11-16 15:41:11'),
(289, 127, 16, 'uploads/127/16/27.jpg', NULL, '27.jpg', NULL, 0, '2021-11-16 15:41:11'),
(290, 127, 17, 'uploads/127/17/28.jpg', NULL, '28.jpg', NULL, 0, '2021-11-16 15:46:33'),
(291, 127, 17, 'uploads/127/17/29.jpg', NULL, '29.jpg', NULL, 0, '2021-11-16 15:46:33'),
(292, 127, 17, 'uploads/127/17/30.jpg', NULL, '30.jpg', NULL, 0, '2021-11-16 15:46:33'),
(293, 127, 17, 'uploads/127/17/31.jpg', NULL, '31.jpg', NULL, 0, '2021-11-16 15:46:33'),
(294, 127, 17, 'uploads/127/17/32.jpg', NULL, '32.jpg', NULL, 0, '2021-11-16 15:46:33'),
(295, 127, 17, 'uploads/127/17/33.jpg', NULL, '33.jpg', NULL, 0, '2021-11-16 15:46:33'),
(296, 127, 17, 'uploads/127/17/34.jpg', NULL, '34.jpg', NULL, 0, '2021-11-16 15:46:33'),
(297, 127, 17, 'uploads/127/17/35.jpg', NULL, '35.jpg', NULL, 0, '2021-11-16 15:46:33'),
(298, 127, 17, 'uploads/127/17/36.jpg', NULL, '36.jpg', NULL, 0, '2021-11-16 15:46:33'),
(299, 127, 17, 'uploads/127/17/37.jpg', NULL, '37.jpg', NULL, 0, '2021-11-16 15:46:33'),
(300, 127, 17, 'uploads/127/17/38.jpg', NULL, '38.jpg', NULL, 0, '2021-11-16 15:46:33'),
(301, 127, 17, 'uploads/127/17/39.jpg', NULL, '39.jpg', NULL, 0, '2021-11-16 15:46:33'),
(302, 127, 17, 'uploads/127/17/40.jpg', NULL, '40.jpg', NULL, 0, '2021-11-16 15:46:33'),
(303, 127, 17, 'uploads/127/17/41.jpg', NULL, '41.jpg', NULL, 0, '2021-11-16 15:46:33'),
(304, 127, 17, 'uploads/127/17/42.jpg', NULL, '42.jpg', NULL, 0, '2021-11-16 15:46:33'),
(305, 127, 17, 'uploads/127/17/43.jpg', NULL, '43.jpg', NULL, 0, '2021-11-16 15:46:33'),
(306, 128, 1, 'uploads/128/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-16 19:43:14'),
(307, 128, 1, 'uploads/128/1/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-16 19:43:14'),
(308, 128, 1, 'uploads/128/1/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-16 19:43:14'),
(309, 128, 4, 'uploads/128/4/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-16 19:45:41'),
(310, 128, 4, 'uploads/128/4/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-16 19:45:41'),
(311, 128, 4, 'uploads/128/4/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-16 19:45:41'),
(312, 128, 4, 'uploads/128/4/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-16 19:45:41'),
(313, 128, 4, 'uploads/128/4/8.jpg', NULL, '8.jpg', NULL, 0, '2021-11-16 19:45:41'),
(314, 128, 4, 'uploads/128/4/9.jpg', NULL, '9.jpg', NULL, 0, '2021-11-16 19:45:41'),
(315, 128, 4, 'uploads/128/4/10.jpg', NULL, '10.jpg', NULL, 0, '2021-11-16 19:45:41'),
(316, 128, 4, 'uploads/128/4/11.jpg', NULL, '11.jpg', NULL, 0, '2021-11-16 19:45:41'),
(317, 128, 4, 'uploads/128/4/12.jpg', NULL, '12.jpg', NULL, 0, '2021-11-16 19:45:41'),
(318, 128, 4, 'uploads/128/4/13.jpg', NULL, '13.jpg', NULL, 0, '2021-11-16 19:45:41'),
(319, 128, 4, 'uploads/128/4/14.jpg', NULL, '14.jpg', NULL, 0, '2021-11-16 19:45:41'),
(320, 128, 4, 'uploads/128/4/15.jpg', NULL, '15.jpg', NULL, 0, '2021-11-16 19:45:41'),
(321, 128, 5, 'uploads/128/5/16.jpg', NULL, '16.jpg', NULL, 0, '2021-11-16 19:46:14'),
(322, 128, 5, 'uploads/128/5/17.jpg', NULL, '17.jpg', NULL, 0, '2021-11-16 19:46:14'),
(323, 128, 6, 'uploads/128/6/18.jpg', NULL, '18.jpg', NULL, 0, '2021-11-16 19:46:48'),
(324, 128, 6, 'uploads/128/6/19.jpg', NULL, '19.jpg', NULL, 0, '2021-11-16 19:46:48'),
(325, 128, 8, 'uploads/128/8/20.jpg', NULL, '20.jpg', NULL, 0, '2021-11-16 19:48:19'),
(326, 129, 1, 'uploads/129/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-17 00:00:28'),
(327, 129, 1, 'uploads/129/1/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-17 00:00:28'),
(328, 129, 1, 'uploads/129/1/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-17 00:00:28'),
(329, 129, 1, 'uploads/129/1/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-17 00:00:28'),
(330, 129, 1, 'uploads/129/1/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-17 00:00:28'),
(331, 129, 1, 'uploads/129/1/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-17 00:00:28'),
(332, 129, 4, 'uploads/129/4/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-17 00:02:00'),
(333, 129, 5, 'uploads/129/5/8.jpg', NULL, '8.jpg', NULL, 0, '2021-11-17 00:03:17'),
(334, 129, 5, 'uploads/129/5/9.jpg', NULL, '9.jpg', NULL, 0, '2021-11-17 00:03:17'),
(335, 129, 6, 'uploads/129/6/10.jpg', NULL, '10.jpg', NULL, 0, '2021-11-17 00:04:14'),
(336, 129, 6, 'uploads/129/6/11.jpg', NULL, '11.jpg', NULL, 0, '2021-11-17 00:04:14'),
(337, 129, 6, 'uploads/129/6/12.jpg', NULL, '12.jpg', NULL, 0, '2021-11-17 00:04:14'),
(338, 129, 8, 'uploads/129/8/13.jpg', NULL, '13.jpg', NULL, 0, '2021-11-17 00:05:49'),
(339, 129, 8, 'uploads/129/8/14.jpg', NULL, '14.jpg', NULL, 0, '2021-11-17 00:05:49'),
(340, 129, 8, 'uploads/129/8/15.jpg', NULL, '15.jpg', NULL, 0, '2021-11-17 00:05:49'),
(341, 130, 12, 'uploads/130/12/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-17 00:29:57'),
(342, 130, 12, 'uploads/130/12/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-17 00:29:57'),
(343, 130, 12, 'uploads/130/12/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-17 00:29:57'),
(344, 130, 12, 'uploads/130/12/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-17 00:29:57'),
(345, 130, 12, 'uploads/130/12/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-17 00:29:57'),
(346, 130, 12, 'uploads/130/12/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-17 00:29:57'),
(347, 130, 13, 'uploads/130/13/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-17 00:30:43'),
(348, 130, 13, 'uploads/130/13/8.jpg', NULL, '8.jpg', NULL, 0, '2021-11-17 00:30:43'),
(349, 130, 14, 'uploads/130/14/9.jpg', NULL, '9.jpg', NULL, 0, '2021-11-17 00:31:59'),
(350, 130, 14, 'uploads/130/14/10.jpg', NULL, '10.jpg', NULL, 0, '2021-11-17 00:31:59'),
(351, 130, 15, 'uploads/130/15/11.jpg', NULL, '11.jpg', NULL, 0, '2021-11-17 00:33:04'),
(352, 130, 15, 'uploads/130/15/12.jpg', NULL, '12.jpg', NULL, 0, '2021-11-17 00:33:04'),
(353, 130, 15, 'uploads/130/15/13.jpg', NULL, '13.jpg', NULL, 0, '2021-11-17 00:33:04'),
(354, 130, 15, 'uploads/130/15/14.jpg', NULL, '14.jpg', NULL, 0, '2021-11-17 00:33:04'),
(355, 130, 15, 'uploads/130/15/15.jpg', NULL, '15.jpg', NULL, 0, '2021-11-17 00:33:04'),
(356, 130, 15, 'uploads/130/15/16.jpg', NULL, '16.jpg', NULL, 0, '2021-11-17 00:33:04'),
(357, 130, 16, 'uploads/130/16/17.jpg', NULL, '17.jpg', NULL, 0, '2021-11-17 00:34:06'),
(358, 130, 16, 'uploads/130/16/18.jpg', NULL, '18.jpg', NULL, 0, '2021-11-17 00:34:06'),
(359, 130, 16, 'uploads/130/16/19.jpg', NULL, '19.jpg', NULL, 0, '2021-11-17 00:34:06'),
(360, 130, 16, 'uploads/130/16/20.jpg', NULL, '20.jpg', NULL, 0, '2021-11-17 00:34:06'),
(361, 130, 17, 'uploads/130/17/21.jpg', NULL, '21.jpg', NULL, 0, '2021-11-17 00:36:08'),
(362, 130, 17, 'uploads/130/17/22.jpg', NULL, '22.jpg', NULL, 0, '2021-11-17 00:36:08'),
(363, 130, 17, 'uploads/130/17/23.jpg', NULL, '23.jpg', NULL, 0, '2021-11-17 00:36:08'),
(364, 130, 17, 'uploads/130/17/24.jpg', NULL, '24.jpg', NULL, 0, '2021-11-17 00:36:08'),
(365, 130, 19, 'uploads/130/19/25.jpg', NULL, '25.jpg', NULL, 0, '2021-11-17 00:37:29'),
(366, 131, 1, 'uploads/131/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-17 11:23:22'),
(367, 131, 1, 'uploads/131/1/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-17 11:23:22'),
(368, 131, 1, 'uploads/131/1/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-17 11:23:22'),
(369, 131, 1, 'uploads/131/1/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-17 11:23:22'),
(370, 131, 1, 'uploads/131/1/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-17 11:23:22'),
(371, 131, 1, 'uploads/131/1/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-17 11:23:22'),
(372, 131, 1, 'uploads/131/1/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-17 11:23:22'),
(373, 131, 1, 'uploads/131/1/8.jpg', NULL, '8.jpg', NULL, 0, '2021-11-17 11:23:22'),
(374, 131, 1, 'uploads/131/1/9.jpg', NULL, '9.jpg', NULL, 0, '2021-11-17 11:23:22'),
(375, 131, 2, 'uploads/131/2/10.jpg', NULL, '10.jpg', NULL, 0, '2021-11-17 11:24:45'),
(376, 131, 2, 'uploads/131/2/11.jpg', NULL, '11.jpg', NULL, 0, '2021-11-17 11:24:45'),
(377, 131, 2, 'uploads/131/2/12.jpg', NULL, '12.jpg', NULL, 0, '2021-11-17 11:24:45'),
(378, 131, 3, 'uploads/131/3/13.jpg', NULL, '13.jpg', NULL, 0, '2021-11-17 11:26:26'),
(379, 131, 3, 'uploads/131/3/14.jpg', NULL, '14.jpg', NULL, 0, '2021-11-17 11:26:26'),
(380, 131, 3, 'uploads/131/3/15.jpg', NULL, '15.jpg', NULL, 0, '2021-11-17 11:26:26'),
(381, 131, 3, 'uploads/131/3/16.jpg', NULL, '16.jpg', NULL, 0, '2021-11-17 11:26:26'),
(382, 131, 3, 'uploads/131/3/17.jpg', NULL, '17.jpg', NULL, 0, '2021-11-17 11:26:26'),
(383, 131, 3, 'uploads/131/3/18.jpg', NULL, '18.jpg', NULL, 0, '2021-11-17 11:26:26'),
(384, 131, 3, 'uploads/131/3/19.jpg', NULL, '19.jpg', NULL, 0, '2021-11-17 11:26:26'),
(385, 131, 3, 'uploads/131/3/20.jpg', NULL, '20.jpg', NULL, 0, '2021-11-17 11:26:26'),
(386, 131, 3, 'uploads/131/3/21.jpg', NULL, '21.jpg', NULL, 0, '2021-11-17 11:26:26'),
(387, 131, 3, 'uploads/131/3/22.jpg', NULL, '22.jpg', NULL, 0, '2021-11-17 11:26:26'),
(388, 131, 3, 'uploads/131/3/23.jpg', NULL, '23.jpg', NULL, 0, '2021-11-17 11:26:26'),
(389, 131, 3, 'uploads/131/3/24.jpg', NULL, '24.jpg', NULL, 0, '2021-11-17 11:26:26'),
(390, 131, 3, 'uploads/131/3/25.jpg', NULL, '25.jpg', NULL, 0, '2021-11-17 11:26:26'),
(391, 131, 3, 'uploads/131/3/26.jpg', NULL, '26.jpg', NULL, 0, '2021-11-17 11:26:26'),
(392, 131, 4, 'uploads/131/4/27.jpg', NULL, '27.jpg', NULL, 0, '2021-11-17 11:28:07'),
(393, 131, 4, 'uploads/131/4/28.jpg', NULL, '28.jpg', NULL, 0, '2021-11-17 11:28:07'),
(394, 131, 4, 'uploads/131/4/29.jpg', NULL, '29.jpg', NULL, 0, '2021-11-17 11:28:07'),
(395, 131, 4, 'uploads/131/4/30.jpg', NULL, '30.jpg', NULL, 0, '2021-11-17 11:28:07'),
(396, 131, 4, 'uploads/131/4/31.jpg', NULL, '31.jpg', NULL, 0, '2021-11-17 11:28:07'),
(397, 131, 4, 'uploads/131/4/32.jpg', NULL, '32.jpg', NULL, 0, '2021-11-17 11:28:07'),
(398, 131, 4, 'uploads/131/4/33.jpg', NULL, '33.jpg', NULL, 0, '2021-11-17 11:28:07'),
(399, 131, 4, 'uploads/131/4/34.jpg', NULL, '34.jpg', NULL, 0, '2021-11-17 11:28:07'),
(400, 131, 4, 'uploads/131/4/35.jpg', NULL, '35.jpg', NULL, 0, '2021-11-17 11:28:07'),
(401, 131, 5, 'uploads/131/5/36.jpg', NULL, '36.jpg', NULL, 0, '2021-11-17 11:29:24'),
(402, 131, 5, 'uploads/131/5/37.jpg', NULL, '37.jpg', NULL, 0, '2021-11-17 11:29:24'),
(403, 131, 5, 'uploads/131/5/38.jpg', NULL, '38.jpg', NULL, 0, '2021-11-17 11:29:24'),
(404, 131, 5, 'uploads/131/5/39.jpg', NULL, '39.jpg', NULL, 0, '2021-11-17 11:29:24'),
(405, 131, 5, 'uploads/131/5/40.jpg', NULL, '40.jpg', NULL, 0, '2021-11-17 11:29:24'),
(406, 131, 5, 'uploads/131/5/41.jpg', NULL, '41.jpg', NULL, 0, '2021-11-17 11:29:24'),
(407, 131, 6, 'uploads/131/6/42.jpg', NULL, '42.jpg', NULL, 0, '2021-11-17 11:30:40'),
(408, 131, 6, 'uploads/131/6/43.jpg', NULL, '43.jpg', NULL, 0, '2021-11-17 11:30:40'),
(409, 131, 6, 'uploads/131/6/44.jpg', NULL, '44.jpg', NULL, 0, '2021-11-17 11:30:40'),
(410, 131, 8, 'uploads/131/8/45.jpg', NULL, '45.jpg', NULL, 0, '2021-11-17 11:32:47'),
(411, 132, 1, 'uploads/132/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-17 13:07:06'),
(412, 132, 1, 'uploads/132/1/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-17 13:07:06'),
(413, 132, 6, 'uploads/132/6/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-17 13:10:34'),
(414, 132, 6, 'uploads/132/6/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-17 13:10:34'),
(415, 132, 8, 'uploads/132/8/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-17 13:12:55'),
(416, 133, 12, 'uploads/133/12/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-17 20:30:23'),
(417, 133, 12, 'uploads/133/12/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-17 20:30:23'),
(418, 133, 13, 'uploads/133/13/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-17 20:30:59'),
(419, 133, 13, 'uploads/133/13/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-17 20:30:59'),
(420, 133, 14, 'uploads/133/14/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-17 20:31:31'),
(421, 133, 14, 'uploads/133/14/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-17 20:31:31'),
(422, 133, 15, 'uploads/133/15/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-17 20:32:26'),
(423, 133, 15, 'uploads/133/15/8.jpg', NULL, '8.jpg', NULL, 0, '2021-11-17 20:32:26'),
(424, 133, 15, 'uploads/133/15/9.jpg', NULL, '9.jpg', NULL, 0, '2021-11-17 20:32:26'),
(425, 133, 16, 'uploads/133/16/10.jpg', NULL, '10.jpg', NULL, 0, '2021-11-17 20:33:58'),
(426, 133, 16, 'uploads/133/16/11.jpg', NULL, '11.jpg', NULL, 0, '2021-11-17 20:33:58'),
(427, 133, 16, 'uploads/133/16/12.jpg', NULL, '12.jpg', NULL, 0, '2021-11-17 20:33:58'),
(428, 133, 16, 'uploads/133/16/13.jpg', NULL, '13.jpg', NULL, 0, '2021-11-17 20:33:58'),
(429, 133, 17, 'uploads/133/17/14.jpg', NULL, '14.jpg', NULL, 0, '2021-11-17 20:36:36'),
(430, 133, 17, 'uploads/133/17/15.jpg', NULL, '15.jpg', NULL, 0, '2021-11-17 20:36:36'),
(431, 135, 1, 'uploads/135/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-17 21:54:11'),
(432, 135, 1, 'uploads/135/1/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-17 21:54:11'),
(433, 135, 1, 'uploads/135/1/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-17 21:54:11'),
(434, 135, 2, 'uploads/135/2/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-17 21:54:53'),
(435, 135, 2, 'uploads/135/2/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-17 21:54:53'),
(436, 135, 4, 'uploads/135/4/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-17 21:55:41'),
(437, 135, 4, 'uploads/135/4/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-17 21:55:41'),
(438, 135, 4, 'uploads/135/4/8.jpg', NULL, '8.jpg', NULL, 0, '2021-11-17 21:55:41'),
(439, 135, 5, 'uploads/135/5/9.jpg', NULL, '9.jpg', NULL, 0, '2021-11-17 21:56:27'),
(440, 135, 5, 'uploads/135/5/10.jpg', NULL, '10.jpg', NULL, 0, '2021-11-17 21:56:27'),
(441, 135, 5, 'uploads/135/5/11.jpg', NULL, '11.jpg', NULL, 0, '2021-11-17 21:56:27'),
(442, 135, 6, 'uploads/135/6/12.jpg', NULL, '12.jpg', NULL, 0, '2021-11-17 21:57:04'),
(443, 136, 1, 'uploads/136/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-17 22:39:11'),
(444, 136, 1, 'uploads/136/1/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-17 22:39:11'),
(445, 136, 2, 'uploads/136/2/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-17 22:57:11'),
(446, 136, 4, 'uploads/136/4/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-17 22:58:07'),
(447, 136, 4, 'uploads/136/4/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-17 22:58:07'),
(448, 136, 4, 'uploads/136/4/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-17 22:58:07'),
(449, 136, 5, 'uploads/136/5/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-17 22:58:46'),
(450, 136, 5, 'uploads/136/5/8.jpg', NULL, '8.jpg', NULL, 0, '2021-11-17 22:58:46'),
(451, 136, 6, 'uploads/136/6/9.jpg', NULL, '9.jpg', NULL, 0, '2021-11-17 22:59:32'),
(452, 137, 1, 'uploads/137/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-17 23:29:02'),
(453, 137, 2, 'uploads/137/2/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-17 23:30:43'),
(454, 137, 5, 'uploads/137/5/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-17 23:32:22'),
(455, 137, 5, 'uploads/137/5/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-17 23:32:22'),
(456, 137, 6, 'uploads/137/6/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-17 23:34:09'),
(457, 137, 6, 'uploads/137/6/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-17 23:34:09'),
(458, 137, 6, 'uploads/137/6/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-17 23:34:09'),
(459, 137, 8, 'uploads/137/8/8.jpg', NULL, '8.jpg', NULL, 0, '2021-11-17 23:36:48'),
(460, 137, 8, 'uploads/137/8/9.jpg', NULL, '9.jpg', NULL, 0, '2021-11-17 23:36:49'),
(461, 138, 1, 'uploads/138/1/1.png', NULL, '1.png', NULL, 0, '2021-11-19 16:55:11'),
(462, 138, 1, 'uploads/138/1/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-19 16:55:11'),
(463, 138, 2, 'uploads/138/2/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-19 16:57:00'),
(464, 138, 2, 'uploads/138/2/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-19 16:57:00'),
(465, 138, 2, 'uploads/138/2/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-19 16:57:00'),
(466, 138, 6, 'uploads/138/6/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-19 16:59:59'),
(467, 138, 6, 'uploads/138/6/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-19 16:59:59'),
(468, 138, 6, 'uploads/138/6/7.jpg', NULL, '7.jpg', NULL, 0, '2021-11-19 16:59:59'),
(469, 139, 1, 'uploads/139/1/1.jpg', NULL, '1.jpg', NULL, 0, '2021-11-19 17:35:43'),
(470, 139, 1, 'uploads/139/1/2.jpg', NULL, '2.jpg', NULL, 0, '2021-11-19 17:35:43'),
(471, 139, 1, 'uploads/139/1/3.jpg', NULL, '3.jpg', NULL, 0, '2021-11-19 17:35:43'),
(472, 139, 1, 'uploads/139/1/4.jpg', NULL, '4.jpg', NULL, 0, '2021-11-19 17:35:43'),
(473, 139, 1, 'uploads/139/1/5.jpg', NULL, '5.jpg', NULL, 0, '2021-11-19 17:35:43'),
(474, 139, 1, 'uploads/139/1/6.jpg', NULL, '6.jpg', NULL, 0, '2021-11-19 17:35:43'),
(475, 139, 1, 'uploads/139/1/7.png', NULL, '7.png', NULL, 0, '2021-11-19 17:35:43'),
(476, 139, 1, 'uploads/139/1/8.png', NULL, '8.png', NULL, 0, '2021-11-19 17:35:43'),
(477, 139, 1, 'uploads/139/1/9.png', NULL, '9.png', NULL, 0, '2021-11-19 17:35:44'),
(478, 139, 2, 'uploads/139/2/10.png', NULL, '10.png', NULL, 0, '2021-11-19 17:40:06'),
(479, 139, 2, 'uploads/139/2/11.png', NULL, '11.png', NULL, 0, '2021-11-19 17:40:07'),
(480, 139, 3, 'uploads/139/3/12.png', NULL, '12.png', NULL, 0, '2021-11-19 17:40:56'),
(481, 139, 3, 'uploads/139/3/13.png', NULL, '13.png', NULL, 0, '2021-11-19 17:40:56'),
(482, 139, 3, 'uploads/139/3/14.png', NULL, '14.png', NULL, 0, '2021-11-19 17:40:57'),
(483, 139, 3, 'uploads/139/3/15.png', NULL, '15.png', NULL, 0, '2021-11-19 17:40:57'),
(484, 139, 3, 'uploads/139/3/16.png', NULL, '16.png', NULL, 0, '2021-11-19 17:40:57'),
(485, 139, 3, 'uploads/139/3/17.png', NULL, '17.png', NULL, 0, '2021-11-19 17:40:57'),
(486, 139, 4, 'uploads/139/4/18.png', NULL, '18.png', NULL, 0, '2021-11-19 18:00:33'),
(487, 139, 4, 'uploads/139/4/19.png', NULL, '19.png', NULL, 0, '2021-11-19 18:00:33'),
(488, 139, 4, 'uploads/139/4/20.png', NULL, '20.png', NULL, 0, '2021-11-19 18:00:33'),
(489, 139, 4, 'uploads/139/4/21.png', NULL, '21.png', NULL, 0, '2021-11-19 18:00:33'),
(490, 139, 4, 'uploads/139/4/22.png', NULL, '22.png', NULL, 0, '2021-11-19 18:00:33'),
(491, 139, 4, 'uploads/139/4/23.png', NULL, '23.png', NULL, 0, '2021-11-19 18:00:33'),
(492, 139, 4, 'uploads/139/4/24.png', NULL, '24.png', NULL, 0, '2021-11-19 18:00:33'),
(493, 139, 4, 'uploads/139/4/25.png', NULL, '25.png', NULL, 0, '2021-11-19 18:00:33'),
(494, 139, 4, 'uploads/139/4/26.png', NULL, '26.png', NULL, 0, '2021-11-19 18:00:33'),
(495, 139, 5, 'uploads/139/5/27.png', NULL, '27.png', NULL, 0, '2021-11-19 18:03:22'),
(496, 139, 5, 'uploads/139/5/28.png', NULL, '28.png', NULL, 0, '2021-11-19 18:03:23'),
(497, 139, 6, 'uploads/139/6/29.png', NULL, '29.png', NULL, 0, '2021-11-19 18:04:39'),
(498, 139, 6, 'uploads/139/6/30.png', NULL, '30.png', NULL, 0, '2021-11-19 18:04:40'),
(499, 139, 8, 'uploads/139/8/31.png', NULL, '31.png', NULL, 0, '2021-11-19 18:07:45'),
(500, 139, 8, 'uploads/139/8/32.png', NULL, '32.png', NULL, 0, '2021-11-19 18:07:45'),
(501, 140, 1, 'uploads/140/1/1.png', NULL, '1.png', NULL, 0, '2021-11-19 19:02:53'),
(502, 140, 1, 'uploads/140/1/2.png', NULL, '2.png', NULL, 0, '2021-11-19 19:02:53'),
(503, 140, 1, 'uploads/140/1/3.png', NULL, '3.png', NULL, 0, '2021-11-19 19:02:53'),
(504, 140, 1, 'uploads/140/1/4.png', NULL, '4.png', NULL, 0, '2021-11-19 19:02:53'),
(505, 140, 1, 'uploads/140/1/5.png', NULL, '5.png', NULL, 0, '2021-11-19 19:02:53'),
(506, 140, 1, 'uploads/140/1/6.png', NULL, '6.png', NULL, 0, '2021-11-19 19:02:53'),
(507, 140, 1, 'uploads/140/1/7.png', NULL, '7.png', NULL, 0, '2021-11-19 19:02:53'),
(508, 140, 1, 'uploads/140/1/8.png', NULL, '8.png', NULL, 0, '2021-11-19 19:02:53'),
(509, 140, 1, 'uploads/140/1/9.png', NULL, '9.png', NULL, 0, '2021-11-19 19:02:53'),
(510, 140, 2, 'uploads/140/2/10.png', NULL, '10.png', NULL, 0, '2021-11-19 19:04:24'),
(511, 140, 3, 'uploads/140/3/11.png', NULL, '11.png', NULL, 0, '2021-11-19 19:10:52'),
(512, 140, 3, 'uploads/140/3/12.png', NULL, '12.png', NULL, 0, '2021-11-19 19:10:52'),
(513, 140, 3, 'uploads/140/3/13.png', NULL, '13.png', NULL, 0, '2021-11-19 19:10:52'),
(514, 140, 3, 'uploads/140/3/14.png', NULL, '14.png', NULL, 0, '2021-11-19 19:10:52'),
(515, 140, 3, 'uploads/140/3/15.png', NULL, '15.png', NULL, 0, '2021-11-19 19:10:52'),
(516, 140, 3, 'uploads/140/3/16.png', NULL, '16.png', NULL, 0, '2021-11-19 19:10:52'),
(517, 140, 3, 'uploads/140/3/17.png', NULL, '17.png', NULL, 0, '2021-11-19 19:10:52'),
(518, 140, 3, 'uploads/140/3/18.png', NULL, '18.png', NULL, 0, '2021-11-19 19:10:52'),
(519, 140, 4, 'uploads/140/4/19.png', NULL, '19.png', NULL, 0, '2021-11-19 19:13:17'),
(520, 140, 4, 'uploads/140/4/20.png', NULL, '20.png', NULL, 0, '2021-11-19 19:13:17'),
(521, 140, 4, 'uploads/140/4/21.png', NULL, '21.png', NULL, 0, '2021-11-19 19:13:17'),
(522, 140, 4, 'uploads/140/4/22.png', NULL, '22.png', NULL, 0, '2021-11-19 19:13:17'),
(523, 140, 4, 'uploads/140/4/23.png', NULL, '23.png', NULL, 0, '2021-11-19 19:13:17'),
(524, 140, 5, 'uploads/140/5/24.png', NULL, '24.png', NULL, 0, '2021-11-19 19:37:14'),
(525, 140, 5, 'uploads/140/5/25.png', NULL, '25.png', NULL, 0, '2021-11-19 19:37:14'),
(526, 140, 5, 'uploads/140/5/26.png', NULL, '26.png', NULL, 0, '2021-11-19 19:37:14'),
(527, 140, 6, 'uploads/140/6/27.png', NULL, '27.png', NULL, 0, '2021-11-19 20:04:31'),
(528, 140, 6, 'uploads/140/6/28.png', NULL, '28.png', NULL, 0, '2021-11-19 20:04:31'),
(529, 140, 6, 'uploads/140/6/29.png', NULL, '29.png', NULL, 0, '2021-11-19 20:04:31'),
(530, 140, 8, 'uploads/140/8/30.png', NULL, '30.png', NULL, 0, '2021-11-19 20:12:04'),
(531, 141, 1, 'uploads/141/1/1.png', NULL, '1.png', NULL, 0, '2021-11-20 15:14:30'),
(532, 141, 1, 'uploads/141/1/2.png', NULL, '2.png', NULL, 0, '2021-11-20 15:14:30'),
(533, 141, 1, 'uploads/141/1/3.png', NULL, '3.png', NULL, 0, '2021-11-20 15:14:31'),
(534, 141, 1, 'uploads/141/1/4.png', NULL, '4.png', NULL, 0, '2021-11-20 15:14:31'),
(535, 141, 1, 'uploads/141/1/5.png', NULL, '5.png', NULL, 0, '2021-11-20 15:14:31'),
(536, 141, 1, 'uploads/141/1/45.png', NULL, '45.png', NULL, 0, '2021-11-20 15:15:59'),
(537, 141, 2, 'uploads/141/2/7.png', NULL, '7.png', NULL, 0, '2021-11-20 15:16:49'),
(538, 141, 2, 'uploads/141/2/8.png', NULL, '8.png', NULL, 0, '2021-11-20 15:16:49'),
(539, 141, 2, 'uploads/141/2/10.png', NULL, '10.png', NULL, 0, '2021-11-20 15:16:49'),
(540, 141, 2, 'uploads/141/2/11.png', NULL, '11.png', NULL, 0, '2021-11-20 15:16:49'),
(541, 141, 2, 'uploads/141/2/12.png', NULL, '12.png', NULL, 0, '2021-11-20 15:16:49'),
(542, 141, 2, 'uploads/141/2/13.png', NULL, '13.png', NULL, 0, '2021-11-20 15:16:49'),
(543, 141, 3, 'uploads/141/3/14.png', NULL, '14.png', NULL, 0, '2021-11-20 15:18:13'),
(544, 141, 3, 'uploads/141/3/15.png', NULL, '15.png', NULL, 0, '2021-11-20 15:18:14'),
(545, 141, 3, 'uploads/141/3/16.png', NULL, '16.png', NULL, 0, '2021-11-20 15:18:14'),
(546, 141, 3, 'uploads/141/3/17.png', NULL, '17.png', NULL, 0, '2021-11-20 15:18:14'),
(547, 141, 3, 'uploads/141/3/18.png', NULL, '18.png', NULL, 0, '2021-11-20 15:18:14'),
(548, 141, 3, 'uploads/141/3/19.png', NULL, '19.png', NULL, 0, '2021-11-20 15:18:14'),
(549, 141, 3, 'uploads/141/3/20.png', NULL, '20.png', NULL, 0, '2021-11-20 15:18:14'),
(550, 141, 3, 'uploads/141/3/21.png', NULL, '21.png', NULL, 0, '2021-11-20 15:18:14'),
(551, 141, 3, 'uploads/141/3/22.png', NULL, '22.png', NULL, 0, '2021-11-20 15:18:14'),
(552, 141, 4, 'uploads/141/4/23.png', NULL, '23.png', NULL, 0, '2021-11-20 15:20:38'),
(553, 141, 4, 'uploads/141/4/24.png', NULL, '24.png', NULL, 0, '2021-11-20 15:20:38'),
(554, 141, 4, 'uploads/141/4/25.png', NULL, '25.png', NULL, 0, '2021-11-20 15:20:38'),
(555, 141, 4, 'uploads/141/4/26.png', NULL, '26.png', NULL, 0, '2021-11-20 15:20:38'),
(556, 141, 4, 'uploads/141/4/27.png', NULL, '27.png', NULL, 0, '2021-11-20 15:20:38'),
(557, 141, 4, 'uploads/141/4/28.png', NULL, '28.png', NULL, 0, '2021-11-20 15:20:38'),
(558, 141, 4, 'uploads/141/4/29.png', NULL, '29.png', NULL, 0, '2021-11-20 15:20:38'),
(559, 141, 4, 'uploads/141/4/30.png', NULL, '30.png', NULL, 0, '2021-11-20 15:20:38'),
(560, 141, 4, 'uploads/141/4/31.png', NULL, '31.png', NULL, 0, '2021-11-20 15:20:38'),
(561, 141, 4, 'uploads/141/4/32.png', NULL, '32.png', NULL, 0, '2021-11-20 15:20:38'),
(562, 141, 4, 'uploads/141/4/33.png', NULL, '33.png', NULL, 0, '2021-11-20 15:20:38'),
(563, 141, 4, 'uploads/141/4/34.png', NULL, '34.png', NULL, 0, '2021-11-20 15:20:38'),
(564, 141, 4, 'uploads/141/4/35.png', NULL, '35.png', NULL, 0, '2021-11-20 15:20:38'),
(565, 141, 4, 'uploads/141/4/36.png', NULL, '36.png', NULL, 0, '2021-11-20 15:20:38'),
(566, 141, 5, 'uploads/141/5/37.png', NULL, '37.png', NULL, 0, '2021-11-20 15:22:01'),
(567, 141, 5, 'uploads/141/5/38.png', NULL, '38.png', NULL, 0, '2021-11-20 15:22:01'),
(568, 141, 5, 'uploads/141/5/39.png', NULL, '39.png', NULL, 0, '2021-11-20 15:22:01'),
(569, 141, 6, 'uploads/141/6/40.png', NULL, '40.png', NULL, 0, '2021-11-20 15:22:54'),
(570, 141, 6, 'uploads/141/6/41.png', NULL, '41.png', NULL, 0, '2021-11-20 15:22:54'),
(571, 141, 8, 'uploads/141/8/42.png', NULL, '42.png', NULL, 0, '2021-11-20 15:25:05'),
(572, 141, 8, 'uploads/141/8/43.png', NULL, '43.png', NULL, 0, '2021-11-20 15:25:05'),
(573, 143, 1, 'uploads/143/1/1.png', NULL, '1.png', NULL, 0, '2021-11-20 16:03:44'),
(575, 143, 2, 'uploads/143/2/3.png', NULL, '3.png', NULL, 0, '2021-11-20 16:04:37'),
(576, 143, 3, 'uploads/143/3/4.png', NULL, '4.png', NULL, 0, '2021-11-20 16:05:52'),
(577, 143, 3, 'uploads/143/3/5.png', NULL, '5.png', NULL, 0, '2021-11-20 16:05:52'),
(578, 143, 4, 'uploads/143/4/6.png', NULL, '6.png', NULL, 0, '2021-11-20 16:08:47'),
(579, 143, 4, 'uploads/143/4/7.png', NULL, '7.png', NULL, 0, '2021-11-20 16:08:47'),
(580, 143, 4, 'uploads/143/4/8.png', NULL, '8.png', NULL, 0, '2021-11-20 16:08:47'),
(581, 143, 5, 'uploads/143/5/9.png', NULL, '9.png', NULL, 0, '2021-11-20 16:09:59'),
(582, 143, 6, 'uploads/143/6/10.png', NULL, '10.png', NULL, 0, '2021-11-20 16:11:12'),
(583, 143, 8, 'uploads/143/8/10.png', NULL, '10.png', NULL, 0, '2021-11-20 16:12:30'),
(584, 144, 1, 'uploads/144/1/1.png', NULL, '1.png', NULL, 0, '2021-11-22 12:53:48'),
(585, 144, 1, 'uploads/144/1/2.png', NULL, '2.png', NULL, 0, '2021-11-22 12:53:48'),
(586, 144, 1, 'uploads/144/1/3.png', NULL, '3.png', NULL, 0, '2021-11-22 12:53:48'),
(587, 144, 1, 'uploads/144/1/4.png', NULL, '4.png', NULL, 0, '2021-11-22 12:53:49'),
(588, 144, 2, 'uploads/144/2/5.png', NULL, '5.png', NULL, 0, '2021-11-22 13:18:05'),
(589, 144, 4, 'uploads/144/4/6.png', NULL, '6.png', NULL, 0, '2021-11-22 13:23:36'),
(590, 144, 4, 'uploads/144/4/7.png', NULL, '7.png', NULL, 0, '2021-11-22 13:23:36'),
(591, 144, 6, 'uploads/144/6/8.png', NULL, '8.png', NULL, 0, '2021-11-22 16:56:15'),
(595, 145, 1, 'uploads/145/1/1.png', NULL, '1.png', NULL, 0, '2021-11-24 07:17:56'),
(596, 145, 1, 'uploads/145/1/2.png', NULL, '2.png', NULL, 0, '2021-11-24 07:17:56'),
(597, 145, 1, 'uploads/145/1/3.png', NULL, '3.png', NULL, 0, '2021-11-24 07:17:56'),
(598, 145, 1, 'uploads/145/1/4.png', NULL, '4.png', NULL, 0, '2021-11-24 07:17:56'),
(599, 145, 3, 'uploads/145/3/5.png', NULL, '5.png', NULL, 0, '2021-11-24 07:20:09'),
(600, 145, 3, 'uploads/145/3/6.png', NULL, '6.png', NULL, 0, '2021-11-24 07:20:09'),
(601, 145, 3, 'uploads/145/3/7.png', NULL, '7.png', NULL, 0, '2021-11-24 07:20:09'),
(602, 145, 6, 'uploads/145/6/8.png', NULL, '8.png', NULL, 0, '2021-11-24 07:21:29'),
(603, 145, 6, 'uploads/145/6/9.png', NULL, '9.png', NULL, 0, '2021-11-24 07:21:29'),
(604, 145, 6, 'uploads/145/6/10.png', NULL, '10.png', NULL, 0, '2021-11-24 07:21:29'),
(605, 143, 1, 'uploads/143/1/2.png', NULL, '2.png', NULL, 0, '2021-11-27 20:11:26'),
(606, 118, 21, 'uploads/118/CamScanner 11-08-2021 07.50_1.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(607, 121, 21, 'uploads/121/IMG_3361.jpeg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(609, 127, 21, 'uploads/127/46.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(610, 128, 21, 'uploads/128/21.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(611, 129, 21, 'uploads/129/16.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(612, 130, 21, 'uploads/130/26.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(613, 131, 21, 'uploads/131/46.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(614, 132, 21, 'uploads/132/6.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(615, 133, 21, 'uploads/133/16.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(616, 135, 21, 'uploads/135/13.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(617, 136, 21, 'uploads/136/10.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(618, 137, 21, 'uploads/137/10.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(619, 138, 21, 'uploads/138/8.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(620, 139, 21, 'uploads/139/33.png', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(621, 140, 21, 'uploads/140/31.png', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(622, 141, 21, 'uploads/141/44.png', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(623, 143, 21, 'uploads/143/11.png', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(624, 144, 21, 'uploads/144/10.png', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(625, 145, 21, 'uploads/145/12.png', NULL, 'Imagen', NULL, 0, '2021-11-28 03:53:49'),
(637, 118, 21, 'uploads/118/REVERSO DE ACTA.png', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(638, 121, 21, 'uploads/121/IMG_3362.jpeg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(639, 127, 21, 'uploads/127/47.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(640, 129, 21, 'uploads/129/17.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(641, 131, 21, 'uploads/131/47.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(642, 132, 21, 'uploads/132/7.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(643, 133, 21, 'uploads/133/17.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(644, 135, 21, 'uploads/135/14.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(645, 136, 21, 'uploads/136/11.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(646, 137, 21, 'uploads/137/11.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(647, 138, 21, 'uploads/138/9.jpg', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(648, 139, 21, 'uploads/139/34.png', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(649, 140, 21, 'uploads/140/32.png', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(650, 145, 21, 'uploads/145/13.png', NULL, 'Imagen', NULL, 0, '2021-11-28 03:54:47'),
(651, 146, 1, 'uploads/146/1/1.png', NULL, '1.png', NULL, 0, '2021-12-06 20:25:17'),
(652, 146, 1, 'uploads/146/1/2.png', NULL, '2.png', NULL, 0, '2021-12-06 20:25:18');
INSERT INTO `inf_cumplimiento_img` (`nId`, `nIdInforme`, `nIdCumplimiento`, `cRuta`, `cExt`, `cNombre`, `cDescripcion`, `nFlag`, `dRegistro`) VALUES
(653, 146, 6, 'uploads/146/6/3.png', NULL, '3.png', NULL, 0, '2021-12-06 20:33:31'),
(654, 146, 6, 'uploads/146/6/4.png', NULL, '4.png', NULL, 0, '2021-12-06 20:33:31'),
(655, 146, 8, 'uploads/146/8/5.png', NULL, '5.png', NULL, 0, '2021-12-06 20:46:16'),
(656, 146, 8, 'uploads/146/8/6.png', NULL, '6.png', NULL, 0, '2021-12-06 20:46:16'),
(657, 146, 21, 'uploads/146/219.png', NULL, '9.png', NULL, 0, '2021-12-06 21:01:20'),
(658, 149, 1, 'uploads/149/1/WhatsApp Image 2021-12-07 at 12.06.03 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.03 AM (1).jpeg', NULL, 0, '2021-12-09 20:14:30'),
(659, 149, 1, 'uploads/149/1/WhatsApp Image 2021-12-07 at 12.06.04 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.04 AM (1).jpeg', NULL, 0, '2021-12-09 20:14:54'),
(660, 149, 1, 'uploads/149/1/WhatsApp Image 2021-12-07 at 12.06.04 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.04 AM.jpeg', NULL, 0, '2021-12-09 20:14:54'),
(661, 149, 1, 'uploads/149/1/WhatsApp Image 2021-12-07 at 12.06.06 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.06 AM.jpeg', NULL, 0, '2021-12-09 20:15:14'),
(662, 149, 1, 'uploads/149/1/WhatsApp Image 2021-12-07 at 12.06.07 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.07 AM (1).jpeg', NULL, 0, '2021-12-09 20:15:14'),
(663, 149, 1, 'uploads/149/1/WhatsApp Image 2021-12-07 at 12.06.07 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.07 AM.jpeg', NULL, 0, '2021-12-09 20:15:14'),
(664, 149, 1, 'uploads/149/1/WhatsApp Image 2021-12-07 at 12.06.03 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.03 AM.jpeg', NULL, 0, '2021-12-09 20:15:29'),
(665, 149, 3, 'uploads/149/3/WhatsApp Image 2021-12-07 at 12.06.14 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.14 AM.jpeg', NULL, 0, '2021-12-09 20:17:27'),
(666, 149, 3, 'uploads/149/3/WhatsApp Image 2021-12-07 at 12.06.13 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.13 AM.jpeg', NULL, 0, '2021-12-09 20:17:41'),
(667, 149, 3, 'uploads/149/3/WhatsApp Image 2021-12-07 at 12.06.15 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.15 AM.jpeg', NULL, 0, '2021-12-09 20:17:58'),
(668, 149, 3, 'uploads/149/3/WhatsApp Image 2021-12-07 at 12.06.13 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.13 AM (1).jpeg', NULL, 0, '2021-12-09 20:18:17'),
(669, 149, 3, 'uploads/149/3/WhatsApp Image 2021-12-07 at 12.06.11 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.11 AM.jpeg', NULL, 0, '2021-12-09 20:19:10'),
(670, 149, 3, 'uploads/149/3/WhatsApp Image 2021-12-07 at 12.06.12 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.12 AM.jpeg', NULL, 0, '2021-12-09 20:19:10'),
(671, 149, 3, 'uploads/149/3/WhatsApp Image 2021-12-07 at 12.06.13 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.13 AM (1).jpeg', NULL, 0, '2021-12-09 20:19:10'),
(672, 149, 3, 'uploads/149/3/WhatsApp Image 2021-12-07 at 12.06.14 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.14 AM (1).jpeg', NULL, 0, '2021-12-09 20:19:10'),
(673, 149, 4, 'uploads/149/4/WhatsApp Image 2021-12-07 at 12.08.12 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.08.12 AM (1).jpeg', NULL, 0, '2021-12-09 20:22:24'),
(674, 149, 4, 'uploads/149/4/WhatsApp Image 2021-12-07 at 12.08.12 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.08.12 AM.jpeg', NULL, 0, '2021-12-09 20:22:24'),
(675, 149, 4, 'uploads/149/4/WhatsApp Image 2021-12-07 at 12.08.13 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.08.13 AM (1).jpeg', NULL, 0, '2021-12-09 20:22:24'),
(676, 149, 4, 'uploads/149/4/WhatsApp Image 2021-12-07 at 12.08.13 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.08.13 AM.jpeg', NULL, 0, '2021-12-09 20:22:24'),
(677, 149, 4, 'uploads/149/4/WhatsApp Image 2021-12-07 at 12.08.14 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.08.14 AM (1).jpeg', NULL, 0, '2021-12-09 20:22:24'),
(678, 149, 4, 'uploads/149/4/WhatsApp Image 2021-12-07 at 12.08.14 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.08.14 AM.jpeg', NULL, 0, '2021-12-09 20:22:24'),
(679, 149, 5, 'uploads/149/5/WhatsApp Image 2021-12-07 at 12.06.03 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.03 AM (1).jpeg', NULL, 0, '2021-12-09 20:23:46'),
(680, 149, 6, 'uploads/149/6/WhatsApp Image 2021-12-07 at 12.06.04 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.04 AM (1).jpeg', NULL, 0, '2021-12-09 20:24:45'),
(681, 149, 6, 'uploads/149/6/WhatsApp Image 2021-12-07 at 12.06.04 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.04 AM.jpeg', NULL, 0, '2021-12-09 20:24:45'),
(682, 149, 6, 'uploads/149/6/WhatsApp Image 2021-12-07 at 12.06.10 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.10 AM.jpeg', NULL, 0, '2021-12-09 20:25:02'),
(683, 149, 8, 'uploads/149/8/20211208_100659.jpg', NULL, '20211208_100659.jpg', NULL, 0, '2021-12-09 20:27:09'),
(684, 149, 8, 'uploads/149/8/20211208_100738.jpg', NULL, '20211208_100738.jpg', NULL, 0, '2021-12-09 20:27:09'),
(685, 149, 8, 'uploads/149/8/20211208_100758.jpg', NULL, '20211208_100758.jpg', NULL, 0, '2021-12-09 20:27:09'),
(686, 149, 8, 'uploads/149/8/WhatsApp Image 2021-12-07 at 12.06.05 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.05 AM (1).jpeg', NULL, 0, '2021-12-09 20:27:09'),
(688, 149, 3, 'uploads/149/3/WhatsApp Image 2021-12-07 at 12.06.09 AM (1).jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.09 AM (1).jpeg', NULL, 0, '2021-12-09 21:39:44'),
(689, 149, 3, 'uploads/149/3/WhatsApp Image 2021-12-07 at 12.06.09 AM.jpeg', NULL, 'WhatsApp Image 2021-12-07 at 12.06.09 AM.jpeg', NULL, 0, '2021-12-09 21:39:44'),
(690, 149, 4, 'uploads/149/4/WhatsApp Image 2021-12-09 at 9.47.35 PM (1).jpeg', NULL, 'WhatsApp Image 2021-12-09 at 9.47.35 PM (1).jpeg', NULL, 0, '2021-12-09 21:52:35'),
(691, 149, 4, 'uploads/149/4/WhatsApp Image 2021-12-09 at 9.47.35 PM.jpeg', NULL, 'WhatsApp Image 2021-12-09 at 9.47.35 PM.jpeg', NULL, 0, '2021-12-09 21:52:35'),
(692, 149, 21, 'uploads/149/2120211208_100801.jpg', NULL, '20211208_100801.jpg', NULL, 0, '2021-12-09 21:53:15'),
(693, 150, 12, 'uploads/150/12/ct-1.jpg', NULL, 'ct-1.jpg', NULL, 0, '2021-12-14 19:18:04'),
(694, 150, 19, 'uploads/150/19/ct-2.jpg', NULL, 'ct-2.jpg', NULL, 0, '2021-12-14 19:32:18'),
(695, 150, 21, 'uploads/150/21ct-3.jpg', NULL, 'ct-3.jpg', NULL, 0, '2021-12-14 19:32:54'),
(696, 159, 1, 'uploads/159/1/1.png', NULL, '1.png', NULL, 0, '2021-12-15 12:00:58'),
(697, 159, 1, 'uploads/159/1/2.png', NULL, '2.png', NULL, 0, '2021-12-15 12:00:58'),
(698, 159, 1, 'uploads/159/1/3.png', NULL, '3.png', NULL, 0, '2021-12-15 12:00:58'),
(699, 159, 1, 'uploads/159/1/4.png', NULL, '4.png', NULL, 0, '2021-12-15 12:00:58'),
(700, 159, 1, 'uploads/159/1/5.png', NULL, '5.png', NULL, 0, '2021-12-15 12:00:58'),
(701, 159, 1, 'uploads/159/1/6.png', NULL, '6.png', NULL, 0, '2021-12-15 12:00:58'),
(702, 159, 1, 'uploads/159/1/7.png', NULL, '7.png', NULL, 0, '2021-12-15 12:00:58'),
(703, 159, 1, 'uploads/159/1/8.png', NULL, '8.png', NULL, 0, '2021-12-15 12:00:59'),
(704, 159, 1, 'uploads/159/1/9.png', NULL, '9.png', NULL, 0, '2021-12-15 12:00:59'),
(705, 159, 1, 'uploads/159/1/10.png', NULL, '10.png', NULL, 0, '2021-12-15 12:00:59'),
(706, 159, 1, 'uploads/159/1/11.png', NULL, '11.png', NULL, 0, '2021-12-15 12:00:59'),
(707, 159, 1, 'uploads/159/1/12.png', NULL, '12.png', NULL, 0, '2021-12-15 12:00:59'),
(708, 159, 4, 'uploads/159/4/13.png', NULL, '13.png', NULL, 0, '2021-12-15 12:03:55'),
(709, 159, 4, 'uploads/159/4/14.png', NULL, '14.png', NULL, 0, '2021-12-15 12:03:55'),
(710, 159, 4, 'uploads/159/4/15.png', NULL, '15.png', NULL, 0, '2021-12-15 12:03:55'),
(711, 159, 4, 'uploads/159/4/16.png', NULL, '16.png', NULL, 0, '2021-12-15 12:03:55'),
(712, 159, 6, 'uploads/159/6/17.png', NULL, '17.png', NULL, 0, '2021-12-15 12:05:13'),
(713, 159, 6, 'uploads/159/6/18.png', NULL, '18.png', NULL, 0, '2021-12-15 12:05:13'),
(714, 159, 6, 'uploads/159/6/19.png', NULL, '19.png', NULL, 0, '2021-12-15 12:05:13'),
(715, 159, 6, 'uploads/159/6/20.png', NULL, '20.png', NULL, 0, '2021-12-15 12:05:13'),
(716, 159, 8, 'uploads/159/8/21.png', NULL, '21.png', NULL, 0, '2021-12-15 12:06:54'),
(717, 159, 8, 'uploads/159/8/22.png', NULL, '22.png', NULL, 0, '2021-12-15 12:06:54'),
(718, 159, 21, 'uploads/159/2123.png', NULL, '23.png', NULL, 0, '2021-12-15 12:07:27'),
(719, 126, 21, 'uploads/126/21ct-3.jpg', NULL, 'ct-3.jpg', NULL, 0, '2021-12-15 22:05:01'),
(721, 160, 1, 'uploads/160/1/1.jpg', NULL, '1.jpg', NULL, 0, '2022-01-24 11:51:50'),
(722, 160, 1, 'uploads/160/1/2.jpg', NULL, '2.jpg', NULL, 0, '2022-01-24 11:51:50'),
(723, 160, 1, 'uploads/160/1/3.jpg', NULL, '3.jpg', NULL, 0, '2022-01-24 11:51:50'),
(724, 160, 1, 'uploads/160/1/4.jpg', NULL, '4.jpg', NULL, 0, '2022-01-24 11:51:50'),
(725, 160, 1, 'uploads/160/1/5.jpg', NULL, '5.jpg', NULL, 0, '2022-01-24 11:51:50'),
(726, 160, 1, 'uploads/160/1/6.jpg', NULL, '6.jpg', NULL, 0, '2022-01-24 11:51:50'),
(727, 160, 1, 'uploads/160/1/7.jpg', NULL, '7.jpg', NULL, 0, '2022-01-24 11:51:50'),
(728, 160, 2, 'uploads/160/2/8.jpg', NULL, '8.jpg', NULL, 0, '2022-01-24 11:55:39'),
(729, 160, 2, 'uploads/160/2/9.jpg', NULL, '9.jpg', NULL, 0, '2022-01-24 11:55:39'),
(730, 160, 2, 'uploads/160/2/10.jpg', NULL, '10.jpg', NULL, 0, '2022-01-24 11:55:39'),
(731, 160, 3, 'uploads/160/3/11.jpg', NULL, '11.jpg', NULL, 0, '2022-01-24 12:00:14'),
(732, 160, 3, 'uploads/160/3/12.jpg', NULL, '12.jpg', NULL, 0, '2022-01-24 12:00:14'),
(733, 160, 3, 'uploads/160/3/13.jpg', NULL, '13.jpg', NULL, 0, '2022-01-24 12:00:14'),
(734, 160, 3, 'uploads/160/3/14.jpg', NULL, '14.jpg', NULL, 0, '2022-01-24 12:00:14'),
(735, 160, 3, 'uploads/160/3/15.jpg', NULL, '15.jpg', NULL, 0, '2022-01-24 12:00:14'),
(736, 160, 3, 'uploads/160/3/16.jpg', NULL, '16.jpg', NULL, 0, '2022-01-24 12:00:14'),
(737, 160, 3, 'uploads/160/3/17.jpg', NULL, '17.jpg', NULL, 0, '2022-01-24 12:00:14'),
(738, 160, 3, 'uploads/160/3/18.jpg', NULL, '18.jpg', NULL, 0, '2022-01-24 12:00:14'),
(739, 160, 3, 'uploads/160/3/19.jpg', NULL, '19.jpg', NULL, 0, '2022-01-24 12:00:14'),
(740, 160, 4, 'uploads/160/4/20.jpg', NULL, '20.jpg', NULL, 0, '2022-01-24 12:03:41'),
(741, 160, 4, 'uploads/160/4/21.jpg', NULL, '21.jpg', NULL, 0, '2022-01-24 12:03:41'),
(742, 160, 4, 'uploads/160/4/22.jpg', NULL, '22.jpg', NULL, 0, '2022-01-24 12:03:41'),
(743, 160, 4, 'uploads/160/4/23.jpg', NULL, '23.jpg', NULL, 0, '2022-01-24 12:03:41'),
(744, 160, 4, 'uploads/160/4/24.jpg', NULL, '24.jpg', NULL, 0, '2022-01-24 12:03:41'),
(745, 160, 4, 'uploads/160/4/25.jpg', NULL, '25.jpg', NULL, 0, '2022-01-24 12:03:41'),
(746, 160, 4, 'uploads/160/4/26.jpg', NULL, '26.jpg', NULL, 0, '2022-01-24 12:03:41'),
(747, 160, 4, 'uploads/160/4/27.jpg', NULL, '27.jpg', NULL, 0, '2022-01-24 12:03:41'),
(748, 160, 4, 'uploads/160/4/28.jpg', NULL, '28.jpg', NULL, 0, '2022-01-24 12:03:41'),
(749, 160, 5, 'uploads/160/5/29.jpg', NULL, '29.jpg', NULL, 0, '2022-01-24 12:08:27'),
(750, 160, 5, 'uploads/160/5/30.jpg', NULL, '30.jpg', NULL, 0, '2022-01-24 12:08:27'),
(751, 160, 6, 'uploads/160/6/31.jpg', NULL, '31.jpg', NULL, 0, '2022-01-24 12:10:07'),
(752, 160, 6, 'uploads/160/6/32.jpg', NULL, '32.jpg', NULL, 0, '2022-01-24 12:10:07'),
(753, 160, 8, 'uploads/160/8/33.jpg', NULL, '33.jpg', NULL, 0, '2022-01-24 12:20:07'),
(754, 160, 8, 'uploads/160/8/34.jpg', NULL, '34.jpg', NULL, 0, '2022-01-24 12:20:08'),
(755, 160, 8, 'uploads/160/8/35.jpg', NULL, '35.jpg', NULL, 0, '2022-01-24 12:20:08'),
(756, 160, 8, 'uploads/160/8/36.jpg', NULL, '36.jpg', NULL, 0, '2022-01-24 12:20:08'),
(757, 160, 8, 'uploads/160/8/37.jpg', NULL, '37.jpg', NULL, 0, '2022-01-24 12:20:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inf_normas`
--

CREATE TABLE `inf_normas` (
  `nId` int(11) DEFAULT NULL,
  `nidEmpresa_Norma` int(11) DEFAULT NULL,
  `cObservacion` varchar(500) DEFAULT NULL,
  `nFlag` int(11) DEFAULT NULL,
  `dRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inf_trabajadoressupervisados_det`
--

CREATE TABLE `inf_trabajadoressupervisados_det` (
  `nId` int(11) NOT NULL,
  `nIdInforme` int(11) DEFAULT NULL,
  `nId_E_C_T` int(11) NOT NULL,
  `nId_emp_nor_obs` int(11) NOT NULL,
  `dRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `nFlag` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inf_trabajadoressupervisados_det`
--

INSERT INTO `inf_trabajadoressupervisados_det` (`nId`, `nIdInforme`, `nId_E_C_T`, `nId_emp_nor_obs`, `dRegistro`, `nFlag`) VALUES
(22, 72, 6, 1, '2021-09-20 18:30:50', 0),
(23, 73, 6, 1, '2021-09-20 20:30:12', 0),
(24, 73, 8, 1, '2021-09-20 20:36:54', 0),
(25, 80, 1, 1, '2021-09-25 11:32:30', 0),
(26, 80, 1, 4, '2021-09-25 11:32:37', 0),
(27, 84, 1, 1, '2021-09-27 01:33:01', 0),
(28, 90, 1, 1, '2021-10-05 12:29:13', 0),
(29, 89, 16, 1, '2021-10-25 00:18:30', 1),
(30, 89, 16, 1, '2021-10-25 00:18:55', 0),
(31, 116, 17, 23, '2021-11-08 02:17:39', 0),
(32, 118, 20, 1, '2021-11-10 10:22:33', 0),
(33, 121, 21, 52, '2021-11-10 22:40:31', 0),
(34, 124, 1, 4, '2021-11-11 01:20:22', 0),
(35, 126, 22, 117, '2021-11-16 07:34:32', 0),
(36, 126, 23, 117, '2021-11-16 07:35:05', 0),
(37, 126, 24, 117, '2021-11-16 07:35:29', 0),
(38, 126, 25, 117, '2021-11-16 07:36:12', 0),
(39, 126, 26, 117, '2021-11-16 07:36:29', 0),
(40, 126, 27, 117, '2021-11-16 07:36:43', 0),
(41, 126, 28, 117, '2021-11-16 07:36:57', 0),
(42, 126, 29, 117, '2021-11-16 07:37:13', 0),
(43, 126, 30, 117, '2021-11-16 07:37:27', 0),
(44, 126, 31, 117, '2021-11-16 07:41:17', 0),
(45, 128, 32, 5, '2021-11-16 19:50:44', 0),
(46, 128, 33, 117, '2021-11-16 19:50:57', 0),
(47, 128, 34, 1, '2021-11-16 19:51:07', 0),
(48, 132, 47, 117, '2021-11-17 13:14:16', 0),
(49, 132, 47, 117, '2021-11-17 13:14:17', 1),
(50, 135, 48, 117, '2021-11-17 22:08:58', 0),
(51, 135, 49, 43, '2021-11-17 22:09:24', 0),
(52, 135, 50, 1, '2021-11-17 22:09:46', 0),
(53, 135, 52, 117, '2021-11-17 22:10:16', 0),
(54, 135, 53, 1, '2021-11-17 22:11:12', 0),
(55, 135, 54, 1, '2021-11-17 22:11:21', 0),
(56, 136, 57, 117, '2021-11-17 23:03:32', 0),
(57, 136, 57, 117, '2021-11-17 23:03:35', 1),
(58, 136, 56, 1, '2021-11-17 23:03:53', 0),
(59, 136, 53, 27, '2021-11-17 23:04:43', 0),
(60, 137, 60, 18, '2021-11-17 23:38:30', 0),
(61, 137, 60, 22, '2021-11-17 23:38:43', 0),
(62, 138, 61, 1, '2021-11-19 17:02:56', 0),
(63, 139, 62, 1, '2021-11-19 18:21:12', 0),
(64, 139, 63, 1, '2021-11-19 18:21:18', 0),
(65, 140, 64, 117, '2021-11-19 20:16:13', 0),
(66, 140, 65, 1, '2021-11-19 20:16:28', 0),
(67, 140, 66, 1, '2021-11-19 20:16:42', 0),
(68, 140, 68, 1, '2021-11-19 20:16:50', 0),
(69, 141, 69, 117, '2021-11-20 15:38:40', 0),
(70, 141, 70, 1, '2021-11-20 15:38:54', 0),
(71, 141, 71, 1, '2021-11-20 15:39:10', 0),
(72, 141, 72, 1, '2021-11-20 15:39:23', 0),
(73, 141, 26, 1, '2021-11-20 15:39:35', 0),
(74, 141, 74, 1, '2021-11-20 15:39:49', 0),
(75, 141, 75, 1, '2021-11-20 15:40:02', 0),
(76, 141, 30, 1, '2021-11-20 15:40:19', 0),
(77, 141, 31, 1, '2021-11-20 15:40:31', 0),
(78, 141, 78, 1, '2021-11-20 15:40:43', 0),
(79, 141, 79, 1, '2021-11-20 15:40:52', 0),
(80, 141, 80, 1, '2021-11-20 15:41:07', 0),
(81, 141, 81, 1, '2021-11-20 15:41:22', 0),
(82, 143, 82, 117, '2021-11-20 16:14:35', 0),
(83, 143, 83, 1, '2021-11-20 16:14:41', 1),
(84, 143, 82, 11, '2021-11-20 22:21:41', 0),
(85, 140, 9, 20, '2021-11-21 11:37:01', 0),
(86, 144, 84, 37, '2021-11-22 16:59:33', 0),
(87, 144, 84, 40, '2021-11-22 16:59:50', 0),
(88, 145, 85, 19, '2021-11-24 07:25:34', 0),
(89, 145, 86, 18, '2021-11-24 07:26:00', 0),
(90, 145, 87, 117, '2021-11-24 07:26:35', 0),
(91, 118, 20, 2, '2021-11-28 04:46:54', 0),
(92, 146, 88, 54, '2021-12-06 20:48:00', 0),
(93, 149, 89, 117, '2021-12-09 20:35:10', 0),
(94, 149, 90, 1, '2021-12-09 20:35:41', 1),
(95, 149, 91, 1, '2021-12-09 20:35:49', 1),
(96, 149, 92, 1, '2021-12-09 20:35:56', 1),
(97, 149, 93, 1, '2021-12-09 20:36:02', 1),
(98, 149, 90, 117, '2021-12-09 20:36:29', 0),
(99, 149, 91, 117, '2021-12-09 20:37:02', 0),
(100, 149, 92, 117, '2021-12-09 20:37:22', 0),
(101, 149, 93, 117, '2021-12-09 20:37:40', 0),
(102, 159, 94, 117, '2021-12-15 12:10:15', 0),
(103, 159, 95, 117, '2021-12-15 12:10:32', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inf_vehiculo_det`
--

CREATE TABLE `inf_vehiculo_det` (
  `nId` int(11) NOT NULL,
  `nIdInforme` int(11) DEFAULT NULL,
  `nIdEmp_Veh` int(11) DEFAULT NULL,
  `nId_Emp_nor_obs` int(11) DEFAULT NULL,
  `dRegistro` datetime DEFAULT current_timestamp(),
  `nFlag` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inf_vehiculo_det`
--

INSERT INTO `inf_vehiculo_det` (`nId`, `nIdInforme`, `nIdEmp_Veh`, `nId_Emp_nor_obs`, `dRegistro`, `nFlag`) VALUES
(13, 94, 20, 2, '2021-10-12 09:57:22', 1),
(14, 95, 21, 2, '2021-10-23 14:16:51', 0),
(15, 89, 23, 2, '2021-10-25 00:19:45', 1),
(16, 89, 23, 2, '2021-10-25 00:20:00', 0),
(17, 116, 25, 71, '2021-11-08 02:21:26', 0),
(18, 116, 25, 73, '2021-11-08 02:35:44', 0),
(19, 121, 32, 71, '2021-11-10 22:41:07', 0),
(20, 124, 24, 72, '2021-11-11 01:20:31', 0),
(21, 126, 34, 118, '2021-11-16 07:44:15', 0),
(22, 126, 35, 118, '2021-11-16 07:44:24', 0),
(23, 140, 36, 118, '2021-11-19 20:24:11', 0),
(24, 141, 37, 118, '2021-11-20 15:41:40', 0),
(25, 141, 35, 71, '2021-11-20 15:42:20', 0),
(26, 141, 39, 71, '2021-11-20 15:42:28', 0),
(27, 143, 40, 118, '2021-11-20 16:18:32', 1),
(28, 143, 40, 88, '2021-11-20 22:17:27', 0),
(29, 145, 41, 118, '2021-11-24 07:31:29', 0),
(30, 149, 42, 118, '2021-12-09 20:38:27', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `nId` int(11) NOT NULL,
  `cDoi` varchar(8) NOT NULL,
  `cNombres` varchar(250) DEFAULT NULL,
  `cApellidos` varchar(250) DEFAULT NULL,
  `nEstado` int(11) DEFAULT 1,
  `cUsuario` varchar(56) DEFAULT NULL,
  `cPassword` varchar(32765) DEFAULT NULL,
  `dRegistro` datetime DEFAULT current_timestamp(),
  `dDesactiva` datetime DEFAULT NULL,
  `nTipoUsuario` int(11) DEFAULT 1,
  `bAdmin` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`nId`, `cDoi`, `cNombres`, `cApellidos`, `nEstado`, `cUsuario`, `cPassword`, `dRegistro`, `dDesactiva`, `nTipoUsuario`, `bAdmin`) VALUES
(1, '70885762', 'Jhonatan', 'Cuñachi', 1, 'jhobri', '21232f297a57a5a743894a0e4a801fc3', '2021-06-25 23:35:44', NULL, 0, 1),
(2, '71856988', 'HECTOR', 'ZABALA ZABEDRA', -1, NULL, '25f9e794323b453885f5181f1', '2021-06-26 01:38:55', NULL, 1, 0),
(3, '71856984', 'Alan Andres', 'García Castillo', 1, 'angc', '756cbe451181d21cca3cd86dd21daa1f', '2021-06-26 01:41:49', NULL, 0, 1),
(12, '80983456', 'RUYTELL', 'CASADO TORRES', 1, NULL, NULL, '2021-07-21 20:54:27', NULL, 0, 1),
(13, '80983452', 'ALAN ANDRES', 'GARCÍA PEREZ', -1, NULL, NULL, '2021-07-21 20:56:11', NULL, 1, 0),
(17, '40980455', 'ROMEO ', 'GUERRA CHUQUIPIONDO', 1, 'ROMEO', '2b320d87addac4f2f36b3c4f0cdda316', '2021-08-03 15:04:29', NULL, 0, 1),
(18, '44174808', 'RICHARD ', 'BRAVO LOPEZ', 1, '44174808', 'ffe0429bfc5bb172b52640d92afac58a', '2021-09-03 20:14:46', NULL, 1, 0),
(19, '16740328', 'HENRY SANDOVAL VILLEGAS', '', 1, NULL, 'ffe0429bfc5bb172b52640d92afac58a', '2021-09-03 20:15:58', NULL, 1, 0),
(20, '44335153', 'EDWIN ', 'MEDINA ROJAS', 1, '44335153', 'ffe0429bfc5bb172b52640d92afac58a', '2021-09-03 20:16:46', NULL, 1, 0),
(33, '12345678', 'JESUS  ', 'CASTRO PISCOYA', -1, NULL, NULL, '2021-09-16 02:23:47', NULL, 1, 0),
(34, '01010101', 'REPONSABLE PRUEBA', '-------', 1, NULL, NULL, '2021-09-18 16:53:46', NULL, 1, 0),
(35, '12345678', 'ROLANDO', 'GUTIERREZ SANDOVAL', 1, NULL, NULL, '2021-09-18 18:16:42', NULL, 1, 0),
(36, '12345678', 'AREVALO ALDANA HECTOR', 'CONDUCTOR', 1, NULL, NULL, '2021-09-20 18:09:23', NULL, 1, 0),
(37, '12345678', 'HECTOR ', 'AREVALO ALDANA', 1, NULL, NULL, '2021-09-20 18:23:34', NULL, 1, 0),
(38, '00000000', 'HECTOR ', 'AREVALO ALDANA', 1, NULL, NULL, '2021-09-20 18:26:54', NULL, 1, 0),
(39, '12345678', 'ROMEO', 'GUERRA', 1, NULL, NULL, '2021-09-20 20:35:09', NULL, 1, 0),
(40, '12345678', 'RICARDO ', 'PAREDES OJEDA', 1, NULL, NULL, '2021-09-20 20:55:57', NULL, 1, 0),
(41, '12345678', 'RICARDO ', 'PAREDES OJEDA', 1, NULL, NULL, '2021-09-20 20:56:42', NULL, 1, 0),
(42, '12345678', 'HENRY ', 'CHINCHAY CHOMBA', 1, NULL, NULL, '2021-09-20 20:57:12', NULL, 1, 0),
(43, '17613093', 'RAFAEL ', 'BOBADILLA INFANTE', 1, NULL, NULL, '2021-09-22 02:06:38', NULL, 1, 0),
(44, '43085864', 'OSCAR RAUL', 'AGIP URIARTE', 1, NULL, NULL, '2021-09-23 17:45:08', NULL, 1, 0),
(45, '11212122', 'sdfdfg', 'sdfsd', 1, NULL, NULL, '2021-09-25 19:33:32', NULL, 1, 0),
(46, '12345678', 'zzzzzzzzzzzzzzz', 'zzzzzzzzzzzzz', 1, NULL, NULL, '2021-09-27 01:21:12', NULL, 1, 0),
(47, '12345678', 'sssssssssss', 'ssssssssssssss', 1, NULL, NULL, '2021-09-27 01:21:55', NULL, 1, 0),
(48, '48026262', 'persona 1', 'apellido 1', 1, NULL, NULL, '2021-09-28 20:08:01', NULL, 1, 0),
(49, '12345678', 'responsable 22', 'suma de las cualidades', 1, NULL, NULL, '2021-09-28 20:08:30', NULL, 1, 0),
(50, '12345678', 'TTTTTTTTTTT', 'TTTTTTTTT', 1, NULL, NULL, '2021-10-01 10:13:09', NULL, 1, 0),
(51, '12345678', 'PRUEBA AS', 'ZZZZZZ', 1, NULL, NULL, '2021-10-01 18:36:52', NULL, 1, 0),
(52, '12345678', 'ñññññ', 'lllll', 1, NULL, NULL, '2021-10-01 19:14:05', NULL, 1, 0),
(53, '12345678', 'ING. JOSE', 'DELGADO', 1, NULL, NULL, '2021-10-02 14:21:01', NULL, 1, 0),
(54, '12345678', 'CARLOS', 'CUENCA VENTURA', 1, NULL, NULL, '2021-10-04 14:30:20', NULL, 1, 0),
(55, '40441445', 'CESAR MANUEL', 'NEVADO CASTAÑEDA', 1, NULL, NULL, '2021-10-07 16:12:09', NULL, 1, 0),
(56, '12345699', 'HECTOR', 'AREVALO ALDANA ', 1, NULL, NULL, '2021-10-07 16:22:02', NULL, 1, 0),
(57, '00000001', 'Patrick', 'Flores', 1, NULL, NULL, '2021-10-12 23:45:24', NULL, 1, 0),
(58, '01234567', 'mkmkmkmk', 'mkmkmkm', 1, NULL, NULL, '2021-10-22 22:07:37', NULL, 1, 0),
(59, '98765432', 'nuevskdfdfsdfsd', 'sdgsdfogksdlfg', 1, NULL, NULL, '2021-10-23 14:13:48', NULL, 1, 0),
(60, '12345678', 'gfgfgf', 'gfgfgfg', 1, NULL, NULL, '2021-10-25 00:18:11', NULL, 1, 0),
(61, '43520409', 'Marco', 'Corimanya Capitán', 1, NULL, NULL, '2021-10-29 19:20:11', NULL, 1, 0),
(62, '23569874', 'JUNIOR', 'MEGO ROJAS', 1, NULL, NULL, '2021-11-05 15:53:27', NULL, 1, 0),
(63, '71856988', 'GTGTRR', 'GTGTGT', 1, NULL, NULL, '2021-11-08 02:16:51', NULL, 1, 0),
(64, '60155001', 'DIOMARA ', 'CUBAS SAAVEDRA', 1, NULL, NULL, '2021-11-08 07:06:41', NULL, 1, 0),
(65, '80351021', 'TEOFANES', ' ZELADA TORRES', 1, NULL, NULL, '2021-11-09 23:17:54', NULL, 1, 0),
(66, '48027448', 'Personal de Pruebas', 'Personal de Pruebas', 1, NULL, NULL, '2021-11-10 09:51:20', NULL, 1, 0),
(67, '32165498', 'ANDRES', 'CASTILLO', 1, NULL, NULL, '2021-11-10 09:51:20', NULL, 1, 0),
(68, '48020202', 'Personal de Pruebas ', 'Personal de Pruebas', 1, NULL, NULL, '2021-11-10 10:22:26', NULL, 1, 0),
(69, '11111111', 'CARLOS ', 'GARCIA GONZALES', 1, NULL, NULL, '2021-11-10 21:01:23', NULL, 1, 0),
(70, '17450136', ' HENRY ALBERTO', 'HUERTAS FLORES', 1, NULL, NULL, '2021-11-10 22:38:24', NULL, 1, 0),
(71, '12345678', 'MARCO ', 'NUNURA CHUMAN', 1, NULL, NULL, '2021-11-15 15:31:45', NULL, 1, 0),
(72, '12345678', 'NEYCER', 'VILLEGAS RIMARACHIN', 1, NULL, NULL, '2021-11-15 20:25:52', NULL, 1, 0),
(73, '12345678', 'ERLAN', 'MUÑOZ VILLA ', 1, NULL, NULL, '2021-11-16 07:07:14', NULL, 1, 0),
(74, '12345678', 'JOSE ', 'HUAMANCHUMO NAZARIO', 1, NULL, NULL, '2021-11-16 07:12:47', NULL, 1, 0),
(75, '12345678', 'JOSE ', 'URUPEQUE GUERRERO', 1, NULL, NULL, '2021-11-16 07:15:06', NULL, 1, 0),
(76, '12345678', 'JOSE ', 'CHISCUL MONTEZA', 1, NULL, NULL, '2021-11-16 07:16:00', NULL, 1, 0),
(77, '12345678', 'WILLIAN ', 'ACOSTA BANCES', 1, NULL, NULL, '2021-11-16 07:16:30', NULL, 1, 0),
(78, '12345678', 'CRISTIAN ', 'MEJÍA AGUILAR', 1, NULL, NULL, '2021-11-16 07:17:01', NULL, 1, 0),
(79, '12345678', 'LUIS ', 'INCIO CASTILLO', 1, NULL, NULL, '2021-11-16 07:17:49', NULL, 1, 0),
(80, '12345678', 'TAYNER', 'MUÑOZ VILLA', 1, NULL, NULL, '2021-11-16 07:18:28', NULL, 1, 0),
(81, '12345678', 'JOSÉ ', 'MOLLEDA CUEVAS', 1, NULL, NULL, '2021-11-16 07:19:06', NULL, 1, 0),
(82, '12345678', 'MARCO', 'NUNURA CHUMAN', 1, NULL, NULL, '2021-11-16 07:19:44', NULL, 1, 0),
(83, '12345678', 'KARINA ISABEL', 'ALTAMIRANO VARGAS', 1, NULL, NULL, '2021-11-16 15:24:01', NULL, 1, 0),
(84, '12345678', 'LUPE ', 'CANTOS CULQUI', 1, NULL, NULL, '2021-11-16 19:49:18', NULL, 1, 0),
(85, '12345678', 'KARINA ISABEL ', 'ALTAMIRANO VARGAS', 1, NULL, NULL, '2021-11-16 19:49:47', NULL, 1, 0),
(86, '12345678', 'JULIO ANDRES ', 'SALDAÑA LLONTOP', 1, NULL, NULL, '2021-11-16 19:50:21', NULL, 1, 0),
(87, '12345678', 'VICTOR', 'GARCIA TAVARA', 1, NULL, NULL, '2021-11-16 23:56:10', NULL, 1, 0),
(88, '12345678', 'GREGORIO', 'ALAMAO VIDAURRE', 1, NULL, NULL, '2021-11-17 00:06:40', NULL, 1, 0),
(89, '12345678', 'CARLOS ', 'LIZA DIAZ', 1, NULL, NULL, '2021-11-17 00:27:50', NULL, 1, 0),
(90, '0000000', 'CASTRO', 'RUIZ MANUEL', 1, NULL, NULL, '2021-11-17 11:33:49', NULL, 1, 0),
(91, '12345678', 'MANUEL', 'CASTRO RUIZ', 1, NULL, NULL, '2021-11-17 11:42:07', NULL, 1, 0),
(92, '12345678', 'EDINSON', 'RAMOS RISCO', 1, NULL, NULL, '2021-11-17 11:42:38', NULL, 1, 0),
(93, '12345678', 'MARCO', 'BENITES VILCHERRES', 1, NULL, NULL, '2021-11-17 11:43:04', NULL, 1, 0),
(94, '12345678', 'JORGE', 'CHAPOÑAN ANGELES', 1, NULL, NULL, '2021-11-17 11:43:30', NULL, 1, 0),
(95, '12345678', 'GARI ', 'DELA CRUZ ROJAS ', 1, NULL, NULL, '2021-11-17 11:44:04', NULL, 1, 0),
(96, '12345678', 'HUGO ', 'COLORADO PEREZ', 1, NULL, NULL, '2021-11-17 11:44:48', NULL, 1, 0),
(97, '12345678', 'JEINER', 'FLORES MILIAN ', 1, NULL, NULL, '2021-11-17 11:45:23', NULL, 1, 0),
(98, '12345678', 'IMAN ', 'CESAR SEMINARIO', 1, NULL, NULL, '2021-11-17 11:45:54', NULL, 1, 0),
(99, '12345678', 'ALEX ', 'QUISPE ESPINOZA', 1, NULL, NULL, '2021-11-17 11:46:31', NULL, 1, 0),
(100, '12345678', 'MILBOR', 'CHUICA SEMINARIO', 1, NULL, NULL, '2021-11-17 11:47:01', NULL, 1, 0),
(101, '12345678', 'ESPERANZA', 'CARRERO HORNA', 1, NULL, NULL, '2021-11-17 13:13:56', NULL, 1, 0),
(102, '12345678', 'JUAN ', 'CERON', 1, NULL, NULL, '2021-11-17 21:51:15', NULL, 1, 0),
(103, '12345678', 'JULIO CESAR ', 'MAURICIO PEÑA', 1, NULL, NULL, '2021-11-17 22:05:06', NULL, 1, 0),
(104, '12345678', 'SEGUNDINO', 'DIAZ CARRASCO', 1, NULL, NULL, '2021-11-17 22:06:20', NULL, 1, 0),
(105, '12345678', 'NANDITO', 'BOBADILLA GIL', 1, NULL, NULL, '2021-11-17 22:06:53', NULL, 1, 0),
(106, '12345678', 'NANDITO', 'BOBADILLA GIL', 1, NULL, NULL, '2021-11-17 22:06:57', NULL, 1, 0),
(107, '12345678', 'ANANIAS ', 'TORRES QUISPE', 1, NULL, NULL, '2021-11-17 22:07:31', NULL, 1, 0),
(108, '12345678', 'ELBER', 'DELGADO VEGA', 1, NULL, NULL, '2021-11-17 22:08:07', NULL, 1, 0),
(109, '12345678', 'JULIO', 'FARRO DELGADO', 1, NULL, NULL, '2021-11-17 22:08:31', NULL, 1, 0),
(110, '12345678', 'EBER ', 'DELGADO VEGA', 1, NULL, NULL, '2021-11-17 22:10:56', NULL, 1, 0),
(111, '12345678', 'WILDER', 'RIMAPA BUSTAMANTE', 1, NULL, NULL, '2021-11-17 23:01:55', NULL, 1, 0),
(112, '12345678', 'RUBEN', 'FARRO GIL', 1, NULL, NULL, '2021-11-17 23:02:21', NULL, 1, 0),
(113, '12345678', 'EBER ', 'CULQUI DIAZ', 1, NULL, NULL, '2021-11-17 23:02:47', NULL, 1, 0),
(114, '12345678', 'EBER ', 'CULQUI DIAZ', 1, NULL, NULL, '2021-11-17 23:02:49', NULL, 1, 0),
(115, '12345678', 'AMILCAR', 'MEJÍA COLUNCHE', 1, NULL, NULL, '2021-11-17 23:38:05', NULL, 1, 0),
(116, '12345678', 'JAIME', 'MONDRAGON', 1, NULL, NULL, '2021-11-19 16:49:48', NULL, 1, 0),
(117, '12345678', 'ANALY', 'ZAMORA ALIAGA', 1, NULL, NULL, '2021-11-19 17:02:33', NULL, 1, 0),
(118, '12345678', 'CARLOS', 'SÁNCHEZ SUAREZ', 1, NULL, NULL, '2021-11-19 17:33:39', NULL, 1, 0),
(119, '12345678', 'JONATHAN', 'CHERO VIDAURRE ', 1, NULL, NULL, '2021-11-19 18:20:23', NULL, 1, 0),
(120, '12345678', 'JOSE ', 'AYALA MONJA ', 1, NULL, NULL, '2021-11-19 18:20:58', NULL, 1, 0),
(121, '12345678', 'MARCO', 'ROJAS CANO', 1, NULL, NULL, '2021-11-19 18:59:41', NULL, 1, 0),
(122, '12345678', 'MANUEL', 'DAVILA MENOR', 1, NULL, NULL, '2021-11-19 20:14:03', NULL, 1, 0),
(123, '12345678', 'EDILBERTO ', 'RAMOS ARÉVALO', 1, NULL, NULL, '2021-11-19 20:14:26', NULL, 1, 0),
(124, '12345678', 'CESAR AUGUSTO', 'DIOSES LEZCANO', 1, NULL, NULL, '2021-11-19 20:14:59', NULL, 1, 0),
(125, '12345678', 'CESAR AUGUSTO', 'DIOSES LEZCANO', 1, NULL, NULL, '2021-11-19 20:15:07', NULL, 1, 0),
(126, '12345678', 'MARCO', 'ROJAS CANO', 1, NULL, NULL, '2021-11-19 20:15:38', NULL, 1, 0),
(127, '12345678', 'JORGE', 'BENITES CHUNGA', 1, NULL, NULL, '2021-11-20 15:25:59', NULL, 1, 0),
(128, '12345678', 'OMAR ', 'MEDINA RIVADENEIRA', 1, NULL, NULL, '2021-11-20 15:26:23', NULL, 1, 0),
(129, '12345678', 'MARCO A', 'ROQUE PINZÓN', 1, NULL, NULL, '2021-11-20 15:27:00', NULL, 1, 0),
(130, '12345678', 'JUAN ELOY ', 'CALLO MAMANI ', 1, NULL, NULL, '2021-11-20 15:27:37', NULL, 1, 0),
(131, '12345678', 'WILLIAN', 'ACOSTA BANCES', 1, NULL, NULL, '2021-11-20 15:28:01', NULL, 1, 0),
(132, '12345678', 'VICTOR', 'SUYON SANTISTEBAN', 1, NULL, NULL, '2021-11-20 15:28:24', NULL, 1, 0),
(133, '12345678', 'SAUL ', 'FUSTAMANTE FUSTAMANTE', 1, NULL, NULL, '2021-11-20 15:29:07', NULL, 1, 0),
(134, '12345678', 'JOSÉ ', 'MOLLEDA CUEVAS', 1, NULL, NULL, '2021-11-20 15:29:35', NULL, 1, 0),
(135, '12345678', 'MARCO', 'NUNURA CHUMAN', 1, NULL, NULL, '2021-11-20 15:32:41', NULL, 1, 0),
(136, '12345678', 'ELMER', 'SANTISTEBAN TUÑOQUE', 1, NULL, NULL, '2021-11-20 15:33:29', NULL, 1, 0),
(137, '12345678', 'EVERTH', 'FARROÑAN SANDOVAL', 1, NULL, NULL, '2021-11-20 15:34:04', NULL, 1, 0),
(138, '12345678', 'CRISTHIAN', 'SANTISTEBAN SALDAÑA', 1, NULL, NULL, '2021-11-20 15:35:18', NULL, 1, 0),
(139, '12345678', 'VÍCTOR', 'LUMBA CABANILLAS', 1, NULL, NULL, '2021-11-20 15:35:52', NULL, 1, 0),
(140, '12345678', 'JUAN CARLOS', 'ARICOCHE SAAVEDRA', 1, NULL, NULL, '2021-11-20 15:52:39', NULL, 1, 0),
(141, '12345678', 'FREDY JUAN CARLOS ', 'MENOR MONTENEGRO', 1, NULL, NULL, '2021-11-20 16:13:56', NULL, 1, 0),
(142, '12345678', 'JUAN CARLOS ', 'ARICOCHE SAAVEDRA', 1, NULL, NULL, '2021-11-20 16:14:26', NULL, 1, 0),
(143, '12345678', 'VICTOR', 'COLUNCHE', 1, NULL, NULL, '2021-11-22 12:37:34', NULL, 1, 0),
(144, '12345678', 'JOSE ULISES ', 'NUÑEZ BAUTISTA', 1, NULL, NULL, '2021-11-22 16:58:54', NULL, 1, 0),
(145, '12345678', 'ALVITER ', 'CIEZA TAPIA', 1, NULL, NULL, '2021-11-24 07:16:36', NULL, 1, 0),
(146, '12345678', 'MARINO ', 'CARUALJULCA CHAVEZ', 1, NULL, NULL, '2021-11-24 07:24:07', NULL, 1, 0),
(147, '12345678', 'WILDER', 'PURIZACA CHICOMA', 1, NULL, NULL, '2021-11-24 07:24:34', NULL, 1, 0),
(148, '12345678', 'ALVITER', 'CIEZA TAPIA', 1, NULL, NULL, '2021-11-24 07:25:01', NULL, 1, 0),
(149, '12345678', 'LUIS ', 'DOBBERTIN AYALA ', 1, NULL, NULL, '2021-12-06 20:20:11', NULL, 1, 0),
(150, '12345678', 'LUIS ', 'DOBBERTIN AYALA', 1, NULL, NULL, '2021-12-06 20:47:32', NULL, 1, 0),
(151, '12345678', 'ABEL ', 'BUSTAMANTE SANTOS', 1, NULL, NULL, '2021-12-09 20:11:54', NULL, 1, 0),
(152, '28400253', 'luis ', 'CUADROS SANDOVAL ', 1, NULL, NULL, '2021-12-09 20:29:08', NULL, 1, 0),
(153, '72185760', 'VICTOR', 'GONZALES ZAMORA', 1, NULL, NULL, '2021-12-09 20:31:11', NULL, 1, 0),
(154, '21460174', 'WILBER ', 'ARAGONES ROMAN', 1, NULL, NULL, '2021-12-09 20:32:12', NULL, 1, 0),
(155, '05357360', 'JULIO ', 'GOMEZ FLORES', 1, NULL, NULL, '2021-12-09 20:32:48', NULL, 1, 0),
(156, '05409676', 'HENRRY', 'HELLER MACEDO', 1, NULL, NULL, '2021-12-09 20:33:34', NULL, 1, 0),
(157, '12345678', 'CESAR WILER', 'LARA MONTALVAN', 1, NULL, NULL, '2021-12-15 11:58:36', NULL, 1, 0),
(158, '12345678', 'CESAR WILMER ', 'LARA MONTALVÁN', 1, NULL, NULL, '2021-12-15 12:09:13', NULL, 1, 0),
(159, '12345678', 'JUAN CARLOS ', 'CARBAJAL GONZAGA', 1, NULL, NULL, '2021-12-15 12:09:47', NULL, 1, 0),
(160, '12345678', 'DANIEL', 'PINO AYALA', 1, NULL, NULL, '2022-01-24 11:46:46', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `nId` int(11) NOT NULL,
  `cNombre` varchar(250) DEFAULT NULL,
  `cCodigoA` varchar(50) DEFAULT NULL,
  `cCodigoN` varchar(50) DEFAULT NULL,
  `cVersionA` varchar(50) DEFAULT NULL,
  `cVersionN` varchar(50) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `userCreate` varchar(18) DEFAULT NULL,
  `userActualiza` varchar(18) DEFAULT NULL,
  `dCreate` datetime DEFAULT current_timestamp(),
  `dUpdate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`nId`, `cNombre`, `cCodigoA`, `cCodigoN`, `cVersionA`, `cVersionN`, `nFlag`, `userCreate`, `userActualiza`, `dCreate`, `dUpdate`) VALUES
(1, 'GISMM', NULL, 'M001-SST/MA', NULL, '00/2018-M001', 0, 'CN', 'CN', '2021-06-26 02:39:54', '2021-06-26 02:47:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

CREATE TABLE `responsable` (
  `nId` int(11) NOT NULL,
  `nIdPersona` int(11) DEFAULT NULL,
  `nIdEmpresa` int(11) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `responsable`
--

INSERT INTO `responsable` (`nId`, `nIdPersona`, `nIdEmpresa`, `nFlag`, `dRegistro`) VALUES
(1, 2, 1, 0, '2021-06-26 23:46:01'),
(19, 33, 6, 0, '2021-09-16 02:23:47'),
(20, 34, 2, 0, '2021-09-18 16:53:46'),
(21, 33, 8, 0, '2021-09-20 20:55:57'),
(22, 43, 2, 0, '2021-09-22 02:06:38'),
(23, 44, 8, 0, '2021-09-23 17:45:08'),
(24, 45, 2, 0, '2021-09-25 19:33:32'),
(25, 33, 2, 0, '2021-09-27 01:21:12'),
(26, 33, 5, 0, '2021-09-27 01:21:55'),
(27, 48, 2, 0, '2021-09-28 20:08:01'),
(28, 33, 2, 0, '2021-09-28 20:08:30'),
(29, 33, 2, 0, '2021-10-01 10:13:09'),
(30, 51, 2, 0, '2021-10-01 18:36:52'),
(31, 52, 2, 0, '2021-10-01 19:14:05'),
(32, 53, 5, 0, '2021-10-02 14:21:01'),
(33, 54, 9, 0, '2021-10-04 14:30:20'),
(34, 55, 6, 0, '2021-10-07 16:12:09'),
(35, 56, 6, 0, '2021-10-07 16:22:02'),
(36, 57, 6, 0, '2021-10-12 23:45:24'),
(37, 58, 6, 0, '2021-10-22 22:07:37'),
(38, 59, 6, 0, '2021-10-23 14:13:48'),
(39, 60, 9, 0, '2021-10-25 00:18:11'),
(40, 61, 10, 0, '2021-10-29 19:20:11'),
(41, 62, 9, 0, '2021-11-05 15:53:27'),
(42, 63, 10, 0, '2021-11-08 02:16:51'),
(43, 64, 11, 0, '2021-11-08 07:06:41'),
(44, 65, 12, 0, '2021-11-09 23:17:54'),
(45, 66, 12, 0, '2021-11-10 09:51:20'),
(46, 67, 5, 0, '2021-11-10 09:51:20'),
(47, 68, 11, 0, '2021-11-10 10:22:26'),
(48, 69, 8, 0, '2021-11-10 21:01:23'),
(49, 70, 8, 0, '2021-11-10 22:38:24'),
(50, 71, 13, 0, '2021-11-15 15:31:45'),
(51, 72, 8, 0, '2021-11-15 20:25:52'),
(52, 73, 13, 0, '2021-11-16 07:07:14'),
(53, 74, 13, 0, '2021-11-16 07:12:47'),
(54, 75, 13, 0, '2021-11-16 07:15:06'),
(55, 76, 13, 0, '2021-11-16 07:16:00'),
(56, 77, 13, 0, '2021-11-16 07:16:30'),
(57, 78, 13, 0, '2021-11-16 07:17:01'),
(58, 79, 13, 0, '2021-11-16 07:17:49'),
(59, 80, 13, 0, '2021-11-16 07:18:28'),
(60, 81, 13, 0, '2021-11-16 07:19:06'),
(61, 82, 13, 0, '2021-11-16 07:19:44'),
(62, 83, 14, 0, '2021-11-16 15:24:01'),
(63, 84, 14, 0, '2021-11-16 19:49:18'),
(64, 85, 14, 0, '2021-11-16 19:49:47'),
(65, 86, 14, 0, '2021-11-16 19:50:21'),
(66, 87, 8, 0, '2021-11-16 23:56:10'),
(67, 88, 8, 0, '2021-11-17 00:06:40'),
(68, 89, 8, 0, '2021-11-17 00:27:50'),
(69, 90, 6, 0, '2021-11-17 11:33:49'),
(70, 91, 6, 0, '2021-11-17 11:42:07'),
(71, 92, 6, 0, '2021-11-17 11:42:38'),
(72, 93, 6, 0, '2021-11-17 11:43:04'),
(73, 94, 6, 0, '2021-11-17 11:43:30'),
(74, 95, 6, 0, '2021-11-17 11:44:04'),
(75, 96, 6, 0, '2021-11-17 11:44:48'),
(76, 97, 6, 0, '2021-11-17 11:45:23'),
(77, 98, 6, 0, '2021-11-17 11:45:54'),
(78, 99, 6, 0, '2021-11-17 11:46:31'),
(79, 100, 6, 0, '2021-11-17 11:47:01'),
(80, 101, 8, 0, '2021-11-17 13:13:56'),
(81, 102, 5, 0, '2021-11-17 21:51:15'),
(82, 103, 5, 0, '2021-11-17 22:05:06'),
(83, 104, 5, 0, '2021-11-17 22:06:20'),
(84, 105, 5, 0, '2021-11-17 22:06:53'),
(85, 106, 5, 0, '2021-11-17 22:06:57'),
(86, 107, 5, 0, '2021-11-17 22:07:31'),
(87, 108, 5, 0, '2021-11-17 22:08:07'),
(88, 109, 5, 0, '2021-11-17 22:08:31'),
(89, 110, 5, 0, '2021-11-17 22:10:56'),
(90, 111, 5, 0, '2021-11-17 23:01:55'),
(91, 112, 5, 0, '2021-11-17 23:02:21'),
(92, 113, 5, 0, '2021-11-17 23:02:47'),
(93, 114, 5, 0, '2021-11-17 23:02:49'),
(94, 115, 12, 0, '2021-11-17 23:38:05'),
(95, 116, 15, 0, '2021-11-19 16:49:48'),
(96, 117, 15, 0, '2021-11-19 17:02:33'),
(97, 118, 16, 0, '2021-11-19 17:33:39'),
(98, 119, 16, 0, '2021-11-19 18:20:23'),
(99, 120, 16, 0, '2021-11-19 18:20:58'),
(100, 121, 8, 0, '2021-11-19 18:59:41'),
(101, 122, 8, 0, '2021-11-19 20:14:03'),
(102, 123, 8, 0, '2021-11-19 20:14:26'),
(103, 124, 8, 0, '2021-11-19 20:14:59'),
(104, 125, 8, 0, '2021-11-19 20:15:07'),
(105, 126, 8, 0, '2021-11-19 20:15:38'),
(106, 127, 13, 0, '2021-11-20 15:25:59'),
(107, 128, 13, 0, '2021-11-20 15:26:23'),
(108, 129, 13, 0, '2021-11-20 15:27:00'),
(109, 130, 13, 0, '2021-11-20 15:27:37'),
(110, 131, 13, 0, '2021-11-20 15:28:01'),
(111, 132, 13, 0, '2021-11-20 15:28:24'),
(112, 133, 13, 0, '2021-11-20 15:29:07'),
(113, 134, 13, 0, '2021-11-20 15:29:35'),
(114, 135, 13, 0, '2021-11-20 15:32:41'),
(115, 136, 13, 0, '2021-11-20 15:33:29'),
(116, 137, 13, 0, '2021-11-20 15:34:04'),
(117, 138, 13, 0, '2021-11-20 15:35:18'),
(118, 139, 13, 0, '2021-11-20 15:35:52'),
(119, 140, 17, 0, '2021-11-20 15:52:39'),
(120, 141, 17, 0, '2021-11-20 16:13:56'),
(121, 142, 17, 0, '2021-11-20 16:14:26'),
(122, 143, 15, 0, '2021-11-22 12:37:34'),
(123, 144, 15, 0, '2021-11-22 16:58:54'),
(124, 145, 8, 0, '2021-11-24 07:16:36'),
(125, 146, 8, 0, '2021-11-24 07:24:07'),
(126, 147, 8, 0, '2021-11-24 07:24:34'),
(127, 148, 8, 0, '2021-11-24 07:25:01'),
(128, 149, 8, 0, '2021-12-06 20:20:11'),
(129, 150, 8, 0, '2021-12-06 20:47:32'),
(130, 151, 19, 0, '2021-12-09 20:11:54'),
(131, 152, 19, 0, '2021-12-09 20:29:08'),
(132, 153, 19, 0, '2021-12-09 20:31:11'),
(133, 154, 19, 0, '2021-12-09 20:32:12'),
(134, 155, 19, 0, '2021-12-09 20:32:48'),
(135, 156, 19, 0, '2021-12-09 20:33:34'),
(136, 157, 8, 0, '2021-12-15 11:58:36'),
(137, 158, 8, 0, '2021-12-15 12:09:13'),
(138, 159, 8, 0, '2021-12-15 12:09:47'),
(139, 160, 20, 0, '2022-01-24 11:46:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supervision`
--

CREATE TABLE `supervision` (
  `nId` int(11) NOT NULL,
  `cNombre` varchar(250) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dCreate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `supervision`
--

INSERT INTO `supervision` (`nId`, `cNombre`, `nFlag`, `dCreate`) VALUES
(1, 'PLANEADA', 0, '2021-06-27 00:39:51'),
(2, 'OTRA TIPO', 0, '2021-07-21 20:54:59'),
(4, 'INOPINADA', 0, '2021-09-04 12:56:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `nId` int(11) NOT NULL,
  `cNombre` varchar(3060) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarea`
--

INSERT INTO `tarea` (`nId`, `cNombre`, `nFlag`, `dRegistro`) VALUES
(1, 'SUPERVISIÓN (INSPECCIÓN / OBSERVACIÓN) EN SEGURIDAD Y SALUD EN EL TRABAJO', 0, '2021-06-26 16:25:35'),
(2, 'CUMPLIMIENTOS E INCUMPLIMIENTO A NORMAS DE SEGURIDAD', 0, '2021-09-11 13:54:08'),
(3, 'REGISTRO DE DIFUSIÓN DE CHARLA DE INDUCCIÓN INICIO DE ACTIVIDADES', 0, '2021-12-11 03:15:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cumplimiento`
--

CREATE TABLE `tipo_cumplimiento` (
  `nId` int(11) NOT NULL,
  `nIdCumplimiento` int(11) DEFAULT NULL,
  `cCodigo` varchar(12) DEFAULT NULL,
  `cDescripcion` varchar(800) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `nId` int(11) NOT NULL,
  `cNombre` varchar(250) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dCreate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`nId`, `cNombre`, `nFlag`, `dCreate`) VALUES
(1, 'INFORME TÉCNICO', 0, NULL),
(2, 'INFORME DE OFICINA', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculo`
--

CREATE TABLE `tipo_vehiculo` (
  `nId` int(11) NOT NULL,
  `cNombre` varchar(250) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dRegistro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`nId`, `cNombre`, `nFlag`, `dRegistro`) VALUES
(1, 'AUTO CAMIONETA', 0, '2021-06-29 10:01:55'),
(2, 'MOTO', 0, '2021-06-29 10:02:13'),
(3, 'MOTOCARRO', 0, '2021-06-29 10:02:18'),
(4, 'CAMION GRUA', 0, '2021-11-16 07:24:48'),
(5, 'CAMIONETA 4X2', 0, '2021-11-16 07:26:25'),
(6, 'CAMIONETA 4X4', 0, '2021-11-16 07:26:25'),
(7, 'MINIVAN', 0, '2021-11-16 07:27:35'),
(8, 'SUV', 0, '2021-11-16 07:27:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uunn`
--

CREATE TABLE `uunn` (
  `nId` int(11) NOT NULL,
  `cNombre` varchar(250) DEFAULT NULL,
  `nFlag` int(11) DEFAULT 0,
  `dCreate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `uunn`
--

INSERT INTO `uunn` (`nId`, `cNombre`, `nFlag`, `dCreate`) VALUES
(1, 'CAJA MARCA CENTRO', 1, '2021-06-26 19:48:07'),
(2, 'CAJA MARCA SUR', 1, '2021-06-26 19:48:16'),
(3, 'CAJA MARCA SUR', 1, '2021-07-21 20:52:41'),
(4, 'SUCURSALES', 0, '2021-09-04 22:43:16'),
(7, 'CAJAMARCA CENTRO', 0, '2021-09-16 22:47:28'),
(8, 'CHICLAYO', 0, '2021-09-16 22:47:33');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `codigos`
--
ALTER TABLE `codigos`
  ADD PRIMARY KEY (`nId`);

--
-- Indices de la tabla `cumplimiento`
--
ALTER TABLE `cumplimiento`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nIdTarea` (`nIdTarea`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`nId`);

--
-- Indices de la tabla `empresa_cargo`
--
ALTER TABLE `empresa_cargo`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nIdEmpresa` (`nIdEmpresa`);

--
-- Indices de la tabla `empresa_cargo_trabajador`
--
ALTER TABLE `empresa_cargo_trabajador`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nIdEmpresa_Cargo` (`nIdEmpresa_Cargo`),
  ADD KEY `empresa_cargo_trabajador_ibfk_2` (`nIdPersona`);

--
-- Indices de la tabla `empresa_normas`
--
ALTER TABLE `empresa_normas`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nIdEmpresa` (`nIdEmpresa`);

--
-- Indices de la tabla `empresa_normas_observacion`
--
ALTER TABLE `empresa_normas_observacion`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nId_empresa_norma` (`nId_empresa_norma`);

--
-- Indices de la tabla `empresa_vehiculo`
--
ALTER TABLE `empresa_vehiculo`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nIdEmpresa` (`nIdEmpresa`),
  ADD KEY `nTipoVehiculo` (`nTipoVehiculo`);

--
-- Indices de la tabla `informe`
--
ALTER TABLE `informe`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nIdTipoDocumento` (`nIdTipoDocumento`),
  ADD KEY `nIdEmpresa` (`nIdEmpresa`),
  ADD KEY `nIdUUNN` (`nIdUUNN`),
  ADD KEY `nIdResponsable` (`nIdResponsable`),
  ADD KEY `nIdCargo` (`nIdCargo`),
  ADD KEY `nIdSupervision` (`nIdSupervision`),
  ADD KEY `nIdTarea` (`nIdTarea`),
  ADD KEY `nIdUserRegistro` (`nIdUserRegistro`),
  ADD KEY `nIdPrograma` (`nIdPrograma`);

--
-- Indices de la tabla `inf_cumplimiento_des`
--
ALTER TABLE `inf_cumplimiento_des`
  ADD PRIMARY KEY (`nId`);

--
-- Indices de la tabla `inf_cumplimiento_img`
--
ALTER TABLE `inf_cumplimiento_img`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nIdCumplimiento` (`nIdCumplimiento`);

--
-- Indices de la tabla `inf_normas`
--
ALTER TABLE `inf_normas`
  ADD KEY `nidEmpresa_Norma` (`nidEmpresa_Norma`);

--
-- Indices de la tabla `inf_trabajadoressupervisados_det`
--
ALTER TABLE `inf_trabajadoressupervisados_det`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nId_E_C_T` (`nId_E_C_T`),
  ADD KEY `nId_emp_nor_obs` (`nId_emp_nor_obs`);

--
-- Indices de la tabla `inf_vehiculo_det`
--
ALTER TABLE `inf_vehiculo_det`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nIdEmp_Veh` (`nIdEmp_Veh`),
  ADD KEY `nId_Emp_nor_obs` (`nId_Emp_nor_obs`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`nId`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`nId`);

--
-- Indices de la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nIdPersona` (`nIdPersona`),
  ADD KEY `nIdEmpresa` (`nIdEmpresa`);

--
-- Indices de la tabla `supervision`
--
ALTER TABLE `supervision`
  ADD PRIMARY KEY (`nId`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`nId`);

--
-- Indices de la tabla `tipo_cumplimiento`
--
ALTER TABLE `tipo_cumplimiento`
  ADD PRIMARY KEY (`nId`),
  ADD KEY `nIdCumplimiento` (`nIdCumplimiento`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`nId`);

--
-- Indices de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  ADD PRIMARY KEY (`nId`);

--
-- Indices de la tabla `uunn`
--
ALTER TABLE `uunn`
  ADD PRIMARY KEY (`nId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `codigos`
--
ALTER TABLE `codigos`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `cumplimiento`
--
ALTER TABLE `cumplimiento`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `empresa_cargo`
--
ALTER TABLE `empresa_cargo`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `empresa_cargo_trabajador`
--
ALTER TABLE `empresa_cargo_trabajador`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `empresa_normas`
--
ALTER TABLE `empresa_normas`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `empresa_normas_observacion`
--
ALTER TABLE `empresa_normas_observacion`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT de la tabla `empresa_vehiculo`
--
ALTER TABLE `empresa_vehiculo`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `informe`
--
ALTER TABLE `informe`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT de la tabla `inf_cumplimiento_des`
--
ALTER TABLE `inf_cumplimiento_des`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=823;

--
-- AUTO_INCREMENT de la tabla `inf_cumplimiento_img`
--
ALTER TABLE `inf_cumplimiento_img`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=758;

--
-- AUTO_INCREMENT de la tabla `inf_trabajadoressupervisados_det`
--
ALTER TABLE `inf_trabajadoressupervisados_det`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `inf_vehiculo_det`
--
ALTER TABLE `inf_vehiculo_det`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `responsable`
--
ALTER TABLE `responsable`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de la tabla `supervision`
--
ALTER TABLE `supervision`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `uunn`
--
ALTER TABLE `uunn`
  MODIFY `nId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cumplimiento`
--
ALTER TABLE `cumplimiento`
  ADD CONSTRAINT `cumplimiento_ibfk_1` FOREIGN KEY (`nIdTarea`) REFERENCES `tarea` (`nId`);

--
-- Filtros para la tabla `empresa_cargo`
--
ALTER TABLE `empresa_cargo`
  ADD CONSTRAINT `empresa_cargo_ibfk_1` FOREIGN KEY (`nIdEmpresa`) REFERENCES `empresa` (`nId`);

--
-- Filtros para la tabla `empresa_normas`
--
ALTER TABLE `empresa_normas`
  ADD CONSTRAINT `empresa_normas_ibfk_1` FOREIGN KEY (`nIdEmpresa`) REFERENCES `empresa` (`nId`);

--
-- Filtros para la tabla `empresa_normas_observacion`
--
ALTER TABLE `empresa_normas_observacion`
  ADD CONSTRAINT `empresa_normas_observacion_ibfk_1` FOREIGN KEY (`nId_empresa_norma`) REFERENCES `empresa_normas` (`nId`);

--
-- Filtros para la tabla `empresa_vehiculo`
--
ALTER TABLE `empresa_vehiculo`
  ADD CONSTRAINT `empresa_vehiculo_ibfk_1` FOREIGN KEY (`nIdEmpresa`) REFERENCES `empresa` (`nId`),
  ADD CONSTRAINT `empresa_vehiculo_ibfk_2` FOREIGN KEY (`nTipoVehiculo`) REFERENCES `tipo_vehiculo` (`nId`);

--
-- Filtros para la tabla `informe`
--
ALTER TABLE `informe`
  ADD CONSTRAINT `informe_ibfk_1` FOREIGN KEY (`nIdTipoDocumento`) REFERENCES `tipo_documento` (`nId`),
  ADD CONSTRAINT `informe_ibfk_2` FOREIGN KEY (`nIdEmpresa`) REFERENCES `empresa` (`nId`),
  ADD CONSTRAINT `informe_ibfk_3` FOREIGN KEY (`nIdUUNN`) REFERENCES `uunn` (`nId`),
  ADD CONSTRAINT `informe_ibfk_4` FOREIGN KEY (`nIdResponsable`) REFERENCES `responsable` (`nId`),
  ADD CONSTRAINT `informe_ibfk_5` FOREIGN KEY (`nIdCargo`) REFERENCES `empresa_cargo` (`nId`),
  ADD CONSTRAINT `informe_ibfk_6` FOREIGN KEY (`nIdSupervision`) REFERENCES `supervision` (`nId`),
  ADD CONSTRAINT `informe_ibfk_7` FOREIGN KEY (`nIdTarea`) REFERENCES `tarea` (`nId`),
  ADD CONSTRAINT `informe_ibfk_8` FOREIGN KEY (`nIdUserRegistro`) REFERENCES `persona` (`nId`),
  ADD CONSTRAINT `informe_ibfk_9` FOREIGN KEY (`nIdPrograma`) REFERENCES `programa` (`nId`);

--
-- Filtros para la tabla `inf_cumplimiento_des`
--
ALTER TABLE `inf_cumplimiento_des`
  ADD CONSTRAINT `inf_cumplimiento_des_ibfk_1` FOREIGN KEY (`nIdInforme`) REFERENCES `informe` (`nId`),
  ADD CONSTRAINT `inf_cumplimiento_des_ibfk_2` FOREIGN KEY (`nIdCumplimiento`) REFERENCES `cumplimiento` (`nId`);

--
-- Filtros para la tabla `inf_cumplimiento_img`
--
ALTER TABLE `inf_cumplimiento_img`
  ADD CONSTRAINT `inf_cumplimiento_img_ibfk_1` FOREIGN KEY (`nIdInforme`) REFERENCES `informe` (`nId`),
  ADD CONSTRAINT `inf_cumplimiento_img_ibfk_2` FOREIGN KEY (`nIdCumplimiento`) REFERENCES `cumplimiento` (`nId`);

--
-- Filtros para la tabla `inf_normas`
--
ALTER TABLE `inf_normas`
  ADD CONSTRAINT `inf_normas_ibfk_1` FOREIGN KEY (`nidEmpresa_Norma`) REFERENCES `empresa_normas` (`nId`);

--
-- Filtros para la tabla `inf_trabajadoressupervisados_det`
--
ALTER TABLE `inf_trabajadoressupervisados_det`
  ADD CONSTRAINT `inf_trabajadoressupervisados_det_ibfk_1` FOREIGN KEY (`nIdInforme`) REFERENCES `informe` (`nId`),
  ADD CONSTRAINT `inf_trabajadoressupervisados_det_ibfk_2` FOREIGN KEY (`nId_E_C_T`) REFERENCES `empresa_cargo_trabajador` (`nId`),
  ADD CONSTRAINT `inf_trabajadoressupervisados_det_ibfk_3` FOREIGN KEY (`nId_emp_nor_obs`) REFERENCES `empresa_normas_observacion` (`nId`);

--
-- Filtros para la tabla `inf_vehiculo_det`
--
ALTER TABLE `inf_vehiculo_det`
  ADD CONSTRAINT `inf_vehiculo_det_ibfk_1` FOREIGN KEY (`nIdInforme`) REFERENCES `informe` (`nId`),
  ADD CONSTRAINT `inf_vehiculo_det_ibfk_2` FOREIGN KEY (`nIdEmp_Veh`) REFERENCES `empresa_vehiculo` (`nId`),
  ADD CONSTRAINT `inf_vehiculo_det_ibfk_3` FOREIGN KEY (`nId_Emp_nor_obs`) REFERENCES `empresa_normas_observacion` (`nId`);

--
-- Filtros para la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD CONSTRAINT `responsable_ibfk_1` FOREIGN KEY (`nIdPersona`) REFERENCES `persona` (`nId`),
  ADD CONSTRAINT `responsable_ibfk_2` FOREIGN KEY (`nIdEmpresa`) REFERENCES `empresa` (`nId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
