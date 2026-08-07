/* 
    Data Types
    - Integer
    - Decimal
    - Date
    Cast function is used to convert data types in SQL.
    example: 
    CAST(column_name AS data_type) or 
    column_name::data_type
*/

"Write an SQL query that retrieves the first 10 records from the table job_postings_fact. Only include entries where information about the home office, the posting date, and the average annual salary are all fully present. Additionally, convert the data types of the columns to Integer, Date, and Decimal (with 2 decimal places)."

SELECT 
    job_id,
    CAST(job_work_from_home AS INTEGER) AS job_work_from_home,
    CAST(job_posted_date AS DATE) AS job_posted_date,
    CAST(salary_year_avg AS DECIMAL(10, 2)) AS salary_year_avg
FROM
    job_postings_fact
WHERE
    job_work_from_home IS NOT NULL
    AND job_posted_date IS NOT NULL
    AND salary_year_avg IS NOT NULL
LIMIT 10;

/**
The above query can also be written using the shorthand syntax for casting data types in SQL.
┌────────┬────────────────────┬─────────────────┬─────────────────┐
│ job_id │ job_work_from_home │ job_posted_date │ salary_year_avg │
│ int32  │       int32        │      date       │  decimal(10,2)  │
├────────┼────────────────────┼─────────────────┼─────────────────┤
│   4651 │                  0 │ 2023-01-01      │       110000.00 │
│   4699 │                  0 │ 2023-01-01      │        65000.00 │
│   4804 │                  1 │ 2023-01-01      │        90000.00 │
│   4810 │                  0 │ 2023-01-01      │        55000.00 │
│   4833 │                  0 │ 2023-01-01      │       120531.00 │
│   4846 │                  0 │ 2023-01-01      │       300000.00 │
│   5089 │                  0 │ 2023-01-01      │        51000.00 │
│   5123 │                  0 │ 2023-01-01      │       133500.00 │
│   5321 │                  0 │ 2023-01-01      │        77500.00 │
│   5325 │                  0 │ 2023-01-01      │       125000.00 │
└────────┴────────────────────┴─────────────────┴─────────────────┘
  10 rows                                               4 columns

*/


SELECT 
    job_id,
    job_work_from_home::INTEGER AS job_work_from_home,
    job_posted_date::DATE AS job_posted_date,
    salary_year_avg::DECIMAL(10, 2) AS salary_year_avg
FROM
    job_postings_fact
WHERE
    job_work_from_home IS NOT NULL
    AND job_posted_date IS NOT NULL
    AND salary_year_avg IS NOT NULL
LIMIT 10;

/**
The above query can also be written using the shorthand syntax for casting data types in SQL.
┌────────┬────────────────────┬─────────────────┬─────────────────┐
│ job_id │ job_work_from_home │ job_posted_date │ salary_year_avg │
│ int32  │       int32        │      date       │  decimal(10,2)  │
├────────┼────────────────────┼─────────────────┼─────────────────┤
│   4651 │                  0 │ 2023-01-01      │       110000.00 │
│   4699 │                  0 │ 2023-01-01      │        65000.00 │
│   4804 │                  1 │ 2023-01-01      │        90000.00 │
│   4810 │                  0 │ 2023-01-01      │        55000.00 │
│   4833 │                  0 │ 2023-01-01      │       120531.00 │
│   4846 │                  0 │ 2023-01-01      │       300000.00 │
│   5089 │                  0 │ 2023-01-01      │        51000.00 │
│   5123 │                  0 │ 2023-01-01      │       133500.00 │
│   5321 │                  0 │ 2023-01-01      │        77500.00 │
│   5325 │                  0 │ 2023-01-01      │       125000.00 │
└────────┴────────────────────┴─────────────────┴─────────────────┘
  10 rows                                               4 columns
*/


--**0.**
-- "Modify the previous query so that, instead of the first 10 records,
-- it calculates the overall average salary (`salary_year_avg`) of all 
-- filtered home-office positions. Name the output column 
-- `remote_salary_average`."


SELECT 
    job_id,
    job_work_from_home::INTEGER AS job_work_from_home,
    job_posted_date::DATE AS job_posted_date,
    salary_year_avg::DECIMAL(10, 2) AS salary_year_avg,
    AVG(salary_year_avg) AS remote_salary_average
FROM
    job_postings_fact
