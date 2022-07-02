-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_codigo
CREATE DATABASE IF NOT EXISTS `db_codigo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_codigo`;

-- Volcando estructura para procedimiento db_codigo.ejemplo_bucle
DELIMITER //
CREATE PROCEDURE `ejemplo_bucle`(IN tope INT, OUT suma INT UNSIGNED)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    SET suma = 0;

    bucle: LOOP
        IF contador>tope THEN
            LEAVE bucle;
        END IF;

        SET suma=suma+contador;
        SET contador=contador+1;
    END LOOP;
END//
DELIMITER ;

-- Volcando estructura para función db_codigo.fn_contar_cursos
DELIMITER //
CREATE FUNCTION `fn_contar_cursos`(alumnoId INT) RETURNS int(10) unsigned
BEGIN
    DECLARE total INT UNSIGNED;

    SELECT count(*) into total
    from tbl_matricula_curso mc
    INNER JOIN tbl_matricula m on mc.matricula_id=m.matricula_id
    WHERE alumno_id=alumnoId;

    RETURN total;
END//
DELIMITER ;

-- Volcando estructura para procedimiento db_codigo.listar_alumnos
DELIMITER //
CREATE PROCEDURE `listar_alumnos`()
BEGIN
    SELECT * FROM tbl_alumno;
END//
DELIMITER ;

-- Volcando estructura para procedimiento db_codigo.sp_matricular_alumno
DELIMITER //
CREATE PROCEDURE `sp_matricular_alumno`(IN alu_id INT, IN niv_id INT, IN mod_id INT)
BEGIN
    
    DECLARE matriculaId INT;
    DECLARE cursoId INT;
    DECLARE totalCursos INT;
    SET matriculaId=0;
    SET cursoId=1;
    SET totalCursos=0;

    
    insert INTO tbl_matricula(alumno_id,nivel_id,modulo_id)
    values(alu_id,niv_id,mod_id);

    SELECT max(matricula_id) INTO matriculaId from tbl_matricula;

    SELECT count(*) into totalCursos from tbl_curso;

    WHILE cursoId<=totalCursos DO
        INSERT INTO tbl_matricula_curso(matricula_id,curso_id)
        values (matriculaId,cursoId);

        SET cursoId = cursoId + 1;
    END WHILE;
END//
DELIMITER ;

