CREATE DATABASE bdLojaRoupas
GO
USE bdLojaRoupas

CREATE TABLE tbCliente(
   idCliente INT PRIMARY KEY IDENTITY(1,1),
   nomeCliente VARCHAR(50),
   idadeCliente INT
);
GO
CREATE TABLE tbVendedor(
   idVendedor INT PRIMARY KEY IDENTITY(1,1),
   nomeVendedor VARCHAR(60)
);
GO
CREATE TABLE tbFuncionario(
  idFuncionario INT PRIMARY KEY IDENTITY(1,1),
  nomeFuncionario VARCHAR(60),
  idadeFuncionario INT,
  dataAdimicaoFuncionario DATE,
  salarioFuncionario INT
);
GO
CREATE TABLE tbFabricante(
   idFabricante INT PRIMARY KEY IDENTITY(1,1),
   nomeFabricante VARCHAR(50)
);
GO
CREATE TABLE tbVenda(
   idVenda INT PRIMARY KEY IDENTITY(1,1),
   dataVenda SMALLDATETIME,
   idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente),
   idVendedor INT FOREIGN KEY REFERENCES tbVendedor(idVendedor),
   totalVenda INT
);
GO
CREATE TABLE tbProduto(
   idProduto INT PRIMARY KEY IDENTITY(1,1),
   nomeProduto VARCHAR(50),
   precoProduto INT,
   dataEntradaProduto SMALLDATETIME,
   idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(idFuncionario),
   idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante)
);
GO
CREATE TABLE tbItensVenda(
   idItensVenda INT PRIMARY KEY IDENTITY(1,1),
   idVenda INT FOREIGN KEY REFERENCES tbVenda(idVenda),
   idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto),
   quantidadeItens INT,
   subTotalItens INT
);
GO

INSERT INTO tbFabricante(nomeFabricante)
VALUES ('Malwee')
INSERT INTO tbFabricante(nomeFabricante)
VALUES ('Marisol')
INSERT INTO tbFabricante(nomeFabricante)
VALUES ('Cia da Malha')

INSERT INTO tbProduto(nomeProduto,precoProduto,dataEntradaProduto,idFabricante)
VALUES ('Blusa Preta', 115, '21-03-2026', 1)
INSERT INTO tbProduto(nomeProduto,precoProduto,dataEntradaProduto,idFabricante)
VALUES ('Calca Legging', 87, '21-03-2026', 1)
INSERT INTO tbProduto(nomeProduto,precoProduto,dataEntradaProduto,idFabricante)
VALUES ('Bermuda', 65, '21-03-2026', 1)

INSERT INTO tbProduto(nomeProduto,precoProduto,dataEntradaProduto,idFabricante)
VALUES ('Camiseta Branca', 99, '21-03-2026', 2)
INSERT INTO tbProduto(nomeProduto,precoProduto,dataEntradaProduto,idFabricante)
VALUES ('Regata', 77, '21-03-2026', 2)
INSERT INTO tbProduto(nomeProduto,precoProduto,dataEntradaProduto,idFabricante)
VALUES ('Shorts Jeans', 97, '21-03-2026', 2)

INSERT INTO tbProduto(nomeProduto,precoProduto,dataEntradaProduto,idFabricante)
VALUES ('Pijama', 105, '21-03-2026', 3)
INSERT INTO tbProduto(nomeProduto,precoProduto,dataEntradaProduto,idFabricante)
VALUES ('Blusa Azul', 80, '21-03-2026', 3)
INSERT INTO tbProduto(nomeProduto,precoProduto,dataEntradaProduto,idFabricante)
VALUES ('Moletom', 75, '21-03-2026', 3)

INSERT INTO tbCliente(nomeCliente, idadeCliente)VALUES 
('Cristian José', 38),
('Fernanda Pontes', 47),
('Lenildo Torres', 21),
('João Roberto', 52),
('Antônio de Assis', 77)

INSERT INTO tbVendedor(nomeVendedor) VALUES
('João Santana'),
('Raquel Torres')

INSERT INTO tbVenda(dataVenda,idCliente,idVendedor,totalVenda) VALUES
('25-03-2026', 1, 1, 87 + 80),
('25-03-2026', 2, 1, 115 + 77),
('25-03-2026', 3, 2, 99 + 80),
('25-03-2026', 4, 2, 115 + 65),
('25-03-2026', 5, 2, 105 + 75)

INSERT INTO tbItensVenda(idVenda,idProduto,quantidadeItens,subTotalItens) VALUES
(1, 2, 30, 87),
(1, 8, 25, 80),
(2, 1, 36, 115),
(2, 5, 40, 77),
(3, 4, 58, 99),
(3, 2, 30, 80),
(4, 1, 36, 115),
(4, 3, 77, 65),
(5, 7, 88, 105),
(5, 9, 99, 75)

UPDATE tbFabricante
SET nomeFabricante = 'Turma da Malha'
WHERE idFabricante = 1

UPDATE tbVenda
SET TotalVenda = TotalVenda - (TotalVenda * 0.1)
WHERE idCliente = 1

UPDATE tbProduto
SET precoProduto = precoProduto + (precoProduto * 0.2)
WHERE idFabricante = 2

UPDATE tbItensVenda
SET quantidadeItens = quantidadeItens - 10
WHERE idProduto = 3

DELETE FROM tbItensVenda
WHERE idVenda = 2 AND idItensVenda = 4

DELETE FROM tbItensVenda
WHERE idVenda = 3

DELETE FROM tbFabricante
WHERE idFabricante = 1
--Não consegui deletar o fabricante devido ao erro: A instrução DELETE conflitou com a restrição do REFERENCE "FK__tbProduto__idFab__440B1D61". O conflito ocorreu no banco de dados "bdLojaRoupas", tabela "dbo.tbProduto", column 'idFabricante'. 
