----------------------------------------------------------------------------------------------------
-- ��Ȩ��2017
-- ʱ�䣺2017-10-11
-- ��;�����ֲ�ս������
----------------------------------------------------------------------------------------------------

USE WHQJPlatformDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_PW_GetClubBattleRecord') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PW_GetClubBattleRecord
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

----------------------------------------------------------------------------------------------------

CREATE PROCEDURE NET_PW_GetClubBattleRecord
	@dwGroupID BIGINT,
	@dwUserID INT,
	@dwStartTime DATETIME,
	@dwEndTime DATETIME
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

CREATE TABLE #Tb_ClubRoomScore_Cache
(
	UserID INT,
	PersonalRoomGUID NVARCHAR(32),
	KindID INT,
	RoomID INT,
	Score BIGINT,
	CellScore BIGINT,
	StartTime DATETIME,
	RoomHostID INT,
	PlayBackCode INT,
	PlayMode TINYINT,
	ChairID INT
)

-- ִ���߼�
BEGIN
	-- ��ȡս����Ϣ
	IF @dwUserID<=0
	BEGIN
		INSERT INTO #Tb_ClubRoomScore_Cache SELECT TOP 50 UserID,PersonalRoomGUID,KindID,RoomID,Score,CellScore,StartTime,RoomHostID,PlayBackCode,PlayMode,ChairID FROM PersonalRoomScoreInfo(NOLOCK) 
		WHERE GroupID=@dwGroupID AND WriteTime>=@dwStartTime AND WriteTime<@dwEndTime ORDER BY WriteTime DESC
	END
	ELSE
	BEGIN
		INSERT INTO #Tb_ClubRoomScore_Cache SELECT TOP 50 UserID,PersonalRoomGUID,KindID,RoomID,Score,CellScore,StartTime,RoomHostID,PlayBackCode,PlayMode,ChairID FROM PersonalRoomScoreInfo(NOLOCK) 
		WHERE UserID=@dwUserID AND GroupID=@dwGroupID AND WriteTime>=@dwStartTime AND WriteTime<@dwEndTime ORDER BY WriteTime DESC
	END
	

	-- ����ս������
	SELECT GamesNum,RoomID,UserID,Score,ID FROM RecordBackInfo(NOLOCK) 
	WHERE PersonalRoomGUID IN(SELECT PersonalRoomGUID FROM #Tb_ClubRoomScore_Cache) 
	AND RoomID IN(SELECT RoomID FROM #Tb_ClubRoomScore_Cache) ORDER BY GamesNum ASC

	-- ������Ϸ����
	SELECT KindID,KindName FROM GameKindItem(NOLOCK) WHERE KindID IN(SELECT KindID FROM #Tb_ClubRoomScore_Cache)

	-- �����û���Ϣ
	SELECT UserID,GameID,NickName FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) 
	WHERE UserID IN(SELECT DISTINCT UserID FROM RecordBackInfo(NOLOCK) WHERE PersonalRoomGUID IN(SELECT PersonalRoomGUID FROM #Tb_ClubRoomScore_Cache) 
	AND RoomID IN(SELECT RoomID FROM #Tb_ClubRoomScore_Cache))
	
	-- ���ط�����Ϣ
	SELECT UserID,GameID,NickName FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) WHERE UserID IN(SELECT RoomHostID FROM #Tb_ClubRoomScore_Cache)

	-- ����ս����Ϣ
	SELECT * FROM #Tb_ClubRoomScore_Cache

	-- �����ʱ��
	DROP TABLE #Tb_ClubRoomScore_Cache

END

RETURN 0

GO


