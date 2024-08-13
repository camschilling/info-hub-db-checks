SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('infohub.EDAV_User_Count_Month_Agg', 'V') IS NOT NULL
    DROP VIEW [infohub].[EDAV_User_Count_Month_Agg]
GO

CREATE VIEW [infohub].[EDAV_User_Count_Month_Agg]
AS
WITH month_added AS(
    SELECT *
    , DATEFROMPARTS(YEAR([Date]), MONTH([Date]), 1) AS mo
    FROM [infohub].[EDAVServicesUserCountHistory]
)
SELECT [mo], MAX([Total]) AS max_total_for_month
FROM month_added
GROUP BY [mo]
