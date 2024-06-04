/*
This file produces a temp table that can be reviewed by a SME to evaluate whether data expectation are met.
The counts for many data files will change over time, but this is helpful in understanding whether certain files
have decreased their number of records.
As of 6/4/24, all tables/views evaluated should have the same number of records as their expected count
except for the GeneralStaff view and the 3 Data Academy Views. 
These 4 data objects have their upstream data maintained by EDAV. 
They key for these 4 data views is that they are the same counts between Dev and Prod.
*/

WITH counts AS (
    SELECT 'EDC' AS dat_name
    , 8 AS expected_cnt
    , COUNT(*) AS actual_cnt 
    FROM [infohub].[EDC] 
    UNION ALL 
    SELECT 'Mortality FHIR' AS dat_name
    , 57 AS expected_cnt
    , COUNT(*) AS cnt_records 
    FROM [infohub].[Mortality FHIR]
    UNION ALL 
    SELECT 'LDX Intermediaries' AS dat_name
    , 64 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[LDX Intermediaries]
    UNION ALL 
    SELECT 'ProjectCount' AS dat_name
    , 399 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[ProjectCount]
    UNION ALL 
    SELECT 'LDX ETOR' AS dat_name
    , 57 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[LDX ETOR]
    UNION ALL 
    SELECT 'Surveys' AS dat_name
    , 164 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[Surveys]
    UNION ALL 
    SELECT 'PHA eICR' AS dat_name
    , 64 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[PHA eICR]
    UNION ALL
    SELECT 'PHDS Overall' AS dat_name
    , 13 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[PHDS Overall]
    UNION ALL
    SELECT 'NNDSS GenV2' AS dat_name
    , 60 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[NNDSS GenV2]
    UNION ALL
    SELECT 'eCR Hospitals' AS dat_name
    , 56 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[eCR Hospitals]
    UNION ALL
    SELECT 'Pathways Count' AS dat_name
    , 25 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[Pathways Count]
    UNION ALL
    SELECT 'Course Completion Fact' AS dat_name
    , 6405 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[Course Completion Fact]
    UNION ALL
    SELECT 'Course Dimension' AS dat_name
    , 140 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [infohub].[Course Dimension]
    UNION ALL
    SELECT 'GeneralStaff' AS dat_name
    , 174292 AS expected_cnt
    , COUNT(*) AS cnt_records
    FROM [lookupview].[GeneralStaff]
)
SELECT *
, CASE WHEN expected_cnt = actual_cnt THEN 'same' ELSE 'different' END AS cnt_eval 
FROM counts;
GO
