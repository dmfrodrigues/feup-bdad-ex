<!-- (C) 2020 Diogo Rodrigues, João António Sousa -->
<!-- Licensed under the terms of the GNU General Public License v3 -->

## Pergunta 1

Uma florista pretende implementar um sistema de informação que guarde os tipos de flores e os acessórios que usa em arranjos florais.

Também pretende guardar a quantidade de cada tipo de flor ou acessório utilizado em cada arranjo.

Para os acessórios é necessário guardar a sua cor (logo não é preciso guardar a cor para mais nada, apenas para os acessórios).

Selecionar UML adequado.

1. ![](2020N_01a.svg) ✖
2. ![](2020N_01b.svg) ✔

## Pergunta 2

Considere o seguinte modelo concetual em UML.

![](2020N_02.svg)

Um presidente, diversos jogadores. Um dos jogadores podia ser capitão da equipa. Os jogadores e o presidente são pessoas (generalização disjoint, complete).

Selecionar mapeamento para modelo relacional:

1. `Player(idPlayer->Person, preferred_jersey_number, team->Team) NOT NULL(team)` ✖

## Pergunta 3

Cinemas, salas, e qualquer coisa mais. Selecionar texto mais correto para o UML.

## Pergunta 4

Qual o melhor UML para representar uma árvore genealógica?

- ![](2020N_04.svg) ✔

## Pergunta 5

Relação 1 --- 0..1;

- Tinha que colocar a chave externa do lado 0..1 para evitar NULLs.

## Pergunta 6

Que propriedades têm as chaves candidatas?

1. ✔
2. ✔
3. Qualquer relação pode ter várias chaves candidatas. ✔
4. ✖

## Pergunta 7

Que características é que um conjunto de dependências funcionais tem que ter para estar na base mínima?

- As dependências funcionais só podem ter um atributo do lado direito ✖
- Se B é uma base mínima de uma relação, não pode haver outra base mínima ✖
- Se removêssemos uma dependência funciona, deixaria de ser base mínima. ✔

## Pergunta 8

Dada uma tabela e um conjunto de dependências funcionais, em que forma normal é que se encontra a relação?

- Na 1ª FN e não na 2ª ✔
- Na 2ª FN e não na 3ª ✖
- Na 3ª FN e não na BCNF ✖
- Na BCNF ✖

## Pergunta 9

Script de criação de base de dados e preenchimento com dados, perguntava o que acontecia (funcionava, erro aqui, erro alí, ...). Era só copiar para um ficheiro, correr no SQLite e ver o que dava.

## Pergunta 10

Álgebra relacional: dada uma árvore de query, interpretar o que é que se estava a perguntar à base de dados.

## Pergunta 11

Dadas 4 vistas, perguntava-se quais é que eram atualizáveis de acordo com o standard de SQL.

1. Uma vista que mostra as editoras que publicaram livros (acho eu). Se eu introduzir uma editora, que livro é que essa editora publicou? Não sei...

**Nota:** Uma vista só é atualizável de acordo com o standard quando não existem quaisquer ambiguidades sobre as operações que é necessário realizar nas tabelas de base.

## Pergunta 12

É-nos dado um gatilho relacionado com inserção, com três partes incompletas que devem ser completadas.

- Uma delas perguntava quando é que o gatilho é corrido. A resposta correta é: `AFTER INSERT`.

## Pergunta 13

Pergunta sobre os índices. Para determinar número de acessos ao disco.

Em média, um autor escreve 3 livros e um livro é escrito por 3 autores. Praticamente igual ao exemplo 8.14 (p.355) do livro *A First Course in Database Systems* (3rd ed., Ullman & Widom)

- 1ª situação: não há nenhum índice
- 2ª situação: com índice num (4 acessos, 1 ao índice e 3 à tabela)
- 3ª situação: com índice noutro (4 acessos, 1 ao índice e 3 à tabela)

## Pergunta 14

São feitas leituras de uma base de dados hora-a-hora na mesma transação. Que nível de isolamento necessito para garantir que leituras de dados no início e final da transação dêem o mesmo resultado?

- Serializable ✔
- Repeatable Read ✖
- Read Commited ✖
- Read Uncommited ✖

Em Repeatable Read há algumas transações que podem decorrer em paralelo que podem provocar alterações nestas listas. Isto porque Repeatable Read diz que um tuplo lido várias vezes não pode mudar, mas uma relação *pode* ver novos tuplos (tuplos-fantasma) numa relação lida várias vezes.

## Pergunta 15

Comparando bases de dados SQL com bases de dados relacionais, as bases de dados relacionais são melhores em:

- Escalabilidade ✔
- Capacidade de gerir grandes quantidades de dados ✔
- Facilidade em criar e operacionalizar ✔
- ✖

## Informação

Temos um blog, que representa a informação sobre os seus utilizadores, posts, comentários e tags associadas a esses posts. Nesse sistema alguns utilizadores são administradores do blog.

Tabelas:

- Posts(<ins>idPost</ins>, datePublished, author→Users, views, text, title)
- Comments(<ins>idComment</ins>, idPost→Posts, idUser→Users, datePosted, commentText)
- Tags(<ins>idTag</ins>, tagText)
- PostsTags(<ins>idPost</ins>→Posts, <ins>idTag</ins>→Tags)
- Users(<ins>idUser</ins>, nick, isAdmin)

