-- Task 2: Data Insertion and Handling Nulls
-- Objective: Practice inserting, updating, and deleting data
-- Database: SQLite / DB Fiddle


-- 1. CREATE TABLES
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(10) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE employee (
    emp_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    salary REAL DEFAULT 30000,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);


-- 2. INSERT DATA (Handling NULLs & Defaults)

INSERT INTO department (dept_id, dept_name, location)
VALUES
(1, 'HR', 'Chennai'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', NULL);  -- location missing handled as NULL

INSERT INTO employee (emp_id, first_name, last_name, email, salary, dept_id)
VALUES
(101, 'Spoorthi', 'Kayam', 'spoorthi@example.com', 50000, 1),
(102, 'Sonal', 'Bhatia', 'sonal.b@example.com', NULL, 2),  -- salary defaults
(103, 'Priya', NULL, 'priya@example.com', 45000, 2),
(104, 'Kiran', 'Solanki', 'kiran.s@example.com', 47000, NULL);  -- dept_id missing handled as NULL


-- 3. UPDATE DATA (Clean & Consistent)
-- Update NULL salary with default
UPDATE employee
SET salary = 30000
WHERE salary IS NULL;

-- Assign missing department for Kiran
UPDATE employee
SET dept_id = 1
WHERE emp_id = 104;

-- Update Finance department location
UPDATE department
SET location = 'Hyderabad'
WHERE dept_name = 'Finance';

-- 4. DELETE DATA (Using WHERE for safety)
-- Delete employees with missing email
DELETE FROM employee
WHERE email IS NULL;

-- Example: delete a department safely
DELETE FROM department
WHERE dept_id = 3;

-- 5. VERIFY DATA
SELECT * FROM department;
SELECT * FROM employee;
