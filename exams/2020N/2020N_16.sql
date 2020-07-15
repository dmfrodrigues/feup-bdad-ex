SELECT Posts.title AS post_title, COUNT(*) AS num_comments
FROM Posts, Comments
WHERE Posts.idPost=Comments.idPost
GROUP BY Posts.idPost
ORDER BY num_comments DESC, post_title ASC;
