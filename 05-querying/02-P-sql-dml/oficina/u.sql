SELECT idReparacao
FROM Especialidade
INNER JOIN Funcionario ON Especialidade.idEspecialidade=Funcionario.idEspecialidade
NATURAL JOIN FuncionarioReparacao
GROUP BY idReparacao
HAVING COUNT(*)=(SELECT COUNT(*) FROM Especialidade);