-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.19


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema academiacead
--

CREATE DATABASE IF NOT EXISTS academiacead;
USE academiacead;

--
-- Definition of table `tbl_alumnos`
--

DROP TABLE IF EXISTS `tbl_alumnos`;
CREATE TABLE `tbl_alumnos` (
  `Id_Alumno` int(11) NOT NULL AUTO_INCREMENT,
  `PrimerNombre` varchar(15) NOT NULL,
  `SegundoNombre` varchar(15) DEFAULT NULL,
  `PrimerApellido` varchar(15) NOT NULL,
  `SegundoApellido` varchar(15) DEFAULT NULL,
  `CorreoElectronico` varchar(30) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Cedula` decimal(13,0) NOT NULL,
  `Telefono` decimal(12,0) NOT NULL,
  `FechaIngreso` date DEFAULT NULL,
  `Id_genero` int(11) NOT NULL,
  `Id_estadocivil` int(11) NOT NULL,
  PRIMARY KEY (`Id_Alumno`),
  KEY `fkIdx_gen_alum` (`Id_genero`),
  KEY `fkIdx_estcivil_alum` (`Id_estadocivil`),
  CONSTRAINT `FK_estcivil_alum` FOREIGN KEY (`Id_estadocivil`) REFERENCES `tbl_estadocivil` (`Id_EstadoCivil`),
  CONSTRAINT `FK_gen_alum` FOREIGN KEY (`Id_genero`) REFERENCES `tbl_genero` (`Id_Genero`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_alumnos`
--

/*!40000 ALTER TABLE `tbl_alumnos` DISABLE KEYS */;
INSERT INTO `tbl_alumnos` (`Id_Alumno`,`PrimerNombre`,`SegundoNombre`,`PrimerApellido`,`SegundoApellido`,`CorreoElectronico`,`FechaNacimiento`,`Cedula`,`Telefono`,`FechaIngreso`,`Id_genero`,`Id_estadocivil`) VALUES 
 (1,'KEREN','ESTERK','YANES','CASCO','abc@abc.com','1993-01-01','801000011111','88888888','0000-00-00',1,1),
 (2,'KERENPL','ESTER','YANES','CASCO','abc@abc.com','2019-03-13','801000011111','88888888','0000-00-00',1,1),
 (3,'ZIMBO','JAVIER','VARELA','LANZA','ZIMBO@YAHOO.COM','2000-05-25','801200014251','22222222',NULL,2,2),
 (4,'MARIA','LUCIA','CASCO','LOPEZ','MARIA@GMAIL.COM','1995-03-02','801198502536','23232323',NULL,1,1);
/*!40000 ALTER TABLE `tbl_alumnos` ENABLE KEYS */;


--
-- Definition of table `tbl_asistencia`
--

DROP TABLE IF EXISTS `tbl_asistencia`;
CREATE TABLE `tbl_asistencia` (
  `Id_asistencia` int(11) NOT NULL AUTO_INCREMENT,
  `Asistencia` decimal(4,0) DEFAULT NULL,
  `Fecha` date NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_clase` int(11) NOT NULL,
  PRIMARY KEY (`Id_asistencia`),
  KEY `FK_User_Asis` (`Id_usuario`),
  KEY `FK_Clases_Asis` (`Id_clase`),
  CONSTRAINT `FK_Clases_Asis` FOREIGN KEY (`Id_clase`) REFERENCES `tbl_clases` (`Id_Clase`),
  CONSTRAINT `FK_User_Asis` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_asistencia`
--

/*!40000 ALTER TABLE `tbl_asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asistencia` ENABLE KEYS */;


--
-- Definition of table `tbl_bitacora`
--

DROP TABLE IF EXISTS `tbl_bitacora`;
CREATE TABLE `tbl_bitacora` (
  `Id_Bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL,
  `Accion` varchar(20) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_Objeto` int(11) NOT NULL,
  PRIMARY KEY (`Id_Bitacora`),
  KEY `fkIdx_Usuario_Bit` (`Id_usuario`),
  KEY `fkIdx_Obj_Bit` (`Id_Objeto`),
  CONSTRAINT `FK_Obj_Bit` FOREIGN KEY (`Id_Objeto`) REFERENCES `tbl_objetos` (`Id_Objeto`),
  CONSTRAINT `FK_Usuario_Bit` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bitacora`
--

/*!40000 ALTER TABLE `tbl_bitacora` DISABLE KEYS */;
INSERT INTO `tbl_bitacora` (`Id_Bitacora`,`Fecha`,`Accion`,`Descripcion`,`Id_usuario`,`Id_Objeto`) VALUES 
 (25,'2019-03-08 00:16:57','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (26,'2019-03-08 07:17:07','Seguridad en acceso','Agregando pregunta de seguridad',1,2),
 (27,'2019-03-08 07:17:15','Seguridad en acceso','Agregando pregunta de seguridad',1,2),
 (28,'2019-03-08 07:17:22','Seguridad en acceso','Agregando pregunta de seguridad',1,2),
 (29,'2019-03-08 07:17:39','Cambio de password','Cambiando el password en el primer acceso del usuario',1,6),
 (30,'2019-03-08 00:17:54','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (31,'2019-03-08 21:18:23','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (32,'2019-03-11 22:01:39','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (33,'2019-03-12 00:48:05','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (34,'2019-03-13 22:40:35','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (35,'2019-03-13 22:54:03','Ingreso al sistema','Contestando las preguntas de seguridad para primer acceso!',73,2),
 (36,'2019-03-14 05:54:10','Seguridad en acceso','Agregando pregunta de seguridad',73,2),
 (37,'2019-03-14 05:54:18','Seguridad en acceso','Agregando pregunta de seguridad',73,2),
 (38,'2019-03-14 05:54:25','Seguridad en acceso','Agregando pregunta de seguridad',73,2),
 (39,'2019-03-14 05:54:41','Cambio de password','Cambiando el password en el primer acceso del usuario',73,6),
 (40,'2019-03-13 23:28:18','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (41,'2019-03-13 23:45:22','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (42,'2019-03-18 21:10:47','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (43,'2019-03-20 21:02:30','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (44,'2019-03-24 16:58:30','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (45,'2019-03-25 21:13:41','Ingreso al sistema','Accediendo por el Login del sistema',1,1),
 (46,'2019-03-25 21:29:35','Ingreso al sistema','Contestando las preguntas de seguridad para primer acceso!',74,2),
 (47,'2019-03-26 03:29:45','Seguridad en acceso','Agregando pregunta de seguridad',74,2),
 (48,'2019-03-26 03:29:54','Seguridad en acceso','Agregando pregunta de seguridad',74,2),
 (49,'2019-03-26 03:30:04','Seguridad en acceso','Agregando pregunta de seguridad',74,2),
 (50,'2019-03-26 03:30:31','Cambio de password','Cambiando el password en el primer acceso del usuario',74,6),
 (51,'2019-03-25 21:30:43','Ingreso al sistema','Contestando las preguntas de seguridad para primer acceso!',74,2),
 (52,'2019-03-25 22:28:46','Ingreso al sistema','Contestando las preguntas de seguridad para primer acceso!',74,2);
/*!40000 ALTER TABLE `tbl_bitacora` ENABLE KEYS */;


--
-- Definition of table `tbl_calificaciones`
--

DROP TABLE IF EXISTS `tbl_calificaciones`;
CREATE TABLE `tbl_calificaciones` (
  `Id_Calificaciones` int(11) NOT NULL AUTO_INCREMENT,
  `NotaFinal` decimal(5,0) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Seccion` int(11) NOT NULL,
  `Cod_Obs` int(11) NOT NULL,
  `Id_Clase` int(11) NOT NULL,
  PRIMARY KEY (`Id_Calificaciones`),
  KEY `fkIdx_Alumno_Cal` (`Id_Alumno`),
  KEY `fkIdx_Seccion_Cal` (`Id_Seccion`),
  KEY `fkIdx_Obs_Cal` (`Cod_Obs`),
  KEY `FK_Clases_Cal` (`Id_Clase`),
  CONSTRAINT `FK_Alumno_Cal` FOREIGN KEY (`Id_Alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`),
  CONSTRAINT `FK_Clases_Cal` FOREIGN KEY (`Id_Clase`) REFERENCES `tbl_clases` (`Id_Clase`),
  CONSTRAINT `FK_Obs_Cal` FOREIGN KEY (`Cod_Obs`) REFERENCES `tbl_obsnotas` (`Cod_Obs`),
  CONSTRAINT `FK_Seccion_Cal` FOREIGN KEY (`Id_Seccion`) REFERENCES `tbl_secciones` (`Id_Seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_calificaciones`
--

/*!40000 ALTER TABLE `tbl_calificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_calificaciones` ENABLE KEYS */;


--
-- Definition of table `tbl_clases`
--

DROP TABLE IF EXISTS `tbl_clases`;
CREATE TABLE `tbl_clases` (
  `Id_Clase` int(11) NOT NULL AUTO_INCREMENT,
  `DescripClase` varchar(45) NOT NULL,
  `Duracion` time NOT NULL,
  PRIMARY KEY (`Id_Clase`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_clases`
--

/*!40000 ALTER TABLE `tbl_clases` DISABLE KEYS */;
INSERT INTO `tbl_clases` (`Id_Clase`,`DescripClase`,`Duracion`) VALUES 
 (1,'PIANO','45:00:00'),
 (2,'GUITARRA','45:00:00');
/*!40000 ALTER TABLE `tbl_clases` ENABLE KEYS */;


--
-- Definition of table `tbl_clases_secciones`
--

DROP TABLE IF EXISTS `tbl_clases_secciones`;
CREATE TABLE `tbl_clases_secciones` (
  `Id_Clase` int(11) NOT NULL,
  `Id_Seccion` int(11) NOT NULL,
  KEY `FK_Clases_Secciones` (`Id_Clase`),
  KEY `FK_Secciones_Clases` (`Id_Seccion`),
  CONSTRAINT `FK_Clases_Secciones` FOREIGN KEY (`Id_Clase`) REFERENCES `tbl_clases` (`Id_Clase`),
  CONSTRAINT `FK_Secciones_Clases` FOREIGN KEY (`Id_Seccion`) REFERENCES `tbl_secciones` (`Id_Seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_clases_secciones`
--

/*!40000 ALTER TABLE `tbl_clases_secciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_clases_secciones` ENABLE KEYS */;


--
-- Definition of table `tbl_cobromatricula`
--

DROP TABLE IF EXISTS `tbl_cobromatricula`;
CREATE TABLE `tbl_cobromatricula` (
  `Id_cobro` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Alumno` int(11) NOT NULL,
  `TotalMatricula` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Id_cobro`),
  KEY `FK_Alumno` (`Id_Alumno`),
  CONSTRAINT `FK_Alumno` FOREIGN KEY (`Id_Alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cobromatricula`
--

/*!40000 ALTER TABLE `tbl_cobromatricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cobromatricula` ENABLE KEYS */;


--
-- Definition of table `tbl_contrespon`
--

DROP TABLE IF EXISTS `tbl_contrespon`;
CREATE TABLE `tbl_contrespon` (
  `Id_ContResp` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Telefono` decimal(12,0) NOT NULL,
  `Id_Tipo` int(11) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  PRIMARY KEY (`Id_ContResp`),
  KEY `fkIdx_TCont_ContResp` (`Id_Tipo`),
  KEY `fkIdx_Alumno_ContResp` (`Id_Alumno`),
  CONSTRAINT `FK_Alumno_ContResp` FOREIGN KEY (`Id_Alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`),
  CONSTRAINT `FK_TCont_ContResp` FOREIGN KEY (`Id_Tipo`) REFERENCES `tbl_tipocontacto` (`Id_Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contrespon`
--

/*!40000 ALTER TABLE `tbl_contrespon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contrespon` ENABLE KEYS */;


--
-- Definition of table `tbl_cuentacorriente`
--

DROP TABLE IF EXISTS `tbl_cuentacorriente`;
CREATE TABLE `tbl_cuentacorriente` (
  `Id_Cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `MontoTotal` decimal(8,2) NOT NULL,
  `Mespago` varchar(15) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_cobro` int(11) NOT NULL,
  `Id_precio` int(11) NOT NULL,
  `Id_Estado` int(11) NOT NULL,
  `Id_Matricula` int(11) NOT NULL,
  `Id_Descuento` int(11) NOT NULL,
  PRIMARY KEY (`Id_Cuenta`),
  KEY `fkIdx_Alum_CCorriente` (`Id_Alumno`),
  KEY `fkIdx_CMatri_CCorriente` (`Id_cobro`),
  KEY `fkIdx_Precio_CCorriente` (`Id_precio`),
  KEY `fkIdx_EstPago_CCorriente` (`Id_Estado`),
  KEY `fkIdx_Matri_CCorriente` (`Id_Matricula`),
  KEY `fkIdx_Desc_CCorriente` (`Id_Descuento`),
  CONSTRAINT `FK_Alumno_CCorriente` FOREIGN KEY (`Id_Alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`),
  CONSTRAINT `FK_CMatri_CCorriente` FOREIGN KEY (`Id_cobro`) REFERENCES `tbl_cobromatricula` (`Id_cobro`),
  CONSTRAINT `FK_Desc_CCorriente` FOREIGN KEY (`Id_Descuento`) REFERENCES `tbl_descuento` (`Id_Descuento`),
  CONSTRAINT `FK_EstPago_CCorriente` FOREIGN KEY (`Id_Estado`) REFERENCES `tbl_estadopago` (`Id_Estado`),
  CONSTRAINT `FK_Matri_CCorriente` FOREIGN KEY (`Id_Matricula`) REFERENCES `tbl_matricula` (`Id_Matricula`),
  CONSTRAINT `FK_Precio_CCorriente` FOREIGN KEY (`Id_precio`) REFERENCES `tbl_precio` (`Id_precio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cuentacorriente`
--

/*!40000 ALTER TABLE `tbl_cuentacorriente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cuentacorriente` ENABLE KEYS */;


--
-- Definition of table `tbl_departamentos`
--

DROP TABLE IF EXISTS `tbl_departamentos`;
CREATE TABLE `tbl_departamentos` (
  `Id_Departamentos` int(11) NOT NULL AUTO_INCREMENT,
  `DescripDepart` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_Departamentos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_departamentos`
--

/*!40000 ALTER TABLE `tbl_departamentos` DISABLE KEYS */;
INSERT INTO `tbl_departamentos` (`Id_Departamentos`,`DescripDepart`) VALUES 
 (1,'DOCENCIA'),
 (2,'ADMINISTRACION');
/*!40000 ALTER TABLE `tbl_departamentos` ENABLE KEYS */;


--
-- Definition of table `tbl_descuento`
--

DROP TABLE IF EXISTS `tbl_descuento`;
CREATE TABLE `tbl_descuento` (
  `Id_Descuento` int(11) NOT NULL AUTO_INCREMENT,
  `Descuento` varchar(15) NOT NULL,
  `DescripDesc` varchar(20) NOT NULL,
  `ValorDesc` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Id_Descuento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_descuento`
--

/*!40000 ALTER TABLE `tbl_descuento` DISABLE KEYS */;
INSERT INTO `tbl_descuento` (`Id_Descuento`,`Descuento`,`DescripDesc`,`ValorDesc`) VALUES 
 (1,'MIEMBRO IGLESIA','MIEMBRO DE LA IGLESI','0.15'),
 (2,'GRUPAL','DESC GRUPAL','0.20');
/*!40000 ALTER TABLE `tbl_descuento` ENABLE KEYS */;


--
-- Definition of table `tbl_direcciones`
--

DROP TABLE IF EXISTS `tbl_direcciones`;
CREATE TABLE `tbl_direcciones` (
  `Id_Direcciones` int(11) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(45) DEFAULT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_alumno` int(11) NOT NULL,
  PRIMARY KEY (`Id_Direcciones`),
  KEY `FK_User_Dir` (`Id_usuario`),
  KEY `FK_alumno_Dir` (`Id_alumno`),
  CONSTRAINT `FK_User_Dir` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`),
  CONSTRAINT `FK_alumno_Dir` FOREIGN KEY (`Id_alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_direcciones`
--

/*!40000 ALTER TABLE `tbl_direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_direcciones` ENABLE KEYS */;


--
-- Definition of table `tbl_estado`
--

DROP TABLE IF EXISTS `tbl_estado`;
CREATE TABLE `tbl_estado` (
  `Id_Estado` int(11) NOT NULL AUTO_INCREMENT,
  `DescripEstatus` varchar(15) NOT NULL,
  PRIMARY KEY (`Id_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_estado`
--

/*!40000 ALTER TABLE `tbl_estado` DISABLE KEYS */;
INSERT INTO `tbl_estado` (`Id_Estado`,`DescripEstatus`) VALUES 
 (1,'NUEVO'),
 (2,'INACTIVO'),
 (3,'ACTIVO'),
 (4,'BLOQUEADO');
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;


--
-- Definition of table `tbl_estadocivil`
--

DROP TABLE IF EXISTS `tbl_estadocivil`;
CREATE TABLE `tbl_estadocivil` (
  `Id_EstadoCivil` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(15) NOT NULL,
  PRIMARY KEY (`Id_EstadoCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_estadocivil`
--

/*!40000 ALTER TABLE `tbl_estadocivil` DISABLE KEYS */;
INSERT INTO `tbl_estadocivil` (`Id_EstadoCivil`,`Descripcion`) VALUES 
 (1,'SOLTERO'),
 (2,'CASADO');
/*!40000 ALTER TABLE `tbl_estadocivil` ENABLE KEYS */;


--
-- Definition of table `tbl_estadopago`
--

DROP TABLE IF EXISTS `tbl_estadopago`;
CREATE TABLE `tbl_estadopago` (
  `Id_Estado` int(11) NOT NULL AUTO_INCREMENT,
  `EstadoPago` varchar(15) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_estadopago`
--

/*!40000 ALTER TABLE `tbl_estadopago` DISABLE KEYS */;
INSERT INTO `tbl_estadopago` (`Id_Estado`,`EstadoPago`,`Descripcion`) VALUES 
 (1,'PAGADO','PAGADO'),
 (2,'MORA','MORA');
/*!40000 ALTER TABLE `tbl_estadopago` ENABLE KEYS */;


--
-- Definition of table `tbl_genero`
--

DROP TABLE IF EXISTS `tbl_genero`;
CREATE TABLE `tbl_genero` (
  `Id_Genero` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` char(10) NOT NULL,
  PRIMARY KEY (`Id_Genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_genero`
--

/*!40000 ALTER TABLE `tbl_genero` DISABLE KEYS */;
INSERT INTO `tbl_genero` (`Id_Genero`,`Descripcion`) VALUES 
 (1,'FEMENINO'),
 (2,'MASCULINO');
/*!40000 ALTER TABLE `tbl_genero` ENABLE KEYS */;


--
-- Definition of table `tbl_hist_contrasena`
--

DROP TABLE IF EXISTS `tbl_hist_contrasena`;
CREATE TABLE `tbl_hist_contrasena` (
  `Id_Hist` int(11) NOT NULL AUTO_INCREMENT,
  `Contrasena` longtext NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Hist`),
  KEY `fkIdx_Usuario_HistC` (`Id_usuario`),
  CONSTRAINT `FK_Usuario_HistC` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hist_contrasena`
--

/*!40000 ALTER TABLE `tbl_hist_contrasena` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_hist_contrasena` ENABLE KEYS */;


--
-- Definition of table `tbl_matricula`
--

DROP TABLE IF EXISTS `tbl_matricula`;
CREATE TABLE `tbl_matricula` (
  `Id_Matricula` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Modalidad` int(10) NOT NULL,
  `Id_Orientacion` int(10) NOT NULL,
  `Id_Clase` int(10) NOT NULL,
  `Id_Seccion` int(11) NOT NULL,
  `Id_PeriodoAcm` int(11) NOT NULL,
  PRIMARY KEY (`Id_Matricula`),
  KEY `fkIdx_Alumno_Matricula` (`Id_Alumno`),
  KEY `fkIdx_Seccion_Matr` (`Id_Seccion`),
  KEY `fkIdx_Periodo_Matri` (`Id_PeriodoAcm`),
  KEY `FK_Modalidad` (`Id_Modalidad`),
  KEY `FK_Orientacion` (`Id_Orientacion`),
  KEY `FK_Clase` (`Id_Clase`),
  CONSTRAINT `FK_Alumno_Matricula` FOREIGN KEY (`Id_Alumno`) REFERENCES `tbl_alumnos` (`Id_Alumno`),
  CONSTRAINT `FK_Periodo_Matri` FOREIGN KEY (`Id_PeriodoAcm`) REFERENCES `tbl_periodoacademico` (`Id_PeriodoAcm`),
  CONSTRAINT `FK_Seccion_Matr` FOREIGN KEY (`Id_Seccion`) REFERENCES `tbl_secciones` (`Id_Seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_matricula`
--

/*!40000 ALTER TABLE `tbl_matricula` DISABLE KEYS */;
INSERT INTO `tbl_matricula` (`Id_Matricula`,`Id_Alumno`,`Id_Modalidad`,`Id_Orientacion`,`Id_Clase`,`Id_Seccion`,`Id_PeriodoAcm`) VALUES 
 (1,3,3,2,2,1,2),
 (2,4,2,1,1,2,2);
/*!40000 ALTER TABLE `tbl_matricula` ENABLE KEYS */;


--
-- Definition of table `tbl_mod_orientacion`
--

DROP TABLE IF EXISTS `tbl_mod_orientacion`;
CREATE TABLE `tbl_mod_orientacion` (
  `Id_Modalidad` int(11) NOT NULL,
  `Id_Orientacion` int(11) NOT NULL,
  KEY `FK_Mod_Orientacion` (`Id_Modalidad`),
  KEY `FK_Orientacion_Mod` (`Id_Orientacion`),
  CONSTRAINT `FK_Mod_Orientacion` FOREIGN KEY (`Id_Modalidad`) REFERENCES `tbl_modalidades` (`Id_Modalidad`),
  CONSTRAINT `FK_Orientacion_Mod` FOREIGN KEY (`Id_Orientacion`) REFERENCES `tbl_orientacion` (`Id_orientacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_mod_orientacion`
--

/*!40000 ALTER TABLE `tbl_mod_orientacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mod_orientacion` ENABLE KEYS */;


--
-- Definition of table `tbl_modalidades`
--

DROP TABLE IF EXISTS `tbl_modalidades`;
CREATE TABLE `tbl_modalidades` (
  `Id_Modalidad` int(11) NOT NULL AUTO_INCREMENT,
  `DescripModalidad` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_Modalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_modalidades`
--

/*!40000 ALTER TABLE `tbl_modalidades` DISABLE KEYS */;
INSERT INTO `tbl_modalidades` (`Id_Modalidad`,`DescripModalidad`) VALUES 
 (1,'DIPLOMADO'),
 (2,'TECNICO'),
 (3,'CURSO LIBRE');
/*!40000 ALTER TABLE `tbl_modalidades` ENABLE KEYS */;


--
-- Definition of table `tbl_objetos`
--

DROP TABLE IF EXISTS `tbl_objetos`;
CREATE TABLE `tbl_objetos` (
  `Id_Objeto` int(11) NOT NULL AUTO_INCREMENT,
  `Objeto` varchar(100) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `TipoObjeto` varchar(15) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_objetos`
--

/*!40000 ALTER TABLE `tbl_objetos` DISABLE KEYS */;
INSERT INTO `tbl_objetos` (`Id_Objeto`,`Objeto`,`Descripcion`,`TipoObjeto`,`FechaCreacion`,`FechaModificacion`,`CreadoPor`,`ModificadoPor`) VALUES 
 (1,'Pantalla Login','Formulario de inicio de sesion','Pagina PHP','2018-11-25','2018-11-25','admin',NULL),
 (2,'Pantalla preguntas','Formulario de preguntas de seguridad','Pagina PHP','2018-11-25','2018-11-25','admin',NULL),
 (3,'Pantalla reposicion','Formulario de envio de correo de recuperacion de contraseña','Pagina PHP','2018-11-25','2018-11-25','admin',NULL),
 (4,'Pantalla autoregistro','Formulario de registro de usuarios','Pagina PHP','2018-11-25','2018-11-25','admin',NULL),
 (5,'Pantalla area trabajo','Formulario de entorno de trabajo principal','Pagina PHP','2018-11-25','2018-11-25','admin',NULL),
 (6,'Pantalla cambio password','Formulario para cambiar password del usuario','Pagina PHP','2018-11-25','2018-11-25','admin',NULL),
 (7,'cierra sesion','pagina de cierre de sesion','Pagina PHP','2018-11-25','2018-11-25','admin',NULL);
/*!40000 ALTER TABLE `tbl_objetos` ENABLE KEYS */;


--
-- Definition of table `tbl_obsnotas`
--

DROP TABLE IF EXISTS `tbl_obsnotas`;
CREATE TABLE `tbl_obsnotas` (
  `Cod_Obs` int(11) NOT NULL AUTO_INCREMENT,
  `Observacion` varchar(25) NOT NULL,
  `DescripObs` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Obs`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_obsnotas`
--

/*!40000 ALTER TABLE `tbl_obsnotas` DISABLE KEYS */;
INSERT INTO `tbl_obsnotas` (`Cod_Obs`,`Observacion`,`DescripObs`) VALUES 
 (1,'APR','APRBADO'),
 (2,'RPD','REPROBADO');
/*!40000 ALTER TABLE `tbl_obsnotas` ENABLE KEYS */;


--
-- Definition of table `tbl_orientacion`
--

DROP TABLE IF EXISTS `tbl_orientacion`;
CREATE TABLE `tbl_orientacion` (
  `Id_orientacion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_orientacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_orientacion`
--

/*!40000 ALTER TABLE `tbl_orientacion` DISABLE KEYS */;
INSERT INTO `tbl_orientacion` (`Id_orientacion`,`Nombre`) VALUES 
 (1,'INTRUMENTO'),
 (2,'VOCAL');
/*!40000 ALTER TABLE `tbl_orientacion` ENABLE KEYS */;


--
-- Definition of table `tbl_orientacion_clase`
--

DROP TABLE IF EXISTS `tbl_orientacion_clase`;
CREATE TABLE `tbl_orientacion_clase` (
  `Id_Orientacion` int(11) NOT NULL,
  `Id_Clases` int(11) NOT NULL,
  KEY `FK_Orientacion_Claase` (`Id_Orientacion`),
  KEY `FK_Clases_Orientacion` (`Id_Clases`),
  CONSTRAINT `FK_Clases_Orientacion` FOREIGN KEY (`Id_Clases`) REFERENCES `tbl_clases` (`Id_Clase`),
  CONSTRAINT `FK_Orientacion_Claase` FOREIGN KEY (`Id_Orientacion`) REFERENCES `tbl_orientacion` (`Id_orientacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_orientacion_clase`
--

/*!40000 ALTER TABLE `tbl_orientacion_clase` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_orientacion_clase` ENABLE KEYS */;


--
-- Definition of table `tbl_pagoclases`
--

DROP TABLE IF EXISTS `tbl_pagoclases`;
CREATE TABLE `tbl_pagoclases` (
  `Id_Pago` int(11) NOT NULL AUTO_INCREMENT,
  `Duracion` decimal(10,0) NOT NULL,
  `Valor` decimal(8,2) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Id_Clase` int(11) NOT NULL,
  PRIMARY KEY (`Id_Pago`),
  KEY `FK_Clases_PagoC` (`Id_Clase`),
  CONSTRAINT `FK_Clases_PagoC` FOREIGN KEY (`Id_Clase`) REFERENCES `tbl_clases` (`Id_Clase`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pagoclases`
--

/*!40000 ALTER TABLE `tbl_pagoclases` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pagoclases` ENABLE KEYS */;


--
-- Definition of table `tbl_parametros`
--

DROP TABLE IF EXISTS `tbl_parametros`;
CREATE TABLE `tbl_parametros` (
  `Id_Parametro` int(11) NOT NULL AUTO_INCREMENT,
  `Parametro` varchar(50) NOT NULL,
  `Valor` varchar(100) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `Id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_Parametro`),
  KEY `fkIdx_Usuario_Par` (`Id_usuario`),
  CONSTRAINT `FK_Usuario_Par` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parametros`
--

/*!40000 ALTER TABLE `tbl_parametros` DISABLE KEYS */;
INSERT INTO `tbl_parametros` (`Id_Parametro`,`Parametro`,`Valor`,`FechaCreacion`,`FechaModificacion`,`Id_usuario`) VALUES 
 (1,'ADMIN_INTENTOS_INVALIDOS','5','2019-03-07','2019-03-07',1),
 (2,'ADMIN_PREGUNTAS','3','2019-03-07','2019-03-07',1),
 (3,'CORREO_ELECTRONICO','academiacead@gmail.com','2019-03-11',NULL,1),
 (4,'CONTRASENA_CORREO','Academia2019','2019-03-11',NULL,1),
 (10,'REMITENTE_CORREO','Academia CEAD','2019-03-12',NULL,1);
/*!40000 ALTER TABLE `tbl_parametros` ENABLE KEYS */;


--
-- Definition of table `tbl_periodoacademico`
--

DROP TABLE IF EXISTS `tbl_periodoacademico`;
CREATE TABLE `tbl_periodoacademico` (
  `Id_PeriodoAcm` int(11) NOT NULL AUTO_INCREMENT,
  `DescripPeriodo` varchar(45) NOT NULL,
  `Activo` char(1) NOT NULL,
  PRIMARY KEY (`Id_PeriodoAcm`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_periodoacademico`
--

/*!40000 ALTER TABLE `tbl_periodoacademico` DISABLE KEYS */;
INSERT INTO `tbl_periodoacademico` (`Id_PeriodoAcm`,`DescripPeriodo`,`Activo`) VALUES 
 (1,'IPAC2018','0'),
 (2,'IIPAC2018','1');
/*!40000 ALTER TABLE `tbl_periodoacademico` ENABLE KEYS */;


--
-- Definition of table `tbl_permisos`
--

DROP TABLE IF EXISTS `tbl_permisos`;
CREATE TABLE `tbl_permisos` (
  `PermisoInsercion` tinytext NOT NULL,
  `PermisoEliminacion` tinytext NOT NULL,
  `PermisoActualizacion` tinytext NOT NULL,
  `PermisoConsultar` tinytext NOT NULL,
  `Id_Rol` int(11) NOT NULL,
  `Id_Objeto` int(11) NOT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  KEY `fkIdx_Rol_Permisos` (`Id_Rol`),
  KEY `fkIdx_Obj_Permisos` (`Id_Objeto`),
  CONSTRAINT `FK_Obj_Permisos` FOREIGN KEY (`Id_Objeto`) REFERENCES `tbl_objetos` (`Id_Objeto`),
  CONSTRAINT `FK_Rol_Permisos` FOREIGN KEY (`Id_Rol`) REFERENCES `tbl_roles` (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_permisos`
--

/*!40000 ALTER TABLE `tbl_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_permisos` ENABLE KEYS */;


--
-- Definition of table `tbl_planilla`
--

DROP TABLE IF EXISTS `tbl_planilla`;
CREATE TABLE `tbl_planilla` (
  `Id_Planilla` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  `Valor` decimal(8,2) NOT NULL,
  `MesPago` varchar(15) NOT NULL,
  PRIMARY KEY (`Id_Planilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_planilla`
--

/*!40000 ALTER TABLE `tbl_planilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_planilla` ENABLE KEYS */;


--
-- Definition of table `tbl_planillapago`
--

DROP TABLE IF EXISTS `tbl_planillapago`;
CREATE TABLE `tbl_planillapago` (
  `MesPago` varchar(10) NOT NULL,
  `TotalPagar` decimal(8,2) DEFAULT NULL,
  `FechaGen` date DEFAULT NULL,
  `FechaPago` date DEFAULT NULL,
  `Id_asistencia` int(11) NOT NULL,
  `Id_Planilla` int(11) NOT NULL,
  `Id_Pago` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  KEY `fkIdx_Asist_PPago` (`Id_asistencia`),
  KEY `fkIdx_Planilla_PPago` (`Id_Planilla`),
  KEY `fkIdx_PClases_PPago` (`Id_Pago`),
  KEY `FK_User_Ppago` (`Id_usuario`),
  CONSTRAINT `FK_Asist_PPago` FOREIGN KEY (`Id_asistencia`) REFERENCES `tbl_asistencia` (`Id_asistencia`),
  CONSTRAINT `FK_PClases_PPago` FOREIGN KEY (`Id_Pago`) REFERENCES `tbl_pagoclases` (`Id_Pago`),
  CONSTRAINT `FK_Planilla_PPago` FOREIGN KEY (`Id_Planilla`) REFERENCES `tbl_planilla` (`Id_Planilla`),
  CONSTRAINT `FK_User_Ppago` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_planillapago`
--

/*!40000 ALTER TABLE `tbl_planillapago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_planillapago` ENABLE KEYS */;


--
-- Definition of table `tbl_precio`
--

DROP TABLE IF EXISTS `tbl_precio`;
CREATE TABLE `tbl_precio` (
  `Id_precio` int(11) NOT NULL AUTO_INCREMENT,
  `Precio` decimal(8,2) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_precio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_precio`
--

/*!40000 ALTER TABLE `tbl_precio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_precio` ENABLE KEYS */;


--
-- Definition of table `tbl_preguntas`
--

DROP TABLE IF EXISTS `tbl_preguntas`;
CREATE TABLE `tbl_preguntas` (
  `Id_Pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `Pregunta` varchar(45) NOT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  PRIMARY KEY (`Id_Pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_preguntas`
--

/*!40000 ALTER TABLE `tbl_preguntas` DISABLE KEYS */;
INSERT INTO `tbl_preguntas` (`Id_Pregunta`,`Pregunta`,`CreadoPor`,`ModificadoPor`,`FechaCreacion`,`FechaModificacion`) VALUES 
 (1,'Cual era el nombre de tu primera mascota?','1',NULL,'2018-11-07',NULL),
 (2,'Cual es el nombre de la ciudad en que naciste','1',NULL,'2018-11-07',NULL),
 (3,'Cual era tu apodo de niño?','1',NULL,'2018-11-07',NULL),
 (4,'Cual era el nombre de tu primer maestro?','1',NULL,'2018-10-10',NULL),
 (5,'Cual es tu color favorito?','1',NULL,'2018-10-10',NULL);
/*!40000 ALTER TABLE `tbl_preguntas` ENABLE KEYS */;


--
-- Definition of table `tbl_preguntasusuario`
--

DROP TABLE IF EXISTS `tbl_preguntasusuario`;
CREATE TABLE `tbl_preguntasusuario` (
  `Respuesta` varchar(45) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_Pregunta` int(11) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL,
  KEY `fkIdx_Usuario_PUsuario` (`Id_usuario`),
  KEY `fkIdx_Preguntas_PUsuario` (`Id_Pregunta`),
  CONSTRAINT `FK_Preguntas_PUsuario` FOREIGN KEY (`Id_Pregunta`) REFERENCES `tbl_preguntas` (`Id_Pregunta`),
  CONSTRAINT `FK_Usuario_PUsuario` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_preguntasusuario`
--

/*!40000 ALTER TABLE `tbl_preguntasusuario` DISABLE KEYS */;
INSERT INTO `tbl_preguntasusuario` (`Respuesta`,`Id_usuario`,`Id_Pregunta`,`FechaCreacion`,`FechaModificacion`,`CreadoPor`,`ModificadoPor`) VALUES 
 ('mei',1,1,'2019-03-08','2019-03-08','Autoregistro','Autoregistro'),
 ('keren',1,3,'2019-03-08','2019-03-08','Autoregistro','Autoregistro'),
 ('negro',1,5,'2019-03-08','2019-03-08','Autoregistro','Autoregistro'),
 ('mei',73,1,'2019-03-14','2019-03-14','Autoregistro','Autoregistro'),
 ('tegus',73,2,'2019-03-14','2019-03-14','Autoregistro','Autoregistro'),
 ('negro',73,5,'2019-03-14','2019-03-14','Autoregistro','Autoregistro'),
 ('coco',74,1,'2019-03-26','2019-03-26','Autoregistro','Autoregistro'),
 ('amarillo',74,5,'2019-03-26','2019-03-26','Autoregistro','Autoregistro'),
 ('tegucigalpa',74,2,'2019-03-26','2019-03-26','Autoregistro','Autoregistro');
/*!40000 ALTER TABLE `tbl_preguntasusuario` ENABLE KEYS */;


--
-- Definition of table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
CREATE TABLE `tbl_roles` (
  `Id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `Rol` varchar(30) NOT NULL,
  `DescripRol` varchar(20) NOT NULL,
  `CreadoPor` varchar(15) NOT NULL,
  `ModifcadoPor` varchar(15) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date DEFAULT NULL,
  PRIMARY KEY (`Id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_roles`
--

/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
INSERT INTO `tbl_roles` (`Id_Rol`,`Rol`,`DescripRol`,`CreadoPor`,`ModifcadoPor`,`FechaCreacion`,`FechaModificacion`) VALUES 
 (1,'ADMINISTRADOR','EDITAR','PRUEBA','PRUEBA','2018-10-17','2018-10-17'),
 (2,'DIRECTOR','Director','PRUEBA','PRUEBA','2018-10-10','2018-10-10'),
 (3,'DOCENTE','Docente','PRUEBA','PRUEBA','2018-10-10','2018-10-10'),
 (5,'PENDIENTE','PENDIENTE','PRUEBA','PRUEBA','2019-03-02','2019-03-02');
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;


--
-- Definition of table `tbl_secciones`
--

DROP TABLE IF EXISTS `tbl_secciones`;
CREATE TABLE `tbl_secciones` (
  `Id_Seccion` int(11) NOT NULL AUTO_INCREMENT,
  `DescripSeccion` varchar(45) NOT NULL,
  `HraClase` time DEFAULT NULL,
  `AulaClase` varchar(15) DEFAULT NULL,
  `Id_PeriodoAcm` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_Seccion`),
  KEY `fkIdx_Periodo_Seccion` (`Id_PeriodoAcm`),
  KEY `FK_User_Seccion` (`Id_usuario`),
  CONSTRAINT `FK_Periodo_Seccion` FOREIGN KEY (`Id_PeriodoAcm`) REFERENCES `tbl_periodoacademico` (`Id_PeriodoAcm`),
  CONSTRAINT `FK_User_Seccion` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_secciones`
--

/*!40000 ALTER TABLE `tbl_secciones` DISABLE KEYS */;
INSERT INTO `tbl_secciones` (`Id_Seccion`,`DescripSeccion`,`HraClase`,`AulaClase`,`Id_PeriodoAcm`,`Id_usuario`) VALUES 
 (1,'1700','00:00:17','A1',2,74),
 (2,'1800','00:00:18','A1',2,74);
/*!40000 ALTER TABLE `tbl_secciones` ENABLE KEYS */;


--
-- Definition of table `tbl_tipocontacto`
--

DROP TABLE IF EXISTS `tbl_tipocontacto`;
CREATE TABLE `tbl_tipocontacto` (
  `Id_Tipo` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(15) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tipocontacto`
--

/*!40000 ALTER TABLE `tbl_tipocontacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipocontacto` ENABLE KEYS */;


--
-- Definition of table `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
CREATE TABLE `tbl_usuarios` (
  `Id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(15) NOT NULL,
  `Contrasena` longtext NOT NULL,
  `FechaUltimaConex` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `PrimerNombre` varchar(15) NOT NULL,
  `SegundoNombre` varchar(15) DEFAULT NULL,
  `PrimerApellido` varchar(15) NOT NULL,
  `SegundoApellido` varchar(15) DEFAULT NULL,
  `Telefono` int(11) NOT NULL,
  `Cedula` bigint(13) NOT NULL,
  `PreguntasContestadas` bigint(20) DEFAULT NULL,
  `PrimerIngreso` bigint(20) DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `CorreoElectronico` varchar(50) DEFAULT NULL,
  `Id_Departamento` int(11) NOT NULL,
  `Id_Genero` int(11) NOT NULL,
  `Id_EstadoCivil` int(11) NOT NULL,
  `Id_Estado` int(11) DEFAULT NULL,
  `Id_Rol` int(11) DEFAULT NULL,
  `FechaCreacion` date DEFAULT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `CreadoPor` varchar(15) DEFAULT NULL,
  `ModificadoPor` varchar(15) DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id_usuario`),
  KEY `fkIdx_Rol_Usuario` (`Id_Rol`),
  KEY `fkIdx_Est_Usuario` (`Id_Estado`),
  KEY `FK_Depto_User` (`Id_Departamento`),
  KEY `FK_User_estcivil` (`Id_EstadoCivil`),
  KEY `FK_User_Genero` (`Id_Genero`),
  CONSTRAINT `FK_Depto_User` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamentos`),
  CONSTRAINT `FK_Est_Usuario` FOREIGN KEY (`Id_Estado`) REFERENCES `tbl_estado` (`Id_Estado`),
  CONSTRAINT `FK_User_Genero` FOREIGN KEY (`Id_Genero`) REFERENCES `tbl_genero` (`Id_Genero`),
  CONSTRAINT `FK_User_estcivil` FOREIGN KEY (`Id_EstadoCivil`) REFERENCES `tbl_estadocivil` (`Id_EstadoCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_usuarios`
--

/*!40000 ALTER TABLE `tbl_usuarios` DISABLE KEYS */;
INSERT INTO `tbl_usuarios` (`Id_usuario`,`Usuario`,`Contrasena`,`FechaUltimaConex`,`PrimerNombre`,`SegundoNombre`,`PrimerApellido`,`SegundoApellido`,`Telefono`,`Cedula`,`PreguntasContestadas`,`PrimerIngreso`,`FechaVencimiento`,`CorreoElectronico`,`Id_Departamento`,`Id_Genero`,`Id_EstadoCivil`,`Id_Estado`,`Id_Rol`,`FechaCreacion`,`FechaModificacion`,`CreadoPor`,`ModificadoPor`,`code`) VALUES 
 (1,'ADMIN','$2y$10$jKczoPIcnHY3dTat6UBmxePTNKhS8UP.2PKqOb3S2QYYtl8q6mSBW','2019-03-25 21:13:41','ADMIN',NULL,'ADMIN',NULL,11111111,801000011111,NULL,1,NULL,'kyanes917@gmail.com',2,1,1,3,1,NULL,NULL,NULL,NULL,NULL),
 (72,'KERENY','$2y$10$EzPOcGHPLgelAGAN.p6Ue.V9zg/UypIsOuqD/GgCuZ8X/GqUUSHJG',NULL,'KEREN','','YANES','',88888888,801000011111,NULL,0,NULL,'abc@abc.com',1,1,1,1,1,NULL,NULL,NULL,NULL,NULL),
 (73,'KERENP','$2y$10$PZBh.esTMgFL1O.SC.tPvOzdOESdR6tT24PG0FM97Ic39UbagnFyO','2019-03-13 23:44:09','KERENPL','','YANES','',88888888,801000011111,NULL,1,NULL,'kyanes917@gmail.com',1,1,1,1,3,NULL,NULL,NULL,NULL,NULL),
 (74,'NICOLLE','$2y$10$jTc/NckI9..cYgwvOGcyTOKKCwE59kHA8epi9hVYs5SpNqC4XVwMW','2019-03-25 22:28:46','YOSSELINE','NICOLLE','VARELA','LANZA',22334455,801198512354,NULL,1,NULL,NULL,1,1,1,1,3,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_usuarios` ENABLE KEYS */;


--
-- Definition of procedure `sp_addbitacora`
--

DROP PROCEDURE IF EXISTS `sp_addbitacora`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addbitacora`(IN `fecha_accion` DATETIME, IN `accn` VARCHAR(20), IN `descrip` VARCHAR(100), IN `id_usr` INT, IN `id_obj` INT)
begin
  insert into tbl_Bitacora(Fecha,Accion, Descripcion, Id_usuario, Id_Objeto)
  values(fecha_accion, accn, descrip, id_usr, id_obj);
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `SP_INSERTAR_USUARIO`
--

DROP PROCEDURE IF EXISTS `SP_INSERTAR_USUARIO`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERTAR_USUARIO`(IN `pcUsuario` VARCHAR(15), IN `pcContrasena` LONGTEXT, IN `pcPrimerNombre` VARCHAR(15), IN `pcSegundoNombre` VARCHAR(15), IN `pcPrimerApellido` VARCHAR(15), IN `pcSegundoApellido` VARCHAR(15), IN `pcTelefono` INT(11), IN `pcCedula` INT(13), IN `pcCorreoElectronico` VARCHAR(50), IN `pcId_Departamento` INT(11), IN `pcId_EstadoCivil` INT(11), IN `pcId_Genero` INT(11), OUT `pcMensajeError` VARCHAR(1000))
BEGIN

DECLARE vcTempMensajeError VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados
   DECLARE vcMensajeErrorServidor VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
   	
       GET DIAGNOSTICS CONDITION 1 vcMensajeErrorServidor = message_text;        
       ROLLBACK;
       	  
       SET vcTempMensajeError := CONCAT('Error: ', vcTempMensajeError, ' Server: ', vcMensajeErrorServidor);
       SET pcMensajeError := vcTempMensajeError;
   
   END;

-- Determina si la inserción del usuario falla	
   SET vcTempMensajeError := 'Al insertar el usuario';

INSERT INTO tbl_usuarios (Usuario, Contrasena, PrimerNombre, SegundoNombre,
 PrimerApellido, SegundoApellido, Telefono, Cedula,PrimerIngreso,
 CorreoElectronico, Id_Departamento, Id_EstadoCivil, Id_Genero,
 Id_Estado, Id_Rol, FechaCreacion) 
 
 VALUES (pcUsuario, pcContrasena, pcPrimerNombre, pcSegundoNombre,
 pcPrimerApellido, pcSegundoApellido, pcTelefono, pcCedula,0,
 pcCorreoElectronico, pcId_Departamento, pcId_EstadoCivil, pcId_Genero,
 1, 5, NOW());

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `SP_OBTENER_DEPARTAMENTOS`
--

DROP PROCEDURE IF EXISTS `SP_OBTENER_DEPARTAMENTOS`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_DEPARTAMENTOS`(OUT `pcMensajeError` VARCHAR(1000))
BEGIN

DECLARE vcTempMensajeError VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados
   DECLARE vcMensajeErrorServidor VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
   	
       GET DIAGNOSTICS CONDITION 1 vcMensajeErrorServidor = message_text;        
       ROLLBACK;
       	  
       SET vcTempMensajeError := CONCAT('Error: ', vcTempMensajeError, ' Server: ', vcMensajeErrorServidor);
       SET pcMensajeError := vcTempMensajeError;
   
   END;

-- Determina la obtención de los departamentos
SET vcTempMensajeError := 'Al obtener los departamentos';
   SELECT Id_Departamentos, DescripDepart FROM tbl_departamentos;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `SP_OBTENER_ESTADOSCIVILES`
--

DROP PROCEDURE IF EXISTS `SP_OBTENER_ESTADOSCIVILES`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_ESTADOSCIVILES`(OUT `pcMensajeError` VARCHAR(1000))
BEGIN

DECLARE vcTempMensajeError VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados
   DECLARE vcMensajeErrorServidor VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
   	
       GET DIAGNOSTICS CONDITION 1 vcMensajeErrorServidor = message_text;        
       ROLLBACK;
       	  
       SET vcTempMensajeError := CONCAT('Error: ', vcTempMensajeError, ' Server: ', vcMensajeErrorServidor);
       SET pcMensajeError := vcTempMensajeError;
   
   END;

-- Determina la obtención de los estados civiles
SET vcTempMensajeError := 'Al obtener los estados civiles';
   SELECT Id_EstadoCivil, Descripcion FROM tbl_estadocivil;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `SP_OBTENER_GENEROS`
--

DROP PROCEDURE IF EXISTS `SP_OBTENER_GENEROS`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_GENEROS`(OUT `pcMensajeError` VARCHAR(1000))
BEGIN

DECLARE vcTempMensajeError VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados
   DECLARE vcMensajeErrorServidor VARCHAR(500) DEFAULT ''; -- Variable para posibles errores no con	trolados

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
   	
       GET DIAGNOSTICS CONDITION 1 vcMensajeErrorServidor = message_text;        
       ROLLBACK;
       	  
       SET vcTempMensajeError := CONCAT('Error: ', vcTempMensajeError, ' Server: ', vcMensajeErrorServidor);
       SET pcMensajeError := vcTempMensajeError;
   
   END;

-- Determina la obtención de los generos
SET vcTempMensajeError := 'Al obtener los generos';
   SELECT Id_Genero, Descripcion FROM tbl_genero;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
