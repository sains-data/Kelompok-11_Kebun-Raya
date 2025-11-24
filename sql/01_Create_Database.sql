USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'KebunRaya_DWH')
BEGIN
    CREATE DATABASE KebunRaya_DWH;
END
GO

USE KebunRaya_DWH;
GO
