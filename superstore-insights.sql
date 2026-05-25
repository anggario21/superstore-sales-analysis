-- Which products are the most and least profitable within each category?
WITH product_profit AS (
    SELECT
        category,
        product_name,
        SUM(profit) AS total_profit,
        SUM(sales) AS total_sales,
        ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
    FROM retail_sales
    GROUP BY category, product_name
)
SELECT
    category,
    product_name,
    total_profit,
    profit_margin_pct,
    RANK() OVER (PARTITION BY category ORDER BY total_profit DESC) AS rank_most_profitable
FROM product_profit
ORDER BY category, rank_most_profitable ;-- add DESC to rank from the least profitable

-- Is the business growing month over month?
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date::DATE) AS month,
        SUM(sales) AS total_sales
    FROM retail_sales
    GROUP BY month
)
SELECT
    month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY month) AS prev_month_sales,
    ROUND(
        (total_sales - LAG(total_sales) OVER (ORDER BY month))
        / NULLIF(LAG(total_sales) OVER (ORDER BY month), 0) * 100,
    2) AS mom_growth_pct
FROM monthly_sales
ORDER BY month;

-- At what discount level does profit turn negative?
SELECT
    CASE
        WHEN discount = 0 THEN '0% - No Discount'
        WHEN discount <= 0.10 THEN '1-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        WHEN discount <= 0.30 THEN '21-30%'
        WHEN discount <= 0.40 THEN '31-40%'
        ELSE '40%+'
    END AS discount_bucket,
    COUNT(*) AS total_orders,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(AVG(sales), 2) AS avg_sales,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM retail_sales
GROUP BY discount_bucket
ORDER BY discount_bucket;

-- Which specific products should be reviewed or discontinued?
SELECT
    product_name,
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM retail_sales
GROUP BY product_name, category, sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;

-- Which region + segment combinations are most valuable?
SELECT
    region,
    segment,
    COUNT(DISTINCT customer_name) AS unique_customers,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct,
    ROUND(SUM(sales) / NULLIF(COUNT(DISTINCT customer_name), 0), 2) AS avg_revenue_per_customer
FROM retail_sales
GROUP BY region, segment
ORDER BY total_profit DESC;

-- How does each market contribute to cumulative annual revenue?
WITH market_annual AS (
    SELECT
        market,
        EXTRACT(YEAR FROM order_date::DATE) AS year,
        SUM(sales) AS total_sales
    FROM retail_sales
    GROUP BY market, EXTRACT(YEAR FROM order_date::DATE)
)
SELECT
    market,
    year,
    total_sales,
    SUM(total_sales) OVER (PARTITION BY year ORDER BY total_sales DESC) AS cumulative_sales,
    ROUND(total_sales / SUM(total_sales) OVER (PARTITION BY year) * 100, 2) AS pct_of_annual_sales
FROM market_annual
ORDER BY  market, year ASC, total_sales DESC;
