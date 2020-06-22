.read photos.sql

SELECT * FROM Photo;

DELETE FROM Photo
WHERE id IN (
    -- Fotos com menos de 2 aparicoes
    SELECT id FROM Photo
    WHERE id NOT IN (
        -- Fotos com 2 ou mais aparicoes
        SELECT photo FROM AppearsIn GROUP BY photo HAVING COUNT(*) >= 2
    )
)
AND uploadDate < date("2010-01-01");

SELECT * FROM Photo;
