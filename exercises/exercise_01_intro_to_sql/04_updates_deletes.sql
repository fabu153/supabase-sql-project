-- Update student with id=4 and change first_name to 'New Name'
UPDATE students SET first_name = 'New Name' WHERE id = 4;

-- Delete all students named 'XXXX' (example: 'John')
DELETE FROM students WHERE first_name = 'John';
