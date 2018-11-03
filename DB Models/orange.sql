-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 03-Nov-2018 às 17:57
-- Versão do servidor: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orange`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `Cliente_Create`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cliente_Create` (IN `nome` VARCHAR(200), IN `cpf` VARCHAR(15), IN `usuario_id` INT, IN `endereco_id` INT)  BEGIN
	INSERT INTO cliente VALUES (NULL, nome, cpf, usuario_id, endereco_id);
END$$

DROP PROCEDURE IF EXISTS `Cliente_Update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cliente_Update` (IN `nome` VARCHAR(200), `cpf` VARCHAR(15), IN `usuario_id` INT, IN `endereco_id` INT, IN `id` INT)  BEGIN
	UPDATE cliente SET cliente.nome = nome, cliente.cpf = cpf, cliente.usuario_id = usuario_id, cliente.endereco_id = endereco_id WHERE cliente.id = id;
END$$

DROP PROCEDURE IF EXISTS `Cliente_Valiate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cliente_Valiate` (IN `cpf` VARCHAR(15))  BEGIN
	SELECT * FROM cliente WHERE cliente.cpf = cpf;
END$$

DROP PROCEDURE IF EXISTS `Contato_Create`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Contato_Create` (IN `telefone` VARCHAR(20), IN `email` VARCHAR(200), IN `rede_social` VARCHAR(100), IN `usuario_id` INT)  BEGIN
	INSERT INTO contato VALUES (NULL, telefone, email, rede_social, usuario_id);
END$$

DROP PROCEDURE IF EXISTS `Contato_Update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Contato_Update` (IN `telefone` VARCHAR(20), IN `email` VARCHAR(200), IN `rede_social` VARCHAR(100), IN `usuario_id` INT, IN `id` INT)  BEGIN
	UPDATE contato SET contato.telefone = telefone, contato.email = email, contato.rede_social = rede_social, contato.usuario_id = usuario_id WHERE contato.id = id;
END$$

DROP PROCEDURE IF EXISTS `Contato_Validate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Contato_Validate` (IN `telefone` VARCHAR(20), IN `email` VARCHAR(200))  BEGIN
	SELECT * FROM contato WHERE contato.telefone = telefone OR contato.email = email;
END$$

DROP PROCEDURE IF EXISTS `Corretor_Create`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Corretor_Create` (IN `nome` VARCHAR(200), IN `cpf` VARCHAR(15), IN `creci` VARCHAR(50), IN `avaliacao` DOUBLE(1,1), IN `usuario_id` INT, IN `endereco_id` INT)  BEGIN
	INSERT INTO corretor VALUES (NULL, nome, cpf, creci, avaliacao, usuario_id, endereco_id);
END$$

DROP PROCEDURE IF EXISTS `Corretor_Update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Corretor_Update` (IN `nome` VARCHAR(200), IN `cpf` VARCHAR(15), IN `creci` VARCHAR(50), IN `avaliacao` DOUBLE(1,1), IN `usuario_id` INT, IN `endereco_id` INT, IN `id` INT)  BEGIN
	UPDATE corretor SET corretor.nome = nome, corretor.cpf = cpf, corretor.creci = creci, corretor.avaliacao = avaliacao, corretor.usuario_id = usuario_id, corretor.endereco_id = endereco_id WHERE corretor.id = id;
END$$

DROP PROCEDURE IF EXISTS `Corretor_Valiate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Corretor_Valiate` (IN `cpf` VARCHAR(15))  BEGIN
	SELECT * FROM corretor WHERE corretor.cpf = cpf;
END$$

