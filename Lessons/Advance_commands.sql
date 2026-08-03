-- Comparism Operator
-- LIKE or wildcard (%...%, __ for 2 xters)


SELECT
  job_id,
  job_title_short,
  job_location,
  salary_year_avg,
  job_work_from_home,
FROM
  job_postings_fact
WHERE 
  job_title_short LIKE '%Engineer%'
LIMIT 10;

  /*
  ┌────────┬──────────────────────┬───┬─────────────────┬────────────────────┐
│ job_id │   job_title_short    │ … │ salary_year_avg │ job_work_from_home │
│ int32  │       varchar        │ … │     double      │      boolean       │
├────────┼──────────────────────┼───┼─────────────────┼────────────────────┤
│   4618 │ Data Engineer        │ … │            NULL │ false              │
│   4635 │ Senior Data Engineer │ … │            NULL │ false              │
│   4656 │ Data Engineer        │ … │            NULL │ false              │
│   4657 │ Data Engineer        │ … │            NULL │ false              │
│   4658 │ Data Engineer        │ … │            NULL │ false              │
│   4659 │ Senior Data Engineer │ … │            NULL │ false              │
│   4664 │ Data Engineer        │ … │            NULL │ false              │
│   4665 │ Data Engineer        │ … │            NULL │ false              │
│   4666 │ Data Engineer        │ … │            NULL │ false              │
│   4668 │ Data Engineer        │ … │            NULL │ false              │
└────────┴──────────────────────┴───┴─────────────────┴────────────────────┘
  10 rows       use .last to show entire result        5 columns (4 shown)
  */



-- Comparism Operator
-- LIKE or wildcard (%...%, __ for 2 xters)


SELECT
  job_id,
  job_title_short,
  job_location,
  salary_year_avg,
  job_work_from_home,
FROM 
  job_postings_fact
WHERE 
  job_location LIKE 'Columbus, __'
LIMIT 10;

/*
  ┌────────┬──────────────────────┬───┬─────────────────┬────────────────────┐┌────────┬──────────────────────┬──────────────┬─────────────────┬────────────────────┐
│ job_id │   job_title_short    │ job_location │ salary_year_avg │ job_work_from_home │
│ int32  │       varchar        │   varchar    │     double      │      boolean       │
├────────┼──────────────────────┼──────────────┼─────────────────┼────────────────────┤
│   6532 │ Data Scientist       │ Columbus, OH │            NULL │ false              │
│   7602 │ Data Scientist       │ Columbus, GA │            NULL │ false              │
│   7619 │ Data Scientist       │ Columbus, OH │            NULL │ false              │
│  10966 │ Business Analyst     │ Columbus, OH │            NULL │ false              │
│  11620 │ Data Scientist       │ Columbus, OH │            NULL │ false              │
│  17053 │ Data Scientist       │ Columbus, OH │            NULL │ false              │
│  17731 │ Data Scientist       │ Columbus, OH │            NULL │ false              │
│  19922 │ Data Scientist       │ Columbus, OH │            NULL │ false              │
│  20976 │ Senior Data Engineer │ Columbus, OH │            NULL │ false              │
│  21016 │ Data Analyst         │ Columbus, NC │            NULL │ false              │
└────────┴──────────────────────┴──────────────┴─────────────────┴────────────────────┘
  10 rows                                                                   5 columns   
*/


-- Comparism Operator
-- LIKE or wildcard (%...%, __ for 2 xters)


SELECT
  job_id,
  job_title_short,
  job_location,
  salary_year_avg,
  job_work_from_home,
FROM
  job_postings_fact
WHERE 
  job_title_short LIKE '%Data%'
LIMIT 10;

/*
┌────────┬─────────────────────┬───┬─────────────────┬────────────────────┐
│ job_id │   job_title_short   │ … │ salary_year_avg │ job_work_from_home │
│ int32  │       varchar       │ … │     double      │      boolean       │
├────────┼─────────────────────┼───┼─────────────────┼────────────────────┤
│   4593 │ Data Analyst        │ … │            NULL │ false              │
│   4594 │ Data Analyst        │ … │            NULL │ false              │
│   4595 │ Data Analyst        │ … │            NULL │ false              │
│   4596 │ Senior Data Analyst │ … │            NULL │ false              │
│   4597 │ Data Analyst        │ … │            NULL │ false              │
│   4598 │ Data Analyst        │ … │            NULL │ false              │
│   4599 │ Data Analyst        │ … │            NULL │ false              │
│   4600 │ Data Analyst        │ … │            NULL │ false              │
│   4601 │ Senior Data Analyst │ … │            NULL │ false              │
│   4603 │ Data Analyst        │ … │            NULL │ false              │
└────────┴─────────────────────┴───┴─────────────────┴────────────────────┘
  10 rows       use .last to show entire result       5 columns (4 shown)
*/


