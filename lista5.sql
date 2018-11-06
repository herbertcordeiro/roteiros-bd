--a)
ALTER PROCEDURE quest_5_a
@nome_cliente VARCHAR(40), @qnt_ped INT OUTPUT AS
SELECT @qnt_ped = COUNT(*)
FROM cliente 
    JOIN pedido ON cliente.codigo = pedido.cliente
WHERE @nome_cliente = cliente.nome AND DATEPART(yy, pedido.dataPedido) = 2012

DECLARE @qnt_ped INT
EXEC quest_5_a 'Larissa Maia', @qnt_ped OUTPUT
SELECT @qnt_ped

--b)
ALTER PROCEDURE quest_5_b
@cod_cliente INT AS
DECLARE @cliente VARCHAR(40), @uf VARCHAR(40), @tipo VARCHAR(40), @data VARCHAR(40)
SELECT @cliente = cliente.nome, @uf = cidade.uf, @tipo = cliente.tipo, @data = GETDATE()
FROM cliente 
    JOIN cidade ON cliente.cidade = cidade.codigo
WHERE @cod_cliente = cliente.codigo

    PRINT('**** Cliente Loja ****')
    PRINT('======================')
    PRINT('Nome Cliente: ' + @cliente)
    PRINT('Estado: ' + @uf)
    PRINT('Tipo de Cliente: ' + @tipo)
    PRINT('Data de Hoje: ' + @data)

EXEC quest_5_b 
@cod_cliente = '1'

--d)
CREATE PROCEDURE quest_5_d
@cod_func INT, @qnt_venda INT OUTPUT AS
DECLARE 
