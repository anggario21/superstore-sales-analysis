# Superstore Sales Analysis

## Business Problem
The Superstore has profitability issues that aren't visible from revenue alone.
This analysis answers three core questions:
1. Which product categories and subcategories are destroying profit margin?
2. Is the discount strategy helping or hurting the business?
3. Which regions and markets should be prioritized for growth?

## Key Findings
- The **Furniture** category generates 32.5% of revenue but only 19.5% of total profit
- **Tables** subcategory has a negative profit margin of -8.47% and -$64K total loss, the single biggest drag on profitability
- **Paper** has the highest profit margin at 24.23% but low sales volume ($244K). 
  **Phones** and **Copiers** offer the best combination of high revenue and 
  healthy margins ($1.7M at 12.7% and $1.5M at 17.1% respectively)
- Discounts above **20%** are consistently associated with negative profit across all categories, 
  with orders at 40%+ discount averaging **-$89.83 profit per order** (-75.8% margin)
- **APAC** has held ~28% of global sales consistently across all 4 years (2011–2014), 
  making it the most structurally important market. **EU** is the true second-largest 
  market, outpacing US in 3 of 4 years
- **APAC** leads in sales ($3.59M total across 4 years) but **Canada** has the 
  highest profit margin per order at 26.62% — though Canada represents less than 
  1% of global sales volume
- **Southeast Asia** generates $460K in Consumer sales but only a 2.22% profit margin — 
  high volume masking near break-even performance. **EMEA** shows a similar pattern 
  at 4.99–6.28% margins across all segments, suggesting pricing or cost issues in both markets
  
## Business Recommendations
1. Re-evaluate pricing or discontinue the bottom 10 SKUs in the Tables subcategory
2. Cap discounts at 20%, anything higher erodes margin without proportional volume gain
3. Prioritize growth in Canada market and double down on Copiers and Phones.
   high revenue subcategories with strong margins. Avoid over-discounting in 
   these categories as it disproportionately destroys value.
4. Investigate pricing and cost structure in Southeast Asia and EMEA.
   both markets generate significant revenue but margins are too thin to 
   sustain long-term. A 5% margin improvement in Southeast Asia alone 
   would recover ~$23K in annual profit

## Tools
- PostgreSQL — data cleaning and analysis
- Power BI — dashboard and visualization

## Dataset
- ~50,000 retail transactions
- Covers sales, profit, discount, product category, region, and market data

## Dashboard Preview
![Dashboard Preview](<Retail sales analysis dashboard.png>)

*Full interactive dashboard available on request.*

## SQL Files
| File | Description |
|---|---|
| superstore-data-cleaning.sql | Handling nulls, duplicates, type casting |
| superstore-exploratory-analysis.sql | Initial dataset profiling |
| superstore-business-analysis.sql | Core business questions |
| superstore-insights.sql | Advanced analysis with window functions |
