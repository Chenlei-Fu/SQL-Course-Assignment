SELECT  
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargins,
SUM (CASE rental_rate
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
SUM (CASE rental_rate
	WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film;

SELECT 
SUM(CASE rating
   WHEN 'R' THEN 1
   ELSE 0
END) AS r,
SUM(CASE rating
   WHEN 'PG' THEN 1
   ELSE 0
END) AS pg,
SUM(CASE rating
   WHEN 'PG-13' THEN 1
   ELSE 0
END) AS pg
FROM film;

SELECT CAST ('5' AS INTEGER);

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental;

CREATE TABLE depts(
	first_name VARCHAR(50),
	department VARCHAR(50)
);

INSERT INTO depts(
	first_name,
	department
)
VALUES
('Vinton', 'A'),
('Lauren', 'A'),
('Clarire', 'B');

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts;

DELETE FROM depts
WHERE department = 'B';

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
	NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END), 0)
) AS department_ratio
FROM depts;

CREATE VIEW customer_info AS
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

DROP VIEW IF EXISTS customer_info;

ALTER VIEW customer_info RENAME TO c_info;
