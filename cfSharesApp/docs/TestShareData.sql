--- 2/5/2018 ---
Use TestShareData;
Go

DROP TABLE dbo.shares;

Create table dbo.shares(
	ID int IDENTITY(1,1) PRIMARY KEY,
	SiteID VARCHAR(255),
	LettergroupID VARCHAR(255),
	ServiceName VARCHAR(255),
	ShareTime DATETIME
	);

---Test---
INSERT dbo.shares (SiteID, LettergroupID, ServiceName, ShareTime)
VALUES ('abc','1','facebook','2018-02-05T18:53:42.894Z');

ALTER TABLE dbo.shares ADD FrameParent VARCHAR(255);
GO
