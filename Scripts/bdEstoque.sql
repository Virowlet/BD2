CREATE DATABASE bdEstoque
GO
USE bdEstoque
CREATE TABLE tbCliente(
	idCliente INT PRIMARY KEY IDENTITY (1,1),
	nomeCliente VARCHAR(50),
	cpfCliente CHAR(11) UNIQUE,
	emailCliente VARCHAR(50),
	sexoCliente CHAR(9),
	dtaNascimentoCliente SMALLDATETIME
);
GO
CREATE TABLE tbFornecedor(
	idFornecedor INT PRIMARY KEY IDENTITY (1,1),
	nomeFornecedor VARCHAR(80),
	contatoFornecedor VARCHAR(50),
);
GO
CREATE TABLE tbFabricante(
	idFabricante INT PRIMARY KEY IDENTITY (1,1),
	nomeFabricante VARCHAR(80)
);
GO
CREATE TABLE tbProduto(
	idProduto INT PRIMARY KEY IDENTITY (1,1),
	descricaoProduto VARCHAR(50),
	valorProduto INT,
	quantidadeProduto INT,
	idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante),
	idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor)
);
GO
CREATE TABLE tbVenda(
	idVenda INT PRIMARY KEY IDENTITY (1,1),
	dataVenda SMALLDATETIME,
	valorTotalVenda INT,
	idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
);
GO
CREATE TABLE tbItensVenda(
	idItensVenda INT PRIMARY KEY IDENTITY (1,1),
	idVenda INT FOREIGN KEY REFERENCES tbVenda(idVenda),
	idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto),
	quantidadeItensVenda INT,
	subTotalItensVenda INT
);
INSERT INTO tbFabricante(nomeFabricante)
VALUES('Unilever')
INSERT INTO tbFabricante(nomeFabricante)
VALUES('P&G')
INSERT INTO tbFabricante(nomeFabricante)
VALUES('Bunge')


INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dtaNascimentoCliente)
VALUES('Armando José Santana','12345678900','armandojsantana@outlook.com','m','21-02-1961')
INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dtaNascimentoCliente)
VALUES('Sheila Carvalho Leal','45678909823','scarvalho@ig.com.br','f','13-09-1978')
INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dtaNascimentoCliente)
VALUES('Carlos Henrique Souza','76598278299','chenrique@ig.com.br','m','08-09-1981')
INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dtaNascimentoCliente)
VALUES('Maria Aparecida Souza','87365309899','madasouza@outlook.com','f','07-07-1962')
INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dtaNascimentoCliente)
VALUES('Adriana Nogueira Silva','7635409388','drica1977@ig.com.br','f','09-04-1977')
INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dtaNascimentoCliente)
VALUES('Paulo Henrique Silva','87390123111','phsilva@hotmail.com','m','02-02-1987')


INSERT INTO tbFornecedor(nomeFornecedor,contatoFornecedor)
VALUES('Atacadão','Carlos Santos')
INSERT INTO tbFornecedor(nomeFornecedor,contatoFornecedor)
VALUES('Assai','Maria estella')
INSERT INTO tbFornecedor(nomeFornecedor,contatoFornecedor)
VALUES('Roldão','Paulo César')





INSERT INTO tbProduto(descricaoProduto,quantidadeProduto,valorProduto,idFabricante,idFornecedor)
VALUES('Amaciante Downy',1500,5.76,2,1)
INSERT INTO tbProduto(descricaoProduto,quantidadeProduto,valorProduto,idFabricante,idFornecedor)
VALUES('Smaciante Confort',2300,5.45,1,1)
INSERT INTO tbProduto(descricaoProduto,quantidadeProduto,valorProduto,idFabricante,idFornecedor)
VALUES('Sabão em pó OMO',1200,5.99,1,2)
INSERT INTO tbProduto(descricaoProduto,quantidadeProduto,valorProduto,idFabricante,idFornecedor)
VALUES('MArgarina Qually',2500,4.76,3,1)
INSERT INTO tbProduto(descricaoProduto,quantidadeProduto,valorProduto,idFabricante,idFornecedor)
VALUES('Salsicha hot dog Sadia',2900,6.78,3,2)
INSERT INTO tbProduto(descricaoProduto,quantidadeProduto,valorProduto,idFabricante,idFornecedor)
VALUES('Mortadela Perdigão',1200,2.50,3,3)
INSERT INTO tbProduto(descricaoProduto,quantidadeProduto,valorProduto,idFabricante,idFornecedor)
VALUES('Hamburger Sadia',1600,9.89,3,1)
INSERT INTO tbProduto(descricaoProduto,quantidadeProduto,valorProduto,idFabricante,idFornecedor)
VALUES('Fralda Pampers',340,36.00,2,3)
INSERT INTO tbProduto(descricaoProduto,quantidadeProduto,valorProduto,idFabricante,idFornecedor)
VALUES('Xampu Seda',800,5.89,1,2)
INSERT INTO tbProduto(descricaoProduto,quantidadeProduto,valorProduto,idFabricante,idFornecedor)
VALUES('Condicionador Seda',700,6.50,1,3)


INSERT INTO tbVenda(dataVenda,valorTotalVenda,idCliente)
VALUES('01-02-2014',4500,1)
INSERT INTO tbVenda(dataVenda,valorTotalVenda,idCliente)
VALUES('03-02-2014',3400,1)
INSERT INTO tbVenda(dataVenda,valorTotalVenda,idCliente)
VALUES('10-02-2014',2100,2)
INSERT INTO tbVenda(dataVenda,valorTotalVenda,idCliente)
VALUES('15-02-2014',2700,3)
INSERT INTO tbVenda(dataVenda,valorTotalVenda,idCliente)
VALUES('17-03-2014',560,3)
INSERT INTO tbVenda(dataVenda,valorTotalVenda,idCliente)
VALUES('09-04-2014',1200,4)
INSERT INTO tbVenda(dataVenda,valorTotalVenda,idCliente)
VALUES('09-04-2014',1300,1)
INSERT INTO tbVenda(dataVenda,valorTotalVenda,idCliente)
VALUES('07-05-2014',3500,5)
INSERT INTO tbVenda(dataVenda,valorTotalVenda,idCliente)
VALUES('07-05-2014',3400,1)
INSERT INTO tbVenda(dataVenda,valorTotalVenda,idCliente)
VALUES('05-05-2014',4000,2)



INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(200,1500,1,1)
INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(300,3000,1,2)
INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(120,1400,2,4)
INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(200,1000,2,2)
INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(130,1000,2,3)
INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(200,2100,3,5)
INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(120,1000,4,4)
INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(450,700,4,5)
INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(200,560,5,5)
INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(200,600,6,7)
INSERT INTO tbItensVenda(quantidadeItensVenda,subTotalItensVenda,idVenda,idProduto)
VALUES(300,600,6,6)