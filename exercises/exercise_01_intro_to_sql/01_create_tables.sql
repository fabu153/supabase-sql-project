-- Create Students Table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    enrollment_date DATE NOT NULL
);

-- Create Courses Table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name TEXT NOT NULL,
    ects INT NOT NULL,
    hours INT NOT NULL,
    format TEXT NOT NULL,
    instructor TEXT NOT NULL
);

-- Create Enrollments Table (Many-to-Many)
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE,
    enrollment_date DATE NOT NULL
);
