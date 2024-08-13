SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SELECT COUNT(*) FROM [infohub].[Course Completion Fact];

IF OBJECT_ID('infohub.Course Completion Fact', 'V') IS NOT NULL
    DROP VIEW [infohub].[Course Completion Fact]
GO

CREATE VIEW [infohub].[Course Completion Fact]
AS SELECT
		[User Id]
		,[CIO Admin Code]
		,[Admin Code]
		,[PersonMajorTypeName]
		,[PersonSubTypeName]
		,[Course Name]
		,[Completion Date]
		,[Course Name] + ' - ' + [Curriculum Name] AS [Course Key]
	FROM [infohub].[DataAcademyCompletedCourses];
GO

SELECT COUNT(*) FROM [infohub].[Course Completion Fact];
