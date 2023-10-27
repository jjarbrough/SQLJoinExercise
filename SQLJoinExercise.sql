/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

 SELECT products.name, categories.Name FROM products
 INNER JOIN categories
 ON products.CategoryID = categories.CategoryID
 Where categories.name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

 SELECT products.Name, products.Price, reviews.Rating FROM products
 INNER JOIN reviews
 ON products.ProductID = reviews.ProductID
 Where reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) as 'Total Sales' FROM sales
INNER JOIN employees 
ON sales.EmployeeID = employees.EmployeeID
GROUP BY sales.EmployeeID
ORDER BY SUM(sales.Quantity) DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT categories.Name AS 'Category', departments.Name AS 'Department' From categories
INNER JOIN departments
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.name = 'Appliances' OR categories.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT products.name, SUM(sales.Quantity) AS 'Total sold', SUM(sales.PricePerUnit * quantity) AS 'Total Price Sold' From products
INNER JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment From products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE products.Name = 'Visio TV'
ORDER BY reviews.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.name, sales.Quantity, sales.PricePerUnit FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products
ON sales.ProductID = products.ProductID
ORDER BY employees.EmployeeID;

SELECT * FROM products
Where products.name = 'Eagles: Hotel California';