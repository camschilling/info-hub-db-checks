SELECT i.*
    , s.create_date
    , s.modify_date
FROM INFORMATION_SCHEMA.TABLES AS i
LEFT JOIN sys.tables AS s
ON i.TABLE_NAME = s.name
WHERE i.TABLE_SCHEMA = 'infohub'
ORDER BY s.modify_date DESC