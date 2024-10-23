USE DATABASE DEV_DB;

USE SCHEMA DEV_DB.DEMO_SCHEMA;
-- Create  table test
CREATE OR REPLACE TABLE DEV_DB.DEMO_SCHEMA.TEST (
    id INT,
    name STRING,
    age INT,
    city STRING,
    salary DECIMAL(10, 2)
);


INSERT INTO TEST (id, name, age, city, salary)
WITH RECURSIVE t(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM t WHERE n < 1000
)
SELECT 
    n AS id,  -- Sequential IDs from 1 to 1000
    ARRAY_CONSTRUCT('Alice', 'Bob', 'Charlie', 'Diana', 'Ethan', 'Fiona', 'George', 'Hannah', 'Isaac', 'Jenna')[
        UNIFORM(0, 9, RANDOM())] AS name,  -- Randomly choose a name from the array
    UNIFORM(20, 60, RANDOM()) AS age,  -- Random age between 20 and 60
    ARRAY_CONSTRUCT('New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia', 'San Antonio', 'San Diego', 'Dallas', 'San Jose')[
        UNIFORM(0, 9, RANDOM())] AS city,  -- Randomly choose a city from the array
    ROUND(UNIFORM(30000, 150000, RANDOM()), 2) AS salary  -- Random salary between 30,000 and 150,000 with 2 decimal places
FROM t;