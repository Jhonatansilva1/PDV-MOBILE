-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/11/2023 às 15:15
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projetotcc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_Nome` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `rg` varchar(200) NOT NULL,
  `cpf` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `telefone` varchar(200) NOT NULL,
  `celular` varchar(200) NOT NULL,
  `cep` varchar(200) NOT NULL,
  `rua` varchar(200) NOT NULL,
  `numero` varchar(200) NOT NULL,
  `complemento` varchar(200) NOT NULL,
  `bairro` varchar(200) NOT NULL,
  `cidade` varchar(200) NOT NULL,
  `uf` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_Nome`, `nome`, `rg`, `cpf`, `email`, `telefone`, `celular`, `cep`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `uf`) VALUES
(3, 'Carlos Pereira', '3456789', '345.678.901-23', 'carlos.pereira@email.com', '333-3333', '77777-7777', '90123-456', 'Rua C', '789', 'Apto 303', 'Bairro3', 'Cidade3', 'UF3'),
(4, 'Fernanda Santos', '4567890', '456.789.012-34', 'fernanda.santos@email.com', '444-4444', '66666-6666', '23456-789', 'Rua D', '101', 'Apto 404', 'Bairro4', 'Cidade4', 'UF4'),
(5, 'Roberto Lima', '5678901', '567.890.123-45', 'roberto.lima@email.com', '555-5555', '55555-5555', '67890-123', 'Rua E', '112', 'Apto 505', 'Bairro5', 'Cidade5', 'UF5'),
(6, 'Ana Costa', '6789012', '678.901.234-56', 'ana.costa@email.com', '666-6666', '44444-4444', '34567-890', 'Rua F', '223', 'Apto 606', 'Bairro6', 'Cidade6', 'UF6'),
(7, 'Paulo Rocha', '7890123', '789.012.345-67', 'paulo.rocha@email.com', '777-7777', '33333-3333', '45678-901', 'Rua G', '334', 'Apto 707', 'Bairro7', 'Cidade7', 'UF7'),
(8, 'Camila Almeida', '8901234', '890.123.456-78', 'camila.almeida@email.com', '888-8888', '22222-2222', '56789-012', 'Rua H', '445', 'Apto 808', 'Bairro8', 'Cidade8', 'UF8'),
(9, 'Ricardo Souza', '9012345', '901.234.567-89', 'ricardo.souza@email.com', '999-9999', '11111-1111', '67890-123', 'Rua I', '556', 'Apto 909', 'Bairro9', 'Cidade9', 'UF9'),
(10, 'Juliana Lima', '0123456', '012.345.678-90', 'juliana.lima@email.com', '000-0000', '00000-0000', '78901-234', 'Rua J', '667', 'Apto 1010', 'Bairro10', 'Cidade10', 'UF10'),
(11, 'Rodrigo Oliveira', '6677889', '666.777.888-99', 'rodrigo@email.com', '678-9012', '12345-6789', '98765-432', 'Rua P', '223', 'Apto 6666', 'Bairro16', 'Cidade16', 'UF16'),
(12, 'Laura Santos', '7788990', '777.888.999-00', 'laura@email.com', '789-0123', '98765-4321', '12345-678', 'Rua Q', '334', 'Apto 7777', 'Bairro17', 'Cidade17', 'UF17'),
(13, 'Marcos Lima', '8899001', '888.999.000-11', 'marcos@email.com', '890-1234', '98765-4321', '12345-678', 'Rua R', '445', 'Apto 8888', 'Bairro18', 'Cidade18', 'UF18'),
(14, 'Vanessa Almeida', '9900112', '999.000.111-22', 'vanessa@email.com', '901-2345', '98765-4321', '12345-678', 'Rua S', '556', 'Apto 9999', 'Bairro19', 'Cidade19', 'UF19'),
(15, 'Lucas Costa', '0011223', '000.111.222-33', 'lucas@email.com', '012-3456', '98765-4321', '12345-678', 'Rua T', '667', 'Apto 10101', 'Bairro20', 'Cidade20', 'UF20'),
(16, 'Mariana Pereira', '1122334', '111.222.333-44', 'mariana@email.com', '123-4567', '98765-4321', '12345-678', 'Rua U', '778', 'Apto 11111', 'Bairro21', 'Cidade21', 'UF21'),
(17, 'Pedro Souza', '2233445', '222.333.444-55', 'pedro@email.com', '234-5678', '98765-4321', '12345-678', 'Rua V', '889', 'Apto 22222', 'Bairro22', 'Cidade22', 'UF22'),
(18, 'Julia Santos', '3344556', '333.444.555-66', 'julia@email.com', '345-6789', '98765-4321', '12345-678', 'Rua W', '990', 'Apto 33333', 'Bairro23', 'Cidade23', 'UF23'),
(19, 'Felipe Oliveira', '4455667', '444.555.666-77', 'felipe@email.com', '456-7890', '98765-4321', '12345-678', 'Rua X', '101', 'Apto 44444', 'Bairro24', 'Cidade24', 'UF24'),
(20, 'Carolina Lima', '5566778', '555.666.777-88', 'carolina@email.com', '567-8901', '98765-4321', '12345-678', 'Rua Y', '112', 'Apto 55555', 'Bairro25', 'Cidade25', 'UF25'),
(21, 'Bruno Lucas Alcantara De Oliveira', '33.333.111-1', '545.454.111-22', 'brunoaxlrose8@gmail.com', '(11) 91564-3421', '(11) 94454-6532', '08738350', 'Rua Raimundo Balbino de Freitas', '7', 'Não', 'Vila Pomar', 'Mogi das Cruzes', 'SP'),
(22, 'Bruno Lucas Alcantara De Oliveira', '85.111.621-1', '845.132.133-23', 'brunoaxlrose8@gmail.com', '(11) 97875-4551', '(15) 15445-4545', '08738350', 'Rua Raimundo Balbino de Freitas', '15', 'Não', 'Vila Pomar', 'Mogi das Cruzes', 'SP'),
(23, 'Bruno Lucas Alcantara De Oliveira', '34.235.425-4', '454.562.566-77', 'brunoaxlrose8@gmail.com', '11915643423', '(22) 45245-3542', '08738350', 'Rua Raimundo Balbino de Freitas', '444', 'Nao', 'Vila Pomar', 'Mogi das Cruzes', 'SP'),
(28, 'Maikon Sposito', '64.761.121-4', '866.451.323-23', 'maikon.sposito@gmail.com', '11915643445', '(11) 97775-8454', '08738310', 'Rua São José Operário', '135', 'Não', 'Vila Brasileira', 'Mogi das Cruzes', 'SP'),
(29, 'Bruno Lucas Alcantara De Oliveira', '33.335.265-2', '325.156.224-76', 'brunoaxlrose8@gmail.com', '11915643421', '(11) 14553-5435', '08738350', 'Rua Raimundo Balbino de Freitas', '222', 'n', 'Vila Pomar', 'Mogi das Cruzes', 'SP'),
(30, 'Bruno Lucas Alcantara De Oliveira', '33.335.265-2', '325.156.224-76', 'brunoaxlrose8@gmail.com', '11915643421', '(11) 14553-5435', '08738350', 'Rua Raimundo Balbino de Freitas', '222', 'n', 'Vila Pomar', 'Mogi das Cruzes', 'SP'),
(31, 'Bruno Lucas Alcantara De Oliveira', '54.635.332-1', '879.811.223-13', 'brunoaxlrose8@gmail.com', '11915643425', '(11) 36545-8445', '08738350', 'Rua Raimundo Balbino de Freitas', '645', 'Não', 'Vila Pomar', 'Mogi das Cruzes', 'SP'),
(32, 'Rodrigo', '12.345.678-9', '123.456.789-99', 'rodrigo@gmail', '11999664757', '(11) 99966-4757', '08742000', 'Rua Santa Quitéria', '130', 'Casa 01', 'Vila Sagrado Coração de Maria', 'Mogi das Cruzes', 'SP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int(11) NOT NULL,
  `codigoean` longtext NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `preco` double NOT NULL,
  `qtd_estoque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`codigo`, `codigoean`, `descricao`, `preco`, `qtd_estoque`) VALUES
(1, '1686927303380', 'Arroz Integral 1kg', 5.99, 50),
(2, '1590331994546', 'Feijão Preto 1kg', 4.49, 40),
(3, '1890878093327', 'Açúcar Refinado 1kg', 3.99, 30),
(4, '1683394513729', 'Macarrão Espaguete 500g', 2.49, 80),
(5, '1744338319398', 'Óleo de Soja 900ml', 6.99, 20),
(6, '1671508086539', 'Café em Pó 250g', 8.99, 60),
(7, '1124525505234', 'Leite Integral 1L', 2.79, 80),
(8, '1608103297285', 'Sabão em Pó 1kg', 7.49, 25),
(9, '1666940001460', 'Detergente Líquido 500ml', 1.99, 90),
(10, '1510390146179', 'Shampoo Anticaspa 400ml', 9.99, 35),
(11, '1551130757249', 'Condicionador Hidratante 300ml', 6.49, 55),
(12, '1224483378440', 'Escova de Dentes Macia', 2.29, 100),
(13, '1469024651189', 'Creme Dental 90g', 3.49, 75),
(14, '1671673151358', 'Sabonete em Barra Neutro', 0.99, 120),
(15, '1951291833958', 'Papel Higiênico Folha Dupla', 8.79, 15),
(16, '1741439746451', 'Desodorante Roll-on 50ml', 4.89, 50),
(17, '1853323261116', 'Cereal Matinal 300g', 6.29, 45),
(18, '1042297096962', 'Biscoito Recheado 150g', 2.99, 65),
(19, '1651515732194', 'Água Mineral 1,5L', 1.19, 110),
(20, '1130687400820', 'Barra de Chocolate 100g', 3.79, 40);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `login` varchar(150) NOT NULL,
  `senha` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `login`, `senha`) VALUES
(1, 'Bruno Oliveira', 'bruno', '12345678'),
(2, 'Jhonatan Nascimento', 'jhonatan', '12345678'),
(3, 'Maikon Sposito', 'maikon', '12345678'),
(4, 'Rodrigo Oliveira', 'rodrigo.oliveira', 'rodrigo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `data_venda` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  `formaPagamento` varchar(200) NOT NULL,
  `troco` decimal(10,2) NOT NULL,
  `total_venda` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`data_venda`, `id`, `formaPagamento`, `troco`, `total_venda`) VALUES
('2023-11-27', 1, 'Dinheiro', 0.02, 599.98),
('2023-11-27', 2, 'Dinheiro', 0.03, 149.97),
('2023-11-27', 3, 'Dinheiro', 10.05, 689.95);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_Nome`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_Nome` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
