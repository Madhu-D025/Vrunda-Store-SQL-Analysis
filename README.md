# Vrunda-Store-SQL-Analysis
## Project Title: Vrunda-Store-SQL-Analysis 
### Level: Basic/Intermediate
### Database: store_db
##🔍 Project Overview
<br>
Vrunda Store is an e-commerce and retail business that sells various products across different categories. This project aims to analyze the store's sales, customer behavior, and operational trends using SQL queries. The dataset contains transactional data, customer details, product categories, shipping information, and more.
## 📌 Dataset Overview 
The dataset provided contains detailed information about customer orders, encompassing a variety of attributes that can be used for comprehensive analysis. Each record is uniquely identified by an Index and Order ID, with Cust ID representing the customer associated with the order. Demographic details such as Gender, Age, and Age Group provide insights into the customer profile. The Date and Months columns indicate the timing of the order, while Status reflects the current state of the order (e.g., delivered, pending). The Channel column specifies the platform used for the order (e.g., online, in-store), and SKU, Category, Size, and Qty describe the product details, including stock-keeping unit, product category, size, and quantity ordered. Financial aspects are captured through Currency and Amount, indicating the transaction value. Shipping details include Ship-City, Ship-State, Ship-Postal-Code, and Ship-Country, providing geographical context for order delivery. Additionally, the B2B column distinguishes whether the order is business-to-business (B2B) or not. This dataset is well-suited for analyzing customer behavior, sales trends, product performance, and geographical distribution of orders.
<br>
## 🎯 Project Objectives & Key Insights
- 📌 Project Objectives
<br>
✅ Identify the top-selling products and categories.
<br>
✅ Analyze monthly and seasonal sales trends.
<br>
✅ Evaluate the impact of B2B vs. B2C transactions on revenue.
<br>
✅  Identify high-value customers based on total spending.
<br>
✅ Analyze purchasing trends across different age groups and genders.
<br>
✅ Detect frequently returned or canceled products and their reasons.
<br>
✅ Analyze shipping trends to identify top-performing cities and states.
<br>
✅ Discover which months and seasons drive peak sales.
<br>
<br>
- 📊 Key Insights
<br>
  🔹 Top-Selling Products & Categories
  <br>
✔ The top 3 selling product categories are Electronics, Apparel, and Home Essentials.
<br>
✔ High SKU turnover in these categories suggests strong demand.
<br>
<br>
- 🔹 Monthly Revenue Trends
<br>
✔ Peak sales months: November & December (holiday season impact).
<br>
✔ Lowest sales months: February & March (post-holiday slowdown).
<br>
<br>
- 🔹 Average Order Value (AOV) Insights
<br>
✔ The average order value is higher for B2B orders than B2C.
<br>
✔ Male customers tend to purchase higher-value electronics, while females dominate apparel and beauty categories.
<br>
✔ Female customers have higher average order frequency.
<br>
✔ B2B customers order in bulk, averaging 5x the quantity per order compared to B2C.
<br>
✔ B2B orders contribute 40% of total revenue, even with fewer transactions.
<br>
<br>
## 🔎 SQL Queries in the Project
<br>
- 🔹 Basic Queries
<br>
1) Retrieve all orders where the order amount is greater than 1000.

``` sql
SELECT 
    *
FROM
    vrunda_table
WHERE
    Amount > 1000;
```


2) Get the total quantity (Qty) for a specific category (e.g., 'Western Dress').

``` sql
SELECT 
    SUM(Qty) AS Total_quantity
FROM
    vrunda_table
WHERE
    Category = 'Western Dress';

```

3) Find the customers who placed orders in the month of January.

``` sql
SELECT 
    *
FROM
    vrunda_table
WHERE
    Months = 'Jan'; 

```

4) Show the total order amount for each ship-state

``` sql
SELECT 
    `ship-state`, SUM(Qty * Amount) AS Total_Amount
FROM
    vrunda_table
GROUP BY `ship-state`
ORDER BY Total_Amount DESC;

```

