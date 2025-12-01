CREATE TABLE AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EventTime DATETIME2 DEFAULT SYSDATETIME(),
    UserName NVARCHAR(128) DEFAULT SUSER_SNAME(),
    EventType NVARCHAR(20),
    TableName NVARCHAR(128),
    RowsAffected INT
);
GO

--Trigger contoh:
CREATE TRIGGER trg_Audit_Fact_Kunjungan
ON Fact_Kunjungan
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @EventType VARCHAR(20) =
        CASE WHEN EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) THEN 'UPDATE'
             WHEN EXISTS(SELECT * FROM inserted) THEN 'INSERT'
             ELSE 'DELETE'
        END;

    INSERT INTO AuditLog(EventType, TableName, RowsAffected)
    SELECT @EventType, 'Fact_Kunjungan', @@ROWCOUNT;
END;
GO
