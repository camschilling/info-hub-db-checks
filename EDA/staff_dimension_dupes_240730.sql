SELECT TOP 10 * FROM [infohub].[staff_dimension];

SELECT TOP 10 * FROM [lookupview].[GeneralStaff];

SELECT COUNT(*) AS tot_cnt, COUNT(DISTINCT [UserID]) AS unique_ids
FROM [lookupview].[GeneralStaff]
/* 
--Dev:
tot_cnt 175123	
unique_ids 175122

--Prod:
tot_cnt 175145	
unique_ids 175144
*/

SELECT COUNT(*) AS tot_cnt, COUNT(DISTINCT [UserID]) AS unique_ids
FROM [infohub].[staff_dimension]
/* 
--Dev:
tot_cnt 29306	
unique_ids 29305

--Prod:
tot_cnt 29322
unique_ids 29321
*/


-- QOO3 is the dupe
SELECT * FROM [lookupview].[GeneralStaff] WHERE [UserID] = 'QOO3';

