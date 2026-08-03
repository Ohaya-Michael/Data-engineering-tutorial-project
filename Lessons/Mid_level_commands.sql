

SELECT
  job_id,
  job_title_short,
  job_location,
  salary_year_avg,
  job_work_from_home,
FROM
  job_postings_fact
WHERE 
  salary_year_avg > 100000 OR salary_year_avg <= 200000
ORDER BY
  salary_year_avg DESC;

  /*
  ─────────┬───────────────────────────┬───┬─────────────────┬────────────────────┐
│ job_id  │      job_title_short      │ … │ salary_year_avg │ job_work_from_home │
│  int32  │          varchar          │ … │     double      │      boolean       │
├─────────┼───────────────────────────┼───┼─────────────────┼────────────────────┤
│  296745 │ Data Scientist            │ … │        960000.0 │ false              │
│ 1231950 │ Data Scientist            │ … │        920000.0 │ false              │
│  673003 │ Senior Data Scientist     │ … │        890000.0 │ false              │
│ 1575798 │ Machine Learning Engineer │ … │        875000.0 │ false              │
│ 1007105 │ Data Scientist            │ … │        870000.0 │ false              │
│  856772 │ Data Scientist            │ … │        850000.0 │ false              │
│ 1443865 │ Senior Data Engineer      │ … │        800000.0 │ false              │
│ 1591743 │ Machine Learning Engineer │ … │        800000.0 │ false              │
│ 1574285 │ Data Scientist            │ … │        680000.0 │ true               │
│  142665 │ Data Analyst              │ … │        650000.0 │ true               │
│  871759 │ Data Engineer             │ … │        640000.0 │ false              │
│ 1335282 │ Data Scientist            │ … │        640000.0 │ false              │
│  785438 │ Data Scientist            │ … │        585000.0 │ false              │
│  499552 │ Data Scientist            │ … │        550000.0 │ true               │
│  234407 │ Data Engineer             │ … │        525000.0 │ false              │
│  543480 │ Data Scientist            │ … │        525000.0 │ true               │
│   95558 │ Senior Data Scientist     │ … │        475000.0 │ true               │
│ 1218524 │ Data Scientist            │ … │        475000.0 │ false              │
│  685280 │ Senior Data Scientist     │ … │        463500.0 │ false              │
│  501271 │ Data Scientist            │ … │        450000.0 │ false              │
│     ·   │       ·                   │ … │               · │  ·                 │
│     ·   │       ·                   │ … │               · │  ·                 │
│     ·   │       ·                   │ … │               · │  ·                 │
│ 1046932 │ Software Engineer         │ … │         22000.0 │ true               │
│ 1040135 │ Machine Learning Engineer │ … │         22000.0 │ true               │
│ 1576478 │ Software Engineer         │ … │         21880.0 │ true               │
│ 1079494 │ Business Analyst          │ … │         21750.0 │ true               │
│ 1077423 │ Data Analyst              │ … │         21000.0 │ false              │
│  934739 │ Data Analyst              │ … │         21000.0 │ true               │
│ 1056469 │ Data Scientist            │ … │         20100.5 │ true               │
│ 1045188 │ Data Scientist            │ … │         20100.5 │ true               │
│  414138 │ Data Engineer             │ … │         20000.0 │ true               │
│ 1099072 │ Data Analyst              │ … │         20000.0 │ false              │
│ 1254928 │ Cloud Engineer            │ … │         19200.0 │ true               │
│ 1583442 │ Data Analyst              │ … │         19000.0 │ false              │
│ 1111592 │ Data Engineer             │ … │         18000.0 │ false              │
│ 1094624 │ Data Analyst              │ … │         18000.0 │ true               │
│ 1251749 │ Data Scientist            │ … │         17772.0 │ true               │
│ 1598320 │ Data Scientist            │ … │         16800.0 │ false              │
│  320963 │ Business Analyst          │ … │         16500.0 │ true               │
│  870113 │ Data Engineer             │ … │         15000.0 │ false              │
│ 1102607 │ Cloud Engineer            │ … │         15000.0 │ true               │
│  752133 │ Data Engineer             │ … │         15000.0 │ false              │
└─────────┴───────────────────────────┴───┴─────────────────┴────────────────────┘
  51026 rows (40 shown)                                      5 columns (4 shown)
  */

  /*
- Get job details from BOTH 'Data Engineer' or 'Data Analyst'  positions
  - For Data Engineer, I want jobs only $75k - $100k
  - For Data Analyst, I only want jobs $100k - $125k
    - Sidenote, I want a higher salary for this role because I have DE skills
  - Only include jobs located in either:
    - Bentonville, AR or San Diego, CA
    - Remote Jobs
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
  (
      (job_title_short = 'Data Engineer' AND salary_year_avg BETWEEN 75_000 AND 100_000)
    OR 
      (job_title_short = 'Data Analyst' AND salary_year_avg BETWEEN 100_000 AND 125_000)
  )
AND
  (job_location IN ('Bentonville, AR', 'San Diego, CA') OR job_work_from_home = TRUE);

/*
│ job_id  │ job_title_short │ job_location  │ salary_year_avg │ job_work_from_home │
│  int32  │     varchar     │    varchar    │     double      │      boolean       │
├─────────┼─────────────────┼───────────────┼─────────────────┼────────────────────┤
│   17786 │ Data Analyst    │ Anywhere      │        115791.5 │ true               │
│   22867 │ Data Analyst    │ Anywhere      │        115791.5 │ true               │
│   23483 │ Data Analyst    │ Anywhere      │        110000.0 │ true               │
│   26822 │ Data Analyst    │ Anywhere      │        112500.0 │ true               │
│   37001 │ Data Analyst    │ Anywhere      │        115000.0 │ true               │
│   52039 │ Data Engineer   │ Anywhere      │         99500.0 │ true               │
│   60727 │ Data Analyst    │ Anywhere      │        115000.0 │ true               │
│   64616 │ Data Analyst    │ Anywhere      │        122500.0 │ true               │
│   65302 │ Data Engineer   │ Anywhere      │         91000.0 │ true               │
│   69121 │ Data Analyst    │ Anywhere      │        100000.0 │ true               │
│   72958 │ Data Analyst    │ Anywhere      │        105000.0 │ true               │
│   76653 │ Data Engineer   │ Anywhere      │        100000.0 │ true               │
│   81373 │ Data Analyst    │ Anywhere      │        110000.0 │ true               │
│   82773 │ Data Engineer   │ Anywhere      │         89500.0 │ true               │
│   85291 │ Data Analyst    │ Anywhere      │        105000.0 │ true               │
│   95497 │ Data Engineer   │ Anywhere      │         85000.0 │ true               │
│   96780 │ Data Analyst    │ Anywhere      │        125000.0 │ true               │
│   99636 │ Data Analyst    │ Anywhere      │        112050.0 │ true               │
│  101435 │ Data Engineer   │ Anywhere      │         95000.0 │ true               │
│  101718 │ Data Engineer   │ Anywhere      │         80000.0 │ true               │
│     ·   │      ·          │    ·          │            ·    │  ·                 │
│     ·   │      ·          │    ·          │            ·    │  ·                 │
│     ·   │      ·          │    ·          │            ·    │  ·                 │
│ 1562438 │ Data Analyst    │ Anywhere      │        100000.0 │ true               │
│ 1566823 │ Data Engineer   │ Anywhere      │         87500.0 │ true               │
│ 1569539 │ Data Engineer   │ Anywhere      │         87200.0 │ true               │
│ 1571323 │ Data Engineer   │ Anywhere      │         75000.0 │ true               │
│ 1580304 │ Data Engineer   │ Anywhere      │         90000.0 │ true               │
│ 1593299 │ Data Engineer   │ Anywhere      │         90000.0 │ true               │
│ 1593541 │ Data Analyst    │ San Diego, CA │        123500.0 │ false              │
│ 1593650 │ Data Analyst    │ San Diego, CA │        107500.0 │ false              │
│ 1599399 │ Data Analyst    │ Anywhere      │        120500.0 │ true               │
│ 1599902 │ Data Engineer   │ Anywhere      │         85000.0 │ true               │
│ 1600326 │ Data Analyst    │ Anywhere      │        121667.0 │ true               │
│ 1600520 │ Data Analyst    │ Anywhere      │        120500.0 │ true               │
│ 1603993 │ Data Analyst    │ Anywhere      │        115000.0 │ true               │
│ 1611027 │ Data Engineer   │ Anywhere      │         75000.0 │ true               │
│ 1611819 │ Data Analyst    │ Anywhere      │        120500.0 │ true               │
│ 1615816 │ Data Engineer   │ Anywhere      │         90000.0 │ true               │
│ 1615837 │ Data Engineer   │ Anywhere      │         97500.0 │ true               │
│ 1616078 │ Data Analyst    │ Anywhere      │        105000.0 │ true               │
│ 1616334 │ Data Engineer   │ Anywhere      │         85000.0 │ true               │
│ 1619857 │ Data Analyst    │ Anywhere      │        115000.0 │ true               │
└─────────┴─────────────────┴───────────────┴─────────────────┴────────────────────┘
  429 rows (40 shown)          use .last to show entire result           5 columns
*/


