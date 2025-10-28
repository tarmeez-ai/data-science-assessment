# Data Science Assessment - SQL Challenge

## Overview
Write a SQL query to calculate each investor's portfolio allocation percentage by sector.

## Database Schema

**investor_transactions**
- `investor_id` (INTEGER)
- `sector_id` (INTEGER)
- `no_of_shares` (INTEGER)

**sectors**
- `sector_id` (INTEGER, PRIMARY KEY)
- `sector_name` (TEXT)

## Instructions

1. **Write your SQL query** in `answer.sql`
2. **Test your solution** by running:
   ```bash
   python main.py
   ```
3. **Verify the test passes** ✅
4. **Copy your SQL query** from `answer.sql`
5. **Submit** your query through the Google Form provided

## Expected Output Format
Your query should return: `investor_id`, `sector_name`, `percentage`

The percentage should represent each sector's allocation within an investor's total portfolio.

---

**Note**: Make sure your test passes before submitting!

