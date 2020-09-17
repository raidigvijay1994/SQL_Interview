/* For creating database  */

CREATE DATABASE IF NOT EXISTS dig_employee;

CREATE SCHEMA IF NOT EXISTS dig_employees;

/* for dropping the database */

DROP SCHEMA dig_employee;

USE employees;

USE dig_employees;

CREATE TABLE IF NOT EXISTS Customers(
Customer_id INT,
first_name VARCHAR(255),
last_name VARCHAR(255),
email_address VARCHAR(255),
number_of_complaints INT
);

SELECT *
FROM customers;

SELECT *
FROM dig_employees.customers;

drop table customers;

CREATE table customers (

customers_id INT PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
email_address VARCHAR(255),
number_of_complaints INT

);

CREATE TABLE ITEMS (

item_code VARCHAR(255) PRIMARY KEY,
item VARCHAR(255),
unit_price numeric (10,2),
company_id VARCHAR(255)

);


CREATE TABLE companies(

company_id VARCHAR(255) PRIMARY KEY,
company_name VARCHAR(255),
headquarters_phone_number INT(12)

);

DROP table sales;

CREATE table sales
(
purchase_number INT PRIMARY KEY AUTO_INCREMENT,
date_of_purchase DATE,
customers_id INT,
item_code VARCHAR(10)

);


ALTER TABLE SALES
ADD FOREIGN KEY (customers_id) references customers(customers_id) ON DELETE CASCADE;

ALTER TABLE SALES
DROP FOREIGN KEY sales_ibfk_1;

USE dig_employees;

DROP Table sales;

DROP TABLE customers;

DROP TABLE items;

DROP TABLE companies;


CREATE table customers (

customers_id INT,
first_name VARCHAR(255),
last_name VARCHAR(255),
email_address VARCHAR(255),
number_of_complaints INT,
PRIMARY KEY (customers_id),
UNIQUE KEY (email_address)
);


CREATE table customers (
customers_id INT AUTO_INCREMENT,
first_name VARCHAR(255),
last_name VARCHAR(255),
email_address VARCHAR(255),
number_of_complaints INT,
PRIMARY KEY (customers_id)
);

ALTER TABLE CUSTOMERS
ADD UNIQUE KEY (email_address);

ALTER TABLE CUSTOMERS
DROP INDEX email_address;


CREATE table customers (
customers_id INT AUTO_INCREMENT,
first_name VARCHAR(255),
last_name VARCHAR(255),
email_address VARCHAR(255),
number_of_complaints INT,
PRIMARY KEY (customers_id)
);

ALTER TABLE customers
ADD column Gender ENUM('M','F') AFTER last_name;

ALTER TABLE CUSTOMERS
DROP COLUMN GENDER;

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('Digvijay', 'Rai', 'M', 'digvijayrai1994@gmail.com', 0);

SELECT *
FROM CUSTOMERS;

TRUNCATE TABLE CUSTOMERS;

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers(first_name,last_name,gender)
VALUES('Yogesh','Patil','M');

ALTER TABLE CUSTOMERS
RENAME COLUMN gender TO genders;

ALTER TABLE customers
CHANGE COLUMN GENDERS GENDER enum ('M','F');

SELECT *
FROM customers;

CREATE TABLE companies 
(company_id VARCHAR(255) DEFAULT "X", 
company_name VARCHAR(255), 
headquarters_phone_number VARCHAR(255) UNIQUE KEY
);

INSERT INTO companies (company_name,headquarters_phone_number)
VALUES('Wipro Limited','899609324');

DROP TABLE companies;

SELECT *
FROM COMPANIES;

ALTER TABLE CUSTOMERS
ALTER COLUMN number_of_complaints DROP DEFAULT;

CREATE TABLE companies 
(company_id INT AUTO_INCREMENT, 
company_name VARCHAR(255) NOT NULL, 
headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id)
);

ALTER TABLE companies
MODIFY column company_name VARCHAR(255) NULL;

USE dig_employees;
ALTER TABLE companies
MODIFY column headquarters_phone_number VARCHAR(255) NOT NULL;

ALTER TABLE companies
CHANGE column headquarters_phone_number headquarters_phone_number VARCHAR(255) NULL;


ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

