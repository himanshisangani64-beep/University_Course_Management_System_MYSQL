-- Create Database
create database University_Course_Management_System;
-- OutPut
Query OK, 1 row affected (0.01 sec)


-- Select Database
use University_Course_Management_System;
-- OutPut
Database changed


-- Create Departments Table
create Table Departments (
    DepartmentID int Primary key auto_increment,
    DepartmentName varchar(30)
);

-- OutPut
Query OK, 0 rows affected


-- Create Courses Table 
Create Table Courses (
    CourseID int Primary key auto_increment,
    CourseName varchar(50),
    DepartmentID int,
    Credits int,
    foreign key (DepartmentID) references Departments(DepartmentID)
);
-- OutPut
Query OK, 0 rows affected 


-- Create Instructors Table
Create Table Instructors (
    InstructorID int Primary key auto_increment,
    FirstName varchar(30),
    LastName  varchar(30),
    Email varchar(50) unique,
    DepartmentID int,
    foreign key (DepartmentID) references Departments(DepartmentID)
);
-- OutPut
Query OK, 0 rows affected 


-- Create Students Table
create Table Students (
    StudentID int Primary key , 
    FirstName varchar(30),
    LastName varchar(30),
    Email varchar(30) , 
    BirthDate date,
    EnrollmentDate date ,
    unique(StudentID , EnrollmentDate)
);
-- OutPut
Query OK, 0 rows affected



-- Create Enrollments Table
create Table Enrollments (
    EnrollmentID int Primary key,
    StudentID int,
    CourseID int,
    EnrollmentDate date,
    foreign key (StudentID,EnrollmentDate) references Students(StudentID,EnrollmentDate) on delete cascade, 
    foreign key (CourseID) references Courses(CourseID)
); 
-- OutPut
Query OK, 0 rows affected



-- 1) Perform CRUD Operations on all tables

-- Insert Data into Departments Table

Insert into Departments (DepartmentName) values
('Computer Science'),
('Mathematics'),
('Commerce'),
('Diploma');

-- OutPut
Query OK, 4 rows affected 
Records: 4  Duplicates: 0  Warnings: 0


-- read Data
Select * from Departments;
-- OutPut
+--------------+------------------+
| DepartmentID | DepartmentName   |
+--------------+------------------+
|            1 | Computer Science |
|            2 | Mathematics      |
|            3 | Commerce         |
|            4 | Diploma          |
+--------------+------------------+
4 rows in set (0.00 sec)


-- Insert Data into Courses Table

Insert into Courses(CourseID,CourseName,DepartmentID,Credits)
values(101,'Introduction to SQL',1,3),
(102,'Data Structures',2,4);

-- OutPut
Query OK, 2 rows affected 
Records: 2  Duplicates: 0  Warnings: 0

Insert into Courses (CourseName,DepartmentID,Credits)
values('Civil Engineering',4,5),
('Machine Learning',1,5),
('Accounting',3,3),
('Calculus',2,1),
('Marketing',3,2),
('Electrical Enginnering',4,3),
('Artificial Intelligence',1,5),
('Diploma In IT',4,4),
('Linear Algebra',2,4),
('Web Development',1,2),
('Economics',3,1),
('Finance',3,2),
('Probability',2,3),
('Business Management',3,4),
('Statistics',2,4),
('Discrete Mathematics',2,2),
('Cyber Security',1,5),
('Software Engineering',1,3),
('Computer Engineering',4,3),
('Operating System',1,2),
('Geometry',2,3),
('Data Science',1,5),
('Mobile Application Development',1,4);

-- OutPut
Query OK, 23 rows affected 
Records: 23  Duplicates: 0  Warnings 0

-- Read Data
Select * from Courses limit 5;
--OutPut
+----------+---------------------+--------------+---------+
| CourseID | CourseName          | DepartmentID | Credits |
+----------+---------------------+--------------+---------+
|      101 | Introduction to SQL |            1 |       3 |
|      102 | Data Structures     |            2 |       4 |
|      103 | Civil Enginnering   |            4 |       5 |
|      104 | Machine Learning    |            1 |       5 |
|      105 | Accounting          |            3 |       3 |
+----------+---------------------+--------------+---------+
5 rows in set (0.00 sec)


