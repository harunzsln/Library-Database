create table ho_authors (
    author_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    birth_year int
);

create table ho_books (
  book_id serial primary key,
    title varchar(255) not null,
    author_id int references ho_authors(author_id),
    genre varchar(50),
    publish_year int,
    isbn varchar(13)
);

create table ho_members (
    member_id serial primary key,
    member_name varchar(25) not null,
    member_surname varchar(25) not null,
    email varchar(100),
    phone_number varchar(15)
);

create table ho_loans(
  loan_id serial primary key,
  book_id int references ho_books(book_id),
  member_id int references ho_members(member_id),
  loan_date date not null,
  return_date date
);