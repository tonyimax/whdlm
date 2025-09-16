----------------------------------------------------------------------
-- �汾��2018
-- ʱ�䣺2018-07-04
-- ��;��ʤ�����а�ÿ30����ͳ�ƣ�
----------------------------------------------------------------------
USE [WHQJTreasureDB]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[NET_PJ_GameRanking]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[NET_PJ_GameRanking]
GO

----------------------------------------------------------------------
CREATE PROC [NET_PJ_GameRanking]

WITH ENCRYPTION AS

-- ��������

DECLARE @DateID INT
DECLARE @WeekStartDay DATETIME
DECLARE @DateEndID INT

-- ִ���߼�
BEGIN
	
	-- ��ȡʱ��
	SET @WeekStartDay = DATEADD(DAY,-1,DATEADD(WEEK,DATEDIFF(WEEK,0,GETDATE()),0))
	SET @DateID = CAST(CAST(@WeekStartDay AS FLOAT) AS INT)
	SET @DateEndID = CAST(CAST(DATEADD(DAY,6,@WeekStartDay) AS FLOAT) AS INT)

	-- ����Ѵ��ڵ�����
	DELETE WHQJNativeWebDB.dbo.CacheGameRank WHERE DateID=@DateID

	-- �������а�����
	INSERT INTO WHQJNativeWebDB.dbo.CacheGameRank(DateID,UserID,RankNum,WinCount) 
	SELECT TOP 100 @DateID AS DateID,UserID,ROW_NUMBER() OVER(ORDER BY ISNULL(SUM(WinCount),0) DESC) AS RankNum,ISNULL(SUM(WinCount),0) AS WinCount 
	FROM StreamScoreInfo(NOLOCK) WHERE DateID>=@DateID AND DateID<=@DateEndID AND WinCount>0 GROUP BY UserID

	-- �޸Ĳ��������
	UPDATE WHQJNativeWebDB.dbo.CacheGameRank SET GameID=A.GameID,NickName=A.NickName,FaceUrl=A.CustomID,FaceID=A.FaceID,Gender=A.Gender,UnderWrite=A.UnderWrite 
	FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) AS A WHERE WHQJNativeWebDB.dbo.CacheGameRank.DateID=@DateID AND WHQJNativeWebDB.dbo.CacheGameRank.UserID=A.UserID

	-- �޸�ͷ����Ϣ
	UPDATE WHQJNativeWebDB.dbo.CacheGameRank SET FaceUrl=A.FaceUrl
	FROM WHQJAccountsDB.dbo.AccountsFace(NOLOCK) AS A WHERE WHQJNativeWebDB.dbo.CacheGameRank.DateID=@DateID AND WHQJNativeWebDB.dbo.CacheGameRank.FaceUrl=A.ID

END
GO