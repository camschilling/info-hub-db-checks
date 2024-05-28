-- Surveys Table
-- Column [ContentTypeID Is problematic. Need to select only specific columns
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Surveys_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[Surveys_migration_backup_20240524];
GO

SELECT 
CAST([ContentTypeID] AS VARCHAR(60)) AS [ContentTypeID] 
, CAST([Title] AS VARCHAR(60)) AS [Title]
, CAST([ColorTag] AS VARCHAR(60)) AS [ColorTag]
, CAST([ComplianceAssetId] AS VARCHAR(60)) AS [ComplianceAssetId]
, CAST([CIO] AS VARCHAR(60)) AS [CIO]
, CAST([User_ID] AS VARCHAR(60)) AS [User_ID]
, CAST([Date_Time_Started] AS VARCHAR(60)) AS [Date_Time_Started]
, CAST([Submitted_Final] AS VARCHAR(60)) AS [Submitted_Final]
, CAST([Most_Recent_Submission] AS VARCHAR(60)) AS [Most_Recent_Submission]
, CAST([Q1_Specific_Entity] AS VARCHAR(60)) AS [Q1_Specific_Entity]
, CAST([Q2_None] AS VARCHAR(60)) AS [Q2_None]
, CAST([Q2_Jan] AS VARCHAR(60)) AS [Q2_Jan]
, CAST([Q2_Feb] AS VARCHAR(60)) AS [Q2_Feb]
, CAST([Q2_Apr] AS VARCHAR(60)) AS [Q2_Apr]
, CAST([Q2_Special] AS VARCHAR(60)) AS [Q2_Special]
, CAST([Q2_Email] AS VARCHAR(60)) AS [Q2_Email]
, CAST([Q2_Snapshot] AS VARCHAR(60)) AS [Q2_Snapshot]
, CAST([Q2_Connects] AS VARCHAR(60)) AS [Q2_Connects]
, CAST([Q2_Other_Check] AS VARCHAR(60)) AS [Q2_Other_Check]
, CAST([Q2_Other_Text] AS VARCHAR(60)) AS [Q2_Other_Text]
, CAST([Excluded] AS VARCHAR(60)) AS [Excluded]
, CAST([Q3_Newsletters] AS VARCHAR(60)) AS [Q3_Newsletters]
, CAST([Q3_Internet] AS VARCHAR(60)) AS [Q3_Internet]
, CAST([Q3_Connects] AS VARCHAR(60)) AS [Q3_Connects]
, CAST([Q3_Sharepoint] AS VARCHAR(60)) AS [Q3_Sharepoint]
, CAST([Q3_Emails] AS VARCHAR(60)) AS [Q3_Emails]
, CAST([Q3_Social] AS VARCHAR(60)) AS [Q3_Social]
, CAST([Q3_Intranet] AS VARCHAR(60)) AS [Q3_Intranet]
, CAST([Q3_Press] AS VARCHAR(60)) AS [Q3_Press]
, CAST([Q3_Presentations] AS VARCHAR(60)) AS [Q3_Presentations]
, CAST([Q3_None] AS VARCHAR(60)) AS [Q3_None]
, CAST([Q4_Estimate] AS VARCHAR(60)) AS [Q4_Estimate]
, CAST([Q5_Champions_Select] AS VARCHAR(60)) AS [Q5_Champions_Select]
, CAST([Q5_Champions_Members] AS VARCHAR(60)) AS [Q5_Champions_Members]
, CAST([Q5_Champions_Freq] AS VARCHAR(60)) AS [Q5_Champions_Freq]
, CAST([Q5_Champions_Freq_Type] AS VARCHAR(60)) AS [Q5_Champions_Freq_Type]
, CAST([Q5_Groups_Select] AS VARCHAR(60)) AS [Q5_Groups_Select]
, CAST([Q5_Groups_Members] AS VARCHAR(60)) AS [Q5_Groups_Members]
, CAST([Q5_Groups_Freq] AS VARCHAR(60)) AS [Q5_Groups_Freq]
, CAST([Q5_Groups_Freq_Type] AS VARCHAR(60)) AS [Q5_Groups_Freq_Type]
, CAST([Q5_Other_Select] AS VARCHAR(60)) AS [Q5_Other_Select]
, CAST([Q5_Other_Members] AS VARCHAR(60)) AS [Q5_Other_Members]
, CAST([Q5_Other_Freq] AS VARCHAR(60)) AS [Q5_Other_Freq]
, CAST([Q5_Other_Freq_Type] AS VARCHAR(60)) AS [Q5_Other_Freq_Type]
, CAST([Q5_None] AS VARCHAR(60)) AS [Q5_None]
, CAST([Q5_Other_Name] AS VARCHAR(60)) AS [Q5_Other_Name]
, CAST([Q6_None] AS VARCHAR(60)) AS [Q6_None]
, CAST([Q6_EDAV] AS VARCHAR(60)) AS [Q6_EDAV]
, CAST([Q6_EDAV_Count] AS VARCHAR(60)) AS [Q6_EDAV_Count]
, CAST([Q6_EDC] AS VARCHAR(60)) AS [Q6_EDC]
, CAST([Q6_EDC_Count] AS VARCHAR(60)) AS [Q6_EDC_Count]
, CAST([Q6_Stacks] AS VARCHAR(60)) AS [Q6_Stacks]
, CAST([Q6_Stacks_Count] AS VARCHAR(60)) AS [Q6_Stacks_Count]
, CAST([Q6_ODC] AS VARCHAR(60)) AS [Q6_ODC]
, CAST([Q6_ODC_Count] AS VARCHAR(60)) AS [Q6_ODC_Count]
, CAST([Q6_CDCReady] AS VARCHAR(60)) AS [Q6_CDCReady]
, CAST([Q6_CDCReady_Count] AS VARCHAR(60)) AS [Q6_CDCReady_Count]
, CAST([Q6_Other] AS VARCHAR(60)) AS [Q6_Other]
, CAST([Q6_Other_Tool_1] AS VARCHAR(60)) AS [Q6_Other_Tool_1]
, CAST([Q6_Other_Tool_1_Count] AS VARCHAR(60)) AS [Q6_Other_Tool_1_Count]
, CAST([Q6_Other_Tool_2] AS VARCHAR(60)) AS [Q6_Other_Tool_2]
, CAST([Q6_Other_Tool_2_Count] AS VARCHAR(60)) AS [Q6_Other_Tool_2_Count]
, CAST([Q6_Other_Tool_3] AS VARCHAR(60)) AS [Q6_Other_Tool_3]
, CAST([Q6_Other_Tool_3_Count] AS VARCHAR(60)) AS [Q6_Other_Tool_3_Count]
, CAST([Q6_Other_Tool_4] AS VARCHAR(60)) AS [Q6_Other_Tool_4]
, CAST([Q6_Other_Tool_4_Count] AS VARCHAR(60)) AS [Q6_Other_Tool_4_Count]
, CAST([Q6_Other_Tool_5] AS VARCHAR(60)) AS [Q6_Other_Tool_5]
, CAST([Q6_Other_Tool_5_Count] AS VARCHAR(60)) AS [Q6_Other_Tool_5_Count]
, CAST([Q7_None] AS VARCHAR(60)) AS [Q7_None]
, CAST([Q7_EASI] AS VARCHAR(60)) AS [Q7_EASI]
, CAST([Q7_EASI_Count] AS VARCHAR(60)) AS [Q7_EASI_Count]
, CAST([Q7_DSUP] AS VARCHAR(60)) AS [Q7_DSUP]
, CAST([Q7_DSUP_Count] AS VARCHAR(60)) AS [Q7_DSUP_Count]
, CAST([Q7_CDCUni] AS VARCHAR(60)) AS [Q7_CDCUni]
, CAST([Q7_CDCUni_Count] AS VARCHAR(60)) AS [Q7_CDCUni_Count]
, CAST([Q7_Other_Training_1] AS VARCHAR(60)) AS [Q7_Other_Training_1]
, CAST([Q7_Other_Training_1_Count] AS VARCHAR(60)) AS [Q7_Other_Training_1_Count]
, CAST([Q7_Other_Training_2] AS VARCHAR(60)) AS [Q7_Other_Training_2]
, CAST([Q7_Other_Training_2_Count] AS VARCHAR(60)) AS [Q7_Other_Training_2_Count]
, CAST([Q7_Other_Training_3] AS VARCHAR(60)) AS [Q7_Other_Training_3]
, CAST([Q7_Other_Training_3_Count] AS VARCHAR(60)) AS [Q7_Other_Training_3_Count]
, CAST([Q7_Other_Training_4] AS VARCHAR(60)) AS [Q7_Other_Training_4]
, CAST([Q7_Other_Training_4_Count] AS VARCHAR(60)) AS [Q7_Other_Training_4_Count]
, CAST([Q7_Other_Training_5] AS VARCHAR(60)) AS [Q7_Other_Training_5]
, CAST([Q7_Other_Training_5_Count] AS VARCHAR(60)) AS [Q7_Other_Training_5_Count]
, CAST([Q7_Other] AS VARCHAR(60)) AS [Q7_Other]
, CAST([Id] AS VARCHAR(60)) AS [Id]
, CAST([ContentType] AS VARCHAR(60)) AS [ContentType]
, CAST([Modified] AS VARCHAR(60)) AS [Modified]
, CAST([Created] AS VARCHAR(60)) AS [Created]
, CAST([CreatedById] AS VARCHAR(60)) AS [CreatedById]
, CAST([ModifiedById] AS VARCHAR(60)) AS [ModifiedById]
, CAST([Owshiddenversion] AS VARCHAR(60)) AS [Owshiddenversion]
, CAST([Version] AS VARCHAR(60)) AS [Version]
, CAST([Path] AS VARCHAR(60)) AS [Path]
, CAST([Survey] AS VARCHAR(60)) AS [Survey]
, CAST([Q2_May] AS VARCHAR(60)) AS [Q2_May]
, CAST([Q2_June] AS VARCHAR(60)) AS [Q2_June]
, CAST([Q2_July] AS VARCHAR(60)) AS [Q2_July]
, CAST([Q3_Listservs] AS VARCHAR(60)) AS [Q3_Listservs]
, CAST([Q3_Media] AS VARCHAR(60)) AS [Q3_Media]
, CAST([Q3_Meetings] AS VARCHAR(60)) AS [Q3_Meetings]
, CAST([Q3_Other_Check] AS VARCHAR(60)) AS [Q3_Other_Check]
, CAST([Q3_Other_Text] AS VARCHAR(60)) AS [Q3_Other_Text]
INTO [infohub].[Surveys_migration_backup_20240524] FROM [infohub].[Surveys];
GO