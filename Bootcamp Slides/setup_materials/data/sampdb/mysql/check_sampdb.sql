SELECT 
    TABLE_NAME,
    TABLE_ROWS
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE
    TABLE_SCHEMA = 'sampdb'
