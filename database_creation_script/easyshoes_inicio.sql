CREATE DATABASE  IF NOT EXISTS `easyshoes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `easyshoes`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: easyshoes
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `acesso`
--

DROP TABLE IF EXISTS `acesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acesso` (
  `id_acesso` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `acesso_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `acesso_fim` datetime DEFAULT NULL,
  PRIMARY KEY (`id_acesso`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `acesso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acesso`
--

LOCK TABLES `acesso` WRITE;
/*!40000 ALTER TABLE `acesso` DISABLE KEYS */;
/*!40000 ALTER TABLE `acesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cesta`
--

DROP TABLE IF EXISTS `cesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cesta` (
  `id_cesta` int(11) NOT NULL AUTO_INCREMENT,
  `itens` json DEFAULT NULL,
  PRIMARY KEY (`id_cesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cesta`
--

LOCK TABLES `cesta` WRITE;
/*!40000 ALTER TABLE `cesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cortesia`
--

DROP TABLE IF EXISTS `cortesia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cortesia` (
  `id_cortesia` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `itens` json DEFAULT NULL,
  `todos_itens_pedido` enum('0','1') DEFAULT NULL,
  `todos_itens_valor` decimal(10,2) DEFAULT NULL,
  `todos_produtos` enum('0','1') DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  PRIMARY KEY (`id_cortesia`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `cortesia_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cortesia`
--

LOCK TABLES `cortesia` WRITE;
/*!40000 ALTER TABLE `cortesia` DISABLE KEYS */;
/*!40000 ALTER TABLE `cortesia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_pedido`
--

DROP TABLE IF EXISTS `historico_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_transportadora` int(11) DEFAULT NULL,
  `id_pagamento` int(11) DEFAULT NULL,
  `status_transporte` varchar(20) DEFAULT 'indefinido',
  `status_pagamento` varchar(20) DEFAULT 'indefinido',
  `status_pedido` varchar(20) DEFAULT 'indefinido',
  `valor_frete` decimal(10,2) DEFAULT NULL,
  `produtos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_pedido`
--

LOCK TABLES `historico_pedido` WRITE;
/*!40000 ALTER TABLE `historico_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_produto`
--

DROP TABLE IF EXISTS `historico_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_produto` (
  `id_produto` int(11) NOT NULL,
  `nome_tecnico` varchar(60) DEFAULT NULL,
  `nome_exibicao` varchar(40) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `dimensoes` json NOT NULL,
  `links_imagens` json DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `data_hora_criacao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_produto`
--

LOCK TABLES `historico_produto` WRITE;
/*!40000 ALTER TABLE `historico_produto` DISABLE KEYS */;
INSERT INTO `historico_produto` VALUES (3,'Tênis Nike com super amortecedores W23','Nike com Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 11:41:56'),(4,'Tênis Nike com super amortecedores W23','Nike com Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 11:50:24'),(6,'Tênis Nike com super amortecedores W23','Nike com Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 12:08:23'),(8,'Tênis Nike com super amortecedores W23','Nike com Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 12:08:25'),(8,'Tênis Nike sem amortecedores','Nike sem Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 12:08:25'),(7,'Tênis Nike com super amortecedores W23','Nike com Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 12:08:25'),(8,'Tênis Nike sem amortecedores','Nike sem Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 12:08:25'),(10,'Tênis Nike com super amortecedores W23','Nike com Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 12:11:46'),(8,'Tênis Nike sem amortecedores','Nike sem Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 12:08:25');
/*!40000 ALTER TABLE `historico_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instituicao_financeira`
--

DROP TABLE IF EXISTS `instituicao_financeira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instituicao_financeira` (
  `id_instituicao_financeira` int(11) NOT NULL AUTO_INCREMENT,
  `nome_instituicao_financeira` varchar(40) NOT NULL,
  PRIMARY KEY (`id_instituicao_financeira`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instituicao_financeira`
--

LOCK TABLES `instituicao_financeira` WRITE;
/*!40000 ALTER TABLE `instituicao_financeira` DISABLE KEYS */;
INSERT INTO `instituicao_financeira` VALUES (1,'Banco do Brasil'),(2,'Bradesco'),(3,'Itaú');
/*!40000 ALTER TABLE `instituicao_financeira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_instituicao_financeira` int(11) DEFAULT NULL,
  `numero_boleto` varchar(48) DEFAULT NULL,
  `data_vencimento_boleto` date DEFAULT NULL,
  `numero_cartao` bigint(20) DEFAULT NULL,
  `nome_impresso_cartao` varchar(40) DEFAULT NULL,
  `data_vencimento_cartao` date DEFAULT NULL,
  `bandeira` varchar(20) DEFAULT NULL,
  `codigo_verificacao` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  UNIQUE KEY `numero_boleto` (`numero_boleto`),
  KEY `id_instituicao_financeira` (`id_instituicao_financeira`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_instituicao_financeira`) REFERENCES `instituicao_financeira` (`id_instituicao_financeira`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,3,'1223232443','2016-06-22',NULL,NULL,NULL,NULL,NULL,12.34);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_transportadora` int(11) DEFAULT NULL,
  `id_pagamento` int(11) DEFAULT NULL,
  `status_transporte` varchar(20) DEFAULT 'indefinido',
  `status_pagamento` varchar(20) DEFAULT 'indefinido',
  `status_pedido` varchar(20) DEFAULT 'indefinido',
  `valor_frete` decimal(10,2) DEFAULT NULL,
  `itens` json NOT NULL,
  `itens_entrega_parcial` json DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_transportadora` (`id_transportadora`),
  KEY `id_pagamento` (`id_pagamento`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_transportadora`) REFERENCES `transportadora` (`id_transportadora`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,1,'indefinido','indefinido','indefinido',12.00,'{\"1\": 1, \"2\": 4, \"27\": 3}',NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger guardar_pedido_no_historico_delete before delete on pedido
for each row
begin
insert into historico_pedido values(old.id_pedido, old.id_transportadora, old.id_pagamento, old.status_transporte ,old.status_pagamento, old.status_pedido, old.valor_frete, old.itens); 
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tecnico` varchar(60) DEFAULT NULL,
  `nome_exibicao` varchar(40) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `dimensoes` json NOT NULL,
  `links_imagens` json DEFAULT NULL,
  `id_usuario_criacao` int(11) DEFAULT NULL,
  `data_hora_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_produto`),
  KEY `id_usuario_criacao` (`id_usuario_criacao`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_usuario_criacao`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Tênis NIKE RRR457','Nike',1213.00,'{\"altura\": \"12cm\", \"largura\": \"22cm\", \"comprimento\": \"23cm\"}','{\"1\": \"www.google.com/imagem\"}',1,'2016-06-22 07:57:29'),(2,'Tênis NIKE alta absorção TER457','Nike - Alta Absorção',123.00,'{\"altura\": \"12cm\", \"largura\": \"22cm\", \"comprimento\": \"23cm\"}','{\"1\": \"www.google.com/imagem\"}',1,'2016-06-22 07:57:29'),(3,'Tênis Nike sem amortecedores','Nike sem Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 11:41:56'),(5,'Tênis Nike com super amortecedores W23','Nike com Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 11:52:08'),(8,'Tênis Nike sem amortecedores','Nike sem Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 12:08:25'),(9,'Tênis Nike com super amortecedores W23','Nike com Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 12:08:26'),(11,'Tênis Nike com super amortecedores W23','Nike com Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-22 13:06:02'),(12,'Tênis Nike com super amortecedores W23','Nike com Amortecedores',220.00,'{\"altura\": \"20\", \"largura\": \"25\", \"comprimento\": \"23\"}',NULL,1,'2016-06-29 14:05:04');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger guardar_produto_no_historico_update before update on produto
for each row
begin
	insert into historico_produto values(old.id_produto, old.nome_tecnico, old.nome_exibicao, old.preco ,old.dimensoes, old.links_imagens, old.id_usuario_criacao, old.data_hora_criacao); 
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger guardar_produto_no_historico_delete before delete on produto
for each row
begin
	insert into historico_produto values(old.id_produto, old.nome_tecnico, old.nome_exibicao, old.preco ,old.dimensoes, old.links_imagens, old.id_usuario_criacao, old.data_hora_criacao); 
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transportadora`
--

DROP TABLE IF EXISTS `transportadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportadora` (
  `id_transportadora` int(11) NOT NULL AUTO_INCREMENT,
  `nome_transportadora` varchar(40) NOT NULL,
  PRIMARY KEY (`id_transportadora`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportadora`
--

LOCK TABLES `transportadora` WRITE;
/*!40000 ALTER TABLE `transportadora` DISABLE KEYS */;
INSERT INTO `transportadora` VALUES (1,'Correios');
/*!40000 ALTER TABLE `transportadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_usuario` enum('cliente','supervisor','funcionario_produtos') NOT NULL,
  `nome_completo` varchar(60) NOT NULL,
  `cpf` bigint(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `endereco` json NOT NULL,
  `data_hora_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'supervisor','Lucas Amorim Silva',42380853886,'lucas.amorim.silva.usp@gmail.com','uchihasasuke','{\"casa\": \"Av. Frei Inácio\"}','2016-06-22 07:56:55');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'easyshoes'
--

--
-- Dumping routines for database 'easyshoes'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-04  9:25:00
