SELECT * FROM departments
--List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.sex, s.salary
FROM employees as emp
JOIN salaries as s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' and '1987-01-01';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dep.dept_no, dep.dept_name, man.emp_no,  emp.first_name, emp.last_name
FROM departments as dep
JOIN dept_manager as man
ON dep.dept_no = man.dept_no
JOIN employees as emp
ON man.emp_no = emp.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT depemp.emp_no, emp.first_name, emp.last_name, dep.dept_name
FROM dept_emp as depemp
JOIN employees as emp
ON depemp.emp_no = emp.emp_no
JOIN departments as dep
ON depemp.dept_no = dep.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT depemp.emp_no, emp.first_name, emp.last_name, dep.dept_name
FROM dept_emp as depemp
JOIN employees as emp
ON depemp.emp_no = emp.emp_no
JOIN departments as dep
ON depemp.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT depemp.emp_no, emp.first_name, emp.last_name, dep.dept_name
FROM dept_emp as depemp
JOIN employees as emp
ON depemp.emp_no = emp.emp_no
JOIN departments as dep
ON depemp.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales' or dep.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) as "Count"
FROM employees
GROUP BY last_name
ORDER BY "Count" DESC;
