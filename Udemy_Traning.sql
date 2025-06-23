use Udemy_Training;

CREATE TABLE Instructors ( 
    InstructorID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
);

CREATE TABLE Categories ( 
    CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(50) 
); 

CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    Title VARCHAR(100), 
    InstructorID INT, 
    CategoryID INT, 
    Price DECIMAL(6,2), 
    PublishDate DATE, 
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID), 
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) 
); 

CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 

CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollDate DATE, 
    CompletionPercent INT, 
    Rating INT CHECK (Rating BETWEEN 1 AND 5), 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 

INSERT INTO Instructors VALUES 
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'), 
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21');

INSERT INTO Categories VALUES 
(1, 'Web Development'), 
(2, 'Data Science'), 
(3, 'Business'); 

INSERT INTO Courses VALUES 
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'), 
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'), 
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'), 
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01'); 

INSERT INTO Students VALUES 
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'), 
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'), 
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10'); 

INSERT INTO Enrollments VALUES 
(1, 201, 101, '2023-04-10', 100, 5), 
(2, 202, 102, '2023-04-15', 80, 4), 
(3, 203, 101, '2023-04-20', 90, 4), 
(4, 201, 102, '2023-04-22', 50, 3), 
(5, 202, 103, '2023-04-25', 70, 4), 
(6, 203, 104, '2023-04-28', 30, 2), 
(7, 201, 104, '2023-05-01', 60, 3); 


SELECT * from Students
select * from Enrollments
select * from Instructors
select * from Courses
select * from Categories

-- Basic Level

-- 1 - count total number of students

select count(FullName)
from Students

-- 2 - Count total number of enrollements
select count(EnrollmentID)
from Enrollments

--3 - find average rating of each course
select Avg(Rating) AS Rating,CourseID
from Enrollments
GROUP BY CourseID

--4 - Total number of Courses per instractor

select count(CourseID) AS CourseID,InstructorID
from Courses
GROUP BY InstructorID

-- 5 - number of courses in each category
select count(Title) AS Courses,CategoryID
from Courses
GROUP BY CategoryID

-- 6 - Number of stduents enrolled in each course
select count(StudentID) as StudentID, CourseID
from Enrollments
GROUP BY CourseID

-- 7 - Average Cource price per category
SELECT AVG(Price) as AvgPrice, CategoryID
from Courses
GROUP BY CategoryID

-- 8 - Maximim course Price
select max(Price) as MaxPrice
from Courses

-- 9 - Min,Max,AVG rating per Course
select Min(Rating) "MinRating",Max(Rating) "MaxRating",Avg(Rating) "AvgRating" , CourseID
from Enrollments
GROUP BY CourseID

-- 10 - Count how many students gave  rating = 5

select count(StudentID) as Student
from Enrollments
GROUP BY Rating
HAVING Max(Rating) = 5


-- Intermediate Level
SELECT * from Students
select * from Enrollments
select * from Instructors
select * from Courses
select * from Categories

-- 1 - Average completion percent per course

select Avg(CompletionPercent) "CompletionPercent", CourseID 
from Enrollments
group by CourseID

-- 2 - Find students enrolled in more than 1 course
select StudentID, count(CourseID) as Course
FROM Enrollments
Group BY StudentID
HAVING COUNT(CourseID) > 1

--3 - Calculate revenue per course (Price * enrollements)
select 
    C.CourseID,
	C.Title,
	C.Price,
	COUNT(E.EnrollmentID) AS Enrollments,
	(C.Price * Count (E.EnrollmentID)) AS Revenue
from Courses C
JOIN Enrollments E ON C.CourseID = E.CourseID
Group by C.CourseID, C.Title,C.Price