WHERE
    job_work_from_home IS NOT NULL
    AND job_posted_date IS NOT NULL
    AND salary_year_avg IS NOT NULL
GROUP BY
    job_id,
    job_work_from_home,
    job_posted_date,
    salary_year_avg
LIMIT 10;

/*
┌────────┬────────────────────┬───┬─────────────────┬───────────────────────┐
│ job_id │ job_work_from_home │ … │ salary_year_avg │ remote_salary_average │
│ int32  │       int32        │ … │  decimal(10,2)  │        double         │
├────────┼────────────────────┼───┼─────────────────┼───────────────────────┤
│ 258567 │                  0 │ … │       190000.00 │              190000.0 │
│ 258954 │                  0 │ … │        75000.00 │               75000.0 │
│ 260213 │                  0 │ … │       200000.00 │              200000.0 │
│ 260335 │                  1 │ … │       142500.00 │              142500.0 │
│ 260464 │                  0 │ … │       111175.00 │              111175.0 │
│ 262821 │                  0 │ … │        98500.00 │               98500.0 │
│ 263212 │                  0 │ … │       123500.00 │              123500.0 │
│ 263468 │                  1 │ … │       145000.00 │              145000.0 │
│ 263650 │                  0 │ … │        95000.00 │               95000.0 │
│ 263651 │                  0 │ … │        80000.00 │               80000.0 │
└────────┴────────────────────┴───┴─────────────────┴───────────────────────┘
  10 rows        use .last to show entire result        5 columns (4 shown)
*/



--**1.**
-- "Write an SQL query that retrieves the first 10 records from 
-- the table `job_postings_fact`. Only include entries where the 
-- job title (`job_title_short`), the country (`job_country`), 
-- and the average annual salary are present. Additionally, 
-- convert the salary to Decimal (with 2 decimal places) and 
-- rename the column to `annual_salary`."

SELECT 
    job_title_short AS job_title,
    job_country AS country,
    salary_year_avg::DECIMAL(10, 2) AS annual_salary
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
    AND job_country IS NOT NULL
    AND job_title_short IS NOT NULL
LIMIT 10;

/*
┌──────────────────┬───────────────┬───────────────┐
│    job_title     │    country    │ annual_salary │
│     varchar      │    varchar    │ decimal(10,2) │
├──────────────────┼───────────────┼───────────────┤
│ Data Scientist   │ United States │     110000.00 │
│ Data Engineer    │ Argentina     │      65000.00 │
│ Business Analyst │ United States │      90000.00 │
│ Data Analyst     │ United States │      55000.00 │
│ Data Scientist   │ United States │     120531.00 │
│ Data Engineer    │ United States │     300000.00 │
│ Data Analyst     │ Switzerland   │      51000.00 │
│ Data Scientist   │ United States │     133500.00 │
│ Data Analyst     │ United States │      77500.00 │
│ Data Scientist   │ United States │     125000.00 │
└──────────────────┴───────────────┴───────────────┘
  10 rows                                3 columns
*/

--**2.**
-- "Write an SQL query that retrieves all home-office positions 
-- (`job_work_from_home`) whose average annual salary is above 
-- 100,000. Show only the columns `job_id`, `job_title`, and 
-- `salary_year_avg`, and sort the result in descending order 
-- by salary. Limit the output to 10 records."


SELECT 
    job_id,
    job_title_short AS job_title,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg > 100000
    AND job_work_from_home
ORDER BY
    salary_year_avg DESC
LIMIT 10;


/*
┌─────────┬───────────────────────┬─────────────────┐
│ job_id  │       job_title       │ salary_year_avg │
│  int32  │        varchar        │     double      │
├─────────┼───────────────────────┼─────────────────┤
│ 1574285 │ Data Scientist        │        680000.0 │
│  142665 │ Data Analyst          │        650000.0 │
│  499552 │ Data Scientist        │        550000.0 │
│  543480 │ Data Scientist        │        525000.0 │
│   95558 │ Senior Data Scientist │        475000.0 │
│ 1283788 │ Data Analyst          │        445000.0 │
│ 1578513 │ Data Engineer         │        445000.0 │
│ 1231335 │ Data Engineer         │        445000.0 │
│ 1241978 │ Data Engineer         │        445000.0 │
│ 1241985 │ Data Analyst          │        445000.0 │
└─────────┴───────────────────────┴─────────────────┘
  10 rows                                 3 columns
*/


