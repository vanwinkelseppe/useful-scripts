SELECT
       f.name AS foreign_key_name
       , OBJECT_NAME(f.parent_object_id) AS table_name
       , COL_NAME(fc.parent_object_id, fc.parent_column_id) AS constraint_column_name
       , OBJECT_NAME (f.referenced_object_id) AS referenced_object
       , COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS referenced_column_name
       , f.is_not_trusted
FROM
       sys.foreign_keys AS f
       INNER JOIN sys.foreign_key_columns AS fc
       ON f.object_id = fc.constraint_object_id
WHERE
       is_not_trusted = 1


       --to repair ALTER TABLE MyTableName WITH CHECK CHECK CONSTRAINT MyConstraintName;
