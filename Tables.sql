--Create all Tables and Drops and alterations for tables and columns according to instructions:

--employees:

DROP TABLE IF EXISTS employees CASCADE;


CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no, emp_title_id)
);


--departments:

DROP TABLE IF EXISTS departments CASCADE;


CREATE TABLE departments(
	dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(50) NOT NULL
);

-- Table departments_employees:


DROP TABLE IF EXISTS departments_employees;


CREATE TABLE departments_employees(
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL REFERENCES departments(dept_no),
	emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES employees(emp_no, emp_title_id),
	PRIMARY KEY(emp_no, dept_no)
);

-- Drop the Composed Primary Key 
ALTER TABLE departments_employees DROP column emp_title_id;


--managers:

DROP TABLE IF EXISTS managers;



CREATE TABLE managers (
	dept_no VARCHAR(5) NOT NULL REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES employees(emp_no, emp_title_id),
	PRIMARY KEY(dept_no, emp_no)
);

-- Drop the Composed Primary Key 
ALTER TABLE managers DROP column emp_title_id;


--salaries:

DROP TABLE IF EXISTS salaries;


CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES employees(emp_no, emp_title_id),
	salary INT
);

-- Drop the Composed Primary Key 
ALTER TABLE salaries DROP column emp_title_id;

--titles:


DROP TABLE IF EXISTS titles;


CREATE TABLE titles(
	emp_title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no,emp_title_id) REFERENCES employees(emp_no,emp_title_id),
	PRIMARY KEY (emp_title_id, title)
);

-- Drop the Composed Primary Key 
ALTER TABLE titles DROP column emp_no;


