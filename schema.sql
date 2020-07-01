DROP TABLE IF EXISTS departments; 
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;

CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY, 
	dept_name VARCHAR
);

CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY, 
	title VARCHAR
);

CREATE TABLE employees( 
	emp_no INT PRIMARY KEY, 
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE, 
	first_name VARCHAR,
	last_name VARCHAR, 
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL, 
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL, 
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);




