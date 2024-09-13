/*
8/15/24
This file creates a data structure that pulls together jurisdiction-level data from the various data tables we have access to 
Ticket: https://jiradc.cdc.gov/browse/DIHM-2094

PHDS Milestones:
- eCR in surveillance systems: [infohub].[PHA eICR] -- last updated 8/24 
- intermediary connections: [infohub].[LDX Intermediaries] -- last updated 7/24 
- ETOR PHL implementation: [infohub].[LDX ETOR] -- Confirm last update 7/24
- electronic lab reporting? state level: NO DETAIL
- FHIR Adoption for mortality data : [infohub].[Mortality FHIR] -- last updated 9/24
- eCR expansion for reportable conditions: [infohub].[eCR_Reportable_Conditions] -- last updated 8/24
- Wastewater: NO DETAIL
- NHSN Automated data feeds: [infohub].[automated_hospital_capacity] -- pending confirmation of 8/24 updates
- eCR for critical access hospitals (state level): [infohub].[eCR Hospitals] -- last updated 8/24
- Core DUA: [infohub].[core_dua] -- pending confirmation of 8/24 updates
 
DMI Priorities:
- eCR condition-specific processing: [infohub].[eCR_Condition_Specific_Elements] -- last updated 8/24
*/

IF OBJECT_ID('infohub.jurisdiction_view', 'V') IS NOT NULL
    DROP VIEW [infohub].[jurisdiction_view]
GO

CREATE VIEW [infohub].[jurisdiction_view]
AS
SELECT lookup.*
    , etor.[SPHL has implemented ETOR July 2023] AS SPHL_ETOR_implemented
    , CASE WHEN etor.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS SPHL_ETOR_reported
    , intermediaries.[AIMS] AS connected_AIMS
    , intermediaries.[ReportStream] AS connected_ReportStream
    , intermediaries.[HIE**] AS connected_HIE
    , CASE WHEN intermediaries.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS intermediaries_reported
    , mortality_fhir.[Status] AS mortality_data_using_fhir
    , CASE WHEN mortality_fhir.Jurisdiction IS NOT NULL THEN 1 ELSE 0 END AS mortality_fhir_reported
    , pha_eicr.[processing] AS ecr_processing_surveillance_systems
    , CASE WHEN pha_eicr.[Jurisdiction (AB)] IS NOT NULL THEN 1 ELSE 0 END AS ecr_processing_surveillance_systems_reported
    , ecr_hospitals.[# CAH] AS num_CAH_in_state
    , ecr_hospitals.[# CAH using eCR] AS num_CAH_in_state_w_ecr
    , ROUND(ecr_hospitals.[% CAH using eCR]*100, 2) AS pct_CAH_in_state_w_ecr
    , CASE WHEN ecr_hospitals.[State] IS NOT NULL THEN 1 ELSE 0 END AS ecr_hospitals_reported
    , ROUND(ecr_reportable_conditions.[% Conditions Receiving*]*100, 2) AS ecr_reportable_conditions_pct
    , CASE WHEN ecr_reportable_conditions.[Jurisdiction] IS NOT NULL THEN 1 ELSE 0 END AS ecr_reportable_conditions_reported
    , ecr_condition_specific_elements.[Processing] AS ecr_condition_specific_elements_status
    , CASE WHEN ecr_condition_specific_elements.[Jurisdiction (AB)] IS NOT NULL THEN 1 ELSE 0 END AS ecr_condition_specific_elements_reported
    , core_dua.[core_dua_status]
    , CASE WHEN core_dua.[Jurisdiction_Abbreviation] IS NOT NULL THEN 1 ELSE 0 END AS core_dua_reported
    , automated_hospital_capacity.[automated_hospital_capacity_daily_feed_status]
    , CASE WHEN automated_hospital_capacity.[Jurisdiction_Abbreviation] IS NOT NULL THEN 1 ELSE 0 END AS automated_hospital_capacity_reported
FROM [infohub].[jurisdiction_lookup] AS lookup
    FULL OUTER JOIN [infohub].[LDX ETOR] AS etor 
        ON lookup.[Jurisdiction_Abbreviation] = etor.Jurisdiction
    FULL OUTER JOIN [infohub].[LDX Intermediaries] AS intermediaries 
        ON lookup.[Jurisdiction_Abbreviation] = intermediaries.Jurisdiction
    FULL OUTER JOIN [infohub].[Mortality FHIR] AS mortality_fhir 
        ON lookup.[Jurisdiction_Abbreviation] = mortality_fhir.Jurisdiction
    FULL OUTER JOIN [infohub].[PHA eICR] AS pha_eicr 
        ON lookup.[Jurisdiction_Abbreviation] = pha_eicr.[Jurisdiction (AB)]
    FULL OUTER JOIN [infohub].[eCR Hospitals] AS ecr_hospitals 
        ON lookup.[Jurisdiction_Abbreviation] = ecr_hospitals.[State]
    FULL OUTER JOIN [infohub].[eCR_Reportable_Conditions] as ecr_reportable_conditions
        ON lookup.[Jurisdiction_Abbreviation] = ecr_reportable_conditions.[Jurisdiction]
    FULL OUTER JOIN [infohub].[eCR_Condition_Specific_Elements] AS ecr_condition_specific_elements
        ON lookup.[Jurisdiction_Abbreviation] = ecr_condition_specific_elements.[Jurisdiction (AB)]
    FULL OUTER JOIN [infohub].[core_dua] AS core_dua
        ON lookup.[Jurisdiction_Abbreviation] = core_dua.[Jurisdiction_Abbreviation]
    FULL OUTER JOIN [infohub].[automated_hospital_capacity] AS automated_hospital_capacity
        ON lookup.[Jurisdiction_Abbreviation] = automated_hospital_capacity.[Jurisdiction_Abbreviation]
;
-- need a DQ check that [Jurisdiction] is never null
