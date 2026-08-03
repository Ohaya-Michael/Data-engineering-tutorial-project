# 🗄️ SQL for Data Engineering — Learning Project

A hands-on walkthrough of SQL, from the very first `SELECT` to multi-table joins and aggregation, built on a real-world dataset of job postings. Each file is a self-contained lesson: the queries are runnable, and the results are embedded as comments so you can follow along without a database.

Dataset tables used throughout: `job_postings_fact`, `company_dim`, `skills_dim`, and `skills_job_dim` (a bridge table linking postings to skills).

> 🔗 Repository: [Data-engineering-tutorial-project](https://github.com/Ohaya-Michael/Data-engineering-tutorial-project)

---

## 📑 Table of Contents

- [About This Project](#-about-this-project)
- [Dataset & Schema](#-dataset--schema)
- [How to Use](#-how-to-use)
- [Learning Path](#-learning-path)
  - [1. Basic Commands](#1-basic-commands--basic_commandssql)
  - [2. Mid-Level Commands](#2-mid-level-commands--mid_level_commandssql)
  - [3. Advanced Filtering](#3-advanced-filtering--advance_commandssql)
  - [4. Joins](#4-joins--joinssql)
  - [5. Grouping & Order of Execution](#5-grouping--order-of-execution--order_of_executionsql)
- [SQL Order of Execution](#-sql-order-of-execution)
- [Skills Demonstrated](#-skills-demonstrated)
- [Tools](#-tools)
- [Author](#-author)

---

## 📌 About This Project

This project documents my journey learning SQL for data engineering and analytics. Rather than passively following tutorials, I wrote and executed every query against a jobs dataset, progressing from basic retrieval to filtering, pattern matching, joins, and aggregation. The goal is a clear, reproducible reference — for myself and for anyone learning SQL.

[⬆ Back to top](#-table-of-contents)

---

## 🗂️ Dataset & Schema

| Table | Description |
| --- | --- |
| `job_postings_fact` | One row per job posting — title, location, salary, remote flag, schedule, platform, dates. |
| `company_dim` | One row per company — name and links. |
| `skills_dim` | One row per skill (e.g. `sql`, `python`, `aws`). |
| `skills_job_dim` | Bridge table linking postings to skills (many-to-many). |

Key relationships: `job_postings_fact.company_id → company_dim.company_id` and `job_postings_fact.job_id → skills_job_dim.job_id → skills_dim.skill_id`.

[⬆ Back to top](#-table-of-contents)

---

## ▶️ How to Use

1. Load the dataset into a SQL engine — these queries were run in **DuckDB** (PostgreSQL works with minor tweaks).
2. Open any `.sql` file below; run the query at the top of each block.
3. Compare your output against the result tables embedded in the comments.

[⬆ Back to top](#-table-of-contents)

---

## 🧭 Learning Path

### 1. Basic Commands — [`Basic_commands.sql`](Basic_commands.sql)

The foundations of retrieving data.

- Selecting specific columns with `SELECT`
- Reading from a table with `FROM` and limiting rows with `LIMIT`
- Filtering rows with `WHERE`, including `IS NOT NULL`
- Sorting results with `ORDER BY ... DESC`

```sql
SELECT
  job_id, job_title_short, job_location, salary_year_avg, job_work_from_home
FROM job_postings_fact
WHERE job_work_from_home = TRUE AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

[⬆ Back to top](#-table-of-contents)

### 2. Mid-Level Commands — [`Mid_level_commands.sql`](Mid_level_commands.sql)

Pattern matching, aliases, and negation.

- Comparison operators and the `LIKE` wildcard (`%...%` for any characters, `_` for a single character)
- Column aliases with `AS`
- Compound conditions with `AND`, `OR`, and excluding matches with `NOT`

```sql
SELECT
  job_id AS ID, job_location AS location, job_title AS title, job_via AS from_job_platform
FROM job_postings_fact
WHERE (job_title LIKE '%Data%' OR job_title LIKE '%Software%')
  AND job_title LIKE '%Engineer%'
  AND NOT (job_title LIKE '%Senior%' OR job_title LIKE '%Sr%')
LIMIT 10;
```

[⬆ Back to top](#-table-of-contents)

### 3. Advanced Filtering — [`Advance_commands.sql`](Advance_commands.sql)

Building real-world, multi-condition business logic.

- Salary ranges with `BETWEEN`
- Value lists with `IN`
- Carefully parenthesized combinations of `AND` / `OR` to express "role A in one salary band, OR role B in another"

```sql
SELECT job_id, job_title_short, job_location, salary_year_avg, job_work_from_home
FROM job_postings_fact
WHERE (
    (job_title_short = 'Data Engineer' AND salary_year_avg BETWEEN 75_000 AND 100_000)
    OR
    (job_title_short = 'Data Analyst' AND salary_year_avg BETWEEN 100_000 AND 125_000)
  )
  AND (job_location IN ('Bentonville, AR', 'San Diego, CA') OR job_work_from_home = TRUE);
```

[⬆ Back to top](#-table-of-contents)

### 4. Joins — [`joins.sql`](joins.sql)

Combining data across tables — all four join types.

- `LEFT JOIN`, `RIGHT JOIN`, `INNER JOIN`, and `FULL OUTER JOIN`
- Matching rows with `ON`, and reasoning about when `NULL`s appear on each side
- Chaining multiple joins to connect postings → skills bridge → skills

```sql
SELECT jpf.job_id, jpf.job_title_short, sjd.skill_id, sd.skills
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id;
```

[⬆ Back to top](#-table-of-contents)

### 5. Grouping & Order of Execution — [`order_of_execution.sql`](order_of_execution.sql)

Aggregating and filtering grouped data.

- Aggregate functions such as `COUNT`
- `GROUP BY` to collapse rows into groups
- `HAVING` to filter groups by an aggregate (different from `WHERE`, which filters rows)
- The logical order SQL actually processes a query in

```sql
SELECT COUNT(jpf.job_id) AS job_posting_count, cd.name AS company_name
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE jpf.job_country = 'United States'
GROUP BY company_name
HAVING COUNT(jpf.job_id) > 3000
ORDER BY job_posting_count DESC;
```

[⬆ Back to top](#-table-of-contents)

---

## ⚙️ SQL Order of Execution

A key insight from this project — SQL is *written* in one order but *executed* in another:

```
FROM → WHERE → GROUP BY → aggregate functions → HAVING → SELECT → ORDER BY → LIMIT
```

Understanding this explains why, for example, you can filter rows with `WHERE` before grouping, but must use `HAVING` to filter after aggregation — and why a `SELECT` alias isn't always available in `WHERE`.

[⬆ Back to top](#-table-of-contents)

---

## 🎯 Skills Demonstrated

- Core retrieval: `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `LIMIT`
- `NULL` handling with `IS NOT NULL`
- Pattern matching with `LIKE` and wildcards (`%`, `_`)
- Column aliasing with `AS`
- Boolean logic: `AND`, `OR`, `NOT`, `BETWEEN`, `IN`
- All four joins: `LEFT`, `RIGHT`, `INNER`, `FULL OUTER`
- Multi-table joins across a fact/dimension schema
- Aggregation with `COUNT`, `GROUP BY`, and `HAVING`
- Reasoning about SQL's logical order of execution

[⬆ Back to top](#-table-of-contents)

---

## 🛠️ Tools

- **SQL** (DuckDB / PostgreSQL compatible)
- **DuckDB** — used to run the queries and generate the embedded result tables

[⬆ Back to top](#-table-of-contents)

---

## 👤 Author

**Michael Ohaya**
Open to Data Engineering / Data Analytics opportunities.

- GitHub: [Ohaya-Michael](https://github.com/Ohaya-Michael)

[⬆ Back to top](#-table-of-contents)
