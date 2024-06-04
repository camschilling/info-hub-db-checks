
/* 
This script evaluates a stated set of columns for the following tables:
Course Completion Fact
Course Dimension
eCR Hospitals
EDC
GeneralStaff
LDX ETOR
LDX Intermediaries
Mortality FHIR
NNDSS GenV2
Pathways Count
PHA eICR
ProjectCount
Surveys (only 1 column)

Notably, the PHDS Overall Table is not included
*/



WITH
    columns
    AS
    (
        -- PHDS Overall Columns Not Included
        -- EDC
            SELECT 'infohub' AS object_space, 'EDC' AS dat_name , 'Domain Name' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'EDC' AS dat_name , 'Program' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'EDC' AS dat_name , 'Object Type' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'EDC' AS dat_name , 'Object Count' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'EDC' AS dat_name , 'Required Fields' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'EDC' AS dat_name , 'Required Fields Curated' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'EDC' AS dat_name , 'Curation Percentage' AS expected_col
        -- Mortality FHIR
        UNION ALL
            SELECT 'infohub' AS object_space, 'Mortality FHIR' AS dat_name, 'Jurisdiction' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Mortality FHIR' AS dat_name, 'Status' AS expected_col
        -- LDX Intermediaries
        UNION ALL
            SELECT 'infohub' AS object_space, 'LDX Intermediaries' AS dat_name, 'Jurisdiction' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'LDX Intermediaries' AS dat_name, 'AIMS' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'LDX Intermediaries' AS dat_name, 'ReportStream' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'LDX Intermediaries' AS dat_name, 'HIE**' AS expected_col
        -- ProjectCount
        UNION ALL
            SELECT 'infohub' AS object_space, 'ProjectCount' AS dat_name, 'Center' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'ProjectCount' AS dat_name, 'Division' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'ProjectCount' AS dat_name, 'ProjectCreatedDate' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'ProjectCount' AS dat_name, 'ProjectStatus' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'ProjectCount' AS dat_name, 'ProjectCount' AS expected_col
        -- LDX ETOR
        UNION ALL
            SELECT 'infohub' AS object_space, 'LDX ETOR' AS dat_name, 'Jurisdiction' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'LDX ETOR' AS dat_name, 'SPHL has implemented ETOR July 2023' AS expected_col
        -- Surveys (limited to one known field of interest columns)
        UNION ALL
            SELECT 'infohub' AS object_space, 'Surveys' AS dat_name, 'Survey' AS expected_col
        -- PHA eICR
        UNION ALL
            SELECT 'infohub' AS object_space, 'PHA eICR' AS dat_name, 'Jurisdiction (AB)' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'PHA eICR' AS dat_name, 'Jurisdiction' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'PHA eICR' AS dat_name, 'Processing' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'PHA eICR' AS dat_name, 'Jurisdiction Type' AS expected_col
        -- NNDSS GenV2
        UNION ALL
            SELECT 'infohub' AS object_space, 'NNDSS GenV2' AS dat_name, 'Jurisdiction' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'NNDSS GenV2' AS dat_name, 'MMG_Implementation' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'NNDSS GenV2' AS dat_name, 'GenV2_Content' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'NNDSS GenV2' AS dat_name, 'GenV2_New_Condition' AS expected_col
        -- eCR Hosptials
        UNION ALL
            SELECT 'infohub' AS object_space, 'eCR Hospitals' AS dat_name, 'State' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'eCR Hospitals' AS dat_name, '# of Hospitals' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'eCR Hospitals' AS dat_name, '# Hospitals using eCR' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'eCR Hospitals' AS dat_name, '% Hospitals using eCR' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'eCR Hospitals' AS dat_name, '# CAH' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'eCR Hospitals' AS dat_name, '# CAH using eCR' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'eCR Hospitals' AS dat_name, '% CAH using eCR' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'eCR Hospitals' AS dat_name, '# of CMS Hospitals' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'eCR Hospitals' AS dat_name, '# CMS Hospitals using eCR' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'eCR Hospitals' AS dat_name, '% CMS Hospitals using eCR' AS expected_col
        -- Pathways Count
        UNION ALL
            SELECT 'infohub' AS object_space, 'Pathways Count' AS dat_name, 'Group Pathways' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Pathways Count' AS dat_name, 'Course Count' AS expected_col
        -- Course Completion Fact
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Completion Fact' AS dat_name, 'User Id' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Completion Fact' AS dat_name, 'CIO Admin Code' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Completion Fact' AS dat_name, 'Admin Code' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Completion Fact' AS dat_name, 'PersonMajorTypeName' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Completion Fact' AS dat_name, 'PersonSubTypeName' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Completion Fact' AS dat_name, 'Course Name' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Completion Fact' AS dat_name, 'Completion Date' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Completion Fact' AS dat_name, 'Course Key' AS expected_col
        --Course Dimension
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Dimension' AS dat_name, 'Course Name' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Dimension' AS dat_name, 'Proficiency Name' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Dimension' AS dat_name, 'Provider Name' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Dimension' AS dat_name, 'Curriculum Name' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Dimension' AS dat_name, 'Pathway Name' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Dimension' AS dat_name, 'Group Pathways' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Dimension' AS dat_name, 'ProficiencSort' AS expected_col
        UNION ALL
            SELECT 'infohub' AS object_space, 'Course Dimension' AS dat_name, 'Course Key' AS expected_col
        -- GeneralStaff
        UNION ALL
            SELECT 'lookupview' AS object_space, 'GeneralStaff' AS dat_name, 'UserID' AS expected_col
        UNION ALL
            SELECT 'lookupview' AS object_space, 'GeneralStaff' AS dat_name, 'FirstName' AS expected_col
        UNION ALL
            SELECT 'lookupview' AS object_space, 'GeneralStaff' AS dat_name, 'MiddleName' AS expected_col
        UNION ALL
            SELECT 'lookupview' AS object_space, 'GeneralStaff' AS dat_name, 'LastName' AS expected_col
        UNION ALL
            SELECT 'lookupview' AS object_space, 'GeneralStaff' AS dat_name, 'CIOAdminShortDescription' AS expected_col
    )