-- Insert Data into Instructors Table

Insert into Instructors(FirstName,LastName,Email,DepartmentID)
values('Alice','Johnson','alice.johnson@univ.com',1),
('Bob','Lee','bob.lee@univ.com',2),
('Arjun','Patel','arjun.patel@univ.com',3),
('Meera','Shah','meera.shah@univ.com',4),
('Vivek','Joshi','vivek.joshi@univ.com',3),
('Anjali','Desai','anjali.desai@univ.com',2),
('Rohan','Mehta','rohan.mehta@univ.com',1),
('Kavya','Trivedi','kavya.trivedi@univ.com',4),
('Yash','Sharma','yash.sharma@univ.com',3),
('Pooja','Patel','pooja.patel@univ.com',2),
('Dhruv','Desai','dhruv.desai@univ.com',1),
('Nisha','Mehta','nisha.mehta@univ.com',2),
('Jay','Joshi','jay.joshi@univ.com',3),
('Sneha','Shah','sneha.shah@univ.com',2),
('Harsh','Patel','harsh.patel@univ.com',2),
('Isha','Trivedi','isha.trivedi@univ.com',4),
('Dev','Sharma','dev.sharma@univ.com',1),
('Mansi','Desai','mansi.desai@univ.com',2),
('Akash','Mehta','akash.mehta@univ.com',3),
('Riya','Patel','riya.patel@univ.com',4);

-- OutPut
Query OK, 20 rows affected 
Records: 20  Duplicates: 0  Warnings: 0 

-- Read Data
Select * from Instructors limit 5;
-- OutPut
+--------------+-----------+----------+------------------------+--------------+
| InstructorID | FirstName | LastName | Email                  | DepartmentID |
+--------------+-----------+----------+------------------------+--------------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 |
|            3 | Arjun     | Patel    | arjun.patel@univ.com   |            3 |
|            4 | Meera     | Shah     | meera.shah@univ.com    |            4 |
|            5 | Vivek     | Joshi    | vivek.joshi@univ.com   |            3 |
+--------------+-----------+----------+------------------------+--------------+
5 rows in set (0.00 sec)


-- Insert Data into Students Table

Insert into Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
values
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Arjun', 'Patel', 'arjun.patel@email.com', '2001-03-12', '2021-07-15'),
(4, 'Meera', 'Shah', 'meera.shah@email.com', '2000-09-20', '2021-08-10'),
(5, 'Vivek', 'Joshi', 'vivek.joshi@email.com', '1999-11-05', '2021-09-01'),
(6, 'Anjali', 'Desai', 'anjali.desai@email.com', '2001-06-18', '2021-08-20'),
(7, 'Rohan', 'Mehta', 'rohan.mehta@email.com', '2000-12-10', '2022-07-05'),
(8, 'Kavya', 'Trivedi', 'kavya.trivedi@email.com', '1999-02-14', '2022-08-12'),
(9, 'Yash', 'Sharma', 'yash.sharma@email.com', '2001-10-22', '2022-09-01'),
(10, 'Pooja', 'Patel', 'pooja.patel@email.com', '2000-04-08', '2022-07-20'),
(11, 'Dhruv', 'Desai', 'dhruv.desai@email.com', '1999-07-16', '2023-08-01'),
(12, 'Nisha', 'Mehta', 'nisha.mehta@email.com', '2001-01-30', '2023-08-15'),
(13, 'Jay', 'Joshi', 'jay.joshi@email.com', '2000-05-19', '2024-07-10'),
(14, 'Sneha', 'Shah', 'sneha.shah@email.com', '1999-09-27', '2024-08-05'),
(15, 'Harsh', 'Patel', 'harsh.patel@email.com', '2001-12-03', '2024-08-20'),
(16, 'Isha', 'Trivedi', 'isha.trivedi@email.com', '2000-02-11', '2025-07-15'),
(17, 'Dev', 'Sharma', 'dev.sharma@email.com', '1999-06-24', '2025-08-01'),
(18, 'Mansi', 'Desai', 'mansi.desai@email.com', '2001-04-17', '2026-07-10'),
(19, 'Akash', 'Mehta', 'akash.mehta@email.com', '2000-10-09', '2026-08-01'),
(20, 'Tanya', 'Patel', 'tanya.patel@email.com', '1999-12-21', '2026-08-15');

