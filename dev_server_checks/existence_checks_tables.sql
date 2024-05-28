/*
This file checks for the presence of various tables in the dev space.
It will throw an error if expected tables are missing.
*/


CREATE TABLE infohub.#table_inventory 
WITH
(CLUSTERED COLUMNSTORE INDEX, 
DISTRIBUTION = HASH
([object_name])
)
AS

WITH
    table_list
    AS

    (
            SELECT 'infohub' AS object_space, 'EDC' AS object_name
        UNION ALL
            SELECT 'infohub' AS object_space, 'Mortality FHIR' AS object_name
        UNION ALL
            SELECT 'infohub' AS object_space, 'LDX Intermediaries' AS object_name
        UNION ALL
            SELECT 'infohub' AS object_space, 'ProjectCount' AS object_name
        UNION ALL
            SELECT 'infohub' AS object_space, 'LDX ETOR' AS object_name
        UNION ALL
            SELECT 'infohub' AS object_space, 'Surveys' AS object_name
        UNION ALL
            SELECT 'infohub' AS object_space, 'PHA eICR' AS object_name
        UNION ALL
            SELECT 'infohub' AS object_space, 'PHDS Overall' AS object_name
        UNION ALL
            SELECT 'infohub' AS object_space, 'NNDSS GenV2' AS object_name
    )
,
    table_summary
    AS

    (
        SELECT t.*,
            CASE WHEN i.TABLE_NAME IS NOT NULL THEN 0 ELSE 1 END AS table_error
        FROM table_list AS t
            LEFT JOIN INFORMATION_SCHEMA.TABLES AS i
            ON t.object_space = i.TABLE_SCHEMA
                AND t.object_name = i.TABLE_NAME
    )
SELECT *
FROM table_summary;


SELECT *
FROM infohub.#table_inventory;


IF (EXISTS (SELECT *
FROM infohub.#table_inventory
WHERE table_error > 0 ))
BEGIN
    RAISERROR ('Not all expected tables are present!', 1, 1)
END
;


DROP TABLE infohub.#table_inventory;
GO