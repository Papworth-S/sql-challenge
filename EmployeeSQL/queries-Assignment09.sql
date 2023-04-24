-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.employee_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.employee_no = s.employee_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE extract(year from e.hire_date) = 1986;
-- WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';
-- Both of the WHERE lines of code produce the same result but I like the function once I found it

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dm.department_no,
    d.department_name,
    e.employee_no, 
    e.last_name, 
    e.first_name   
FROM Dept_Manager as dm 
LEFT JOIN Employees as e 
ON dm.employee_no = e.employee_no
LEFT JOIN Departments as d
ON d.department_no = dm.department_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.department_no,
	d.department_name,
    e.employee_no,
    e.last_name,
    e.first_name
FROM Employees as e
INNER JOIN Dept_Emp as de 
ON de.employee_no = e.employee_no
LEFT JOIN Departments as d 
ON d.department_no = de.department_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex
FROM Employees as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.employee_no, e.last_name, e.first_name
FROM Employees as e
RIGHT JOIN Dept_Emp as de 
ON e.employee_no = de.employee_no
INNER JOIN Departments as d 
ON de.department_no = d.department_no
WHERE d.department_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT e.employee_no, e.last_name, e.first_name, d.department_name
FROM Employees as e
RIGHT JOIN Dept_Emp as de 
ON e.employee_no = de.employee_no
INNER JOIN Departments as d 
ON de.department_no = d.department_no
WHERE d.department_name = 'Sales' OR d.department_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
-- Bing AI helped with this 
SELECT e.last_name, COUNT(*) AS how_often
FROM Employees as e
GROUP BY e.last_name
ORDER BY how_often DESC;