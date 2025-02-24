-- Find all courses a student is enrolled in
SELECT courses.course_name, enrollments.enrollment_date
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
WHERE enrollments.student_id = 2;  -- Change ID to target a specific student

-- Count the number of students enrolled in each course
SELECT courses.course_name, COUNT(enrollments.student_id) AS student_count
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
GROUP BY courses.course_name;
