--a)
SELECT TOP 50 PERCENT piloto.NomePil
FROM piloto 
    JOIN classificacao ON piloto.CodPil = classificacao.piloto
WHERE DATEDIFF(yy, classificacao.data, GETDATE()) <= 2
ORDER BY piloto.NomePil

--b)
SELECT circuito.nomeCirc
FROM circuito 
    JOIN classificacao ON circuito.CodCirc = classificacao.circuito
    JOIN pais ON circuito.pais = pais.SiglaPais
WHERE pais.NomePais IN ('Brasil', 'França') AND DATEPART(yy, classificacao.data) = 2012 AND DATENAME(mm, classificacao.data) = 'Julho'

--c)
SELECT piloto.nomePil, SUM(classificacao.pontuacao)
FROM piloto
    JOIN classificacao ON piloto.CodPil = classificacao.piloto
    JOIN circuito ON classificacao.circuito = circuito.CodCirc
    JOIN pais ON circuito.pais = pais.SiglaPais
    JOIN equipe ON piloto.equipe = equipe.CodEq
WHERE circuito.NomeCirc LIKE 'M%o%' AND equipe.pais IN ('ING', 'SUI')
GROUP BY piloto.nomePil
HAVING SUM(classificacao.pontuacao) > 5

select *
from Classificacao