-- OutPut
Query OK, 20 rows affected 
Records: 20  Duplicates: 0  Warnings: 0

-- Read Data
Select * from Students limit 5;
-- OutPut
+-----------+-----------+----------+-----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                 | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+-----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com    | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com  | 1999-05-25 | 2021-08-01     |
|         3 | Arjun     | Patel    | arjun.patel@email.com | 2001-03-12 | 2021-07-15     |
|         4 | Meera     | Shah     | meera.shah@email.com  | 2000-09-20 | 2021-08-10     |
|         5 | Vivek     | Joshi    | vivek.joshi@email.com | 1999-11-05 | 2021-09-01     |
+-----------+-----------+----------+-----------------------+------------+----------------+
5 rows in set (0.00 sec)


-- Insert Data into Enrollments Table

Insert into Enrollments(EnrollmentID,StudentID,CourseID,EnrollmentDate)
values(1,1,101,'2022-08-01'),
(2,2,102,'2021-08-01'),
(3,3,101,'2021-07-15'),
(4,3,104,'2021-07-15'),
(5,8,101,'2022-08-12'),
(6,6,101,'2021-08-20'),
(7,13,104,'2024-07-10'),
(8,2,101,'2021-08-01'),
(9,20,105,'2026-08-15'),
(10,4,104,'2021-08-10'),
(11,14,102,'2024-08-05'),
(12,5,104,'2021-09-01'),
(13,6,104,'2021-08-20'),
(14,14,101,'2024-08-05'),
(15,11,101,'2023-08-01'),
(16,20,102,'2026-08-15'),
(17,19,110,'2026-08-01'),
(18,7,104,'2022-07-05'),
(19,8,104,'2022-08-12'),
(20,15,114,'2024-08-20'),
(21,9,104,'2022-09-01'),
(22,20,110,'2026-08-15'),
(23,10,104,'2022-07-20'),
(24,5,111,'2021-09-01'),
(25,11,104,'2023-08-01'),
(26,3,102,'2021-07-15'),
(27,16,103,'2025-07-15'),
(28,8,102,'2022-08-12'),
(29,18,125,'2026-07-10'),
(30,12,104,'2023-08-15'),
(31,16,114,'2025-07-15'),
(32,17,125,'2025-08-01'),
(33,14,109,'2024-08-05'),
(34,19,101,'2026-08-01'),
(35,19,102,'2026-08-01');

-- OutPut
Query OK, 35 rows affected 
Records: 35  Duplicates: 0  Warnings: 0 

-- Read Data 
Select * from Enrollments limit 5;
-- OutPut
+--------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         2 |      102 | 2021-08-01     |
|            3 |         3 |      101 | 2021-07-15     |
|            4 |         3 |      104 | 2021-07-15     |
|            5 |         8 |      101 | 2022-08-12     |
+--------------+-----------+----------+----------------+
5 rows in set (0.00 sec)





-- 2) Retrieve Student who enrolled after 2022
Select * from Students where year(EnrollmentDate) > 2022;
-- OutPut
+-----------+-----------+----------+------------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                  | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+------------------------+------------+----------------+
|        11 | Dhruv     | Desai    | dhruv.desai@email.com  | 1999-07-16 | 2023-08-01     |
|        12 | Nisha     | Mehta    | nisha.mehta@email.com  | 2001-01-30 | 2023-08-15     |
|        13 | Jay       | Joshi    | jay.joshi@email.com    | 2000-05-19 | 2024-07-10     |
|        14 | Sneha     | Shah     | sneha.shah@email.com   | 1999-09-27 | 2024-08-05     |
|        15 | Harsh     | Patel    | harsh.patel@email.com  | 2001-12-03 | 2024-08-20     |
|        16 | Isha      | Trivedi  | isha.trivedi@email.com | 2000-02-11 | 2025-07-15     |
|        17 | Dev       | Sharma   | dev.sharma@email.com   | 1999-06-24 | 2025-08-01     |
|        18 | Mansi     | Desai    | mansi.desai@email.com  | 2001-04-17 | 2026-07-10     |
|        19 | Akash     | Mehta    | akash.mehta@email.com  | 2000-10-09 | 2026-08-01     |
|        20 | Tanya     | Patel    | tanya.patel@email.com  | 1999-12-21 | 2026-08-15     |
+-----------+-----------+----------+------------------------+------------+----------------+
10 rows in set (0.00 sec)




