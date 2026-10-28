# Multi-Table SQL Queries & Cohort Retention Analysis

## Project Overview
This project demonstrates SQL-based customer analytics using a sample online shopping database. It covers multi-table joins, customer spending analysis, first-purchase identification, and monthly cohort retention.

## Objectives
- Combine relational tables using INNER JOIN.
- Calculate total orders and customer spending.
- Identify each customer's first purchase date.
- Group customers into monthly cohorts.
- Calculate monthly customer retention percentages.

## Tools Used
- MySQL
- SQL Fiddle
- GitHub

## Database Schema
The project contains three tables:

| Table | Description |
|---|---|
| `customers` | Customer IDs and names |
| `orders` | Order IDs, customer IDs, and order dates |
| `order_items` | Products and purchase amounts |

## SQL Concepts Practised
- SELECT and filtering
- INNER JOIN
- COUNT() and SUM()
- GROUP BY and ORDER BY
- Common Table Expressions (CTEs)
- Date functions
- Cohort retention calculations

## Key Findings
- Asha placed 2 orders and spent 51,500.00.
- Priya placed 1 order and spent 12,000.00.
- Rahul placed 1 order and spent 500.00.
- The January 2026 cohort had 50% retention in February 2026.

## Files Included
- `setup.sql` — creates the sample tables and inserts data.
- `cohort_retention.sql` — contains the analysis queries.

## How to Run
1. Open a MySQL-compatible SQL editor.
2. Execute `setup.sql` first.
3. Execute the queries in `cohort_retention.sql`.
4. Review the query outputs.

## Conclusion
This project demonstrates how SQL can combine relational data, summarize customer purchasing behaviour, and measure customer retention over time.

## Dataset Note
This is a small sample dataset created for learning and demonstration. The results are illustrative and should not be treated as representative of a real business.
