DROP TABLE IF EXISTS departments; 
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;



CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY, 
	dept_name VARCHAR NOT NULL
);

CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY, 
	title VARCHAR
);

CREATE TABLE employees( 
	emp_no INT PRIMARY KEY, 
	emp_title_id VARCHAR REFERENCES titles(title_id),
	birth_date DATE, 
	first_name VARCHAR,
	last_name VARCHAR, 
	sex VARCHAR,
	hire_date DATE
);

CREATE TABLE dept_emp(
	emp_no INT REFERENCES employees(emp_no),
	dept_no VARCHAR REFERENCES departments(dept_no),
	primary key(emp_no,dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR REFERENCES departments(dept_no), 
	emp_no INT REFERENCES employees(emp_no),
	primary key(dept_no,emp_no)
);

CREATE TABLE salaries(
	emp_no INT REFERENCES employees(emp_no), 
	salary INT NOT NULL 
);




