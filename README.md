SQL-based credit risk analysis examining borrower characteristics, loan attributes, and default patterns using MySQL.
# Credit Risk Analysis Using SQL

## Project Overview

This project analyses borrower-level credit data using MySQL to identify
patterns associated with loan default and develop an analytical framework
for borrower risk segmentation.

## Business Objective

The objective is to identify borrower and loan characteristics associated
with higher observed default rates and translate these patterns into
actionable lending-risk insights.

## Dataset

The dataset contains 32,581 borrower-level observations and 12 variables
covering:

- Demographics
- Income
- Employment
- Home ownership
- Loan purpose
- Loan amount
- Interest rate
- Loan grade
- Credit history
- Previous default history
- Loan status

## Tools

- MySQL
- MySQL Workbench
- GitHub
- SQL

## Key Questions

1. What is the overall loan default rate?
2. Which loan grades have the highest default rates?
3. Does loan burden relative to income affect observed default?
4. Which loan purposes are associated with higher risk?
5. How does previous default history relate to current default?
6. Can borrowers be segmented into different risk categories?

## SQL Techniques Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- CASE WHEN
- Aggregate functions
- Subqueries
- HAVING
- Common Table Expressions
- Window functions
- RANK()

## Project Structure

```text
sql/
├── 01_database_setup.sql
├── 02_data_validation.sql
├── 03_exploratory_analysis.sql
├── 04_default_analysis.sql
├── 05_risk_segmentation.sql
└── 06_advanced_analysis.sql

data/
└── README.md

insights/
└── findings.md