DROP PROCEDURE IF EXISTS `Endereco_Create`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Endereco_Create` (IN `cep` VARCHAR(9), IN `logradouro` VARCHAR(45), IN `rua` VARCHAR(240), IN `numero` INT, `bairro` VARCHAR(100), `cidade` VARCHAR(100), `uf` CHAR(2))  BEGIN
	INSERT INTO endereco VALUES (NULL, cep, logradouro, rua, numero, bairro, cidade, uf);
END$$

DROP PROCEDURE IF EXISTS `Endereco_Update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Endereco_Update` (IN `cep` VARCHAR(9), IN `logradouro` VARCHAR(45), IN `rua` VARCHAR(240), IN `numero` INT, IN `bairro` VARCHAR(100), IN `cidade` VARCHAR(100), IN `uf` CHAR(2), IN `id` INT)  BEGIN
	UPDATE endereco SET endereco.cep = cep, endereco.logradouro = logradouro, endereco.rua = rua, endereco.numero = numero, endereco.bairro = bairro, endereco.cidade = cidade, endereco.uf = uf WHERE endereco.id = id;
END$$

DROP PROCEDURE IF EXISTS `Endereco_Validate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Endereco_Validate` (IN `cep` VARCHAR(9))  BEGIN

	SELECT * FROM endereco WHERE endereco.cep = cep;

END$$

DROP PROCEDURE IF EXISTS `Enviar_Solicitacao`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Enviar_Solicitacao` (IN `tipo` INT, IN `cliente_id` INT, IN `corretor_id` INT, IN `imovel_id` INT)  BEGIN
	INSERT INTO solicitacoes VALUES (NULL, tipo, cliente_id, corretor_id, imovel_id); 
END$$

DROP PROCEDURE IF EXISTS `Imovel_Create`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Imovel_Create` (IN `registro` VARCHAR(50), IN `area` DOUBLE(10,2), IN `preco` DOUBLE(9,2), IN `endereco_id` INT, IN `corretor_id` INT, `cliente_id` INT, IN `id` INT)  BEGIN
	INSERT INTO imovel VALUES (NULL, registro, area, preco, endereco_id, corretor_id, cliente_id); 
END$$

DROP PROCEDURE IF EXISTS `Imovel_Update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Imovel_Update` (IN `registro` VARCHAR(50), IN `area` DOUBLE(10,2), IN `preco` DOUBLE(9,2), IN `endereco_id` INT, IN `corretor_id` INT, `cliente_id` INT, IN `id` INT)  BEGIN
	UPDATE imovel SET imovel.registro = registro, imovel.area = area, imovel.preco = preco, imovel.endereco_id = endereco_id, imovel.corretor_id = corretor_id, imovel.cliente_id = cliente_id WHERE imovel.id = id;
END$$

DROP PROCEDURE IF EXISTS `Imovel_Validate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Imovel_Validate` (IN `registro` VARCHAR(50))  BEGIN
	SELECT * FROM imovel WHERE imovel.registro = registro; 
END$$

DROP PROCEDURE IF EXISTS `Usuario_Create`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuario_Create` (IN `login` VARCHAR(200), IN `senha` VARCHAR(200), IN `acesso` INT)  BEGIN

	INSERT INTO usuario VALUES (NULL, login, senha, acesso);

END$$

DROP PROCEDURE IF EXISTS `Usuario_Update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuario_Update` (IN `login` VARCHAR(200), IN `senha` VARCHAR(200), IN `acesso` INT, IN `id` INT)  BEGIN

	UPDATE usuario SET usuario.login = login, usuario.senha = senha, usuario.nivel_acesso = acesso WHERE usuario.id = id;

END$$

DROP PROCEDURE IF EXISTS `Usuario_Validate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuario_Validate` (IN `login` VARCHAR(200), IN `senha` VARCHAR(200))  BEGIN
    SELECT * FROM usuario
    WHERE usuario.login = login AND usuario.senha = senha;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `endereco_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `endereco_id` (`endereco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `cpf`, `usuario_id`, `endereco_id`) VALUES
(1, 'Benedito Raimundo Victor da Silva', '519.813.426-05', 1, 1),
(2, 'Ricardo Ryan Vicente Vieira', '299.149.386-04', 2, 2),
(3, 'Sophia Débora Novaes', '881.591.818-33', 4, 4),
(4, 'Luna Alícia Araújo', '767.130.072-10', 5, 5),
(5, 'Giovanna Nina Aline Jesus', '412.310.197-60', 6, 6),
(6, 'Milena Márcia Cláudia Rodrigues', '395.859.677-07', 7, 7),
(7, 'Tiago Heitor Rodrigues', '464.444.702-18', 9, 9),
(8, 'Francisco Henrique Melo', '406.529.365-04', 11, 11),
(9, 'Nicolas Kaique Tiago Santos', '592.859.889-03', 12, 12),
(10, 'Emilly Alice Drumond', '496.945.661-50', 14, 13);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