USE EMPLOYEES;

/* Return employee record with maximum salary */

SELECT *
FROM salaries
WHERE salary = (SELECT MAX(salary) FROM salaries);

/* Return employee record with minimum salary */

SELECT *
FROM salaries
WHERE salary = (SELECT MIN(salary) from salaries);

/* Return 2nd highest employee record with maximum salary */

USE EMPLOYEES;

SELECT max(salary)
FROM SALARIES
WHERE SALARY not in (SELECT max(salary) from salaries);

SELECT min(salary)
from salaries
where salary = (select min(salary) from salaries);

/* SECOND MINIMUM SALARY */

SELECT min(salary)
from salaries
where salary NOT LIKE (select min(salary) from salaries);

SELECT min(salary)
from salaries
where salary NOT IN (select min(salary) from salaries);

SELECT MIN(salary)
FROM salaries;

SELECT MAX(salary)
FROM salaries;

SELECT AVG(salary)
FROM salaries;


select *
from employees;

/* Select range of employee based on id. */

SELECT *
FROM EMPLOYEES
WHERE emp_no BETWEEN 10001 AND 10007;

/* return employee name, highest salary and department */

SELECT e.first_name, e.last_name, s.salary
FROM employees e INNER JOIN salaries s ON (e.emp_no = s.emp_no);
WHERE salary IN (SELECT MAX(SALARY) FROM SALARIES);



/* Select the information from the “dept_no” column of the “departments” table.

Select all data from the “departments” table.  */

SELECT *
FROM DEPARTMENTS;

SELECT dept_no
from departments;

/* 
Select all people from the “employees” table whose first name is “Elvis”.
*/

SELECT *
FROM employees
WHERE first_name = "ELVIS";

SELECT *
FROM employees
WHERE first_name LIKE "ELVIS";

/* 
Retrieve a list with all female employees whose first name is Kellie. 
*/

SELECT *
FROM employees
WHERE first_name LIKE "ELVIS" AND gender LIKE "F";

/*
Retrieve a list with all employees whose first name is either Kellie or Aruna.
*/

SELECT *
FROM employees
WHERE first_name LIKE "KELLIE" OR first_name LIKE "ARUNA";

/*
Retrieve a list with all female employees whose first name is either Kellie or Aruna.
*/

USE Employees;

SELECT *
FROM EMPLOYEES
WHERE Gender = 'F' AND (first_name = 'Kellie' or first_name = 'Aruna');

/*
Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
*/

SELECT *
FROM EMPLOYEES
WHERE first_name IN ('DENIS','Elvis');

/*
Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
*/

SELECT *
FROM employees
WHERE first_name NOT IN ('John', 'Mark', 'Jacob');

/* Working with the “employees” table, use the LIKE operator to select the data about all individuals, 
whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.

Retrieve a list with all employees who have been hired in the year 2000.

Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 

*/

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'Mark%';


SELECT *
FROM employees
WHERE HIRE_DATE LIKE "%2000%";

select emp_no
from employees
where emp_no LIKE'1000_';


/* Extract all individuals from the ‘employees’ table whose first name contains “Jack”.

Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
*/

SELECT *
FROM employees
WHERE first_name LIKE '%Jack%';

SELECT *
FROM employees
WHERE first_name NOT LIKE '%Jack%';


/*  Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.

Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.

Select the names of all departments with numbers between ‘d003’ and ‘d006’.
*/
SELECT *
FROM SALARIES
WHERE SALARY BETWEEN 66000 AND 70000;

SELECT *
FROM employees
WHERE EMP_NO NOT BETWEEN 10004 AND 10012;

SELECT dept_name
FROM DEPARTMENTS
WHERE DEPT_NO BETWEEN 'D003' AND 'D006';

/* Select the names of all departments whose department number value is not null.
*/

SELECT *
FROM DEPARTMENTS
WHERE dept_no IS NOT NULL;

/* Retrieve a list with data about all female employees who were hired in the year 2000 or after.

Hint: If you solve the task correctly, SQL should return 7 rows.

Extract a list with all employees’ salaries higher than $150,000 per annum.
*/

