--a)
SELECT codigo, nome, salario, salario + (salario * 0.3) AS 'Salario + 30%'
FROM funcionario 

--b)
SELECT codigo, nome, custo, venda, venda - custo AS 'Lucro'
FROM produto 

--c)
SELECT TOP 3 nome
FROM cliente 

--d)
SELECT nome, DATENAME(mm, datanasc) AS 'Mes de aniverario'
FROM funcionario 

--e)
SELECT TOP 50 PERCENT *
FROM pedido 
ORDER BY dataPedido

--f)
SELECT descricao, ROUND(custo, 1), ROUND(venda, 1)
FROM produto

--g)
SELECT LOWER(SUBSTRING(sigla, 1,  1))
FROM setor

--h)
SELECT *
FROM pedido
WHERE DATEDIFF(dd, dataPedido, GETDATE()) <= 200
ORDER BY dataPedido DESC

--i)
SELECT TOP 1 *
FROM PEDIDO 
ORDER BY dataPedido DESC

--j)
SELECT POWER(preco, 3)
FROM itens 

--k)
SELECT AVG(salario)
FROM funcionario 

--l)
SELECT *
FROM Pedido
WHERE dataPedido BETWEEN '2009-01-01' AND '2009-12-31'

--m)
SELECT COUNT(*)
FROM pedido 

--n)
SELECT *
FROM funcionario
WHERE email IS NOT NULL 

--o)
SELECT codigo, nome
FROM funcionario
WHERE nome LIKE '%Silva%'

--p)
SELECT codigo, nome
FROM funcionario
WHERE nome LIKE 'Mar[i-t]a%'

--q)
SELECT codigo, nome
FROM cliente
WHERE nome NOT LIKE 'L%' AND nome NOT LIKE 'M%'