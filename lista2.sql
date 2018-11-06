--a)
SELECT DISTINCT funcionario.nome, cidade.nome
FROM funcionario 
	JOIN cidade ON funcionario.naturalidade = cidade.codigo 
	JOIN pedido ON funcionario.codigo = pedido.vendedor 
	JOIN itens ON pedido.codigo = itens.pedido 
	JOIN produto ON produto.codigo = itens.produto
WHERE produto.nome = 'Liquidificador'

--b)
SELECT DISTINCT cliente.nome, cliente.tipo
FROM cliente 
    JOIN pedido ON cliente.codigo = pedido.cliente
    JOIN funcionario ON pedido.vendedor = funcionario.codigo
WHERE funcionario.bairro NOT IN ('Bessa', 'Manaíra')

--c)
SELECT produto.codigo, COUNT(pedido) AS 'Quantidade de pedidos'
FROM produto
	JOIN itens ON produto.codigo = itens.produto
	JOIN pedido ON itens.pedido = pedido.codigo
WHERE itens.quant > 2
GROUP BY produto.codigo

--d)
SELECT produto.nome, SUM(produto.venda)
FROM produto
	JOIN itens ON produto.codigo = itens.produto
	WHERE produto.quantest BETWEEN 10 AND 100
GROUP BY nome 
HAVING SUM(produto.venda) > 2000

--e)
SELECT funcionario.nome
FROM funcionario
WHERE funcionario.datanasc = (
	SELECT MIN(funcionario.datanasc) 
	FROM funcionario
)

--f)
SELECT produto.codigo, produto.nome, produto.venda 
FROM produto
WHERE produto.venda = (
	SELECT MAX(produto.venda)
	FROM produto
)

--g)
SELECT DISTINCT funcionario.nome
FROM funcionario 
	JOIN pedido ON funcionario.codigo = pedido.vendedor
	JOIN itens ON pedido.codigo = itens.pedido
	JOIN produto ON itens.produto = produto.codigo
WHERE itens.preco = (
	SELECT MIN(produto.venda)
	FROM produto
)

--h)
SELECT nome, salario 
FROM funcionario 
WHERE sexo = 'M' AND codigo IN (
	SELECT vendedor 
	FROM pedido
	WHERE DATEPART(yy, dataPedido) = 2013
)

--i)
SELECT nome 
FROM produto
WHERE codigo IN 
	(SELECT produto FROM itens WHERE pedido IN
	(SELECT codigo FROM pedido WHERE DATEPART(yy, dataPedido) = 2010 AND cliente IN
	(SELECT codigo FROM cliente WHERE tipo = 'PF')))

--j)
SELECT DISTINCT cliente.nome
FROM cliente
	JOIN pedido ON cliente.codigo = pedido.cliente
	WHERE DATEPART(yy, dataPedido) IN (2014, 2016) 
