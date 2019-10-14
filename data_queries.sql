--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

--List employees who were hired in 1986.
SELECT employees.emp_no, last_name, first_name, hire_date
FROM employees 
WHERE date_part('year', hire_date) = 1986
ORDER BY employees.hire_date;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates
--(list only current)
SELECT departments.dept_no, departments.dept_name, employees.emp_no, first_name, last_name, dep_manager.from_date, dep_manager.to_date
FROM employees 
INNER JOIN dep_manager ON employees.emp_no = dep_manager.emp_no
JOIN departments ON dep_manager.dept_no = departments.dept_no
WHERE date_part('year', to_date) = 9999;
--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates
--(list all past and present)
SELECT departments.dept_no, departments.dept_name, employees.emp_no, first_name, last_name, dep_manager.from_date, dep_manager.to_date
FROM employees 
INNER JOIN dep_manager ON employees.emp_no = dep_manager.emp_no
JOIN departments ON dep_manager.dept_no = departments.dept_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, first_name, last_name, departments.dept_name
FROM employees
INNER JOIN dep_emp ON employees.emp_no = dep_emp.emp_no
JOIN departments ON dep_emp.dept_no = departments.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B".
SELECT employees.emp_no, last_name, first_name, hire_date
FROM employees 
WHERE first_name='Hercules' AND last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
INNER JOIN dep_emp ON employees.emp_no = dep_emp.emp_no
JOIN departments ON dep_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
INNER JOIN dep_emp ON employees.emp_no = dep_emp.emp_no
JOIN departments ON dep_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;

--Use below to build and check query for BONUS analisys in pandas
SELECT titles.title, ROUND(AVG(salaries.salary::numeric),2) AS average_salary FROM titles JOIN salaries ON titles.emp_no = salaries.emp_no GROUP BY titles.title ORDER BY average_salary;

--Epilogue: Search your ID number 499942 (trying way to hard to be funny here)
SELECT *
FROM employees
WHERE emp_no=499942;