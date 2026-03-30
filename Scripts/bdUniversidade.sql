CREATE DATABASE BdUniversidade
GO
USE BdUniversidade
CREATE TABLE tbSexoProf(
	idSexoProf INT PRIMARY KEY IDENTITY (1,1),
	descSexoProf VARCHAR(30)
);
Go
CREATE TABLE tbDisciplina(
	idDisciplina INT PRIMARY KEY IDENTITY (1,1),
	nomeDisciplina VARCHAR(50) NOT NULL,
	descDisciplina VARCHAR(150),
	cargaHoraDisciplina INT,
);
Go
CREATE TABLE tbSexoAluno(
	idSexoAluno INT PRIMARY KEY IDENTITY (1,1),
	descSexoAluno VARCHAR(30)
);
Go
CREATE TABLE tbTurma(
	idTurma INT PRIMARY KEY IDENTITY (1,1),
	anoITurma SMALLDATETIME,
	anoFTurma SMALLDATETIME,
	numSalaTurma CHAR(5),
	descTurma VARCHAR(150)
);
CREATE TABLE tbAluno(
	idAluno INT PRIMARY KEY IDENTITY (1,1),
	nomeAluno VARCHAR(60) NOT NULL,
	idadeAluno INT,
	idSexoAluno INT FOREIGN KEY REFERENCES tbSexoAluno (idSexoAluno),
	idTurma INT FOREIGN KEY REFERENCES tbTurma (idTurma)
);
Go
CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY (1,1),
	nomeCurso VARCHAR(50) NOT NULL,
	descCurso VARCHAR(150),
	cargaHoraCurso INT,
	idTurma INT FOREIGN KEY REFERENCES tbTurma (idTurma),
	idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
);
Go
CREATE TABLE tbCampi(
	idCampi INT PRIMARY KEY IDENTITY (1,1),
	nomeCampi VARCHAR (80) NOT NULL,
	descCampi VARCHAR (150),
	idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
);
Go
CREATE TABLE tbDisciplinaCurso(
	idDisciplinaCurso INT PRIMARY KEY IDENTITY (1,1),
	idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso) NOT NULL,
	idDisciplina INT FOREIGN KEY REFERENCES tbDisciplina (idDisciplina) NOT NULL
);
Go
CREATE TABLE tbProf(
	idProf INT PRIMARY KEY IDENTITY (1,1),
	nomeProf VARCHAR(50),
	formacaoProf VARCHAR(80),
	idadeProf INT,
	idSexoProf INT FOREIGN KEY REFERENCES tbSexoProf (idSexoProf)
);
Go
CREATE TABLE tbProfDisciplina(
	idProfDisciplina INT PRIMARY KEY IDENTITY(1,1),
	idProf INT FOREIGN KEY REFERENCES tbProf (idProf) NOT NULL,
	idDisciplina INT FOREIGN KEY REFERENCES tbDisciplina (idDisciplina) NOT NULL
);