

from data_jobs.main.company_dim
select
	company_id,
	"name",
	link,
	link_google,
	thumbnail
limit 10;

/*
┌────────────┬───────────────────────┬───────────────────────┬───────────────────────┬───────────────────────┐
│ company_id │         name          │         link          │      link_google      │       thumbnail       │
│   int32    │        varchar        │        varchar        │        varchar        │        varchar        │
├────────────┼───────────────────────┼───────────────────────┼───────────────────────┼───────────────────────┤
│       4593 │ Metasys Technologies  │ NULL                  │ https://www.google.co │ NULL                  │
│            │                       │                       │ m/search?gl=us&hl=en& │                       │
│            │                       │                       │ q=Metasys+Technologie │                       │
│            │                       │                       │ s&sa=X&ved=0ahUKEwjN… │                       │
├────────────┼───────────────────────┼───────────────────────┼───────────────────────┼───────────────────────┤
│       4594 │ Guidehouse            │ NULL                  │ https://www.google.co │ https://encrypted-tbn │
│            │                       │                       │ m/search?gl=us&hl=en& │ 0.gstatic.com/images? │
│            │                       │                       │ q=Guidehouse&sa=X&ved │ q=tbn:ANd9GcQbmcC-pbC │
│            │                       │                       │ =0ahUKEwiosI_n2KX8Ah… │ uIfuWurdAt73eWsxsaGZ… │
├────────────┼───────────────────────┼───────────────────────┼───────────────────────┼───────────────────────┤
│       4595 │ Protask               │ http://www.protaskinc │ https://www.google.co │ https://encrypted-tbn │
│            │                       │ .com/                 │ m/search?q=Protask&sa │ 0.gstatic.com/images? │
│            │                       │                       │ =X&ved=0ahUKEwi_taTo2 │ q=tbn:ANd9GcQqzAaX7ny │
│            │                       │                       │ KX8AhVPmmoFHX-lBPY4U… │ pw1nvKthg8zBA1mwakyH… │
├────────────┼───────────────────────┼───────────────────────┼───────────────────────┼───────────────────────┤
│       4596 │ Atria Wealth Solution │ http://www.atriawealt │ https://www.google.co │ https://encrypted-tbn │
│            │ s                     │ h.com/                │ m/search?hl=en&gl=us& │ 0.gstatic.com/images? │
│            │                       │                       │ q=Atria+Wealth+Soluti │ q=tbn:ANd9GcRWPMd1Hio │
│            │                       │                       │ ons&sa=X&ved=0ahUKEw… │ T6f6Ay00DqhVlCpTOaRY… │
├────────────┼───────────────────────┼───────────────────────┼───────────────────────┼───────────────────────┤
│       4597 │ ICONMA, LLC           │ http://www.iconma.com │ https://www.google.co │ https://encrypted-tbn │
│            │                       │ /                     │ m/search?q=ICONMA,+LL │ 0.gstatic.com/images? │
│            │                       │                       │ C&sa=X&ved=0ahUKEwjy6 │ q=tbn:ANd9GcSuUzhTtGX │
│            │                       │                       │ p3w2KX8AhUwrHIEHRK5C… │ nUAQ50iypDbcoyQHqRY1… │
├────────────┼───────────────────────┼───────────────────────┼───────────────────────┼───────────────────────┤
│       4598 │ Aquent                │ http://aquent.com/    │ https://www.google.co │ NULL                  │
│            │                       │                       │ m/search?q=Aquent&sa= │                       │
│            │                       │                       │ X&ved=0ahUKEwjy6p3w2K │                       │
│            │                       │                       │ X8AhUwrHIEHRK5C_YQmJ… │                       │
├────────────┼───────────────────────┼───────────────────────┼───────────────────────┼───────────────────────┤
│       4599 │ Adyen                 │ http://www.adyen.com/ │ https://www.google.co │ NULL                  │
│            │                       │                       │ m/search?hl=en&gl=us& │                       │
│            │                       │                       │ q=Adyen&sa=X&ved=0ahU │                       │
│            │                       │                       │ KEwjkr8Dz2KX8AhVCD1k… │                       │
├────────────┼───────────────────────┼───────────────────────┼───────────────────────┼───────────────────────┤
│       4600 │ Albertsons Companies  │ http://www.albertsons │ https://www.google.co │ https://encrypted-tbn │
│            │                       │ companies.com/        │ m/search?hl=en&gl=us& │ 0.gstatic.com/images? │
│            │                       │                       │ q=Albertsons+Companie │ q=tbn:ANd9GcRJMMSM3JV │
│            │                       │                       │ s&sa=X&ved=0ahUKEwje… │ IY8PKn3JqstTUcODytm3… │
├────────────┼───────────────────────┼───────────────────────┼───────────────────────┼───────────────────────┤
│       4601 │ Panda Restaurant Grou │ http://www.pandarg.co │ https://www.google.co │ https://encrypted-tbn │
│            │ p                     │ m/                    │ m/search?gl=us&hl=en& │ 0.gstatic.com/images? │
│            │                       │                       │ q=Panda+Restaurant+Gr │ q=tbn:ANd9GcRsZPYAJ9M │
│            │                       │                       │ oup&sa=X&ved=0ahUKEw… │ Dnx4qP0_krkqSBhzxp-Y… │
├────────────┼───────────────────────┼───────────────────────┼───────────────────────┼───────────────────────┤
│       4602 │ Diverse Lynx          │ http://www.diverselyn │ https://www.google.co │ https://encrypted-tbn │
│            │                       │ x.com/                │ m/search?gl=us&hl=en& │ 0.gstatic.com/images? │
│            │                       │                       │ q=Diverse+Lynx&sa=X&v │ q=tbn:ANd9GcSqFxptto_ │
│            │                       │                       │ ed=0ahUKEwir_vL32KX8… │ wEQxlJ0l6jN8x57KBmzJ… │
└────────────┴───────────────────────┴───────────────────────┴───────────────────────┴───────────────────────┘
  10 rows                                                                                          5 columns
*/

