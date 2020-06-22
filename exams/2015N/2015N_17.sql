-- Legendas dessas fotos
SELECT caption FROM Photo
WHERE id IN
(
    -- Fotos onde aparecem as tais pessoas
    SELECT photo FROM AppearsIn
    WHERE user IN
    ( -- Daniel, amigos do Daniel e amigos dos amigos do Daniel
        -- Daniel
        SELECT id FROM User WHERE name LIKE "Daniel Ramos"
        UNION
        -- Amigos do Daniel
        SELECT user2 as id FROM Friend WHERE user1 IN (
            -- Daniel
            SELECT id FROM User WHERE name LIKE "Daniel Ramos"
        )
        UNION
        -- Amigos dos amigos do Daniel
        SELECT user2 as id FROM Friend WHERE user1 IN (
            -- Amigos do Daniel
            SELECT user2 as id FROM Friend WHERE user1 IN (
                -- Daniel
                SELECT id FROM User WHERE name LIKE "Daniel Ramos"
            )
        )
    )
);
