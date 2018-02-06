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


/* Test Data
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('fgf'	,	'2'	,	'linkedin'	,	'2018-01-02');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('sdgsd'	,	'3'	,	'twitter'	,	'2018-01-03');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('assfsd'	,	'4'	,	'facebook'	,	'2018-01-04');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('adfd'	,	'5'	,	'linkedin'	,	'2018-01-05');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('sss'	,	'6'	,	'twitter'	,	'2018-01-06');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('ity'	,	'7'	,	'linkedin'	,	'2018-01-07');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('hghg'	,	'8'	,	'facebook'	,	'2018-01-08');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('kur'	,	'9'	,	'facebook'	,	'2018-01-09');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('r'	,	'10'	,	'linkedin'	,	'2018-01-10');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('uw'	,	'11'	,	'twitter'	,	'2018-01-11');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('wert'	,	'12'	,	'linkedin'	,	'2018-01-12');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('t'	,	'13'	,	'facebook'	,	'2018-01-13');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('kyi'	,	'14'	,	'twitter'	,	'2018-01-14');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('fgg'	,	'15'	,	'facebook'	,	'2018-01-15');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('yu'	,	'16'	,	'facebook'	,	'2018-01-16');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('e'	,	'17'	,	'facebook'	,	'2018-01-17');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('ty'	,	'18'	,	'linkedin'	,	'2018-01-18');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('oiu'	,	'19'	,	'twitter'	,	'2018-01-19');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('oiu'	,	'20'	,	'linkedin'	,	'2018-01-20');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('sdgsd'	,	'21'	,	'facebook'	,	'2018-01-21');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('uri'	,	'22'	,	'linkedin'	,	'2018-01-22');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('ity'	,	'23'	,	'twitter'	,	'2018-01-23');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('lip'	,	'24'	,	'linkedin'	,	'2018-01-24');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('abd'	,	'25'	,	'facebook'	,	'2018-01-25');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('tywer'	,	'26'	,	'twitter'	,	'2018-01-26');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('ghty'	,	'27'	,	'twitter'	,	'2018-01-27');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('hh'	,	'28'	,	'linkedin'	,	'2018-01-28');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('ter'	,	'29'	,	'facebook'	,	'2018-01-29');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('fsar'	,	'30'	,	'linkedin'	,	'2018-01-30');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('u'	,	'31'	,	'facebook'	,	'2018-01-31');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('taq'	,	'32'	,	'linkedin'	,	'2018-02-01');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('er'	,	'33'	,	'twitter'	,	'2018-02-02');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('WR'	,	'34'	,	'linkedin'	,	'2018-02-03');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('jliluy'	,'35'	,	'facebook'	,	'2018-02-04');
INSERT dbo.shares (LettergroupID,SiteID,ServiceName,ShareTime)VALUES('dfsdf'	,	'36'	,	'twitter'	,	'2018-02-05');
*/
