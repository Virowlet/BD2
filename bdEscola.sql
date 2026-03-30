CREATE DATABASE bdEscola
GO
USE bdEscola

CREATE TABLE tbAluno(
	idAluno INT PRIMARY KEY IDENTITY (1,1),
	nomeAluno VARCHAR(50),
	dtaNascAluno SMALLDATETIME,
	rgAluno CHAR(11),
	naturalidadeAluno VARCHAR(40)
);
GO
CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY (1,1),
	nomeCurso VARCHAR(65),
	cargaHorariaCurso INT,
	valorCurso INT
);
GO
CREATE TABLE tbTurma(
	idTurma INT PRIMARY KEY IDENTITY (1,1),
	nomeTurma VARCHAR(25),
	idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso),
	horarioTurma SMALLDATETIME
);
GO
CREATE TABLE tbMatricula(
	idMatricula INT PRIMARY KEY IDENTITY (1,1),
	dtaMatricula SMALLDATETIME,
	idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno),
	idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
);
GO
INSERT INTO tbaluno(nomeAluno,dtaNascAluno,rgAluno,naturalidadeAluno) VALUES
('Paulo Santos','03-10-2000','822921220','SP'),
('Maria da Glória','10-03-1999','452331230','SP'),
('Perla Nogueira Silva','04-04-1998','23533211','SP'),
('Gilson Barros Silva','09-09-1995','34221111x','PE'),
('Mariana Barbosa Santos','10-10-2001','542221229','RJ')

INSERT INTO tbCurso(nomeCurso,cargaHorariaCurso,valorCurso) VALUES
('Inglês',2000,356),
('Alemão',3000,478)

INSERT INTO tbTurma(nomeTurma,idCurso,horarioTurma) VALUES
('1|A', 1, '01-01-1900 12:00'),
('1|B', 1, '01-01-1900 18:00'),
('1AA', 2, '01-01-1900 19:00')

INSERT INTO tbMatricula(dtaMatricula,idAluno,idTurma) VALUES
('10-03-2015', 1, 1),
('05-04-2014', 2, 1),
('05-03-2012', 3, 2),
('03-03-2016', 1, 3),
('05-07-2015', 4, 2),
('07-05-2015', 4, 3),
('06-06-2015', 5, 1),
('05-05-2015', 5, 3)

--1
SELECT nomeAluno as 'Nome do aluno',rgAluno as 'RG',dtaNascAluno as 'Data De Nascimento' FROM tbAluno
WHERE naturalidadeAluno = 'SP'
--2
SELECT nomeAluno as 'Nome do aluno',rgAluno as 'RG'  FROM  tbAluno
WHERE nomeAluno LIKE 'p%'
--3
SELECT nomeCurso as 'Nome do Curso' FROM tbCurso
WHERE cargaHorariaCurso > 2000
--4
SELECT nomeAluno as 'Nome do aluno', rgAluno as 'RG' FROM tbAluno
WHERE nomeAluno LIKE '%silva%'
--5
SELECT nomeAluno as 'Nome do aluno', dtaNascAluno as 'Data de nascimento' FROM tbAluno
WHERE DATEPART(MONTH,dtaNascAluno) = 03
--6
SELECT idAluno as 'Código do aluno', dtaMatricula as 'Data da matrícula' FROM tbMatricula
WHERE DATEPART(MONTH,dtaMatricula) = 05
--7
SELECT idAluno as 'Código do aluno' FROM tbMatricula
WHERE idTurma = 1 OR idTurma = 2
--8
SELECT idAluno as 'Código do aluno' FROM tbMatricula
WHERE idTurma = 3
--9
SELECT idAluno as 'Código do aluno',nomeAluno as 'Nome do aluno', dtaNascAluno as 'Data de nascimento', rgAluno as 'RG', naturalidadeAluno as 'Naturalidade'  FROM tbAluno
--10
SELECT idTurma as 'Código da turma', nomeTurma as 'Nome da Turma', idCurso 'Código do Curso', horarioTurma 'Horário' FROM tbTurma