DROP TABLE IF EXISTS `contato`;
CREATE TABLE IF NOT EXISTS `contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `rede_social` varchar(100) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`id`, `telefone`, `email`, `rede_social`, `usuario_id`) VALUES
(1, '(31) 98741-3499', 'beneditoraimundovictordasilva-91@contabilidadevictoria.com.br', NULL, 1),
(2, '(31) 97878-6520', 'ricardoryanvicentevieira..ricardoryanvicentevieira@nokia.com', 'Ricardo Vieira', 2),
(3, '(34) 98862-9392', 'lleandroosvaldosilva@indaiamidias.com.br', 'Leandro Osvaldo Silva', 3),
(4, '(65) 99795-6735', 'ssophiadeboranovaes@econe.com.br', NULL, 4),
(5, '(95) 98623-1586', 'lunaaliciaaraujo_@redex.com.br', NULL, 4),
(6, '(27) 98505-3390', 'giovannaninaalinejesus_@dedicasa.com.br', NULL, 6),
(7, '(27) 98723-0326', 'milenamarciaclaudiarodrigues-81@arbitral.com', NULL, 7),
(8, '(28) 99132-8675', 'milenabeneditaalicecampos_@stricker.eu.com', NULL, 8),
(9, '(92) 98841-6980', 'tiagoheitorrodrigues_@igoralcantara.com.br', 'Tiago Heitor Rodrigues', 9),
(10, '(77) 98151-9014', 'igorgeraldobarbosa-87@kimmay.com.br', 'Igor Geraldo Barbosa', 10),
(11, '(71) 98750-2752', 'ffranciscohenriquemelo@revati.com.br', 'Francisco Henrique Melo', 11),
(12, '(45) 98984-3961', 'nicolaskaiquetiagosantos_@argo.com.br', 'Nicolas Kaique Tiago Santos', 12),
(13, '(67) 99928-7858', 'emillyalicedrumond__emillyalicedrumond@maliziaarranjosflorais.com.br', 'Emilly Alice Drumond', 14),
(14, '(67) 98950-2047', 'yyurihenriquecardoso@rotauniformes.com.br', 'Yuri Henrique Cardoso', 15),
(15, '(61) 99588-0595', 'aarthurpedroandrebaptista@moncoes.com.br', 'Arthur Pedro André Baptista', 16),
(16, '(61) 98780-6312', 'ttaniafernandagabriellydapaz@gamal.com.br', 'Tânia Fernanda Gabrielly da Paz', 17),
(17, '(37) 98949-4064', 'amandapriscilamendes-71@raninho.com.br', 'Amanda Priscila Mendes', 18),
(18, '(32) 99522-3372', 'victormarcosemanuelgoncalves-88@catsfeelings.com.br', 'Victor Marcos Emanuel Gonçalves', 19),
(19, '(31) 99199-9041', 'cecilialuciabetinadrumond_@vgl.com.br', 'Cecília Lúcia Betina Drumond', 20),
(20, '(31) 99359-7943', 'raulmartinlorenzosilva..raulmartinlorenzosilva@protenisbarra.com.br', 'Raul Martin Lorenzo Silva', 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `corretor`
--

DROP TABLE IF EXISTS `corretor`;
CREATE TABLE IF NOT EXISTS `corretor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `creci` varchar(50) NOT NULL,
  `avaliacao` double(1,1) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `endereco_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `endereco_id` (`endereco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `corretor`
--

