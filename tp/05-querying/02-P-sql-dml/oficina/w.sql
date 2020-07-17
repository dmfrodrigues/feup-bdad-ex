SELECT idMarca, 
    CASE nome
        WHEN 'Renault' THEN 'Top'
        WHEN 'Volvo' THEN 'Down'
        ELSE 'NoWay'
    END AS nome
FROM Marca;