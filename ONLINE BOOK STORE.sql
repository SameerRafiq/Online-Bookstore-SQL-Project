SELECT * from Books
SELECT * from Orders
SELECT * from Customers

-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM BOOKS WHERE GENRE='Fiction'

-- 2) Find books published after the year 1950:

SELECT * FROM BOOKS WHERE Published_Year>1950

-- 3) List all customers from the Canada:

SELECT * FROM Customers WHERE Country='Canada'

-- 4) Show orders placed in November 2023:

SELECT * FROM Orders WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30'

-- 5) Retrieve the total stock of books available:

SELECT SUM(Stock)as TOTAL_BOOKS from Books ;

-- 6) Find the details of the most expensive book:

SELECt * FROM BOOKS order by price DESC  

-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT * FROM Orders WHERE Quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT * FROM ORDERS WHERE Total_Amount>20

-- 9) List all genres available in the Books table:

SELECT distinct (Genre) from  Books

-- 10) Find the book with the lowest stock:

SELECT top 1 Book_ID,Title,stock from Books order by stock asc

-- 11) Calculate the total revenue generated from all orders:

select SUM(Total_Amount)AS total_Revenue from orders

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT  b.GENRE , sum( o.Quantity) as Sold_quantity
from Books b 
join orders o
on b.Book_ID= o.Book_ID
group by b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:

SELECT AVG(Price) as Avg_price from Books where Genre = 'Fantasy'

-- 3) List customers who have placed at least 2 orders:

select customer_id, count(order_id) as countt
from orders
group by Customer_ID
having count (Customer_ID)>=2 

-- 4) Find the most frequently ordered book:

SELECT TOP 1 b.title, SUM(o.quantity) AS total_quantity
FROM books b
JOIN orders o ON b.Book_ID = o.Book_ID
GROUP BY b.title
ORDER BY total_quantity DESC;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

select top 3 title,price from books where genre = 'fantasy' order by price desc;

-- 6) Retrieve the total quantity of books sold by each author:

select b.author,sum(o.quantity) as Total_Books_Sold
from books b 
join orders o 
on b.Book_ID=o.Book_ID
group by b.Author;

-- 7) List the cities where customers who spent over $30 are located:

select distinct c.city,o.Total_Amount 
from Customers c
join Orders o
on c.Customer_ID=o.Customer_ID
where o.Total_Amount>30

-- 8) Find the customer who spent the most on orders:

select  c.Customer_ID, c.Name, SUM(o.Total_Amount) AS Total_amount_spent
FROM Customers c
join orders o on c.Customer_ID=o.Customer_ID
GROUP BY c.Customer_ID,c.Name
ORDER BY Total_amount_spent DESC
