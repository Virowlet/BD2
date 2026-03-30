CREATE DATABASE bdONG
GO
USE bdONG
CREATE TABLE tbGenitor(
	idGenitor INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	nomeGenitor VARCHAR(40),
	cpfGenitor CHAR(11) NOT NULL
);
Go
CREATE TABLE tbPadrinho(
	idPadrinho INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	nomePadrinho VARCHAR(40),
	cpfPadrinho CHAR(11) NOT NULL
);
Go
CREATE TABLE tbSexoCrianca(
	idSexoCrianca INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	descSexoCrianca VARCHAR(9) NOT NULL
);
Go
CREATE TABLE tbStatusCrianca(
	idStatusCrianca INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	descStatusCrianca VARCHAR(80)
);
Go
CREATE TABLE tbCrianca(
	idCrianca INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	nomeCrianca VARCHAR(40) NOT NULL,
	dtaNascCrianca SMALLDATETIME,
	idSexoCrianca INT FOREIGN KEY REFERENCES tbSexoCrianca (idSexoCrianca),
	idStatusCrianca INT FOREIGN KEY REFERENCES tbStatusCrianca (idStatusCrianca)
);
Go
CREATE TABLE tbFiliacao(
	idFiliacao INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	idCrianca INT FOREIGN KEY REFERENCES tbCrianca (idCrianca),
	idGenitor INT FOREIGN KEY REFERENCES tbGenitor (idGenitor)
);
Go
CREATE TABLE tbApadrinhamento(
	idApadrinhamento INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	idCrianca INT FOREIGN KEY REFERENCES tbCrianca (idCrianca),
	idPadrinho INT FOREIGN KEY REFERENCES tbPadrinho (idPadrinho)
);
Go
CREATE TABLE tbObsCrianca(
	idObsCrianca INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	idCrianca INT FOREIGN KEY REFERENCES tbCrianca (idCrianca),
	obsCrianca VARCHAR(200) NOT NULL,
	dtaObsCrianca DATE
);
Go
CREATE TABLE tbProntuario(
	idProntuario INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	idCrianca INT FOREIGN KEY REFERENCES tbCrianca (idCrianca) UNIQUE,
	obsProntuario VARCHAR(200)
);
Go
CREATE TABLE tbDoenca(
	idDoenca INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	nomeDoenca VARCHAR(80),
	obsDoenca VARCHAR(100),
	cid CHAR(7)
);
Go
CREATE TABLE tbProntuarioDoenca(
	idProntuarioDoenca INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	idProntuario INT FOREIGN KEY REFERENCES tbProntuario (idProntuario),
	idDoenca INT FOREIGN KEY REFERENCES tbDoenca (idDoenca),
	dtaAcometimento SMALLDATETIME
);