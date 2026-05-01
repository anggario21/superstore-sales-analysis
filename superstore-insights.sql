-- Profit margin by category
SELECT category,
       SUM(profit) / SUM(sales) AS profit_margin
FROM retail_sales
GROUP BY category
ORDER BY profit_margin DESC;

-- Average discount by category
SELECT category,
       AVG(discount) AS avg_discount
FROM retail_sales
GROUP BY category;

-- Monthly sales trend
SELECT DATE_TRUNC('month', order_date::DATE) AS month,
       SUM(sales) AS total_sales
FROM retail_sales
GROUP BY month
ORDER BY month;