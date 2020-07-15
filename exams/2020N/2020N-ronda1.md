## Pergunta 1

Uma florista pretende implementar um sistema de informação que guarde as flores e os acessórios que usa em arranjos florais.

Selecionar UML adequado.
(Não era a opção com quantidade a sair da composição. Era a opção com uma generalização disjoint, complete com o atributo da cor como subclasse de "part")

## Pergunta 2

Um presidente, diversos jogadores. Um dos jogadores podia ser capitão da equipa. Os jogadores e o presidente são pessoas (generalização disjoint, complete).

Selecionar mapeamento para modelo relacional.

## Pergunta 3

Cinemas, salas, e qqr coisa mais. Selecionar texto mais correto para o UML.

## Pergunta 4

Árvore genealogica, resposta correta é duas relações para si mesmo, uma para pai e outra para mãe

## Pergunta 5

Relação 1 --- 0..1, meti chave externa do lado 1 em vez do lado 0..1. Se metesse do lado 0..1 evitava NULLs.

## Pergunta 6

## Pergunta 7

Que características é que as dependências funcionais têm que ter para estar na base mínima?

- As dependências funcionais só podem ter um atributo do lado direito ✖
- Se B é uma base mínima de uma relação, não pode haver outra base mínima ✖
- Se removêssemos 1 FD deixaria de ser base mínima. ✔

## Pergunta 8

Temos uma tabela e um conjunto de dependências funcionais, é para dizer em que forma normal é que está.

- Na 1ª FN e não na 2ª ✔
- Na 2ª FN e não na 3ª ✖
- Na 3ª FN e não na BCNF ✖
- Na BCNF ✖

## Pergunta 9

Script de criação de base de dados e preenchimento com dados, perguntava o que acontecia (funcionava, erro aqui, erro alí, ...)

## Pergunta 10

Álgebra relacional: dada uma árvore de query, interpretar o que é que se estava a perguntar à base de dados.

## Pergunta 11

Sobre vistas atualizáveis (ver bibliografia)

## Pergunta 12

Sobre gatilhos.
3 drop-downs para escolher a opção correta (?). No 1º tinha a opção correta era AFTER INSERT ou só AFTER (?).

## Pergunta 13

Pergunta sobre os índices. Para determinar número de acessos ao disco.

Em média, um autor escreve 3 livros e um livro é escrito por 3 autores

1ª situação: não há nenhum índice

2ª situação: com índice num (4 acessos, 1 ao índice e 3 à tabela)

3ª situação: com índice noutro (4 acessos, 1 ao índice e 3 à tabela)

## Pergunta 14

Níveis de isolamento (julgo que é para determinar nível de isolamento para que a leitura no início e no final de uma transação seja o mesmo):

- Serializable ✔
- Repeatable Read ✖

Em Repeatable Read há algumas transações que podem decorrer em paralelo que podem provocar alterações nestas listas.

## Pergunta 15

Comparando bases de dados SQL com bases de dados relacionais, as bases de dados relacionais são melhores em:

- Escalabilidade ✔
- Capacidade de gerir grandes quantidades de dados ✔
- Facilidade em criar e operacionalizar ✔
- ✖

## Informação

Temos um blog, que representa a informação sobre os seus utilizadores, posts, comentários e tags associadas a esses posts. Nesse sistema alguns utilizadores são administradores do blog.

Tabelas:

- Posts(<ins>idPost</ins>, datePublished, author→Users, numViews)
- Comments(<ins>idComment</ins>, idPost→Posts, idUser→Users)
- Tags(<ins>idTag</ins>, text)
- PostTag(<ins>idPost</ins>→Post, <ins>idTag</ins>→Tag)
- Users(<ins>idUser</ins>, nick)

## Pergunta 16

Apresente uma lista de posts, ordenada por ordem decrescente de número de comentários associados a cada post (em caso de empate, por ordem alfabética do título do post).

Minha resposta:

```sql
SELECT Posts.title AS post_title, COUNT(*) AS num_comments
FROM Posts, Comments
WHERE Posts.idPost=Comments.idPost
GROUP BY post_title
ORDER BY num_comments DESC, post_title ASC;
```

Resposta correta:

```sql
SELECT Posts.title AS post_title, COUNT(*) AS num_comments
FROM Posts, Comments
WHERE Posts.idPost=Comments.idPost
GROUP BY post_title
ORDER BY num_comments DESC, Posts.idPost ASC;
```

## Pergunta 17

Quem são os administradores do blog que não publicaram nenhum post com a tag 'cooking' entre o dia 29 de agosto de 2019 (inclusive) e os 15 dias seguintes inclusive. Ordene por ordem alfabética inversa da alcunha do administrador.

Minha resposta:

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
        AND date("2019-08-29") <= datePublished
        AND julianday(datePublished) <= julianday(date("2019-08-29"))+15
        AND idTag IN (
            -- Tag de cooking
            SELECT idTag FROM Tags
            WHERE tagText LIKE "cooking"
        )
        ORDER BY datePublished
    )
);
```

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
Número de comentários por post agrupando por id do post, calcular a média, contar o nº de comentários de post e selecionar os que estavam acima da média.

## Pergunta 19

Para cada administrador mostrar o 1º, 2º e 3º posts mais vistos. Se não houver posts que chegue para mostrar também não se mostra. Se houver dois posts empatados em 1º mostra-se esses dois em primeiro (i.e., se houver 3 posts com 10, 3 posts com 5 e 3 posts com 3, mostra-se em 1º 3 posts com 10, em 2º 3 posts com 5 e em 3º 3 posts com 3, totalizando 9).

Ir buscar os que têm maiores visualizações e dar-lhes posição 1, outra vez o mesmo raciocício não incluindo os anteriores e o mesmo para a 3ª vez.