-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: australiacomplete
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `datos_climaticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_climaticos` (
  `Id_Clima` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Ciudad` int(11) NOT NULL,
  `Año` int(11) NOT NULL,
  `Temperatura_Maxima` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Id_Clima`),
  KEY `Id_Ciudad` (`Id_Ciudad`),
  CONSTRAINT `datos_climaticos_ibfk_1` FOREIGN KEY (`Id_Ciudad`) REFERENCES `lugares` (`Id_Ciudad`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40000 ALTER TABLE `datos_climaticos` DISABLE KEYS */;
INSERT INTO `datos_climaticos` VALUES (1,1,2020,43.00),(2,2,2020,40.75),(3,3,2020,39.20);
/*!40000 ALTER TABLE `datos_climaticos` ENABLE KEYS */;


DROP TABLE IF EXISTS `expectativavida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expectativavida` (
  `Id_Expectativa` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Ciudad` int(11) NOT NULL,
  `Año` int(11) NOT NULL,
  `Esperanza_Vida_General` decimal(5,2) DEFAULT NULL,
  `Esperanza_Vida_Hombres` decimal(5,2) DEFAULT NULL,
  `Esperanza_Vida_Mujeres` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Id_Expectativa`),
  KEY `Id_Ciudad` (`Id_Ciudad`),
  CONSTRAINT `expectativavida_ibfk_1` FOREIGN KEY (`Id_Ciudad`) REFERENCES `lugares` (`Id_Ciudad`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40000 ALTER TABLE `expectativavida` DISABLE KEYS */;
INSERT INTO `expectativavida` VALUES (1,1,2020,82.50,80.00,85.00),(2,2,2020,81.00,79.00,83.00),(3,3,2020,80.50,78.50,82.50);
/*!40000 ALTER TABLE `expectativavida` ENABLE KEYS */;


DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos` (
  `Id_Ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Ciudad` int(11) NOT NULL,
  `Año` int(11) NOT NULL,
  `Ingreso_Total` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`Id_Ingreso`),
  KEY `Id_Ciudad` (`Id_Ciudad`),
  CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`Id_Ciudad`) REFERENCES `lugares` (`Id_Ciudad`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (1,1,2020,750000000.00),(2,2,2020,650000000.00),(3,3,2020,500000000.00);
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;


DROP TABLE IF EXISTS `lugares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugares` (
  `Id_Ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `Ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `lugares` DISABLE KEYS */;
INSERT INTO `lugares` VALUES (1,'Sydney'),(2,'Melbourne'),(3,'Brisbane');
/*!40000 ALTER TABLE `lugares` ENABLE KEYS */;


DROP TABLE IF EXISTS `poblacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poblacion` (
  `Id_Poblacion` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Ciudad` int(11) NOT NULL,
  `Año` int(11) NOT NULL,
  `Poblacion_Total` int(11) DEFAULT NULL,
  `Poblacion_Hombres` int(11) DEFAULT NULL,
  `Poblacion_Mujeres` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Poblacion`),
  KEY `Id_Ciudad` (`Id_Ciudad`),
  CONSTRAINT `poblacion_ibfk_1` FOREIGN KEY (`Id_Ciudad`) REFERENCES `lugares` (`Id_Ciudad`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40000 ALTER TABLE `poblacion` DISABLE KEYS */;
INSERT INTO `poblacion` VALUES (1,1,2020,5000000,2400000,2600000),(2,2,2020,4000000,1900000,2100000);
/*!40000 ALTER TABLE `poblacion` ENABLE KEYS */;

DROP TABLE IF EXISTS `v_expectativavidacompleta`;
/*!50001 DROP VIEW IF EXISTS `v_expectativavidacompleta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_expectativavidacompleta` AS SELECT 
 1 AS `Ciudad`,
 1 AS `Año`,
 1 AS `Esperanza_Vida_General`,
 1 AS `Esperanza_Vida_Hombres`,
 1 AS `Esperanza_Vida_Mujeres`*/;
SET character_set_client = @saved_cs_client;


DROP TABLE IF EXISTS `v_nombresciudades`;
/*!50001 DROP VIEW IF EXISTS `v_nombresciudades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_nombresciudades` AS SELECT 
 1 AS `Ciudad`*/;
SET character_set_client = @saved_cs_client;


DROP TABLE IF EXISTS `v_poblacionporciudad`;
/*!50001 DROP VIEW IF EXISTS `v_poblacionporciudad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_poblacionporciudad` AS SELECT 
 1 AS `Ciudad`,
 1 AS `Año`,
 1 AS `Poblacion_Total`,
 1 AS `Poblacion_Hombres`,
 1 AS `Poblacion_Mujeres`*/;
SET character_set_client = @saved_cs_client

DROP TABLE IF EXISTS `v_resumeningresos`;
/*!50001 DROP VIEW IF EXISTS `v_resumeningresos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_resumeningresos` AS SELECT 
 1 AS `Ciudad`,
 1 AS `Año`,
 1 AS `Ingreso_Total`*/;
SET character_set_client = @saved_cs_client;

/*!50003 DROP PROCEDURE IF EXISTS `FiltrarCiudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FiltrarCiudad`(IN nomCiudad VARCHAR(100))
BEGIN

    SELECT 

        l.Id_Ciudad,

        l.Ciudad,

        p.Año AS Año_Poblacion,

        p.Poblacion_Total,

        p.Poblacion_Hombres,

        p.Poblacion_Mujeres,

        e.Año AS Año_Expectativa,

        e.Esperanza_Vida_General,

        e.Esperanza_Vida_Hombres,

        e.Esperanza_Vida_Mujeres,

        c.Año AS Año_Clima,

        c.Temperatura_Maxima,

        i.Año AS Año_Ingresos,

        i.Ingreso_Total

    FROM Lugares l

    LEFT JOIN Poblacion p ON l.Id_Ciudad = p.Id_Ciudad

    LEFT JOIN ExpectativaVida e ON l.Id_Ciudad = e.Id_Ciudad

    LEFT JOIN Datos_Climaticos c ON l.Id_Ciudad = c.Id_Ciudad

    LEFT JOIN Ingresos i ON l.Id_Ciudad = i.Id_Ciudad

    WHERE l.Ciudad = nomCiudad;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

/*!50001 DROP VIEW IF EXISTS `v_expectativavidacompleta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_expectativavidacompleta` AS select `l`.`Ciudad` AS `Ciudad`,`e`.`Año` AS `Año`,`e`.`Esperanza_Vida_General` AS `Esperanza_Vida_General`,`e`.`Esperanza_Vida_Hombres` AS `Esperanza_Vida_Hombres`,`e`.`Esperanza_Vida_Mujeres` AS `Esperanza_Vida_Mujeres` from (`expectativavida` `e` join `lugares` `l` on(`e`.`Id_Ciudad` = `l`.`Id_Ciudad`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_nombresciudades`
--

/*!50001 DROP VIEW IF EXISTS `v_nombresciudades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_nombresciudades` AS select `lugares`.`Ciudad` AS `Ciudad` from `lugares` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;


/*!50001 DROP VIEW IF EXISTS `v_poblacionporciudad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_poblacionporciudad` AS select `l`.`Ciudad` AS `Ciudad`,`p`.`Año` AS `Año`,`p`.`Poblacion_Total` AS `Poblacion_Total`,`p`.`Poblacion_Hombres` AS `Poblacion_Hombres`,`p`.`Poblacion_Mujeres` AS `Poblacion_Mujeres` from (`poblacion` `p` join `lugares` `l` on(`p`.`Id_Ciudad` = `l`.`Id_Ciudad`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!50001 DROP VIEW IF EXISTS `v_resumeningresos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_resumeningresos` AS select `l`.`Ciudad` AS `Ciudad`,`i`.`Año` AS `Año`,`i`.`Ingreso_Total` AS `Ingreso_Total` from (`ingresos` `i` join `lugares` `l` on(`i`.`Id_Ciudad` = `l`.`Id_Ciudad`)) where `i`.`Año` between 2010 and 2025 order by `l`.`Ciudad`,`i`.`Año` */;
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

-- Dump completed on 2025-04-09 15:37:42
