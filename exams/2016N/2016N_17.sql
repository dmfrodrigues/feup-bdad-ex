-- Amigos de 3a ordem
SELECT DISTINCT ID2 AS ID FROM Amizade WHERE ID1 IN (
    -- Amigos de 2a ordem
    SELECT ID2 AS ID FROM Amizade WHERE ID1 IN (
        -- Amigos de 1a ordem
        SELECT ID2 AS ID FROM Amizade WHERE ID1 IN (
            -- O proprio
            SELECT ID FROM Estudante WHERE nome LIKE "Miguel Sampaio"
        )
    )
);
