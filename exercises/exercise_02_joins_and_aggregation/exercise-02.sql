-- =====================================
-- Exercise 2: Using JOINS and AGGREGATION with Supabase
-- =====================================

-- =====================================
-- 1️⃣ List All Students with Their Enrolled Courses
-- =====================================

SELECT students.first_name, students.last_name, courses.course_name, enrollments.enrollment_date
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.course_id
ORDER BY students.last_name;

-- =====================================
-- 2️⃣ Count the Number of Students Enrolled in Each Course
-- =====================================

SELECT courses.course_name, COUNT(enrollments.student_id) AS total_students
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
GROUP BY courses.course_name
ORDER BY total_students DESC;


-- =====================================
-- 3️⃣ Calculate the Total ECTS Credits for Each Student
-- =====================================

SELECT students.first_name, students.last_name, SUM(courses.ects) AS total_ects
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.course_id
GROUP BY students.first_name, students.last_name
ORDER BY total_ects DESC;
