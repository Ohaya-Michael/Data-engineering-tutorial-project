/*
Question: What are the highest paying skills for data-engineers
- Calcukate the median salary for each skill required for data engineers
- Focus on remote jobs postings with specified salary only
- incude skills frequency to identify both salary and demand
why? 
    - Help identify which skills command the highest compensation 
      while also showing how common those skills are, providing a
      more complete picture for skills development priorities

    - Median is used instead of avaerage to reduce the impact of 
      outlier salary values, providing a more accurate representation 
      of the typical salary associated with each skill.
*/
  

SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 2) AS median_salary,
    COUNT(spf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short ILIKE 'Data Engineer%'
    AND jpf.job_work_from_home = True
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
ORDER BY median_salary DESC
LIMIT 25;

/*
┌───────────┬───────────────┬──────────────┐
│  skills   │ median_salary │ demand_count │
│  varchar  │    double     │    int64     │
├───────────┼───────────────┼──────────────┤
│ rust      │      210000.0 │           23 │
│ sheets    │      196698.0 │            2 │
│ solidity  │      192500.0 │            3 │
│ golang    │      184000.0 │           39 │
│ terraform │      184000.0 │          193 │
│ next.js   │      180000.0 │            2 │
│ ggplot2   │      176250.0 │            2 │
│ spring    │      175500.0 │           33 │
│ erlang    │      172500.0 │            1 │
│ haskell   │      172500.0 │            1 │
│ ocaml     │      172500.0 │            1 │
│ neo4j     │      170000.0 │           11 │
│ gdpr      │      169616.0 │           22 │
│ zoom      │      168438.0 │           12 │
│ graphql   │      167500.0 │           28 │
│ plotly    │      162500.0 │            3 │
│ mongo     │      162250.0 │           14 │
│ centos    │      159350.0 │            2 │
│ mxnet     │      157500.0 │            1 │
│ fastapi   │      157500.0 │            3 │
│ drupal    │      156000.0 │            1 │
│ vue       │      156000.0 │            1 │
│ django    │      155000.0 │            5 │
│ bitbucket │      155000.0 │            9 │
│ trello    │      155000.0 │            1 │
└───────────┴───────────────┴──────────────┘
  25 rows                        3 columns
*/



SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 2) AS median_salary,
    COUNT(spf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short ILIKE 'Data Engineer%'
    AND jpf.job_work_from_home = True
GROUP BY 
    sd.skills
ORDER BY median_salary DESC
LIMIT 25;

/*
┌───────────┬───────────────┬──────────────┐
│  skills   │ median_salary │ demand_count │
│  varchar  │    double     │    int64     │
├───────────┼───────────────┼──────────────┤
│ rust      │      210000.0 │          232 │
│ sheets    │      196698.0 │           98 │
│ solidity  │      192500.0 │           45 │
│ terraform │      184000.0 │         3248 │
│ golang    │      184000.0 │          912 │
│ next.js   │      180000.0 │           19 │
│ ggplot2   │      176250.0 │           15 │
│ spring    │      175500.0 │          364 │
│ haskell   │      172500.0 │           17 │
│ ocaml     │      172500.0 │            1 │
│ erlang    │      172500.0 │            9 │
│ neo4j     │      170000.0 │          277 │
│ gdpr      │      169616.0 │          582 │
│ zoom      │      168438.0 │          127 │
│ graphql   │      167500.0 │          445 │
│ plotly    │      162500.0 │           61 │
│ mongo     │      162250.0 │          265 │
│ centos    │      159350.0 │           31 │
│ fastapi   │      157500.0 │          204 │
│ mxnet     │      157500.0 │            5 │
│ drupal    │      156000.0 │            9 │
│ vue       │      156000.0 │           71 │
│ trello    │      155000.0 │           36 │
│ bitbucket │      155000.0 │          478 │
│ django    │      155000.0 │          265 │
└───────────┴───────────────┴──────────────┘
  25 rows                        3 columns
*/



SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 2) AS median_salary,
    COUNT(spf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short ILIKE 'Data Engineer%'
    AND jpf.job_work_from_home = True
GROUP BY 
    sd.skills
HAVING COUNT(spf.*) > 100
ORDER BY median_salary DESC
LIMIT 25;

/*
┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169615.5 │          582 │
│ zoom       │      168437.5 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ bitbucket  │      155000.0 │          478 │
│ django     │      155000.0 │          265 │
│ crystal    │      154223.5 │          129 │
│ atlassian  │      151500.0 │          249 │
│ c          │      151500.0 │          444 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ ruby       │      150000.0 │          736 │
│ node       │      150000.0 │          179 │
│ css        │      150000.0 │          262 │
│ airflow    │      150000.0 │         9996 │
│ redis      │      149000.0 │          605 │
│ vmware     │     148798.25 │          136 │
│ ansible    │     148798.25 │          475 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘
  25 rows                         3 columns
*/