CREATE TABLE Title (
    title_id VARCHAR(10)   NOT NULL,
    title VARCHAR(50)   NOT NULL,
    PRIMARY KEY (title_id) 
);

CREATE TABLE Employees (
    employee_no INTEGER   NOT NULL,
    title_id VARCHAR(10)   NOT NULL,
    bitrh_date DATE   NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (employee_no),
    FOREIGN KEY (title_id) REFERENCES Title (title_id)
    
);

CREATE TABLE Departments (
    department_no VARCHAR(25)   NOT NULL,
    department_name VARCHAR(50)   NOT NULL,
    PRIMARY KEY (department_no)
     
);

CREATE TABLE Salaries (
    employee_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    PRIMARY KEY (employee_no),
    FOREIGN KEY (employee_no) REFERENCES Employees (employee_no)

);

CREATE TABLE Dept_Emp (
    employee_no INTEGER   NOT NULL,
    department_no VARCHAR(25)   NOT NULL,
    PRIMARY KEY (employee_no, department_no),
    FOREIGN KEY (employee_no) REFERENCES Employees (employee_no),
    FOREIGN KEY (department_no) REFERENCES Departments (department_no)
     
);

CREATE TABLE Dept_Manager (
    department_no VARCHAR(25)   NOT NULL,
	employee_no INTEGER   NOT NULL,
    PRIMARY KEY (department_no, employee_no),
	FOREIGN KEY (department_no) REFERENCES Departments (department_no),
    FOREIGN KEY (employee_no) REFERENCES Employees (employee_no)
    
);
