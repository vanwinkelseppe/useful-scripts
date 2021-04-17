SELECT OBJECT_NAME(s.[object_id]) TableOrViewName, i.name IndexName, user_seeks, user_scans, user_lookups, user_updates, i.type_desc, i.is_primary_key, i.is_unique
FROM sys.dm_db_index_usage_stats s
  INNER JOIN sys.indexes i
  ON s.[object_id] = i.[object_id] AND s.index_id = i.index_id
  INNER JOIN sys.objects o
  ON o.[object_id] = i.[object_id]
WHERE --i.name IS NOT NULL -- Ignore HEAP indexes.
OBJECTPROPERTY(s.[object_id], 'IsMsShipped') = 0 --Ignore system objects
  AND OBJECT_NAME(s.[object_id]) = 'DM_OBJECT_FILE' -- supply the table name (if your database is in a case sensitive collation you must supply the objectname in correct case
  AND SCHEMA_NAME(o.[schema_id]) = 'dbo' -- supply the schema you would like to filter on
  AND s.database_id = DB_ID()
--AND user_seeks = 0 AND user_scans = 0  AND user_lookups = 0
--AND user_updates > 0
ORDER BY 1, 2 DESC