/*
- Get job details for BOTH 'Cloud Engineer' or 'DevOps Engineer' positions
  - For Cloud Engineer, I want jobs only $110k - $140k
  - For DevOps Engineer, I only want jobs $130k - $160k
    - Sidenote: I want more for DevOps because I have Kubernetes certificates
  - Only include jobs that match these conditions:
    - Located in 'Austin, TX' or 'Seattle, WA'
    - Or jobs that are strictly remote (job_work_from_home is true)
*/

SELECT
  job_id,
  job_title_short,
  job_location,
  salary_year_avg,
  job_work_from_home,
FROM
  job_postings_fact
WHERE 
  (
      (job_title_short = 'Cloud Engineer' AND salary_year_avg BETWEEN 110_000 AND 140_000)
    OR 
      (job_title_short = 'DevOps Engineer' AND salary_year_avg BETWEEN 130_000 AND 160_000)
  )
AND
  (job_location IN ('Austin, TX', 'Seattle, WA') OR job_work_from_home = TRUE)
ORDER By salary_year_avg DESC;

/*
┌─────────┬─────────────────┬──────────────┬─────────────────┬────────────────────┐
│ job_id  │ job_title_short │ job_location │ salary_year_avg │ job_work_from_home │
│  int32  │     varchar     │   varchar    │     double      │      boolean       │
├─────────┼─────────────────┼──────────────┼─────────────────┼────────────────────┤
│  632217 │ Cloud Engineer  │ Anywhere     │        140000.0 │ true               │
│ 1576239 │ Cloud Engineer  │ Anywhere     │        137500.0 │ true               │
│ 1604350 │ Cloud Engineer  │ Austin, TX   │        137300.0 │ false              │
│ 1212670 │ Cloud Engineer  │ Anywhere     │        132000.0 │ true               │
│  537066 │ Cloud Engineer  │ Anywhere     │        120000.0 │ true               │
│   79855 │ Cloud Engineer  │ Anywhere     │        110000.0 │ true               │
└─────────┴─────────────────┴──────────────┴─────────────────┴────────────────────┘
  6 rows (6 shown)          use .last to show entire result           5 columns
*/



