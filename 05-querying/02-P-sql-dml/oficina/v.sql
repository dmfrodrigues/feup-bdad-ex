SELECT idReparacao, julianday(dataFimAgora)-julianday(dataInicio)+1 AS duracao
FROM (
    SELECT idReparacao, dataInicio, MIN(dataFim, date("2010-09-17")) AS dataFimAgora FROM Reparacao
    WHERE dataInicio <= dataFimAgora
);
SELECT idReparacao, julianday(dataFimAgora)-julianday(dataInicio)+1 AS duracao
FROM (
    SELECT idReparacao, dataInicio, MIN(dataFim, date("now")) AS dataFimAgora FROM Reparacao
    WHERE dataInicio <= dataFimAgora
);