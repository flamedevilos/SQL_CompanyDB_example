DROP DATABASE CompanyDB;
CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE employee (
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT,
    create_at timestamp,
    update_at timestamp,
    delete_at timestamp
);

CREATE TABLE branch (
	branch_id INT PRIMARY KEY,
	branch_name VARCHAR(40),
	mgr_id INT,
	mgr_start_date DATE,
	create_at timestamp,
    update_at timestamp,
    delete_at timestamp,
	FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
	client_id INT PRIMARY KEY,
	client_name VARCHAR(40),
	branch_id INT,
  	create_at timestamp,
    update_at timestamp,
    delete_at timestamp,
	FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
	emp_id INT,
	client_id INT,
	total_sales INT,
  	create_at timestamp,
    update_at timestamp,
    delete_at timestamp,
	PRIMARY KEY(emp_id, client_id),
	FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
	FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
	branch_id INT,
	supplier_name VARCHAR(40),
	supply_type VARCHAR(40),
  	create_at timestamp,
    update_at timestamp,
    delete_at timestamp,
	PRIMARY KEY(branch_id, supplier_name),
	FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);