/*
This script drops backup tables that were created for dev environment migration.
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


-- Mortality FHIR Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Mortality FHIR_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[Mortality FHIR_migration_backup_20240524];
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


-- ProjectCount Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'ProjectCount_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[ProjectCount_migration_backup_20240524];
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


-- Surveys Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Surveys_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[Surveys_migration_backup_20240524];
GO


-- PHA eICR Tables
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'PHA eICR_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[PHA eICR_migration_backup_20240524];
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


-- NNDSS GenV2 Table
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'NNDSS GenV2_migration_backup_20240524' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[NNDSS GenV2_migration_backup_20240524];
GO


-- Removing [LDX_ETOR] ([LDX ETOR] with the space and not the underscore is in use and will be left alone) 
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'LDX_ETOR' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[LDX_ETOR];
GO

-- Removing [OutcomeDescription]
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'OutcomeDescription' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[OutcomeDescription];
GO


-- Removing [NHSN_Binary]
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'NHSN_Binary' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[NHSN_Binary];
GO


-- Removing NHSN_AU_AR
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'NHSN_AU_AR' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[NHSN_AU_AR];
GO


-- Removing NHSN_AU_AR
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'PHA_eICR_Processing' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[PHA_eICR_Processing];
GO

-- Removing testjira
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'testjira' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[testjira];
GO

-- Removing testjira2
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'testjira2' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[testjira2];
GO

-- Keeping testjira3 for the time being
-- SELECT TOP 10 * FROM [infohub].[testjira3]

-- Removing AppTest
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'AppTest' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[AppTest];
GO


-- Removing goal_descripton_test
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'goal_descripton_test' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[goal_descripton_test];
GO

-- Removing GoalDescription
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'GoalDescription' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[GoalDescription];
GO


-- Removing eCR_State_Percentages
IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'eCR_State_Percentages' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[eCR_State_Percentages];
GO






