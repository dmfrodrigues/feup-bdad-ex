.mode columns
.headers on

-- a.
SELECT * FROM Peca WHERE custoUnitario<10 AND codigo LIKE "%98%";

-- b.
SELECT Matricula FROM Carro AS c, Reparacao AS r
WHERE c.idCarro=r.idCarro
AND julianday(date("2010-09-01")) <= julianday(dataFim)
AND julianday(dataFim) <= julianday(date("2010-09-30"));

-- c.
-- Nomes dos clientes proprietários de carros que utilizaram peças com custo superior a 10€
SELECT nome FROM Cliente
WHERE idCliente IN (
    -- Clientes proprietários de carros que utilizaram peças com custo superior a 10€
    SELECT DISTINCT idCliente FROM Carro
    WHERE idCarro IN (
        -- Carros que utilizaram peças com custo superior a 10€
        SELECT idCarro FROM Reparacao
        WHERE idReparacao IN (
            -- Reparações que usaram peças com custo superior a 10€
            SELECT idReparacao FROM ReparacaoPeca
            WHERE idPeca IN (
                -- Peças com custo superior a 10€
                SELECT idPeca FROM Peca WHERE custoUnitario>10
            )
        )
    )
);

-- d.
-- Nomes dos clientes que não têm carro
SELECT nome FROM Cliente
WHERE idCliente NOT IN (
    -- Clientes que têm carro
    SELECT idCliente FROM Carro
);

-- e.
SELECT Carro.idCarro, COUNT(Reparacao.idCarro) AS numReparacoes
FROM Carro LEFT JOIN Reparacao ON Carro.idCarro=Reparacao.idCarro
GROUP BY Carro.idCarro;

-- f.
SELECT Carro.idCarro, IFNULL(SUM(julianday(dataFim)-julianday(dataInicio)+1), 0) AS tempoReparacoes
FROM Carro LEFT JOIN Reparacao ON Carro.idCarro=Reparacao.idCarro
GROUP BY Carro.idCarro;

-- g.
SELECT AVG(custoUnitario), SUM(custoUnitario), COUNT(*), MAX(custoUnitario), MIN(custoUnitario)
FROM Peca;

-- h.
SELECT nomeMarca, nomeEspecialidade FROM (
    -- Contagem de marca e especialidade
    SELECT Marca.idMarca, Marca.nome as nomeMarca, Especialidade.idEspecialidade, Especialidade.nome as nomeEspecialidade, COUNT(*) AS numReparacoes
    FROM Marca, Modelo, Carro, Reparacao, FuncionarioReparacao, Funcionario, Especialidade 
    WHERE Marca.idMarca=Modelo.idMarca
    AND Modelo.idModelo=Carro.idModelo
    AND Reparacao.idReparacao=FuncionarioReparacao.idReparacao
    AND FuncionarioReparacao.idFuncionario=Funcionario.idFuncionario
    AND Carro.idCarro=Reparacao.idCarro
    AND Funcionario.idEspecialidade=Especialidade.idEspecialidade
    GROUP BY Marca.idMarca, Especialidade.idEspecialidade
)
GROUP BY idMarca
HAVING MAX(numReparacoes)=numReparacoes;

-- i.
SELECT idReparacao, custoFuncionario+custoPeca AS custo FROM (
    -- Custo de cada reparação em termos de funcionários
    SELECT Reparacao.idReparacao, IFNULL(custoFuncionario, 0) AS custoFuncionario FROM Reparacao LEFT JOIN (
        SELECT idReparacao, SUM(numHoras*custoHorario) AS custoFuncionario FROM FuncionarioReparacao, Funcionario, Especialidade
        WHERE FuncionarioReparacao.idFuncionario=Funcionario.idFuncionario
        AND Funcionario.idEspecialidade=Especialidade.idEspecialidade
        GROUP BY idReparacao
    ) AS T1 ON Reparacao.idReparacao=T1.idReparacao
) NATURAL JOIN (
    -- Custo de cada reparação em termos de peças
    SELECT Reparacao.idReparacao, IFNULL(custoPeca, 0) AS custoPeca FROM Reparacao LEFT JOIN (
        SELECT idReparacao, SUM(ReparacaoPeca.quantidade*custoUnitario) AS custoPeca FROM ReparacaoPeca, Peca
        WHERE ReparacaoPeca.idPeca=Peca.idPeca
        GROUP BY idReparacao
    ) AS T1 ON Reparacao.idReparacao=T1.idReparacao
);

-- j.
SELECT SUM(custo) FROM (
    SELECT idReparacao, custoFuncionario+custoPeca AS custo FROM (
        -- Custo de cada reparação em termos de funcionários
        SELECT Reparacao.idReparacao, IFNULL(custoFuncionario, 0) AS custoFuncionario FROM Reparacao LEFT JOIN (
            SELECT idReparacao, SUM(numHoras*custoHorario) AS custoFuncionario FROM FuncionarioReparacao, Funcionario, Especialidade
            WHERE FuncionarioReparacao.idFuncionario=Funcionario.idFuncionario
            AND Funcionario.idEspecialidade=Especialidade.idEspecialidade
            GROUP BY idReparacao
        ) AS T1 ON Reparacao.idReparacao=T1.idReparacao
    ) NATURAL JOIN (
        -- Custo de cada reparação em termos de peças
        SELECT Reparacao.idReparacao, IFNULL(custoPeca, 0) AS custoPeca FROM Reparacao LEFT JOIN (
            SELECT idReparacao, SUM(ReparacaoPeca.quantidade*custoUnitario) AS custoPeca FROM ReparacaoPeca, Peca
            WHERE ReparacaoPeca.idPeca=Peca.idPeca
            GROUP BY idReparacao
        ) AS T1 ON Reparacao.idReparacao=T1.idReparacao
    )
) WHERE custo > 60;

