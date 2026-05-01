-- Total sales, profit, orders
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(order_id) AS total_orders
FROM retail_sales;

-- Sales by category
SELECT category,
       SUM(sales) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;

-- Profit by category
SELECT category,
       SUM(profit) AS total_profit
FROM retail_sales
GROUP BY category
ORDER BY total_profit DESC;

-- Sales by region
SELECT region,
       SUM(sales) AS total_sales
FROM retail_sales
GROUP BY region
ORDER BY total_sales DESC;

-- Sales by market
SELECT market,
       SUM(sales) AS total_sales
FROM retail_sales
GROUP BY market
ORDER BY total_sales DESC;

-- Sales trend by year
SELECT year,
       SUM(sales) AS total_sales
FROM retail_sales
GROUP BY year
ORDER BY year;