-- 3) Retrieve courses offered by the Mathematics department with a limit of 5 course
Select c.CourseID,
       d.DepartmentName,
       c.CourseName 
from Courses  c inner join Departments d 
on c.DepartmentID = d.DepartmentID 
where  d.DepartmentName = "Mathematics" limit 5;
-- OutPut
+----------+----------------+-----------------+
| CourseID | DepartmentName | CourseName      |
+----------+----------------+-----------------+
|      102 | Mathematics    | Data Structures |
|      106 | Mathematics    | Calculus        |
|      111 | Mathematics    | Linear Algebra  |
|      115 | Mathematics    | Probability     |
|      117 | Mathematics    | Statistics      |
+----------+----------------+-----------------+
5 rows in set (0.00 sec)



-- 4) Get the nmmber of students enrolled in each course , filtering for courses with more than 5 students
Select  c1.CourseName , count(distinct(e1.StudentID)) as Number_Of_Student
from Enrollments e1 inner join Courses c1 on 
e1.CourseID = c1.CourseID
group by c1.CourseName 
having  Number_Of_Student > 5;
-- OutPut
+---------------------+-------------------+
| CourseName          | Number_Of_Student |
+---------------------+-------------------+
| Data Structures     |                 6 |
| Introduction to SQL |                 8 |
| Machine Learning    |                11 |
+---------------------+-------------------+
3 rows in set (0.00 sec)




-- 5) Find students who are enrolled in both introduction to SQL and Data Structures
Select s1.StudentID,
       s1.FirstName 
from Enrollments e1 inner join Students s1 
on e1.StudentID = s1.StudentID 
where CourseID in (101,102)
group by s1.StudentID , s1.FirstName
having count(distinct(CourseID)) = 2;
-- OutPut
+-----------+-----------+
| StudentID | FirstName |
+-----------+-----------+
|         2 | Jane      |
|         3 | Arjun     |
|         8 | Kavya     |
|        14 | Sneha     |
|        19 | Akash     |
+-----------+-----------+
5 rows in set (0.00 sec)



-- 6) Find Student who are either enrolled in introduction to sql or Data Structures
Select s1.StudentID,
       s1.FirstName 
from Enrollments e1 inner join Students s1 
on e1.StudentID = s1.StudentID
 where CourseID  = 101 or CourseID = 102
group by s1.StudentID ,  s1.FirstName
order by s1.StudentID;
-- OutPut
+-----------+-----------+
| StudentID | FirstName |
+-----------+-----------+
|         1 | John      |
|         2 | Jane      |
|         3 | Arjun     |
|         6 | Anjali    |
|         8 | Kavya     |
|        11 | Dhruv     |
|        14 | Sneha     |
|        19 | Akash     |
|        20 | Tanya     |
+-----------+-----------+
9 rows in set (0.00 sec)


-- 7) Calculate the average number of credits for all courses
Select  avg(Credits) as average_Credits_overAll
from Courses;
-- OutPut
+-------------------------+
| average_Credits_overAll |
+-------------------------+
|                  3.2800 |
+-------------------------+
1 row in set (0.00 sec)



-- 8) Count of instructors in the computer science departmenrs 
Select d1.DepartmentName , count(*) as Number_Of_instructors 
from Instructors i1 inner join Departments d1 on 
i1.DepartmentID = d1.DepartmentID 
where d1.DepartmentName = 'Computer Science';
-- output
+------------------+-----------------------+
| DepartmentName   | Number_Of_instructors |
+------------------+-----------------------+
| Computer Science |                     4 |
+------------------+-----------------------+
1 row in set (0.00 sec)