INSERT INTO `corretor` (`id`, `nome`, `cpf`, `creci`, `avaliacao`, `usuario_id`, `endereco_id`) VALUES
(1, 'Leandro Osvaldo Silva', '133.735.896-73', '1195454516514', 0.0, 3, 3),
(2, 'Milena Benedita Alice Campos', '080.774.397-64', '15854654564564', NULL, 8, 8),
(3, 'Igor Geraldo Barbosa', '261.268.685-10', '651564454545465', NULL, 10, 10),
(4, 'Yuri Henrique Cardoso', '827.867.311-00', '41566516516551', NULL, 15, 14),
(5, 'Arthur Pedro André Baptista', '294.725.641-78', '1165415455654', NULL, 16, 15),
(6, 'Tânia Fernanda Gabrielly da Paz', '500.000.221-01', '46565655122321', NULL, 17, 16),
(7, 'Amanda Priscila Mendes', '625.124.426-75', '156454885465465541', NULL, 18, 17),
(8, 'Victor Marcos Emanuel Gonçalves', '971.504.226-08', '5654655613211321', NULL, 19, 18),
(9, 'Cecília Lúcia Betina Drumond', '743.049.586-90', '4444653114132115', NULL, 20, 19),
(10, 'Raul Martin Lorenzo Silva', '514.122.686-72', '54165415411321', NULL, 21, 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(45) DEFAULT NULL,
  `rua` varchar(240) NOT NULL,
  `numero` int(11) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id`, `cep`, `logradouro`, `rua`, `numero`, `bairro`, `cidade`, `uf`) VALUES
(1, '31744-551', 'casa', 'Rua Antônio Carvalho', 263, 'Juliana', 'Belo Horizonte', 'MG'),
(2, '36770-626', 'casa', 'Rua Serafim Barata', 510, 'João Riguete', 'Cataguases', 'MG'),
(3, '38180-696', 'apartamento', 'Rua Maria Alves Franco', 425, 'Conjunto Habitacional Boa Vista', 'Araxá', 'MG'),
(4, '78005-980', NULL, 'Praça da República 101', 645, 'Centro Norte', 'Cuiabá', 'MT'),
(5, '69307-160', NULL, 'Rua Pau-rainha', 425, 'Paraviana', 'Boa Vista', 'RR'),
(6, '29018-613', NULL, 'Escadaria Francisca Ferreira Chagas', 423, 'Santa Clara', 'Vitória', 'ES'),
(7, '29946-640', NULL, 'Estrada São Mateus-Estiva de Barra Nova', 364, 'Campo Grande', 'São Mateus', 'ES'),
(8, '29393-981', NULL, 'Avenida Otacílio Severino Silva, s/n', 624, 'Santíssima Trindade', 'Santíssima Trindade', 'ES'),
(9, '69735-970', NULL, 'Rua Taboca 12', 646, 'Centro', 'Presidente Figueiredo', 'AM'),
(10, '46680-970', NULL, 'Rua Tiradentes, s/n', 921, 'Centro', 'Caraguataí', 'BA'),
(11, '40393-490', NULL, 'Avenida São Benedito', 729, 'Capelinha', 'Salvador', 'BA'),
(12, '85406-970', NULL, 'Rodovia BR-277, s/n Quilômetro 499', 895, 'Centro', 'Bela Vista', 'PR'),
(13, '79890-970', NULL, 'Rua Juscelino K Oliveira 684', 758, 'Centro', 'Itaporã', 'MS'),
(14, '79890-970', NULL, 'Rua Juscelino K Oliveira 684', 363, 'Centro', 'Itaporã', 'MS'),
(15, '71596-327', NULL, 'Quadra 3 Conjunto I', 967, 'Fazendinha (Itapoã)', 'Brasília', 'DF'),
(16, '72581-070', NULL, 'Chácara Chácara 03', 563, 'Núcleo Rural Santa Maria', 'Brasília', 'DF'),
(17, '35620-972', NULL, 'Rua Principal, s/n', 818, 'Centro', 'Abaeté', 'MG'),
(18, '36285-972', NULL, 'Praça da Estação, s/n', 572, 'Centro', 'Carandaí', 'MG'),
(19, '31748-060', NULL, 'Rua João de Abreu', 595, 'Jaqueline', 'Belo Horizonte', 'MG'),
(20, '30820-080', NULL, 'Rua Via Sacra', 155, 'Jardim São José', 'Belo Horizonte', 'MG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

DROP TABLE IF EXISTS `imovel`;
CREATE TABLE IF NOT EXISTS `imovel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registro` varchar(50) NOT NULL,
  `area` double(10,2) NOT NULL,
  `preco` double(9,2) NOT NULL,
  `endereco_id` int(11) NOT NULL,
  `corretor_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `endereco_id` (`endereco_id`),
  KEY `corretor_id` (`corretor_id`),
  KEY `cliente_id` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacoes`
--

DROP TABLE IF EXISTS `solicitacoes`;
CREATE TABLE IF NOT EXISTS `solicitacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `corretor_id` int(11) NOT NULL,
  `imovel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `corretor_id` (`corretor_id`),
  KEY `imovel_id` (`imovel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(200) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `nivel_acesso` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `login`, `senha`, `nivel_acesso`) VALUES