SELECT *
FROM employees
WHERE gender = 'F' AND hire_date >= ('2000-01-01');

SELECT *
FROM SALARIES
WHERE SALARY > '150000';

/* Obtain a list with all different “hire dates” from the “employees” table.

Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output rows displayed back to the default of 1000.

In the next lecture, we will show you how to manipulate the limit rows count. 
*/

SELECT hire_date
from employees;


/* How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?

How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
*/

SELECT COUNT(*)
FROM SALARIES
WHERE salary >= 100000;


/* Select all data from the “employees” table, ordering it by “hire date” in descending order.
*/

SELECT *
FROM employees
ORDER BY hire_date DESC;

/* group the number of time the first name occured in the employees table
*/

SELECT first_name, COUNT(first_name)
from employees
GROUP BY first_name
ORDER BY first_name desc;

/*
This will be a slightly more sophisticated task.

Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
Lastly, sort the output by the first column.
*/

SELECT salary, COUNT(emp_no) AS "emps_with_same_salary"
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY SALARY ;

/* 
Select all employees whose average salary is higher than $120,000 per annum.

Hint: You should obtain 101 records.
*/
SELECT *, AVG(salary) as average_salary
from salaries
GROUP BY emp_no
HAVING average_salary > 120000
ORDER BY emp_no ;

/* Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.

Hint: To solve this exercise, use the “dept_emp” table.
*/

SELECT emp_no
from dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

SELECT emp_no
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;


/*  Select the first 100 rows from the ‘dept_emp’ table. 
*/

SELECT *
FROM DEPT_EMP
LIMIT 100;

SELECT *
from salaries
ORDER BY salary DESC
LIMIT 10;
/* Select ten records from the “titles” table to get a better idea about its content.

Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, 
who has started working in this position on October 1st, 1997.

At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.

Hint: To solve this exercise, you’ll need to insert data in only 3 columns!

*/

select *
from titles
LIMIT 10;

INSERT INTO TITLES (emp_no, title, from_date)
VALUES ('999904', 'Senior Engineer', '1997-10-01');

SELECT *
FROM titles
ORDER BY emp_no DESC;

/*
Insert information about the individual with employee number 999903 into the “dept_emp” table. 
He/She is working for department number 5, and has started work on  October 1st, 1997;
 her/his contract is for an indefinite period of time.

Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.
*/

INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
VALUES (999905, 'd005','1997-10-01', '9999-01-01');

/* Create a new department called “Business Analysis”. Register it under number ‘d010’.

Hint: To solve this exercise, use the “departments” table.
*/

INSERT INTO departments ( dept_no, dept_name)
VALUES ('D030','Business Analysis');

/*
UPDATE STATEMENT */


SELECT *
FROM EMPLOYEES
WHERE emp_no = 999903;

UPDATE employees
SET 
   first_name = 'Digvijay',
   last_name = 'Rai',
   birth_date = '1994-02-25',
   gender = 'M',
   hire_date = '2020-09-15'

WHERE
     emp_no = 999903;
   
/* Change the “Business Analysis” department name to “Data Analysis”.

Hint: To solve this exercise, use the “departments” table.
*/

SELECT *
FROM DEPARTMENTS;

UPDATE departments
SET 
    dept_name = 'Data Analysis'
WHERE dept_no = 'd030';
    
SELECT *
FROM DEPARTMENTS;

/*
Remove the department number 10 record from the “departments” table.
*/

DELETE FROM DEPARTMENTS
where dept_no = 'd030';

SELECT *
FROM departments;

/* How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
*/
USE employees;

SELECT COUNT(DISTINCT dept_no)
FROM dept_emp;

/* What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
*/

SELECT SUM(salary)
FROM salaries
where from_date > '1997-12-01';

/* 1. Which is the lowest employee number in the database?
2. Which is the highest employee number in the database?
*/

SELECT MIN(emp_no)
FROM employees;

SELECT MAX(emp_no)
FROM employees;

/* What is the average annual salary paid to employees who started after the 1st of January 1997?
*/

SELECT AVG(salary)
from salaries
WHERE from_date > '1997-01-01';

/* 
Round the average amount of money spent on salaries for all contracts that started after 
the 1st of January 1997 to a precision of cents.
*/

