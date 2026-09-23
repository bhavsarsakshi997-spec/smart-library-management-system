--1 TABLE
CREATE TABLE Authors (
author_id INT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(50)
);

SELECT *FROM Authors;

--2 table
CREATE TABLE Books (
book_id INT PRIMARY KEY ,
title VARCHAR(50),
author_id INT,
category VARCHAR(50),
isbn VARCHAR(50),
published_date DATE,
price DECIMAL (10, 2),
available_copies INT,
FOREIGN KEY (author_id) REFERENCES Authors(author_id)

);

SELECT *FROM Books

--3 table
CREATE TABLE Members (
member_id INT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(50),
phone_number VARCHAR(15), 
membership_date DATE
);

SELECT *FROM Members;

--4 table
CREATE TABLE Transactions (
transaction_id INT PRIMARY KEY,
member_id INT,
book_id INT,
borrow_date DATE,
return_date DATE,
fine_amount DECIMAL (10,2),
FOREIGN KEY (member_id) REFERENCES Members(member_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

SELECT *FROM Members;

--(1)
INSERT INTO Authors (author_id, name, email)
VALUES
(1, 'J.K. Rowling', 'jk@example.com'),
(2, 'George Orwell', 'george@example.com'),
(3, 'R.K. Narayan', 'rk@example.com');

--1.2
INSERT INTO Books
(book_id, title, author_id, category, isbn, published_date, price, available_copies)
VALUES
(101, 'Harry Potter', 1, 'Fantasy', 'ISBN101', '1997-06-26', 450.00, 5),
(102, '1984', 2, 'Science', 'ISBN102', '1949-06-08', 350.00, 3),
(103, 'The Guide', 3, 'Fiction', 'ISBN103', '1958-01-01', 550.00, 0);

--1.3
INSERT INTO Members
(member_id, name, email, phone_number, membership_date)
VALUES
(1, 'Alice', 'alice@example.com', '9876543210', '2021-05-10'),
(2, 'Bob', 'bob@example.com', '9876543211', '2022-03-15'),
(3, 'Charlie', 'charlie@example.com', '9876543212', '2023-01-20');

--1.4 BOOK BORROW
UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 101
AND available_copies > 0;

INSERT INTO Transactions
(transaction_id, member_id, book_id, borrow_date, return_date, fine_amount)
VALUES
(1, 1, 101, CURRENT_DATE, NULL, 0.00);

--1.5 BOOK RETURN
UPDATE Books
SET available_copies = available_copies + 1
WHERE book_id = 101;

UPDATE Transactions
SET return_date = CURRENT_DATE
WHERE transaction_id = 1;

--1.6 INACTIVE MEMBERS DELETE
DELETE FROM Members
WHERE member_id NOT IN (
    SELECT member_id
    FROM Transactions
    WHERE borrow_date >= CURRENT_DATE - INTERVAL '1 year'
);

--1.7 AVAILABLE BOOKS
SELECT *
FROM Books
WHERE available_copies > 0;

--2.1 DATE CONDITIONS
SELECT *
FROM Books
WHERE published_date > '2015-12-31';

--2.2 TOP 5 EXPENSIVE BOOKS
SELECT *
FROM Books
ORDER BY price DESC
LIMIT 5;

--2.3 MEMBERS BEFORE 2022
SELECT *
FROM Members
WHERE membership_date < '2022-01-01';

--3.1 WHERE + AND + OR
SELECT *
FROM Books
WHERE category = 'Science'
AND price < 500;

--3.2 OUT OF STOCK BOOKS
SELECT *
FROM Books
WHERE available_copies = 0;

--3.3 OR + SUBQUERY
SELECT *
FROM Members
WHERE membership_date > '2020-12-31'
OR member_id IN (
    SELECT member_id
    FROM Transactions
    GROUP BY member_id
    HAVING COUNT(*) > 3
);

--4.1 Alphabetical Books
SELECT *
FROM Books
ORDER BY title ASC;

--4.2 How many borrow the book in member
SELECT
    m.member_id,
    m.name,
    COUNT(t.transaction_id) AS books_borrowed
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id
GROUP BY m.member_id, m.name;

--4.3 category accodinging books count

SELECT
    category,
    COUNT(*) AS total_books
FROM Books
GROUP BY category;

--5.1  AGGREGATE FUNCTIONS
SELECT
    category,
    COUNT(*) AS total_books
FROM Books
GROUP BY category;

--5.2 Average Price
SELECT AVG(price) AS average_price
FROM Books;

--5.3 Most Borrowed Book
SELECT
    b.book_id,
    b.title,
    COUNT(t.transaction_id) AS borrow_count
FROM Books b
JOIN Transactions t
ON b.book_id = t.book_id
GROUP BY b.book_id, b.title
ORDER BY borrow_count DESC
LIMIT 1;

--5.4 TOTAL FINES
SELECT SUM(fine_amount) AS total_fines
FROM Transactions;

--6.1 INNER JOIN
SELECT
    b.book_id,
    b.title,
    a.author_id,
    a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;

--6.2 Members + Transactions
SELECT
    m.member_id,
    m.name,
    t.transaction_id,
    t.book_id,
    t.borrow_date,
    t.return_date
FROM Members m
INNER JOIN Transactions t
ON m.member_id = t.member_id;

--7.1 DIFFERENT JOINS
SELECT
    b.title,
    a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;

--7.2 LEFT JOIN
SELECT
    m.member_id,
    m.name,
    t.book_id,
    t.borrow_date
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id
WHERE t.transaction_id IS NOT NULL;

--7.3 RIGHT JOIN
SELECT
    b.book_id,
    b.title
FROM Transactions t
RIGHT JOIN Books b
ON t.book_id = b.book_id
WHERE t.transaction_id IS NULL;

--7.4 FULL OUTER JOIN
SELECT
    m.member_id,
    m.name
FROM Members m
FULL OUTER JOIN Transactions t
ON m.member_id = t.member_id
WHERE t.transaction_id IS NULL;

--8.1 members after borrow books
SELECT *
FROM Books
WHERE book_id IN (
    SELECT book_id
    FROM Transactions
    WHERE member_id IN (
        SELECT member_id
        FROM Members
        WHERE membership_date > '2022-12-31'
    )
);

--8.2 Most Borrowed Book
SELECT *
FROM Books
WHERE book_id = (
    SELECT book_id
    FROM Transactions
    GROUP BY book_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

--8.3 Never Borrowed Members
SELECT *
FROM Members
WHERE member_id NOT IN (
    SELECT member_id
    FROM Transactions
);

--9.1 DATE FUNCTIONS
SELECT 
    EXTRACT(YEAR FROM published_date) AS publication_year,
    COUNT(*) AS total_books
FROM Books
GROUP BY EXTRACT(YEAR FROM published_date)
ORDER BY publication_year;

--9.2 HOW MANY DAY AFTER RETURNS
SELECT 
    transaction_id,
    member_id,
    book_id,
    borrow_date,
    return_date,
    (return_date - borrow_date) AS late_return_days
FROM Transactions
WHERE return_date IS NOT NULL;

--9.3 DATE FORMAT
SELECT 
    transaction_id,
    TO_CHAR(borrow_date, 'DD-MM-YYYY') AS formatted_borrow_date
FROM Transactions;

--10.1 STRING FUNCTIONS
SELECT
    book_id,
    UPPER(title) AS uppercase_title
FROM Books;

--10.2 TRIM
UPDATE Authors
SET name = TRIM(name);

--10.3 COALESCE + NULLIF + TRIM
SELECT
    author_id,
    name,
    COALESCE(NULLIF(TRIM(email), ''), 'Not Provided') AS email
FROM Authors;

--for member
SELECT
    member_id,
    name,
    COALESCE(NULLIF(TRIM(email), ''), 'Not Provided') AS email
FROM Members;

--11.1 RANK()
SELECT
    b.book_id,
    b.title,
    COUNT(t.transaction_id) AS borrow_count,
    RANK() OVER (
        ORDER BY COUNT(t.transaction_id) DESC
    ) AS book_rank
FROM Books b
LEFT JOIN Transactions t
ON b.book_id = t.book_id
GROUP BY b.book_id, b.title;

--11.2 Cumulative Books Borrowed
SELECT
    member_id,
    transaction_id,
    borrow_date,
    COUNT(*) OVER (
        PARTITION BY member_id
        ORDER BY borrow_date, transaction_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_books_borrowed
FROM Transactions;

--11.3 3-Month Moving Average
WITH monthly_borrowing AS (
    SELECT
        DATE_TRUNC('month', borrow_date)::date AS borrow_month,
        COUNT(*) AS books_borrowed
    FROM Transactions
    GROUP BY DATE_TRUNC('month', borrow_date)
)
SELECT
    borrow_month,
    books_borrowed,
    AVG(books_borrowed) OVER (
        ORDER BY borrow_month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average_3_months
FROM monthly_borrowing
ORDER BY borrow_month;

--13.1 Active / Inactive Member
SELECT 
    m.member_id,
    m.name,
    CASE 
        WHEN MAX(t.borrow_date) >= CURRENT_DATE - INTERVAL '6 months'
        THEN 'Active'
        ELSE 'Inactive'
    END AS membership_status
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id
GROUP BY m.member_id, m.name;

--13.2 New Arrival / Classic / Regular
SELECT
    book_id,
    title,
    published_date,
    CASE
        WHEN EXTRACT(YEAR FROM published_date) > 2020
            THEN 'New Arrival'
        WHEN EXTRACT(YEAR FROM published_date) < 2000
            THEN 'Classic'
        ELSE 'Regular'
    END AS book_category
FROM Books;