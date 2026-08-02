/*
Question: What are the most in-demand skills for data-engineers 
- Identify the top 1 in-demand skills for data engineers
- Focus on remote jobs postings only
- Why? Retrieve the top 10 skills with the highest demand in the remote job market for data engineers, providing insights into the most valued skills for data engineers in the current job market. This information can help job seekers and professionals to focus on acquiring the skills that are most sought after by employers, thereby increasing their employability and career prospects.
    providing insights into the most valued skills for data engineers in the current job market. This information can help job seekers and professionals to focus on acquiring the skills that are most sought after by employers, thereby increasing their employability and career prospects.
*/

SELECT 
    sd.skills,
    COUNT(spf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short ILIKE '%Data Engineer%'
    AND jpf.job_work_from_home = True
GROUP BY 
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;

/*
 SELECT 
    sd.skills,
    COUNT(spf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short ILIKE '%data engineer%'
    AND jpf.job_work_from_home = True
GROUP BY 
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        38368 │
│ python     │        38117 │
│ aws        │        24514 │
│ azure      │        18707 │
│ spark      │        17591 │
│ airflow    │        13395 │
│ snowflake  │        11781 │
│ databricks │        10962 │
│ java       │         9993 │
│ kafka      │         9315 │
└────────────┴──────────────┘
  10 rows         2 columns
*/


/* OR */


SELECT 
    sd.skills,
    COUNT(jpf.job_id) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
GROUP BY 
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;


/*
SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
GROUP BY 
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns
*/