-- Comparism Operator
-- LIKE or wildcard (%...%, __ for 2 xters)
-- Aliases


SELECT
  job_id,
  job_title_short AS job_title_fabricated,
  job_location AS location,
  salary_year_avg,
  job_work_from_home,
FROM
  job_postings_fact
WHERE 
  job_title_short LIKE '%Engineer%'
LIMIT 10;


/*
┌────────┬──────────────────────┬───┬─────────────────┬────────────────────┐
│ job_id │ job_title_fabricated │ … │ salary_year_avg │ job_work_from_home │
│ int32  │       varchar        │ … │     double      │      boolean       │
├────────┼──────────────────────┼───┼─────────────────┼────────────────────┤
│   4618 │ Data Engineer        │ … │            NULL │ false              │
│   4635 │ Senior Data Engineer │ … │            NULL │ false              │
│   4656 │ Data Engineer        │ … │            NULL │ false              │
│   4657 │ Data Engineer        │ … │            NULL │ false              │
│   4658 │ Data Engineer        │ … │            NULL │ false              │
│   4659 │ Senior Data Engineer │ … │            NULL │ false              │
│   4664 │ Data Engineer        │ … │            NULL │ false              │
│   4665 │ Data Engineer        │ … │            NULL │ false              │
│   4666 │ Data Engineer        │ … │            NULL │ false              │
│   4668 │ Data Engineer        │ … │            NULL │ false              │
└────────┴──────────────────────┴───┴─────────────────┴────────────────────┘
  10 rows       use .last to show entire result        5 columns (4 shown)
*/



/*
- Look for non-senior data engineer and non-senior software engineer roles
  - Only get job titles that include either 'Data' or 'Software'
  - Also include those with 'Engineer' in any part of the title
  - Don't include any job titles with 'Senior' or 'Sr' followed by any character
- Get the job_id, job_title, location and job platform
  - Rename the colums appropriately
*/

SELECT 
  job_id AS ID,
  job_location AS location,
  job_title AS title,
  job_via AS from_job_platform
FROM 
  job_postings_fact
WHERE (job_title LIKE '%Data%' 
      OR job_title LIKE '%Software%') 
      AND job_title LIKE '%Engineer%'
      AND NOT (job_title LIKE '%Senior%' OR job_title LIKE '%Sr%' OR job_title LIKE '%SENIOR%')

LIMIT 10;

/*
┌───────┬─────────────────────┬───────────────────────────────────┬───────────────────┐
│  ID   │      location       │               title               │ from_job_platform │
│ int32 │       varchar       │              varchar              │      varchar      │
├───────┼─────────────────────┼───────────────────────────────────┼───────────────────┤
│  4618 │ Austin, TX          │ Data Engineering Manager          │ via Mendeley      │
├───────┼─────────────────────┼───────────────────────────────────┼───────────────────┤
│  4656 │ Paris, France       │ Stage Data Engineer AWS & Databri │ via Recruit.net   │
│       │                     │ cks (H/F)                         │                   │
├───────┼─────────────────────┼───────────────────────────────────┼───────────────────┤
│  4658 │ Paris, France       │ Data Engineer (H/F)               │ via Jobrapido.com │
├───────┼─────────────────────┼───────────────────────────────────┼───────────────────┤
│  4664 │ Strasbourg, France  │ Data Engineer Strasbourg (F/H) -  │ via Recruit.net   │
│       │                     │ IBM Interactive                   │                   │
├───────┼─────────────────────┼───────────────────────────────────┼───────────────────┤
│  4665 │ France              │ Data Engineer F/H                 │ via Jobrapido.com │
├───────┼─────────────────────┼───────────────────────────────────┼───────────────────┤
│  4666 │ Paris, France       │ Stage : Data Engineer H/F         │ via Recruit.net   │
├───────┼─────────────────────┼───────────────────────────────────┼───────────────────┤
│  4668 │ Paris, France       │ Data Engineer [10] H/F (CDD)      │ via Talent.com    │
├───────┼─────────────────────┼───────────────────────────────────┼───────────────────┤
│  4670 │ Paris, France       │ CDI - Lead Data Engineer (Média)  │ via Recruit.net   │
│       │                     │ (F/H)                             │                   │
├───────┼─────────────────────┼───────────────────────────────────┼───────────────────┤
│  4682 │ Copenhagen, Denmark │ Data Engineer working with OSIsof │ via BeBee         │
│       │                     │ t PI and other SQL based...       │                   │
├───────┼─────────────────────┼───────────────────────────────────┼───────────────────┤
│  4683 │ Denmark             │ Data Engineer                     │ via BeBee         │
└───────┴─────────────────────┴───────────────────────────────────┴───────────────────┘
  10 rows                                                                   4 columns
*/


