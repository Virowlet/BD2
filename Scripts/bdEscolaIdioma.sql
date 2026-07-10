CREATE DATABASE bdEscolaIdioma
GO 
USE bdEscola

CREATE TABLE tbPeriodo (
	idPeriodo INT PRIMARY KEY IDENTITY(1,1),
	descPeriodo VARCHAR(50),
);
GO

CREATE TABLE tbNivel (
	idNivel INT PRIMARY KEY IDENTITY(1,1),
	descNivel VARCHAR(50),
);
GO

CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY (1,1),
	nomeCurso VARCHAR(50),
	valorCurso INT,
);
GO

CREATE TABLE tbAluno (
	idAluno	INT PRIMARY KEY IDENTITY (1,1),
	nomeAluno VARCHAR(50),
	rgAluno VARCHAR(11),
	cpfAluno VARCHAR(11),
	logradouroAluno VARCHAR(50),
	numAluno VARCHAR (6),
	complementoAluno VARCHAR (40),
	cepAluno VARCHAR(11),
	bairroAluno VARCHAR(30),
	cidadeAluno VARCHAR(30),
	dtaNasAluno DATE
);
GO

CREATE TABLE tbTelAluno (
	idTelAluno INT PRIMARY KEY IDENTITY (1,1),
	numTelAluno VARCHAR(11),
	idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
);
GO

CREATE TABLE tbTurma (
	idTurma INT PRIMARY KEY IDENTITY (1,1),
	descTurma VARCHAR(30),
	idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso),
	idNivel INT FOREIGN KEY REFERENCES tbNivel(idNivel),
	idPeriodo INT FOREIGN KEY REFERENCES tbPeriodo(idPeriodo),
	horarioTurma TIME,
	diaSemana VARCHAR(12)
);
GO
CREATE TABLE tbMatricula (
	idMatricula INT PRIMARY KEY IDENTITY (1,1),
	dtaMatricula DATE,
	idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno),
	idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma),
);

INSERT INTO tbPeriodo (descPeriodo) VALUES
('Manhã'),
('Tarde'),
('Noite');
GO

INSERT INTO tbNivel (descNivel) VALUES
('Básico'),
('Intermediário'),
('Avançado');
GO

INSERT INTO tbCurso (nomeCurso, valorCurso) VALUES
('Inglês', 500.00),
('Espanhol', 650.00),
('Francês', 1200.00);
GO

INSERT INTO tbAluno (
nomeAluno, rgAluno, cpfAluno, logradouroAluno, numAluno,
complementoAluno, cepAluno, bairroAluno, cidadeAluno, dtaNasAluno
) VALUES
('João Silva', '123456789', '11122233344', 'Rua A', '10',
'Apto 1', '01001000', 'Centro', 'São Paulo', '2000-05-10'),

('Maria Souza', '987654321', '55566677788', 'Rua B', '200',
'Casa', '02002000', 'Vila Mariana', 'São Paulo', '1998-09-15'),

('Carlos Lima', '456123789', '99988877766', 'Rua C', '30',
'Bloco 2', '03003000', 'Mooca', 'São Paulo', '2002-01-22');
GO

INSERT INTO tbTelAluno (numTelAluno, idAluno) VALUES
('11999990001', 1),
('11988880002', 2),
('11977770003', 3),
('11966660004', 1);
GO

INSERT INTO tbTurma (
descTurma, idCurso, idNivel, idPeriodo, horarioTurma, diaSemana
) VALUES
('Turma A', 1, 1, 1, '08:00', 'Segunda'),
('Turma B', 2, 2, 2, '14:00', 'Terça'),
('Turma C', 3, 3, 3, '19:00', 'Quinta');
GO

INSERT INTO tbMatricula (dtaMatricula, idAluno, idTurma) VALUES
('2026-01-10', 1, 1),
('2026-01-11', 2, 2),
('2026-01-12', 3, 3),
('2026-01-13', 1, 2);
GO

--a)
SELECT nomeCurso as'nome do curso', valorCurso as'preço do curso' FROM tbCurso
	WHERE valorCurso <= (SELECT AVG(valorCurso) FROM tbCurso);

--b)
SELECT nomeAluno as 'Aluno', rgAluno as 'RG' FROM tbAluno
	WHERE dtaNascAluno = (SELECT MIN(dtaNascAluno) FROM tbAluno)

--c)
SELECT nomeAluno as 'Aluno' FROM tbAluno
	WHERE dtaNascAluno = (SELECT MAX(dtaNascAluno) FROM tbAluno)

--d)
SELECT nomeCurso as 'Curso', valorCurso as 'Valor' FROM tbCurso
	WHERE valorCurso = (SELECT MAX(valorCurso) FROM tbCurso)

--e)
SELECT nomeAluno as 'Aluno' FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
		WHERE idMatricula = (SELECT MAX(idMatricula) FROM tbMatricula)

--f)
SELECT nomeAluno as 'Aluno' FROM tbAluno
	WHERE idAluno = (SELECT idAluno FROM tbMatricula WHERE idMatricula = 1)

--g)
SELECT nomeAluno as 'Nome do aluno', rgAluno as 'RG', dtaNascAluno as 'Data de nascimento' FROM tbAluno
	WHERE idAluno = (SELECT idAluno FROM tbMatricula WHERE idTurma = 
	(SELECT idTurma FROM tbTurma WHERE idCurso = 1))