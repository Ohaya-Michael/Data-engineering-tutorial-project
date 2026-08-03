/*
# Types of Joins
    1. Left Join
    2. Right Join
    3. Inner Join
    4. Full Outer Join
*/

/*
    Left Join: Returns all records from the left table (table1), and the matched records from the right table (table2). The result is NULL from the right side, if there is no match.
    Here, we are joining the job_postings_fact table with the company_dim table on the company_id column. This will return all records from job_postings_fact and the matching records from company_dim. If there is no match, the result will contain NULL values for the columns from company_dim.
*/

FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
SELECT
    jpf.*,
    cd.*
LIMIT 10;

/*
Results:
┌────────┬────────────┬───┬───────────────────────────┬──────────────────────┬──────────────────────┐
│ job_id │ company_id │ … │           link            │     link_google      │      thumbnail       │
│ int32  │   int32    │ … │          varchar          │       varchar        │       varchar        │
├────────┼────────────┼───┼───────────────────────────┼──────────────────────┼──────────────────────┤
│   4593 │       4593 │ … │ NULL                      │ https://www.google.… │ NULL                 │
│   4594 │       4594 │ … │ NULL                      │ https://www.google.… │ https://encrypted-t… │
│   4595 │       4595 │ … │ http://www.protaskinc.co… │ https://www.google.… │ https://encrypted-t… │
│   4596 │       4596 │ … │ http://www.atriawealth.c… │ https://www.google.… │ https://encrypted-t… │
│   4597 │       4597 │ … │ http://www.iconma.com/    │ https://www.google.… │ https://encrypted-t… │
│   4598 │       4598 │ … │ http://aquent.com/        │ https://www.google.… │ NULL                 │
│   4599 │       4599 │ … │ http://www.adyen.com/     │ https://www.google.… │ NULL                 │
│   4600 │       4600 │ … │ http://www.albertsonscom… │ https://www.google.… │ https://encrypted-t… │
│   4601 │       4601 │ … │ http://www.pandarg.com/   │ https://www.google.… │ https://encrypted-t… │
│   4602 │       4602 │ … │ http://www.diverselynx.c… │ https://www.google.… │ https://encrypted-t… │
└────────┴────────────┴───┴───────────────────────────┴──────────────────────┴──────────────────────┘
  10 rows                   use .last to show entire result                    21 columns (5 shown)
*/


/*
 LEFT JOIN: Returns all records from the left table (table1), and the matched records from the right table (table2). The result is NULL from the right side, if there is no match.
 Here, we want to get all the job postings along with the company name. If a job posting does not have a matching company, we will still get the job posting with NULL values for the company name.
*/

SELECT
    jpf.company_id,
    cd.company_id,
    jpf.job_id,
    jpf.job_title_short,
    cd.name
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE cd.company_id IS NOT NULL
LIMIT 50;

