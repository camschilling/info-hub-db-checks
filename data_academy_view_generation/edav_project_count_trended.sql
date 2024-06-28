/*
This script generates a set of views that are used to trend EDAV Project Count data over time.
These queries are tuned to compute the number of active projects as is indicated by the month or year 
*/


--create a lookup table of months of interest
-- drop if exists
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'EDAVProjectCountMonthsLookup' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[EDAVProjectCountMonthsLookup];
GO
-- loop and insert values into relevant dates
CREATE TABLE infohub.EDAVProjectCountMonthsLookup (
  dt DATE
)
-- Change me if we need a different data window
DECLARE @dIncr DATE = '2020-01-01'
DECLARE @dEnd DATE = '2025-01-01'

WHILE ( @dIncr < @dEnd )
BEGIN
  INSERT INTO infohub.EDAVProjectCountMonthsLookup (dt) VALUES(@dIncr)
  SELECT @dIncr = DATEADD(MONTH, 1, @dIncr )
END


--summarize ProjectCount by month
IF OBJECT_ID('infohub.EDAVProjectsByMonthTrend', 'V') IS NOT NULL
    DROP VIEW [infohub].[EDAVProjectsByMonthTrend]
GO

CREATE VIEW [infohub].[EDAVProjectsByMonthTrend]
AS
-- left join ProjectCount using first of month
    WITH active_projects_by_month AS(
        SELECT months.dt, projects.*
        FROM [infohub].[EDAVProjectCountMonthsLookup] AS months
        LEFT JOIN [infohub].[ProjectCount] AS projects
        ON [months].[dt] BETWEEN [projects].[ProjectCreatedDate] AND COALESCE([projects].[ProjectClosedDate], '2099-01-01')
    )
    SELECT [dt] AS mo, [Center], [Division], SUM(ProjectCount) AS active_project_count_sum
    FROM active_projects_by_month
    GROUP BY [dt], [Center], [Division];
GO

-- summarize ProjectCount by year
IF OBJECT_ID('infohub.EDAVProjectsByYearTrend', 'V') IS NOT NULL
    DROP VIEW [infohub].[EDAVProjectsByYearTrend]
GO

CREATE VIEW [infohub].[EDAVProjectsByYearTrend]
AS
    WITH years AS(
        SELECT DISTINCT YEAR(dt) AS yr 
        FROM [infohub].[EDAVProjectCountMonthsLookup]
    )
    , active_projects_by_year AS(
        SELECT [years].[yr], [projects].*
        FROM years
        LEFT JOIN [infohub].[ProjectCount] AS projects
        ON years.yr BETWEEN YEAR(projects.ProjectCreatedDate) AND COALESCE(YEAR(projects.ProjectClosedDate), 2099)
    )
    SELECT [yr], [Center], [Division], SUM(ProjectCount) AS active_project_count_sum
    FROM active_projects_by_year
    GROUP BY [yr], [Center], [Division];
GO


/*
SELECT * FROM [infohub].[EDAVProjectsByMonthTrend] ORDER BY [mo], [Center], [Division];
SELECT * FROM [infohub].[EDAVProjectsByYearTrend] ORDER BY [yr], [Center], [Division];

SELECT [yr], SUM([active_project_count_sum]) FROM [infohub].[EDAVProjectsByYearTrend] GROUP BY yr order by yr;
*/