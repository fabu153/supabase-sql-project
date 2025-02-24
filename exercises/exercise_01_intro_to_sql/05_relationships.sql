-- Find all courses a student is enrolled in (example: "John Doe")
SELECT courses.course_name, enrollments.enrollment_date
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
JOIN students ON enrollments.student_id = students.id
WHERE students.first_name = 'John' AND students.last_name = 'Doe';

-- Count the number of students enrolled in each course
SELECT courses.course_name, COUNT(enrollments.student_id) AS student_count
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
GROUP BY courses.course_name;
