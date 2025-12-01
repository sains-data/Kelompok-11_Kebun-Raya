--Database Roles
USE KebunRaya_DWH;
GO

CREATE ROLE db_executive;
CREATE ROLE db_analyst;
CREATE ROLE db_viewer;
CREATE ROLE db_etl_operator;
GO

--Grant Permissions
-- Executive: full read + bisa jalanin ETL
GRANT SELECT ON SCHEMA::dbo TO db_executive;
GRANT EXECUTE ON dbo.usp_Master_ETL TO db_executive;

-- Analyst: punya edit di staging + read semua fact & dim
GRANT SELECT ON SCHEMA::dbo TO db_analyst;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::stg TO db_analyst;

-- Viewer: hanya laporan (read only)
GRANT SELECT ON SCHEMA::dbo TO db_viewer;

-- ETL operator (kalau ETL otomatis dipakai)
GRANT EXECUTE ON SCHEMA::dbo TO db_etl_operator;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::stg TO db_etl_operator;
GO


--Login + User assignment
CREATE LOGIN executive_user WITH PASSWORD = 'StrongPass123!';
CREATE LOGIN analyst_user WITH PASSWORD = 'StrongPass123!';
CREATE LOGIN viewer_user WITH PASSWORD = 'StrongPass123!';
CREATE LOGIN etl_service WITH PASSWORD = 'StrongPass123!';
GO

CREATE USER executive_user FOR LOGIN executive_user;
CREATE USER analyst_user FOR LOGIN analyst_user;
CREATE USER viewer_user FOR LOGIN viewer_user;
CREATE USER etl_service FOR LOGIN etl_service;
GO

ALTER ROLE db_executive ADD MEMBER executive_user;
ALTER ROLE db_analyst ADD MEMBER analyst_user;
ALTER ROLE db_viewer ADD MEMBER viewer_user;
ALTER ROLE db_etl_operator ADD MEMBER etl_service;
GO
