Drop table if exists departments;
Drop table if exists dept_emp;
Drop table if exists dept_manager;
Drop table if exists employees;
Drop table if exists salaries;
Drop table if exists titles;

Create table departments (
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(255) NOT NULL
);

Create table employees (
	emp_no INT PRIMARY KEY NOT NULL,
	birth_date Date NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	gender VARCHAR(255) NOT NULL,
	hire_date Date NOT NULL
);

Create table dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date Date NOT NULL,
	to_date Date NOT NULL
);

Create table dept_manager (
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date Date NOT NULL,
	to_date Date NOT NULL
);

Create table salaries (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL,
	from_date Date NOT NULL,
	to_date Date NOT NULL
);

Create table titles (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR(255) NOT NULL,
	from_date Date NOT NULL,
	to_date Date NOT NULL
);

Select * from departments;
Select * from employees;
Select * from dept_emp;
Select * from dept_manager;
Select * from salaries;
Select * from titles;