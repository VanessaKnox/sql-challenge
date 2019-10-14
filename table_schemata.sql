CREATE TABLE employees (
  emp_no integer PRIMARY KEY NOT NULL,
  birth_date date DEFAULT now() NOT NULL,
  first_name character varying(45) NOT NULL,
  last_name character varying(45) NOT NULL,
  gender character varying(1) NOT NULL,
  hire_date date DEFAULT now() NOT NULL
);

CREATE TABLE departments (
  dept_no character varying(10) PRIMARY KEY NOT NULL,
  dept_name character varying(45) NOT NULL
);

CREATE TABLE dep_emp (
  emp_no integer REFERENCES employees(emp_no) NOT NULL,
  dept_no character varying(10) REFERENCES departments(dept_no) NOT NULL,
  from_date date DEFAULT now() NOT NULL,
  to_date date DEFAULT now() NOT NULL
);

CREATE TABLE dep_manager (
  dept_no character varying(10) REFERENCES departments(dept_no) NOT NULL,
  emp_no integer REFERENCES employees(emp_no) NOT NULL,
  from_date date DEFAULT now() NOT NULL,
  to_date date DEFAULT now() NOT NULL
);

CREATE TABLE salaries (
  emp_no integer REFERENCES employees(emp_no) NOT NULL,
  salary money NOT NULL,
  from_date date DEFAULT now() NOT NULL,
  to_date date DEFAULT now() NOT NULL
);

CREATE TABLE titles (
  emp_no integer REFERENCES employees(emp_no) NOT NULL,
  title character varying(45) NOT NULL,
  from_date date DEFAULT now() NOT NULL,
  to_date date DEFAULT now() NOT NULL
);