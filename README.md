📚 Library Management System

svg

PostgreSQL

SQL

Project

Status



A relational database project for managing books, authors, members, and library transactions using PostgreSQL.

📖 Table of Contents

svg

Project Overview

Objectives

Key Features

Technology Stack

Database Architecture

Database Relationships

Database Schema

Core SQL Operations

Filtering and Sorting

Aggregate Functions

SQL Joins

Subqueries

Date and Time Operations

String and NULL Handling

Window Functions

CTE and Moving Average

CASE Expressions

Query Coverage

Project Output

Project Structure

Installation and Setup

Data Integrity

Advantages

Limitations

Future Enhancements

Learning Outcomes

Conclusion

📌 Project Overview

svg

The Library Management System is a relational database project developed using SQL and PostgreSQL.

The system is designed to manage the core activities of a library, including:

📚 Book management

✍️ Author management

👥 Member management

🔄 Book borrowing and returning

💰 Fine tracking

📊 Borrowing analysis

📈 Statistical reporting

🔎 Data filtering and searching

The database consists of four interconnected tables:

Authors
   │
   │ 1 : Many
   ▼
Books
   │
   │ 1 : Many
   ▼
Transactions
   ▲
   │ 1 : Many
   │
Members


svg

The project demonstrates both fundamental and advanced SQL concepts, making it suitable for academic database practice and real-world relational database understanding.

🎯 Project Objectives

svg

The main objectives of this project are:

Design a structured relational database for a library.

Store and manage author information.

Store and manage book information.

Maintain library member records.

Record book borrowing and returning transactions.

Track available copies of books.

Store transaction and fine information.

Retrieve meaningful information using SQL queries.

Analyze library data using aggregate functions.

Demonstrate different SQL JOIN operations.

Use subqueries for advanced data retrieval.

Apply date and string functions.

Implement window functions for analytical operations.

Use CTEs for structured and readable queries.

Classify books and members using conditional logic.

✨ Key Features

svg

FeatureDescription



📚 Book Management

Stores book details and availability

✍️ Author Management

Stores author information

👥 Member Management

Maintains library member records

🔄 Transactions

Tracks borrowing and returning

💰 Fine Tracking

Stores transaction fine amounts

🔗 Relationships

Uses primary and foreign keys

📊 Data Analysis

Performs statistical calculations

🔎 Filtering

Retrieves records using conditions

🔗 JOIN Operations

Combines data from multiple tables

📈 Ranking

Ranks books based on borrowing

📅 Date Analysis

Performs date-based calculations

🪟 Window Functions

Performs advanced analytical calculations

🧠 CASE Logic

Classifies books and members

🛠️ Technology Stack

svg

TechnologyPurpose



PostgreSQL

Relational Database Management System

SQL

Database Query Language

pgAdmin

Database Management and Query Interface

Relational Database

Structured data storage

Recommended Environment

svg

PostgreSQL 15+
pgAdmin 4+


svg

🏗️ Database Architecture

svg

The system contains four main tables:

                    ┌─────────────────┐
                    │     AUTHORS     │
                    ├─────────────────┤
                    │ PK author_id    │
                    │ name            │
                    │ email           │
                    └────────┬────────┘
                             │
                             │ 1 : Many
                             ▼
                    ┌─────────────────┐
                    │      BOOKS      │
                    ├─────────────────┤
                    │ PK book_id     │
                    │ title           │
                    │ FK author_id    │
                    │ category        │
                    │ isbn            │
                    │ published_date  │
                    │ price           │
                    │ available_copies│
                    └────────┬────────┘
                             │
                             │ 1 : Many
                             ▼
                    ┌─────────────────┐
                    │  TRANSACTIONS   │
                    ├─────────────────┤
                    │ PK transaction_id│
                    │ FK member_id    │
                    │ FK book_id      │
                    │ borrow_date     │
                    │ return_date     │
                    │ fine_amount     │
                    └────────┬────────┘
                             ▲
                             │
                             │ Many : 1
                             │
                    ┌────────┴────────┐
                    │     MEMBERS     │
                    ├─────────────────┤
                    │ PK member_id    │
                    │ name            │
                    │ email           │
                    │ phone_number    │
                    │ membership_date │
                    └─────────────────┘


