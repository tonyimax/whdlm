----------------------------------------------------------------------
-- �汾��2018
-- ʱ�䣺2018-07-04
-- ��;���Ƹ����а�ÿ���賿1��ͳ�ƣ�
----------------------------------------------------------------------
USE [WHQJTreasureDB]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[NET_PJ_WealthRanking]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[NET_PJ_WealthRanking]
GO

----------------------------------------------------------------------
CREATE PROC [NET_PJ_WealthRanking]

WITH ENCRYPTION AS

-- ��������

DECLARE @Yesterday DATETIME
DECLARE @DateID INT
DECLARE @ByTime NVARCHAR(20)

-- ִ���߼�
BEGIN

	-- ��ȡǰһ��ʱ��
	SET @Yesterday = DATEADD(DAY,-1,GETDATE())
	SET @DateID = CAST(CAST(@Yesterday AS FLOAT) AS INT)
	SET @ByTime = Convert(CHAR(10),DATEADD(DAY,-7,@Yesterday),120)

	-- ����Ѵ��ڵ�����
	DELETE WHQJNativeWebDB.dbo.CacheWealthRank WHERE DateID=@DateID

	-- �������а�����
	INSERT INTO WHQJNativeWebDB.dbo.CacheWealthRank(DateID,UserID,RankNum,Gold) SELECT TOP 100 @DateID AS DateID,a.UserID,ROW_NUMBER() OVER(ORDER BY (Score+InsureScore) DESC) AS RankNum,(Score+InsureScore) AS Gold  FROM GameScoreInfo(NOLOCK) a JOIN WHQJAccountsDB.dbo.AccountsInfo b ON b.UserID=a.UserID WHERE b.LastLogonDate>=@ByTime 

	-- �޸Ĳ��������
	UPDATE WHQJNativeWebDB.dbo.CacheWealthRank SET GameID=A.GameID,NickName=A.NickName,FaceUrl=A.CustomID,FaceID=A.FaceID,Gender=A.Gender,UnderWrite=A.UnderWrite 
	FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) AS A WHERE WHQJNativeWebDB.dbo.CacheWealthRank.DateID=@DateID AND WHQJNativeWebDB.dbo.CacheWealthRank.UserID=A.UserID

	-- �޸�ͷ����Ϣ
	UPDATE WHQJNativeWebDB.dbo.CacheWealthRank SET FaceUrl=A.FaceUrl
	FROM WHQJAccountsDB.dbo.AccountsFace(NOLOCK) AS A WHERE WHQJNativeWebDB.dbo.CacheWealthRank.DateID=@DateID AND WHQJNativeWebDB.dbo.CacheWealthRank.FaceUrl=A.ID

END
GO