/*
- Get job details for BOTH 'Business Analyst' or 'Data Scientist' positions
  - For Business Analyst, I want jobs only $60k - $80k
  - For Data Scientist, I only want jobs $120k - $150k
    - Sidenote: I expect higher pay here because I know Python and Machine Learning
  - Only include jobs where:
    - The job explicitly mentions no degree required (job_no_degree_mention is true)
    - The job offers health insurance (job_health_insurance is true)
*/

SELECT
  job_id,
  job_title_short,
  job_location,
  salary_year_avg,
  job_work_from_home,
  job_health_insurance,
  job_no_degree_mention
FROM
  job_postings_fact
WHERE 
  (
    (job_title_short = 'Business Analyst' AND salary_year_avg BETWEEN 60_000 AND 80_000)
OR
    (job_title_short = 'Data Scientist' AND salary_year_avg BETWEEN 120_000 AND 150_000)
  )
AND 
  (job_no_degree_mention = TRUE AND job_health_insurance = TRUE)
ORDER BY 
  salary_year_avg DESC;


/*
┌─────────┬──────────────────┬───┬──────────────────────┬───────────────────────┐
│ job_id  │ job_title_short  │ … │ job_health_insurance │ job_no_degree_mention │
│  int32  │     varchar      │ … │       boolean        │        boolean        │
├─────────┼──────────────────┼───┼──────────────────────┼───────────────────────┤
│  552183 │ Data Scientist   │ … │ true                 │ true                  │
│  399882 │ Data Scientist   │ … │ true                 │ true                  │
│ 1597617 │ Data Scientist   │ … │ true                 │ true                  │
│ 1353186 │ Data Scientist   │ … │ true                 │ true                  │
│  940863 │ Data Scientist   │ … │ true                 │ true                  │
│ 1586916 │ Data Scientist   │ … │ true                 │ true                  │
│  857983 │ Data Scientist   │ … │ true                 │ true                  │
│ 1249480 │ Data Scientist   │ … │ true                 │ true                  │
│  512742 │ Data Scientist   │ … │ true                 │ true                  │
│ 1005467 │ Data Scientist   │ … │ true                 │ true                  │
│  800721 │ Data Scientist   │ … │ true                 │ true                  │
│ 1321516 │ Data Scientist   │ … │ true                 │ true                  │
│ 1294315 │ Data Scientist   │ … │ true                 │ true                  │
│  124079 │ Data Scientist   │ … │ true                 │ true                  │
│ 1598757 │ Data Scientist   │ … │ true                 │ true                  │
│ 1598771 │ Data Scientist   │ … │ true                 │ true                  │
│  640399 │ Data Scientist   │ … │ true                 │ true                  │
│  566264 │ Data Scientist   │ … │ true                 │ true                  │
│ 1418191 │ Data Scientist   │ … │ true                 │ true                  │
│ 1597742 │ Data Scientist   │ … │ true                 │ true                  │
│  786111 │ Data Scientist   │ … │ true                 │ true                  │
│  635799 │ Data Scientist   │ … │ true                 │ true                  │
│   81488 │ Data Scientist   │ … │ true                 │ true                  │
│  920574 │ Data Scientist   │ … │ true                 │ true                  │
│ 1204070 │ Data Scientist   │ … │ true                 │ true                  │
│   40603 │ Data Scientist   │ … │ true                 │ true                  │
│ 1365075 │ Business Analyst │ … │ true                 │ true                  │
│ 1316430 │ Business Analyst │ … │ true                 │ true                  │
│  906412 │ Business Analyst │ … │ true                 │ true                  │
│  718744 │ Business Analyst │ … │ true                 │ true                  │
│  579823 │ Business Analyst │ … │ true                 │ true                  │
│  992488 │ Business Analyst │ … │ true                 │ true                  │
│  878029 │ Business Analyst │ … │ true                 │ true                  │
│  265760 │ Business Analyst │ … │ true                 │ true                  │
│  309455 │ Business Analyst │ … │ true                 │ true                  │
│ 1226050 │ Business Analyst │ … │ true                 │ true                  │
│  574916 │ Business Analyst │ … │ true                 │ true                  │
│ 1013996 │ Business Analyst │ … │ true                 │ true                  │
│ 1309330 │ Business Analyst │ … │ true                 │ true                  │
│  833237 │ Business Analyst │ … │ true                 │ true                  │
│ 1603659 │ Business Analyst │ … │ true                 │ true                  │
└─────────┴──────────────────┴───┴──────────────────────┴───────────────────────┘
  41 rows          use .last to show entire result          7 columns (4 shown)
*/


