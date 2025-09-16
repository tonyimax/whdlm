----2018-8-31����
-----ÿ�շ������
USE [WHQJNativeWebDB]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--drop table ShareConfig
CREATE TABLE [dbo].[ShareConfig](
	[ID] [int] NOT NULL IDENTITY(1,1),
	[DayShareLmt] [int] NULL,
	[TimeShareGold] [int] NULL,
    [TimeShareDiamond] [int] NULL,
	[Nullity] [int] null,
 CONSTRAINT [PK_T_ShareConfig] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
   insert ShareConfig(DayShareLmt,TimeShareGold,TimeShareDiamond,Nullity) values(1,10,10,0)
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShareLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[LogType] [smallint] NULL,
	[DateID] [int] NULL,
	[TimeShareGold] [int] NULL,
	[TimeShareDiamond] [int] NULL,
	[Remark] [nvarchar](100) NULL,
	[LogTime] [datetime] NULL,
 CONSTRAINT [PK_ShareLog] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ShareLog] ADD  DEFAULT (getdate()) FOR [LogTime]
GO
----------------------
------------------------���а�����ֶ����
alter table [dbo].[RankingConfig] add AwardTicket int not null default(0)
alter table [dbo].[CacheRankAward] add AwardTicket int not null default(0)

-----------
---------�ֻ��󶨶�����֤���
------��Ӱ��ֻ�����
 USE [WHQJAccountsDB]
GO
insert into SystemStatusInfo(StatusName,StatusValue,StatusString,StatusTip,StatusDescription,SortID) values('BindMolibleReward',0,'���ֻ�����','���ֻ�����','��ֵ�����ֻ������ͽ�����',700)
insert into SystemStatusInfo(StatusName,StatusValue,StatusString,StatusTip,StatusDescription,SortID) values('MolibleNum',0,'��ȡ��֤�����ƴ���','��֤������','��ֵ����ȡ��֤�����ƴ���,0������',701)
go
------������֤��Ϣ��
create table SMSInfo
 (
    id int PRIMARY key identity,
	Userid int,
	Mobile nvarchar(20),
	Code   nvarchar(10),
	date  datetime
 )
 go
 create table SMSLog
 (
    id int PRIMARY key identity,
	Mobile nvarchar(20),
	date  datetime
 )
 go
 ----------
 ----------�һ�����
------��Ӷһ����Ŀ���
insert into SystemStatusInfo(StatusName,StatusValue,StatusString,StatusTip,StatusDescription,SortID) values('IsRedemptionCenter',0,'�ֻ��һ�����','�ֻ��һ�����','��ֵ���ֻ��һ����Ŀ��أ�0-������1�ر�',701)
go
-----------
----------�׳����
INSERT SystemStatusInfo ([StatusName],[StatusValue],[StatusString],[StatusTip],[StatusDescription],[SortID])
VALUES (N'ISFirstType',3,'�׳俪��','�׳俪��','��ֵ��0�رգ�1�����˺��׳壬2����ÿ���׳䣬3�����˺��׳塢����ÿ���׳�',200)
GO
----------------
----------------ǩ�����
INSERT SystemStatusInfo ([StatusName],[StatusValue],[StatusString],[StatusTip],[StatusDescription],[SortID])
VALUES (N'OpenGameSignIn',0,'�Ƿ����ֻ�ǩ��','�ֻ�ǩ��','��ֵ��0-������1-�ر�',15)
go
-------
------------���ӽ�ȯ�ֶ�
use [WHQJTreasureDB]
go
alter table UserCurrency add [AwardTicket] int not null default(0)
go
use [WHQJAccountsDB]
go
---------ϵͳ�����޸�
delete [dbo].[SystemStatusInfo] where StatusName='JJEffectiveFriendGame'
delete [dbo].[SystemStatusInfo] where StatusName='JJBindSpreadPresent'
update [SystemStatusInfo] set StatusDescription='��ֵ��0-�ޣ�1-΢�Źٷ���2-֧�����ٷ���3-΢�ź�֧�����ٷ���4-����֧ͨ����7-ȫ��'  where StatusName='JJPayChannel'
update [SystemStatusInfo] set StatusDescription='��ֵ��0-�ޣ�1-ÿ�ղƸ���2-ÿ��ʤ�֣�3-ÿ�ղƸ���ÿ��ʤ��' where StatusName='JJRankingListType' 
go
-----------------
-----------------���������
use [WHQJNativeWebDB]
go
alter table [dbo].[Ads] add PlatformType int not null default(1)
alter table [dbo].[SystemNotice] add PlatformType int not null default(1)
go
------------------------------------�һ�����
insert into AwardType(TypeName,SortID,Nullity,CollectDate) values('��Ϸ��',4,0,getdate())
insert into AwardType(TypeName,SortID,Nullity,CollectDate) values('�ճ�',3,0,getdate())
insert into AwardType(TypeName,SortID,Nullity,CollectDate) values('����',2,0,getdate())
insert into AwardType(TypeName,SortID,Nullity,CollectDate) values('��ȯ',1,0,getdate())


INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 1 , N'1����Ϸ��' , N'http://imageqj.foxuc.net/Match/47.png' , 10,10000 , 0 ,0 , 1 ,0 ,GETDATE())
INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 1 , N'5����Ϸ��' , N'http://imageqj.foxuc.net/Match/48.png' , 50,50000 , 0 ,0 , 2 ,0 ,GETDATE())
INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 1, N'100����Ϸ��' , N'http://imageqj.foxuc.net/Match/49.png' , 95,1000000 , 0 ,0 , 3 ,0 ,GETDATE())
INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 1, N'500����Ϸ��' , N'http://imageqj.foxuc.net/Match/50.png' , 490,5000000 , 0 ,0 , 4 ,0 ,GETDATE())

INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 2 , N'��ˮ��' , N'http://imageqj.foxuc.net/Match/47.png' , 100,0 , 0 ,80 , 1 ,0 ,GETDATE())
INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 2 , N'ֽ��' , N'http://imageqj.foxuc.net/Match/48.png' , 40,0 , 0 ,4985 , 2 ,0 ,GETDATE())

INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 3 , N'С�׶���' , N'http://imageqj.foxuc.net/Match/47.png' , 7000,0 , 0 ,50 , 1 ,0 ,GETDATE())
INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 3 , N'���ܳ�籦' , N'http://imageqj.foxuc.net/Match/48.png' , 90,0 , 0 ,7998 , 2 ,0 ,GETDATE())
INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 3 , N'IphoneX' , N'http://imageqj.foxuc.net/Match/49.png' , 99999999,0 , 0 ,10 , 3 ,0 ,GETDATE())

INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 4 , N'100Ԫ����ȯ' , N'http://imageqj.foxuc.net/Match/47.png' , 8000,0 , 0 ,6000 , 1 ,0 ,GETDATE())
INSERT INTO dbo.AwardInfo( AwardType ,AwardName ,AwardImg ,UnitPrice ,Gold ,Diamond ,Inventory ,SortID ,Nullity ,CollectDate)
VALUES  ( 4 , N'�ֶ���100Ԫ����ȯ' , N'http://imageqj.foxuc.net/Match/48.png' , 6000,0 , 0 ,3999 , 2 ,0 ,GETDATE())


go
-------------------U3D�������
alter table [dbo].[ConfigInfo] add Field9 nvarchar(128)
alter table [dbo].[ConfigInfo] add Field10 nvarchar(128)
alter table [dbo].[ConfigInfo] add Field11 nvarchar(128)
alter table [dbo].[ConfigInfo] add Field12 nvarchar(128)
alter table [dbo].[ConfigInfo] add Field13 nvarchar(128)
go

-- 1.1.10 ��������ֵ���������İ汾
USE WHQJAccountsDB
GO

INSERT DBO.SystemStatusInfo (StatusName,StatusValue,StatusString,StatusTip,StatusDescription,SortID)
VALUES (N'AgentHomeVersion',1, N'�����̨�İ汾�ţ����л����Ϻ�̨',N'�����̨�汾',N'��ֵ��1-�ϰ汾������̨��2-�°汾������̨',9999)
GO




