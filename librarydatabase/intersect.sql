SELECT title FROM ho_books
INTERSECT
SELECT title FROM ho_loans JOIN ho_books ON ho_loans.book_id = ho_books.book_id;