/**
Results:
┌────────────┬────────────┬────────┬──────────────────────┬───────────────────────────────────┐
│ company_id │ company_id │ job_id │   job_title_short    │               name                │
│   int32    │   int32    │ int32  │       varchar        │              varchar              │
├────────────┼────────────┼────────┼──────────────────────┼───────────────────────────────────┤
│       4593 │       4593 │   4593 │ Data Analyst         │ Metasys Technologies              │
│       4594 │       4594 │   4594 │ Data Analyst         │ Guidehouse                        │
│       4595 │       4595 │   4595 │ Data Analyst         │ Protask                           │
│       4596 │       4596 │   4596 │ Senior Data Analyst  │ Atria Wealth Solutions            │
│       4597 │       4597 │   4597 │ Data Analyst         │ ICONMA, LLC                       │
│       4598 │       4598 │   4598 │ Data Analyst         │ Aquent                            │
│       4599 │       4599 │   4599 │ Data Analyst         │ Adyen                             │
│       4600 │       4600 │   4600 │ Data Analyst         │ Albertsons Companies              │
│       4601 │       4601 │   4601 │ Senior Data Analyst  │ Panda Restaurant Group            │
│       4602 │       4602 │   4602 │ Business Analyst     │ Diverse Lynx                      │
│       4603 │       4603 │   4603 │ Data Analyst         │ Range Generation Next LLC         │
│       4604 │       4604 │   4604 │ Data Analyst         │ Stanford University Lee Lab       │
│       4605 │       4605 │   4605 │ Data Analyst         │ CYNET SYSTEMS                     │
│       4606 │       4606 │   4606 │ Data Analyst         │ Trident Consulting                │
│       4607 │       4607 │   4607 │ Data Analyst         │ EDI Staffing                      │
│       4608 │       4608 │   4608 │ Data Analyst         │ Workway                           │
│       4609 │       4609 │   4609 │ Data Analyst         │ Omega Solutions                   │
│       4610 │       4610 │   4610 │ Data Analyst         │ ByteDance                         │
│       4611 │       4611 │   4611 │ Data Analyst         │ Tekfortune Inc.                   │
│       4612 │       4612 │   4612 │ Data Analyst         │ VLink Inc.                        │
│         ·  │         ·  │     ·  │      ·               │     ·                             │
│         ·  │         ·  │     ·  │      ·               │     ·                             │
│         ·  │         ·  │     ·  │      ·               │     ·                             │
│       4623 │       4623 │   4623 │ Data Analyst         │ Bridge Technologies and Solutions │
│       4617 │       4617 │   4624 │ Data Analyst         │ eTeam Inc.                        │
│       4625 │       4625 │   4625 │ Data Analyst         │ LanceSoft Inc                     │
│       4626 │       4626 │   4626 │ Data Analyst         │ US Army                           │
│       4618 │       4618 │   4627 │ Senior Data Analyst  │ Resume Library                    │
│       4618 │       4618 │   4628 │ Senior Data Analyst  │ Resume Library                    │
│       4629 │       4629 │   4629 │ Data Analyst         │ SynergisticIT                     │
│       4602 │       4602 │   4630 │ Business Analyst     │ Diverse Lynx                      │
│       4631 │       4631 │   4631 │ Data Analyst         │ Thermo Fisher Scientific          │
│       4632 │       4632 │   4632 │ Data Analyst         │ HellermannTyton North America     │
│       4625 │       4625 │   4633 │ Data Analyst         │ LanceSoft Inc                     │
│       4634 │       4634 │   4634 │ Senior Data Analyst  │ TalentLinc                        │
│       4635 │       4635 │   4635 │ Senior Data Engineer │ Cox Automotive                    │
│       4636 │       4636 │   4636 │ Data Analyst         │ Kolter Solutions                  │
│       4625 │       4625 │   4637 │ Data Analyst         │ LanceSoft Inc                     │
│       4638 │       4638 │   4638 │ Data Scientist       │ PayPal                            │
│       4639 │       4639 │   4639 │ Data Scientist       │ Midas Management and Research     │
│       4640 │       4640 │   4640 │ Data Scientist       │ RIT Solutions, Inc.               │
│       4641 │       4641 │   4641 │ Data Scientist       │ Jobot                             │
│       4642 │       4642 │   4642 │ Data Scientist       │ ApTask                            │
└────────────┴────────────┴────────┴──────────────────────┴───────────────────────────────────┘
  50 rows (40 shown)                use .last to show entire result                 5 columns
data_jobs D atabase (default)  2024-06-05 15:51:48
*/


/*
    Right Join: Returns all records from the right table (table2), and the matched records from the left table (table1). The result is NULL from the left side, when there is no match.
    Here, we are joining the job_postings_fact table with the company_dim table on the
*/


SELECT
    jpf.company_id as jpf_company_id,
    cd.company_id as cd_company_id,
    jpf.job_id,
    jpf.job_title_short,
    cd.name
FROM job_postings_fact AS jpf
RIGHT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE cd.company_id IS NOT NULL
LIMIT 50;

