--a)
ALTER PROCEDURE letraA
@nome VARCHAR(40), @qnt_provas INT OUTPUT AS
DECLARE @posicao INT, @ano VARCHAR(40)
SELECT @posicao = classificacao.posicao, @ano = classificacao.data
FROM classificacao 
    JOIN piloto ON classificacao.piloto = piloto.CodPil
WHERE @nome = piloto.NomePil
IF(@posicao = 1 AND DATEPART(yy, @ano) = 2015)
    PRINT('ihuu')
ELSE
    PRINT('fudeu')

DECLARE @qnt_provas INT
EXEC letraA 'Niko Hulkenberg', @qnt_provas OUTPUT
SELECT @qnt_provas

CREATE TRIGGER letraD
ON piloto
FOR INSERT
BEGIN

IF((SELECT classificacao.posicao FROM piloto 
    JOIN classificacao ON piloto.CodPil = classificacao.piloto) = 1 AND (
        SELECT equipe.NomeEq FROM equipe JOIN piloto ON equipe.CodEq = piloto.Equipe) IN ('Lotus', 'Ferrari'))
    classificacao.pontuacao + 5
END

create trigger VendaMaior50
on Itens for insert
as 
if((select i.preco from inserted i join Pedido pe on pe.codigo = i.pedido) > 50)
	print('Um novo pedido acima de R$50,00 foi realizado')