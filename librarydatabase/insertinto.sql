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

INSERT INTO ho_authors (first_name, last_name, birth_year) VALUES
('Ernest', 'Hemingway', 1899),
('Jane', 'Austen', 1775),
('Mark', 'Twain', 1835),
('Virginia', 'Woolf', 1882);

insert into ho_authors(first_name, last_name) values (
'Fyodor', 'Dostoyevski');

INSERT INTO ho_authors (first_name, last_name, birth_year) VALUES
('George', 'Orwell', 1903);

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


INSERT INTO ho_members (member_name, member_surname, email, phone_number) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '555-1234'),
('Bob', 'Smith', 'bob.smith@example.com', '555-5678'),
('Charlie', 'Brown', 'charlie.brown@example.com', '555-8765'),
('Diana', 'Prince', 'diana.prince@example.com', '555-4321'),
('Eve', 'Davis', 'eve.davis@example.com', '555-9876');

INSERT INTO ho_members (member_name, member_surname, email, phone_number) VALUES
('John', 'Doe', 'john.doe@example.com', '123456789'),
('Jane', 'Smith', 'jane.smith@example.com', '987654321');