/*
Results:
┌────────────────┬───────────────┬────────┬──────────────────────┬──────────────────────────────────┐
│ jpf_company_id │ cd_company_id │ job_id │   job_title_short    │               name               │
│     int32      │     int32     │ int32  │       varchar        │             varchar              │
├────────────────┼───────────────┼────────┼──────────────────────┼──────────────────────────────────┤
│           4593 │          4593 │   4593 │ Data Analyst         │ Metasys Technologies             │
│           4594 │          4594 │   4594 │ Data Analyst         │ Guidehouse                       │
│           4595 │          4595 │   4595 │ Data Analyst         │ Protask                          │
│           4596 │          4596 │   4596 │ Senior Data Analyst  │ Atria Wealth Solutions           │
│           4597 │          4597 │   4597 │ Data Analyst         │ ICONMA, LLC                      │
│           4598 │          4598 │   4598 │ Data Analyst         │ Aquent                           │
│           4599 │          4599 │   4599 │ Data Analyst         │ Adyen                            │
│           4600 │          4600 │   4600 │ Data Analyst         │ Albertsons Companies             │
│           4601 │          4601 │   4601 │ Senior Data Analyst  │ Panda Restaurant Group           │
│           4602 │          4602 │   4602 │ Business Analyst     │ Diverse Lynx                     │
│           4603 │          4603 │   4603 │ Data Analyst         │ Range Generation Next LLC        │
│           4604 │          4604 │   4604 │ Data Analyst         │ Stanford University Lee Lab      │
│           4605 │          4605 │   4605 │ Data Analyst         │ CYNET SYSTEMS                    │
│           4606 │          4606 │   4606 │ Data Analyst         │ Trident Consulting               │
│           4607 │          4607 │   4607 │ Data Analyst         │ EDI Staffing                     │
│           4608 │          4608 │   4608 │ Data Analyst         │ Workway                          │
│           4609 │          4609 │   4609 │ Data Analyst         │ Omega Solutions                  │
│           4610 │          4610 │   4610 │ Data Analyst         │ ByteDance                        │
│           4611 │          4611 │   4611 │ Data Analyst         │ Tekfortune Inc.                  │
│           4612 │          4612 │   4612 │ Data Analyst         │ VLink Inc.                       │
│             ·  │            ·  │     ·  │      ·               │     ·                            │
│             ·  │            ·  │     ·  │      ·               │     ·                            │
│             ·  │            ·  │     ·  │      ·               │     ·                            │
│           4623 │          4623 │   4623 │ Data Analyst         │ Bridge Technologies and Solutio… │
│           4617 │          4617 │   4624 │ Data Analyst         │ eTeam Inc.                       │
│           4625 │          4625 │   4625 │ Data Analyst         │ LanceSoft Inc                    │
│           4626 │          4626 │   4626 │ Data Analyst         │ US Army                          │
│           4618 │          4618 │   4627 │ Senior Data Analyst  │ Resume Library                   │
│           4618 │          4618 │   4628 │ Senior Data Analyst  │ Resume Library                   │
│           4629 │          4629 │   4629 │ Data Analyst         │ SynergisticIT                    │
│           4602 │          4602 │   4630 │ Business Analyst     │ Diverse Lynx                     │
│           4631 │          4631 │   4631 │ Data Analyst         │ Thermo Fisher Scientific         │
│           4632 │          4632 │   4632 │ Data Analyst         │ HellermannTyton North America    │
│           4625 │          4625 │   4633 │ Data Analyst         │ LanceSoft Inc                    │
│           4634 │          4634 │   4634 │ Senior Data Analyst  │ TalentLinc                       │
│           4635 │          4635 │   4635 │ Senior Data Engineer │ Cox Automotive                   │
│           4636 │          4636 │   4636 │ Data Analyst         │ Kolter Solutions                 │
│           4625 │          4625 │   4637 │ Data Analyst         │ LanceSoft Inc                    │
│           4638 │          4638 │   4638 │ Data Scientist       │ PayPal                           │
│           4639 │          4639 │   4639 │ Data Scientist       │ Midas Management and Research    │
│           4640 │          4640 │   4640 │ Data Scientist       │ RIT Solutions, Inc.              │
│           4641 │          4641 │   4641 │ Data Scientist       │ Jobot                            │
│           4642 │          4642 │   4642 │ Data Scientist       │ ApTask                           │
└────────────────┴───────────────┴────────┴──────────────────────┴──────────────────────────────────┘
  50 rows (40 shown)                   use .last to show entire result               5 columns     
*/