/*
- Get job details for BOTH ''Machine Learning Engineer'' or 'Senior Data Engineer' positions
  - For Machine Learning Engineer, I want jobs only $140k - $180k
  - For Senior Data Engineer, I only want jobs $90k - $110k
    - Sidenote: The lower end is fine for DBA if the schedule is flexible
  - Only include jobs that fit these conditions:
    - Posted via 'LinkedIn' or 'Indeed' (job_via)
    - Located in 'New York, NY' or 'Chicago, IL'
    - Must be a 'Full-time' job_schedule_type
*/


SELECT
  job_id,
  job_title_short,
  job_location,
  salary_year_avg,
  job_schedule_type,
  job_via
FROM
  job_postings_fact
WHERE 
  (
    (job_title_short = 'Machine Learning Engineer' AND salary_year_avg BETWEEN 140_000 AND 180_000) 
    OR 
    (job_title_short = 'Senior Data Engineer' AND salary_year_avg BETWEEN 100_000 AND 170_000)
  )
  AND
  (job_location IN ('New York, NY', 'Chicago, IL') AND job_via = 'LinkedIn' AND job_schedule_type = 'Full-time')
ORDER BY 
  salary_year_avg DESC;

/*
┌─────────┬─────────────────────────┬──────────────┬───┬───────────────────┬──────────┐
│ job_id  │     job_title_short     │ job_location │ … │ job_schedule_type │ job_via  │
│  int32  │         varchar         │   varchar    │ … │      varchar      │ varchar  │
├─────────┼─────────────────────────┼──────────────┼───┼───────────────────┼──────────┤
│ 1287368 │ Machine Learning Engin… │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1539473 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1544653 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1545852 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1547252 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1549449 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1617876 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1538217 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1227694 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1442283 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1530121 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1619021 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1607148 │ Machine Learning Engin… │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1557895 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1436148 │ Senior Data Engineer    │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1483761 │ Senior Data Engineer    │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1557501 │ Senior Data Engineer    │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1582580 │ Senior Data Engineer    │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1554159 │ Senior Data Engineer    │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1596674 │ Senior Data Engineer    │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1434020 │ Senior Data Engineer    │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1581800 │ Machine Learning Engin… │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1610744 │ Senior Data Engineer    │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1427879 │ Senior Data Engineer    │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1309898 │ Senior Data Engineer    │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1594286 │ Senior Data Engineer    │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1596800 │ Senior Data Engineer    │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1206935 │ Senior Data Engineer    │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1217476 │ Machine Learning Engin… │ Chicago, IL  │ … │ Full-time         │ LinkedIn │
│ 1602608 │ Senior Data Engineer    │ New York, NY │ … │ Full-time         │ LinkedIn │
│ 1288735 │ Senior Data Engineer    │ New York, NY │ … │ Full-time         │ LinkedIn │
└─────────┴─────────────────────────┴──────────────┴───┴───────────────────┴──────────┘
  31 rows             use .last to show entire result             6 columns (5 shown)   
*/



