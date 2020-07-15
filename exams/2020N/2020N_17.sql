-- Admins que não têm posts com cooking nas datas
SELECT nick AS admin_nickname FROM Users
WHERE isAdmin=1
AND idUser NOT IN (
    -- Utilizadores com posts com tag de cooking nas datas
    SELECT author FROM POsts
    WHERE idPost IN (
        -- Posts publicados nas tais datas
        -- e com tag de cooking
        SELECT PostsTags.idPost FROM Posts, PostsTags
        WHERE PostsTags.idPost=Posts.idPost
        AND date("2019-08-29") <= date(datePublished)
        AND julianday(datePublished) <= julianday(date("2019-08-29"))+15
        AND idTag IN (
            -- Tag de cooking
            SELECT idTag FROM Tags
            WHERE tagText LIKE "cooking"
        )
    )
)
ORDER BY admin_nickname DESC;
