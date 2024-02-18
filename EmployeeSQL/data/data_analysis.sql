-- 1.  List the employee number, last name, first name, sex, and salary of each employee.

SELECT emp.emp_no,
	emp.last_name, 
	emp.first_name,
	emp.sex,
	sal.salary

FROM employees as emp
LEFT JOIN salaries as sal
	ON emp.emp_no = sal.emp_no
;


-- 2.  List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name,
	last_name,
	hire_date	
FROM employees
WHERE 
	YEAR(hire_date) = 1986
;


-- 3.  List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
	dept.dept_no,
	dept.dept_name,
	dp.emp_no,
	emp.last_name,
	emp.first_name
FROM departments AS dept

LEFT JOIN dept_manager AS dp
	ON dept.dept_no = dp.dept_no
	
LEFT JOIN employees as emp
	ON dp.emp_no = emp.emp_no
;


-- 4.  List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_no,
	dept.dept_name
	
FROM employees AS emp
LEFT JOIN dept_emp as de
	ON emp.emp_no = de.emp_no
	
LEFT JOIN departments AS dept
	ON dept.dept_no = de.dept_no
;


-- 5.  List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%'
;


-- 6.  List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
	
FROM employees AS emp

LEFT JOIN dept_emp as de
	ON de.emp_no = emp.emp_no
	
LEFT JOIN departments as dept
	ON dept.dept_no = de.dept_no
	WHERE dept.dept_name = 'Sales'
;


-- 7.  List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
	
FROM employees AS emp

LEFT JOIN dept_emp as de
	ON de.emp_no = emp.emp_no
	
LEFT JOIN departments as dept
	ON dept.dept_no = de.dept_no
	WHERE dept.dept_name = 'Sales'
		OR dept.dept_name = 'Development'
;


-- 8.  List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) as total_last_name
FROM employees
GROUP BY last_name
ORDER BY total_last_name DESC
;
