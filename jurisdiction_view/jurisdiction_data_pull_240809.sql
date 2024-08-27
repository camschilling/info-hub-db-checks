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




-- maybe add in eCR Hospitals data
SELECT lookup.*
    , etor.[SPHL has implemented ETOR July 2023] AS ETOR_implemented
    , etor.Jurisdiction AS etor_jurisdiction 
    , CASE WHEN etor.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS etor_reported
    , intermediaries.[AIMS]
    , intermediaries.[ReportStream]
    , intermediaries.[HIE**]
    , intermediaries.Jurisdiction AS intermediaries_jurisdiction
    , CASE WHEN intermediaries.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS intermediaries_reported
    , mortality_fhir.[Status] AS mortality_fhir_status
    , mortality_fhir.Jurisdiction AS mortlaity_fhir_jurisdiction
    , CASE WHEN mortality_fhir.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS mortality_fhir_reported
    , nndss.[MMG_implementation] AS nndss_mmg_implementation
    , nndss.[GenV2_Content] AS nndss_genV2_content
    , nndss.[MMG_implementation] AS nndss_genV2_new_condition
    , nndss.Jurisdiction AS nndss_jurisdiction
    , CASE WHEN nndss.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS nndss_reported
    , pha_eicr.[processing] AS pha_eicr_processing
    , pha_eicr.[Jurisdiction (AB)] AS pha_eicr_jurisdiction
    , CASE WHEN pha_eicr.[Jurisdiction (AB)] IS NOT NULL THEN 1 ELSE 0 END AS pha_eicr_reported
FROM [infohub].[jurisdiction_lookup] AS lookup
    FULL OUTER JOIN [infohub].[LDX ETOR] AS etor
        ON lookup.Jurisdiction_Abbreviation = etor.Jurisdiction
    FULL OUTER JOIN [infohub].[LDX Intermediaries] AS intermediaries
        ON lookup.Jurisdiction_Abbreviation = intermediaries.Jurisdiction
    FULL OUTER JOIN [infohub].[Mortality FHIR] AS mortality_fhir
        ON lookup.Jurisdiction_Abbreviation = mortality_fhir.Jurisdiction
    FULL OUTER JOIN [infohub].[NNDSS GenV2] AS nndss
        ON lookup.Jurisdiction_Abbreviation = 
            CASE WHEN nndss.Jurisdiction = 'FSM/FM' THEN 'FM'
            WHEN nndss.Jurisdiction = 'RMI/MH' THEN 'MH'
            WHEN nndss.Jurisdiction = 'USVI/VI' THEN 'VI'
            WHEN nndss.Jurisdiction = 'CNMI/MP' THEN 'MP'
            ELSE nndss.Jurisdiction
            END
    FULL OUTER JOIN [infohub].[PHA eICR] AS pha_eicr
        ON lookup.Jurisdiction_Abbreviation = pha_eicr.[Jurisdiction (AB)]

-- need a DQ check that [Jurisdiction] is never null

