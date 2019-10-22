--1) Query employee info with salaries
Select 
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	e.gender as "Gender",
	s.salary as "Salary"
From employees as e
Inner join salaries as s
ON e.emp_no=s.emp_no
Order by e.emp_no;

-- 2) Employees who were hired in 1987
Select emp_no, first_name, last_name, hire_date
From employees 
Where
	hire_date between '1987-01-01' and '1987-12-31';

-- 3) Managers of each departments
Select 
	dm.dept_no, 
	d.dept_name, 
	dm.emp_no,
	e.first_name,
	e.last_name,
	dm.from_date,
	dm.to_date
From dept_manager as dm
Inner Join departments as d
On dm.dept_no = d.dept_no
Inner Join employees as e
On dm.emp_no=e.emp_no
Order by dept_no;

-- 4) List employees with department names
Select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
From employees as e
Inner Join dept_emp as de
On de.emp_no=e.emp_no
Inner Join departments as d
On d.dept_no=de.dept_no
Order by e.emp_no;

-- 5) Select employees who has first and last name match condition
Select first_name, last_name
From Employees
Where first_name='Duangkaew' 
And last_name Like 'P%'
Order by last_name;

--6) Sales department employees info
Select 
	e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
From employees as e
Inner Join dept_emp as de
On e.emp_no=de.emp_no
Inner Join departments as d
On d.dept_no=de.dept_no
Where d.dept_name='Sales'
Order by e.emp_no;

--7) Sales and Delevopment department employees info
Select 
	e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
From employees as e
Inner Join dept_emp as de
On e.emp_no=de.emp_no
Inner Join departments as d
On d.dept_no=de.dept_no
Where d.dept_name in ('Sales','Development')
Order by e.emp_no;

--7) Frequency count of last names
Select last_name, Count(last_name) as "Frequency Counts"
From employees
Group by last_name
Order by "Frequency Counts" ASC;