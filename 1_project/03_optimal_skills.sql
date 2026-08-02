/*
Question: What are the most optimal skills for data-engineers balancing both demand and salary
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salary.
- Why? 
    - This aproach highlights skills that balance market demand and financial reward. It weights core skills appropriately, providing a more holistic view of skill value for data engineers. This information can help job seekers and professionals to focus on acquiring the skills that are most sought after by employers, thereby increasing their employability and career prospects. 
*/


SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)), 2) AS ln_demand_count,
    ROUND(((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1000000), 2) AS weighted_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
HAVING 
    COUNT(jpf.*) > 100
ORDER BY 
    weighted_score DESC
LIMIT 25;

/*
┌────────────┬───────────────┬─────────────────┬────────────────┐
│   skills   │ median_salary │ ln_demand_count │ weighted_score │
│  varchar   │    double     │     double      │     double     │
├────────────┼───────────────┼─────────────────┼────────────────┤
│ terraform  │      184000.0 │            5.26 │           0.97 │
│ python     │      135000.0 │            7.03 │           0.95 │
│ sql        │      130000.0 │            7.03 │           0.91 │
│ aws        │      137320.0 │            6.66 │           0.91 │
│ airflow    │      150000.0 │            5.96 │           0.89 │
│ spark      │      140000.0 │            6.22 │           0.87 │
│ kafka      │      145000.0 │            5.68 │           0.82 │
│ snowflake  │      135500.0 │            6.08 │           0.82 │
│ azure      │      128000.0 │            6.16 │           0.79 │
│ java       │      135000.0 │            5.71 │           0.77 │
│ scala      │      137290.0 │            5.51 │           0.76 │
│ git        │      140000.0 │            5.34 │           0.75 │
│ kubernetes │      150500.0 │            4.99 │           0.75 │
│ databricks │      132750.0 │            5.58 │           0.74 │
│ redshift   │      130000.0 │            5.61 │           0.73 │
│ gcp        │      136000.0 │            5.28 │           0.72 │
│ nosql      │      134415.0 │            5.26 │           0.71 │
│ hadoop     │      135000.0 │            5.29 │           0.71 │
│ pyspark    │      140000.0 │            5.02 │            0.7 │
│ mongodb    │      135750.0 │            4.91 │           0.67 │
│ docker     │      135000.0 │            4.97 │           0.67 │
│ go         │      140000.0 │            4.73 │           0.66 │
│ r          │      134775.0 │            4.89 │           0.66 │
│ github     │      135000.0 │            4.84 │           0.65 │
│ bigquery   │      135000.0 │            4.81 │           0.65 │
└────────────┴───────────────┴─────────────────┴────────────────┘
  25 rows                                             4 columns
*/



SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)), 2) AS ln_demand_count,
    ROUND(((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1000000), 2) AS weighted_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
HAVING 
    COUNT(jpf.*) > 100
ORDER BY 
    weighted_score DESC
LIMIT 25;

/*
┌────────────┬───────────────┬──────────────┬─────────────────┬────────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand_count │ weighted_score │
│  varchar   │    double     │    int64     │     double      │     double     │
├────────────┼───────────────┼──────────────┼─────────────────┼────────────────┤
│ terraform  │      184000.0 │          193 │            5.26 │           0.97 │
│ python     │      135000.0 │         1133 │            7.03 │           0.95 │
│ sql        │      130000.0 │         1128 │            7.03 │           0.91 │
│ aws        │      137320.0 │          783 │            6.66 │           0.91 │
│ airflow    │      150000.0 │          386 │            5.96 │           0.89 │
│ spark      │      140000.0 │          503 │            6.22 │           0.87 │
│ snowflake  │      135500.0 │          438 │            6.08 │           0.82 │
│ kafka      │      145000.0 │          292 │            5.68 │           0.82 │
│ azure      │      128000.0 │          475 │            6.16 │           0.79 │
│ java       │      135000.0 │          303 │            5.71 │           0.77 │
│ scala      │      137290.0 │          247 │            5.51 │           0.76 │
│ git        │      140000.0 │          208 │            5.34 │           0.75 │
│ kubernetes │      150500.0 │          147 │            4.99 │           0.75 │
│ databricks │      132750.0 │          266 │            5.58 │           0.74 │
│ redshift   │      130000.0 │          274 │            5.61 │           0.73 │
│ gcp        │      136000.0 │          196 │            5.28 │           0.72 │
│ hadoop     │      135000.0 │          198 │            5.29 │           0.71 │
│ nosql      │      134415.0 │          193 │            5.26 │           0.71 │
│ pyspark    │      140000.0 │          152 │            5.02 │            0.7 │
│ docker     │      135000.0 │          144 │            4.97 │           0.67 │
│ mongodb    │      135750.0 │          136 │            4.91 │           0.67 │
│ r          │      134775.0 │          133 │            4.89 │           0.66 │
│ go         │      140000.0 │          113 │            4.73 │           0.66 │
│ bigquery   │      135000.0 │          123 │            4.81 │           0.65 │
│ github     │      135000.0 │          127 │            4.84 │           0.65 │
└────────────┴───────────────┴──────────────┴─────────────────┴────────────────┘
  25 rows    
*/