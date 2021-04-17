SELECT OBJECT_NAME(c.object_id) AS [Table], c.name, t.name
FROM sys.columns c
  INNER JOIN sys.types t
  ON t.user_type_id = c.user_type_id
  INNER JOIN sys.objects o
  ON o.object_id = c.object_id
WHERE t.user_type_id IN (231, 167) AND c.max_length = -1 AND o.is_ms_shipped = 0 AND o.type = 'U'