,
    columns_evaluated
    AS
    (
        SELECT c.* 
    , CASE WHEN i.COLUMN_NAME IS NOT NULL THEN 1 ELSE 0 END AS column_exists
        FROM columns AS c
            LEFT JOIN INFORMATION_SCHEMA.COLUMNS AS i
            ON c.object_space = i.TABLE_SCHEMA
                AND c.dat_name = i.TABLE_NAME
                AND c.expected_col = i.COLUMN_NAME
    )
SELECT object_space, dat_name
, COUNT(1) AS columns_evaluated
, SUM(column_exists) AS columns_found
, CASE WHEN COUNT(1) = SUM(column_exists) THEN 'same' ELSE 'different' END AS columns_summary
FROM columns_evaluated
GROUP BY object_space, dat_name


/*
-- PHDS Overall
UNION ALL
SELECT 'infohub' AS object_space,'PHDS Overall' AS dat_name, '' AS expected_col

Quarter
Percent Hospitals using eCR
Percent CAH using eCR
Percent CMS Hospitals using eCR
Number Jurisdictions Processing eICR
Pipelines Established
Percent Jurisdictions Processing eICR
Percent Intermediaries
ETOR
CDC Infectious Labs
Percent Antibiotic Use
Percent Antibiotic Resistance
NHSN FHIR
NHSN OnPrem
NHSN Hospital Capacity
ED Rate
Biosense Cloud
Biosense Metrics
Data Access Agreement
Commercial Labs
Percent MMG Implemented
Percent Jurisdictions GenV2 Content
Percent Jurisdictions GenV2 Content New Condition
NNDSS DataViz
NNDSS Generic Feed
Reusable Technologies
QHIN TEFCA
ORR Data Dissemination
Standard Language Core Data Sources
Data Elements Public Health Response
Number Jurisdictions Mortality FHIR
Number Mortality FHIR Production
Number Mortality FHIR Certified
Number Mortality FHIR Pre-Certified
Percent Jurisdictions Mortality FHIR
*/
