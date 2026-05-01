-- Top 10 products by sales
SELECT product_name,
       SUM(sales) AS total_sales
FROM retail_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Top 10 products by profit
SELECT product_name,
       SUM(profit) AS total_profit
FROM retail_sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Bottom 10 products (loss-making)
SELECT product_name,
       SUM(profit) AS total_profit
FROM retail_sales
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;

-- Discount impact on profit
SELECT discount,
       AVG(profit) AS avg_profit
FROM retail_sales
GROUP BY discount
ORDER BY discount;

-- Identify loss-making transactions with high discounts
SELECT product_name,
       discount,
       sales,
       profit
FROM retail_sales
WHERE profit < 0
ORDER BY discount DESC
LIMIT 20;

-- Profitability by region
SELECT region,
       SUM(profit) AS total_profit
FROM retail_sales
GROUP BY region
ORDER BY total_profit DESC;