svg

🔗 Database Relationships

svg

1. Authors → Books

svg

Relationship: One-to-Many

One author can be associated with multiple books.

Authors.author_id
        │
        │
        ▼
Books.author_id


svg

Foreign Key:

FOREIGN KEY (author_id)
REFERENCES Authors(author_id)

svg

2. Members → Transactions

svg

Relationship: One-to-Many

One member can have multiple borrowing transactions.

Members.member_id
        │
        ▼
Transactions.member_id


svg

3. Books → Transactions

svg

Relationship: One-to-Many

A book can appear in multiple transaction records over time.

Books.book_id
      │
      ▼
Transactions.book_id


svg

🗂️ Database Schema

svg

👤 Authors

svg

Stores information about book authors.

ColumnData TypeKey





author_id

INT

Primary Key

name

VARCHAR(50)

—

email

VARCHAR(50)

—

📚 Books

svg

Stores book information and availability.

ColumnData TypeKey





book_id

INT

Primary Key

title

VARCHAR(50)

—

author_id

INT

Foreign Key

category

VARCHAR(50)

—

isbn

VARCHAR(50)

—

published_date

DATE

—

price

DECIMAL(10,2)

—

available_copies

INT

—

👥 Members

svg

Stores library member information.

ColumnData TypeKey





member_id

INT

Primary Key

name

VARCHAR(50)

—

email

VARCHAR(50)

—

phone_number

VARCHAR(15)

—

membership_date

DATE

—

🔄 Transactions

svg

Stores borrowing and returning information.

ColumnData TypeKey





transaction_id

INT

Primary Key

member_id

INT

Foreign Key

book_id

INT

Foreign Key

borrow_date

DATE

—

return_date

DATE

—

fine_amount

DECIMAL(10,2)

—

🔑 Database Keys

svg

Primary Key

svg

A Primary Key uniquely identifies each record in a table.

author_id INT PRIMARY KEY
book_id INT PRIMARY KEY
member_id INT PRIMARY KEY
transaction_id INT PRIMARY KEY

svg

Purpose

svg

Prevents duplicate identifiers.

Uniquely identifies records.

Helps establish relationships.

Foreign Key

svg

A Foreign Key connects one table with another table.

Example:

FOREIGN KEY (author_id)
REFERENCES Authors(author_id)

svg

Purpose

svg

Maintains relationships.

Helps maintain referential integrity.

Prevents invalid references.

📥 Sample Data

svg

The project uses sample data representing a small library environment.

Authors

svg

J.K. Rowling
George Orwell
R.K. Narayan


svg

Books

svg

Harry Potter
1984
The Guide


svg

Members

svg

Alice
Bob
Charlie


svg

These records are used to test different SQL operations and analytical queries.

⚙️ Core SQL Operations

svg

The project demonstrates the complete SQL data manipulation workflow:

CREATE
   ↓
INSERT
   ↓
SELECT
   ↓
UPDATE
   ↓
DELETE
   ↓
ANALYZE


svg

INSERT

svg

Used to add records into database tables.

INSERT INTO Authors (author_id, name, email)
VALUES
(1, 'J.K. Rowling', 'jk@example.com'),
(2, 'George Orwell', 'george@example.com'),
(3, 'R.K. Narayan', 'rk@example.com');

svg

UPDATE

svg

Used to modify existing records.

Example:

UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 101
AND available_copies > 0;

svg

This updates the available copy count when a book is borrowed.

DELETE

svg

Used to remove records based on specified conditions.

Example:

DELETE FROM Members
WHERE member_id NOT IN (
    SELECT member_id
    FROM Transactions
    WHERE borrow_date >= CURRENT_DATE - INTERVAL '1 year'
);

