/*
This script tests out code for creating new tables from another
*/



-- Create table 
CREATE TABLE [infohub].[dummy_table_cjs](
[string_column] varchar(50)
, [int_column] int
);
GO


-- Insert data from data lake in .csv into table

INSERT INTO [infohub].[dummy_table_cjs] (string_column, int_column)
VALUES ('a', 1), ('b', 2), ('c', 3);


SELECT * FROM [infohub].[dummy_table_cjs];

SELECT * INTO [infohub].[dummy_table2_cjs] FROM [infohub].[dummy_table_cjs];

SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'infohub' 
AND (
    TABLE_NAME = 'dummy_table_cjs'
    OR 
    TABLE_NAME = 'dummy_table2_cjs'
)
ORDER BY TABLE_NAME;


DROP TABLE infohub.dummy_table_cjs;
DROP TABLE infohub.dummy_table2_cjs;