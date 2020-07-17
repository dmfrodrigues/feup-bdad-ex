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