-- 9) Count the number of student enrolled in each department
Select  d1.DepartmentName , Count(distinct(e1.StudentID)) as Number_Of_Student 
from Enrollments e1  inner join  Courses c1 on 
e1.CourseID = c1.CourseID inner join Departments d1 on 
d1.DepartmentID = c1.DepartmentID
group by d1.DepartmentName;
-- output
+------------------+-------------------+
| DepartmentName   | Number_Of_Student |
+------------------+-------------------+
| Commerce         |                 3 |
| Computer Science |                17 |
| Diploma          |                 3 |
| Mathematics      |                 7 |
+------------------+-------------------+
4 rows in set (0.00 sec)




-- 10) INNER JOIN : Retriveve students and their corresponding courses 
Select e1.StudentID , 
       c1.CourseID,
       c1.CourseName,
       c1.DepartmentID , 
       c1.credits from Enrollments e1 inner join  Courses c1 on 
e1.CourseID = c1.CourseID
order by e1.StudentID;
-- OutPut
+-----------+----------+--------------------------------+--------------+---------+
| StudentID | CourseID | CourseName                     | DepartmentID | credits |
+-----------+----------+--------------------------------+--------------+---------+
|         1 |      101 | Introduction to SQL            |            1 |       3 |
|         2 |      101 | Introduction to SQL            |            1 |       3 |
|         2 |      102 | Data Structures                |            2 |       4 |
|         3 |      101 | Introduction to SQL            |            1 |       3 |
|         3 |      102 | Data Structures                |            2 |       4 |
|         3 |      104 | Machine Learning               |            1 |       5 |
|         4 |      104 | Machine Learning               |            1 |       5 |
|         5 |      104 | Machine Learning               |            1 |       5 |
|         5 |      111 | Linear Algebra                 |            2 |       4 |
|         6 |      101 | Introduction to SQL            |            1 |       3 |
|         6 |      104 | Machine Learning               |            1 |       5 |
|         7 |      104 | Machine Learning               |            1 |       5 |
|         8 |      101 | Introduction to SQL            |            1 |       3 |
|         8 |      102 | Data Structures                |            2 |       4 |
|         8 |      104 | Machine Learning               |            1 |       5 |
|         9 |      104 | Machine Learning               |            1 |       5 |
|        10 |      104 | Machine Learning               |            1 |       5 |
|        11 |      101 | Introduction to SQL            |            1 |       3 |
|        11 |      104 | Machine Learning               |            1 |       5 |
|        12 |      104 | Machine Learning               |            1 |       5 |
|        13 |      104 | Machine Learning               |            1 |       5 |
|        14 |      101 | Introduction to SQL            |            1 |       3 |
|        14 |      102 | Data Structures                |            2 |       4 |
|        14 |      109 | Artificial Intelligence        |            1 |       5 |
|        15 |      114 | Finance                        |            3 |       2 |
|        16 |      103 | Civil Engineering              |            4 |       5 |
|        16 |      114 | Finance                        |            3 |       2 |
|        17 |      125 | Mobile Application Development |            1 |       4 |
|        18 |      125 | Mobile Application Development |            1 |       4 |
|        19 |      101 | Introduction to SQL            |            1 |       3 |
|        19 |      102 | Data Structures                |            2 |       4 |
|        19 |      110 | Diploma In IT                  |            4 |       4 |
|        20 |      102 | Data Structures                |            2 |       4 |
|        20 |      105 | Accounting                     |            3 |       3 |
|        20 |      110 | Diploma In IT                  |            4 |       4 |
+-----------+----------+--------------------------------+--------------+---------+
35 rows in set (0.00 sec)




-- 11) LEFT JOIN : Retrieve all student and their corroesponding courses , if any
Select s1.StudentID,
       s1.FirstName,
       s1.LastName,
       s1.Email,
       c1.CourseName  from   Students s1 left join  Enrollments e1
       on s1.StudentID =  e1.StudentID left join Courses c1
