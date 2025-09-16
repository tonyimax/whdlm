----------------------------------------------------------------------
-- �汾��2018
-- ʱ�䣺2018-07-04
-- ��;�����а��ܽ����������賿2��ִ�У�
----------------------------------------------------------------------
USE [WHQJNativeWebDB]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[NET_PJ_WeekRankAward]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[NET_PJ_WeekRankAward]
GO

----------------------------------------------------------------------
CREATE PROC [NET_PJ_WeekRankAward]

WITH ENCRYPTION AS

-- ��������

DECLARE @TimeNow DATETIME
DECLARE @WeekDay INT
DECLARE @DateID INT
DECLARE @DateEndID INT
DECLARE @DateStartID INT


-- ִ���߼�
BEGIN

	-- ��ȡʱ����Ϣ
	SET @TimeNow = GETDATE()
	SET @WeekDay = DATEPART(dw,@TimeNow)
	SET @DateID = CAST(CAST(@TimeNow AS FLOAT) AS INT)

	-- �����ǰʱ��Ϊ�������򷢽�
	IF @WeekDay=1
	BEGIN
		-- ��ͳ��ʱ��
		SET @DateEndID = CAST(CAST(DATEADD(DAY,-1,@TimeNow) AS FLOAT) AS INT)
		SET @DateStartID = CAST(CAST(DATEADD(DAY,-7,@TimeNow) AS FLOAT) AS INT)

		-- ͳ����ʤ�����а�100��
		INSERT INTO CacheRankAward(DateID,UserID,TypeID,RankNum,RankValue) 
		SELECT TOP 100 @DateID AS DateID,UserID,2 AS TypeID,ROW_NUMBER() OVER(ORDER BY SUM(WinCount) DESC) AS RankNum,SUM(WinCount) AS RankValue FROM CacheGameRank(NOLOCK) 
		WHERE DateID>=@DateStartID AND DateID<=@DateEndID GROUP BY UserID 

		-- ͳ���ܲƸ����а�100��
		--INSERT INTO CacheRankAward(DateID,UserID,TypeID,RankNum,RankValue) 
		--SELECT TOP 100 @DateID AS DateID,UserID,1 AS TypeID,ROW_NUMBER() OVER(ORDER BY SUM(Gold) DESC) AS RankNum,SUM(Gold) AS RankValue FROM CacheWealthRank(NOLOCK) 
		--WHERE DateID>=@DateStartID AND DateID<=@DateEndID GROUP BY UserID 

		-- �޸��û���Ϣ
		UPDATE CacheRankAward SET GameID=A.GameID,NickName=A.NickName,FaceUrl=A.CustomID,FaceID=A.FaceID 
		FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) AS A WHERE CacheRankAward.DateID=@DateID AND CacheRankAward.UserID=A.UserID

		UPDATE CacheRankAward SET FaceUrl=A.FaceUrl
		FROM WHQJAccountsDB.dbo.AccountsFace(NOLOCK) AS A WHERE CacheRankAward.DateID=@DateID AND CacheRankAward.FaceUrl=A.ID

		-- ���з�������
		-- �����α�
		DECLARE M_CURSOR CURSOR SCROLL FOR
		SELECT UserID,TypeID,RankNum FROM CacheRankAward(NOLOCK) WHERE DateID=@DateID ORDER BY TypeID 
		-- �����α�
		OPEN M_CURSOR
		DECLARE @UserID INT,@TypeID TINYINT,@RankNum INT,@Gold BIGINT,@Diamond INT,@RankType INT,@AwardTicket INT,@CurGold BIGINT,@CurInsureGold BIGINT,@CurDiamond BIGINT,@CurAwardTicket INT
		-- ������ݣ���������
		FETCH NEXT FROM M_CURSOR INTO @UserID,@TypeID,@RankNum
		WHILE @@FETCH_STATUS=0
		BEGIN
			-- �������ʹ���
			IF @RankNum<4 SET @RankType=@RankNum
			IF @RankNum>=4 AND @RankNum<=10 SET @RankType=4
			IF @RankNum>=11 AND @RankNum<=20 SET @RankType=5
			IF @RankNum>=21 AND @RankNum<=50 SET @RankType=6
			IF @RankNum>=51 AND @RankNum<=100 SET @RankType=7
			
			--��ѯ�˻���Ϣ
			SELECT @CurGold=Score,@CurInsureGold=InsureScore FROM WHQJTreasureDB.dbo.GameScoreInfo(NOLOCK) WHERE UserID=@UserID
			SELECT @CurDiamond=Diamond,@CurAwardTicket=AwardTicket FROM WHQJTreasureDB.dbo.UserCurrency  WHERE UserID=@UserID
			IF @CurGold IS NULL SET @CurGold=0
			IF @CurInsureGold IS NULL SET @CurInsureGold=0
			IF @CurDiamond IS NULL SET @CurDiamond=0
			IF @CurAwardTicket IS NULL SET @CurAwardTicket=0
			
			--��ֵ����
			SET @Gold=0
			SET @Diamond=0
			SET @AwardTicket=0
			-- ��ѯ��������
			SELECT @Gold=Gold,@Diamond=Diamond,@AwardTicket=AwardTicket FROM RankingConfig(NOLOCK) WHERE TypeID=@TypeID AND RankType=@RankType
			IF @Gold IS NULL SET @Gold=0
			IF @Diamond IS NULL SET @Diamond=0
			IF @AwardTicket IS NULL SET @AwardTicket=0
			
			-- �޸�����
			UPDATE CacheRankAward SET Gold=@Gold,Diamond=@Diamond,AwardTicket=@AwardTicket WHERE DateID=@DateID AND UserID=@UserID AND TypeID=@TypeID AND RankNum=@RankNum
			IF @Gold>0
			BEGIN
				IF EXISTS(SELECT UserID FROM WHQJTreasureDB.dbo.GameScoreInfo(NOLOCK) WHERE UserID=@UserID)
				BEGIN
					UPDATE WHQJTreasureDB.dbo.GameScoreInfo SET Score=Score+@Gold WHERE UserID=@UserID
				END
				ELSE
				BEGIN
					INSERT INTO WHQJTreasureDB.dbo.GameScoreInfo(UserID,Score) VALUES(@UserID,@Gold)
				END
				INSERT INTO WHQJRecordDB.DBO.RecordTreasureSerial
			  (SerialNumber,MasterID,UserID,TypeID,CurScore,CurInsureScore,ChangeScore,ClientIP,CollectDate)
			  VALUES(dbo.WF_GetSerialNumber(), 0, @UserID, 17, @CurGold, @CurInsureGold, @Gold, '', @TimeNow)
			END
			IF @Diamond>0
			BEGIN
				IF EXISTS(SELECT UserID FROM WHQJTreasureDB.dbo.UserCurrency(NOLOCK) WHERE UserID=@UserID)
				BEGIN
					UPDATE WHQJTreasureDB.dbo.UserCurrency SET Diamond=Diamond+@Diamond WHERE UserID=@UserID
				END
				ELSE
				BEGIN
					INSERT INTO WHQJTreasureDB.dbo.UserCurrency(UserID,Diamond) VALUES(@UserID,@Diamond)
				END
				
				 INSERT INTO WHQJRecordDB.DBO.RecordDiamondSerial
				(SerialNumber,MasterID,UserID,TypeID,CurDiamond,ChangeDiamond,ClientIP,CollectDate)
				VALUES(dbo.WF_GetSerialNumber(), 0, @UserID, 5, @CurDiamond, @Diamond, '', @TimeNow)
				
			END
			if @AwardTicket>0
			begin
			  IF EXISTS(SELECT UserID FROM WHQJTreasureDB.dbo.UserCurrency(NOLOCK) WHERE UserID=@UserID)
				BEGIN
					UPDATE WHQJTreasureDB.dbo.UserCurrency SET AwardTicket=AwardTicket+@AwardTicket WHERE UserID=@UserID
				END
				ELSE
				BEGIN
					INSERT INTO WHQJTreasureDB.dbo.UserCurrency(UserID,AwardTicket) VALUES(@UserID,@AwardTicket)
				END
				INSERT INTO WHQJRecordDB.dbo.RecordAwardTicketSerial(SerialNumber,MasterID,UserID,TypeID,CurAwardTicket,ChangeAwardTicket,ClientIP,CollectDate) 
				VALUES(dbo.WF_GetSerialNumber(),0,@UserID,3,@CurAwardTicket,@AwardTicket,'',@TimeNow)
			end

			-- �������
			FETCH NEXT FROM M_CURSOR INTO @UserID,@TypeID,@RankNum
		END
		-- �ر��α�
		CLOSE M_CURSOR
		-- �ͷ��α�
		DEALLOCATE M_CURSOR
	END

END
GO