--1) List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
FROM employees e JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY last_name, first_name;


--2) List the first name, last name, and hire date for the employees who were hired in 1986
SELECT 
	first_name, 
	last_name, 
	hire_date 
FROM employees e
WHERE extract(year from hire_date) = 1986
ORDER by hire_date, last_name, first_name;


--3) List the manager of each department along with their department number, 
--department name, employee number, last name, and first name
SELECT 
	m.emp_no AS "Manager",
	e.last_name,
	e.first_name,
	m.dept_no,
	d.dept_name
FROM department_managers m 
	JOIN departments d ON m.dept_no = d.dept_no
	JOIN employees e ON m.emp_no = e.emp_no
ORDER BY d.dept_name, e.last_name, e.first_name;


--4) List the department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name
SELECT  
	e.last_name, 
	e.first_name,
	de.emp_no,
	de.dept_no, 
	d.dept_name
FROM department_employees de 
	JOIN departments d ON de.dept_no = d.dept_no
	JOIN employees e ON de.emp_no = e.emp_no
ORDER BY e.last_name, e.first_name;


--5) List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins with the letter B
SELECT
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name;


--6) List each employee in the Sales department, 
--including their employee number, last name, and first name
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM department_employees de JOIN employees e ON de.emp_no = e.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.last_name, e.first_name;


--7) List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM department_employees de JOIN employees e ON de.emp_no = e.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development')
ORDER BY d.dept_name, e.first_name, e.last_name;


--8) List the frequency counts, in descending order, of all the employee 
--last names (that is, how many employees share each last name)
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY Count DESC
