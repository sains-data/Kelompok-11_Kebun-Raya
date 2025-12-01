ALTER TABLE Dim_Pengunjung
ALTER COLUMN nama ADD MASKED WITH (FUNCTION = 'partial(1,"XXXXXX",1)');

ALTER TABLE Dim_Pengunjung
ALTER COLUMN asal ADD MASKED WITH (FUNCTION = 'default()');

--Untuk role yang boleh lihat data asli:
GRANT UNMASK TO db_executive;