on e1.CourseID = c1.CourseID
order by s1.StudentID ;
-- OutPut
+-----------+-----------+----------+-------------------------+--------------------------------+
| StudentID | FirstName | LastName | Email                   | CourseName                     |
+-----------+-----------+----------+-------------------------+--------------------------------+
|         1 | John      | Doe      | john.doe@email.com      | Introduction to SQL            |
|         2 | Jane      | Smith    | jane.smith@email.com    | Data Structures                |
|         2 | Jane      | Smith    | jane.smith@email.com    | Introduction to SQL            |
|         3 | Arjun     | Patel    | arjun.patel@email.com   | Introduction to SQL            |
|         3 | Arjun     | Patel    | arjun.patel@email.com   | Machine Learning               |
|         3 | Arjun     | Patel    | arjun.patel@email.com   | Data Structures                |
|         4 | Meera     | Shah     | meera.shah@email.com    | Machine Learning               |
|         5 | Vivek     | Joshi    | vivek.joshi@email.com   | Machine Learning               |
|         5 | Vivek     | Joshi    | vivek.joshi@email.com   | Linear Algebra                 |
|         6 | Anjali    | Desai    | anjali.desai@email.com  | Introduction to SQL            |
|         6 | Anjali    | Desai    | anjali.desai@email.com  | Machine Learning               |
|         7 | Rohan     | Mehta    | rohan.mehta@email.com   | Machine Learning               |
|         8 | Kavya     | Trivedi  | kavya.trivedi@email.com | Introduction to SQL            |
|         8 | Kavya     | Trivedi  | kavya.trivedi@email.com | Machine Learning               |
|         8 | Kavya     | Trivedi  | kavya.trivedi@email.com | Data Structures                |
|         9 | Yash      | Sharma   | yash.sharma@email.com   | Machine Learning               |
|        10 | Pooja     | Patel    | pooja.patel@email.com   | Machine Learning               |
|        11 | Dhruv     | Desai    | dhruv.desai@email.com   | Introduction to SQL            |
|        11 | Dhruv     | Desai    | dhruv.desai@email.com   | Machine Learning               |
|        12 | Nisha     | Mehta    | nisha.mehta@email.com   | Machine Learning               |
|        13 | Jay       | Joshi    | jay.joshi@email.com     | Machine Learning               |
|        14 | Sneha     | Shah     | sneha.shah@email.com    | Data Structures                |
|        14 | Sneha     | Shah     | sneha.shah@email.com    | Introduction to SQL            |
|        14 | Sneha     | Shah     | sneha.shah@email.com    | Artificial Intelligence        |
|        15 | Harsh     | Patel    | harsh.patel@email.com   | Finance                        |
|        16 | Isha      | Trivedi  | isha.trivedi@email.com  | Civil Engineering              |
|        16 | Isha      | Trivedi  | isha.trivedi@email.com  | Finance                        |
|        17 | Dev       | Sharma   | dev.sharma@email.com    | Mobile Application Development |
|        18 | Mansi     | Desai    | mansi.desai@email.com   | Mobile Application Development |
|        19 | Akash     | Mehta    | akash.mehta@email.com   | Diploma In IT                  |
|        19 | Akash     | Mehta    | akash.mehta@email.com   | Introduction to SQL            |
|        19 | Akash     | Mehta    | akash.mehta@email.com   | Data Structures                |
|        20 | Tanya     | Patel    | tanya.patel@email.com   | Accounting                     |
|        20 | Tanya     | Patel    | tanya.patel@email.com   | Data Structures                |
|        20 | Tanya     | Patel    | tanya.patel@email.com   | Diploma In IT                  |
+-----------+-----------+----------+-------------------------+--------------------------------+
35 rows in set (0.00 sec)




--12) Subquery : Find student enrolled in courses that have more than 10 student
Select s1.StudentID,
       s1.FirstName,
       s1.LastName,
       c1.CourseID,
       c1.CourseName
