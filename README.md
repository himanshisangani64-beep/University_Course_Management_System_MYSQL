<div align="center">

# 🎓 University Course Management System

### *Interactive MySQL Database, Student Management & Academic Analysis Project*

> *"Transform academic data into meaningful insights with SQL."*

</div>

---

## 📋 Table of Contents

* [📌 Overview](#-overview)
* [🎯 Problem Statement](#-problem-statement)
* [✨ Key Features](#-key-features)
* [🏗️ Project Structure](#️-project-structure)
* [🗃️ Database Structure](#️-database-structure)
* [🔗 Relationships](#-relationships)
* [🔄 Project Workflow](#-project-workflow)
* [📥 Part A — Database & Data Input](#-part-a--database--data-input)
* [📊 Part B — Academic Data Analysis](#-part-b--academic-data-analysis)
* [🛠️ SQL Concepts Used](#️-sql-concepts-used)
* [📈 Results & Insights](#-results--insights)
* [🔍 Data Quality & Design Notes](#-data-quality--design-notes)
* [🏆 Advantages](#-advantages)
* [🔮 Future Improvements](#-future-improvements)
* [▶️ How to Run](#️-how-to-run)
* [👤 Author](#-author)
* [🙏 Acknowledgements](#-acknowledgements)

---

# 📌 Overview

The **University Course Management System** is a **MySQL-based relational database project** designed to manage and analyze university academic information.

The database stores information about:

* 🏢 Departments
* 📚 Courses
* 👨‍🏫 Instructors
* 🎓 Students
* 📝 Course Enrollments

The project demonstrates practical SQL concepts including:

* Database creation
* Table creation
* Primary Keys
* Foreign Keys
* Auto Increment
* Unique constraints
* Data insertion and retrieval
* `INNER JOIN`
* `LEFT JOIN`
* Subqueries
* Aggregate functions
* `GROUP BY`
* `HAVING`
* `COUNT()`
* `AVG()`
* `SUM()`
* Date functions
* String functions
* Window functions
* `CASE` expressions
* Running-total analysis
* Relational database design

The main objective is to transform structured academic data into meaningful insights using SQL.

---

# 🎯 Problem Statement

> **Objective:** Build a relational university database and use SQL queries to manage, retrieve and analyze academic data.

The system contains five major entities:

1. **Departments**
2. **Courses**
3. **Instructors**
4. **Students**
5. **Enrollments**

The SQL analysis answers practical academic questions such as:

* Which students enrolled after 2022?
* Which courses belong to the Mathematics department?
* Which courses have more than 5 students?
* Which students are enrolled in both SQL and Data Structures?
* How many instructors belong to Computer Science?
* How many students are enrolled in each department?
* Which courses have more than 10 students?
* What is the average number of course credits?
* How can instructor names be combined?
* What is the cumulative enrollment across courses?
* Which students are classified as Senior or Junior based on enrollment date?

---

# ✨ Key Features

| Feature                         | Description                                 |
| ------------------------------- | ------------------------------------------- |
| 🗄️ **Relational Database**     | Structured university database using MySQL  |
| 🏢 **Department Management**    | Stores 4 university departments             |
| 📚 **Course Management**        | Stores 25 academic courses                  |
| 👨‍🏫 **Instructor Management** | Stores 20 instructor records                |
| 🎓 **Student Management**       | Stores 20 student records                   |
| 📝 **Enrollment Management**    | Stores 35 student-course relationships      |
| 🔐 **Primary Keys**             | Uniquely identifies records                 |
| 🔗 **Foreign Keys**             | Maintains relationships between tables      |
| 🔒 **Unique Constraint**        | Prevents duplicate instructor emails        |
| 🔗 **INNER JOIN**               | Retrieves matching relational records       |
| 🔗 **LEFT JOIN**                | Retrieves all students and matching courses |
| 🧠 **Subquery**                 | Finds students in highly enrolled courses   |
| 📊 **GROUP BY + HAVING**        | Filters grouped academic data               |
| 📅 **Date Functions**           | Performs enrollment-year analysis           |
| 🔤 **String Functions**         | Creates instructor full names               |
| 📈 **Window Functions**         | Calculates cumulative enrollment            |
| 🏷️ **CASE Expression**         | Classifies students as Senior or Junior     |

---

# 🏗️ Project Structure

```text
📦 University-Course-Management-System/
│
├── 📄 University_Course_Management_System.sql
│   ├── Database Creation
│   ├── Table Creation
│   ├── Sample Data
│   └── Academic Analysis Queries
│
├── 📄 README.md
│   └── Project Documentation
│
└── 📁 Screenshots/              ← Optional
    └── SQL Query Outputs
```

---

# 🗃️ Database Structure

```text
University_Course_Management_System
│
├── 🏢 Departments
│   ├── DepartmentID (PK)
│   └── DepartmentName
│
├── 📚 Courses
│   ├── CourseID (PK)
│   ├── CourseName
│   ├── DepartmentID (FK)
│   └── Credits
│
├── 👨‍🏫 Instructors
│   ├── InstructorID (PK)
│   ├── FirstName
│   ├── LastName
│   ├── Email (UNIQUE)
│   └── DepartmentID (FK)
│
├── 🎓 Students
│   ├── StudentID (PK)
│   ├── FirstName
│   ├── LastName
│   ├── Email
│   ├── BirthDate
│   └── EnrollmentDate
│
└── 📝 Enrollments
    ├── EnrollmentID (PK)
    ├── StudentID (FK)
    ├── CourseID (FK)
    └── EnrollmentDate
```

---

# 🔗 Relationships

```text
Departments
    │
    ├────────────── 1 : N ────────────── Courses
    │
    └────────────── 1 : N ────────────── Instructors


Students
    │
    │ 1
    ▼
Enrollments
    │
    │ N
    ▼
Courses
```

### Relationships implemented

**Departments → Courses**

```text
Departments.DepartmentID
        ↓
Courses.DepartmentID
```

**Departments → Instructors**

```text
Departments.DepartmentID
        ↓
Instructors.DepartmentID
```

**Students → Enrollments**

The `Enrollments` table uses a composite foreign key:

```text
(StudentID, EnrollmentDate)
        ↓
Students(StudentID, EnrollmentDate)
```

with:

```sql
ON DELETE CASCADE
```

**Courses → Enrollments**

```text
Courses.CourseID
        ↓
Enrollments.CourseID
```

---

# 🔄 Project Workflow

```text
                    🚀 Project Start
                          │
                          ▼
              ┌────────────────────────┐
              │ Create Database         │
              │ University_Course_...   │
              └───────────┬────────────┘
                          │
                          ▼
              ┌────────────────────────┐
              │ Create 5 Tables         │
              │ Departments             │
              │ Courses                 │
              │ Instructors             │
              │ Students                │
              │ Enrollments             │
              └───────────┬────────────┘
                          │
                          ▼
              ┌────────────────────────┐
              │ Insert Sample Data      │
              │ 4 Departments           │
              │ 25 Courses              │
              │ 20 Instructors          │
              │ 20 Students             │
              │ 35 Enrollments          │
              └───────────┬────────────┘
                          │
                          ▼
              ┌────────────────────────┐
              │ SQL Analysis            │
              └───────────┬────────────┘
                          │
             ┌────────────┼─────────────┐
             ▼            ▼             ▼
          🔗 JOINs    🧠 Subquery    📊 Aggregation
             │            │             │
             └────────────┼─────────────┘
                          ▼
              ┌────────────────────────┐
              │ Advanced SQL            │
              │ Date Functions          │
              │ String Functions        │
              │ Window Functions        │
              │ CASE Expressions        │
              └───────────┬────────────┘
                          │
                          ▼
                   💡 Academic Insights
```

---

# 📥 Part A — Database & Data Input

## 📝 1. Database Creation

The project starts by creating the database:

```sql
CREATE DATABASE University_Course_Management_System;

USE University_Course_Management_System;
```

---

## 🗂️ 2. Database Tables

The project contains **5 relational tables**.

| Table             | Records | Purpose                           |
| ----------------- | ------: | --------------------------------- |
| 🏢 Departments    |       4 | University department information |
| 📚 Courses        |      25 | Academic course information       |
| 👨‍🏫 Instructors |      20 | Faculty information               |
| 🎓 Students       |      20 | Student information               |
| 📝 Enrollments    |      35 | Student-course relationships      |

---

## 🏢 3. Departments Table

The `Departments` table stores university departments.

### Columns

```text
DepartmentID
DepartmentName
```

`DepartmentID` is:

```text
PRIMARY KEY
AUTO_INCREMENT
```

### Departments

| ID | Department       |
| -: | ---------------- |
|  1 | Computer Science |
|  2 | Mathematics      |
|  3 | Commerce         |
|  4 | Diploma          |

---

## 📚 4. Courses Table

The `Courses` table stores academic course information.

```text
Courses
├── CourseID
├── CourseName
├── DepartmentID
└── Credits
```

`DepartmentID` is a Foreign Key referencing:

```text
Departments.DepartmentID
```

### Course Examples

* Introduction to SQL
* Data Structures
* Civil Engineering
* Machine Learning
* Accounting
* Calculus
* Marketing
* Electrical Engineering
* Artificial Intelligence
* Diploma In IT
* Linear Algebra
* Web Development
* Economics
* Finance
* Probability
* Business Management
* Statistics
* Discrete Mathematics
* Cyber Security
* Software Engineering
* Computer Engineering
* Operating System
* Geometry
* Data Science
* Mobile Application Development

**Total Courses: 25**

---

## 👨‍🏫 5. Instructors Table

The `Instructors` table stores faculty information.

```text
Instructors
├── InstructorID
├── FirstName
├── LastName
├── Email
└── DepartmentID
```

The instructor email has a `UNIQUE` constraint:

```sql
Email VARCHAR(50) UNIQUE
```

This helps prevent duplicate instructor email addresses.

**Total Instructors: 20**

---

## 🎓 6. Students Table

The `Students` table stores student information.

```text
Students
├── StudentID
├── FirstName
├── LastName
├── Email
├── BirthDate
└── EnrollmentDate
```

The table contains:

**20 students**

Enrollment years range from:

```text
2021 → 2026
```

A composite unique constraint is also defined:

```sql
UNIQUE(StudentID, EnrollmentDate)
```

This supports the composite foreign-key relationship used by the `Enrollments` table.

---

## 📝 7. Enrollments Table

The `Enrollments` table connects students with courses.

```text
Enrollments
├── EnrollmentID
├── StudentID
├── CourseID
└── EnrollmentDate
```

The table contains:

**35 enrollment records**

Relationships:

```text
Students
    ↓
Enrollments
    ↓
Courses
```

The student relationship uses:

```sql
ON DELETE CASCADE
```

---

# 📊 Part B — Academic Data Analysis

## 🛠️ 1. Data Insertion & Retrieval

The SQL file demonstrates data insertion using:

```sql
INSERT INTO ...
```

and data retrieval using:

```sql
SELECT ...
```

Data is inserted into all five tables:

* Departments
* Courses
* Instructors
* Students
* Enrollments

The SQL file also uses `SELECT` queries to verify inserted records.

> **Note:** The current SQL file demonstrates INSERT and SELECT operations. Explicit UPDATE and DELETE analysis queries are not included.

---

# 📅 2. Students Enrolled After 2022

### Query

```sql
SELECT *
FROM Students
WHERE YEAR(EnrollmentDate) > 2022;
```

### Result

**10 students** were enrolled after 2022.

Enrollment years included:

```text
2023
2024
2025
2026
```

This demonstrates the use of the `YEAR()` date function with filtering.

---

# 📚 3. Mathematics Department Courses

An `INNER JOIN` is used to retrieve courses belonging to the Mathematics department.

```sql
SELECT c.CourseID,
       d.DepartmentName,
       c.CourseName
FROM Courses c
INNER JOIN Departments d
ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;
```

### Result

| Course ID | Department  | Course          |
| --------: | ----------- | --------------- |
|       102 | Mathematics | Data Structures |
|       106 | Mathematics | Calculus        |
|       111 | Mathematics | Linear Algebra  |
|       115 | Mathematics | Probability     |
|       117 | Mathematics | Statistics      |

---

# 📊 4. Courses With More Than 5 Students

`GROUP BY` and `HAVING` are used to identify courses with more than five students.

```sql
SELECT c1.CourseName,
       COUNT(DISTINCT e1.StudentID) AS Number_Of_Student
FROM Enrollments e1
INNER JOIN Courses c1
ON e1.CourseID = c1.CourseID
GROUP BY c1.CourseName
HAVING Number_Of_Student > 5;
```

### Result

| Course              | Students |
| ------------------- | -------: |
| Data Structures     |        6 |
| Introduction to SQL |        8 |
| Machine Learning    |       11 |

The current dataset contains **3 courses with more than 5 students**.

---

# 🔗 5. Students Enrolled in Both SQL & Data Structures

The query identifies students enrolled in both:

* Introduction to SQL
* Data Structures

```sql
WHERE CourseID IN (101,102)
GROUP BY StudentID, FirstName
HAVING COUNT(DISTINCT CourseID) = 2;
```

### Result

**5 students**:

| Student ID | Student |
| ---------: | ------- |
|          2 | Jane    |
|          3 | Arjun   |
|          8 | Kavya   |
|         14 | Sneha   |
|         19 | Akash   |

This demonstrates `GROUP BY`, `HAVING`, and `COUNT(DISTINCT ...)`.

---

# 🔍 6. Students Enrolled in SQL or Data Structures

The query retrieves students enrolled in either:

```text
Introduction to SQL
OR
Data Structures
```

### Result

**9 students**:

| Student ID | Student |
| ---------: | ------- |
|          1 | John    |
|          2 | Jane    |
|          3 | Arjun   |
|          6 | Anjali  |
|          8 | Kavya   |
|         11 | Dhruv   |
|         14 | Sneha   |
|         19 | Akash   |
|         20 | Tanya   |

---

# 📊 7. Average Course Credits

The average number of credits across all courses is calculated using `AVG()`.

```sql
SELECT AVG(Credits) AS average_Credits_overAll
FROM Courses;
```

### Result

```text
Average Course Credits = 3.2800
```

This demonstrates aggregate analysis using `AVG()`.

---

# 👨‍🏫 8. Computer Science Instructor Count

The project calculates the number of instructors belonging to Computer Science.

```sql
SELECT d1.DepartmentName,
       COUNT(*) AS Number_Of_instructors
FROM Instructors i1
INNER JOIN Departments d1
ON i1.DepartmentID = d1.DepartmentID
WHERE d1.DepartmentName = 'Computer Science';
```

### Result

```text
Computer Science Instructors = 4
```

---

# 🏢 9. Students Enrolled in Each Department

The project counts distinct students enrolled in courses belonging to each department.

```sql
COUNT(DISTINCT e1.StudentID)
```

### Result

| Department       | Students |
| ---------------- | -------: |
| Computer Science |       17 |
| Mathematics      |        7 |
| Commerce         |        3 |
| Diploma          |        3 |

This query demonstrates:

* Multiple `INNER JOIN`s
* `COUNT(DISTINCT ...)`
* `GROUP BY`

---

# 🔗 10. INNER JOIN — Students & Courses

The project uses an `INNER JOIN` to retrieve students and their corresponding courses.

```sql
SELECT e1.StudentID,
       c1.CourseID,
       c1.CourseName,
       c1.DepartmentID,
       c1.Credits
FROM Enrollments e1
INNER JOIN Courses c1
ON e1.CourseID = c1.CourseID
ORDER BY e1.StudentID;
```

### Result

The query returns:

```text
35 student-course relationships
```

This demonstrates how related records are retrieved using Foreign Keys.

---

# 🔗 11. LEFT JOIN — All Students & Courses

A `LEFT JOIN` retrieves all students along with their corresponding courses.

```sql
SELECT s1.StudentID,
       s1.FirstName,
       s1.LastName,
       s1.Email,
       c1.CourseName
FROM Students s1
LEFT JOIN Enrollments e1
ON s1.StudentID = e1.StudentID
LEFT JOIN Courses c1
ON e1.CourseID = c1.CourseID
ORDER BY s1.StudentID;
```

### JOIN Concept

```text
INNER JOIN
→ Matching records only

LEFT JOIN
→ All records from the left table
  + matching records from the right table
```

This is useful for identifying students and their course enrollments while retaining students even when no matching course exists.

---

# 🧠 12. Subquery — Students in Highly Enrolled Courses

A subquery identifies courses having more than **10 students**.

```sql
SELECT CourseID,
       COUNT(EnrollmentID) AS Number_Of_Student
FROM Enrollments
GROUP BY CourseID
HAVING Number_Of_Student > 10;
```

The outer query retrieves students enrolled in those courses.

### Result

The query identifies:

```text
Machine Learning
```

with:

```text
11 students
```

### Students Identified

| Student ID | Student       | Course           |
| ---------: | ------------- | ---------------- |
|          3 | Arjun Patel   | Machine Learning |
|          4 | Meera Shah    | Machine Learning |
|          5 | Vivek Joshi   | Machine Learning |
|          6 | Anjali Desai  | Machine Learning |
|          7 | Rohan Mehta   | Machine Learning |
|          8 | Kavya Trivedi | Machine Learning |
|          9 | Yash Sharma   | Machine Learning |
|         10 | Pooja Patel   | Machine Learning |
|         11 | Dhruv Desai   | Machine Learning |
|         12 | Nisha Mehta   | Machine Learning |
|         13 | Jay Joshi     | Machine Learning |

---

# 📅 13. Enrollment Year Extraction

The `YEAR()` function extracts the year from `EnrollmentDate`.

```sql
SELECT EnrollmentDate,
       YEAR(EnrollmentDate) AS year_of_Enrollment
FROM Students;
```

### Enrollment Year Range

```text
2021 → 2026
```

### Distribution

|      Year | Students |
| --------: | -------: |
|      2021 |        5 |
|      2022 |        5 |
|      2023 |        2 |
|      2024 |        3 |
|      2025 |        2 |
|      2026 |        3 |
| **Total** |   **20** |

---

# 🔤 14. Instructor Full Name

The `CONCAT()` function combines first and last names.

```sql
SELECT FirstName,
       LastName,
       CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;
```

### Example

```text
Alice Johnson
Bob Lee
Arjun Patel
Meera Shah
Vivek Joshi
```

This demonstrates SQL string transformation.

---

# 📈 15. Running Total of Course Enrollments

A Window Function is used to calculate cumulative course enrollment.

```sql
SUM(Enrollments_Student)
OVER(
    ORDER BY Enrollments_Student
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
)
```

### Result

| Course                         | Enrollments | Running Total |
| ------------------------------ | ----------: | ------------: |
| Accounting                     |           1 |             1 |
| Linear Algebra                 |           1 |             2 |
| Civil Engineering              |           1 |             3 |
| Artificial Intelligence        |           1 |             4 |
| Diploma In IT                  |           2 |             6 |
| Finance                        |           2 |             8 |
| Mobile Application Development |           2 |            10 |
| Data Structures                |           6 |            16 |
| Introduction to SQL            |           8 |            24 |
| Machine Learning               |          11 |            35 |

### Final Running Total

```text
Total Course Enrollments = 35
```

This demonstrates how a Window Function can calculate cumulative values across grouped course-level results.

---

# 🏷️ 16. Student Senior / Junior Classification

A `CASE` expression classifies students based on their enrollment date.

```sql
CASE
    WHEN EnrollmentDate <
         DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
    THEN 'Senior'
    ELSE 'Junior'
END
```

### Classification Rule

| Condition                          | Status |
| ---------------------------------- | ------ |
| Enrollment more than 4 years ago   | Senior |
| Enrollment within the last 4 years | Junior |

Because the query uses:

```sql
CURDATE()
```

the classification automatically changes as the current date changes.

### Current Dataset Result

Based on the SQL execution date shown in the project:

```text
Senior = 10 students
Junior = 10 students
```

---

# 🛠️ SQL Concepts Used

| SQL Concept       | Purpose                          |
| ----------------- | -------------------------------- |
| `CREATE DATABASE` | Creates the database             |
| `CREATE TABLE`    | Creates relational tables        |
| `PRIMARY KEY`     | Unique record identification     |
| `FOREIGN KEY`     | Maintains relationships          |
| `AUTO_INCREMENT`  | Automatically generates IDs      |
| `UNIQUE`          | Prevents duplicate values        |
| `INSERT INTO`     | Adds records                     |
| `SELECT`          | Retrieves records                |
| `WHERE`           | Filters records                  |
| `INNER JOIN`      | Retrieves matching records       |
| `LEFT JOIN`       | Preserves all left-table records |
| `COUNT()`         | Counts records                   |
| `COUNT(DISTINCT)` | Counts unique students           |
| `AVG()`           | Calculates average               |
| `GROUP BY`        | Groups records                   |
| `HAVING`          | Filters grouped results          |
| Subquery          | Performs nested analysis         |
| `YEAR()`          | Extracts year from date          |
| `CURDATE()`       | Gets current date                |
| `DATE_SUB()`      | Performs date calculation        |
| `CONCAT()`        | Combines text values             |
| `CASE`            | Conditional classification       |
| Window Function   | Performs cumulative analysis     |
| `SUM() OVER()`    | Calculates running totals        |

---

# 📈 Results & Insights

After executing the SQL queries, the project produces the following insights.

## 🎓 Student Insights

* 👤 **20 total students**
* 📅 Enrollment years range from **2021 to 2026**
* 📅 **10 students** enrolled after 2022
* 📝 **35 enrollment records**
* 🏷️ Current Senior/Junior classification = **10 / 10**

---

## 📚 Course Insights

* 📚 **25 total courses**
* 📊 Average course credits = **3.28**
* 🏆 Machine Learning = **11 students**
* 📈 Introduction to SQL = **8 students**
* 📊 Data Structures = **6 students**
* 🔎 **3 courses** have more than 5 students
* 🧠 Machine Learning is the only course with more than 10 students in the current dataset

---

## 🏢 Department Insights

| Department       | Students Enrolled |
| ---------------- | ----------------: |
| Computer Science |                17 |
| Mathematics      |                 7 |
| Commerce         |                 3 |
| Diploma          |                 3 |

> Students are counted distinctly within each department based on their course enrollments.

---

## 👨‍🏫 Instructor Insights

* 👨‍🏫 **20 instructors**
* 💻 **4 instructors** belong to Computer Science
* 🔗 Instructors are connected to departments through Foreign Keys
* 🔒 Instructor emails use a `UNIQUE` constraint

---

## 📈 Advanced SQL Insights

* Total enrollment records = **35**
* Running total reaches **35**
* Machine Learning has **11 enrollments**
* Subquery identifies students enrolled in courses with more than 10 students
* Window Function calculates cumulative course enrollments
* `CASE` dynamically classifies students based on enrollment age
* `COUNT(DISTINCT StudentID)` is used for unique student-level department analysis

---

# 🔍 Data Quality & Design Notes

The project demonstrates several relational database design practices.

### 🔐 Primary Keys

Each main entity has a Primary Key:

```text
Departments.DepartmentID
Courses.CourseID
Instructors.InstructorID
Students.StudentID
Enrollments.EnrollmentID
```

### 🔗 Foreign Keys

Foreign Keys connect:

```text
Courses → Departments
Instructors → Departments
Enrollments → Students
Enrollments → Courses
```

### 🔒 Unique Constraint

Instructor emails are unique:

```sql
Email VARCHAR(50) UNIQUE
```

### 🧩 Composite Unique Constraint

Students contain:

```sql
UNIQUE(StudentID, EnrollmentDate)
```

This allows the corresponding composite Foreign Key in `Enrollments`.

### 🗑️ Cascading Delete

The student relationship in `Enrollments` uses:

```sql
ON DELETE CASCADE
```

Therefore, deleting a referenced student record can automatically remove its related enrollment records.

### 📊 Distinct Student Counting

Department-level analysis uses:

```sql
COUNT(DISTINCT StudentID)
```

to avoid counting the same student multiple times within a department.

### 📅 Dynamic Classification

The Senior/Junior query uses:

```sql
CURDATE()
```

so the result can change automatically as time passes.

---

# 🏆 Advantages

| Advantage                 | Description                                     |
| ------------------------- | ----------------------------------------------- |
| 🎓 **Academic Use Case**  | Represents a realistic university database      |
| 🗄️ **Relational Design** | Uses five connected tables                      |
| 🔐 **Data Integrity**     | Uses Primary Keys and Foreign Keys              |
| 🔒 **Constraints**        | Uses UNIQUE and composite constraints           |
| 🔗 **JOIN Practice**      | Demonstrates INNER and LEFT JOIN                |
| 🧠 **Analytical SQL**     | Uses subqueries and aggregate functions         |
| 📊 **Grouped Analysis**   | Uses GROUP BY and HAVING                        |
| 📅 **Date Analysis**      | Performs enrollment-year analysis               |
| 🔤 **String Processing**  | Uses CONCAT()                                   |
| 📈 **Advanced SQL**       | Uses Window Functions                           |
| 🏷️ **Conditional Logic** | Uses CASE expressions                           |
| 📚 **Portfolio Ready**    | Demonstrates practical MySQL skills             |
| 🚀 **Extensible**         | Can be expanded with CTEs, Views and Dashboards |

---

# 🔮 Future Improvements

The project can be extended with:

* ➕ Add `UPDATE` operations
* 🗑️ Add `DELETE` operations
* 🔗 Add `RIGHT JOIN`
* 🔗 Simulate Full Outer Join using `UNION`
* 🧠 Add Common Table Expressions (**CTEs**)
* 📊 Add `ROW_NUMBER()`
* 📊 Add `RANK()`
* 📊 Add `DENSE_RANK()`
* 📈 Add advanced Window Functions
* 👁️ Create SQL Views
* ⚡ Add indexes
* 🔍 Analyze execution plans
* ⚙️ Add stored procedures
* 🎓 Add student GPA calculation
* 📅 Add semester-wise enrollment analysis
* 🏢 Add department-wise course analysis
* 👨‍🏫 Add instructor-course assignments
* 📊 Add student grades and performance
* 📊 Connect MySQL with Power BI
* 📈 Build an interactive University Analytics Dashboard

---

# ▶️ How to Run

## 1️⃣ Open MySQL Command Line

Open the MySQL Command Line Client or MySQL terminal.

---

## 2️⃣ Create the Database

Run:

```sql
CREATE DATABASE University_Course_Management_System;
```

---

## 3️⃣ Select the Database

```sql
USE University_Course_Management_System;
```

---

## 4️⃣ Run the SQL File

From the terminal:

```bash
mysql -u root -p < University_Course_Management_System.sql
```

Enter your MySQL password when prompted.

---

## 5️⃣ Verify the Tables

Run:

```sql
SHOW TABLES;
```

Expected tables:

```text
Courses
Departments
Enrollments
Instructors
Students
```

---

## 6️⃣ Verify Record Counts

You can verify the dataset using:

```sql
SELECT COUNT(*) FROM Departments;
SELECT COUNT(*) FROM Courses;
SELECT COUNT(*) FROM Instructors;
SELECT COUNT(*) FROM Students;
SELECT COUNT(*) FROM Enrollments;
```

Expected totals:

```text
Departments  = 4
Courses      = 25
Instructors  = 20
Students     = 20
Enrollments  = 35
```

---

## 7️⃣ Execute Analysis Queries

Run the analysis queries from the SQL file to reproduce the academic results and insights documented in this README.

---

# 👤 Author

<div align="center">

### **Himanshi Sangani**

🎓 **Bachelor of Computer Application**

> *"Learning SQL today, building data-driven solutions tomorrow."*

</div>

---

# 🙏 Acknowledgements

Special thanks to the learning resources and communities that support SQL and data-analysis learning:

* 📚 **MySQL Documentation** — SQL syntax and database concepts
* 💻 **SQL Learning Platforms** — Query practice and problem solving
* 📖 **Data Analytics Communities** — Practical SQL concepts
* 🧪 **Hands-on Practice** — Academic database design and analysis

---


