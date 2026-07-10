--a)
SELECT nomeAutor as 'Autor', nomeLivro as 'Livro' FROM tbAutor
	 LEFT JOIN tbLivro ON tbLivro.codAutor = tbAutor.codAutor

--b)
SELECT nomeEditora as 'Editora', nomeLivro as 'Livro' FROM tbEditora
	LEFT JOIN tbLivro ON tbLivro.codEditora = tbEditora.codEditora

--c)
SELECT nomeAutor as 'Autor', nomeLivro as 'Livro' FROM tbAutor
	RIGHT JOIN tbLivro ON tbLivro.codAutor = tbAutor.codAutor

--d)
SELECT nomeEditora as 'Editora', nomeLivro as 'Livro' FROM tbEditora
	RIGHT JOIN tbLivro ON tbLivro.codEditora = tbEditora.codEditora

--e)
SELECT nomeEditora as 'Editora', nomeLivro as 'Livro' FROM tbEditora
	FULL JOIN tbLivro ON tbLivro.codEditora = tbEditora.codEditora

--f)
SELECT nomeEditora as 'Editora', nomeLivro as 'Livro' FROM tbEditora
	CROSS JOIN tbLivro
		WHERE nomeEditora LIKE '%Cia das Letras%'

--g)
SELECT nomeEditora as 'Editora', nomeLivro as 'Livro' FROM tbEditora
	CROSS JOIN tbLivro

--h)
SELECT nomeLivro as 'Livro', nomeAutor as 'Autor' FROM tbAutor
	RIGHT JOIN tbLivro ON tbLivro.codAutor = tbAutor.codAutor
		WHERE tbAutor.codAutor IS NULL

--i)
SELECT nomeEditora as 'Editora', nomeLivro as 'Livro' FROM tbEditora
	LEFT JOIN tbLivro ON tbLivro.codEditora = tbEditora.codEditora
		WHERE tbLivro.codLivro IS NULL

--j)
SELECT nomeAutor as 'Autor', nomeLivro as 'Livro' FROM tbAutor
	LEFT JOIN tbLivro ON tbLivro.codAutor = tbAutor.codAutor
		WHERE tbLivro.codLivro IS NULL