from Students s1 inner join Enrollments e1 on 
s1.StudentID = e1.StudentID inner join Courses c1 on 
e1.CourseID = c1.CourseID inner join (
    Select CourseID , count(EnrollmentID) as Number_Of_Student 
    from Enrollments
    group by CourseID having Number_Of_Student > 10 ) std 
on c1.CourseID = std.CourseID    
order by s1.StudentID; 
-- output 
+-----------+-----------+----------+----------+------------------+
| StudentID | FirstName | LastName | CourseID | CourseName       |
+-----------+-----------+----------+----------+------------------+
|         3 | Arjun     | Patel    |      104 | Machine Learning |
|         4 | Meera     | Shah     |      104 | Machine Learning |
|         5 | Vivek     | Joshi    |      104 | Machine Learning |
|         6 | Anjali    | Desai    |      104 | Machine Learning |
|         7 | Rohan     | Mehta    |      104 | Machine Learning |
|         8 | Kavya     | Trivedi  |      104 | Machine Learning |
|         9 | Yash      | Sharma   |      104 | Machine Learning |
|        10 | Pooja     | Patel    |      104 | Machine Learning |
|        11 | Dhruv     | Desai    |      104 | Machine Learning |
|        12 | Nisha     | Mehta    |      104 | Machine Learning |
|        13 | Jay       | Joshi    |      104 | Machine Learning |
+-----------+-----------+----------+----------+------------------+
11 rows in set (0.00 sec)




-- 13) Extract the year from the EnrollmentDate of Students
Select EnrollmentDate , year(EnrollmentDate) as year_of_Enrollment
from Students;
-- OutPut
+----------------+--------------------+
| EnrollmentDate | year_of_Enrollment |
+----------------+--------------------+
| 2022-08-01     |               2022 |
| 2021-08-01     |               2021 |
| 2021-07-15     |               2021 |
| 2021-08-10     |               2021 |
| 2021-09-01     |               2021 |
| 2021-08-20     |               2021 |
| 2022-07-05     |               2022 |
| 2022-08-12     |               2022 |
| 2022-09-01     |               2022 |
| 2022-07-20     |               2022 |
| 2023-08-01     |               2023 |
| 2023-08-15     |               2023 |
| 2024-07-10     |               2024 |
| 2024-08-05     |               2024 |
| 2024-08-20     |               2024 |
| 2025-07-15     |               2025 |
| 2025-08-01     |               2025 |
| 2026-07-10     |               2026 |
| 2026-08-01     |               2026 |
| 2026-08-15     |               2026 |
+----------------+--------------------+
20 rows in set (0.00 sec)



-- 14) Concatenate the instructor's of first and last name
Select FirstName , LastName , concat(FirstName,' ', LastName) as FullName 
from instructors; 
-- OutPut
+-----------+----------+---------------+
| FirstName | LastName | FullName      |
+-----------+----------+---------------+
| Alice     | Johnson  | Alice Johnson |
| Bob       | Lee      | Bob Lee       |
| Arjun     | Patel    | Arjun Patel   |
| Meera     | Shah     | Meera Shah    |
| Vivek     | Joshi    | Vivek Joshi   |
| Anjali    | Desai    | Anjali Desai  |
| Rohan     | Mehta    | Rohan Mehta   |
| Kavya     | Trivedi  | Kavya Trivedi |
| Yash      | Sharma   | Yash Sharma   |
| Pooja     | Patel    | Pooja Patel   |
| Dhruv     | Desai    | Dhruv Desai   |
| Nisha     | Mehta    | Nisha Mehta   |
| Jay       | Joshi    | Jay Joshi     |
| Sneha     | Shah     | Sneha Shah    |
| Harsh     | Patel    | Harsh Patel   |
| Isha      | Trivedi  | Isha Trivedi  |
| Dev       | Sharma   | Dev Sharma    |
| Mansi     | Desai    | Mansi Desai   |
| Akash     | Mehta    | Akash Mehta   |
| Riya      | Patel    | Riya Patel    |
+-----------+----------+---------------+
20 rows in set (0.00 sec)



