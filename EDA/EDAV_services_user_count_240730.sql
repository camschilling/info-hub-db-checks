SELECT TOP 10 * FROM [infohub].[EDAVServicesUserCountHistory] ORDER BY [Date] DESC;

SELECT COUNT(*) FROM [infohub].[EDAVServicesUserCountHistory];

SELECT MIN([Date]) AS min_date, MAX([Date]) AS max_date,
MIN([Total]) AS min_total, MAX([Total]) AS max_total 
FROM [infohub].[EDAVServicesUserCountHistory];

WITH prep AS(
    SELECT [Total], 
    [Date] AS curr_date, 
    LAG([Date])OVER(ORDER BY [Date]) AS prev_date 
    FROM [infohub].[EDAVServicesUserCountHistory]
)
, prep2 AS(
    SELECT *, DATEDIFF(day, [prev_date], [curr_date]) AS date_diff
    FROM prep
)
SELECT AVG([date_diff]), MIN([date_diff]), MAX([date_diff])
FROM prep2;

WITH prep AS(
    SELECT [Total], 
    [Date] AS curr_date, 
    LAG([Date])OVER(ORDER BY [Date]) AS prev_date 
    FROM [infohub].[EDAVServicesUserCountHistory]
)
, prep2 AS(
    SELECT *, DATEDIFF(day, [prev_date], [curr_date]) AS date_diff
    FROM prep
)
SELECT *
FROM prep2
ORDER BY date_diff DESC
