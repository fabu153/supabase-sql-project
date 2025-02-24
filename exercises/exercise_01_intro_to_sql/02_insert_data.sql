-- Insert Dummy Students
INSERT INTO students (first_name, last_name, email, enrollment_date)
VALUES
('John', 'Doe', 'john.doe@example.com', '2024-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '2023-09-10'),
('Michael', 'Brown', 'michael.brown@example.com', '2022-05-20'),
('Emily', 'Davis', 'emily.davis@example.com', '2023-11-01'),
('Chris', 'Miller', 'chris.miller@example.com', '2021-08-25');

-- Insert Dummy Courses
INSERT INTO courses (course_name, ects, hours, format, instructor)
VALUES
('SQL Basics', 5, 40, 'Online', 'Dr. Alice Johnson'),
('Data Science 101', 6, 50, 'Campus', 'Prof. Robert Green'),
('Python for Beginners', 4, 30, 'Blended', 'Dr. Sarah Lee'),
('Cybersecurity Fundamentals', 7, 60, 'Online', 'Dr. James Smith'),
('AI and Machine Learning', 8, 70, 'Campus', 'Prof. Linda Brown');

-- Insert Enrollments (Linking Students & Courses)
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(2, 1, '2024-01-16'),
(3, 3, '2023-09-12'),
(5, 2, '2022-05-22'),
(6, 4, '2023-11-05'),
(4, 5, '2021-08-30'),
(2, 2, '2024-02-01'),
(3, 5, '2022-06-10');