/*
- Get job details from BOTH 'Senior Data Engineer' or 'Data Analyst' positions
  - For Senior Data Engineer, I want jobs only $150k - $190k
  - For Data Analyst, I only want jobs $110k - $130k
    - Sidenote: I will accept the lower end for Analytics Engineer if they offer health insurance
  - Only include jobs that match these conditions:
    - Must be posted via 'ZipRecruiter' or 'via LinkedIn' or 'LinkedIn' (I want direct company hires)
    - Located in either 'Dallas, TX' or 'Austin, TX'
*/


SELECT
  job_id,
  job_title_short,
  job_location,
  salary_year_avg,
  job_via
FROM
  job_postings_fact
WHERE 
  (
      (job_title_short = 'Senior Data Engineer' AND salary_year_avg BETWEEN 150_000 AND 190_000)
    OR
      (job_title_short = 'Data Analyst' AND salary_year_avg BETWEEN 110_000 AND 130_000)
  )
  AND
    (
      job_via IN ('ZipRecruiter', 'LinkedIn', 'via LinkedIn') 
        AND 
      job_location IN ('Dallas, TX', 'Austin, TX')
    )
ORDER BY salary_year_avg DESC;

/*
┌─────────┬──────────────────────┬──────────────┬─────────────────┬──────────────┐
│ job_id  │   job_title_short    │ job_location │ salary_year_avg │   job_via    │
│  int32  │       varchar        │   varchar    │     double      │   varchar    │
├─────────┼──────────────────────┼──────────────┼─────────────────┼──────────────┤
│ 1599850 │ Senior Data Engineer │ Austin, TX   │        189500.0 │ LinkedIn     │
│  209365 │ Senior Data Engineer │ Austin, TX   │        180000.0 │ via LinkedIn │
│  654580 │ Senior Data Engineer │ Austin, TX   │        180000.0 │ via LinkedIn │
│ 1595139 │ Senior Data Engineer │ Austin, TX   │        171000.0 │ LinkedIn     │
│  516857 │ Senior Data Engineer │ Austin, TX   │        170000.0 │ via LinkedIn │
│  292053 │ Senior Data Engineer │ Austin, TX   │        162500.0 │ via LinkedIn │
│ 1295496 │ Data Analyst         │ Austin, TX   │        128500.0 │ LinkedIn     │
│ 1305548 │ Data Analyst         │ Austin, TX   │        128500.0 │ LinkedIn     │
│ 1603324 │ Data Analyst         │ Austin, TX   │        126000.0 │ LinkedIn     │
│ 1606558 │ Data Analyst         │ Austin, TX   │        126000.0 │ LinkedIn     │
│  229657 │ Data Analyst         │ Austin, TX   │        125000.0 │ via LinkedIn │
│  796712 │ Data Analyst         │ Dallas, TX   │        125000.0 │ via LinkedIn │
│ 1331085 │ Data Analyst         │ Dallas, TX   │        120500.0 │ LinkedIn     │
│ 1331485 │ Data Analyst         │ Dallas, TX   │        120000.0 │ LinkedIn     │
│  245010 │ Data Analyst         │ Dallas, TX   │        117500.0 │ via LinkedIn │
│ 1554765 │ Data Analyst         │ Dallas, TX   │        117500.0 │ ZipRecruiter │
│ 1523789 │ Data Analyst         │ Dallas, TX   │        115000.0 │ LinkedIn     │
│ 1594617 │ Data Analyst         │ Dallas, TX   │        115000.0 │ LinkedIn     │
│   92254 │ Data Analyst         │ Austin, TX   │        112500.0 │ via LinkedIn │
│  913799 │ Data Analyst         │ Austin, TX   │        110900.0 │ via LinkedIn │
└─────────┴──────────────────────┴──────────────┴─────────────────┴──────────────┘
  20 rows                                                              5 columns
*/


