/*
File power_bi_refactoring\staff_dimension.sql expects that there be no duplicates 
when a SELECT DISTINCT is run on [lookupview].[GeneralStaff]'s fields of [AdminCodeHierarchy],[AdminCode].
In order for this to be true, the [RecordStatusCode] needs to filter out those that are not empty strings. 
This query identifies any cases where this assumption is not met. 
*/

WITH valid_general_staff_records AS(
    SELECT * FROM [lookupview].[GeneralStaff]
    WHERE [RecordStatusCode] = ''
),
prep AS(
    SELECT DISTINCT
    [AdminCodeHierarchy],
    [AdminCode]
    FROM valid_general_staff_records),
grouped AS(
    SELECT [AdminCode], 
    COUNT(*) AS rec_cnt
    FROM prep
    GROUP BY [AdminCode]
)
SELECT COUNT(*) AS invalid_dupe_count_should_be_zero
FROM grouped 
WHERE rec_cnt > 1; 

/*
SELECT COUNT(*) AS record_cnt_should_be_same FROM [infohub].[staff_dimension]
UNION ALL 
SELECT COUNT(*) AS record_cnt_should_be_same FROM [lookupview].[GeneralStaff] WHERE [RecordStatusCode] = '';
*/