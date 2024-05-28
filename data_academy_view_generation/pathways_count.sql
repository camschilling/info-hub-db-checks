SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SELECT COUNT(*) FROM [infohub].[Pathways Count];

IF OBJECT_ID('infohub.Pathways Count', 'V') IS NOT NULL
    DROP VIEW [infohub].[Pathways Count]
GO

CREATE VIEW [infohub].[Pathways Count]
AS SELECT 
		[Completes].[Group Pathways] AS [Group Pathways],
		MIN([Completes].[Course Count]) as [Course Count]
	FROM
	(
		SELECT 
			[Source].[Group Pathways],
			[Source].[Course Count]
		FROM [admin].[DataAcademyCompletedPathways] as [Source]
		WHERE [Source].[Pathway Completion Status] = 'Complete'
	) 
	AS [Completes]
	GROUP BY [Group Pathways];
GO

SELECT COUNT(*) FROM [infohub].[Pathways Count];
