INSERT INTO job(job_name)
VALUES
('Cowboy');

DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id, job_name;

CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR (500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
);

SELECT * FROM information;

ALTER TABLE information
RENAME TO new_info;

ALTER TABLE new_info
RENAME COLUMN person TO people;

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

INSERT INTO new_info(title)
VALUES
('some new title');

ALTER TABLE new_info
DROP COLUMN people;

SELECT *
FROM new_info;

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;

UPDATE account
SET last_login = create_on;

UPDATE account_job
SET hire_date = account.create_on
FROM account
WHERE account_job.user_id = account.user_id;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, create_on, last_login;

CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK(birthdate > '1900-01-01'),
	hire_date DATE CHECK(hire_date > birthdate),
	salary INTEGER CHECK(salary > 0)
						
);

INSERT INTO employees(
first_name, last_name, birthdate, hire_date, salary)
VALUES
('Jose', 'Portilla','1900-11-03', '2010-01-01', 100);

INSERT INTO employees(
first_name, last_name, birthdate, hire_date, salary)
VALUES
('Sammy', 'Smith','1900-11-03', '2010-01-01', 100)










































