SELECT almost_final.auth_id AS "AUTHOR ID",
almost_final.au_lname AS "LAST NAME",
almost_final.au_fname AS "FIRST NAME",
almost_final.title AS "TITLE"
FROM
(SELECT * FROM
(SELECT title_id, title, pub_id AS publ_id
FROM book_pub.titles
INNER JOIN
(SELECT * FROM book_pub.authors
INNER JOIN
(SELECT titleauthor.au_id AS auth_id, titleauthor.title_id AS tit_id
FROM titleauthor)
AS ta_join
ON authors.au_id = ta_join.auth_id) AS mini_authors)
ON titles.title_id = mini_authors.tit_id) AS almost_final);
/*INNER JOIN publishers
ON nearly_final.publ_id = publishers.pub_id) AS almost_final;*/