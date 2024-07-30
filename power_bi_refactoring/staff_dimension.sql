

/*
The following reproduces the Staff Dimension power query object

Existing code is as follows:
--------------------------------------
Power Query:
[CIO Admin Codes]:

let
    Source = Sql.Database(#"Server Parameter", "EDAV"),
    lookupview_GeneralStaff = Source{[Schema="lookupview",Item="GeneralStaff"]}[Data],
    -- cam: The code below is not entirely clear on the methodology here. Multiple `AdminCodeHierarchy` exist per `AdminCode` until you filter to rows with [RecordStatus] = ''
    #"Removed Other Columns" = Table.SelectColumns(lookupview_GeneralStaff,{"AdminCodeHierarchy", "AdminCode"}), 
    -- cam: The code below removes a random `AdminCodeHierarchy` (depending on sort order). Filtering in above step will resolve.
    #"Removed Duplicates" = Table.Distinct(#"Removed Other Columns", {"AdminCode"}),
    -- cam: This "added Custom" table does not seem to be used anywhere
    #"Added Custom" = Table.AddColumn(#"Removed Duplicates", "CIO", each 
        if Text.Contains([AdminCodeHierarchy], "\NIOSH") then "NIOSH" else 
        if Text.Contains([AdminCodeHierarchy], "\NCIPC") then "NCIPC" else 
        if Text.Contains([AdminCodeHierarchy], "\NCBDDD") then "NCBDDD" else 
        if Text.Contains([AdminCodeHierarchy], "\NCEZID") then "NCEZID" else 
        if Text.Contains([AdminCodeHierarchy], "\NCIRD") then "NCIRD" else 
        if Text.Contains([AdminCodeHierarchy], "\OCOO") then "OCOO" else 
        if Text.Contains([AdminCodeHierarchy], "\CGH") then "GHC" else 
        if Text.Contains([AdminCodeHierarchy], "\ORR") then "ORR" else 
        if Text.Contains([AdminCodeHierarchy], "\ATSDR") then "ATSDR" else 
        if Text.Contains([AdminCodeHierarchy], "\NCEH") then "NCEH" else 
        if Text.Contains([AdminCodeHierarchy], "\NCHHSTP") then "NCHHSTP" else 
        if Text.Contains([AdminCodeHierarchy], "\NCCDPHP") then "NCCDPHP" else 
        if Text.Contains([AdminCodeHierarchy], "\NCID") then "NCID" else 
        if Text.Contains([AdminCodeHierarchy], "\NCPHI") then "NCPHI" else 
        if Text.Contains([AdminCodeHierarchy], "\NCPDCID") then "NCPDCID" else 
        if Text.Contains([AdminCodeHierarchy], "\NCHS") then "NCHS" else null),
    #"Filtered Rows" = #"Removed Duplicates",
    #"Extracted Text Between Delimiters" = Table.TransformColumns(#"Filtered Rows", {{"AdminCodeHierarchy", each Text.BetweenDelimiters(_, "\", "\", 1, 0), type text}}),
    #"Renamed Columns" = Table.RenameColumns(#"Extracted Text Between Delimiters",{{"AdminCodeHierarchy", "CIO"}})
in
    #"Renamed Columns"
--------------------------------

[Staff Dimension]:

let
    Source = Sql.Database(#"Server Parameter", "EDAV"),
    lookupview_GeneralStaff = Source{[Schema="lookupview",Item="GeneralStaff"]}[Data],
    #"Filtered Rows" = Table.SelectRows(lookupview_GeneralStaff, each ([RecordStatusCode] = "")),
    #"Merged Queries" = Table.NestedJoin(#"Filtered Rows", {"AdminCode"}, #"CIO Admin Codes", {"AdminCode"}, "CIO Admin Codes", JoinKind.LeftOuter),
    #"Removed Duplicates" = Table.Distinct(#"Merged Queries", {"UserId"}),
    #"Expanded CIO Admin Codes" = Table.ExpandTableColumn(#"Removed Duplicates", "CIO Admin Codes", {"CIO"}, {"CIO"})
in
    #"Expanded CIO Admin Codes"

Accompanied data assertion found in: dev_server_checks\lookupview_generalstaff_checks.sql
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('infohub.staff_dimension', 'V') IS NOT NULL
    DROP VIEW [infohub].[staff_dimension]
GO

CREATE VIEW [infohub].[staff_dimension] 
AS
WITH valid_general_staff_records AS(
    SELECT * FROM [lookupview].[GeneralStaff]
    WHERE [RecordStatusCode] = ''
)
, active_admin_codes AS(
    SELECT [AdminCode], [OrganizationHierarchy], [CIOShortName], [ParentOrganizationShortName], [CoordinatingCenterShortName],
    CASE WHEN [CIOShortName] = 'N/A' OR [CIOShortName] IS NULL THEN [CoordinatingCenterShortName] ELSE [CIOSHortName] END AS [CIO]
    FROM [lookupview].[AdminCodes]
    WHERE [AdminCodeActivityStatus] = 'Active'
)
, joined AS(
    SELECT g.[UserID], g.[LastName], g.[FirstName], g.[MiddleName], a.[CIO]
    FROM valid_general_staff_records AS g
    LEFT JOIN active_admin_codes AS a
    ON g.[AdminCode] = a.[AdminCode]
)
SELECT DISTINCT [UserID], [LastName], [FirstName], [MiddleName], [CIO] 
FROM joined;





/*
If the big mapping is needed in future, here is sql syntax:
    CASE 
        WHEN CHARINDEX('\NIOSH', AdminCodeHierarchy) > 0 THEN 'NIOSH'
        WHEN CHARINDEX('\NCIPC', AdminCodeHierarchy) > 0 THEN 'NCIPC'
        WHEN CHARINDEX('\NCBDDD', AdminCodeHierarchy) > 0 THEN 'NCBDDD'
        WHEN CHARINDEX('\NCEZID', AdminCodeHierarchy) > 0 THEN 'NCEZID'
        WHEN CHARINDEX('\NCIRD', AdminCodeHierarchy) > 0 THEN 'NCIRD'
        WHEN CHARINDEX('\OCOO', AdminCodeHierarchy) > 0 THEN 'OCOO'
        WHEN CHARINDEX('\CGH', AdminCodeHierarchy) > 0 THEN 'GHC'
        WHEN CHARINDEX('\ORR', AdminCodeHierarchy) > 0 THEN 'ORR'
        WHEN CHARINDEX('\ATSDR', AdminCodeHierarchy) > 0 THEN 'ATSDR'
        WHEN CHARINDEX('\NCEH', AdminCodeHierarchy) > 0 THEN 'NCEH'
        WHEN CHARINDEX('\NCHHSTP', AdminCodeHierarchy) > 0 THEN 'NCHHSTP'
        WHEN CHARINDEX('\NCCDPHP', AdminCodeHierarchy) > 0 THEN 'NCCDPHP'
        WHEN CHARINDEX('\NCID', AdminCodeHierarchy) > 0 THEN 'NCID'
        WHEN CHARINDEX('\NCPHI', AdminCodeHierarchy) > 0 THEN 'NCPHI'
        WHEN CHARINDEX('\NCPDCID', AdminCodeHierarchy) > 0 THEN 'NCPDCID'
        WHEN CHARINDEX('\NCHS', AdminCodeHierarchy) > 0 THEN 'NCHS' 
    END AS CIO_custom -- confirm this column is not actually needed
*/