--**3.**
--"Write an SQL query that retrieves the first 10 records from 
-- `job_postings_fact` where the posting date (`job_posted_date`) 
-- and the schedule type (`job_schedule_type`) are fully present. 
-- Convert the posting date to the Date data type and additionally 
-- extract only the year into a new column called `posting_year`."

SELECT 
    job_posted_date::DATE AS job_posted_date,
    EXTRACT(YEAR FROM job_posted_date) AS posting_year,
    job_schedule_type AS job_schedule_type
FROM
    job_postings_fact
WHERE
    job_posted_date IS NOT NULL
    AND JOB_schedule_type IS NOT NULL
LIMIT 10;

/*
┌─────────────────┬──────────────┬───────────────────┐
│ job_posted_date │ posting_year │ job_schedule_type │
│      date       │    int64     │      varchar      │
├─────────────────┼──────────────┼───────────────────┤
│ 2023-01-01      │         2023 │ Full-time         │
│ 2023-01-01      │         2023 │ Full-time         │
│ 2023-01-01      │         2023 │ Full-time         │
│ 2023-01-01      │         2023 │ Full-time         │
│ 2023-01-01      │         2023 │ Full-time         │
│ 2023-01-01      │         2023 │ Full-time         │
│ 2023-01-01      │         2023 │ Full-time         │
│ 2023-01-01      │         2023 │ Full-time         │
│ 2023-01-01      │         2023 │ Full-time         │
│ 2023-01-01      │         2023 │ Full-time         │
└─────────────────┴──────────────┴───────────────────┘
  10 rows                                  3 columns
*/

--**4.**
--"Write an SQL query that retrieves the first 10 records where 
-- both the annual salary (`salary_year_avg`) and the hourly salary
-- (`salary_hour_avg`) are present. Convert both columns to Decimal
-- (with 2 decimal places)."

SELECT 
    salary_year_avg::DECIMAL(10, 2) AS salary_year_avg,
    salary_hour_avg::DECIMAL(10, 2) AS salary_hour_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
    AND salary_hour_avg IS NOT NULL
LIMIT 10;

/*
┌─────────────────┬─────────────────┐
│ salary_year_avg │ salary_hour_avg │
│  decimal(10,2)  │  decimal(10,2)  │
└─────────────────┴─────────────────┘
               0 rows
*/

--**5.**
-- "Write an SQL query that retrieves the first 10 records where 
-- the health insurance information (`job_health_insurance`) and 
-- the home-office information (`job_work_from_home`) are present.
-- Convert both columns to Integer, and limit the output to positions
-- in the country (`job_country`) 'Germany'."


SELECT 
    --job_country AS job_country,
    job_health_insurance::INTEGER AS job_health_insurance,
    job_work_from_home::INTEGER AS job_work_from_home
FROM
    job_postings_fact
WHERE
    job_health_insurance IS NOT NULL
    AND job_work_from_home IS NOT NULL
    AND job_country = 'Germany'
LIMIT 10;

/*
┌─────────────┬──────────────────────┬────────────────────┐
│ job_country │ job_health_insurance │ job_work_from_home │
│   varchar   │        int32         │       int32        │
├─────────────┼──────────────────────┼────────────────────┤
│ Germany     │                    0 │                  0 │
│ Germany     │                    0 │                  0 │
│ Germany     │                    0 │                  0 │
│ Germany     │                    0 │                  0 │
│ Germany     │                    0 │                  0 │
│ Germany     │                    0 │                  0 │
│ Germany     │                    0 │                  0 │
│ Germany     │                    0 │                  0 │
│ Germany     │                    0 │                  0 │
│ Germany     │                    0 │                  0 │
└─────────────┴──────────────────────┴────────────────────┘
  10 rows                                       3 columns

┌──────────────────────┬────────────────────┐
│ job_health_insurance │ job_work_from_home │
│        int32         │       int32        │
├──────────────────────┼────────────────────┤
│                    0 │                  0 │
│                    0 │                  0 │
│                    0 │                  0 │
│                    0 │                  0 │
│                    0 │                  0 │
│                    0 │                  0 │
│                    0 │                  0 │
│                    0 │                  0 │
│                    0 │                  0 │
│                    0 │                  0 │
└──────────────────────┴────────────────────┘
  10 rows                         2 columns
*/



