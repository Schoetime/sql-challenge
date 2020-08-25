-- Data Analysis --
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT  "EmployeeID", "LastName", "FirstName", "Sex" --, "Salaries.Salary"
FROM public."Employees"
-- JOIN public."Salaries"
-- ON "Employees.EmployeeID" = "Salaries.EmployeeID"

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT  "LastName", "FirstName", "HireDate"
FROM public."Employees"
WHERE "HireDate" BETWEEN '1986-01-01' AND '1987-01-01';

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT  "LastName", "FirstName", "Sex"
FROM public."Employees"
WHERE "FirstName" = 'Hercules'
AND "LastName" LIKE 'B%';