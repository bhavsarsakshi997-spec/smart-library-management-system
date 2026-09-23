smart-library-management-system

📚 Library Management System

<p align="center">









</p>

<p align="center">

A relational database project for managing books, authors, members, and library transactions using PostgreSQL.

</p>

📖 Table of Contents

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

The project demonstrates both fundamental and advanced SQL concepts, making it suitable for academic database practice and real-world relational database understanding.

🎯 Project Objectives

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

Feature

Description

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

Technology

Purpose

PostgreSQL

Relational Database Management System

SQL

Database Query Language

pgAdmin

Database Management and Query Interface

Relational Database

Structured data storage

Recommended Environment

PostgreSQL 15+
pgAdmin 4+

🏗️ Database Architecture

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

🔗 Database Relationships

1. Authors → Books

Relationship: One-to-Many

One author can be associated with multiple books.

Authors.author_id
        │
        │
        ▼
Books.author_id

Foreign Key:

FOREIGN KEY (author_id)
REFERENCES Authors(author_id)

2. Members → Transactions

Relationship: One-to-Many

One member can have multiple borrowing transactions.

Members.member_id
        │
        ▼
Transactions.member_id

3. Books → Transactions

Relationship: One-to-Many

A book can appear in multiple transaction records over time.

Books.book_id
      │
      ▼
Transactions.book_id

🗂️ Database Schema

👤 Authors

Stores information about book authors.

Column

Data Type

Key

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

Stores book information and availability.

Column

Data Type

Key

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

Stores library member information.

Column

Data Type

Key

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

Stores borrowing and returning information.

Column

Data Type

Key

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

Primary Key

A Primary Key uniquely identifies each record in a table.

author_id INT PRIMARY KEY
book_id INT PRIMARY KEY
member_id INT PRIMARY KEY
transaction_id INT PRIMARY KEY

Purpose

Prevents duplicate identifiers.

Uniquely identifies records.

Helps establish relationships.

Foreign Key

A Foreign Key connects one table with another table.

Example:

FOREIGN KEY (author_id)
REFERENCES Authors(author_id)

Purpose

Maintains relationships.

Helps maintain referential integrity.

Prevents invalid references.

📥 Sample Data

The project uses sample data representing a small library environment.

Authors

J.K. Rowling
George Orwell
R.K. Narayan

Books

Harry Potter
1984
The Guide

Members

Alice
Bob
Charlie

These records are used to test different SQL operations and analytical queries.

⚙️ Core SQL Operations

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

INSERT

Used to add records into database tables.

INSERT INTO Authors (author_id, name, email)
VALUES
(1, 'J.K. Rowling', 'jk@example.com'),
(2, 'George Orwell', 'george@example.com'),
(3, 'R.K. Narayan', 'rk@example.com');

UPDATE

Used to modify existing records.

Example:

UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 101
AND available_copies > 0;

This updates the available copy count when a book is borrowed.

DELETE

Used to remove records based on specified conditions.

Example:

DELETE FROM Members
WHERE member_id NOT IN (
    SELECT member_id
    FROM Transactions
    WHERE borrow_date >= CURRENT_DATE - INTERVAL '1 year'
);

🔎 Filtering and Sorting

Available Books

SELECT *
FROM Books
WHERE available_copies > 0;

Books Published After 2015

SELECT *
FROM Books
WHERE published_date > '2015-12-31';

Science Books Below ₹500

SELECT *
FROM Books
WHERE category = 'Science'
AND price < 500;

Sort Books Alphabetically

SELECT *
FROM Books
ORDER BY title ASC;

Top 5 Most Expensive Books

SELECT *
FROM Books
ORDER BY price DESC
LIMIT 5;

📊 Aggregate Functions

The project demonstrates commonly used SQL aggregate functions:

COUNT()
SUM()
AVG()
MAX()
MIN()

Average Book Price

SELECT AVG(price) AS average_price
FROM Books;

Total Fines

SELECT SUM(fine_amount) AS total_fines
FROM Transactions;

Books by Category

SELECT
    category,
    COUNT(*) AS total_books
FROM Books
GROUP BY category;

🔗 SQL JOINs

JOINs combine information from multiple related tables.

INNER JOIN

Returns matching records from both tables.

SELECT
    b.book_id,
    b.title,
    a.author_id,
    a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;

Result

This connects each book with its corresponding author.

LEFT JOIN

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

RIGHT JOIN

Returns all records from the right table and matching records from the left table.

SELECT
    b.book_id,
    b.title
FROM Transactions t
RIGHT JOIN Books b
ON t.book_id = b.book_id
WHERE t.transaction_id IS NULL;

This can be used to identify books without borrowing transactions.

FULL OUTER JOIN

A FULL OUTER JOIN combines matching and non-matching records from both tables.

PostgreSQL

PostgreSQL supports:

SELECT
    m.member_id,
    m.name
FROM Members m
FULL OUTER JOIN Transactions t
ON m.member_id = t.member_id;

🔍 Subqueries

