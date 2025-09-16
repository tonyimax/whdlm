USE [WHQJNativeWebDB]
GO

SET NOCOUNT ON

-- ��վϵͳ����
TRUNCATE TABLE ConfigInfo
GO

INSERT INTO ConfigInfo(ConfigKey,ConfigName,ConfigString,Field1,Field2,Field3,Field4,Field5,Field6,Field8,Field13,SortID) VALUES(N'MobilePlatformVersion',N'�ƶ����������',
N'����˵��
�ֶ�1���ȸ�������·��   
�ֶ�2�������汾�� 
�ֶ�3����Դ�汾��
�ֶ�4��ios��ҵ�汾�����ص�ַ
�ֶ�5��ƻ���������ص�ַ
�ֶ�6����׿�������ص�ַ
�ֶ�7��U3Dƻ�������汾��
�ֶ�8��U3D��׿�����汾��
�ֶ�9��U3Dƻ���������ص�ַ
�ֶ�10��U3D��׿�������ص�ַ
�ֶ�11��U3Dƻ���ϴ������ص�ַ
�ֶ�12��U3D��׿�ϴ������ص�ַ
�ֶ�13��U3D��Դ�汾��',N'http://qj.foxuc.net/Download/Phone',N'0',N'0',N'',N'itms-services://?action=download-manifest&url=https://qj.foxuc.net/Download/LuaMBClient_LY.plist',N'http://172.16.3.211:6511/Download/LuaMBClient_LY.apk','0','0',4)
INSERT INTO ConfigInfo(ConfigKey,ConfigName,ConfigString,Field1,Field2,Field3,Field4,Field5,Field6,SortID) VALUES(N'SysCustomerService',N'ϵͳ�ͷ�����',
N'����˵��
�ֶ�1���ͷ��绰   
�ֶ�2���ͷ�΢�� 
�ֶ�3���ͷ�QQ',
N'400-000-7043',N'4000007043',N'4000007043',N'',N'',
N'',5)

INSERT INTO ConfigInfo(ConfigKey,ConfigName,ConfigString,Field1,Field2,Field3,Field4,SortID) VALUES(N'WebSiteConfig',N'��վվ������',
N'����˵��
�ֶ�1����վ��ά���ַ 
�ֶ�2����վͼƬ��������ַ
�ֶ�3����վǰ̨��������ַ
�ֶ�4����վ�������ӵ�ַ',N'http://qj.foxuc.net',N'http://imageqj.foxuc.net',N'http://qj.foxuc.net',N'http://qj.foxuc.net',6)
GO

-- �ֻ��������
TRUNCATE TABLE dbo.Ads
go

INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'�������',N'/Initialize/ads_1.jpg',N'ad_to_createroom_action',3,0,N'����������',1)
INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'�������',N'/Initialize/ads_2.jpg',N'ad_to_video_action',3,1,N'����������',1)
INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'�������',N'/Initialize/ads_3.jpg',N'ad_to_identify_action',3,2,N'����������',1)

INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'ǩ��',N'/Initialize/45(1).png',N'1',6,2,N'�ڲ����ģ���תǩ��ϵͳ',3)--u3d
INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'�Żݶ�� ��������',N'/Initialize/39.png',N'4',6,4,N'�ڲ����ģ���ת�̳�ϵͳ',3)
INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'�ƹ����',N'/Initialize/44(1).png',N'2',6,0,N'�ڲ����ģ���ת����ϵͳ',3)

INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'�ڲ����ģ���ת����ϵͳ',N'/Initialize/40(1).png',N'3',6,4,N'�ڲ����ģ���ת����ϵͳ',2)--lua
INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'�ƹ����',N'/Initialize/49.png',N'2',6,4,N'�ڲ����ģ���ת����ϵͳ',2)
INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'�ڲ����ģ���ת�̳�ϵͳ',N'/Initialize/41(1).png',N'4',6,3,N'�ڲ����ģ���ת�̳�ϵͳ',2)
INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'�ڲ����ģ���תǩ��ϵͳ',N'/Initialize/42(1).png',N'1',6,1,N'�ڲ����ģ���תǩ��ϵͳ',2)
INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'�ڲ����ģ��޹���',N'/Initialize/43(1).png',N'',0,5,N'�ڲ����ģ��޹���',2)

INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'H5����',N'/Initialize/h51.png',N'',6,1,N'�ڲ����ģ��޹���',4) --h5
INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'H5����',N'/Initialize/h52.png',N'',6,2,N'�ڲ����ģ��޹���',4)
INSERT  Ads(Title,ResourceURL,LinkURL,Type,SortID,Remark,PlatformType) values(N'H5����',N'/Initialize/h53.png',N'',6,3,N'�ڲ����ģ��޹���',4)

-- ������������
TRUNCATE TABLE Question
GO

INSERT INTO Question(QuestionTitle,Answer,SortID) VALUES(N'��λ�ȡ��ʯ��', N'����ϵ�ͷ���12345678', 1)
INSERT INTO Question(QuestionTitle,Answer,SortID) VALUES(N'��λ�ȡ��Ϸ�ң�', N'����ϵ�ͷ���12345678', 2)
GO

-- ϵͳ��������
TRUNCATE TABLE SystemNotice
GO

INSERT INTO SystemNotice(NoticeTitle,MoblieContent,SortID,Publisher,PublisherTime,IsHot,IsTop,Nullity) 
VALUES(N'��ӭ������������ƽ̨',N'��ӭ������������ƽ̨,��������ʡ���̼���������Ϸ',1,N'����ƽ̨',GETDATE(),1,1,0)
GO

--���а�
truncate table RankingConfig
go
SET IDENTITY_INSERT [dbo].[RankingConfig] ON 
INSERT [dbo].[RankingConfig] ([ConfigID], [TypeID], [RankType], [Gold], [Diamond], [AwardTicket], [CollectDate]) VALUES (8, 2, 1, 10000, 100, 0, CAST(0x0000A913012F8399 AS DateTime))
INSERT [dbo].[RankingConfig] ([ConfigID], [TypeID], [RankType], [Gold], [Diamond], [AwardTicket], [CollectDate]) VALUES (10, 2, 2, 7000, 80, 0, CAST(0x0000A913012FA3F2 AS DateTime))
INSERT [dbo].[RankingConfig] ([ConfigID], [TypeID], [RankType], [Gold], [Diamond], [AwardTicket], [CollectDate]) VALUES (11, 2, 3, 5000, 70, 0, CAST(0x0000A913012FCCA2 AS DateTime))
INSERT [dbo].[RankingConfig] ([ConfigID], [TypeID], [RankType], [Gold], [Diamond], [AwardTicket], [CollectDate]) VALUES (12, 2, 4, 4000, 60, 0, CAST(0x0000A913012FDB25 AS DateTime))
INSERT [dbo].[RankingConfig] ([ConfigID], [TypeID], [RankType], [Gold], [Diamond], [AwardTicket], [CollectDate]) VALUES (13, 2, 5, 3000, 50, 0, CAST(0x0000A913012FEC1D AS DateTime))
INSERT [dbo].[RankingConfig] ([ConfigID], [TypeID], [RankType], [Gold], [Diamond], [AwardTicket], [CollectDate]) VALUES (14, 2, 6, 2000, 40, 0, CAST(0x0000A913013001F2 AS DateTime))
INSERT [dbo].[RankingConfig] ([ConfigID], [TypeID], [RankType], [Gold], [Diamond], [AwardTicket], [CollectDate]) VALUES (15, 2, 7, 1000, 10, 0, CAST(0x0000A9130130133E AS DateTime))
SET IDENTITY_INSERT [dbo].[RankingConfig] OFF
GO

--������Ϸ����
USE [WHQJNativeWebDB]
GO
truncate table GameRule
go
SET IDENTITY_INSERT [dbo].[GameRule] ON 

INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (1, 57, N'����ţţ', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026104723.png', 2, 0, 0, CAST(0x0000A98500B1D023 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (2, 122, N'�°ټ���', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026104748.png', 2, 0, 0, CAST(0x0000A98500B1EC7C AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (3, 200, N'������', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026104805.png', 2, 0, 0, CAST(0x0000A98500B20178 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (4, 56, N'�������', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026104836.png', 2, 0, 0, CAST(0x0000A98500B224CF AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (5, 391, N'�¹㶫�齫', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026104853.png', 2, 0, 0, CAST(0x0000A98500B2392F AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (6, 389, N'�����齫', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026104909.png', 2, 0, 0, CAST(0x0000A98500B24B88 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (7, 33, N'����', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026104932.png', 2, 0, 0, CAST(0x0000A98500B26740 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (8, 302, N'Ѫս�齫', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026104945.png', 2, 0, 0, CAST(0x0000A98500B27685 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (9, 122, N'�°ټ���', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113452.png', 1, 0, 0, CAST(0x0000A98500BEDA08 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (10, 57, N'����ţţ', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113524.png', 1, 0, 0, CAST(0x0000A98500BEFF5F AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (11, 104, N'����ţţ', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113535.png', 1, 0, 0, CAST(0x0000A98500BF0C55 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (12, 200, N'������', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113548.png', 1, 0, 0, CAST(0x0000A98500BF1C69 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (13, 56, N'�������', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113605.png', 1, 0, 0, CAST(0x0000A98500BF2FE5 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (14, 391, N'�¹㶫�齫', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113644.png', 1, 0, 0, CAST(0x0000A98500BF5D33 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (15, 389, N'�����齫', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113711.png', 1, 0, 0, CAST(0x0000A98500BF7D1E AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (16, 707, N'����������', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113730.png', 1, 0, 0, CAST(0x0000A98500BF939B AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (17, 14, N'�ƾ�', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113754.png', 1, 0, 0, CAST(0x0000A98500BFB01A AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (18, 33, N'����', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113808.png', 1, 0, 0, CAST(0x0000A98500BFBFF1 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (19, 51, N'�㽭ʮ��ˮ', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113821.png', 1, 0, 0, CAST(0x0000A98500BFCFA2 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (20, 401, N'������', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113856.png', 1, 0, 0, CAST(0x0000A98500BFF7F5 AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (21, 302, N'Ѫս�齫', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026113906.png', 1, 0, 0, CAST(0x0000A98500C003CE AS DateTime), 0)
INSERT [dbo].[GameRule] ([ID], [KindID], [KindName], [KindIcon], [KindIntro], [KindRule], [RuleImg], [Type], [LogID], [Nullity], [CollectDate], [SortID]) VALUES (22, 240, N'�ܵÿ�', N'', N'', N'', N'/Upload/RuleIoc/Rule20181026045255.png', 1, 0, 0, CAST(0x0000A985011634E5 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[GameRule] OFF

SET NOCOUNT OFF


----------------------------------------------------------------------------------------------------


USE [WHQJTreasureDB]
GO

SET NOCOUNT ON

-- �ƹ㽱������
TRUNCATE TABLE SpreadConfig
GO

INSERT INTO SpreadConfig(SpreadNum,PresentDiamond,PresentPropID,PresentPropName,PresentPropNum,UpdateTime) VALUES(3,3,0,'',0,GETDATE())
INSERT INTO SpreadConfig(SpreadNum,PresentDiamond,PresentPropID,PresentPropName,PresentPropNum,UpdateTime) VALUES(6,6,0,'',0,GETDATE())
INSERT INTO SpreadConfig(SpreadNum,PresentDiamond,PresentPropID,PresentPropName,PresentPropNum,UpdateTime) VALUES(10,10,0,'',0,GETDATE())
INSERT INTO SpreadConfig(SpreadNum,PresentDiamond,PresentPropID,PresentPropName,PresentPropNum,UpdateTime) VALUES(15,15,306,'������',1,GETDATE())
INSERT INTO SpreadConfig(SpreadNum,PresentDiamond,PresentPropID,PresentPropName,PresentPropNum,UpdateTime) VALUES(20,20,306,'������',1,GETDATE())
GO

SET NOCOUNT OFF

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WHQJAgentDB
GO

SET NOCOUNT ON

-- ��������
TRUNCATE TABLE SystemStatusInfo
GO

INSERT SystemStatusInfo ([StatusName],[StatusValue],[StatusString],[StatusTip],[StatusDescription],[SortID])
VALUES (N'AgentAwardType',3,'������ģʽ','����ģʽ','��ֵ��1��������ų�ֵ��������ʯ����2�����������Ϸ˰�շ�������ҡ���3����ͬʱ����1��2���ַ���ģʽ',10)
INSERT SystemStatusInfo ([StatusName],[StatusValue],[StatusString],[StatusTip],[StatusDescription],[SortID])
VALUES (N'ReceiveDiamondSave',100,'��ȡ��ʯ����','��ȡ��ʯ����','��ֵ��0������ȡ��ʯʱ�ޱ���������0����ÿ����ȡ��ʯ���ɴ��ڿ���ȡֵ-����ֵ',50)
INSERT SystemStatusInfo ([StatusName],[StatusValue],[StatusString],[StatusTip],[StatusDescription],[SortID])
VALUES (N'ReceiveGoldSave',10000,'��ȡ��ұ���','��ȡ��ұ���','��ֵ��0������ȡ���ʱ�ޱ���������0����ÿ����ȡ��Ҳ��ɴ��ڿ���ȡֵ-����ֵ',51)
INSERT SystemStatusInfo ([StatusName],[StatusValue],[StatusString],[StatusTip],[StatusDescription],[SortID])
VALUES (N'ReceiveDiamondMin',100,'������ȡ��ʯ','������ȡ��ʯ','��ֵ��ÿ����ȡ��ʯ������Ҫ��ȡ��ֵ',52)
INSERT SystemStatusInfo ([StatusName],[StatusValue],[StatusString],[StatusTip],[StatusDescription],[SortID])
VALUES (N'ReceiveGoldMin',100,'���ٽ�ұ���','���ٽ�ұ���','��ֵ��ÿ����ȡ���������Ҫ��ȡ��ֵ',53)
GO

-- ��������
TRUNCATE TABLE ReturnAwardConfig
GO

INSERT ReturnAwardConfig(AwardType,AwardLevel,AwardScale,Nullity) VALUES (1,1,0.35,0)
INSERT ReturnAwardConfig(AwardType,AwardLevel,AwardScale,Nullity) VALUES (1,2,0.07,0)
INSERT ReturnAwardConfig(AwardType,AwardLevel,AwardScale,Nullity) VALUES (1,3,0.03,0)
INSERT ReturnAwardConfig(AwardType,AwardLevel,AwardScale,Nullity) VALUES (2,1,0.35,0)
INSERT ReturnAwardConfig(AwardType,AwardLevel,AwardScale,Nullity) VALUES (2,2,0.07,0)
INSERT ReturnAwardConfig(AwardType,AwardLevel,AwardScale,Nullity) VALUES (2,3,0.03,0)
GO

SET NOCOUNT OFF
GO


USE [WHQJAccountsDB]
GO

SET NOCOUNT ON


--����ע�ά��
truncate table RegisterGive
go
SET IDENTITY_INSERT [dbo].[RegisterGive] ON 

INSERT [dbo].[RegisterGive] ([ConfigID], [ScoreCount], [DiamondCount], [PlatformType]) VALUES (1, 1000, 100, 1)
INSERT [dbo].[RegisterGive] ([ConfigID], [ScoreCount], [DiamondCount], [PlatformType]) VALUES (2, 1000, 100, 2)
INSERT [dbo].[RegisterGive] ([ConfigID], [ScoreCount], [DiamondCount], [PlatformType]) VALUES (3, 1000, 100, 3)
SET IDENTITY_INSERT [dbo].[RegisterGive] OFF

SET NOCOUNT OFF
GO


