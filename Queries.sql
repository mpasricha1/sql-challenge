SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   e.sex,
	   s.salary
FROM employees e 
INNER JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY emp_no;


SELECT e.first_name,
	   e.last_name,
	   e.hire_date
FROM employees e 
WHERE DATE_PART('year', e.hire_date) = 1986
ORDER BY hire_date;

SELECT d.dept_no,
	   d.dept_name, 
	   e.emp_no, 
	   e.last_name,
	   e.first_name
FROM dept_manager dm 
INNER JOIN employees e ON dm.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no = dm.dept_no
ORDER BY dept_no;

SELECT e.emp_no,
	   e.last_name,
	   e.first_name, 
	   d.dept_name
FROM employees e 
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no;

SELECT e.first_name, 
	   e.last_name, 
	   e.sex
FROM employees e 
WHERE first_name = 'Hercules' AND last_name LIKE '%B%';

SELECT e.emp_no, 
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees e 
INNER JOIN dept_emp de ON e.emp_no = de.emp_no 
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, 
	   e.last_name,
	   e.first_name,
	   d.dept_name
 FROM employees e 
INNER JOIN dept_emp de ON e.emp_no = de.emp_no 
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

SELECT e.last_name, 
	   COUNT(e.last_name) AS "Last Name Count"
FROM employees e 
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC