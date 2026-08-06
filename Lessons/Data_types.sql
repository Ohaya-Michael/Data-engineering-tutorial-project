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


/*
"Modify the previous query so that, instead of the first 10 records,
it calculates the overall average salary (`salary_year_avg`) of all 
filtered home-office positions. Name the output column 
`remote_salary_average`."
*/

--**1.**
-- "Write an SQL query that retrieves the first 10 records from the table `job_postings_fact`. Only include entries where the job title (`job_title_short`), the country (`job_country`), and the average annual salary are present. Additionally, convert the salary to Decimal (with 2 decimal places) and rename the column to `annual_salary`."


--**2.**
-- "Write an SQL query that retrieves all home-office positions (`job_work_from_home`) whose average annual salary is above 100,000. Show only the columns `job_id`, `job_title`, and `salary_year_avg`, and sort the result in descending order by salary. Limit the output to 10 records."


--**3.**
--"Write an SQL query that retrieves the first 10 records from `job_postings_fact` where the posting date (`job_posted_date`) and the schedule type (`job_schedule_type`) are fully present. Convert the posting date to the Date data type and additionally extract only the year into a new column called `posting_year`."


--**4.**
--"Write an SQL query that retrieves the first 10 records where both the annual salary (`salary_year_avg`) and the hourly salary (`salary_hour_avg`) are present. Convert both columns to Decimal (with 2 decimal places)."


--**5.**
-- "Write an SQL query that retrieves the first 10 records where the health insurance information (`job_health_insurance`) and the home-office information (`job_work_from_home`) are present. Convert both columns to Integer, and limit the output to positions in the country (`job_country`) 'Germany'."






