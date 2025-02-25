-- =====================================
-- Exercise 1: Introduction to Supabase and SQL
-- =====================================

-- 1️⃣ CREATE TABLE: Students
CREATE TABLE students (
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    enrollment_date DATE NOT NULL
);

-- 2️⃣ INSERT: Dummy Students
INSERT INTO students (first_name, last_name, email, enrollment_date)
VALUES
('John', 'Doe', 'john.doe@example.com', '2024-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '2023-09-10'),
('Michael', 'Brown', 'michael.brown@example.com', '2022-05-20'),
('Emily', 'Davis', 'emily.davis@example.com', '2023-11-01'),
('Chris', 'Miller', 'chris.miller@example.com', '2021-08-25');

-- 3️⃣ QUERY: View Students Table
SELECT * FROM students;

-- 4️⃣ TASK 3: Query Based on Conditions
-- Select students who enrolled after 2023-09
SELECT * FROM students WHERE enrollment_date > '2023-09-30';

-- Select students where email is NOT Gmail
SELECT * FROM students WHERE email NOT LIKE '%@gmail.com';

-- Select students enrolled before 2025-01-01 AND first name is 'Mario'
SELECT * FROM students WHERE enrollment_date < '2025-01-01' AND first_name = 'Mario';

-- 5️⃣ TASK 4: Update & Delete Records
-- Update student with id=4 to "New Name"
UPDATE students SET first_name = 'New Name' WHERE id = 4;

-- Delete all students named 'XXXX' (Example: 'John')
DELETE FROM students WHERE first_name = 'John';

-- =====================================
-- Step 2: Create the Courses Table
-- =====================================
CREATE TABLE courses (
    course_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    course_name TEXT NOT NULL,
    ects INT NOT NULL,
    hours INT NOT NULL,
    format TEXT NOT NULL,
    instructor TEXT NOT NULL
);

-- Insert Dummy Courses
INSERT INTO courses (course_name, ects, hours, format, instructor)
VALUES
('SQL Basics', 5, 40, 'Online', 'Dr. Alice Johnson'),
('Data Science 101', 6, 50, 'Campus', 'Prof. Robert Green'),
('Python for Beginners', 4, 30, 'Blended', 'Dr. Sarah Lee'),
('Cybersecurity Fundamentals', 7, 60, 'Online', 'Dr. James Smith'),
('AI and Machine Learning', 8, 70, 'Campus', 'Prof. Linda Brown');

-- 6️⃣ QUERY: View Courses Table
SELECT * FROM courses;

-- =====================================
-- Step 3: Create the Enrollments Table (Many-to-Many)
-- =====================================
CREATE TABLE enrollments (
    enrollment_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE,
    enrollment_date DATE NOT NULL,
    CONSTRAINT unique_student_course UNIQUE (student_id, course_id) -- Preventing duplicate enrollments
);

-- Create an index on enrollment_date for faster queries
CREATE INDEX idx_students_enrollment_date ON students(enrollment_date);

-- Insert Enrollments (Ensure all IDs exist)
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(2, 1, '2024-01-16'),
(3, 3, '2023-09-12'),
(5, 2, '2022-05-22'),
(1, 4, '2023-11-05'),  -- Fixed: Changed student_id 6 → 1
(4, 5, '2021-08-30'),
(2, 2, '2024-02-01'),
(3, 5, '2022-06-10');

-- 7️⃣ QUERY: View Enrollments Table
SELECT * FROM enrollments;

-- =====================================
-- Step 4: Querying the Database
-- =====================================

-- List all students and their enrolled courses
SELECT students.first_name, students.last_name, courses.course_name, enrollments.enrollment_date
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.course_id
ORDER BY students.last_name;

-- Find all courses a specific student is enrolled in by student name (e.g., 'John Doe')
SELECT courses.course_name, enrollments.enrollment_date
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.course_id
WHERE students.first_name = 'John' AND students.last_name = 'Doe';

-- Count the number of students in each course
SELECT courses.course_name, COUNT(enrollments.student_id) AS student_count
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
GROUP BY courses.course_name
ORDER BY student_count DESC;

-- List all students enrolled in more than one course
SELECT students.first_name, students.last_name, COUNT(enrollments.course_id) AS course_count
FROM enrollments
JOIN students ON enrollments.student_id = students.id
GROUP BY students.id
HAVING COUNT(enrollments.course_id) > 1;

-- =====================================
