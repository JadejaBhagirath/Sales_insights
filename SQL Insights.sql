USE SALES

SELECT * FROM customers
SELECT * FROM sales_entry;

-- How many data we have in Sales Transaction Table.
SELECT count (*)
  FROM sales_entry;

-- 148395 (data)

--View Top 5 Rows of our Transaction data.
SELECT TOP 5 *
FROM sales_entry;


-- how many transaction have usd currency in transaction file

SELECT * FROM  sales_entry WHERE currency = 'USD';

--Date function
SELECT * FROM date;

--inner join between Transaction and date columns and filtering data for the particular year 2020
SELECT t.*, d.*
FROM sales_entry t
INNER JOIN [date] d ON t.order_date = d.date
where year = 2020;


--Total Revenue or sales 2020

SELECT SUM(t.sales_amount) AS total_revenue
FROM sales_entry t
INNER JOIN [date] d ON t.order_date = d.date
WHERE YEAR(d.date) = 2020;

--Total Revenue or sales 2019

SELECT SUM(t.sales_amount) AS total_revenue
FROM sales_entry t
INNER JOIN [date] d ON t.order_date = d.date
WHERE YEAR(d.date) = 2019;

-- Total Revenue by Market code
SELECT t.market_code, SUM(t.sales_amount) AS total_revenue
FROM sales_entry t
INNER JOIN [date] d ON t.order_date = d.date
WHERE YEAR(d.date) = 2020
GROUP BY t.market_code
ORDER BY t.market_code;

-- Distinct product sold in chennai
SELECT distinct product_code from sales_entry where market_code='Mark001';

--1 SALES TABLE WE HAVE TWO PROBLEMS ONE IS WE HAVE SALES AMOUNT IN NEGATIVE VALUE
SELECT distinct currency FROM sales_entry;

