# 📚 Library Management System

<p align="center">

![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL%2015%2B-336791?style=for-the-badge\&logo=postgresql\&logoColor=white)

![SQL](https://img.shields.io/badge/Language-SQL-4479A1?style=for-the-badge\&logo=postgresql\&logoColor=white)

![Project](https://img.shields.io/badge/Project-Library%20Management-6C63FF?style=for-the-badge)

![Status](https://img.shields.io/badge/Status-Completed-2EA44F?style=for-the-badge)

</p>

<p align="center">

**A relational database project for managing books, authors, members, and library transactions using PostgreSQL.**

</p>

---

## Video Link

https://drive.google.com/file/d/1VlHuTj1g6rZ9LUFPEbAYDbGJFjQqI8p9/view?usp=drive_link

# 📖 Table of Contents

* [Project Overview](#-project-overview)
* [Objectives](#-project-objectives)
* [Key Features](#-key-features)
* [Technology Stack](#-technology-stack)
* [Database Architecture](#-database-architecture)
* [Database Relationships](#-database-relationships)
* [Database Schema](#-database-schema)
* [Core SQL Operations](#-core-sql-operations)
* [Filtering and Sorting](#-filtering-and-sorting)
* [Aggregate Functions](#-aggregate-functions)
* [SQL Joins](#-sql-joins)
* [Subqueries](#-subqueries)
* [Date and Time Operations](#-date-and-time-operations)
* [String and NULL Handling](#-string-and-null-handling)
* [Window Functions](#-window-functions)
* [CTE and Moving Average](#-cte-and-moving-average)
* [CASE Expressions](#-case-expressions)
* [Query Coverage](#-query-coverage)
* [Project Output](#-project-output)
* [Project Structure](#-project-structure)
* [Installation and Setup](#-installation-and-setup)
* [Data Integrity](#-data-integrity)
* [Advantages](#-advantages)
* [Limitations](#-limitations)
* [Future Enhancements](#-future-enhancements)
* [Learning Outcomes](#-learning-outcomes)
* [Conclusion](#-conclusion)

---

# 📌 Project Overview

The **Library Management System** is a relational database project developed using **SQL and PostgreSQL**.

The system is designed to manage the core activities of a library, including:

* 📚 Book management
* ✍️ Author management
* 👥 Member management
* 🔄 Book borrowing and returning
* 💰 Fine tracking
* 📊 Borrowing analysis
* 📈 Statistical reporting
* 🔎 Data filtering and searching

The database consists of four interconnected tables:

```text
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
```

The project demonstrates both **fundamental and advanced SQL concepts**, making it suitable for academic database practice and real-world relational database understanding.

---

# 🎯 Project Objectives

The main objectives of this project are:

1. Design a structured relational database for a library.
2. Store and manage author information.
3. Store and manage book information.
4. Maintain library member records.
5. Record book borrowing and returning transactions.
6. Track available copies of books.
7. Store transaction and fine information.
8. Retrieve meaningful information using SQL queries.
9. Analyze library data using aggregate functions.
10. Demonstrate different SQL JOIN operations.
11. Use subqueries for advanced data retrieval.
12. Apply date and string functions.
13. Implement window functions for analytical operations.
14. Use CTEs for structured and readable queries.
15. Classify books and members using conditional logic.

---

# ✨ Key Features

| Feature              | Description                               |
| -------------------- | ----------------------------------------- |
| 📚 Book Management   | Stores book details and availability      |
| ✍️ Author Management | Stores author information                 |
| 👥 Member Management | Maintains library member records          |
| 🔄 Transactions      | Tracks borrowing and returning            |
| 💰 Fine Tracking     | Stores transaction fine amounts           |
| 🔗 Relationships     | Uses primary and foreign keys             |
| 📊 Data Analysis     | Performs statistical calculations         |
| 🔎 Filtering         | Retrieves records using conditions        |
| 🔗 JOIN Operations   | Combines data from multiple tables        |
| 📈 Ranking           | Ranks books based on borrowing            |
| 📅 Date Analysis     | Performs date-based calculations          |
| 🪟 Window Functions  | Performs advanced analytical calculations |
| 🧠 CASE Logic        | Classifies books and members              |

---

# 🛠️ Technology Stack

| Technology              | Purpose                                 |
| ----------------------- | --------------------------------------- |
| **PostgreSQL**          | Relational Database Management System   |
| **SQL**                 | Database Query Language                 |
| **pgAdmin**             | Database Management and Query Interface |
| **Relational Database** | Structured data storage                 |

### Recommended Environment

```text
PostgreSQL 15+
pgAdmin 4+
```

---

# 🏗️ Database Architecture

The system contains four main tables:

```text
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
```

---

# 🔗 Database Relationships

## 1. Authors → Books

**Relationship:** One-to-Many

One author can be associated with multiple books.

```text
Authors.author_id
        │
        │
        ▼
Books.author_id
```

Foreign Key:

```sql
FOREIGN KEY (author_id)
REFERENCES Authors(author_id)
```

---

## 2. Members → Transactions

**Relationship:** One-to-Many

One member can have multiple borrowing transactions.

```text
Members.member_id
        │
        ▼
Transactions.member_id
```

---

## 3. Books → Transactions

**Relationship:** One-to-Many

A book can appear in multiple transaction records over time.

```text
Books.book_id
      │
      ▼
Transactions.book_id
```

---

# 🗂️ Database Schema

## 👤 Authors

Stores information about book authors.

| Column      | Data Type   | Key         |
| ----------- | ----------- | ----------- |
| `author_id` | INT         | Primary Key |
| `name`      | VARCHAR(50) | —           |
| `email`     | VARCHAR(50) | —           |

---

## 📚 Books

Stores book information and availability.

| Column             | Data Type     | Key         |
| ------------------ | ------------- | ----------- |
| `book_id`          | INT           | Primary Key |
| `title`            | VARCHAR(50)   | —           |
| `author_id`        | INT           | Foreign Key |
| `category`         | VARCHAR(50)   | —           |
| `isbn`             | VARCHAR(50)   | —           |
| `published_date`   | DATE          | —           |
| `price`            | DECIMAL(10,2) | —           |
| `available_copies` | INT           | —           |

---

## 👥 Members

Stores library member information.

| Column            | Data Type   | Key         |
| ----------------- | ----------- | ----------- |
| `member_id`       | INT         | Primary Key |
| `name`            | VARCHAR(50) | —           |
| `email`           | VARCHAR(50) | —           |
| `phone_number`    | VARCHAR(15) | —           |
| `membership_date` | DATE        | —           |

---

## 🔄 Transactions

Stores borrowing and returning information.

| Column           | Data Type     | Key         |
| ---------------- | ------------- | ----------- |
| `transaction_id` | INT           | Primary Key |
| `member_id`      | INT           | Foreign Key |
| `book_id`        | INT           | Foreign Key |
| `borrow_date`    | DATE          | —           |
| `return_date`    | DATE          | —           |
| `fine_amount`    | DECIMAL(10,2) | —           |

---

# 🔑 Database Keys

## Primary Key

A **Primary Key** uniquely identifies each record in a table.

```sql
author_id INT PRIMARY KEY
book_id INT PRIMARY KEY
member_id INT PRIMARY KEY
transaction_id INT PRIMARY KEY
```

### Purpose

* Prevents duplicate identifiers.
* Uniquely identifies records.
* Helps establish relationships.

---

## Foreign Key

A **Foreign Key** connects one table with another table.

Example:

```sql
FOREIGN KEY (author_id)
REFERENCES Authors(author_id)
```

### Purpose

* Maintains relationships.
* Helps maintain referential integrity.
* Prevents invalid references.

---

# 📥 Sample Data

The project uses sample data representing a small library environment.

### Authors

```text
J.K. Rowling
George Orwell
R.K. Narayan
```

### Books

```text
Harry Potter
1984
The Guide
```

### Members

```text
Alice
Bob
Charlie
```

These records are used to test different SQL operations and analytical queries.

---

# ⚙️ Core SQL Operations

The project demonstrates the complete SQL data manipulation workflow:

```text
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
```

---

## INSERT

Used to add records into database tables.

```sql
INSERT INTO Authors (author_id, name, email)
VALUES
(1, 'J.K. Rowling', 'jk@example.com'),
(2, 'George Orwell', 'george@example.com'),
(3, 'R.K. Narayan', 'rk@example.com');
```

---

## UPDATE

Used to modify existing records.

Example:

```sql
UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 101
AND available_copies > 0;
```

This updates the available copy count when a book is borrowed.

---

## DELETE

Used to remove records based on specified conditions.

Example:

```sql
DELETE FROM Members
WHERE member_id NOT IN (
    SELECT member_id
    FROM Transactions
    WHERE borrow_date >= CURRENT_DATE - INTERVAL '1 year'
);
```

---

# 🔎 Filtering and Sorting

## Available Books

```sql
SELECT *
FROM Books
WHERE available_copies > 0;
```

---

## Books Published After 2015

```sql
SELECT *
FROM Books
WHERE published_date > '2015-12-31';
```

---

## Science Books Below ₹500

```sql
SELECT *
FROM Books
WHERE category = 'Science'
AND price < 500;
```

---

## Sort Books Alphabetically

```sql
SELECT *
FROM Books
ORDER BY title ASC;
```

---

## Top 5 Most Expensive Books

```sql
SELECT *
FROM Books
ORDER BY price DESC
LIMIT 5;
```

---

# 📊 Aggregate Functions

The project demonstrates commonly used SQL aggregate functions:

```text
COUNT()
SUM()
AVG()
MAX()
MIN()
```

## Average Book Price

```sql
SELECT AVG(price) AS average_price
FROM Books;
```

## Total Fines

```sql
SELECT SUM(fine_amount) AS total_fines
FROM Transactions;
```

## Books by Category

```sql
SELECT
    category,
    COUNT(*) AS total_books
FROM Books
GROUP BY category;
```

---

# 🔗 SQL JOINs

JOINs combine information from multiple related tables.

## INNER JOIN

Returns matching records from both tables.

```sql
SELECT
    b.book_id,
    b.title,
    a.author_id,
    a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;
```

### Result

This connects each book with its corresponding author.

---

## LEFT JOIN

Returns all records from the left table and matching records from the right table.

```sql
SELECT
    m.member_id,
    m.name,
    t.book_id,
    t.borrow_date
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id
WHERE t.transaction_id IS NOT NULL;
```

---

## RIGHT JOIN

Returns all records from the right table and matching records from the left table.

```sql
SELECT
    b.book_id,
    b.title
FROM Transactions t
RIGHT JOIN Books b
ON t.book_id = b.book_id
WHERE t.transaction_id IS NULL;
```

This can be used to identify books without borrowing transactions.

---

## FULL OUTER JOIN

A FULL OUTER JOIN combines matching and non-matching records from both tables.

### PostgreSQL

PostgreSQL supports:

```sql
SELECT
    m.member_id,
    m.name
FROM Members m
FULL OUTER JOIN Transactions t
ON m.member_id = t.member_id;
```

---

# 🔍 Subqueries

A **Subquery** is a query written inside another SQL query.

## Books Borrowed by Recent Members

```sql
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
```

---

## Members Without Transactions

```sql
SELECT *
FROM Members
WHERE member_id NOT IN (
    SELECT member_id
    FROM Transactions
);
```

---

# 📅 Date and Time Operations

Since this project uses **PostgreSQL**, PostgreSQL-compatible date functions are used.

## Extract Publication Year

```sql
SELECT
    EXTRACT(YEAR FROM published_date) AS publication_year,
    COUNT(*) AS total_books
FROM Books
GROUP BY EXTRACT(YEAR FROM published_date)
ORDER BY publication_year;
```

---

## Calculate Borrowing Duration

PostgreSQL allows direct subtraction between `DATE` values.

```sql
SELECT
    transaction_id,
    member_id,
    book_id,
    borrow_date,
    return_date,
    (return_date - borrow_date) AS return_duration_days
FROM Transactions
WHERE return_date IS NOT NULL;
```

---

## Format Borrow Date

```sql
SELECT
    transaction_id,
    TO_CHAR(borrow_date, 'DD-MM-YYYY') AS formatted_borrow_date
FROM Transactions;
```

---

# 🔤 String and NULL Handling

## UPPER()

Converts text into uppercase.

```sql
SELECT
    book_id,
    UPPER(title) AS uppercase_title
FROM Books;
```

---

## TRIM()

Removes unnecessary spaces.

```sql
UPDATE Authors
SET name = TRIM(name);
```

---

## COALESCE()

Provides a replacement value when the original value is NULL.

```sql
SELECT
    author_id,
    name,
    COALESCE(
        NULLIF(TRIM(email), ''),
        'Not Provided'
    ) AS email
FROM Authors;
```

---

# 🪟 Window Functions

Window functions perform calculations across related rows while preserving individual records.

## Book Ranking

```sql
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
```

### Purpose

Ranks books according to their borrowing frequency.

---

# 📈 Cumulative Borrowing

A cumulative count tracks borrowing activity for each member over time.

```sql
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
```

---

# 📊 CTE and Moving Average

A **Common Table Expression (CTE)** makes complex queries easier to understand and organize.

## Three-Month Moving Average

```sql
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
```

### Purpose

This query analyzes monthly borrowing activity and calculates a three-month moving average.

---

# 🧠 CASE Expressions

`CASE` is used to apply conditional logic.

## Member Activity Status

```sql
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
```

### Classification

```text
Recent Borrowing
      │
      ├── Yes → Active
      │
      └── No  → Inactive
```

---

# 📚 Book Classification

Books are classified based on publication year.

```sql
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
```

### Classification Rules

| Condition   | Category    |
| ----------- | ----------- |
| Year > 2020 | New Arrival |
| Year < 2000 | Classic     |
| Otherwise   | Regular     |

---

# 🧩 SQL Concept Coverage

| SQL Concept      | Status |
| ---------------- | :----: |
| CREATE TABLE     |    ✅   |
| PRIMARY KEY      |    ✅   |
| FOREIGN KEY      |    ✅   |
| INSERT           |    ✅   |
| UPDATE           |    ✅   |
| DELETE           |    ✅   |
| SELECT           |    ✅   |
| WHERE            |    ✅   |
| ORDER BY         |    ✅   |
| LIMIT            |    ✅   |
| GROUP BY         |    ✅   |
| HAVING           |    ✅   |
| COUNT()          |    ✅   |
| SUM()            |    ✅   |
| AVG()            |    ✅   |
| INNER JOIN       |    ✅   |
| LEFT JOIN        |    ✅   |
| RIGHT JOIN       |    ✅   |
| FULL OUTER JOIN  |    ✅   |
| Subqueries       |    ✅   |
| Date Functions   |    ✅   |
| String Functions |    ✅   |
| NULL Handling    |    ✅   |
| CASE             |    ✅   |
| CTE              |    ✅   |
| RANK()           |    ✅   |
| Window Functions |    ✅   |
| Moving Average   |    ✅   |

---

# 📸 Project Output

For a professional project presentation, add screenshots of the actual PostgreSQL/pgAdmin outputs.

## Recommended Screenshots

### 01 — Database Tables

Show all four tables:

```text
Authors
Books
Members
Transactions
```

### 02 — Books Output

```sql
SELECT * FROM Books;
```

### 03 — Members Output

```sql
SELECT * FROM Members;
```

### 04 — Transactions Output

```sql
SELECT * FROM Transactions;
```

### 05 — Books and Authors JOIN

Show the INNER JOIN result.

### 06 — Category Analysis

Show:

```text
category
total_books
```

### 07 — Book Ranking

Show:

```text
book_id
title
borrow_count
book_rank
```

### 08 — Member Status

Show:

```text
member_id
name
membership_status
```

### 09 — Moving Average

Show:

```text
borrow_month
books_borrowed
moving_average_3_months
```

---

# 📁 Recommended Project Structure

```text
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
```

---

# ⚙️ Installation and Setup

## Step 1 — Install PostgreSQL

Install:

* PostgreSQL
* pgAdmin 4

---

## Step 2 — Create Database

```sql
CREATE DATABASE library_management;
```

Connect to the newly created database through pgAdmin.

---

## Step 3 — Create Tables

Create tables in dependency order:

```text
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
```

Recommended order:

```text
1. Authors
2. Members
3. Books
4. Transactions
```

This order ensures that referenced tables exist before foreign keys are created.

---

## Step 4 — Insert Data

Insert sample data in the following order:

```text
1. Authors
2. Books
3. Members
4. Transactions
```

---

## Step 5 — Execute Queries

Run the queries section-by-section in pgAdmin and capture the output screenshots for the README.

---

# 🛡️ Data Integrity

The database uses relational database principles to maintain consistency.

### Primary Keys

Uniquely identify each record.

### Foreign Keys

Connect related tables.

### Referential Integrity

Ensures that foreign-key values correspond to valid referenced records.

### NULL Handling

Allows missing values where appropriate and handles them using functions such as `COALESCE()`.

---

# 🧪 Testing

The project can be tested using:

```sql
SELECT * FROM Authors;

SELECT * FROM Books;

SELECT * FROM Members;

SELECT * FROM Transactions;
```

Additional testing includes:

```text
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
```

---

# 📊 Project Analysis

The database can answer practical library-related questions such as:

* Which books are currently available?
* Which books are the most expensive?
* Which books belong to the Science category?
* Which members have borrowing records?
* Which members have no transactions?
* Which books have never been borrowed?
* How many books belong to each category?
* What is the average price of books?
* What is the total fine amount?
* Which books are borrowed most frequently?
* Which members are currently active?
* Which books are classified as classics?
* What is the monthly borrowing trend?

---

# 💡 Advantages

1. Provides structured library data management.
2. Reduces unnecessary duplication through relational design.
3. Maintains relationships using foreign keys.
4. Makes book availability easy to monitor.
5. Maintains member borrowing information.
6. Supports advanced SQL analysis.
7. Demonstrates fundamental and advanced SQL concepts.
8. Makes reporting and data retrieval easier.
9. Provides a practical example of relational database design.
10. Can be extended into a complete library application.

---

# ⚠️ Limitations

1. The project uses sample data rather than a large production dataset.
2. User authentication is not implemented.
3. A graphical user interface is not included.
4. Automated fine calculation is not implemented.
5. Book reservation functionality is not included.
6. Real-time notifications are not implemented.
7. The current system focuses primarily on database-level operations.

---

# 🚀 Future Enhancements

The system can be extended with:

* 🔐 Admin authentication
* 👤 User login system
* 📱 Web application interface
* 📖 Book reservation
* 💰 Automatic fine calculation
* 🔔 Return-date reminders
* 🔍 Advanced book search
* 📊 Interactive dashboard
* 📈 Monthly and yearly reports
* 📧 Email notifications
* 📦 Inventory management
* 🧾 Automated transaction reports

---

# 🎓 Learning Outcomes

This project provides practical experience with:

```text
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
```

After completing this project, the learner gains a stronger understanding of how relational databases are designed, connected, queried, and analyzed.

---

# 📝 Conclusion

The **Library Management System** demonstrates the design and implementation of a relational database using **PostgreSQL and SQL**.

The project integrates core database concepts such as primary keys, foreign keys, CRUD operations, filtering, aggregation, JOINs, subqueries, date operations, string functions, CASE expressions, CTEs, and window functions.

It provides a practical example of how SQL can be used to manage library data and generate meaningful analytical information from relational tables.

---

# 👨‍💻 Project Information

| Information       | Details                               |
| ----------------- | ------------------------------------- |
| **Project Name**  | Library Management System             |
| **Database**      | PostgreSQL                            |
| **Language**      | SQL                                   |
| **Database Type** | Relational Database                   |
| **Interface**     | pgAdmin                               |
| **Main Tables**   | Authors, Books, Members, Transactions |
| **Project Type**  | Database Management Project           |
| **Status**        | Completed                             |

---

# ⭐ Final Project Workflow

```text
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
```

---

<p align="center">

### 📚 Library Management System

**Designed with SQL • Powered by PostgreSQL • Built for Database Learning**

</p>
