/*
This file checks for the presence of various views in the dev space.
It will throw an error if expected views are missing.
*/


CREATE TABLE infohub.#view_inventory 
WITH
(CLUSTERED COLUMNSTORE INDEX, 
DISTRIBUTION = HASH
([object_name])
)
AS
WITH
    view_list
    AS
    
    (
                                    SELECT 'Course Dimension' AS object_name
        UNION ALL
            SELECT 'Course Completion Fact' AS object_name
        UNION ALL
            SELECT 'Pathways Count' AS object_name
        UNION ALL
            SELECT 'GeneralStaff' AS object_name
    )
,
    view_summary
    AS

    (
        SELECT v.*,
            CASE WHEN s.name IS NOT NULL THEN 0 ELSE 1 END AS view_error
        FROM view_list AS v
            LEFT JOIN sys.views AS s
            ON v.object_name = s.name
    )
SELECT *
FROM view_summary;

SELECT *
FROM infohub.#view_inventory;


IF (EXISTS (SELECT *
FROM infohub.#view_inventory
WHERE view_error > 0 ))
BEGIN
    RAISERROR ('Not all expected views are present!', 1, 1)
END
;


DROP TABLE infohub.#view_inventory;