-- ===========================================================
-- Create external data source template for Azure SQL Database
-- ===========================================================

CREATE MASTER KEY 
ENCRYPTION BY PASSWORD='s3rv3r_S3rv3r';

CREATE DATABASE SCOPED CREDENTIAL azurecred  
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'brbdzsShHCoAGGuc3skd8/VyLHiWtKHW5BQ+6qAnC9o4GRJKu05rU9laR1GX98VLTKAzl4eps/7+3azVwhBSww==';

CREATE EXTERNAL DATA SOURCE azure_mba_affinity
WITH 
(
    TYPE = BLOB_STORAGE,
    LOCATION = 'https://curdferguson.blob.core.windows.net/mba-affinity',
    CREDENTIAL = azurecred
);

/* DROP EXTERNAL DATA SOURCE azure_mba_affinity; */
/* DROP DATABASE SCOPED CREDENTIAL azurecred; */