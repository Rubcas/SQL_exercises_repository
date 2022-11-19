---Exercise using SELECT Queries


---Select all values in the company_name column of the customers table that begin with the letters 'Q' through 'Z' (inclusive); sort values in descending order.
SELECT company_name FROM Customers
WHERE company_name >= 'Q'
ORDER BY company_name DESC;


---Get first and last name of each employee with a title of "Sales Representative"; sort by last_name, and within the same last name, sort by first_name.
SELECT first_name, last_name FROM employees
WHERE title = 'Sales Representatives'
ORDER BY last_name, first_name;



---Get first_name and home_phone of each employee whose first_name begins with the capital letter 'A' and whose home_phone includes the number '4'. Order by employee_id.
SELECT first_name, home_phone FROM employees
WHERE first_name LIKE 'A%' AND home_phone LIKE '%4'
ORDER BY employee_id;