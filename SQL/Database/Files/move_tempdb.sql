USE master;  
GO
ALTER DATABASE tempdb   
MODIFY FILE (NAME = tempdev, FILENAME = 'new_path\os_file_name.mdf');  
GO
ALTER DATABASE tempdb   
MODIFY FILE (NAME = templog, FILENAME = 'new_path\os_file_name.ldf');  
GO  
-------------
-- RESTART --
-------------