A Subquery is a query written inside another SQL query.

Books Borrowed by Recent Members

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

Members Without Transactions

SELECT *
FROM Members
WHERE member_id NOT IN (
    SELECT member_id
    FROM Transactions
);

📅 Date and Time Operations

Since this project uses PostgreSQL, PostgreSQL-compatible date functions are used.

Extract Publication Year

SELECT
    EXTRACT(YEAR FROM published_date) AS publication_year,
    COUNT(*) AS total_books
FROM Books
GROUP BY EXTRACT(YEAR FROM published_date)
ORDER BY publication_year;

Calculate Borrowing Duration

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

Format Borrow Date

SELECT
    transaction_id,
    TO_CHAR(borrow_date, 'DD-MM-YYYY') AS formatted_borrow_date
FROM Transactions;

🔤 String and NULL Handling

UPPER()

Converts text into uppercase.

SELECT
    book_id,
    UPPER(title) AS uppercase_title
FROM Books;

TRIM()

Removes unnecessary spaces.

UPDATE Authors
SET name = TRIM(name);

COALESCE()

Provides a replacement value when the original value is NULL.

SELECT
    author_id,
    name,
    COALESCE(
        NULLIF(TRIM(email), ''),
        'Not Provided'
    ) AS email
FROM Authors;

🪟 Window Functions

Window functions perform calculations across related rows while preserving individual records.

Book Ranking

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

Purpose

Ranks books according to their borrowing frequency.

📈 Cumulative Borrowing

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

📊 CTE and Moving Average

A Common Table Expression (CTE) makes complex queries easier to understand and organize.

Three-Month Moving Average

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

Purpose

This query analyzes monthly borrowing activity and calculates a three-month moving average.

🧠 CASE Expressions

CASE is used to apply conditional logic.

Member Activity Status

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

Classification

Recent Borrowing
      │
      ├── Yes → Active
      │
      └── No  → Inactive

📚 Book Classification

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

Classification Rules

Condition

Category

Year > 2020

New Arrival

Year < 2000

Classic

Otherwise

Regular

🧩 SQL Concept Coverage

SQL Concept

Status

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

📸 Project Output

For a professional project presentation, add screenshots of the actual PostgreSQL/pgAdmin outputs.

Recommended Screenshots

01 — Database Tables

Show all four tables:

Authors
Books
Members
Transactions

02 — Books Output

SELECT * FROM Books;

03 — Members Output

SELECT * FROM Members;

04 — Transactions Output

SELECT * FROM Transactions;

05 — Books and Authors JOIN

Show the INNER JOIN result.

06 — Category Analysis

Show:

category
total_books

07 — Book Ranking

Show:

book_id
title
borrow_count
book_rank

08 — Member Status

Show:

member_id
name
membership_status

09 — Moving Average

Show:

borrow_month
books_borrowed
moving_average_3_months

📁 Recommended Project Structure

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

⚙️ Installation and Setup

Step 1 — Install PostgreSQL

Install:

PostgreSQL

pgAdmin 4

Step 2 — Create Database

CREATE DATABASE library_management;

Connect to the newly created database through pgAdmin.

Step 3 — Create Tables

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

Recommended order:

1. Authors
2. Members
3. Books
4. Transactions

This order ensures that referenced tables exist before foreign keys are created.

Step 4 — Insert Data

Insert sample data in the following order:

1. Authors
2. Books
3. Members
4. Transactions

Step 5 — Execute Queries

Run the queries section-by-section in pgAdmin and capture the output screenshots for the README.

🛡️ Data Integrity

The database uses relational database principles to maintain consistency.

Primary Keys

Uniquely identify each record.

Foreign Keys

Connect related tables.

Referential Integrity

Ensures that foreign-key values correspond to valid referenced records.

NULL Handling

Allows missing values where appropriate and handles them using functions such as COALESCE().

🧪 Testing

The project can be tested using:

SELECT * FROM Authors;

SELECT * FROM Books;

SELECT * FROM Members;

SELECT * FROM Transactions;

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

📊 Project Analysis

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

The project uses sample data rather than a large production dataset.

User authentication is not implemented.

A graphical user interface is not included.

Automated fine calculation is not implemented.

Book reservation functionality is not included.

Real-time notifications are not implemented.

The current system focuses primarily on database-level operations.

🚀 Future Enhancements

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

After completing this project, the learner gains a stronger understanding of how relational databases are designed, connected, queried, and analyzed.

📝 Conclusion

The Library Management System demonstrates the design and implementation of a relational database using PostgreSQL and SQL.

The project integrates core database concepts such as primary keys, foreign keys, CRUD operations, filtering, aggregation, JOINs, subqueries, date operations, string functions, CASE expressions, CTEs, and window functions.

It provides a practical example of how SQL can be used to manage library data and generate meaningful analytical information from relational tables.

👨‍💻 Project Information

Information

Details

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

<p align="center">

📚 Library Management System

Designed with SQL • Powered by PostgreSQL • Built for Database Learning

</p>
