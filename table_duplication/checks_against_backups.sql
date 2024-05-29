-- EDC Table
SELECT 'EDC' AS dat, 1 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[EDC_migration_backup_20240524] 
UNION ALL 
SELECT 'EDC' AS dat, 0 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[EDC]
-- Mortality FHIR Table
UNION ALL 
SELECT 'Mortality_FHIR' AS dat, 1 AS is_backup, COUNT(*) AS record_cnt FROM [infohub].[Mortality FHIR_migration_backup_20240524] 
UNION ALL 
SELECT 'Mortality_FHIR' AS dat, 0 AS is_backup, COUNT(*) AS record_cnt FROM [infohub].[Mortality FHIR]
-- LDX Intermediaries Table
UNION ALL 
SELECT 'LDX_Intermediaries' AS dat, 1 AS is_backup, COUNT(*) AS record_cnt FROM [infohub].[LDX Intermediaries_migration_backup_20240524] 
UNION ALL 
SELECT 'LDX_Intermediaries' AS dat, 0 AS is_backup, COUNT(*) AS record_cnt FROM [infohub].[LDX Intermediaries]
-- ProjectCount Table -- not in PHDS Overall
UNION ALL 
SELECT 'ProjectCount' AS dat, 1 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[ProjectCount_migration_backup_20240524] 
UNION ALL 
SELECT 'ProjectCount' AS dat, 0 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[ProjectCount]
-- LDX ETOR Table
UNION ALL 
SELECT 'LDX_ETOR' AS dat, 1 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[LDX ETOR_migration_backup_20240524] 
UNION ALL 
SELECT 'LDX_ETOR' AS dat, 0 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[LDX ETOR]
-- Surveys Table -- not in PHDS Overall
UNION ALL 
SELECT 'Surveys' AS dat, 1 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[Surveys_migration_backup_20240524] 
UNION ALL 
SELECT 'Surveys' AS dat, 0 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[Surveys]
-- PHA eICR Tables
UNION ALL 
SELECT 'PHA_eICR' AS dat, 1 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[PHA eICR_migration_backup_20240524] 
UNION ALL 
SELECT 'PHA_eICR' AS dat, 0 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[PHA eICR]
-- PHDS Overall Table
UNION ALL 
SELECT 'PHDS_Overall' AS dat, 1 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[PHDS Overall_migration_backup_20240524] 
UNION ALL 
SELECT 'PHDS_Overall' AS dat, 0 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[PHDS Overall]
-- NNDSS GenV2 Table
UNION ALL 
SELECT 'NNDSS_GenV2' AS dat, 1 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[NNDSS GenV2_migration_backup_20240524] 
UNION ALL 
SELECT 'NNDSS_GenV2' AS dat, 0 AS is_backup, COUNT(*) AS record_cnt 
FROM [infohub].[NNDSS GenV2]