(1, 'bene123', 'xFOSOJHXgk', 1),
(2, 'ricOsv7', 'ull4CgM6lu', 1),
(3, 'leand31', 'GrHPDaCaB1', 2),
(4, 'ssophiadeboranovaes@econe.com.br', '46ZAxg2eai', 1),
(5, 'lunaaliciaaraujo_@redex.com.br', 'qnPdtigxTt', 1),
(6, 'giovannaninaalinejesus_@dedicasa.com.br', 'DLBhYS1kT9', 1),
(7, 'milenamarciaclaudiarodrigues-81@arbitral.com', 'U4Co4mdbkI', 1),
(8, 'milenabeneditaalicecampos_@stricker.eu.com', '5eq9UqwHJJ', 2),
(9, 'tiagoheitorrodrigues_@igoralcantara.com.br', 'KGKlunEOEx', 1),
(10, 'igorgeraldobarbosa-87@kimmay.com.br', '4wDHZKWB9A', 2),
(11, 'ffranciscohenriquemelo@revati.com.br', 'nfGHjyq1uD', 1),
(12, 'nicolaskaiquetiagosantos_@argo.com.br', 't7QT2dHac7', 1),
(14, 'emillyalicedrumond__emillyalicedrumond@maliziaarranjosflorais.com.br', '4NJYJxToUA', 1),
(15, 'yyurihenriquecardoso@rotauniformes.com.br', 'K5g9HOytBM', 2),
(16, 'aarthurpedroandrebaptista@moncoes.com.br', 'AOhQL99cim', 2),
(17, 'ttaniafernandagabriellydapaz@gamal.com.br', 'zcHYfJckOs', 2),
(18, 'amandapriscilamendes-71@raninho.com.br', 'u873MbYbQ0', 2),
(19, 'victormarcosemanuelgoncalves-88@catsfeelings.com.br', '8a42LFdRgq', 2),
(20, 'cecilialuciabetinadrumond_@vgl.com.br', '13h6WcgMhE', 2),
(21, 'raulmartinlorenzosilva..raulmartinlorenzosilva@protenisbarra.com.br', 'Ii4osWy6le', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ver_clientes`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `ver_clientes`;
CREATE TABLE IF NOT EXISTS `ver_clientes` (
`Id do Usuário` int(11)
,`Login` varchar(200)
,`Senha` varchar(200)
,`Nível de Acesso` int(11)
,`Nome` varchar(200)
,`CPF` varchar(15)
,`CEP` varchar(9)
,`Rua` varchar(240)
,`Número` int(11)
,`Bairro` varchar(100)
,`Logradouro` varchar(45)
,`Cidade` varchar(100)
,`UF` char(2)
,`Email(s)` text
,`Telefone(s)` text
,`Rede(s) Social(is)` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ver_corretores`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `ver_corretores`;
CREATE TABLE IF NOT EXISTS `ver_corretores` (
`Id do Corretor` int(11)
,`Login` varchar(200)
,`Senha` varchar(200)
,`Nível de Acesso` int(11)
,`Nome` varchar(200)
,`CPF` varchar(15)
,`CRECI` varchar(50)
,`Avaliação` double(1,1)
,`Rua` varchar(240)
,`Número` int(11)
,`Bairro` varchar(100)
,`CEP` varchar(9)
,`Logradouro` varchar(45)
,`Cidade` varchar(100)
,`UF` char(2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ver_imoveis`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `ver_imoveis`;
CREATE TABLE IF NOT EXISTS `ver_imoveis` (
`Registro` varchar(50)
,`Área Total` double(10,2)
,`Preço` double(9,2)
,`Rua` varchar(240)
,`Número` int(11)
,`Bairro` varchar(100)
,`Logradouro` varchar(45)
,`CEP` varchar(9)
,`Cidade` varchar(100)
,`UF` char(2)
,`Proprietário` varchar(200)
,`Corretor Responsável` varchar(200)
);

-- --------------------------------------------------------

--
-- Structure for view `ver_clientes`
--
DROP TABLE IF EXISTS `ver_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_clientes`  AS  select `u`.`id` AS `Id do Usuário`,`u`.`login` AS `Login`,`u`.`senha` AS `Senha`,`u`.`nivel_acesso` AS `Nível de Acesso`,`cl`.`nome` AS `Nome`,`cl`.`cpf` AS `CPF`,`e`.`cep` AS `CEP`,`e`.`rua` AS `Rua`,`e`.`numero` AS `Número`,`e`.`bairro` AS `Bairro`,`e`.`logradouro` AS `Logradouro`,`e`.`cidade` AS `Cidade`,`e`.`uf` AS `UF`,group_concat(`c`.`email` separator ',') AS `Email(s)`,group_concat(`c`.`telefone` separator ',') AS `Telefone(s)`,group_concat(`c`.`rede_social` separator ',') AS `Rede(s) Social(is)` from (((`usuario` `u` join `cliente` `cl` on((`cl`.`usuario_id` = `u`.`id`))) join `contato` `c` on((`c`.`usuario_id` = `u`.`id`))) join `endereco` `e` on((`cl`.`endereco_id` = `e`.`id`))) group by `u`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `ver_corretores`
--
DROP TABLE IF EXISTS `ver_corretores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_corretores`  AS  select `u`.`id` AS `Id do Corretor`,`u`.`login` AS `Login`,`u`.`senha` AS `Senha`,`u`.`nivel_acesso` AS `Nível de Acesso`,`co`.`nome` AS `Nome`,`co`.`cpf` AS `CPF`,`co`.`creci` AS `CRECI`,`co`.`avaliacao` AS `Avaliação`,`e`.`rua` AS `Rua`,`e`.`numero` AS `Número`,`e`.`bairro` AS `Bairro`,`e`.`cep` AS `CEP`,`e`.`logradouro` AS `Logradouro`,`e`.`cidade` AS `Cidade`,`e`.`uf` AS `UF` from ((`usuario` `u` join `corretor` `co` on((`co`.`usuario_id` = `u`.`id`))) join `endereco` `e` on((`co`.`endereco_id` = `e`.`id`))) group by `u`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `ver_imoveis`
--
DROP TABLE IF EXISTS `ver_imoveis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_imoveis`  AS  select `i`.`registro` AS `Registro`,`i`.`area` AS `Área Total`,`i`.`preco` AS `Preço`,`e`.`rua` AS `Rua`,`e`.`numero` AS `Número`,`e`.`bairro` AS `Bairro`,`e`.`logradouro` AS `Logradouro`,`e`.`cep` AS `CEP`,`e`.`cidade` AS `Cidade`,`e`.`uf` AS `UF`,`cl`.`nome` AS `Proprietário`,`co`.`nome` AS `Corretor Responsável` from (((`imovel` `i` join `endereco` `e` on((`i`.`endereco_id` = `e`.`id`))) join `cliente` `cl` on((`cl`.`id` = `i`.`cliente_id`))) join `corretor` `co` on((`co`.`id` = `i`.`corretor_id`))) group by `i`.`id` ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`);

--
-- Limitadores para a tabela `contato`
--
ALTER TABLE `contato`
  ADD CONSTRAINT `contato_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `corretor`
--
ALTER TABLE `corretor`
  ADD CONSTRAINT `corretor_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `corretor_ibfk_2` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`);

--
-- Limitadores para a tabela `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `imovel_ibfk_1` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`),
  ADD CONSTRAINT `imovel_ibfk_2` FOREIGN KEY (`corretor_id`) REFERENCES `corretor` (`id`),
  ADD CONSTRAINT `imovel_ibfk_3` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Limitadores para a tabela `solicitacoes`
--
ALTER TABLE `solicitacoes`
  ADD CONSTRAINT `solicitacoes_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `solicitacoes_ibfk_2` FOREIGN KEY (`corretor_id`) REFERENCES `corretor` (`id`),
  ADD CONSTRAINT `solicitacoes_ibfk_3` FOREIGN KEY (`imovel_id`) REFERENCES `imovel` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
