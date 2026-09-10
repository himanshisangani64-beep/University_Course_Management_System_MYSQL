# 🎓 University Course Management System

> A MySQL-based relational database project for managing and analyzing **departments, courses, instructors, students, and enrollments** using practical SQL queries.

---

## 📌 Overview

The **University Course Management System** is a relational database project built with **MySQL**.

The project is designed to manage university academic data and perform practical SQL analysis across five main tables:

* **Departments**
* **Courses**
* **Instructors**
* **Students**
* **Enrollments**

It  how relational databases can be used to organize academic information and answer real-world university management questions.

---

## 🎯 Problem Statement

Universities need structured systems to manage information about departments, courses, instructors, students, and course enrollments.

This project uses SQL to answer practical questions such as:

* Which students enrolled after 2022?
* Which courses are offered by the Mathematics department?
* How many students are enrolled in each course?
* Which students are enrolled in both SQL and Data Structures?
* Which students are enrolled in either SQL or Data Structures?
* What is the average number of credits across all courses?
* How many instructors belong to the Computer Science department?
* How many students are enrolled in each department?
* Which courses have more than 10 students?
* How can student enrollment status be classified based on enrollment year?

---

## 🎯 Objective

The main objective is to build a relational university database and use SQL to perform practical academic data analysis.

The project focuses on:

* Database and table creation
* Primary and foreign key relationships
* CRUD operations
* Data retrieval and filtering
* Aggregate functions
* GROUP BY and HAVING
* INNER JOIN and LEFT JOIN
* Subqueries
* Date functions
* String functions
* Window functions and running totals
* Conditional logic using CASE
* Student enrollment analysis

---

## 📝 Assumptions

* Each department has a unique `DepartmentID`.
* Each course has a unique `CourseID`.
* Each instructor has a unique `InstructorID`.
* Each student has a unique `StudentID`.
* Instructor email addresses are unique.
* Courses and instructors belong to existing departments.
* Enrollments are associated with existing students and courses.
* A student can enroll in multiple courses.
* A course can have multiple students.
* A student may have multiple enrollment records.
* Student status is classified based on the enrollment date and a four-year threshold.

---

## 🗄️ Database Tables

### Departments

Stores information about university departments.

| Column           | Description                           |
| ---------------- | ------------------------------------- |
| `DepartmentID`   | Unique identifier for each department |
| `DepartmentName` | Name of the department                |

---

### Courses

Stores information about courses offered by different departments.

| Column         | Description                              |
| -------------- | ---------------------------------------- |
| `CourseID`     | Unique identifier for each course        |
| `CourseName`   | Name of the course                       |
| `DepartmentID` | Department offering the course           |
| `Credits`      | Number of credits assigned to the course |

---

### Instructors

Stores instructor information and their department assignments.

| Column         | Description                               |
| -------------- | ----------------------------------------- |
| `InstructorID` | Unique identifier for each instructor     |
| `FirstName`    | Instructor's first name                   |
| `LastName`     | Instructor's last name                    |
| `Email`        | Unique instructor email                   |
| `DepartmentID` | Department associated with the instructor |

---

### Students

Stores student personal and enrollment information.

| Column           | Description                        |
| ---------------- | ---------------------------------- |
| `StudentID`      | Unique identifier for each student |
| `FirstName`      | Student's first name               |
| `LastName`       | Student's last name                |
| `Email`          | Student email address              |
| `BirthDate`      | Student's date of birth            |
| `EnrollmentDate` | Date when the student enrolled     |


---

### Enrollments

Stores the relationship between students and courses.

| Column           | Description                           |
| ---------------- | ------------------------------------- |
| `EnrollmentID`   | Unique identifier for each enrollment |
| `StudentID`      | Identifies the enrolled student       |
| `CourseID`       | Identifies the selected course        |
| `EnrollmentDate` | Date of course enrollment             |



---

## 🛠️ Tools & Technologies

* **MySQL**
* **MySQL Command Line**
* **SQL**
* Relational Database Concepts

---

## 💡 Key Insights

The analysis queries generated several useful academic insights:

* **Machine Learning** has the highest number of enrollments among the analyzed courses, with **11 students**.
* **Introduction to SQL** has **8 students** enrolled.
* **Data Structures** has **6 students** enrolled.
* Students enrolled in both **Introduction to SQL** and **Data Structures** were identified.
* Students enrolled in either **Introduction to SQL** or **Data Structures** were identified.
* The average number of credits across all courses is **3.28**.
* The Computer Science department has **4 instructors**.
* Students were analyzed by department based on their course enrollments.
* A running total of course enrollments was calculated using a window function.
* Students were classified as **Senior** or **Junior** based on their enrollment date.

---

## ▶️ How to Clone and Run

### 1. Clone the Repository

```bash
git clone https://github.com/himanshisangani64-beep/university-course-management-system.git
```

### 2. Open the Project

```bash
cd university-course-management-system
```

### 3. Open MySQL

Open **MySQL Command Line Client** and execute the SQL script.

### 4. Run the SQL Script

Execute the statements in this order:

```text
1. Create Database
2. Select Database
3. Create Departments Table
4. Create Courses Table
5. Create Instructors Table
6. Create Students Table
7. Create Enrollments Table
8. Insert Department Data
9. Insert Course Data
10. Insert Instructor Data
11. Insert Student Data
12. Insert Enrollment Data
13. Run Analysis Queries
```

### 5. Verify the Tables

```sql
SHOW TABLES;

SELECT * FROM Departments;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Students;
SELECT * FROM Enrollments;
```
---

## 🏁 Conclusion

Overall, the project demonstrates how SQL transforms structured university data into actionable insights that can support academic planning, course management, student analysis, and data-driven decision-making.

---

## 🚀 Future Scope

* Add grades and GPA analysis.
* Perform advanced student performance analysis.
* Connect the database with **Power BI** for interactive academic dashboards.
* Connect the database with **Excel** for reporting.
* Automate university reporting and analytics.

---

## 👩‍💻 Author

### **Himanshi Sangani**

