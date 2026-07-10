CREATE DATABASE bdLivrariaBrasileira
GO
USE bdLivrariaBrasileira
CREATE TABLE tbAutor(
	idAutor INT PRIMARY KEY IDENTITY(1,1),
	nomeAutor VARCHAR(60)
);
GO
CREATE TABLE tbGenero(
	idGenero INT PRIMARY KEY IDENTITY(1,1),
	nomeGenero VARCHAR(30)
);
GO
CREATE TABLE tbEditora(
	idEditora INT PRIMARY KEY IDENTITY(1,1),
	nomeEditora VARCHAR(70)
);
GO
CREATE TABLE tbLivro(
	idLivro INT PRIMARY KEY IDENTITY(1,1),
	nomeLivro VARCHAR(50),
	numPaginasLivro INT,
	idGenero INT FOREIGN KEY REFERENCES tbGenero(idGenero),
	idAutor INT FOREIGN KEY REFERENCES tbAutor(idAutor),
	idEditora INT FOREIGN KEY REFERENCES tbEditora(idEditora)
);
GO
INSERT INTO tbAutor (nomeAutor) VALUES
('Machado de Assis'),
('Clarice Lispector'),
('Jorge Amado'),
('Monteiro Lobato'),
('Paulo Coelho'),
('Graciliano Ramos'),
('Carlos Drummond de Andrade'),
('Cecília Meireles'),
('Érico Veríssimo'),
('Lygia Fagundes Telles'),
('Carlos Drummond de Andrade');
GO
INSERT INTO tbGenero (nomeGenero) VALUES
('Romance'),
('Fantasia'),
('Drama'),
('Aventura'),
('Poesia'),
('Suspense'),
('Terror'),
('Ficção Científica'),
('Biografia'),
('Infantil');
GO
INSERT INTO tbEditora (nomeEditora) VALUES
('Cia das Letras'),
('Record'),
('Saraiva'),
('Ática'),
('Globo Livros'),
('Rocco'),
('Sextante'),
('Intrínseca'),
('Editora Moderna'),
('HarperCollins Brasil');
GO
INSERT INTO tbLivro(nomeLivro, numPaginasLivro, idGenero, idAutor, idEditora) VALUES
('Dom Casmurro', 256, 1, 1, 1),
('Memórias Póstumas de Brás Cubas', 320, 1, 1, 3),
('A Hora da Estrela', 128, 3, 2, 2),
('Capitães da Areia', 320, 4, 3, 5),
('Sítio do Picapau Amarelo', 220, 10, 4, 4),
('O Alquimista', 208, 2, 5, 7),
('Vidas Secas', 176, 3, 6, 3),
('Alguma Poesia', 144, 5, 7, 6),
('Romanceiro da Inconfidência', 300, 5, 8, 8),
('O Tempo e o Vento', 560, 1, 9, 9),
('As Meninas', 280, 6, 10, 10),
('José & Novos Poemas', 128, 5, 11, 6);


--a)
SELECT COUNT (idLivro) as "quantidade de livros" FROM tbLivro
	WHERE  nomeLivro LIKE 'p%'

--b)
SELECT MAX(numPaginasLivro) as "Maior número de páginas" FROM tbLivro

--c)
SELECT MIN(numPaginasLivro) as "menor número de páginas" FROM tbLivro

--d)
SELECT AVG(numPaginasLivro) as "média das páginas" FROM tbLivro

--e)
SELECT SUM(numPaginasLivro) as "número de páginas", tbEditora.idEditora as "número da editora" FROM tbLivro 
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		WHERE tbEditora.idEditora = 1
			GROUP BY tbEditora.idEditora

--f)
SELECT SUM(numPaginasLivro) as "soma das páginas", nomeLivro as "nome do livro" FROM tbLivro
	WHERE nomeLivro LIKE 'a%'
		GROUP BY nomeLivro

--g)
SELECT AVG(numPaginasLivro) as "média do número de páginas do autor 3", tbAutor.idAutor as "número do autor" FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE tbAutor.idAutor = 3
			GROUP BY numPaginasLivro

--h)
SELECT idLivro as "quantidade de livros da editora 4", tbEditora.idEditora as "número da editora" FROM tbLivro
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora 
		WHERE tbEditora.idEditora = 4


--i)
SELECT AVG(numPaginasLivro) as "média  de páginas  com nome estrela",nomeLivro as "livro da estrela" FROM tbLivro
	WHERE nomeLivro LIKE '%estrela%'
		GROUP BY tbLivro.nomeLivro

--j)
SELECT COUNT(idLivro) as "número de livros com poema no nome ", nomeLivro as "nome do livro" FROM tbLivro
	WHERE tbLivro.nomeLivro LIKE '%poema%'
		GROUP BY nomeLivro

--k)
SELECT COUNT(idLivro) as "soma dos livros", nomeGenero as "gênero do livro" FROM tbLivro
	INNER JOIN tbGenero ON tbGenero.idGenero = tbLivro.idGenero
		GROUP BY nomeGenero

--l)
SELECT SUM(numPaginasLivro) as "Soma das Páginas", nomeAutor as "Autor do livro" FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeAutor

--m)
SELECT AVG(numPaginasLivro) as "Média das páginas", nomeAutor as "Autor do livro" FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		GROUP BY nomeAutor
			ORDER BY nomeAutor
--n)
SELECT COUNT(idLivro) as "Quantidade de livros", nomeEditora as "Editora" FROM tbLivro
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		GROUP BY nomeEditora
			ORDER BY nomeEditora DESC
--o)
SELECT SUM(numPaginasLivro) as "Soma das páginas", nomeAutor as "Nome do autor" FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE nomeAutor LIKE 'c%'
			GROUP BY nomeAutor

--p)
SELECT COUNT(idLivro) as "Quantidade de livros", nomeAutor as "Autor" FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE nomeAutor LIKE '%machado de assis%' OR nomeAutor LIKE '%cora coralina%' OR nomeAutor LIKE '%graciliano ramos%' OR nomeAutor LIKE '%clarice lispector%'
			GROUP BY nomeAutor

--q)
SELECT SUM(numPaginasLivro) as "Soma das páginas", nomeEditora as "Editora" FROM tbLivro
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		WHERE numPaginasLivro>=200 AND numPaginasLivro<=500
			GROUP BY nomeEditora

--r)
SELECT nomeLivro as "Nome do Livro" , nomeAutor as "Nome do Autor", nomeEditora as "Editora" FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora

--s)
SELECT nomeLivro as "Nome do Livro", nomeAutor as "Autor" FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
	INNER JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		WHERE nomeEditora LIKE '%cia das letras%'

--t)
SELECT nomeLivro as "Nome do Livro", nomeAutor as "Autor" FROM tbLivro
	INNER JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor
		WHERE nomeAutor NOT LIKE '%érico veríssimo%'