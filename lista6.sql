--a)
ALTER TRIGGER alert
ON pedido
FOR INSERT 
AS 
BEGIN

    DECLARE @cod_ped INT, @preco INT
    SELECT @cod_ped = pedido.codigo, @preco = itens.preco
    FROM pedido
        JOIN itens ON pedido.codigo = itens.pedido 
    IF(@preco > 50)
        PRINT('Preco maior que R$50,00!')

END

Insert Into Itens Values (164, 1, 98, 1, 0.2)

--b)
CREATE TRIGGER alert_salario
ON funcionario
FOR UPDATE
AS
BEGIN

    UPDATE funcionario
    SET funcionario.salario = funcionario.salario + funcao.gratific
    FROM funcionario
        JOIN funcao ON funcionario.funcao = funcao.codigo

END

--c)
