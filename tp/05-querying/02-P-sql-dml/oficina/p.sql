SELECT localidade FROM CodPostal
WHERE codPostal1 IN (SELECT codPostal1 FROM Cliente)
AND codPostal1 IN (SELECT codPostal1 FROM Funcionario);
