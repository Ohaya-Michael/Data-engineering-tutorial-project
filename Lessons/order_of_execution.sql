SELECT 
    COUNT(jpf.*) as job_posting_count,
    cd.name as company_name
FROM job_postings_fact as jpf
LEFT JOIN company_dim as cd
    ON jpf.company_id = cd.company_id
WHERE jpf.job_country = 'United States'
GROUP BY company_name
HAVING COUNT(jpf.job_id) > 3000
ORDER BY job_posting_count DESC;

/*
Results:
┌───────────────────┬─────────────────────┐
│ job_posting_count │    company_name     │
│       int64       │       varchar       │
├───────────────────┼─────────────────────┤
│             10507 │ beBee Careers       │
│              5765 │ Capital One         │
│              5491 │ Dice                │
│              4156 │ Booz Allen Hamilton │
│              3757 │ Insight Global      │
│              3391 │ Walmart             │
│              3312 │ Jobs via Dice       │
│              3258 │ SynergisticIT       │
└───────────────────┴─────────────────────┘
*/

/*
Other examples of using GROUP BY and HAVING clauses to filter results based on aggregate functions:

SELECT customer_id, COUNT(order_id) AS anzahl_bestellungen
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 5;

SELECT department, SUM(salary) AS gesamt_gehalt
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

SELECT product_id, AVG(rating) AS schnitt_bewertung
FROM reviews
GROUP BY product_id
HAVING AVG(rating) < 3.0;
*/

/*
Oder of execution of SQL clauses:

FROM 
→ 
WHERE 
→ 
GROUP BY 
→ 
aggregate functions 
→
HAVING 
→ 
SELECT 
→ 
ORDER BY 
→ 
LIMIT
*/