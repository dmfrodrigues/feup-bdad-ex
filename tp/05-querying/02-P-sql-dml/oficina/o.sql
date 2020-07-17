SELECT localidade FROM CodPostal
WHERE codPostal1 IN (SELECT codPostal1 FROM Cliente)
OR codPostal1 IN (SELECT codPostal1 FROM Funcionario);