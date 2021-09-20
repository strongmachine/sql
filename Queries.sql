SELECT * FROM employees LIMIT (20);
--
SELECT * FROM departments LIMIT (20);
--
SELECT * FROM departments_employees LIMIT (20);
--
SELECT * FROM managers LIMIT (20);
--
SELECT *FROM salaries LIMIT (20);
--
SELECT *FROM titles LIMIT (20);


---- Follow instructions to make queries

-- 1. List the following details of each employee: employee number,last name, first name, sex, and salary.


SELECT employees.emp_no AS Employee_Number, employees.last_name, employees.first_name, employees.sex, salaries.salary FROM employees
	JOIN salaries ON employees.emp_no = salaries.emp_no
	LIMIT (20);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date FROM employees 
	WHERE employees.hire_date > '1986-1-1'::date AND employees.hire_date < '1987-1-1'::date
	LIMIT (20);                                          

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT managers.dept_no, departments.dept_name, managers.emp_no, employees.last_name, employees.first_name FROM managers
	JOIN employees ON managers.emp_no = employees.emp_no
	JOIN departments ON managers.dept_no = departments.dept_no
	LIMIT (20);

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM employees
	JOIN departments_employees ON employees.emp_no = departments_employees.emp_no
	JOIN departments ON departments_employees.dept_no = departments.dept_no
	LIMIT (20);

-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex FROM employees 
	WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
	LIMIT (20);


-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM employees
	JOIN departments_employees ON employees.emp_no = departments_employees.emp_no
	JOIN departments ON departments_employees.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales'
	LIMIT (20);



-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM employees
	JOIN departments_employees ON employees.emp_no = departments_employees.emp_no
	JOIN departments ON departments_employees.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
	LIMIT (20);



-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT employees.last_name, 
	Count (*) FROM employees GROUP BY employees.last_name ORDER BY Count (*) DESC;
