-- Peças compatíveis com Volvo com preço superior a alguma peça compatível com Renault
SELECT idPeca
FROM Peca NATURAL JOIN PecaModelo NATURAL JOIN Modelo INNER JOIN Marca ON Modelo.idMarca=Marca.idMarca
WHERE Marca.nome LIKE "Volvo"
AND custoUnitario > (
    -- Preço mínimo das peças compatíveis com Renault
    SELECT MAX(custoUnitario) AS maxRenault
    FROM Peca NATURAL JOIN PecaModelo NATURAL JOIN Modelo INNER JOIN Marca ON Modelo.idMarca=Marca.idMarca
    WHERE Marca.nome LIKE "Renault"
);