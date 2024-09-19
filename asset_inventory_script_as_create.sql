/*
On 9/19/24, the info hub team received a message that the table [socrata].[Asset_Inventory_Detail] was being deprecated by the data owners.
There is no known history of the generation of this table.
The script below is what was produced using the `scrapt as create` function on [infohub].[Asset_Inventory]
Data owners indicated that we should point to [edavmetrics].[SocrataAssets] if desired in the future. 
This table exists in both dev and prod. 
EDAV likely can allow access to those metrics.
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [infohub].[Asset_Inventory]
AS SELECT [UID]
      ,[Name]
      ,[Description]
      ,[Owner]
      ,[Owner_UID]
      ,[Publication_Stage]
      ,[Audience]
      ,[Approval_Status]
      ,[Provenance]
      ,[Type]
      ,[Category]
      ,[Tags]
      ,[url]
      ,[API_Endpoint]
      ,[Creation_DT_UTC]
      ,[Last_Metadata_Updated_DT_UTC]
      ,[Last_Data_Updated_DT_UTC]
      ,[Domain]
      ,[Derived_View]
      ,[Visits]
      ,[Downloads]
      ,[Row_Label]
      ,[Row_Count]
      ,[Column_Count]
      ,[Contact_Email]
      ,[License]
      ,[Attribution]
      ,[Attribution_Link]
      ,[Published_Version_Name]
      ,[Published_Version_UID]
      ,[Parent_UID]
      ,[Common_Core_Is_Quality_Data]
      ,[Common_Core_Publisher]
      ,[Common_Core_Temporal_Applicability]
      ,[Common_Core_Contact_Name]
      ,[Common_Core_Language]
      ,[Common_Core_Contact_Email]
      ,[Common_Core_System_of_Records]
      ,[Common_Core_License]
      ,[Common_Core_Issued]
      ,[Common_Core_Footnotes]
      ,[Common_Core_References]
      ,[Common_Core_Primary_IT_Investment_UII]
      ,[Common_Core_Public_Access_Level]
      ,[Common_Core_Bureau_Code]
      ,[Common_Core_Described_By]
      ,[Common_Core_UpDT_Frequency]
      ,[Common_Core_Program_Code]
      ,[Common_Core_Homepage]
      ,[Common_Core_Access_Level_Comment]
      ,[Common_Core_test]
      ,[Common_Core_Geographic_Coverage]
      ,[Department_Metrics_Publishing_Department]
      ,[Common_Core_Theme]
      ,[Common_Core_Suggested_Citation]
      ,[Data_Quality_UpDT_Frequency]
      ,[Data_Quality_Geospatial_Resolution]
      ,[Data_Quality_Temporal_Applicability]
      ,[Data_Quality_Geographic_Coverage]
      ,[Data_Quality_Described_By]
      ,[Data_Quality_Analytical_Methods_Reference]
      ,[Data_Quality_Suggested_Citation]
      ,[Data_Quality_Footnotes]
      ,[Common_Core_Data_Standard]
      ,[Common_Core_Collection]
      ,[Data_Quality_Geographic_Unit_of_Analysis]
      ,[Internal_Administration_Center_Institute_or_Office]
      ,[Internal_Administration_Metadata_Steward]
	  , CASE
			WHEN [Common_Core_Program_Code] = '009:028' 
				THEN 'NCEZID'
			WHEN [Common_Core_Program_Code] = '009:030' 
				THEN 'NCBDDD'
			WHEN [Common_Core_Program_Code] = '009:036' 
				THEN 'GHC'
			WHEN [Common_Core_Program_Code] = '009:038' 
				THEN 'GHC'
			WHEN [Attribution] LIKE '%National Center for% Disease Prevention and Health Promotion%' 
				THEN 'NCCDPHP'
			WHEN [Attribution] LIKE '%Division for Heart Disease and Stroke Prevention%' 
				THEN 'NCCDPHP' 
			WHEN [Attribution] LIKE '%Division of Population Health%' 
				THEN 'NCCDPHP'
			WHEN [Attribution] LIKE '%National Center for Injury Prevention and Control%' 
				THEN 'NCCDPHP'
			WHEN [Attribution] LIKE '%National Environmental Public Health Tracking Network%' 
				THEN 'NCEH'
			WHEN [Attribution] LIKE '%Stephen B. Thacker%' 
				THEN 'OS'
			WHEN [Attribution] LIKE '%Division of Reproductive Health%' 
				THEN 'NCCDPHP'
			WHEN [Attribution] LIKE '%National Center for Health Statistics%' 
				THEN 'NCHS'
			WHEN [Attribution] LIKE '%Office for State, Tribal, Local and Territorial Support%' 
				THEN 'NCSTLTPHIW'
			WHEN [Attribution] LIKE '%Division of Adolescent School Health%' 
				THEN 'NCHHSTP'
			WHEN [Attribution] LIKE '%NCHS%' 
				THEN 'NCHS'
			WHEN [Attribution] LIKE '%Division of Health Informatics and Surveillance%' 
				THEN 'OPHDST'
			WHEN [Attribution] LIKE '%Division of Diabetes Translation%' 
				THEN 'NCCDPHP'
			WHEN [Attribution] LIKE '%National Center for Immunization and Respiratory Diseases%' 
				THEN 'NCIRD'
			WHEN [Attribution] LIKE '%SSEV Bioinformatics%' 
				THEN 'NCIRD'
			WHEN [Attribution] LIKE '%Behavioral Risk Factor Surveillance System%' 
				THEN 'NCIPC'
			WHEN [Attribution] LIKE '%Office of Smoking and Health%' 
				THEN 'NCCDPHP'
			WHEN [Attribution] LIKE '%Division of Foodborne, Waterborne, and Environmental Diseases%' 
				THEN 'NCEZID'
			WHEN [Attribution] LIKE '%Division of Foodborne, Waterborne, and Environmental Diseases%' 
				THEN 'NCEZID'
			WHEN [Attribution] LIKE '%National Wastewater Surveillance System%'
				THEN 'NCEZID'
			WHEN [Attribution] LIKE '%Kassinger%'
				THEN 'NCEH'
			WHEN [Attribution] LIKE '%COVID-19%'
				THEN 'NCIRD'
			WHEN [Attribution] LIKE '%NCIRD%'
				THEN 'NCIRD'
			WHEN [Attribution] LIKE '%National Center on Birth Defects and Developmental Disabilities%'
				THEN 'NCBDDD'
			WHEN [Attribution] LIKE '%Associate Director for Communication%'
				THEN 'OC'
			WHEN [Attribution] LIKE '%ATSDR%'
				THEN 'ATSDR'
			WHEN [Attribution] LIKE '%Community Interventions for Infection Control Unit%'
				THEN 'NCEZID'
			WHEN [Attribution] LIKE '%Division of Adolescent and School Health%'
				THEN 'NCHHSTP'
			WHEN [Attribution] LIKE '%Division of Global HIV%'
				THEN 'GHC'
			WHEN [Attribution] LIKE '%Malaria%'
				THEN 'GHC'
			WHEN [Attribution] LIKE '%Environmental Public Health Tracking%'
				THEN 'NCEH'
			WHEN [Attribution] LIKE '%National Institute for Occupational Safety and Health%'
				THEN 'NIOSH'
			WHEN [Attribution] LIKE '%National Outbreak Reporting System%'
				THEN 'NCIRD'
			WHEN [Attribution] LIKE '%NCEH%'
				THEN 'NCEH'
			WHEN [Attribution] LIKE '%RESP-NET%'
				THEN 'NCIRD'
			WHEN [Attribution] LIKE '%PRAMS%'
				THEN 'NCCDPHP'
			WHEN [Attribution_Link] LIKE '%/nchs/%'
				THEN 'NCHS'
			WHEN [Contact_Email] = 'nccdoshinquiries@cdc.gov'
				THEN 'NCCDPHP'
			WHEN [Common_Core_Contact_Name] LIKE '%NCIRD%'
				THEN 'NCIRD'
			WHEN [Common_Core_Contact_Name] LIKE '%National Center for Health Statistics%'
				THEN 'NCEH'
			WHEN [Common_Core_Contact_Name] LIKE '%DDT%'
				THEN 'NCCDPHP'
			WHEN [Common_Core_Contact_Name] LIKE '%DASH%' 
				THEN 'NCHHSTP'
			WHEN [Common_Core_Contact_Name] LIKE '%DPH%'
				THEN 'NCCDPHP'
			WHEN [Common_Core_Contact_Name] LIKE '%PLACES%'
				THEN 'NCCDPHP'
			WHEN [Common_Core_Contact_Name] LIKE '%500 Cities%'
				THEN 'NCCDPHP'
			WHEN [Common_Core_Contact_Name] LIKE '%Oral Health%'
				THEN 'NCCDPHP'
			WHEN [Common_Core_Contact_Name] LIKE '%Surveillance Review %Response Group%'
				THEN 'NCCDPHP'
			WHEN [Common_Core_Contact_Name] LIKE '%Immunization Safety Office%'
				THEN 'NCEZID'
			WHEN [Common_Core_Contact_Name] LIKE '%Virologic Unit, Surveillance and Analytics Team%'
				THEN 'NCIRD'
			WHEN [Common_Core_Contact_Name] LIKE '%National Environmental Assessment Reporting System%'
				THEN 'NCEH'
			WHEN [Common_Core_Contact_Name] LIKE '%Hulkower%'
				THEN 'OS'
			WHEN [Contact_Email] = 'alcohol@cdc.gov'
				THEN 'NCCDPHP'
			WHEN [Contact_Email] = 'ddtpubsmailbox@cdc.gov'
				THEN 'NCCDPHP'
			WHEN [Contact_Email] = 'zoa6@cdc.gov'
				THEN 'OPHDST'
			WHEN [Contact_Email] = 'prw0@cdc.gov'
				THEN 'NCSTLTPHIW'
			WHEN [Owner] LIKE '%NCIRD%'
				THEN 'NCIRD'
			WHEN [Category] LIKE '%Flu Vaccinations%'
				THEN 'NCIRD'
			WHEN [Category] LIKE '%NCHS%'
				THEN 'NCHS'			
			WHEN [Category] = 'Health Statistics'
				THEN 'NCHS'
			WHEN [Category] = 'Vaccines'
				THEN 'NCIRD'
			WHEN [Category] LIKE 'Environmental Health & Toxicology'
				THEN 'NCEH'		
			WHEN [Name] LIKE 'NNDSS%'
				THEN 'OPHDST'
			WHEN [Name] LIKE 'HAICViz%'
				THEN 'NCEZID'
			WHEN [Name] LIKE 'Active Bacterial Core%'
				THEN 'NCIRD'
			WHEN [Name] LIKE 'Active Bacterial Core%'
				THEN 'NCIRD'
			WHEN [Tags] LIKE '%artesunate%'
				THEN 'GHC'
			WHEN [Owner] = 'Michael'
				THEN 'NCEZID'
			WHEN [Owner] = 'HHS ASPA'
				THEN 'HHS'
			ELSE 'Unknown'
			END AS [CIO Original]
			,NULL as [Modified By]
  FROM [socrata].[Asset_Inventory_Detail]
  WHERE [Publication_Stage] = 'published'
  AND	[Approval_Status] = 'approved'
  AND	[Type] IN ('dataset', 'file', 'href', 'story');
GO
