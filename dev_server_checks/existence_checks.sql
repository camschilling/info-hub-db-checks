/*
This file checks for the presence of various tables in the dev space.
*/


IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'infohub' 
                 AND  TABLE_NAME = 'EDC'))
BEGIN
    SELECT 'EDC Exists' AS msg
END


IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'infohub' 
                 AND  TABLE_NAME = 'AppTest'))
BEGIN
    SELECT 'AppTest Exists' AS msg
END