## Pergunta 16

Apresente uma lista de posts, ordenada por ordem decrescente de número de comentários associados a cada post (em caso de empate, por ordem alfabética do título do post).

Resposta correta:

```sql
SELECT Posts.title AS post_title, COUNT(*) AS num_comments
FROM Posts, Comments
WHERE Posts.idPost=Comments.idPost
GROUP BY Posts.idPost
ORDER BY num_comments DESC, post_title ASC;
```

## Pergunta 17

Quem são os administradores do blog que não publicaram nenhum post com a tag 'cooking' entre o dia 29 de agosto de 2019 (inclusive) e os 15 dias seguintes inclusive. Ordene por ordem alfabética inversa da alcunha do administrador.

Resposta correta:

```sql
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
```

## Pergunta 18

Quais os posts que têm um número de comentários acima do número médio de comentários por post?

Resposta correta:

```sql
SELECT idPost FROM Comments
GROUP BY idPost
HAVING COUNT(*) > (
    SELECT AVG(numComments) FROM (
        -- Contagem de comentários
        SELECT idPost, COUNT(*) AS numComments FROM Comments
        GROUP BY idPost
    )
);
```

## Pergunta 19

Para cada administrador mostrar o 1º, 2º e 3º posts mais vistos. Se não houver posts que chegue para mostrar também não se mostra. Se houver dois posts empatados em 1º mostra-se esses dois em primeiro (i.e., se houver 3 posts com 10, 3 posts com 5 e 3 posts com 3, mostra-se em 1º 3 posts com 10, em 2º 3 posts com 5 e em 3º 3 posts com 3, totalizando 9).

Resposta correta:

```sql
SELECT *
FROM (
    SELECT *
    FROM (
        SELECT *
        FROM (
            -- Primeiros
            SELECT idUser, nick, idPost, views, 1 AS pos
            FROM Users INNER JOIN Posts ON Users.idUser=Posts.author
            WHERE (idUser, views) IN (
                -- Máximo de views por admin
                SELECT idUser, MAX(views) AS maxViews1
                FROM (
                    -- Todos os posts de admins
                    SELECT *
                    FROM Users INNER JOIN Posts ON Users.idUser=Posts.author
                    WHERE isAdmin=1
                )
                GROUP BY idUser
            )
        )
        UNION 
            -- Segundos
            SELECT idUser, nick, idPost, views, 2 AS pos
            FROM Users INNER JOIN Posts ON Users.idUser=Posts.author
            WHERE (idUser, views) IN (
                -- 2º máximo de views por admin
                SELECT idUser, MAX(views) AS maxViews1
                FROM (
                    -- Todos os posts com menos que o máximo
                    SELECT U.idUser, U.nick, U.isAdmin, P.idPost, P.datePublished, P.author, P.views, P.text
                    FROM Users AS U INNER JOIN Posts AS P ON U.idUser=P.author
                    INNER JOIN (
                        -- Máximo de views por admin
                        SELECT idUser, MAX(views) AS maxViews1
                        FROM (
                            -- Todos os posts de admins
                            SELECT *
                            FROM Users INNER JOIN Posts ON Users.idUser=Posts.author
                            WHERE isAdmin=1
                        )
                        GROUP BY idUser
                    )
                    AS T ON U.idUser=T.idUser
                    WHERE views < maxViews1
                )
                GROUP BY idUser
            )
    )
    UNION
        -- Terceiros
        SELECT idUser, nick, idPost, views, 3 AS pos
        FROM Users INNER JOIN Posts ON Users.idUser=Posts.author
        WHERE (idUser, views) IN (
            -- 3º máximo de views por admin
            SELECT idUser, MAX(views) AS maxViews1
            FROM (
                -- Todos os posts com menos que o 2º máximo
                SELECT U.idUser, U.nick, U.isAdmin, P.idPost, P.datePublished, P.author, P.views, P.text
                FROM Users AS U INNER JOIN Posts AS P ON U.idUser=P.author
                INNER JOIN (
                    -- 2º máximo de views por admin
                    SELECT idUser, MAX(views) AS maxViews1
                    FROM (
                        -- Todos os posts com menos que o máximo
                        SELECT U.idUser, U.nick, U.isAdmin, P.idPost, P.datePublished, P.author, P.views, P.text
                        FROM Users AS U INNER JOIN Posts AS P ON U.idUser=P.author
                        INNER JOIN (
                            -- Máximo de views por admin
                            SELECT idUser, MAX(views) AS maxViews1
                            FROM (
                                -- Todos os posts de admins
                                SELECT *
                                FROM Users INNER JOIN Posts ON Users.idUser=Posts.author
                                WHERE isAdmin=1
                            )
                            GROUP BY idUser
                        )
                        AS T ON U.idUser=T.idUser
                        WHERE views < maxViews1
                    )
                GROUP BY idUser
                )
                AS T ON U.idUser=T.idUser
                WHERE views < maxViews1
            )
            GROUP BY idUser
        )
)
ORDER BY idUser ASC, pos ASC;
```

Alternativa (dá o resultado correto, mas pode não ser considerado correto):

```sql
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
ORDER BY idUser ASC, pos ASC;
```
