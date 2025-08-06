# Online-Bookstore-SQL-Project
End-to-end SQL project using Online Book Store data with 3 tables: Customers, Books, and Orders. Includes data analysis using JOINs, GROUP BY, and aggregate functions.

---

## 🧩 Tables Used

- `Books(Book_ID, Title, Author, Genre,Published_Year, Stock, Price)`
- `Customers(Customer_ID, Name, Email, Phone, City, Country)`
- `Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)`

---

## 🧠 Project Objectives

- Identify the **most frequently ordered book**
- Find the **customer who spent the most**
- Use SQL to extract meaningful business insights
- Practice **JOINs**, **GROUP BY**, and **aggregate functions**

---

## 🔍 Sample Queries

```sql
-- Most Frequently Ordered Book
SELECT TOP 1 b.Title, SUM(o.Quantity) AS Total_Ordered
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Title
ORDER BY Total_Ordered DESC;

-- Customer Who Spent the Most
SELECT TOP 1 c.Name, SUM(o.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Name
ORDER BY Total_Spent DESC;
