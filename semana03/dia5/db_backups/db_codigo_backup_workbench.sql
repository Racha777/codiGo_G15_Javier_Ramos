-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_codigo
-- ------------------------------------------------------
-- Server version	5.7.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_alumno`
--

DROP TABLE IF EXISTS `tbl_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_alumno` (
  `alumno_id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno_nombre` varchar(100) NOT NULL,
  `alumno_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`alumno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_alumno`
--

LOCK TABLES `tbl_alumno` WRITE;
/*!40000 ALTER TABLE `tbl_alumno` DISABLE KEYS */;
INSERT INTO `tbl_alumno` VALUES (1,'César Mayta','cesarmayta@gmail.com'),(2,'Susana Perez','susanaperez@hotmail.com'),(3,'Claudia Loza','claudialoza@yahoo.com'),(4,'Anibal Ruiz','anibalruiz@gmail.com'),(5,'Jorge Contreras','jorgecontreras@gmail.com'),(6,'Gino Carranza','gino.carranza@codigo.edu.pe');
/*!40000 ALTER TABLE `tbl_alumno` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tg_correo_alumno
BEFORE INSERT
ON tbl_alumno FOR EACH ROW
BEGIN
    set NEW.alumno_email=CONCAT(lower(REPLACE(NEW.alumno_nombre,' ','.')),'@codigo.edu.pe');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_curso`
--

DROP TABLE IF EXISTS `tbl_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_curso` (
  `curso_id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`curso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_curso`
--

LOCK TABLES `tbl_curso` WRITE;
/*!40000 ALTER TABLE `tbl_curso` DISABLE KEYS */;
INSERT INTO `tbl_curso` VALUES (1,'HTML Y CSS'),(2,'JAVASCRIPT'),(3,'REACT.JS'),(4,'PYTHON'),(5,'MYSQL'),(6,'FLASK');
/*!40000 ALTER TABLE `tbl_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_evaluacion`
--

DROP TABLE IF EXISTS `tbl_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_evaluacion` (
  `evaluacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`evaluacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_evaluacion`
--

LOCK TABLES `tbl_evaluacion` WRITE;
/*!40000 ALTER TABLE `tbl_evaluacion` DISABLE KEYS */;
INSERT INTO `tbl_evaluacion` VALUES (1,'PROYECTO CURSO');
/*!40000 ALTER TABLE `tbl_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_matricula`
--

DROP TABLE IF EXISTS `tbl_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_matricula` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_matricula`
--

LOCK TABLES `tbl_matricula` WRITE;
/*!40000 ALTER TABLE `tbl_matricula` DISABLE KEYS */;
INSERT INTO `tbl_matricula` VALUES (1,1,1,1),(2,1,1,1);
/*!40000 ALTER TABLE `tbl_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_matricula_curso`
--

DROP TABLE IF EXISTS `tbl_matricula_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_matricula_curso` (
  `matricula_curso_id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`matricula_curso_id`),
  KEY `fk_tbl_matricula_curso_tbl_matricula1` (`matricula_id`),
  KEY `fk_tbl_matricula_curso_tbl_curso1` (`curso_id`),
  CONSTRAINT `fk_tbl_matricula_curso_tbl_curso1` FOREIGN KEY (`curso_id`) REFERENCES `tbl_curso` (`curso_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_curso_tbl_matricula1` FOREIGN KEY (`matricula_id`) REFERENCES `tbl_matricula` (`matricula_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_matricula_curso`
--

LOCK TABLES `tbl_matricula_curso` WRITE;
/*!40000 ALTER TABLE `tbl_matricula_curso` DISABLE KEYS */;
INSERT INTO `tbl_matricula_curso` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,2,1),(8,2,2),(9,2,3),(10,2,4),(11,2,5),(12,2,6);
/*!40000 ALTER TABLE `tbl_matricula_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_matricula_nota`
--

DROP TABLE IF EXISTS `tbl_matricula_nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_matricula_nota` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_matricula_nota`
--

LOCK TABLES `tbl_matricula_nota` WRITE;
/*!40000 ALTER TABLE `tbl_matricula_nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_matricula_nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modulo`
--

DROP TABLE IF EXISTS `tbl_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_modulo` (
  `modulo_id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`modulo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modulo`
--

LOCK TABLES `tbl_modulo` WRITE;
/*!40000 ALTER TABLE `tbl_modulo` DISABLE KEYS */;
INSERT INTO `tbl_modulo` VALUES (1,'FRONT END'),(2,'BACKEND');
/*!40000 ALTER TABLE `tbl_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nivel`
--

DROP TABLE IF EXISTS `tbl_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_nivel` (
  `nivel_id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nivel`
--

LOCK TABLES `tbl_nivel` WRITE;
/*!40000 ALTER TABLE `tbl_nivel` DISABLE KEYS */;
INSERT INTO `tbl_nivel` VALUES (1,'BASICO'),(2,'AVANZADO');
/*!40000 ALTER TABLE `tbl_nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_matricula_alumno`
--

DROP TABLE IF EXISTS `vw_matricula_alumno`;
/*!50001 DROP VIEW IF EXISTS `vw_matricula_alumno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_matricula_alumno` AS SELECT 
 1 AS `alumno`,
 1 AS `nivel`,
 1 AS `modulo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'db_codigo'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_contar_cursos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_contar_cursos`(alumnoId INT) RETURNS int(10) unsigned
BEGIN
    DECLARE total INT UNSIGNED;

    SELECT count(*) into total
    from tbl_matricula_curso mc
    INNER JOIN tbl_matricula m on mc.matricula_id=m.matricula_id
    WHERE alumno_id=alumnoId;

    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ejemplo_bucle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ejemplo_bucle`(IN tope INT, OUT suma INT UNSIGNED)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_alumnos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_alumnos`()
BEGIN
    SELECT * FROM tbl_alumno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_matricular_alumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_matricular_alumno`(IN alu_id INT, IN niv_id INT, IN mod_id INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_matricula_alumno`
--

/*!50001 DROP VIEW IF EXISTS `vw_matricula_alumno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_matricula_alumno` AS select `a`.`alumno_nombre` AS `alumno`,`n`.`nivel_nombre` AS `nivel`,`m`.`modulo_nombre` AS `modulo` from (((`tbl_matricula` `mat` join `tbl_alumno` `a` on((`mat`.`alumno_id` = `a`.`alumno_id`))) join `tbl_nivel` `n` on((`mat`.`nivel_id` = `n`.`nivel_id`))) join `tbl_modulo` `m` on((`mat`.`modulo_id` = `m`.`modulo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-02 14:27:49