svg

🔎 Filtering and Sorting

svg

Available Books

svg

SELECT *
FROM Books
WHERE available_copies > 0;

svg

Books Published After 2015

svg

SELECT *
FROM Books
WHERE published_date > '2015-12-31';

svg

Science Books Below ₹500

svg

SELECT *
FROM Books
WHERE category = 'Science'
AND price < 500;

svg

Sort Books Alphabetically

svg

SELECT *
FROM Books
ORDER BY title ASC;

svg

Top 5 Most Expensive Books

svg

SELECT *
FROM Books
ORDER BY price DESC
LIMIT 5;

svg

📊 Aggregate Functions

svg

The project demonstrates commonly used SQL aggregate functions:

COUNT()
SUM()
AVG()
MAX()
MIN()


svg

Average Book Price

svg

SELECT AVG(price) AS average_price
FROM Books;

svg

Total Fines

svg

SELECT SUM(fine_amount) AS total_fines
FROM Transactions;

svg

Books by Category

svg

SELECT
    category,
    COUNT(*) AS total_books
FROM Books
GROUP BY category;

svg

🔗 SQL JOINs

svg

JOINs combine information from multiple related tables.

INNER JOIN

svg

Returns matching records from both tables.

SELECT
    b.book_id,
    b.title,
    a.author_id,
    a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;

svg

Result

svg

This connects each book with its corresponding author.

LEFT JOIN

svg

Returns all records from the left table and matching records from the right table.

SELECT
    m.member_id,
    m.name,
    t.book_id,
    t.borrow_date
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id
WHERE t.transaction_id IS NOT NULL;

svg

RIGHT JOIN

svg

Returns all records from the right table and matching records from the left table.

SELECT
    b.book_id,
    b.title
FROM Transactions t
RIGHT JOIN Books b
ON t.book_id = b.book_id
WHERE t.transaction_id IS NULL;

svg

This can be used to identify books without borrowing transactions.

FULL OUTER JOIN

svg

A FULL OUTER JOIN combines matching and non-matching records from both tables.

PostgreSQL

svg

PostgreSQL supports:

SELECT
    m.member_id,
    m.name
FROM Members m
FULL OUTER JOIN Transactions t
ON m.member_id = t.member_id;

svg

🔍 Subqueries

svg

A Subquery is a query written inside another SQL query.

Books Borrowed by Recent Members

svg

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

svg

Members Without Transactions

svg

SELECT *
FROM Members
WHERE member_id NOT IN (
    SELECT member_id
    FROM Transactions
);

svg

📅 Date and Time Operations

svg

Since this project uses PostgreSQL, PostgreSQL-compatible date functions are used.

Extract Publication Year

svg

SELECT
    EXTRACT(YEAR FROM published_date) AS publication_year,
    COUNT(*) AS total_books
FROM Books
GROUP BY EXTRACT(YEAR FROM published_date)
ORDER BY publication_year;

svg

Calculate Borrowing Duration

svg

PostgreSQL allows direct subtraction between DATE values.

SELECT
    transaction_id,
    member_id,
    book_id,
    borrow_date,
    return_date,
    (return_date - borrow_date) AS return_duration_days
FROM Transactions
WHERE return_date IS NOT NULL;

svg

Format Borrow Date

svg

SELECT
    transaction_id,
    TO_CHAR(borrow_date, 'DD-MM-YYYY') AS formatted_borrow_date
FROM Transactions;

svg

🔤 String and NULL Handling

svg

UPPER()

svg

Converts text into uppercase.

SELECT
    book_id,
    UPPER(title) AS uppercase_title
FROM Books;

svg

TRIM()

svg

Removes unnecessary spaces.

UPDATE Authors
SET name = TRIM(name);

svg

COALESCE()

svg

Provides a replacement value when the original value is NULL.

