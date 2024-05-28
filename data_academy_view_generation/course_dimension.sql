SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SELECT COUNT(*) FROM [infohub].[Course Dimension];

IF OBJECT_ID('infohub.Course Dimension', 'V') IS NOT NULL
    DROP VIEW [infohub].[Course Dimension]
GO

CREATE VIEW [infohub].[Course Dimension]
AS SELECT DISTINCT 
		[Course Name]
		,[Proficiency Name]
		,[Provider Name]
		,[Curriculum Name]
		,[Pathway Name]
		,[Group Pathways]
		,[ProficiencSort]
		,[Course Name] + ' - ' + [Curriculum Name] AS [Course Key]

	FROM [admin].[DataAcademyCompletedCourses];
GO

SELECT COUNT(*) FROM [infohub].[Course Dimension];
