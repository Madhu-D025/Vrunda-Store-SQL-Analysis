create database store_db;
use store_db;

ALTER TABLE vrunda_store_ds RENAME TO vrunda_table;

-- Basic SQL Queries
-- 1) Retrieve all orders where the order amount is greater than 1000.
select * from vrunda_table where Amount > 1000;
-- 2) Get the total quantity (Qty) for a specific category (e.g., 'Electronics').
select sum(Qty) as Total_quantity from vrunda_table where Category = 'Western Dress';
-- 3) Find the customers who placed orders in the month of January.
select * from vrunda_table where Months = 'Jan';
-- 4) List all orders for a specific customer ID (Cust ID).
select * from vrunda_table where `Cust ID` = '8480814';
-- 5) Show the total order amount for each ship-state
select `ship-state`, sum(Qty*Amount) as Total_Amount from vrunda_table group by `ship-state` order by Total_Amount desc;
-- 6) Select all orders where the status is 'Cancelled'.
select count(*) from vrunda_table where Status = 'Cancelled';
-- 7) Get the number of orders placed for each SKU.
select SKU, count(`Order ID`) from vrunda_table group by SKU order by count(`Order ID`) desc;
-- 8) List the distinct age groups (Age Group) of women customers who placed orders.
select `Age Group`, count(`Order ID`) as count from vrunda_table where Gender = 'Women' group by `Age Group`;
-- 9) Find the total number of orders and the sum of order amounts for each gender (Gender).
select  Gender,count(`Order ID`) as count_of_orders, sum(Qty*Amount) as Amount from Vrunda_table group by Gender;
-- Find all orders where the B2B column is TRUE.
select * from vrunda_table where B2B = 'True';

-- Intermediat SQL Queries

-- 10) Find the average order amount for each channel (Channel).
select Channel, avg(Amount) as Avg_Amount from vrunda_table group by Channel order by Avg_Amount desc;
-- 11) List the top 5 cities with the highest total order amounts.
select `ship-city`, sum(Qty*Amount) as Total_Amount from vrunda_table group by `ship-city` order by `ship-city` desc limit 5;
-- 12) Retrieve the number of orders for each combination of Size and Category.
select Category,Size, count(`Order ID`) as Orders from vrunda_table group by 1,2 order by Orders desc;
-- 13) Find customers who have ordered more than once and their total order amounts.
select `Cust ID`, count(`Order ID`) as Total_orders, sum(Qty*Amount) as Amount from vrunda_table group by `Cust ID` having Total_orders > 1 order by Total_orders desc;
-- 14) Get the number of orders and total amount for each month (Months) in the year.
select Months, count(`Order ID`) as Orders, sum(Qty*Amount) as Total_Amt from vrunda_table group by Months order by Total_Amt desc;
-- 15) Retrieve the top 5 customers (Cust ID) with the highest total Amount.
select `Cust ID`, sum(Qty*Amount) as Total_Amt from vrunda_table group by `Cust ID` order by Total_Amt desc limit 5;
-- Retrieve the Cust ID and total Amount for customers who have placed more than 8 orders.
select `Order ID`, count(`Order ID`) as Orders, sum(Qty*Amount) as Total_Amt from vrunda_table group by `Order ID` having count(`Order ID`) > 8;


-- Advanced SQL Queries
select * from vrunda_table;
-- Create a query that shows the total order amount for each age group and order status,
select `Age Group`,`Status`, sum(Qty*Amount) as Amount from vrunda_table group by 1,2;
-- Use a window function to calculate the running total of the Amount for each customer, ordered by Date.
select `Cust ID`,`Order ID`, Date, Amount, sum(Amount) over(partition by `Cust ID` order by Date) as Running_total from vrunda_table order by `Cust ID`, `Date`;