-- k.
-- Cliente proprietário do carro com a reparação mais cara
SELECT idCliente, Cliente.nome FROM Cliente NATURAL JOIN Carro NATURAL JOIN Reparacao NATURAL JOIN (
    -- Reparação mais cara
    SELECT idReparacao, custoFuncionario+custoPeca AS custo FROM (
        -- Custo de cada reparação em termos de funcionários
        SELECT Reparacao.idReparacao, IFNULL(custoFuncionario, 0) AS custoFuncionario FROM Reparacao LEFT JOIN (
            SELECT idReparacao, SUM(numHoras*custoHorario) AS custoFuncionario FROM FuncionarioReparacao, Funcionario, Especialidade
            WHERE FuncionarioReparacao.idFuncionario=Funcionario.idFuncionario
            AND Funcionario.idEspecialidade=Especialidade.idEspecialidade
            GROUP BY idReparacao
        ) AS T1 ON Reparacao.idReparacao=T1.idReparacao
    ) NATURAL JOIN (
        -- Custo de cada reparação em termos de peças
        SELECT Reparacao.idReparacao, IFNULL(custoPeca, 0) AS custoPeca FROM Reparacao LEFT JOIN (
            SELECT idReparacao, SUM(ReparacaoPeca.quantidade*custoUnitario) AS custoPeca FROM ReparacaoPeca, Peca
            WHERE ReparacaoPeca.idPeca=Peca.idPeca
            GROUP BY idReparacao
        ) AS T1 ON Reparacao.idReparacao=T1.idReparacao
    ) ORDER BY custo DESC LIMIT 1
);

-- l.
-- Matrícula do carro com a 2ª reparação mais cara
SELECT Matricula FROM Carro NATURAL JOIN Reparacao NATURAL JOIN (
    -- 2ª reparação mais cara
    SELECT idReparacao, custoFuncionario+custoPeca AS custo FROM (
        -- Custo de cada reparação em termos de funcionários
        SELECT Reparacao.idReparacao, IFNULL(custoFuncionario, 0) AS custoFuncionario FROM Reparacao LEFT JOIN (
            SELECT idReparacao, SUM(numHoras*custoHorario) AS custoFuncionario FROM FuncionarioReparacao, Funcionario, Especialidade
            WHERE FuncionarioReparacao.idFuncionario=Funcionario.idFuncionario
            AND Funcionario.idEspecialidade=Especialidade.idEspecialidade
            GROUP BY idReparacao
        ) AS T1 ON Reparacao.idReparacao=T1.idReparacao
    ) NATURAL JOIN (
        -- Custo de cada reparação em termos de peças
        SELECT Reparacao.idReparacao, IFNULL(custoPeca, 0) AS custoPeca FROM Reparacao LEFT JOIN (
            SELECT idReparacao, SUM(ReparacaoPeca.quantidade*custoUnitario) AS custoPeca FROM ReparacaoPeca, Peca
            WHERE ReparacaoPeca.idPeca=Peca.idPeca
            GROUP BY idReparacao
        ) AS T1 ON Reparacao.idReparacao=T1.idReparacao
    ) ORDER BY custo DESC LIMIT 1 OFFSET 1
);

-- m.
SELECT idReparacao, custoFuncionario+custoPeca AS custo FROM (
    -- Custo de cada reparação em termos de funcionários
    SELECT Reparacao.idReparacao, IFNULL(custoFuncionario, 0) AS custoFuncionario FROM Reparacao LEFT JOIN (
        SELECT idReparacao, SUM(numHoras*custoHorario) AS custoFuncionario FROM FuncionarioReparacao, Funcionario, Especialidade
        WHERE FuncionarioReparacao.idFuncionario=Funcionario.idFuncionario
        AND Funcionario.idEspecialidade=Especialidade.idEspecialidade
        GROUP BY idReparacao
    ) AS T1 ON Reparacao.idReparacao=T1.idReparacao
) NATURAL JOIN (
    -- Custo de cada reparação em termos de peças
    SELECT Reparacao.idReparacao, IFNULL(custoPeca, 0) AS custoPeca FROM Reparacao LEFT JOIN (
        SELECT idReparacao, SUM(ReparacaoPeca.quantidade*custoUnitario) AS custoPeca FROM ReparacaoPeca, Peca
        WHERE ReparacaoPeca.idPeca=Peca.idPeca
        GROUP BY idReparacao
    ) AS T1 ON Reparacao.idReparacao=T1.idReparacao
) ORDER BY custo DESC LIMIT 3;

-- n.
-- ??

-- o.
SELECT localidade FROM CodPostal
WHERE codPostal1 IN (SELECT codPostal1 FROM Cliente)
OR codPostal1 IN (SELECT codPostal1 FROM Funcionario);

-- p.
SELECT localidade FROM CodPostal
WHERE codPostal1 IN (SELECT codPostal1 FROM Cliente)
AND codPostal1 IN (SELECT codPostal1 FROM Funcionario);
