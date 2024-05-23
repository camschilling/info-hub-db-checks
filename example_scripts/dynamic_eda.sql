/* Variable Declaration */
DECLARE @CountQuery AS NVARCHAR(500)
DECLARE @ViewQuery AS NVARCHAR(500)
DECLARE @TableName AS NVARCHAR(100)
DECLARE @TableSchema AS NVARCHAR(100)

/* set the parameter value */
SET @TableName =  '[GeneralStaff]'
SET @TableSchema = '[lookupview]'

/* Build queries */
SET @CountQuery = 'SELECT COUNT(*) FROM ' + @TableSchema + '.' + @TableName + ' AS count'
SET @ViewQuery = 'SELECT TOP 20 * FROM ' + @TableSchema + '.' + @TableName


/* Execute Transact-SQL String */
EXECUTE(@CountQuery)
EXECUTE(@ViewQuery)