SELECT ROUND(AVG(salary),2) as Avg_Salary
FROM salaries
WHERE from_date > '1997-01-01';

/*
Select the department number and name from the ‘departments_dup’ table and add a third column 
where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.
*/

SELECT *
FROM departments_dup;

SELECT dept_no, dept_name, coalesce(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no;

/* Modify the code obtained from the previous exercise in the following way. Apply the IFNULL() function to the values from 
the first and second column, so that ‘N/A’ is displayed whenever a department number has no value, 
and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.
*/

SELECT IFNULL (dept_no, 'N/A') as dept_no, IFNULL (dept_name, 'Department name not provided') as dept_name
FROM departments_dup;

/*
If you currently have the ‘departments_dup’ table set up, use DROP COLUMN to remove the ‘dept_manager’ column from 
the ‘departments_dup’ table.

Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.

(If you don’t currently have the ‘departments_dup’ table set up, create it. Let it contain two columns: dept_no and dept_name. 
Let the data type of dept_no be CHAR of 4, and the data type of dept_name be VARCHAR of 40. Both columns are allowed to 
have null values. Finally, insert the information contained in ‘departments’ into ‘departments_dup’.)

Then, insert a record whose department name is “Public Relations”.
Delete the record(s) related to department number two.
Insert two new records in the “departments_dup” table. Let their values in the “dept_no” column be “d010” and “d011”.
*/
ALTER TABLE departments_dup
DROP column dept_manager;


ALTER TABLE departments_dup
CHANGE column dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

CREATE TABLE departments_dup 
(dept_no CHAR(4) NULL,
dept_name VARCHAR(40) NULL);

INSERT INTO departments_dup (dept_n, dept_name)
SELECT * FROM departments;

INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd002';
 
 INSERT INTO departments_dup (dept_no)
 VALUES ('D010'), ('D011');

/* 
Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
*/

SELECT e.first_name, e.last_name, dm.dept_no, e.hire_date, e.emp_no
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no;

/*
Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
See if the output contains a manager with that name.  

Hint: Create an output containing information corresponding to the following fields: 
‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.
*/


SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM dept_manager dm
LEFT JOIN
employees e ON e.emp_no = dm.emp_no
WHERE e.last_name LIKE 'Markovitch'
ORDER BY DEPT_NO desc, e.emp_no;

/*
Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
Use the old type of join syntax to obtain the result.
*/

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, dm.dept_no
FROM employees e,
dept_manager dm
WHERE e.emp_no = dm.emp_no;


SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, dm.dept_no
FROM employees e 
JOIN
dept_manager dm ON e.emp_no = dm.emp_no;

/*
Select the first and last name, the hire date, 
and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.
*/

SELECT e.emp_no,e.first_name, e.last_name, e.hire_date, t.title
from employees e
JOIN
titles t ON e.emp_no = t.emp_no
WHERE e.first_name = 'Margareta' AND e.last_name = 'Markovitch'
ORDER BY emp_no;

/*
Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
*/

SELECT d.*, dm.*
from departments d
CROSS JOIN
dept_manager dm 
WHERE d.dept_no = '9'
ORDER BY d.dept_name;

/* Return a list with the first 10 employees with all the departments they can be assigned to.
Hint: Don’t use LIMIT; use a WHERE clause.
*/

SELECT e.*, d.*
from employees e
CROSS JOIN 
departments d
WHERE emp_no < '10011'
ORDER BY e.emp_no, d.dept_name;

/* find the average salaries of men and women in the company 
*/

SELECT e.gender, AVG(s.salary) as avg_salary
from employees e
JOIN
salaries s ON e.emp_no = s.emp_no
ORDER BY gender;

/*
first_name, last name, hire date, from date, dept name, 
*/

SELECT e.first_name, e.last_name, e.hire_date, d.dept_name, dm.from_date
FROM employees e
JOIN
dept_manager dm ON dm.emp_no = e.emp_no
JOIN
departments d ON d.dept_no = dm.dept_no;

/*  
Select all managers’ first and last name, hire date, job title, start date, and department name.
*/

USE EMPLOYEES;
SELECT e.first_name, e.last_name, e.hire_date, t.title, d.dept_name, dm.from_date
from employees e
JOIN 
TITLES t ON e.emp_no = t.emp_no
JOIN 
dept_manager dm ON t.emp_no = dm.emp_no
JOIN
departments d ON d.dept_no = dm.dept_no
ORDER BY e.emp_no;

/* How many male and how many female managers do we have in the ‘employees’ database?
*/

SELECT e.gender, COUNT(dm.emp_no)
FROM employees e
JOIN
dept_manager dm ON e.emp_no =  dm.emp_no
GROUP BY e.gender;

/*  Go forward to the solution and execute the query. 
What do you think is the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)? 
*/

SELECT *
FROM (SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date
FROM employees e
WHERE last_name = 'Denis' UNION 
SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name, dm.dept_no, dm.from_date
FROM dept_manager dm) as a

ORDER BY -a.emp_no DESC;

/* to get first and last name of all managers
*/

SELECT e.first_name, e.last_name
from employees e
Where e.emp_no IN (Select dm.emp_no
from dept_manager dm);

/* Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.
*/

SELECT *
FROM dept_manager 
WHERE emp_no IN (SELECT emp_no
from employees 
Where hire_date BETWEEN '1990-01-01' AND '1995-01-01');

/*
Select the entire information for all employees whose job title is “Assistant Engineer”. 

Hint: To solve this exercise, use the 'employees' table.
*/

SELECT *
FROM employees e
WHERE EXISTS (SELECT *
from titles t
where t.emp_no = e.emp_no AND title = 'Assistant Engineer');

/* third highest salary
*/

SELECT SALARY
FROM (
SELECT SALARY
FROM SALARIES
ORDER BY salary desc
LIMIT 3) as salary
ORDER BY SALARY asc
LIMIT 1;

/* Highest Salary  */
Select max(salary)
from salaries;

/* second highest salary
 */
SELECT MAX(salary)
from salaries
where salary NOT IN (SELECT max(salary) from salaries);



SELECT *
FROM SALARIES
ORDER BY salary desc;


/*
to fetch only even rows from the table
*/
SELECT *
FROM SALARIES
where emp_no IN(SELECT emp_no from salaries where emp_no%2 = 0);

/*
to fetch only odd rows from the table
*/

SELECT *
from salaries
where emp_no IN (SELECT emp_no from salaries where emp_no%2 <> 0);

/*  
How can you fetch first 5 characters of the string?
*/

SELECT substring(first_name,1,5) as first_name
from employees;

/*to check date and timestamp */

getdate();

/* to get common records from two different table 
*/

SELECT emp_no
from employees 
INTERSECT
SELECT emp_no
from salaries;

/*
How can you select unique records from a table?
*/

SELECT DISTINCT emp_no
from employees;

/* to fetch first 50% of the records from the table
*/

SELECT TOP 50 PERCENT * 
FROM departments_dup;

/* select specific row from the table
to select 4 row from the table
*/

SELECT * 
FROM departments_dup
LIMIT 3,1;

/* SQL server runs on port number 1433 */

/*
to fetch only odd rows from the table
*/

SELECT *
FROM salaries 
where emp_no IN (SELECT emp_no from salaries where emp_no%2 <> 0);

/* to fetch only even rows from the table */

select *
from salaries
where emp_no IN (SELECT emp_no from salaries where emp_no %2 = 0);


/*  
How can you fetch first 5 characters of the string?
*/

SELECT SUBSTRING(FIRST_NAME,1,5)
FROM employees;

/*
count of repeated character in the employee first name
*/

SELECT FIRST_name
from employees;

SELECT first_name, 
 COUNT(first_name) AS NumOccurrences
FROM employees
GROUP BY first_name
HAVING ( COUNT(first_name) > 1 );

/*
count of character in the employee first name
*/

SELECT first_name, LENGTH(TRIM(FIRST_NAME))
from employees;


/*
Stored Procedure - it is an sql code that can be saved, so the code can be reused over and over again
*/

USE EMPLOYEES;

DELIMITER $$
CREATE PROCEDURE all_employees()
BEGIN
     SELECT * FROM employees;
     
END $$

DELIMITER ;

CALL all_employees;

