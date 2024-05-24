/*
This script tests out code for creating new tables from another
*/

-- Create new table 1
CREATE TABLE [infohub].[dummy_table_cjs](
[string_column] varchar(50)
, [int_column] int
);
GO


-- Insert data into new table 1
INSERT INTO [infohub].[dummy_table_cjs] ([string_column], [int_column])
VALUES ('a', 1); -- for some reason I am getting a syntax error with multiple row insertion

INSERT INTO [infohub].[dummy_table_cjs] ([string_column], [int_column])
VALUES ('b', 2);

-- View table 1
SELECT * FROM [infohub].[dummy_table_cjs];

-- Create another new table 2 from existing table
SELECT * INTO [infohub].[dummy_table2_cjs] FROM [infohub].[dummy_table_cjs];

-- View table 2
SELECT * FROM [infohub].[dummy_table2_cjs];

-- Create another new table 3 from existing table
SELECT [string_column] INTO [infohub].[dummy_table3_cjs] FROM [infohub].[dummy_table_cjs];

-- View table 2
SELECT * FROM [infohub].[dummy_table3_cjs];


-- Check tables exist
SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'infohub' 
AND (
    TABLE_NAME = 'dummy_table_cjs'
    OR 
    TABLE_NAME = 'dummy_table2_cjs'
    OR 
    TABLE_NAME = 'dummy_table3_cjs'
)
ORDER BY TABLE_NAME;

-- Drop table 1 if exists
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'dummy_table_cjs' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[dummy_table_cjs];
GO

-- Drop table 2 if exists
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'dummy_table2_cjs' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[dummy_table2_cjs];
GO

-- Drop table 3 if exists
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'dummy_table3_cjs' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[dummy_table3_cjs];
GO

-- Check tables no longer exist
SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'infohub' 
AND (
    TABLE_NAME = 'dummy_table_cjs'
    OR 
    TABLE_NAME = 'dummy_table2_cjs'
    OR 
    TABLE_NAME = 'dummy_table3_cjs'
)
ORDER BY TABLE_NAME;