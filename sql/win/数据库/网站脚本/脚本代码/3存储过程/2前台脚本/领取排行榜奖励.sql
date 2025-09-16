----------------------------------------------------------------------
-- �汾��2013
-- ʱ�䣺2013-04-22
-- ��;����ȡ���а���
----------------------------------------------------------------------
USE [WHQJNativeWebDB]
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[NET_PJ_RecevieRankingAward]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[NET_PJ_RecevieRankingAward]
GO

----------------------------------------------------------------------
CREATE PROC [NET_PJ_RecevieRankingAward]
	@dwUserID INT,
	@dwDateID INT,
	@dwTypeID INT,
	@strClientIP NVARCHAR(15),
	@strErrorDescribe NVARCHAR(127) OUTPUT	-- �����Ϣ
WITH ENCRYPTION AS

-- ��������
DECLARE @Nullity INT
DECLARE @Diamond INT
DECLARE @Score INT
DECLARE @AwardTicket int
DECLARE @BeforeDiamond BIGINT
DECLARE @BeforeAwardTicket BIGINT
DECLARE @ValidityTime DATETIME
DECLARE @ReceiveState BIT
DECLARE @DateTimeNow DATETIME
DECLARE @BeforeScore BIGINT
DECLARE @BeforeInsureScore BIGINT

-- ִ���߼�
BEGIN
	-- ��ȡ�û���Ϣ
	SELECT @Nullity=Nullity FROM WHQJAccountsDB.dbo.AccountsInfo WITH(NOLOCK) WHERE UserID=@dwUserID
	IF @Nullity IS NULL
	BEGIN
		SET @strErrorDescribe =N'��Ǹ,��ȡ�û�������'
		RETURN 1001
	END
	IF @Nullity=1
	BEGIN
		SET @strErrorDescribe =N'��Ǹ,��ȡ�û��Ѷ���'
		RETURN 1002
	END
	
	-- ��ȡ�û���ʯ��Ϣ
	SELECT @BeforeDiamond=Diamond,@BeforeAwardTicket=AwardTicket FROM WHQJTreasureDB.dbo.UserCurrency WHERE UserID=@dwUserID
	--��ȡ�û������Ϣ
	select @BeforeScore=Score ,@BeforeInsureScore=InsureScore from WHQJTreasureDB.dbo.GameScoreInfo where UserID=@dwUserID

	 if @BeforeScore is null
	 BEGIN
		SET @BeforeScore = 0
		INSERT INTO WHQJTreasureDB.dbo.GameScoreInfo(UserID,Score,InsureScore) VALUES(@dwUserID,0,0)
	END

	IF @BeforeDiamond IS NULL
	BEGIN
		SET @BeforeDiamond = 0
		INSERT INTO WHQJTreasureDB.dbo.UserCurrency(UserID,Diamond) VALUES(@dwUserID,0)
	END

	SET @DateTimeNow = GETDATE()

	-- ��ȡ���а�����Ϣ
	SELECT @Diamond=Diamond,@Score=Gold,@ReceiveState=ReceiveState,@AwardTicket=AwardTicket FROM [CacheRankAward] WITH(NOLOCK) WHERE DateID=@dwDateID AND UserID=@dwUserID AND TypeID=@dwTypeID
	IF @Diamond IS NULL
	BEGIN  
		SET @strErrorDescribe =N'��Ǹ,���������а���'
		RETURN 1003
	END
	IF @ReceiveState=1
	BEGIN
		SET @strErrorDescribe =N'��Ǹ,���а��������ظ���ȡ'
		RETURN 1003
	END
	--IF @ValidityTime< @DateTimeNow
	--BEGIN
	--	SET @strErrorDescribe =N'��Ǹ,���а����ѹ���'
	--	RETURN 1003
	--END

	-- �޸���ȡ״̬
	UPDATE [CacheRankAward] SET ReceiveState=1 WHERE DateID=@dwDateID AND UserID=@dwUserID AND TypeID=@dwTypeID
	IF @@ROWCOUNT <= 0
	BEGIN
		SET @strErrorDescribe=N'��Ǹ,���а�����ȡʧ�ܣ�'
		RETURN 6
	END
	if @Score>0
	begin
   --�޸���ȡ������Ϣ
	 update WHQJTreasureDB.dbo.GameScoreInfo set  Score=Score+@Score WHERE UserID=@dwUserID
   --д������ˮ
   INSERT INTO WHQJRecordDB.dbo.RecordTreasureSerial
      (SerialNumber,MasterID,UserID,TypeID,CurScore,CurInsureScore,ChangeScore,ClientIP,CollectDate)
    VALUES(dbo.WF_GetSerialNumber(), 0, @dwUserID, 9, @BeforeScore, @BeforeInsureScore, @Score, @strClientIP, GETDATE())
	end
	if @Diamond>0
	begin
	-- �޸���ȡ����ʯ��Ϣ
	UPDATE WHQJTreasureDB.dbo.UserCurrency SET Diamond=Diamond+@Diamond WHERE UserID=@dwUserID
	
	-- д����ʯ��ˮ��¼
	INSERT INTO WHQJRecordDB.dbo.RecordDiamondSerial(SerialNumber,MasterID,UserID,TypeID,CurDiamond,ChangeDiamond,ClientIP,CollectDate) 
	VALUES(dbo.WF_GetSerialNumber(),0,@dwUserID,5,@BeforeDiamond,@Diamond,@strClientIP,@DateTimeNow)
	end
	if @AwardTicket>0
	begin
	-- �޸���ȡ��ȯ��Ϣ
	UPDATE WHQJTreasureDB.dbo.UserCurrency SET AwardTicket=AwardTicket+@AwardTicket WHERE UserID=@dwUserID
	
	-- д�뽱ȯ��ˮ��¼
	  INSERT INTO WHQJRecordDB.dbo.RecordAwardTicketSerial(SerialNumber,MasterID,UserID,TypeID,CurAwardTicket,ChangeAwardTicket,ClientIP,CollectDate) 
		VALUES(dbo.WF_GetSerialNumber(),0,@dwUserID,3,@BeforeAwardTicket,@AwardTicket,@strClientIP,getdate())
	end

	-- �����ȡ����ʯ���ͽ���� 
	SELECT @dwUserID AS UserID,(@BeforeDiamond+@Diamond) AS Diamond,(@BeforeScore+@Score) as Score,(@BeforeAwardTicket+@AwardTicket) as AwardTicket
	SET @strErrorDescribe= N'��ϲ�����'+ CAST(@Diamond AS NVARCHAR(30)) +'��ʯ'+CAST(@AwardTicket AS NVARCHAR(30))+'��ȯ'+CAST(@Score AS NVARCHAR(30))+'������н���'

END
RETURN 0
GO