/*
INNER JOIN: Returns records that have matching values in both tables. Here, we are joining the job_postings_fact table with the company_dim table on the company_id column. This will return only the records that have matching company_id in both tables.
In this case, we are selecting the job_id, job_title_short, and name of the company for each job posting that has a matching company in the company_dim table.
*/


SELECT
    jpf.company_id as jpf_company_id,
    cd.company_id as cd_company_id,
    jpf.job_id,
    jpf.job_title_short,
    cd.name
FROM job_postings_fact AS jpf
INNER JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE cd.company_id IS NOT NULL
LIMIT 50;

/*
 Results:
┌────────────────┬───────────────┬────────┬──────────────────────┬──────────────────────────────────┐
│ jpf_company_id │ cd_company_id │ job_id │   job_title_short    │               name               │
│     int32      │     int32     │ int32  │       varchar        │             varchar              │
├────────────────┼───────────────┼────────┼──────────────────────┼──────────────────────────────────┤
│           4593 │          4593 │   4593 │ Data Analyst         │ Metasys Technologies             │
│           4594 │          4594 │   4594 │ Data Analyst         │ Guidehouse                       │
│           4595 │          4595 │   4595 │ Data Analyst         │ Protask                          │
│           4596 │          4596 │   4596 │ Senior Data Analyst  │ Atria Wealth Solutions           │
│           4597 │          4597 │   4597 │ Data Analyst         │ ICONMA, LLC                      │
│           4598 │          4598 │   4598 │ Data Analyst         │ Aquent                           │
│           4599 │          4599 │   4599 │ Data Analyst         │ Adyen                            │
│           4600 │          4600 │   4600 │ Data Analyst         │ Albertsons Companies             │
│           4601 │          4601 │   4601 │ Senior Data Analyst  │ Panda Restaurant Group           │
│           4602 │          4602 │   4602 │ Business Analyst     │ Diverse Lynx                     │
│           4603 │          4603 │   4603 │ Data Analyst         │ Range Generation Next LLC        │
│           4604 │          4604 │   4604 │ Data Analyst         │ Stanford University Lee Lab      │
│           4605 │          4605 │   4605 │ Data Analyst         │ CYNET SYSTEMS                    │
│           4606 │          4606 │   4606 │ Data Analyst         │ Trident Consulting               │
│           4607 │          4607 │   4607 │ Data Analyst         │ EDI Staffing                     │
│           4608 │          4608 │   4608 │ Data Analyst         │ Workway                          │
│           4609 │          4609 │   4609 │ Data Analyst         │ Omega Solutions                  │
│           4610 │          4610 │   4610 │ Data Analyst         │ ByteDance                        │
│           4611 │          4611 │   4611 │ Data Analyst         │ Tekfortune Inc.                  │
│           4612 │          4612 │   4612 │ Data Analyst         │ VLink Inc.                       │
│             ·  │            ·  │     ·  │      ·               │     ·                            │
│             ·  │            ·  │     ·  │      ·               │     ·                            │
│             ·  │            ·  │     ·  │      ·               │     ·                            │
│           4623 │          4623 │   4623 │ Data Analyst         │ Bridge Technologies and Solutio… │
│           4617 │          4617 │   4624 │ Data Analyst         │ eTeam Inc.                       │
│           4625 │          4625 │   4625 │ Data Analyst         │ LanceSoft Inc                    │
│           4626 │          4626 │   4626 │ Data Analyst         │ US Army                          │
│           4618 │          4618 │   4627 │ Senior Data Analyst  │ Resume Library                   │
│           4618 │          4618 │   4628 │ Senior Data Analyst  │ Resume Library                   │
│           4629 │          4629 │   4629 │ Data Analyst         │ SynergisticIT                    │
│           4602 │          4602 │   4630 │ Business Analyst     │ Diverse Lynx                     │
│           4631 │          4631 │   4631 │ Data Analyst         │ Thermo Fisher Scientific         │
│           4632 │          4632 │   4632 │ Data Analyst         │ HellermannTyton North America    │
│           4625 │          4625 │   4633 │ Data Analyst         │ LanceSoft Inc                    │
│           4634 │          4634 │   4634 │ Senior Data Analyst  │ TalentLinc                       │
│           4635 │          4635 │   4635 │ Senior Data Engineer │ Cox Automotive                   │
│           4636 │          4636 │   4636 │ Data Analyst         │ Kolter Solutions                 │
│           4625 │          4625 │   4637 │ Data Analyst         │ LanceSoft Inc                    │
│           4638 │          4638 │   4638 │ Data Scientist       │ PayPal                           │
│           4639 │          4639 │   4639 │ Data Scientist       │ Midas Management and Research    │
│           4640 │          4640 │   4640 │ Data Scientist       │ RIT Solutions, Inc.              │
│           4641 │          4641 │   4641 │ Data Scientist       │ Jobot                            │
│           4642 │          4642 │   4642 │ Data Scientist       │ ApTask                           │
└────────────────┴───────────────┴────────┴──────────────────────┴──────────────────────────────────┘
  50 rows (40 shown)                   use .last to show entire result               5 columns     
*/

