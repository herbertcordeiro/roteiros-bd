--a)
SELECT DISTINCT produto.nome, produto.venda - produto.custo AS 'Lucro' INTO #letraA
FROM produto 
    JOIN itens ON produto.codigo = itens.produto
    JOIN pedido ON itens.pedido = pedido.codigo
WHERE DATEPART(mm, pedido.dataFatura) BETWEEN 1 AND 6 AND DATEPART(yy, pedido.dataFatura) = 2012

SELECT *
FROM #letraA

--b)
SELECT DISTINCT TOP 1 cliente.nome, COUNT(pedido)
FROM cliente
    JOIN pedido ON cliente.codigo = pedido.cliente
    JOIN itens ON pedido.codigo = pedido.codigo
WHERE DATEPART(yy, pedido.dataPedido) = 2016
GROUP BY cliente.nome 
ORDER BY COUNT(pedido) DESC

--c)
CREATE VIEW letraC AS 
    SELECT DISTINCT funcionario.nome, funcionario.salario
    FROM funcionario 
        JOIN pedido ON funcionario.codigo = pedido.vendedor
    WHERE funcionario.sexo = 'M' AND DATEPART(yy, pedido.dataPedido) = 2010

SELECT *
FROM letraC

--d)
CREATE PROCEDURE letraD
@cod_func INT AS 
SELECT DISTINCT funcionario.nome, pedido.dataPedido
FROM pedido 
    JOIN funcionario ON pedido.vendedor = funcionario.codigo
WHERE @cod_func = funcionario.codigo 

EXEC letraD
@cod_func = 3 

--e)
CREATE PROCEDURE letraE
@cod_ped INT AS
SELECT cliente.nome, produto.nome, produto.venda, pedido.dataPedido
FROM cliente 
    JOIN pedido ON cliente.codigo = pedido.cliente
    JOIN itens ON pedido.codigo = itens.pedido
    JOIN produto ON itens.produto = produto.codigo
WHERE @cod_ped = produto.codigo AND DATEPART(yy, dataPedido) = 2014

EXEC letraE
@cod_ped = 2

--f)
CREATE PROCEDURE letraF
@nome_func VARCHAR(40) AS
SELECT funcionario.nome, cidade.nome, pais.nome
FROM funcionario
    JOIN cidade ON funcionario.cidade = cidade.codigo
    JOIN pais ON cidade.pais = pais.sigla
WHERE @nome_func = funcionario.nome

EXEC letraF
@nome_func = 'João da Silva'