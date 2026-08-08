/*
What is DDL and DML?
DDL stands for Data Definition Language, which is used to define and manage database structures such as tables
and schemas. DML stands for Data Manipulation Language, which is used to manipulate data within those structures, 
including inserting, updating, and deleting records.
DDL commands include CREATE, ALTER, and DROP, while DML commands include SELECT, INSERT, UPDATE, and DELETE.
*/

--Use another DB
USE data_jobs;

--DDL Example: Dropping a Database
DROP DATABASE
IF EXISTS jobs_mart;

--DDL Example: Creating a Database
CREATE DATABASE 
IF NOT EXISTS jobs_mart;


--DDL Example: Showing all Databases
SHOW DATABASES;

-- Checking schema information using 
-- the information_schema.schemata table
SELECT *
FROM information_schema.schemata;

USE jobs_mart;

--DDL Example: Creating a Schema
CREATE SCHEMA IF NOT EXISTS staging;

---DDL Example: Dropping a Schema
-- DROP SCHEMA IF EXISTS staging;

---DDL Example: Creating a Table
CREATE TABLE IF NOT EXISTS staging.preferred_roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

---Checking table information using 
---the information_schema.tables table
SELECT *
FROM information_schema.tables
WHERE table_catalog = 'jobs_mart';
   
---Selecting all records from 
---the preferred_roles table
SELECT *
FROM staging.preferred_roles;


---Dropping a Table
-- DROP TABLE 
-- IF EXISTS staging.preferred_roles;

---DML Example: Inserting records into the preferred_roles table
INSERT INTO staging.preferred_roles (role_id, role_name)
VALUES (1, 'Software Engineer'),
       (2, 'Data Scientist'),
       (3, 'Product Manager');


---DML Example: Altering records in the preferred_roles table
ALTER TABLE staging.preferred_roles
ADD COLUMN preferred_role BOOLEAN;

---DML Example: Dropping a column from the preferred_roles table
-- ALTER TABLE staging.preferred_roles
-- DROP COLUMN preferred_role;

---DML Example: Updating records in the preferred_roles table
UPDATE staging.preferred_roles
SET preferred_role = TRUE
WHERE role_id = 1 OR role_id = 2;

UPDATE staging.preferred_roles
SET preferred_role = FALSE
WHERE role_id = 3;

---DML Example: Renaming a column in the preferred_roles table
ALTER TABLE staging.preferred_roles
RENAME COLUMN preferred_role TO priority_lvl;

ALTER TABLE staging.preferred_roles
RENAME TO priority_roles;

SELECT *
FROM staging.priority_roles;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER USING priority_lvl::INTEGER;


UPDATE staging.priority_roles
SET priority_lvl = 1
WHERE role_id = 1 OR role_id = 2;

UPDATE staging.priority_roles
SET priority_lvl = 3
WHERE role_id = 3;
