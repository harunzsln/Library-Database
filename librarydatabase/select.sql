select * from ho_authors;

select *
from ho_authors where first_name not like'%a%';

select *
from ho_authors where last_name like'%a%';

SELECT
    genre,
    COUNT(*) AS number_of_books
FROM
    ho_books
GROUP BY
    genre
ORDER BY
    number_of_books DESC;


SELECT
    title,
    (SELECT first_name || ' ' || last_name FROM ho_authors WHERE author_id = ho_books.author_id) AS author,
    publish_year
FROM
    ho_books
WHERE
    genre = 'Fiction'
ORDER BY
    publish_year;


select *
from ho_books where publish_year>1900 and genre = 'Fiction' order by title desc;

select *
from ho_loans;