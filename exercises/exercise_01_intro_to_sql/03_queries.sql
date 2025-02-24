-- Select all students
SELECT * FROM students;

-- Select students who enrolled after a certain date
SELECT * FROM students WHERE enrollment_date > '2023-09-30';

-- Select students where email is NOT Gmail
SELECT * FROM students WHERE email NOT LIKE '%@gmail.com';

-- Select students enrolled before 2025 and named 'Mario'
SELECT * FROM students WHERE enrollment_date < '2025-01-01' AND first_name = 'Mario';

-- List All Students in Each Course
SELECT students.first_name, students.last_name, courses.course_name, enrollments.enrollment_date
FROM enrollments
INNER JOIN students ON enrollments.student_id = students.id
INNER JOIN courses ON enrollments.course_id = courses.course_id;
