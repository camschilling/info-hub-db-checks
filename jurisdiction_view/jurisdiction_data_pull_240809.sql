/*
8/15/24
This file creates a data structure that pulls together jurisdiction-level data from the various data tables we have access to 
Ticket: https://jiradc.cdc.gov/browse/DIHM-2094

PHDS Milestones:
- eCR in surveillance systems
- intermediary connection
- ETOR PHL implementation
- electronic lab reporting? state level
- FHIR Adoption for mortality data
- eCR expansion for reportable conditions
- Wastewater
- NHSN Automated data feeds
- eCR for critical access hospitals (state level)
- Core DUA
 

DMI Priorities:
- eCR condition-specific processing
*/



/*
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE [TABLE_SCHEMA] = 'infohub'
AND [TABLE_NAME] NOT IN ('Asset_Inventory', 'CIO_Survey_May_2023', 'Surveys', 'PHDS Overall')
ORDER BY [TABLE_NAME]
*/

-- Tables with known Jurisdiction column
-- AND [TABLE_NAME] IN ('eCR Hospitals', 'LDX ETOR', 'LDX Intermediaries', 'Mortality FHIR', 'NNDSS GenV2', 'PHA eICR')

-- eCR Hospitals has a [State] field
SELECT TOP 10 * FROM [infohub].[ecr Hospitals];

-- ETOR column [Jurisdiction] (ETOR for Public health labs)
SELECT TOP 10 * FROM [infohub].[LDX ETOR]

-- Intermediaries [Jurisdiction] column
SELECT TOP 10 * FROM [infohub].[LDX Intermediaries];

-- Mortality FHIR has [Jurisdiction] column
SELECT TOP 10 * FROM [infohub].[Mortality FHIR];

--NNDSS GenV2 has [Jurisdiction] column
SELECT TOP 10 * FROM [infohub].[NNDSS GenV2];

--PHA eICR has [Jurisdiction (AB)] and [Jurisdiction] column. Can likely be used as crosswalk. 
SELECT TOP 10 * FROM [infohub].[PHA eICR];

SELECT DISTINCT [Jurisdiction (AB)], [Jurisdiction], [Jurisdiction Type] FROM [infohub].[PHA eICR] ORDER BY [Jurisdiction]


SELECT lookup.*
    , etor.[SPHL has implemented ETOR July 2023] AS ETOR_implemented
    , CASE WHEN etor.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS etor_reported
    , intermediaries.[AIMS]
    , intermediaries.
    , intermediaries.
    , CASE WHEN intermediaries.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS intermediaries_reported
    , mortality_fhir.
    , CASE WHEN mortality_fhir.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS mortality_fhir_reported
FROM [infohub].[jurisdiction_lookup] AS lookup
    FULL OUTER JOIN [infohub].[LDX ETOR] AS etor
        ON lookup.Jurisdiction_Abbreviation = etor.Jurisdiction
    FULL OUTER JOIN [infohub].[LDX Intermediaries] AS intermediaries
        ON lookup.Jurisdiction_Abbreviation = intermediaries.Jurisdiction
    FULL OUTER JOIN [infohub].[Mortality FHIR] AS mortality_fhir
        ON lookup.Jurisdiction_Abbreviation = mortality_fhir.Jurisdiction