SELECT
    author_id,
    name,
    COALESCE(
        NULLIF(TRIM(email), ''),
        'Not Provided'
    ) AS email
FROM Authors;

svg

🪟 Window Functions

svg

Window functions perform calculations across related rows while preserving individual records.

Book Ranking

svg

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

svg

Purpose

svg

Ranks books according to their borrowing frequency.

📈 Cumulative Borrowing

svg

A cumulative count tracks borrowing activity for each member over time.

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

svg

📊 CTE and Moving Average

svg

A Common Table Expression (CTE) makes complex queries easier to understand and organize.

Three-Month Moving Average

svg

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

svg

Purpose

svg

This query analyzes monthly borrowing activity and calculates a three-month moving average.

🧠 CASE Expressions

svg

CASE is used to apply conditional logic.

Member Activity Status

svg

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

svg

Classification

svg

Recent Borrowing
      │
      ├── Yes → Active
      │
      └── No  → Inactive


svg

📚 Book Classification

svg

Books are classified based on publication year.

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

svg

Classification Rules

svg

ConditionCategory



Year > 2020

New Arrival

Year < 2000

Classic

Otherwise

Regular

🧩 SQL Concept Coverage

svg

SQL ConceptStatus



CREATE TABLE

✅

PRIMARY KEY

✅

FOREIGN KEY

✅

INSERT

✅

UPDATE

✅

DELETE

✅

SELECT

✅

WHERE

✅

ORDER BY

✅

LIMIT

✅

GROUP BY

✅

HAVING

✅

COUNT()

✅

SUM()

✅

AVG()

✅

INNER JOIN

✅

LEFT JOIN

✅

RIGHT JOIN

✅

FULL OUTER JOIN

✅

Subqueries

✅

Date Functions

✅

String Functions

✅

NULL Handling

✅

CASE

✅

CTE

✅

RANK()

✅

Window Functions

✅

Moving Average

✅

🖥️ PostgreSQL / pgAdmin Output Preview

Note: GitHub README files cannot execute PostgreSQL queries directly.
The sections below are designed to look like the result grid you see after running a query in pgAdmin.
Replace the preview values with your actual pgAdmin screenshots/results when available.

01 — Books Table Output

SQL Query

SELECT * FROM Books;

📊 Query Result

book_id

title

author_id

category

isbn

published_date

price

available_copies

101

Harry Potter

1

Fiction

—

—

—

—

102

1984

2

Fiction

—

—

—

—

103

The Guide

3

Fiction

—

—

—

—

02 — Members Table Output

SQL Query

SELECT * FROM Members;

📊 Query Result

member_id

name

email

phone_number

membership_date

1

Alice

—

—

—

2

Bob

—

—

—

3

Charlie

—

—

—

03 — Authors Table Output

SQL Query

SELECT * FROM Authors;

📊 Query Result

author_id

name

email

1

J.K. Rowling

jk@example.com

2

George Orwell

george@example.com

3

R.K. Narayan

rk@example.com

04 — Transactions Table Output

SQL Query

SELECT * FROM Transactions;

📊 Query Result

transaction_id

member_id

book_id

borrow_date

return_date

fine_amount

—

—

—

—

—

—

—

—

—

—

—

—

05 — Books + Authors INNER JOIN

SQL Query

SELECT
    b.book_id,
    b.title,
    a.author_id,
    a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;

📊 pgAdmin-Style Result

book_id

title

author_id

author_name

101

Harry Potter

1

J.K. Rowling

102

1984

2

George Orwell

103

The Guide

3

R.K. Narayan

06 — Available Books

SQL Query

SELECT *
FROM Books
WHERE available_copies > 0;

📊 Query Result

book_id

title

category

available_copies

—

—

—

—

07 — Books by Category

SQL Query

SELECT
    category,
    COUNT(*) AS total_books
FROM Books
GROUP BY category;

📊 Query Result

category

total_books

Fiction

—

Science

—

—

—