from data_jobs.main.job_postings_fact
select
	job_id,
	company_id,
	job_title_short,
	job_title,
	job_location,
	job_via,
	job_schedule_type,
	job_work_from_home,
	search_location,
	job_posted_date,
	job_no_degree_mention,
	job_health_insurance,
	job_country,
	salary_rate,
	salary_year_avg,
	salary_hour_avg
limit 10;

/*
┌────────┬────────────┬─────────────────────┬───┬─────────────┬─────────────────┬─────────────────┐
│ job_id │ company_id │   job_title_short   │ … │ salary_rate │ salary_year_avg │ salary_hour_avg │
│ int32  │   int32    │       varchar       │ … │   varchar   │     double      │     double      │
├────────┼────────────┼─────────────────────┼───┼─────────────┼─────────────────┼─────────────────┤
│   4593 │       4593 │ Data Analyst        │ … │ NULL        │            NULL │            NULL │
│   4594 │       4594 │ Data Analyst        │ … │ NULL        │            NULL │            NULL │
│   4595 │       4595 │ Data Analyst        │ … │ NULL        │            NULL │            NULL │
│   4596 │       4596 │ Senior Data Analyst │ … │ NULL        │            NULL │            NULL │
│   4597 │       4597 │ Data Analyst        │ … │ NULL        │            NULL │            NULL │
│   4598 │       4598 │ Data Analyst        │ … │ NULL        │            NULL │            NULL │
│   4599 │       4599 │ Data Analyst        │ … │ NULL        │            NULL │            NULL │
│   4600 │       4600 │ Data Analyst        │ … │ NULL        │            NULL │            NULL │
│   4601 │       4601 │ Senior Data Analyst │ … │ NULL        │            NULL │            NULL │
│   4602 │       4602 │ Business Analyst    │ … │ NULL        │            NULL │            NULL │
└────────┴────────────┴─────────────────────┴───┴─────────────┴─────────────────┴─────────────────┘
  10 rows                  use .last to show entire result                   16 columns (6 shown)


*/


SELECT
  job_id,
  job_title_short,
  job_location,
  salary_year_avg,
  job_work_from_home
FROM
  job_postings_fact
WHERE 
  job_work_from_home = TRUE  AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
Limit 10;

/*
┌─────────┬───────────────────────┬──────────────┬─────────────────┬────────────────────┐
│ job_id  │    job_title_short    │ job_location │ salary_year_avg │ job_work_from_home │
│  int32  │        varchar        │   varchar    │     double      │      boolean       │
├─────────┼───────────────────────┼──────────────┼─────────────────┼────────────────────┤
│ 1574285 │ Data Scientist        │ Anywhere     │        680000.0 │ true               │
│  142665 │ Data Analyst          │ Anywhere     │        650000.0 │ true               │
│  499552 │ Data Scientist        │ Anywhere     │        550000.0 │ true               │
│  543480 │ Data Scientist        │ Anywhere     │        525000.0 │ true               │
│   95558 │ Senior Data Scientist │ Anywhere     │        475000.0 │ true               │
│ 1283788 │ Data Analyst          │ Anywhere     │        445000.0 │ true               │
│ 1558080 │ Data Scientist        │ Anywhere     │        445000.0 │ true               │
│ 1578513 │ Data Engineer         │ Anywhere     │        445000.0 │ true               │
│ 1598650 │ Data Analyst          │ Anywhere     │        445000.0 │ true               │
│ 1610938 │ Data Engineer         │ Anywhere     │        445000.0 │ true               │
└─────────┴───────────────────────┴──────────────┴─────────────────┴────────────────────┘
  10 rows                                                                     5 columns
*/