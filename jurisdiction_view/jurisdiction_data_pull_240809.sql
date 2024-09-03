/*
8/15/24
This file creates a data structure that pulls together jurisdiction-level data from the various data tables we have access to 
Ticket: https://jiradc.cdc.gov/browse/DIHM-2094

PHDS Milestones:
- eCR in surveillance systems: [infohub].[PHA eICR] -- last updated 6/27/24   DefinitiveHospitals.06.27.24.xlsx
- intermediary connection: [infohub].[LDX Intermediaries] -- last updated 7/1 LDX PHDS Milestone Quarterly Data.xlsx (sharepoint.com)
- ETOR PHL implementation: [infohub].[LDX ETOR] -- Confirm last update 7/12   LDX PHDS Milestone Quarterly Data.xlsx
- electronic lab reporting? state level: (is this the NNDSS one?)
- FHIR Adoption for mortality data : [infohub].[Mortality FHIR] -- UPDATE ME (last updated 3/12/24)   Other_PHDS_Metrics.xlsx
- eCR expansion for reportable conditions
- Wastewater
- NHSN Automated data feeds
- eCR for critical access hospitals (state level): [infohub].[eCR Hospitals] -- last updated 6/27/24   DefinitiveHospitals.06.27.24.xlsx
- Core DUA
 

DMI Priorities:
- eCR condition-specific processing

Other:
Which does this map to? [infohub].[NNDSS GenV2] AS nndss -- UPDATE ME (last updated 4/3/24)   NNDSS
*/



WITH prep AS(
SELECT lookup.*
    , etor.[SPHL has implemented ETOR July 2023] AS ETOR_implemented
    --, etor.Jurisdiction AS etor_jurisdiction 
    , CASE WHEN etor.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS etor_reported
    , intermediaries.[AIMS]
    , intermediaries.[ReportStream]
    , intermediaries.[HIE**]
    --, intermediaries.Jurisdiction AS intermediaries_jurisdiction
    , CASE WHEN intermediaries.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS intermediaries_reported
    , mortality_fhir.[Status] AS mortality_fhir_status
    --, mortality_fhir.Jurisdiction AS mortlaity_fhir_jurisdiction
    , CASE WHEN mortality_fhir.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS mortality_fhir_reported
    , nndss.[MMG_implementation] AS nndss_mmg_implementation
    , nndss.[GenV2_Content] AS nndss_genV2_content
    , nndss.[MMG_implementation] AS nndss_genV2_new_condition
    --, nndss.Jurisdiction AS nndss_jurisdiction
    , CASE WHEN nndss.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS nndss_reported
    , pha_eicr.[processing] AS pha_eicr_processing
    --, pha_eicr.[Jurisdiction (AB)] AS pha_eicr_jurisdiction
    , CASE WHEN pha_eicr.[Jurisdiction (AB)] IS NOT NULL THEN 1 ELSE 0 END AS pha_eicr_reported
    , ecr_hospitals.[# CAH] as num_CAH_in_state
    , ecr_hospitals.[# CAH using eCR] as num_CAH_in_state_w_ecr
    , ecr_hospitals.[% CAH using eCR]*100 pct_CAH_in_state_w_ecr
    --, ecr_hospitals.[State] AS ecr_hospital_state
    , CASE WHEN ecr_hospitals.[State] IS NOT NULL THEN 1 ELSE 0 END AS ecr_hospitals_reported
FROM [infohub].[jurisdiction_lookup] AS lookup
    FULL OUTER JOIN [infohub].[LDX ETOR] AS etor -- Confirm up to date (assume 7/12) https://cdc.sharepoint.com/:x:/r/teams/DataModernizationImplementationLeads/InfoHubApps/_layouts/15/Doc.aspx?sourcedoc=%7BF690BCF2-369A-4C42-A903-4B55094F0BFF%7D&file=LDX%20PHDS%20Milestone%20Quarterly%20Data.xlsx&action=default&mobileredirect=true
        ON lookup.Jurisdiction_Abbreviation = etor.Jurisdiction
    FULL OUTER JOIN [infohub].[LDX Intermediaries] AS intermediaries -- last updated 7/1
        ON lookup.Jurisdiction_Abbreviation = intermediaries.Jurisdiction
    FULL OUTER JOIN [infohub].[Mortality FHIR] AS mortality_fhir -- UPDATE ME (last updated 3/12/24) https://cdc.sharepoint.com/:x:/r/teams/DataModernizationImplementationLeads/InfoHubApps/_layouts/15/Doc.aspx?sourcedoc=%7BEBEB2162-30ED-45A1-B490-E7C32D8AAA34%7D&file=Other_PHDS_Metrics.xlsx&action=default&mobileredirect=true
        ON lookup.Jurisdiction_Abbreviation = mortality_fhir.Jurisdiction
    FULL OUTER JOIN [infohub].[NNDSS GenV2] AS nndss -- UPDATE ME (last updated 4/3/24) https://cdc.sharepoint.com/teams/DataModernizationImplementationLeads/InfoHubApps/Shared%20Documents/Forms/AllItems.aspx?viewpath=%2Fteams%2FDataModernizationImplementationLeads%2FInfoHubApps%2FShared%20Documents%2FForms%2FAllItems%2Easpx&id=%2Fteams%2FDataModernizationImplementationLeads%2FInfoHubApps%2FShared%20Documents%2FNNDSS&viewid=acc584f3%2D7bc3%2D4046%2Da0ab%2D1a5c2e4c06c6
        ON lookup.Jurisdiction_Abbreviation = 
            CASE WHEN nndss.Jurisdiction = 'FSM/FM' THEN 'FM'
            WHEN nndss.Jurisdiction = 'RMI/MH' THEN 'MH'
            WHEN nndss.Jurisdiction = 'USVI/VI' THEN 'VI'
            WHEN nndss.Jurisdiction = 'CNMI/MP' THEN 'MP'
            ELSE nndss.Jurisdiction
            END
    FULL OUTER JOIN [infohub].[PHA eICR] AS pha_eicr -- last updated 6/27/24
        ON lookup.Jurisdiction_Abbreviation = pha_eicr.[Jurisdiction (AB)]
    FULL OUTER JOIN [infohub].[eCR Hospitals] AS ecr_hospitals -- last updated 6/27/24
        ON lookup.Jurisdiction_Abbreviation = ecr_hospitals.[State]
)
SELECT * FROM prep --WHERE [Jurisdiction] IS NULL

-- need a DQ check that [Jurisdiction] is never null
