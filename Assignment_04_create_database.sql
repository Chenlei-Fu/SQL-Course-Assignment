CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	homeroom_number INTEGER,
	phone VARCHAR(20) UNIQUE,
	email VARCHAR(115) UNIQUE,
	grad_year INTEGER
);

CREATE TABLE teacher(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	homeroom_number INTEGER,
	department VARCHAR(45),
	email VARCHAR(20) UNIQUE,	
	phone VARCHAR(20) UNIQUE
);

INSERT INTO students(first_name, last_name, homeroom_number, phone, email, grad_year)
VALUES
('Mark', 'Watney', '5', '777-555-1234', null, '2035');

ALTER TABLE students
RENAME TO student;

ALTER TABLE teacher
ALTER COLUMN email TYPE VARCHAR(250);

INSERT INTO teacher(first_name, last_name, homeroom_number, department, email, phone)
VALUES
('Jonas', 'Salk', '5', 'Biology', 'jsalk@school.org', '777-555-4321');

