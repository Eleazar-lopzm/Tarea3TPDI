-- MySQL dump 10.13  Distrib 5.6.22, for Win32 (x86)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Create schema ProyectosEscolares
--

CREATE DATABASE IF NOT EXISTS financiera_db;
USE financiera_db;
--
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IP` varchar(15) DEFAULT NULL,
  `Pintento` date DEFAULT NULL,
  `intentos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS Usuario;

CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad VARCHAR(3),
    genero VARCHAR(10),
    apellidos VARCHAR(50),
    direccion VARCHAR(100),
    fecha DATE,
    monto DOUBLE,
    periodo INT,
    moneda VARCHAR(5),
    cuota DOUBLE,
    TEA INT,
    fechaVencimiento DATE
);

DROP TABLE IF EXISTS Gasto;

CREATE TABLE Gasto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha VARCHAR(10),
    mes VARCHAR(20),
    tarjeta VARCHAR(20),
    transaccion VARCHAR(100),
    gastos DOUBLE,
    pagos DOUBLE  -- La columna editable
);


INSERT INTO Gasto (fecha, mes, tarjeta, transaccion, gastos, pagos) VALUES 
('1/1/2021', 'enero', 'VISA', 'Peluquería', 1000.00, 0.0),
('2/1/2021', 'enero', 'VISA', 'TV plasma (1 de 6)', 2500.00, 0.0),
('3/1/2021', 'enero', 'MASTERCARD', 'Vajilla Kit', 2500.00, 0.0);

