-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: DB_SALES_SYSTEM
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio_venta` varchar(50) DEFAULT NULL,
  `stock` varchar(50) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idarticulo`),
  KEY `idcategoria` (`idcategoria`),
  CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,1,'E001','Smartphone XYZ','299.99','50','Smartphone con pantalla de 6.5 pulgadas','Disponible'),(2,1,'E002','Televisor 4K','499.99','30','Televisor 4K UHD con 55 pulgadas','Disponible'),(3,2,'R001','Camisa Casual','29.99','100','Camisa casual de algod├│n','Disponible'),(4,2,'R002','Pantal├│n Jeans','49.99','80','Pantal├│n de mezclilla para hombre','Disponible'),(5,3,'H001','Olla a Presi├│n','59.99','40','Olla a presi├│n de 6 litros','Disponible'),(6,3,'H002','Juego de Cubiertos','19.99','200','Juego de cubiertos de acero inoxidable','Disponible'),(7,4,'D001','Bicicleta de Monta├▒a','299.99','15','Bicicleta de monta├▒a con 21 velocidades','Disponible'),(8,4,'D002','Bal├│n de F├║tbol','19.99','100','Bal├│n de f├║tbol tama├▒o reglamentario','Disponible'),(9,5,'L001','Novela Famosa','9.99','150','Novela de autor conocido','Disponible'),(10,5,'L002','Enciclopedia','49.99','20','Enciclopedia de varios vol├║menes','Disponible'),(11,1,'E001','Smartphone XYZ','299.99','50','Smartphone con pantalla de 6.5 pulgadas','Disponible'),(12,1,'E001','Smartphone XYZ','299.99','50','Smartphone con pantalla de 6.5 pulgadas','Disponible');
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Electr├│nica','Dispositivos y gadgets electr├│nicos','Activa'),(2,'Ropa','Prendas de vestir y accesorios','Activa'),(3,'Hogar','Art├¡culos para el hogar y cocina','Activa'),(4,'Deportes','Equipo y ropa deportiva','Activa'),(5,'Libros','Libros y material de lectura','Activa'),(6,'Juguetes','Juguetes y juegos para ni├▒os','Activa'),(7,'Belleza','Productos de belleza y cuidado personal','Activa'),(8,'Salud','Productos de salud y cuidado personal','Activa'),(9,'Automotriz','Accesorios y repuestos para autos','Activa'),(10,'Jardiner├¡a','Herramientas y art├¡culos para el jard├¡n','Activa'),(11,'Electr├│nica','Dispositivos y gadgets electr├│nicos','Activa'),(12,'Ropa','Prendas de vestir y accesorios','Activa'),(13,'Hogar','Art├¡culos para el hogar y cocina','Activa'),(14,'Deportes','Equipo y ropa deportiva','Activa'),(15,'Libros','Libros y material de lectura','Activa'),(16,'Juguetes','Juguetes y juegos para ni├▒os','Activa'),(17,'Belleza','Productos de belleza y cuidado personal','Activa'),(18,'Salud','Productos de salud y cuidado personal','Activa'),(19,'Automotriz','Accesorios y repuestos para autos','Activa'),(20,'Jardiner├¡a','Herramientas y art├¡culos para el jard├¡n','Activa');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ingreso`
--

DROP TABLE IF EXISTS `detalle_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` varchar(10) NOT NULL,
  `precio` varchar(10) NOT NULL,
  PRIMARY KEY (`iddetalle_ingreso`),
  KEY `idingreso` (`idingreso`),
  KEY `idarticulo` (`idarticulo`),
  CONSTRAINT `detalle_ingreso_ibfk_1` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`),
  CONSTRAINT `detalle_ingreso_ibfk_2` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ingreso`
--