08 — Average Book Price

SQL Query

SELECT AVG(price) AS average_price
FROM Books;

📊 Query Result

average_price

—

09 — Total Fines

SQL Query

SELECT SUM(fine_amount) AS total_fines
FROM Transactions;

📊 Query Result

total_fines

—

10 — Book Ranking

SQL Query

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

📊 pgAdmin-Style Result

book_id

title

borrow_count

book_rank

—

—

—

—

—

—

—

—

—

—

—

—

11 — Member Activity Status

SQL Query

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

📊 Query Result

member_id

name

membership_status

1

Alice

—

2

Bob

—

3

Charlie

—

12 — Book Classification

SQL Query

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

📊 Query Result

book_id

title

published_date

book_category

—

—

—

—

—

—

—

—

—

—

—

—

💡 How the README Output Works

The presentation follows the same flow as pgAdmin:

SQL Query
    ↓
Execute in PostgreSQL / pgAdmin
    ↓
Result Grid
    ↓
Copy the actual result into README

Example

SELECT
    b.book_id,
    b.title,
    a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;

Result Grid:

book_id

title

author_name

101

Harry Potter

J.K. Rowling

102

1984

George Orwell

103

The Guide

R.K. Narayan

This gives the README a SQL → Result Grid presentation similar to the PostgreSQL/pgAdmin workflow while keeping the project documentation clean and professional.

📸 Project Output

svg

For a professional project presentation, add screenshots of the actual PostgreSQL/pgAdmin outputs.

Recommended Screenshots

svg

01 — Database Tables

svg

Show all four tables:

Authors
Books
Members
Transactions


svg

02 — Books Output

svg

SELECT * FROM Books;

svg

03 — Members Output

svg

SELECT * FROM Members;

svg

04 — Transactions Output

svg

SELECT * FROM Transactions;

svg

05 — Books and Authors JOIN

svg

Show the INNER JOIN result.

06 — Category Analysis

svg

Show:

category
total_books


svg

07 — Book Ranking

svg

Show:

book_id
title
borrow_count
book_rank


svg

08 — Member Status

svg

Show:

member_id
name
membership_status


svg

09 — Moving Average

svg

Show:

borrow_month
books_borrowed
moving_average_3_months


svg

📁 Recommended Project Structure

svg

Library-Management-System/
│
├── README.md
│
├── library_management.sql
│
├── images/
│   ├── database_tables.png
│   ├── books_output.png
│   ├── members_output.png
│   ├── transactions_output.png
│   ├── books_authors_join.png
│   ├── category_analysis.png
│   ├── book_ranking.png
│   ├── member_status.png
│   └── moving_average.png
│
└── documentation/
    └── database_schema.png


svg

⚙️ Installation and Setup

svg

Step 1 — Install PostgreSQL

svg

Install:

PostgreSQL

pgAdmin 4

Step 2 — Create Database

svg

CREATE DATABASE library_management;

svg

Connect to the newly created database through pgAdmin.

Step 3 — Create Tables

svg

Create tables in dependency order:

Authors
   │
   ▼
Books
   │
   ▼
Transactions
   ▲
   │
Members


svg

Recommended order:

1. Authors
2. Members
3. Books
4. Transactions


svg

This order ensures that referenced tables exist before foreign keys are created.

Step 4 — Insert Data

svg

Insert sample data in the following order:

1. Authors
2. Books
3. Members
4. Transactions


svg

Step 5 — Execute Queries

svg

Run the queries section-by-section in pgAdmin and capture the output screenshots for the README.

🛡️ Data Integrity

svg

The database uses relational database principles to maintain consistency.

Primary Keys

svg

Uniquely identify each record.

Foreign Keys

svg

Connect related tables.

Referential Integrity

svg

Ensures that foreign-key values correspond to valid referenced records.

NULL Handling

svg

Allows missing values where appropriate and handles them using functions such as COALESCE().

🧪 Testing

svg