/*
- Look for non-senior cybersecurity and non-senior network roles
  - Only get job titles that include either 'Security' or 'Network'
  - Also include those with 'Analyst' in any part of the title
  - Don't include any job titles with 'Senior', 'Sr', or 'Lead' followed by any character
- Get the job_id, job_title, job_location, and job_via
  - Rename the columns appropriately
*/


SELECT 
  job_id AS ID,
  job_location AS location,
  job_title AS title,
  job_via AS from_job_platform
FROM 
  job_postings_fact
WHERE (job_title LIKE '%Security%' 
      OR job_title LIKE '%Network%') 
      AND job_title LIKE '%Analyst%'
      AND NOT (job_title LIKE '%Senior%' OR job_title LIKE '%Sr%' OR job_title LIKE '%Lead%')
LIMIT 10;

/*
┌───────┬────────────────────────────┬────────────────────────────┬───────────────────┐
│  ID   │          location          │           title            │ from_job_platform │
│ int32 │          varchar           │          varchar           │      varchar      │
├───────┼────────────────────────────┼────────────────────────────┼───────────────────┤
│  5221 │ Poland                     │ CyberSecurity Analyst Remo │ via Trabajo.org   │
│       │                            │ te                         │                   │
├───────┼────────────────────────────┼────────────────────────────┼───────────────────┤
│  5395 │ Rockville, MD              │ Network Pricing Data Analy │ via ZipRecruiter  │
│       │                            │ st - Remote                │                   │
├───────┼────────────────────────────┼────────────────────────────┼───────────────────┤
│  5422 │ Tel Aviv-Yafo, Israel      │ Network Analyst            │ via BeBee Israel  │
├───────┼────────────────────────────┼────────────────────────────┼───────────────────┤
│  5949 │ Vienna, Austria            │ IT Security Analyst/Engine │ via BeBee         │
│       │                            │ er                         │                   │
├───────┼────────────────────────────┼────────────────────────────┼───────────────────┤
│  6404 │ Kuala Lumpur, Federal Terr │ Open Position: Data Securi │ via Trabajo.org   │
│       │ itory of Kuala Lumpur, Mal │ ty, Analyst                │                   │
│       │ aysia                      │                            │                   │
├───────┼────────────────────────────┼────────────────────────────┼───────────────────┤
│  8151 │ Brussels, Belgium          │ Test Analyst Data & Report │ via EMPREGO       │
│       │                            │ ing for The Security       │                   │
├───────┼────────────────────────────┼────────────────────────────┼───────────────────┤
│  8203 │ Orlando, FL                │ Network Pricing Data Analy │ via Recruit.net   │
│       │                            │ st - Remote                │                   │
├───────┼────────────────────────────┼────────────────────────────┼───────────────────┤
│  8704 │ Tampa, FL                  │ Data Analyst /Operations R │ via DirectlyApply │
│       │                            │ esearch with Security Clea │                   │
│       │                            │ rance                      │                   │
├───────┼────────────────────────────┼────────────────────────────┼───────────────────┤
│  9420 │ Norco, CA                  │ Data Analyst - Security Cl │ via FOX4KC Jobs   │
│       │                            │ earance Required           │                   │
├───────┼────────────────────────────┼────────────────────────────┼───────────────────┤
│  9977 │ Montrouge, France          │ Security Data Analyst      │ via Ai-Jobs.net   │
└───────┴────────────────────────────┴────────────────────────────┴───────────────────┘
  10 rows                                                                   4 columns
*/


/*
- Look for non-manager data analyst and non-manager business intelligence roles
  - Only get job titles that include either 'Analyst' or 'Intelligence'
  - Also include those with 'BI' in any part of the title
  - Don't include any job titles with 'Manager', 'Mgmt', or 'Director' followed by any character
- Get the job_id, job_title, job_schedule_type, and company_id
  - Rename the columns appropriately
*/