/*
    Full Outer Join: Returns all records when there is a match in either left (table1) or right (table2) table records. Here, we are joining the job_postings_fact table with the company_dim table on the company_id column. This will return all records from both tables, with NULL values in the columns where there is no match.
*/

SELECT
    jpf.company_id as jpf_company_id,
    cd.company_id as cd_company_id,
    jpf.job_id,
    jpf.job_title_short,
    cd.name
FROM job_postings_fact AS jpf
FULL OUTER JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE cd.company_id IS NOT NULL
LIMIT 50;

/*
 Results:
┌────────────────┬───────────────┬────────┬──────────────────────┬──────────────────────────────────┐
│ jpf_company_id │ cd_company_id │ job_id │   job_title_short    │               name               │
│     int32      │     int32     │ int32  │       varchar        │             varchar              │
├────────────────┼───────────────┼────────┼──────────────────────┼──────────────────────────────────┤
│           4593 │          4593 │   4593 │ Data Analyst         │ Metasys Technologies             │
│           4594 │          4594 │   4594 │ Data Analyst         │ Guidehouse                       │
│           4595 │          4595 │   4595 │ Data Analyst         │ Protask                          │
│           4596 │          4596 │   4596 │ Senior Data Analyst  │ Atria Wealth Solutions           │
│           4597 │          4597 │   4597 │ Data Analyst         │ ICONMA, LLC                      │
│           4598 │          4598 │   4598 │ Data Analyst         │ Aquent                           │
│           4599 │          4599 │   4599 │ Data Analyst         │ Adyen                            │
│           4600 │          4600 │   4600 │ Data Analyst         │ Albertsons Companies             │
│           4601 │          4601 │   4601 │ Senior Data Analyst  │ Panda Restaurant Group           │
│           4602 │          4602 │   4602 │ Business Analyst     │ Diverse Lynx                     │
│           4603 │          4603 │   4603 │ Data Analyst         │ Range Generation Next LLC        │
│           4604 │          4604 │   4604 │ Data Analyst         │ Stanford University Lee Lab      │
│           4605 │          4605 │   4605 │ Data Analyst         │ CYNET SYSTEMS                    │
│           4606 │          4606 │   4606 │ Data Analyst         │ Trident Consulting               │
│           4607 │          4607 │   4607 │ Data Analyst         │ EDI Staffing                     │
│           4608 │          4608 │   4608 │ Data Analyst         │ Workway                          │
│           4609 │          4609 │   4609 │ Data Analyst         │ Omega Solutions                  │
│           4610 │          4610 │   4610 │ Data Analyst         │ ByteDance                        │
│           4611 │          4611 │   4611 │ Data Analyst         │ Tekfortune Inc.                  │
│           4612 │          4612 │   4612 │ Data Analyst         │ VLink Inc.                       │
│             ·  │            ·  │     ·  │      ·               │     ·                            │
│             ·  │            ·  │     ·  │      ·               │     ·                            │
│             ·  │            ·  │     ·  │      ·               │     ·                            │
│           4623 │          4623 │   4623 │ Data Analyst         │ Bridge Technologies and Solutio… │
│           4617 │          4617 │   4624 │ Data Analyst         │ eTeam Inc.                       │
│           4625 │          4625 │   4625 │ Data Analyst         │ LanceSoft Inc                    │
│           4626 │          4626 │   4626 │ Data Analyst         │ US Army                          │
│           4618 │          4618 │   4627 │ Senior Data Analyst  │ Resume Library                   │
│           4618 │          4618 │   4628 │ Senior Data Analyst  │ Resume Library                   │
│           4629 │          4629 │   4629 │ Data Analyst         │ SynergisticIT                    │
│           4602 │          4602 │   4630 │ Business Analyst     │ Diverse Lynx                     │
│           4631 │          4631 │   4631 │ Data Analyst         │ Thermo Fisher Scientific         │
│           4632 │          4632 │   4632 │ Data Analyst         │ HellermannTyton North America    │
│           4625 │          4625 │   4633 │ Data Analyst         │ LanceSoft Inc                    │
│           4634 │          4634 │   4634 │ Senior Data Analyst  │ TalentLinc                       │
│           4635 │          4635 │   4635 │ Senior Data Engineer │ Cox Automotive                   │
│           4636 │          4636 │   4636 │ Data Analyst         │ Kolter Solutions                 │
│           4625 │          4625 │   4637 │ Data Analyst         │ LanceSoft Inc                    │
│           4638 │          4638 │   4638 │ Data Scientist       │ PayPal                           │
│           4639 │          4639 │   4639 │ Data Scientist       │ Midas Management and Research    │
│           4640 │          4640 │   4640 │ Data Scientist       │ RIT Solutions, Inc.              │
│           4641 │          4641 │   4641 │ Data Scientist       │ Jobot                            │
│           4642 │          4642 │   4642 │ Data Scientist       │ ApTask                           │
└────────────────┴───────────────┴────────┴──────────────────────┴──────────────────────────────────┘
  50 rows (40 shown)                   use .last to show entire result               5 columns     
*/

