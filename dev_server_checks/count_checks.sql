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
    , 6402 AS expected_cnt
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