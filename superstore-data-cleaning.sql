-- Check total rows
SELECT COUNT(*) FROM retail_sales;

-- Preview data
SELECT * FROM retail_sales LIMIT 10;

-- Check missing values (key columns)
SELECT *
FROM retail_sales
WHERE sales IS NULL
   OR profit IS NULL
   OR category IS NULL;

-- Check data types (PostgreSQL)
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'retail_sales';

-- Convert sales to numeric (if needed)
ALTER TABLE retail_sales
ALTER COLUMN sales TYPE NUMERIC(12,2)
USING sales::NUMERIC;

-- Convert profit to numeric
ALTER TABLE retail_sales
ALTER COLUMN profit TYPE NUMERIC(12,2)
USING profit::NUMERIC;

-- Convert shipping_cost to numeric
ALTER TABLE retail_sales
ALTER COLUMN shipping_cost TYPE NUMERIC(12,2)
USING shipping_cost::NUMERIC;