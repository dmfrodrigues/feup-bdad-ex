DROP VIEW IF EXISTS MaxUserView1;
DROP VIEW IF EXISTS MaxUserView2;
DROP VIEW IF EXISTS MaxUserView3;

-- Máximo de views por admin
CREATE VIEW MaxUserView1 AS
SELECT idUser, MAX(views) AS maxViews1
FROM (
    -- Todos os posts de admins
    SELECT *
    FROM Users INNER JOIN Posts ON Users.idUser=Posts.author
    WHERE isAdmin=1
)
GROUP BY idUser;

-- 2º máximo de views por admin
CREATE VIEW MaxUserView2 AS
SELECT idUser, MAX(views) AS maxViews1
FROM (
    -- Todos os posts com menos que o máximo
    SELECT U.idUser, U.nick, U.isAdmin, P.idPost, P.datePublished, P.author, P.views, P.text
    FROM Users AS U INNER JOIN Posts AS P ON U.idUser=P.author
    INNER JOIN MaxUserView1
    AS T ON U.idUser=T.idUser
    WHERE views < maxViews1
)
GROUP BY idUser;

-- 3º máximo de views por admin
CREATE VIEW MaxUserView3 AS
SELECT idUser, MAX(views) AS maxViews1
FROM (
    -- Todos os posts com menos que o 2º máximo
    SELECT U.idUser, U.nick, U.isAdmin, P.idPost, P.datePublished, P.author, P.views, P.text
    FROM Users AS U INNER JOIN Posts AS P ON U.idUser=P.author
    INNER JOIN MaxUserView2
    AS T ON U.idUser=T.idUser
    WHERE views < maxViews1
)
GROUP BY idUser;

SELECT *
FROM (
    SELECT *
    FROM (
        SELECT *
        FROM (
            -- Primeiros
            SELECT idUser, nick, idPost, views, 1 AS pos
            FROM Users INNER JOIN Posts ON Users.idUser=Posts.author
            WHERE (idUser, views) IN MaxUserView1
        )
        UNION 
            -- Segundos
            SELECT idUser, nick, idPost, views, 2 AS pos
            FROM Users INNER JOIN Posts ON Users.idUser=Posts.author
            WHERE (idUser, views) IN MaxUserView2
    )
    UNION
        -- Terceiros
        SELECT idUser, nick, idPost, views, 3 AS pos
        FROM Users INNER JOIN Posts ON Users.idUser=Posts.author
        WHERE (idUser, views) IN MaxUserView3
)
ORDER BY idUser ASC, pos ASC
;
