USE WHQJPlatformManagerDB

SET NOCOUNT ON

-- ģ���
TRUNCATE TABLE [dbo].[Base_Module]

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (1, 0, N'�û�ϵͳ', N'', 1, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (2, 0, N'��ֵϵͳ', N'', 2, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (3, 0, N'ά��ϵͳ', N'', 3, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (4, 0, N'��վϵͳ', N'', 4, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (5, 0, N'���ϵͳ', N'', 5, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (6, 0, N'��ʯϵͳ', N'', 6, 0, 1, N'',0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (7, 0, N'ͳ��ϵͳ', N'', 7, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (8, 0, N'��̨ϵͳ', N'', 20, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (9, 0, N'������ϵͳ', N'', 8, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (10, 0, N'����ϵͳ', N'', 9, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (13, 0, N'����ϵͳ', N'', 10, 0, 1, N'', 0)



INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (100, 1, N'�û�����', N'/Module/AccountManager/AccountsList.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (101, 1, N'�������', N'/Module/AccountManager/UserPlaying.aspx', 0, 0, 3, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (102, 1, N'���ͼ�¼', N'/Module/AccountManager/RecordGrantGoldList.aspx', 0, 0, 4, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (103, 1, N'�û���Ϸ', N'/Module/AccountManager/GeneralGame.aspx', 0, 0, 2, N'', 0)
--INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (104, 1, N'�������', '/Module/AccountManager/TaskList.aspx',0,0,4,N'',0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (105, 1, N'ע������', '/Module/AccountManager/RegisterGiveList.aspx',0,0,4,N'',0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (200, 2, N'��ֵ����', N'/Module/FilledManager/AppPayConfigList.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (201, 2, N'��ֵ��¼', N'/Module/FilledManager/RecordPayDiamond.aspx', 0, 0, 2, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (202, 2, N'���߳�ֵ����', N'/Module/FilledManager/OnLineWeChatList.aspx', 3, 0, 0, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (301, 3, N'��Ϸ����', N'/Module/AppManager/GameGameItemList.aspx', 0, 0, 2, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (302, 3, N'ϵͳ��Ϣ', N'/Module/AppManager/SystemMessageList.aspx', 0, 0, 3, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (303, 3, N'ϵͳ����', N'/Module/AppManager/SystemSet.aspx', 0, 0, 4, N'', 0)
--INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (304, 3, N'�ƹ����', N'/Module/AppManager/SpreadConfigList.aspx', 0, 0, 5, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (305, 3, N'���й���', N'/Module/AppManager/RankingConfigList.aspx', 0, 0, 6, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (306, 3, N'���߹���', N'/Module/AppManager/PropertyConfigList.aspx', 0, 0, 7, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (307, 3, N'ǩ������', N'/Module/AppManager/GamePackageConfigList.aspx', 0, 0, 8, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (308, 3, N'ÿ�շ������', N'/Module/AppManager/ShareConfigList.aspx', 0, 0, 9, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (400, 4, N'վ������', N'/Module/WebManager/LogoSet.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (401, 4, N'��Ϸ����', N'/Module/WebManager/KindRuleList.aspx', 0, 0, 2, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (402, 4, N'������', N'/Module/WebManager/AdsList.aspx', 0, 0, 3, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (403, 4, N'���Ź���', N'/Module/WebManager/SystemNoticeList.aspx', 0, 0, 4, N'', 0)
--INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (404, 4, N'��Ϣ����', N'/Module/WebManager/UMessagePushList.aspx', 0, 0, 5, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (405, 4, N'��������', N'/Module/WebManager/QuestionList.aspx', 0, 0, 6, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (500, 5, N'��ҹ���', N'/Module/GoldManager/AccountsGoldList.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (503, 5, N'���м�¼', N'/Module/GoldManager/RecordBankTrade.aspx', 0, 0, 4, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (504, 5, N'������¼', N'/Module/GoldManager/RecordGameInOut.aspx', 0, 0, 5, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (505, 5, N'��Ϸ��¼', N'/Module/GoldManager/RecordUserGame.aspx', 0, 0, 6, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (506, 5, N'���Լս', N'/Module/GoldManager/RecordGoldBattleList.aspx', 0, 0, 7, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (600, 6, N'��ʯ����', N'/Module/Diamond/DiamondList.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (604, 6, N'����Լս', N'/Module/Diamond/RecordScoreBattleList.aspx', 0, 0, 5, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (700, 7, N'ÿ��ͳ��', N'/Module/DataStatistics/UserRegister.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (701, 7, N'����ͳ��', N'/Module/DataStatistics/UserOnline.aspx', 0, 0, 2, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (705, 7, N'�ֲ�ͳ��', N'/Module/DataStatistics/WealthDistribute.aspx', 0, 0, 6, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (706, 7, N'ȫ��ͳ��', N'/Module/DataStatistics/SystemStat.aspx', 0, 0, 0, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (800, 8, N'�˺Ź���', N'/Module/BackManager/BaseRoleList.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (801, 8, N'��ȫ��־', N'/Module/OperationLog/SystemSecurityList.aspx', 0, 0, 2, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (901, 9, N'����������', N'/Module/ClubManager/SystemSet.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (902, 9, N'�����˹���', N'/Module/ClubManager/GroupList.aspx', 0, 0, 2, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (903, 9, N'ѫ�¼�¼', N'/Module/ClubManager/RecordGroupScoreChangeList.aspx', 0, 0, 3, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (904, 9, N'ս����¼', N'/Module/ClubManager/RecordGroupUserGame.aspx', 0, 0, 3, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (905, 9, N'����������', N'/Module/ClubManager/GroupWhiteList.aspx', 0, 0, 4, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (1000, 10, N'��������', N'/Module/AgentManager/SystemSet.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (1001, 10, N'�������', N'/Module/AgentManager/AgentList.aspx', 0, 0, 2, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (1002, 10, N'������', N'/Module/AgentManager/AgentReturnConfigList.aspx', 0, 0, 3, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (11, 0, N'�һ�ϵͳ', N'', 11, 0, 1, N'', 0)
--INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (1100, 11, N'���͹���', N'/Module/MallManager/MallTypeList.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (1101, 11, N'��Ʒ����', N'/Module/MallManager/MallInfoList.aspx', 5, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (1102, 11, N'��������', N'/Module/MallManager/MallOrderList.aspx', 10, 0, 1, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [OrderNo], [Nullity], [IsMenu], [Description], [ManagerPopedom]) VALUES (12, 0, N'��ȯϵͳ', N'', 6, 0, 1, N'',0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (1200, 12, N'��ȯ����', N'/Module/AwardTicket/AwardTicketList.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (1201, 12, N'��ȯ��¼', N'/Module/AwardTicket/RecordAwardTicketSerialList.aspx', 0, 0, 2, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (1202, 12, N'�һ���¼', N'/Module/AwardTicket/ExchangeAwardTicketList.aspx', 0, 0, 3, N'', 0)

INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (1300, 13, N'�����˺�', N'/Module/DebugManager/GroupDebugList.aspx', 0, 0, 1, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (1301, 13, N'��Ϸ����', N'/Module/DebugManager/GroupGameControlList.aspx', 0, 0, 2, N'', 0)
INSERT [dbo].[Base_Module] ([ModuleID], [ParentID], [Title], [Link], [IsMenu], [Nullity], [OrderNo], [Description], [ManagerPopedom]) VALUES (1302, 13, N'AI����', N'/Module/DebugManager/AITimeChangeList.aspx', 0, 0, 3, N'', 0)


-- ģ��Ȩ�ޱ�
TRUNCATE TABLE Base_ModulePermission

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (100, N'�鿴', 1, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (100, N'�༭', 4, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (100, N'��������', 256, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (100, N'��/��', 8192, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (100, N'����Ȩ��/ȡ��Ȩ��', 524288, 0, 0, 1)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (101, N'�鿴', 1, 0, 0, 1)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (102, N'�鿴', 1, 0, 0, 1)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (103, N'�鿴', 1, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (103, N'���', 2, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (103, N'�༭', 4, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (103, N'ɾ��', 8, 0, 0, 1)

--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (104,'�鿴',1,0,0,1)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (104,'���',2,0,0,1)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (104,'�༭',4,0,0,1)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (104,'��/��',8192,0,0,1)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (105, N'�鿴', 1, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (105, N'���', 2, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (105, N'�༭', 4, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (105, N'ɾ��', 8, 0, 0, 1)


INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (200, N'�鿴', 1, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (200, N'���', 2, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (200, N'�༭', 4, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (200, N'ɾ��', 8, 0, 0, 2)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (201, N'�鿴', 1, 0, 0, 2)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (202, N'�鿴', 1, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (202, N'���', 2, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (202, N'�༭', 4, 0, 0, 1)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (202, N'ɾ��', 8, 0, 0, 1)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (301, N'�鿴', 1, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (301, N'���', 2, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (301, N'�༭', 4, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (301, N'ɾ��', 8, 0, 0, 3)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (302, N'�鿴', 1, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (302, N'���', 2, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (302, N'�༭', 4, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (302, N'ɾ��', 8, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (302, N'��/��', 8192, 0, 0, 3)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (303, N'�鿴', 1, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (303, N'�༭', 4, 0, 0, 3)

--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (304, N'�鿴', 1, 0, 0, 3)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (304, N'���', 2, 0, 0, 3)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (304, N'�༭', 4, 0, 0, 3)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (304, N'ɾ��', 8, 0, 0, 3)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (305, N'�鿴', 1, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (305, N'���', 2, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (305, N'�༭', 4, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (305, N'ɾ��', 8, 0, 0, 3)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (306, N'�鿴', 1, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (306, N'�༭', 4, 0, 0, 3)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (307, N'�鿴', 1, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (307, N'���', 2, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (307, N'�༭', 4, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (307, N'ɾ��', 8, 0, 0, 3)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (308, N'�鿴', 1, 0, 0, 3)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (308, N'�༭', 4, 0, 0, 3)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (400, N'�鿴', 1, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (400, N'�༭', 4, 0, 0, 4)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (401, N'�鿴', 1, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (401, N'���', 2, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (401, N'�༭', 4, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (401, N'ɾ��', 8, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (401, N'��/��', 8192, 0, 0, 4)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (402, N'�鿴', 1, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (402, N'���', 2, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (402, N'�༭', 4, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (402, N'ɾ��', 8, 0, 0, 4)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (403, N'�鿴', 1, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (403, N'���', 2, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (403, N'�༭', 4, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (403, N'ɾ��', 8, 0, 0, 4)

--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (404, N'�鿴', 1, 0, 0, 4)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (404, N'�༭', 4, 0, 0, 4)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (405, N'�鿴', 1, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (405, N'���', 2, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (405, N'�༭', 4, 0, 0, 4)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (405, N'ɾ��', 8, 0, 0, 4)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (500, N'�鿴', 1, 0, 0, 5)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (500, N'���ͽ��', 32, 0, 0, 5)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (503, N'�鿴', 1, 0, 0, 5)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (504, N'�鿴', 1, 0, 0, 5)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (505, N'�鿴', 1, 0, 0, 5)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (506, N'�鿴', 1, 0, 0, 5)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (600, N'�鿴', 1, 0, 0, 6)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (600, N'������ʯ', 262144, 0, 0, 6)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (603, N'�鿴', 1, 0, 0, 6)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (604, N'�鿴', 1, 0, 0, 6)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (606, N'�鿴', 1, 0, 0, 6)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (700, N'�鿴', 1, 0, 0, 7)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (701, N'�鿴', 1, 0, 0, 7)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (705, N'�鿴', 1, 0, 0, 7)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (706, N'�鿴', 1, 0, 0, 7)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (800, N'�鿴', 1, 0, 0, 8)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (800, N'���', 2, 0, 0, 8)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (800, N'�༭', 4, 0, 0, 8)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (800, N'ɾ��', 8, 0, 0, 8)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (800, N'��/��', 8192, 0, 0, 8)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (801, N'�鿴', 1, 0, 0, 8)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (901, N'�鿴', 1, 0, 0, 9)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (901, N'���', 2, 0, 0, 9)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (901, N'�༭', 4, 0, 0, 9)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (901, N'ɾ��', 8, 0, 0, 9)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (902, N'�鿴', 1, 0, 0, 9)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (902, N'����/�ⶳ', 2, 0, 0, 9)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (902, N'�ƽ�Ⱥ��', 4, 0, 0, 9)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (902, N'ǿ�ƽ�ɢ', 8, 0, 0, 9)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (903, N'�鿴', 1, 0, 0, 9)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (904, N'�鿴', 1, 0, 0, 9)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (905, N'�鿴', 1, 0, 0, 9)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (905, N'���', 2, 0, 0, 9)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (905, N'�༭', 4, 0, 0, 9)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (905, N'ɾ��', 8, 0, 0, 9)


INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1000, N'�鿴', 1, 0, 0, 10)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1000, N'�޸�', 4, 0, 0, 10)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1001, N'�鿴', 1, 0, 0, 10)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1001, N'����', 2, 0, 0, 10)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1001, N'�޸�', 4, 0, 0, 10)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1001, N'����', 8, 0, 0, 10)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1002, N'�鿴', 1, 0, 0, 10)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1002, N'����', 2, 0, 0, 10)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1002, N'�޸�', 4, 0, 0, 10)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1002, N'ɾ��', 8, 0, 0, 10)

--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1100, N'�鿴', 1, 0, 0, 11)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1100, N'���', 2, 0, 0, 11)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1100, N'�༭', 4, 0, 0, 11)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1100, N'ɾ��', 8, 0, 0, 11)
--INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1100, N'��/����', 32768, 0, 0, 11)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1101, N'�鿴', 1, 0, 0, 11)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1101, N'���', 2, 0, 0, 11)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1101, N'�༭', 4, 0, 0, 11)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1101, N'ɾ��', 8, 0, 0, 11)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1101, N'�ϼ�/�¼�', 32768, 0, 0, 11)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1102, N'�鿴', 1, 0, 0, 11)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1102, N'������', 65536, 0, 0, 11)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1200, N'�鿴', 1, 0, 0, 12)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1200, N'������ʯ', 262144, 0, 0, 12)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1201, N'�鿴', 1, 0, 0, 12)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1202, N'�鿴', 1, 0, 0, 12)

INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1300, N'�鿴', 1, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1300, N'���', 2, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1300, N'�༭', 4, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1300, N'ɾ��', 8, 0, 0, 2)


INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1301, N'�鿴', 1, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1301, N'���', 2, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1301, N'�༭', 4, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1301, N'ɾ��', 8, 0, 0, 2)


INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1302, N'�鿴', 1, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1302, N'���', 2, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1302, N'�༭', 4, 0, 0, 2)
INSERT [dbo].[Base_ModulePermission] ([ModuleID], [PermissionTitle], [PermissionValue], [Nullity], [StateFlag], [ParentID]) VALUES (1302, N'ɾ��', 8, 0, 0, 2)

-- �û���
TRUNCATE TABLE Base_Users

INSERT INTO Base_Users(Username,Password,RoleID) VALUES('admin','E10ADC3949BA59ABBE56E057F20F883E',1)

-- ��ɫ��
TRUNCATE TABLE Base_Roles

INSERT INTO Base_Roles(RoleName,Description) VALUES('��������Ա','��������Ա')

SET NOCOUNT OFF