SELECT
    *
FROM skills_dim
LIMIT 10;

SELECT
    *
FROM skills_job_dim
LIMIT 10;


SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id;

/*
Results:
┌────────┬───────────────────────────┬──────────┬────────────┐
│ job_id │      job_title_short      │ skill_id │   skills   │
│ int32  │          varchar          │  int32   │  varchar   │
├────────┼───────────────────────────┼──────────┼────────────┤
│ 309661 │ Data Analyst              │      194 │ sas        │
│ 309662 │ Data Scientist            │        1 │ python     │
│ 309662 │ Data Scientist            │        2 │ r          │
│ 309663 │ Data Engineer             │        7 │ scala      │
│ 309664 │ Data Engineer             │        1 │ python     │
│ 309664 │ Data Engineer             │        6 │ javascript │
│ 309664 │ Data Engineer             │        0 │ sql        │
│ 309664 │ Data Engineer             │       17 │ mongodb    │
│ 309664 │ Data Engineer             │       59 │ mongodb    │
│ 309666 │ Data Analyst              │        0 │ sql        │
│ 309666 │ Data Analyst              │        8 │ sas        │
│ 309666 │ Data Analyst              │      194 │ sas        │
│ 309666 │ Data Analyst              │        2 │ r          │
│ 309666 │ Data Analyst              │        6 │ javascript │
│ 309666 │ Data Analyst              │        1 │ python     │
│ 309668 │ Data Scientist            │        1 │ python     │
│ 309668 │ Data Scientist            │        0 │ sql        │
│ 309669 │ Data Analyst              │        1 │ python     │
│ 309669 │ Data Analyst              │        2 │ r          │
│ 309669 │ Data Analyst              │        0 │ sql        │
│    ·   │      ·                    │        · │  ·         │
│    ·   │      ·                    │        · │  ·         │
│    ·   │      ·                    │        · │  ·         │
│ 624794 │ Data Scientist            │     NULL │ NULL       │
│ 624843 │ Data Scientist            │     NULL │ NULL       │
│ 624948 │ Data Scientist            │     NULL │ NULL       │
│ 624973 │ Business Analyst          │     NULL │ NULL       │
│ 624974 │ Software Engineer         │     NULL │ NULL       │
│ 625004 │ Data Analyst              │     NULL │ NULL       │
│ 625225 │ Senior Data Analyst       │     NULL │ NULL       │
│ 625262 │ Data Analyst              │     NULL │ NULL       │
│ 625289 │ Data Scientist            │     NULL │ NULL       │
│ 625399 │ Data Analyst              │     NULL │ NULL       │
│ 625414 │ Business Analyst          │     NULL │ NULL       │
│ 625420 │ Data Scientist            │     NULL │ NULL       │
│ 625459 │ Data Analyst              │     NULL │ NULL       │
│ 625468 │ Data Analyst              │     NULL │ NULL       │
│ 625642 │ Data Analyst              │     NULL │ NULL       │
│ 625697 │ Data Scientist            │     NULL │ NULL       │
│ 626017 │ Machine Learning Engineer │     NULL │ NULL       │
│ 626092 │ Data Analyst              │     NULL │ NULL       │
│ 626340 │ Data Engineer             │     NULL │ NULL       │
│ 626566 │ Cloud Engineer            │     NULL │ NULL       │
└────────┴───────────────────────────┴──────────┴────────────┘
  7.48 million rows (40 shown, 7478801 total)      4 columns
*/



SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id;

/*
┌─────────┬──────────────────────┬──────────┬────────────┐
│ job_id  │   job_title_short    │ skill_id │   skills   │
│  int32  │       varchar        │  int32   │  varchar   │
├─────────┼──────────────────────┼──────────┼────────────┤
│    4593 │ Data Analyst         │        0 │ sql        │
│    4594 │ Data Analyst         │        0 │ sql        │
│    4594 │ Data Analyst         │        1 │ python     │
│    4594 │ Data Analyst         │        2 │ r          │
│    4595 │ Data Analyst         │        0 │ sql        │
│    4596 │ Senior Data Analyst  │        0 │ sql        │
│    4597 │ Data Analyst         │        0 │ sql        │
│    4597 │ Data Analyst         │        1 │ python     │
│    4599 │ Data Analyst         │        2 │ r          │
│    4599 │ Data Analyst         │        1 │ python     │
│    4599 │ Data Analyst         │        0 │ sql        │
│    4600 │ Data Analyst         │        0 │ sql        │
│    4600 │ Data Analyst         │        1 │ python     │
│    4600 │ Data Analyst         │        2 │ r          │
│    4604 │ Data Analyst         │        3 │ go         │
│    4604 │ Data Analyst         │        1 │ python     │
│    4604 │ Data Analyst         │        4 │ matlab     │
│    4607 │ Data Analyst         │        0 │ sql        │
│    4607 │ Data Analyst         │        5 │ crystal    │
│    4610 │ Data Analyst         │        0 │ sql        │
│      ·  │      ·               │        · │  ·         │
│      ·  │      ·               │        · │  ·         │
│      ·  │      ·               │        · │  ·         │
│ 1274222 │ Data Engineer        │      234 │ confluence │
│ 1274225 │ Data Engineer        │      233 │ jira       │
│ 1274225 │ Data Engineer        │      234 │ confluence │
│ 1274295 │ Data Engineer        │      233 │ jira       │
│ 1274298 │ Data Engineer        │      233 │ jira       │
│ 1274329 │ Data Engineer        │      237 │ airtable   │
│ 1274333 │ Data Engineer        │      237 │ airtable   │
│ 1274369 │ Senior Data Engineer │      233 │ jira       │
│ 1274369 │ Senior Data Engineer │      234 │ confluence │
│ 1274370 │ Senior Data Engineer │      233 │ jira       │
│ 1274370 │ Senior Data Engineer │      234 │ confluence │
│ 1274392 │ Data Engineer        │      233 │ jira       │
│ 1274392 │ Data Engineer        │      234 │ confluence │
│ 1274443 │ Data Analyst         │      235 │ planner    │
│ 1274447 │ Data Analyst         │      235 │ planner    │
│ 1274453 │ Data Scientist       │      233 │ jira       │
│ 1274453 │ Data Scientist       │      240 │ asana      │
│ 1274511 │ Data Analyst         │      239 │ trello     │
│ 1274512 │ Business Analyst     │      240 │ asana      │
│ 1274563 │ Data Engineer        │      233 │ jira       │
└─────────┴──────────────────────┴──────────┴────────────┘
  7.19 million rows (40 shown, 7193426 total)  4 columns
*/