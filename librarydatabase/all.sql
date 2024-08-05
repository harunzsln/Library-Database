create table ho_authors (
    author_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    birth_year int
);

INSERT INTO ho_authors (first_name, last_name, birth_year) VALUES
('Ernest', 'Hemingway', 1899),
('Jane', 'Austen', 1775),
('Mark', 'Twain', 1835),
('Virginia', 'Woolf', 1882);

insert into ho_authors(first_name, last_name) values (
'Fyodor', 'Dostoyevski');

select * from ho_authors;

update ho_authors set birth_year = 1821 where author_id = 5;

INSERT INTO ho_authors (first_name, last_name, birth_year) VALUES
('George', 'Orwell', 1903);

select *
from ho_authors where first_name not like'%a%';

select *
from ho_authors where last_name like'%a%';

ALTER TABLE ho_loans
ADD CONSTRAINT fk_member
FOREIGN KEY (member_id) REFERENCES ho_members(member_id);


create table ho_books (
  book_id serial primary key,
    title varchar(255) not null,
    author_id int references ho_authors(author_id),
    genre varchar(50),
    publish_year int,
    isbn varchar(13)
);

INSERT INTO ho_books (title, author_id, genre, publish_year, isbn)
VALUES
('Animal Farm', 6, 'Political Satire', 1945, '9780451526342'),
('Homage to Catalonia', 6, 'Non-fiction', 1938, '9780156421171'),
('The Old Man and the Sea', 1, 'Fiction', 1952, '9780684801223'),
('A Farewell to Arms', 1, 'Fiction', 1929, '9780684801469'),
('Pride and Prejudice', 2, 'Romance', 1813, '9780679783268'),
('Sense and Sensibility', 2, 'Romance', 1811, '9780141439662'),
('Adventures of Huckleberry Finn', 3, 'Adventure', 1884, '9780486280615'),
('The Adventures of Tom Sawyer', 3, 'Adventure', 1876, '9780486400778'),
('Mrs Dalloway', 4, 'Fiction', 1925, '9780156628709'),
('To the Lighthouse', 4, 'Fiction', 1927, '9780156907392'),
('Crime and Punishment',5, 'Fiction', 1866, '9780140449136'),
('The Brothers Karamazov',5,'Fiction', 1880, '9780140449242');


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


SELECT
    ho_authors.first_name || ' ' || ho_authors.last_name AS author_name,
    genre,
    COUNT(book_id) AS number_of_books
FROM
    ho_books
    JOIN ho_authors ON ho_books.author_id = ho_authors.author_id
GROUP BY
    first_name,
    last_name,
    genre
;

select *
from ho_books join ho_authors on ho_books.author_id = ho_authors.author_id;

select ho_books.title,ho_authors.first_name || ' ' || ho_authors.last_name AS author_name,
    genre
from ho_authors join ho_books on ho_authors.author_id = ho_books.author_id;

select *
from ho_books where publish_year>1900 and genre = 'Fiction' order by title desc;


create table ho_members (
    member_id serial primary key,
    member_name varchar(25) not null,
    member_surname varchar(25) not null,
    email varchar(100),
    phone_number varchar(15)
);

INSERT INTO ho_members (member_name, member_surname, email, phone_number) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '555-1234'),
('Bob', 'Smith', 'bob.smith@example.com', '555-5678'),
('Charlie', 'Brown', 'charlie.brown@example.com', '555-8765'),
('Diana', 'Prince', 'diana.prince@example.com', '555-4321'),
('Eve', 'Davis', 'eve.davis@example.com', '555-9876');

INSERT INTO ho_members (member_name, member_surname, email, phone_number) VALUES
('John', 'Doe', 'john.doe@example.com', '123456789'),
('Jane', 'Smith', 'jane.smith@example.com', '987654321');

select * from ho_members where member_id=3;


create table ho_loans(
  loan_id serial primary key,
  book_id int references ho_books(book_id),
  member_id int references ho_members(member_id),
  loan_date date not null,
  return_date date
);
INSERT INTO ho_loans (book_id, member_id, loan_date, return_date)
VALUES (3, 3, '2024-07-10', '2024-07-25'),
       (4, 4, '2024-07-12', '2024-07-26'),
       (5, 5, '2024-07-14', '2024-07-28'),
       (6, 1, '2024-07-15', '2024-07-29'),
       (7, 2, '2024-07-18', '2024-08-01'),
       (8, 3, '2024-07-20', '2024-08-03'),
       (9, 4, '2024-07-22', '2024-08-05'),
       (10, 5, '2024-07-25', '2024-08-08');

insert into ho_loans (book_id, member_id, loan_date, return_date)
VALUES ( 2, 4, '2024-08-01', '2024-08-15'),
       (1, 3, '2024-07-27', '2024-08-10');

select *
from ho_loans;

SELECT ho_books.title, ho_members.member_name, ho_members.member_surname, ho_loans.loan_date, ho_loans.return_date
FROM ho_loans
JOIN ho_books ON ho_loans.book_id = ho_books.book_id
JOIN ho_members ON ho_loans.member_id = ho_members.member_id;

select ho_books.title, ho_loans.loan_date, ho_loans.return_date
from ho_loans inner join ho_books ON ho_loans.book_id = ho_books.book_id;

SELECT genre, COUNT(*) AS total_books
FROM ho_books
GROUP BY genre;

SELECT
    member_name || '' || member_surname AS full_name,
    'Member' AS role
FROM
    ho_members

UNION

SELECT
    first_name || ' ' || last_name AS full_name,
    'Author' AS role
FROM
    ho_authors;



SELECT
    member_name || ' ' || member_surname AS name,
    (SELECT COUNT(*)
     FROM ho_loans
     WHERE member_id = ho_members.member_id) AS loan_count
FROM
    ho_members
WHERE
    member_id = (SELECT member_id
                 FROM ho_loans
                 GROUP BY member_id
                 ORDER BY COUNT(*) DESC
                 LIMIT 1);



SELECT ho_books.title, member_name || ' ' || member_surname AS name, ho_loans.loan_date, ho_loans.return_date
FROM ho_loans
JOIN ho_books ON ho_loans.book_id = ho_books.book_id
JOIN ho_members ON ho_loans.member_id = ho_members.member_id;

SELECT title FROM ho_books
INTERSECT
SELECT title FROM ho_loans JOIN ho_books ON ho_loans.book_id = ho_books.book_id;

SELECT title FROM ho_books
EXCEPT
SELECT title FROM ho_loans JOIN ho_books ON ho_loans.book_id = ho_books.book_id;


SELECT title FROM ho_books WHERE genre = 'Fiction'
UNION
SELECT title FROM ho_books WHERE genre = 'Non-Fiction';