/*
- Get job details from BOTH 'Software Engineer' or 'Business Analyst' positions
  - For Software Engineer, I only want hourly roles paying $45 - $65 an hour (salary_hour_avg)
  - For Business Analyst, I only want hourly roles paying $60 - $80 an hour (salary_hour_avg)
    - Sidenote: I want more for BI because I have to build dashboards and talk to stakeholders
  - Only include jobs where:
    - The job schedule type is 'Contract' or 'Part-time'
    - Located in 'Miami, FL' or 'Atlanta, GA'
*/

SELECT
  job_id,
  job_title_short,
  job_location,
  salary_hour_avg,
  job_schedule_type
FROM
  job_postings_fact
WHERE 
  (
    (job_title_short = 'Software Engineer' AND salary_hour_avg BETWEEN 45 AND 65)
    OR
    (job_title_short = 'Business Analyst' AND salary_hour_avg BETWEEN 60 AND 80)
   )
  AND
   (job_schedule_type = 'Contractor' AND job_location IN ('Miami, FL', 'Atlanta, GA'))
ORDER BY salary_hour_avg;

/*
┌─────────┬──────────────────┬──────────────┬───────────────────┬───────────────────┐
│ job_id  │ job_title_short  │ job_location │  salary_hour_avg  │ job_schedule_type │
│  int32  │     varchar      │   varchar    │      double       │      varchar      │
├─────────┼──────────────────┼──────────────┼───────────────────┼───────────────────┤
│  309341 │ Business Analyst │ Atlanta, GA  │              60.0 │ Contractor        │
│  902370 │ Business Analyst │ Atlanta, GA  │              61.0 │ Contractor        │
│  908268 │ Business Analyst │ Atlanta, GA  │              61.0 │ Contractor        │
│  765275 │ Business Analyst │ Atlanta, GA  │              75.0 │ Contractor        │
│ 1234993 │ Business Analyst │ Atlanta, GA  │ 75.61000061035156 │ Contractor        │
│  776843 │ Business Analyst │ Atlanta, GA  │              80.0 │ Contractor        │
└─────────┴──────────────────┴──────────────┴───────────────────┴───────────────────┘
  6 rows (6 shown)          use .last to show entire result           5 columns
*/