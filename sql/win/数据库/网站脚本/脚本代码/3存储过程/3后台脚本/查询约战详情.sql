----------------------------------------------------------------------------------------------------
-- ��Ȩ��2011
-- ʱ�䣺2012-02-23
-- ��;����ѯս������
----------------------------------------------------------------------------------------------------

USE WHQJPlatformDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_PM_QueryBackBattleInfo') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PM_QueryBackBattleInfo
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

----------------------------------------------------------------------------------------------------

CREATE PROCEDURE NET_PM_QueryBackBattleInfo
	@dwRoomID		INT,					-- Լս����
	@dwUserID		INT,					-- �û���ʾ
	@dwModeType		TINYINT,				-- Լս����
	@dwSTime		DATETIME,				-- ��ʼʱ��
	@dwETime		DATETIME				-- ����ʱ��
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

DECLARE @PersonalRoomGUID NVARCHAR(31)
DECLARE @RoomID INT

-- ִ���߼�
BEGIN
	-- ��ѯս�����
	SELECT UserID,PersonalRoomGUID,RoomID,Score,WinCount,LostCount,DrawCount,FleeCount,ChairID INTO #Tb_PersonalBattle FROM PersonalRoomScoreInfo(NOLOCK) 
	WHERE RoomID=@dwRoomID AND StartTime BETWEEN @dwSTime AND @dwETime AND RoomHostID=@dwUserID AND PlayMode=@dwModeType
	SELECT TOP 1 @PersonalRoomGUID=PersonalRoomGUID,@RoomID=RoomID FROM #Tb_PersonalBattle
	SELECT * FROM #Tb_PersonalBattle
	SELECT UserID,GameID,Accounts,NickName FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) WHERE UserID IN(SELECT DISTINCT UserID FROM #Tb_PersonalBattle)

	-- ��ѯս������
	SELECT DISTINCT GamesNum FROM RecordBackInfo(NOLOCK) WHERE PersonalRoomGUID=@PersonalRoomGUID AND RoomID=@RoomID ORDER BY GamesNum ASC
	SELECT GamesNum,UserID,Score,GameMode,LoopCount FROM RecordBackInfo(NOLOCK) WHERE PersonalRoomGUID=@PersonalRoomGUID AND RoomID=@RoomID ORDER BY GamesNum ASC

END

RETURN 0

GO