The project can be tested using:

SELECT * FROM Authors;

SELECT * FROM Books;

SELECT * FROM Members;

SELECT * FROM Transactions;

svg

Additional testing includes:

✓ Book availability
✓ Member records
✓ Borrowing transactions
✓ Return transactions
✓ Author-book relationships
✓ Member-transaction relationships
✓ Aggregate calculations
✓ JOIN results
✓ Subquery results
✓ Ranking results
✓ Moving averages
✓ Member activity classification
✓ Book classification


svg

📊 Project Analysis

svg

The database can answer practical library-related questions such as:

Which books are currently available?

Which books are the most expensive?

Which books belong to the Science category?

Which members have borrowing records?

Which members have no transactions?

Which books have never been borrowed?

How many books belong to each category?

What is the average price of books?

What is the total fine amount?

Which books are borrowed most frequently?

Which members are currently active?

Which books are classified as classics?

What is the monthly borrowing trend?

💡 Advantages

svg

Provides structured library data management.

Reduces unnecessary duplication through relational design.

Maintains relationships using foreign keys.

Makes book availability easy to monitor.

Maintains member borrowing information.

Supports advanced SQL analysis.

Demonstrates fundamental and advanced SQL concepts.

Makes reporting and data retrieval easier.

Provides a practical example of relational database design.

Can be extended into a complete library application.

⚠️ Limitations

svg

The project uses sample data rather than a large production dataset.

User authentication is not implemented.

A graphical user interface is not included.

Automated fine calculation is not implemented.

Book reservation functionality is not included.

Real-time notifications are not implemented.

The current system focuses primarily on database-level operations.

🚀 Future Enhancements

svg

The system can be extended with:

🔐 Admin authentication

👤 User login system

📱 Web application interface

📖 Book reservation

💰 Automatic fine calculation

🔔 Return-date reminders

🔍 Advanced book search

📊 Interactive dashboard

📈 Monthly and yearly reports

📧 Email notifications

📦 Inventory management

🧾 Automated transaction reports

🎓 Learning Outcomes

svg

This project provides practical experience with:

Database Design
       ↓
Table Creation
       ↓
Primary & Foreign Keys
       ↓
Data Manipulation
       ↓
Filtering & Sorting
       ↓
Aggregation
       ↓
JOINs
       ↓
Subqueries
       ↓
Date & String Functions
       ↓
CASE Expressions
       ↓
CTEs
       ↓
Window Functions
       ↓
Data Analysis


svg

After completing this project, the learner gains a stronger understanding of how relational databases are designed, connected, queried, and analyzed.

📝 Conclusion

svg

The Library Management System demonstrates the design and implementation of a relational database using PostgreSQL and SQL.

The project integrates core database concepts such as primary keys, foreign keys, CRUD operations, filtering, aggregation, JOINs, subqueries, date operations, string functions, CASE expressions, CTEs, and window functions.

It provides a practical example of how SQL can be used to manage library data and generate meaningful analytical information from relational tables.

👨‍💻 Project Information

svg

InformationDetails



Project Name

Library Management System

Database

PostgreSQL

Language

SQL

Database Type

Relational Database

Interface

pgAdmin

Main Tables

Authors, Books, Members, Transactions

Project Type

Database Management Project

Status

Completed

⭐ Final Project Workflow

svg

┌──────────────────────┐
│   DATABASE DESIGN    │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│    CREATE TABLES     │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│     INSERT DATA      │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│    CRUD OPERATIONS   │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│ FILTER & SORT DATA   │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│ AGGREGATE FUNCTIONS  │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│       SQL JOINS      │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│      SUBQUERIES      │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│ DATE & STRING LOGIC  │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│    CASE EXPRESSIONS  │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│   CTE & WINDOW FUNC  │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│    DATA ANALYSIS     │
└──────────────────────┘


svg

📚 Library Management System

svg

Designed with SQL • Powered by PostgreSQL • Built for Database Learning
