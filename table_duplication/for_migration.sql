/*
This script creates backup tables for the necessary tables in the database.
The tables will be available in the event of an idavertant drop during pipeline refactor.
*/

-- EDC Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'EDC_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[EDC_migration_backup_20240524];
GO

SELECT * INTO [infohub].[EDC_migration_backup_20240524] FROM [infohub].[EDC];
GO

-- Mortality FHIR Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Mortality FHIR_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[Mortality FHIR_migration_backup_20240524];
GO

SELECT * INTO [infohub].[Mortality FHIR_migration_backup_20240524] FROM [infohub].[Mortality FHIR];
GO

-- LDX Intermediaries Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'LDX Intermediaries_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[LDX Intermediaries_migration_backup_20240524];
GO
SELECT * INTO [infohub].[LDX Intermediaries_migration_backup_20240524] FROM [infohub].[LDX Intermediaries];
GO

-- ProjectCount Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'ProjectCount_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[ProjectCount_migration_backup_20240524];
GO
SELECT * INTO [infohub].[ProjectCount_migration_backup_20240524] FROM [infohub].[ProjectCount];
GO


-- LDX ETOR Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'LDX ETOR_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[LDX ETOR_migration_backup_20240524];
GO
SELECT * INTO [infohub].[LDX ETOR_migration_backup_20240524] FROM [infohub].[LDX ETOR];
GO


-- Surveys Table
-- Column [ContentTypeID Is problematic. Need to select only specific columns.
-- See file surveys_backup.sql
/*
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Surveys_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[Surveys_migration_backup_20240524];
GO

SELECT * INTO [infohub].[Surveys_migration_backup_20240524] FROM [infohub].[Surveys];
GO
*/

-- PHA eICR Tables
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'PHA eICR_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[PHA eICR_migration_backup_20240524];
GO
SELECT * INTO [infohub].[PHA eICR_migration_backup_20240524] FROM [infohub].[PHA eICR];
GO


-- PHDS Overall Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'PHDS Overall_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[PHDS Overall_migration_backup_20240524];
GO
SELECT * INTO [infohub].[PHDS Overall_migration_backup_20240524] FROM [infohub].[PHDS Overall];
GO


-- NNDSS GenV2 Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'NNDSS GenV2_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[NNDSS GenV2_migration_backup_20240524];
GO
SELECT * INTO [infohub].[NNDSS GenV2_migration_backup_20240524] FROM [infohub].[NNDSS GenV2];
GO


-- Columns for Surveys Table
/*
ContentTypeID
Title
ColorTag
ComplianceAssetId
CIO
User_ID
Date_Time_Started
Submitted_Final
Most_Recent_Submission
Q1_Specific_Entity
Q2_None
Q2_Jan
Q2_Feb
Q2_Apr
Q2_Special
Q2_Email
Q2_Snapshot
Q2_Connects
Q2_Other_Check
Q2_Other_Text
Excluded
Q3_Newsletters
Q3_Internet
Q3_Connects
Q3_Sharepoint
Q3_Emails
Q3_Social
Q3_Intranet
Q3_Press
Q3_Presentations
Q3_None
Q4_Estimate
Q5_Champions_Select
Q5_Champions_Members
Q5_Champions_Freq
Q5_Champions_Freq_Type
Q5_Groups_Select
Q5_Groups_Members
Q5_Groups_Freq
Q5_Groups_Freq_Type
Q5_Other_Select
Q5_Other_Members
Q5_Other_Freq
Q5_Other_Freq_Type
Q5_None
Q5_Other_Name
Q6_None
Q6_EDAV
Q6_EDAV_Count
Q6_EDC
Q6_EDC_Count
Q6_Stacks
Q6_Stacks_Count
Q6_ODC
Q6_ODC_Count
Q6_CDCReady
Q6_CDCReady_Count
Q6_Other
Q6_Other_Tool_1
Q6_Other_Tool_1_Count
Q6_Other_Tool_2
Q6_Other_Tool_2_Count
Q6_Other_Tool_3
Q6_Other_Tool_3_Count
Q6_Other_Tool_4
Q6_Other_Tool_4_Count
Q6_Other_Tool_5
Q6_Other_Tool_5_Count
Q7_None
Q7_EASI
Q7_EASI_Count
Q7_DSUP
Q7_DSUP_Count
Q7_CDCUni
Q7_CDCUni_Count
Q7_Other_Training_1
Q7_Other_Training_1_Count
Q7_Other_Training_2
Q7_Other_Training_2_Count
Q7_Other_Training_3
Q7_Other_Training_3_Count
Q7_Other_Training_4
Q7_Other_Training_4_Count
Q7_Other_Training_5
Q7_Other_Training_5_Count
Q7_Other
Id
ContentType
Modified
Created
CreatedById
ModifiedById
Owshiddenversion
Version
Path
Survey
Q2_May
Q2_June
Q2_July
Q3_Listservs
Q3_Media
Q3_Meetings
Q3_Other_Check
Q3_Other_Text
*/