----------------------------------------------------------------------------------------------------
-- ��Ȩ��2011
-- ʱ�䣺2012-02-23
-- ��;����ȡ���а�����(ÿ�յ����а�)
----------------------------------------------------------------------------------------------------

USE WHQJNativeWebDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_PW_GetDayRankingData') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PW_GetDayRankingData
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

----------------------------------------------------------------------------------------------------

CREATE PROCEDURE NET_PW_GetDayRankingData
	@UserID INT,
	@TypeID INT
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

DECLARE @YesterDay DATETIME
DECLARE @WeekDay DATETIME
DECLARE @DateID INT
DECLARE @DateWeekID INT

-- ִ���߼�
BEGIN
	-- ��ȡʱ��
	SET @YesterDay = DATEADD(DAY,-1,GETDATE())
	SET @WeekDay = DATEADD(DAY,-1,DATEADD(WEEK,DATEDIFF(WEEK,0,GETDATE()),0))
	SET @DateID = CAST(CAST(@YesterDay AS FLOAT) AS INT)
	SET @DateWeekID = CAST(CAST(@WeekDay AS FLOAT) AS INT)

	-- ��ȡ�Ƹ�����
	IF @TypeID = 1
	BEGIN
		SELECT RankNum,UserID,GameID,NickName,FaceUrl,FaceID,UnderWrite,Gold,Gender FROM CacheWealthRank(NOLOCK) WHERE DateID=@DateID ORDER BY RankNum ASC
		-- ����Ƿ��ϰ�
		SELECT RankNum,UserID,GameID,NickName,FaceUrl,FaceID,UnderWrite,Gold,Gender FROM CacheWealthRank(NOLOCK) WHERE DateID=@DateID AND UserID=@UserID
	END 
	-- ��ȡʤ������
	IF @TypeID = 2
	BEGIN
		SELECT RankNum,UserID,GameID,NickName,FaceUrl,FaceID,UnderWrite,WinCount,Gender FROM CacheGameRank(NOLOCK) WHERE DateID=@DateWeekID ORDER BY RankNum ASC
		-- ����Ƿ��ϰ�
		SELECT RankNum,UserID,GameID,NickName,FaceUrl,FaceID,UnderWrite,WinCount,Gender FROM CacheGameRank(NOLOCK) WHERE DateID=@DateWeekID AND UserID=@UserID
	END
END

RETURN 0

GO