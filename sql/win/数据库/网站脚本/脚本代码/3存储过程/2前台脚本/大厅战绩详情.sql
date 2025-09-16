----------------------------------------------------------------------------------------------------
-- ��Ȩ��2017
-- ʱ�䣺2017-10-11
-- ��;������ս������
----------------------------------------------------------------------------------------------------

USE WHQJPlatformDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_PW_GetHallBattleRecord') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PW_GetHallBattleRecord
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

----------------------------------------------------------------------------------------------------

CREATE PROCEDURE NET_PW_GetHallBattleRecord
	@dwUserID INT,
	@dwTypeID	INT     -- 0�����ַ���  1����ҷ���  2����ͨ���
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- ʱ�����
DECLARE @NowTime DATETIME
DECLARE @STime DATETIME
DECLARE @ETime DATETIME

-- ִ���߼�
BEGIN
	
	-- ʱ���ȡ
	SET @NowTime=CAST(CONVERT(NVARCHAR(10),GETDATE(),120) AS DATETIME)
	SET @STime = dateadd(DAY,-1,@NowTime)
	SET @ETime = GETDATE()

	IF @dwTypeID=2
	BEGIN
		-- ��ȡ��Ϸ�ɼ�
		SELECT TOP 30 DrawID,KindID,Score,Grade,Revenue,InsertTime INTO #Tb_DrawScore_Cache FROM WHQJTreasureDB.dbo.RecordDrawScoreForWeb(NOLOCK) 
		WHERE UserID=@dwUserID AND InsertTime>=@STime AND InsertTime<=@ETime ORDER BY InsertTime DESC
		
		-- ������Ϸ�ɼ�
		SELECT * FROM #Tb_DrawScore_Cache
		
		-- ������Ϸ��Ϣ
		SELECT DrawID,UserCount,AndroidCount FROM WHQJTreasureDB.dbo.RecordDrawInfo(NOLOCK) WHERE DrawID IN(SELECT DrawID FROM #Tb_DrawScore_Cache)

		-- ������Ϸ����
		SELECT KindID,KindName FROM GameKindItem(NOLOCK) WHERE KindID IN(SELECT KindID FROM #Tb_DrawScore_Cache)
	END
	ELSE
	BEGIN
		-- ��ȡս����Ϣ
		SELECT TOP 30 PersonalRoomGUID,KindID,RoomID,Score,CellScore,StartTime,RoomHostID,PlayBackCode,ChairID INTO #Tb_RoomScore_Cache FROM PersonalRoomScoreInfo(NOLOCK) 
		WHERE UserID=@dwUserID AND StartTime>=@STime AND StartTime<=@ETime AND PlayMode=@dwTypeID AND PersonalRoomGUID IN(SELECT PersonalRoomGUID FROM dbo.RecordBackInfo) AND GroupID=0 ORDER BY WriteTime DESC

		-- ����ս������
		SELECT GamesNum,RoomID,UserID,Score,ID FROM RecordBackInfo(NOLOCK) 
		WHERE PersonalRoomGUID IN(SELECT PersonalRoomGUID FROM #Tb_RoomScore_Cache) and Dates>=@STime AND Dates<=@ETime 
		AND RoomID IN(SELECT RoomID FROM #Tb_RoomScore_Cache) ORDER BY GamesNum ASC

		-- ������Ϸ����
		SELECT KindID,KindName FROM GameKindItem(NOLOCK) WHERE KindID IN(SELECT KindID FROM #Tb_RoomScore_Cache)

		-- �����û���Ϣ
		SELECT UserID,GameID,NickName FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) 
		WHERE UserID IN(SELECT DISTINCT UserID FROM RecordBackInfo(NOLOCK) WHERE PersonalRoomGUID IN(SELECT PersonalRoomGUID FROM #Tb_RoomScore_Cache) 
		AND RoomID IN(SELECT RoomID FROM #Tb_RoomScore_Cache))
	
		-- ���ط�����Ϣ
		SELECT UserID,GameID,NickName FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) WHERE UserID IN(SELECT RoomHostID FROM #Tb_RoomScore_Cache)

		-- ����ս����Ϣ
		SELECT * FROM #Tb_RoomScore_Cache
	END
END

RETURN 0

GO


