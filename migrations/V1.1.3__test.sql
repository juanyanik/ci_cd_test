USE SCHEMA DEV_DB.DEMO_SCHEMA;
-- Create the TEST table
CREATE OR REPLACE TABLE DEV_DB.DEMO_SCHEMA.TEST (
    id INT,
    name STRING,
    age INT,
    city STRING,
    salary DECIMAL(10, 2)
);