-- 15) Calculate the running total of students enrolled in courses        
Select * ,
       sum(Enrollments_Student) over(order by Enrollments_Student rows between unbounded preceding and current row) as running_Total
from (
        Select c1.CourseName , count(e1.StudentID) as Enrollments_Student 
        from Enrollments e1 inner join Courses c1 on 
        e1.CourseID = c1.CourseID
        group by c1.CourseName 
) EnrollmentsStudent_In_Course; 
-- OutPut
+-------------------------------+---------------------+---------------+
| CourseName                    | Enrollments_Student | running_Total |
+-------------------------------+---------------------+---------------+
| Accounting                    |                   1 |             1 |
| Linear Algebra                |                   1 |             2 |
| Civil Enginnering             |                   1 |             3 |
| Artificial Intelligence       |                   1 |             4 |
| Diploma In IT                 |                   2 |             6 |
| Finance                       |                   2 |             8 |
| Mobile Application Devlopment |                   2 |            10 |
| Data Structures               |                   6 |            16 |
| Introduction to SQL           |                   8 |            24 |
| Machine Learning              |                  11 |            35 |
+-------------------------------+---------------------+---------------+
10 rows in set (0.00 sec)



-- 16) Label students as 'Senior' or 'Junior' based on their year of enrollment 
-- (If the enrollment data is more than 4 year from the currendate , put the label 'senior' otherwise 'junior')
Select StudentID ,
       FirstName,
       LastName,
       Email,
       EnrollmentDate,
       case
            when  EnrollmentDate < date_sub(CURDATE()  , interval 4 year) then "senior"
            else "junior"
       end as Student_Stutes
from Students;
-- OutPut
+-----------+-----------+----------+-------------------------+----------------+----------------+
| StudentID | FirstName | LastName | Email                   | EnrollmentDate | Student_Stutes |
+-----------+-----------+----------+-------------------------+----------------+----------------+
|         1 | John      | Doe      | john.doe@email.com      | 2022-08-01     | senior         |
|         2 | Jane      | Smith    | jane.smith@email.com    | 2021-08-01     | senior         |
|         3 | Arjun     | Patel    | arjun.patel@email.com   | 2021-07-15     | senior         |
|         4 | Meera     | Shah     | meera.shah@email.com    | 2021-08-10     | senior         |
|         5 | Vivek     | Joshi    | vivek.joshi@email.com   | 2021-09-01     | senior         |
|         6 | Anjali    | Desai    | anjali.desai@email.com  | 2021-08-20     | senior         |
|         7 | Rohan     | Mehta    | rohan.mehta@email.com   | 2022-07-05     | senior         |
|         8 | Kavya     | Trivedi  | kavya.trivedi@email.com | 2022-08-12     | senior         |
|         9 | Yash      | Sharma   | yash.sharma@email.com   | 2022-09-01     | senior         |
|        10 | Pooja     | Patel    | pooja.patel@email.com   | 2022-07-20     | senior         |
|        11 | Dhruv     | Desai    | dhruv.desai@email.com   | 2023-08-01     | junior         |
|        12 | Nisha     | Mehta    | nisha.mehta@email.com   | 2023-08-15     | junior         |
|        13 | Jay       | Joshi    | jay.joshi@email.com     | 2024-07-10     | junior         |
|        14 | Sneha     | Shah     | sneha.shah@email.com    | 2024-08-05     | junior         |
|        15 | Harsh     | Patel    | harsh.patel@email.com   | 2024-08-20     | junior         |
|        16 | Isha      | Trivedi  | isha.trivedi@email.com  | 2025-07-15     | junior         |
|        17 | Dev       | Sharma   | dev.sharma@email.com    | 2025-08-01     | junior         |
|        18 | Mansi     | Desai    | mansi.desai@email.com   | 2026-07-10     | junior         |
|        19 | Akash     | Mehta    | akash.mehta@email.com   | 2026-08-01     | junior         |
|        20 | Tanya     | Patel    | tanya.patel@email.com   | 2026-08-15     | junior         |
+-----------+-----------+----------+-------------------------+----------------+----------------+
20 rows in set (0.00 sec)