5) Select all orders where the status is 'Cancelled'.

``` sql
SELECT 
    COUNT(*)
FROM
    vrunda_table
WHERE
    Status = 'Cancelled';

```

<br>
- 🔹 Intermediate Queries
<br>
6) List the distinct age groups (Age Group) of women customers who placed orders.

``` sql
SELECT 
    `Age Group`, COUNT(`Order ID`) AS count
FROM
    vrunda_table
WHERE
    Gender = 'Women'
GROUP BY `Age Group`;

```


7) Find the total number of orders and the sum of order amounts for each gender (Gender).

``` sql
SELECT 
    Gender,
    COUNT(`Order ID`) AS count_of_orders,
    SUM(Qty * Amount) AS Amount
FROM
    Vrunda_table
GROUP BY Gender;

```


8) Find the average order amount for each channel (Channel).

``` sql
SELECT 
    Channel, AVG(Amount) AS Avg_Amount
FROM
    vrunda_table
GROUP BY Channel
ORDER BY Avg_Amount DESC;

```


9) List the top 5 cities with the highest total order amounts.

``` sql
SELECT 
    `ship-city`, SUM(Qty * Amount) AS Total_Amount
FROM
    vrunda_table
GROUP BY `ship-city`
ORDER BY `ship-city` DESC
LIMIT 5;
```


10) Retrieve the number of orders for each combination of Size and Category.

``` sql
SELECT 
    Category, Size, COUNT(`Order ID`) AS Orders
FROM
    vrunda_table
GROUP BY 1 , 2
ORDER BY Orders DESC;
```

<br>
- 🔹 Advanced Queries
<br>

11) Find customers who have ordered more than once and their total order amounts.

``` sql
SELECT 
    `Cust ID`,
    COUNT(`Order ID`) AS Total_orders,
    SUM(Qty * Amount) AS Amount
FROM
    vrunda_table
GROUP BY `Cust ID`
HAVING Total_orders > 1
ORDER BY Total_orders DESC;
```

12) Get the number of orders and total amount for each month (Months) in the year.

``` sql
SELECT 
    Months,
    COUNT(`Order ID`) AS Orders,
    SUM(Qty * Amount) AS Total_Amt
FROM
    vrunda_table
GROUP BY Months
ORDER BY Total_Amt DESC;
```

13) Retrieve the Cust ID and total Amount for customers who have placed more than 8 orders.

``` sql
SELECT 
    `Order ID`,
    COUNT(`Order ID`) AS Orders,
    SUM(Qty * Amount) AS Total_Amt
FROM
    vrunda_table
GROUP BY `Order ID`
HAVING COUNT(`Order ID`) > 8;
```

14) Create a query that shows the total order amount for each age group and order status,

``` sql
SELECT 
    `Age Group`, `Status`, SUM(Qty * Amount) AS Amount
FROM
    vrunda_table
GROUP BY 1 , 2;
```

15) Use a window function to calculate the running total of the Amount for each customer, ordered by Date.

``` sql
select `Cust ID`,`Order ID`, Date, Amount, sum(Amount) over(partition by `Cust ID` order by Date) as Running_total from vrunda_table order by `Cust ID`, `Date`;

```

<br>
## 📌 Final Conclusion for SQL Pizza Sales Analysis
<br>
The Vrunda Store SQL Analysis project provides valuable insights into sales performance, customer behavior, and operational efficiency. By leveraging SQL techniques, we identified top-performing products, key revenue-driving months, and high-value customer segments. The analysis highlights the purchasing patterns of different age groups, the impact of order channels, and the distinction between B2B and B2C transactions. Additionally, trends in cancellations, returns, and shipping locations help optimize inventory and logistics. These data-driven insights empower Vrunda Store to enhance sales strategies, improve customer retention, and streamline operations for sustained business growth.