SELECT 
  job_id AS ID,
  job_title AS title,
  job_schedule_type AS job_schedule,
  company_id 
FROM 
  job_postings_fact
WHERE (job_title LIKE '%Analyst%' 
      OR job_title LIKE '%Intelligence%') 
      AND job_title LIKE '%BI%'
      AND NOT (job_title LIKE '%Manager%' OR job_title LIKE '%Mgmt%' OR job_title LIKE '%Director%')
LIMIT 10;

/*
┌───────┬─────────────────────────────────────────────────┬──────────────┬────────────┐
│  ID   │                      title                      │ job_schedule │ company_id │
│ int32 │                     varchar                     │   varchar    │   int32    │
├───────┼─────────────────────────────────────────────────┼──────────────┼────────────┤
│  4606 │ BI Data Analyst                                 │ Full-time    │       4606 │
├───────┼─────────────────────────────────────────────────┼──────────────┼────────────┤
│  4609 │ BI Data Analyst                                 │ Full-time    │       4609 │
├───────┼─────────────────────────────────────────────────┼──────────────┼────────────┤
│  4691 │ BI Data Analyst (m/f)                           │ Full-time    │       4690 │
├───────┼─────────────────────────────────────────────────┼──────────────┼────────────┤
│  4752 │ G5090 - Business Intelligence (BI) & Data Analy │ Full-time    │       4752 │
│       │ tics Lead (Grade...                             │              │            │
├───────┼─────────────────────────────────────────────────┼──────────────┼────────────┤
│  4852 │ Internship Data Analyst Power BI - with Great B │ Full-time    │       4852 │
│       │ enefits [YOE-343]                               │              │            │
├───────┼─────────────────────────────────────────────────┼──────────────┼────────────┤
│  5038 │ Data Analyst (w/m/d) - Power BI / Tableau       │ Full-time    │       4711 │
├───────┼─────────────────────────────────────────────────┼──────────────┼────────────┤
│  5078 │ Data Analyst/ BI Developer - Part-time          │ Part-time    │       5016 │
├───────┼─────────────────────────────────────────────────┼──────────────┼────────────┤
│  5141 │ Business Process Consultant – Data and BI Analy │ Full-time    │       5141 │
│       │ st (m/w/d)                                      │              │            │
├───────┼─────────────────────────────────────────────────┼──────────────┼────────────┤
│  5216 │ Data Analyst Tableau/Power BI                   │ Full-time    │       4669 │
├───────┼─────────────────────────────────────────────────┼──────────────┼────────────┤
│  5225 │ Qlik Sense BI Analyst                           │ Full-time    │       5225 │
└───────┴─────────────────────────────────────────────────┴──────────────┴────────────┘
  10 rows                                                                   4 columns
*/



/*
- Look for non-principal cloud and non-principal infrastructure roles
  - Only get job titles that include either 'Cloud' or 'DevOps'
  - Also include those with 'Platform' in any part of the title
  - Don't include any job titles with 'Principal', 'Architect', or 'Staff' followed by any character
- Get the job_id, job_title, salary_year_avg, and job_work_from_home
  - Rename the columns appropriately
*/


SELECT 
  job_id AS ID,
  job_location AS Location,
  job_title AS Title,
  salary_year_avg AS Average_salary,
  job_work_from_home AS Remote
FROM 
  job_postings_fact
WHERE (job_title LIKE '%Cloud%' 
      OR job_title LIKE '%DevOps%') 
      AND job_title LIKE '%Platform%'
      AND NOT (job_title LIKE '%Principal%' OR job_title LIKE '%Architect%' OR job_title LIKE '%Staff%')
LIMIT 10;

