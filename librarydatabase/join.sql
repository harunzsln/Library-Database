SELECT ho_books.title, ho_members.member_name, ho_members.member_surname, ho_loans.loan_date, ho_loans.return_date
FROM ho_loans
JOIN ho_books ON ho_loans.book_id = ho_books.book_id
JOIN ho_members ON ho_loans.member_id = ho_members.member_id;

select ho_books.title, ho_loans.loan_date, ho_loans.return_date
from ho_loans inner join ho_books ON ho_loans.book_id = ho_books.book_id;

SELECT ho_books.title, member_name || ' ' || member_surname AS name, ho_loans.loan_date, ho_loans.return_date
FROM ho_loans
JOIN ho_books ON ho_loans.book_id = ho_books.book_id
JOIN ho_members ON ho_loans.member_id = ho_members.member_id;

select ho_books.title,ho_authors.first_name || ' ' || ho_authors.last_name AS author_name,
    genre
from ho_authors join ho_books on ho_authors.author_id = ho_books.author_id;