LOCK TABLES `detalle_ingreso` WRITE;
/*!40000 ALTER TABLE `detalle_ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` varchar(20) DEFAULT NULL,
  `descuento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  KEY `idventa` (`idventa`),
  KEY `idarticulo` (`idarticulo`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,2,'299.99','0'),(2,1,2,1,'499.99','0'),(3,2,6,3,'19.99','0'),(4,2,7,3,'299.99','0'),(5,2,8,3,'19.99','0'),(6,3,10,2,'49.99','0'),(7,4,1,1,'299.99','0'),(8,5,1,1,'299.99','0'),(9,6,1,3,'299.99','0'),(10,6,2,3,'499.99','0'),(11,7,1,2,'299.99','0'),(12,7,2,1,'499.99','0'),(13,7,4,1,'49.99','0'),(14,8,1,2,'299.99','0'),(15,8,2,2,'499.99','0'),(16,9,1,2,'299.99','0'),(17,10,1,1,'299.99','0'),(18,10,5,1,'59.99','0'),(19,11,1,3,'299.99','0'),(20,11,2,1,'499.99','0'),(21,11,10,1,'49.99','0');
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `impuesto` varchar(20) DEFAULT NULL,
  `total` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idingreso`),
  KEY `idproveedor` (`idproveedor`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `ingreso_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Natural','Juan Perez','DNI','12345675','Calle Falsa 123','555-1233','juan.perez@example.com'),(2,'Jur├¡dica','Empresa XYZ','RUC','987654321','Av. Siempre Viva 456','555-5678','contacto@xyz.com'),(3,'Natural','Maria Lopez','DNI','87654321','Calle Luna 789','555-8765','maria.lopez@example.com'),(4,'Jur├¡dica','Corporaci├│n ABC','RUC','112233445','Av. Estrella 101','555-1010','info@abc.com'),(5,'Natural','Pedro Gomez','DNI','11223344','Calle Sol 202','555-2020','pedro.gomez@example.com'),(6,'Natural','Dane','DNI','12345679','las flores','9834434','decil45498@fincainc.com'),(7,'Natural','Juan Perez','DNI','12345679','las flores','9834434','decil45498@fincainc.com');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','Rol con permisos administrativos completos','Activo'),(2,'Vendedor','Rol con permisos limitados para ventas','Activo'),(3,'Cliente','Rol para usuarios que son clientes','Activo'),(4,'Supervisor','Rol con permisos de supervisi├│n','Activo');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idrol` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idrol` (`idrol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'Admin User','DNI','12345678','Av. Principal 123','999888777','admin@example.com','admin123','Activo'),(2,2,'Vendedor Uno','DNI','87654321','Calle Secundaria 456','987654321','vendedor1@example.com','vendedor123','Activo'),(3,2,'Vendedor Dos','DNI','56789012','Calle Terciaria 789','963258741','vendedor2@example.com','vendedor456','Activo'),(4,3,'Cliente Uno','RUC','98765432100','Av. Comercial 789','951357951','cliente1@example.com','cliente123','Activo'),(5,3,'Cliente Dos','DNI','876543210','Jr. Comercial 456','987654321','cliente2@example.com','cliente456','Activo'),(6,4,'Supervisor','DNI','456789012','Urb. Residencial 789','963852741','supervisor@example.com','supervisor123','Activo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` varchar(20) DEFAULT NULL,
  `impuesto` varchar(20) DEFAULT NULL,
  `total` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `idcliente` (`idcliente`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,2,1,'boleta','1223','12','2024-06-25 18:27','197.99','1297.96','CERRADA'),(2,4,1,'factura','322','12','2024-06-25 18:39','183.58','1203.49','CERRADA'),(3,5,1,'factura','2','1','2024-06-25 18:48','18.00','117.98','CERRADA'),(4,3,1,'factura','2','12','2024-06-25 18:52','54.00','353.99','CERRADA'),(5,2,1,'boleta','23','32','2024-06-25 20:03','54.00','353.99','CERRADA'),(6,3,1,'factura','213','12','2024-06-25 20:06','431.99','2831.93','CERRADA'),(7,1,1,'factura','','','2024-06-25 20:11','206.99','1356.95','CERRADA'),(8,1,1,'factura','34','34','2024-06-25 20:33','287.99','1887.95','CERRADA'),(9,2,1,'factura','232','21','2024-06-25 20:51','108.00','707.98','CERRADA'),(10,1,1,'boleta','2323','12','2024-06-25 20:54','64.80','424.78','CERRADA'),(11,1,1,'factura','23324','1232','2024-06-25 21:29','260.99','1710.94','CERRADA');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-25 22:47:34