/*
┌───────┬───────────────────────┬──────────────────────────┬────────────────┬─────────┐
│  ID   │       Location        │          Title           │ Average_salary │ Remote  │
│ int32 │        varchar        │         varchar          │     double     │ boolean │
├───────┼───────────────────────┼──────────────────────────┼────────────────┼─────────┤
│  4659 │ Bois-Colombes, France │ Data Engineer Senior Goo │           NULL │ false   │
│       │                       │ gle Cloud Platform (F/H) │                │         │
│       │                       │  - IBM Interactive       │                │         │
├───────┼───────────────────────┼──────────────────────────┼────────────────┼─────────┤
│  8668 │ Warsaw, Poland        │ Cloud Software Engineer, │           NULL │ false   │
│       │                       │  Data Platforms          │                │         │
├───────┼───────────────────────┼──────────────────────────┼────────────────┼─────────┤
│ 10742 │ Prague, Czechia       │ Senior DevOps Engineer - │           NULL │ false   │
│       │                       │  Data Platform           │                │         │
├───────┼───────────────────────┼──────────────────────────┼────────────────┼─────────┤
│ 11298 │ Kilkenny, Ireland     │ Senior Cyber Data Platfo │           NULL │ false   │
│       │                       │ rm Engineer, Cloud Secur │                │         │
│       │                       │ ity                      │                │         │
├───────┼───────────────────────┼──────────────────────────┼────────────────┼─────────┤
│ 12355 │ Warsaw, Poland        │ Senior Cloud Support Eng │           NULL │ false   │
│       │                       │ ineer - Data Platform    │                │         │
├───────┼───────────────────────┼──────────────────────────┼────────────────┼─────────┤
│ 12361 │ Warsaw, Poland        │ DevOps Engineer Streamin │           NULL │ false   │
│       │                       │ g Data Platform          │                │         │
├───────┼───────────────────────┼──────────────────────────┼────────────────┼─────────┤
│ 13210 │ Sydney NSW, Australia │ Senior DevOps/Platform E │           NULL │ false   │
│       │                       │ ngineer | Remote remote  │                │         │
├───────┼───────────────────────┼──────────────────────────┼────────────────┼─────────┤
│ 14859 │ Warsaw, Poland        │ DevOps Engineer Cloud Bi │           NULL │ false   │
│       │                       │ g Data Platform          │                │         │
├───────┼───────────────────────┼──────────────────────────┼────────────────┼─────────┤
│ 14954 │ Copenhagen, Denmark   │ Software engineer for Cl │           NULL │ false   │
│       │                       │ oud Analytics Platform   │                │         │
├───────┼───────────────────────┼──────────────────────────┼────────────────┼─────────┤
│ 17519 │ Anywhere              │ Cloud Platform Engineer  │           NULL │ true    │
└───────┴───────────────────────┴──────────────────────────┴────────────────┴─────────┘
  10 rows                                                                   5 columns
*/



/*
- Look for non-intern frontend and non-intern mobile developer roles
  - Only get job titles that include either 'Frontend' or 'Mobile'
  - Also include those with 'Web' in any part of the title
  - Don't include any job titles with 'Intern', 'Junior', or 'Jr' followed by any character
- Get the job_id, job_title, search_location, and salary_hour_avg
  - Rename the columns appropriately
*/


SELECT 
  job_id AS ID,
  job_title AS Title,
  search_location AS Location,
  salary_year_avg AS Average_salary
FROM 
  job_postings_fact
WHERE (job_title LIKE '%Frontend%' 
      OR job_title LIKE '%Mobile%') 
      AND job_title LIKE '%Web%'
      AND NOT (job_title LIKE '%Intern%' OR job_title LIKE '%Junior%' OR job_title LIKE '%Jr%')
LIMIT 10;


/*
┌────────┬────────────────────────────────────────────────┬──────────┬────────────────┐
│   ID   │                     Title                      │ Location │ Average_salary │
│ int32  │                    varchar                     │ varchar  │     double     │
├────────┼────────────────────────────────────────────────┼──────────┼────────────────┤
│  40077 │ Data Analyst, Mobile Analyst, Web Analyst      │ Ukraine  │           NULL │
├────────┼────────────────────────────────────────────────┼──────────┼────────────────┤
│  63470 │ Software Developer (Web/Mobile), Data Scientis │ Tunisia  │           NULL │
│        │ t / AI, DevOps...                              │          │                │
├────────┼────────────────────────────────────────────────┼──────────┼────────────────┤
│ 126348 │ Mobile & Web Analytics                         │ Colombia │           NULL │
├────────┼────────────────────────────────────────────────┼──────────┼────────────────┤
│ 134359 │ (all senior+) Fullstuck, Frontend, Mobile, Web │ Israel   │           NULL │
│        │  Developer, DevOps...                          │          │                │
├────────┼────────────────────────────────────────────────┼──────────┼────────────────┤
│ 205608 │ Mobile & Web Analytics                         │ Colombia │           NULL │
├────────┼────────────────────────────────────────────────┼──────────┼────────────────┤
│ 289805 │ Software Engineer (Frontend/Web Full Stack)    │ Norway   │           NULL │
├────────┼────────────────────────────────────────────────┼──────────┼────────────────┤
│ 341618 │ Web & Mobile Data Analyst                      │ Belgium  │           NULL │
├────────┼────────────────────────────────────────────────┼──────────┼────────────────┤
│ 347469 │ Web and Mobile Data Analyst                    │ Belgium  │           NULL │
├────────┼────────────────────────────────────────────────┼──────────┼────────────────┤
│ 399071 │ Web & Mobile Data Analyst (Adobe Analytics Spe │ Belgium  │           NULL │
│        │ cialist)                                       │          │                │
├────────┼────────────────────────────────────────────────┼──────────┼────────────────┤
│ 412949 │ Frontend Engineer (Web) - Cloud Travel (Remote │ Bhutan   │           NULL │
│        │  APAC)                                         │          │                │
└────────┴────────────────────────────────────────────────┴──────────┴────────────────┘
  10 rows                                                                   4 columns
*/



