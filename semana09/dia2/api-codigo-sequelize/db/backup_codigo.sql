
DROP TABLE IF EXISTS `tbl_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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

--
-- Table structure for table `tbl_curso`
--

DROP TABLE IF EXISTS `tbl_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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

DROP TABLE IF EXISTS `tbl_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `tbl_matricula`
--

DROP TABLE IF EXISTS `tbl_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_matricula`
--

LOCK TABLES `tbl_matricula` WRITE;
/*!40000 ALTER TABLE `tbl_matricula` DISABLE KEYS */;
INSERT INTO `tbl_matricula` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `tbl_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_matricula_curso`
--

DROP TABLE IF EXISTS `tbl_matricula_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_matricula_curso` (
  `matricula_curso_id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`matricula_curso_id`),
  KEY `fk_tbl_matricula_curso_tbl_matricula1` (`matricula_id`),
  KEY `fk_tbl_matricula_curso_tbl_curso1` (`curso_id`),
  CONSTRAINT `fk_tbl_matricula_curso_tbl_curso1` FOREIGN KEY (`curso_id`) REFERENCES `tbl_curso` (`curso_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_curso_tbl_matricula1` FOREIGN KEY (`matricula_id`) REFERENCES `tbl_matricula` (`matricula_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_matricula_curso`
--

LOCK TABLES `tbl_matricula_curso` WRITE;
/*!40000 ALTER TABLE `tbl_matricula_curso` DISABLE KEYS */;
INSERT INTO `tbl_matricula_curso` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6);
/*!40000 ALTER TABLE `tbl_matricula_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_matricula_nota`
--

DROP TABLE IF EXISTS `tbl_matricula_nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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