-- Volcando estructura para tabla db_codigo.tbl_alumno
CREATE TABLE IF NOT EXISTS `tbl_alumno` (
  `alumno_id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno_nombre` varchar(100) NOT NULL,
  `alumno_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`alumno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_codigo.tbl_alumno: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_alumno` DISABLE KEYS */;
INSERT INTO `tbl_alumno` (`alumno_id`, `alumno_nombre`, `alumno_email`) VALUES
	(1, 'César Mayta', 'cesarmayta@gmail.com'),
	(2, 'Susana Perez', 'susanaperez@hotmail.com'),
	(3, 'Claudia Loza', 'claudialoza@yahoo.com'),
	(4, 'Anibal Ruiz', 'anibalruiz@gmail.com'),
	(5, 'Jorge Contreras', 'jorgecontreras@gmail.com'),
	(6, 'Gino Carranza', 'gino.carranza@codigo.edu.pe');
/*!40000 ALTER TABLE `tbl_alumno` ENABLE KEYS */;

-- Volcando estructura para tabla db_codigo.tbl_curso
CREATE TABLE IF NOT EXISTS `tbl_curso` (
  `curso_id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`curso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_codigo.tbl_curso: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_curso` DISABLE KEYS */;
INSERT INTO `tbl_curso` (`curso_id`, `curso_nombre`) VALUES
	(1, 'HTML Y CSS'),
	(2, 'JAVASCRIPT'),
	(3, 'REACT.JS'),
	(4, 'PYTHON'),
	(5, 'MYSQL'),
	(6, 'FLASK');
/*!40000 ALTER TABLE `tbl_curso` ENABLE KEYS */;

-- Volcando estructura para tabla db_codigo.tbl_evaluacion
CREATE TABLE IF NOT EXISTS `tbl_evaluacion` (
  `evaluacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`evaluacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_codigo.tbl_evaluacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_evaluacion` DISABLE KEYS */;
INSERT INTO `tbl_evaluacion` (`evaluacion_id`, `evaluacion_nombre`) VALUES
	(1, 'PROYECTO CURSO');
/*!40000 ALTER TABLE `tbl_evaluacion` ENABLE KEYS */;

-- Volcando estructura para tabla db_codigo.tbl_matricula
CREATE TABLE IF NOT EXISTS `tbl_matricula` (
  `matricula_id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno_id` int(11) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  PRIMARY KEY (`matricula_id`),
  KEY `fk_tbl_matricula_tbl_alumno` (`alumno_id`),
  KEY `fk_tbl_matricula_tbl_nivel1` (`nivel_id`),
  KEY `fk_tbl_matricula_tbl_modulo1` (`modulo_id`),
  CONSTRAINT `fk_tbl_matricula_tbl_alumno` FOREIGN KEY (`alumno_id`) REFERENCES `tbl_alumno` (`alumno_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_tbl_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `tbl_modulo` (`modulo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_tbl_nivel1` FOREIGN KEY (`nivel_id`) REFERENCES `tbl_nivel` (`nivel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_codigo.tbl_matricula: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_matricula` DISABLE KEYS */;
INSERT INTO `tbl_matricula` (`matricula_id`, `alumno_id`, `nivel_id`, `modulo_id`) VALUES
	(1, 1, 1, 1),
	(2, 1, 1, 1);
/*!40000 ALTER TABLE `tbl_matricula` ENABLE KEYS */;

-- Volcando estructura para tabla db_codigo.tbl_matricula_curso
CREATE TABLE IF NOT EXISTS `tbl_matricula_curso` (
  `matricula_curso_id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`matricula_curso_id`),
  KEY `fk_tbl_matricula_curso_tbl_matricula1` (`matricula_id`),
  KEY `fk_tbl_matricula_curso_tbl_curso1` (`curso_id`),
  CONSTRAINT `fk_tbl_matricula_curso_tbl_curso1` FOREIGN KEY (`curso_id`) REFERENCES `tbl_curso` (`curso_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_curso_tbl_matricula1` FOREIGN KEY (`matricula_id`) REFERENCES `tbl_matricula` (`matricula_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_codigo.tbl_matricula_curso: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_matricula_curso` DISABLE KEYS */;
INSERT INTO `tbl_matricula_curso` (`matricula_curso_id`, `matricula_id`, `curso_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 2, 1),
	(8, 2, 2),
	(9, 2, 3),
	(10, 2, 4),
	(11, 2, 5),
	(12, 2, 6);
/*!40000 ALTER TABLE `tbl_matricula_curso` ENABLE KEYS */;

-- Volcando estructura para tabla db_codigo.tbl_matricula_nota
CREATE TABLE IF NOT EXISTS `tbl_matricula_nota` (
  `matricula_nota_id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_id` int(11) NOT NULL,
  `evaluacion_id` int(11) NOT NULL,
  `matricula_nota_valor` double DEFAULT NULL,
  PRIMARY KEY (`matricula_nota_id`),
  KEY `fk_tbl_matricula_nota_tbl_matricula1` (`matricula_id`),
  KEY `fk_tbl_matricula_nota_tbl_evaluacion1` (`evaluacion_id`),
  CONSTRAINT `fk_tbl_matricula_nota_tbl_evaluacion1` FOREIGN KEY (`evaluacion_id`) REFERENCES `tbl_evaluacion` (`evaluacion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_nota_tbl_matricula1` FOREIGN KEY (`matricula_id`) REFERENCES `tbl_matricula` (`matricula_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_codigo.tbl_matricula_nota: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_matricula_nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_matricula_nota` ENABLE KEYS */;

-- Volcando estructura para tabla db_codigo.tbl_modulo
CREATE TABLE IF NOT EXISTS `tbl_modulo` (
  `modulo_id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`modulo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_codigo.tbl_modulo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_modulo` DISABLE KEYS */;
INSERT INTO `tbl_modulo` (`modulo_id`, `modulo_nombre`) VALUES
	(1, 'FRONT END'),
	(2, 'BACKEND');
/*!40000 ALTER TABLE `tbl_modulo` ENABLE KEYS */;

-- Volcando estructura para tabla db_codigo.tbl_nivel
CREATE TABLE IF NOT EXISTS `tbl_nivel` (
  `nivel_id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_codigo.tbl_nivel: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_nivel` DISABLE KEYS */;
INSERT INTO `tbl_nivel` (`nivel_id`, `nivel_nombre`) VALUES
	(1, 'BASICO'),
	(2, 'AVANZADO');
/*!40000 ALTER TABLE `tbl_nivel` ENABLE KEYS */;

-- Volcando estructura para vista db_codigo.vw_matricula_alumno
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_matricula_alumno` (
	`alumno` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`nivel` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`modulo` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para disparador db_codigo.tg_correo_alumno
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER tg_correo_alumno
BEFORE INSERT
ON tbl_alumno FOR EACH ROW
BEGIN
    set NEW.alumno_email=CONCAT(lower(REPLACE(NEW.alumno_nombre,' ','.')),'@codigo.edu.pe');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para vista db_codigo.vw_matricula_alumno
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_matricula_alumno`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_matricula_alumno` AS SELECT
a.alumno_nombre as alumno,
n.nivel_nombre as nivel,
m.modulo_nombre as modulo
from tbl_matricula mat
inner JOIN tbl_alumno a on mat.alumno_id=a.alumno_id
inner JOIN tbl_nivel n on mat.nivel_id=n.nivel_id
inner JOIN tbl_modulo m on mat.modulo_id=m.modulo_id ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