/*
- Look for non-consultant machine learning and non-consultant AI roles
  - Only get job titles that include either 'Machine' or 'Intelligence'
  - Also include those with 'Data' in any part of the title
  - Don't include any job titles with 'Consultant', 'Advisor', or 'Freelance' followed by any character
- Get the job_id, job_title, job_posted_date, and job_health_insurance
  - Rename the columns appropriately
*/

SELECT 
  job_id,
  job_title,
  job_posted_date,
  job_health_insurance
FROM
  job_postings_fact
WHERE (job_title LIKE '%Machine%'
      OR job_title LIKE '%Intelligence%')
      /*AND job_title LIKE '%Data%'*/
      AND NOT (job_title LIKE '%Consultant%' OR job_title LIKE '%Advisor%' OR job_title LIKE '%Freelance%')
LIMIT 10;


/*
┌────────┬───────────────────────────────┬─────────────────────┬──────────────────────┐
│ job_id │           job_title           │   job_posted_date   │ job_health_insurance │
│ int32  │            varchar            │      timestamp      │       boolean        │
├────────┼───────────────────────────────┼─────────────────────┼──────────────────────┤
│   4687 │ Data Quality Analyst - Market │ 2023-01-01 00:04:21 │ false                │
│        │ place Intelligence            │                     │                      │
├────────┼───────────────────────────────┼─────────────────────┼──────────────────────┤
│   4695 │ Experienced Machine Learning  │ 2023-01-01 00:04:54 │ false                │
│        │ Specialist                    │                     │                      │
├────────┼───────────────────────────────┼─────────────────────┼──────────────────────┤
│   4704 │ Business Intelligence / Data  │ 2023-01-01 00:06:25 │ false                │
│        │ Analyst                       │                     │                      │
├────────┼───────────────────────────────┼─────────────────────┼──────────────────────┤
│   4720 │ Data Science Machine Learning │ 2023-01-01 00:06:41 │ false                │
│        │  - Sector Retail              │                     │                      │
├────────┼───────────────────────────────┼─────────────────────┼──────────────────────┤
│   4750 │ Machine Learning Engineer     │ 2023-01-01 00:09:00 │ false                │
├────────┼───────────────────────────────┼─────────────────────┼──────────────────────┤
│   4752 │ G5090 - Business Intelligence │ 2023-01-01 00:09:05 │ false                │
│        │  (BI) & Data Analytics Lead ( │                     │                      │
│        │ Grade...                      │                     │                      │
├────────┼───────────────────────────────┼─────────────────────┼──────────────────────┤
│   4773 │ Business Intelligence Analyst │ 2023-01-01 00:11:53 │ false                │
│        │  (W/M/D)                      │                     │                      │
├────────┼───────────────────────────────┼─────────────────────┼──────────────────────┤
│   4795 │ Machine Translation Data Engi │ 2023-01-01 00:15:31 │ false                │
│        │ neer                          │                     │                      │
├────────┼───────────────────────────────┼─────────────────────┼──────────────────────┤
│   4811 │ System Administrator/Data Ana │ 2023-01-01 00:17:58 │ false                │
│        │ lyst, Development Intelligenc │                     │                      │
│        │ e                             │                     │                      │
├────────┼───────────────────────────────┼─────────────────────┼──────────────────────┤
│   4854 │ Data Scientist / Machine Lear │ 2023-01-01 00:28:25 │ false                │
│        │ ning Engineer                 │                     │                      │
└────────┴───────────────────────────────┴─────────────────────┴──────────────────────┘
  10 rows                                                                   4 columns
*/

