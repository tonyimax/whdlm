----------------------------------------------------------------------------------------------------
-- ��Ȩ��2013
-- ʱ�䣺2013-07-31
-- ��;�����ⷴ��
----------------------------------------------------------------------------------------------------
USE [WHQJNativeWebDB]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].WSP_PW_BuyAward') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].WSP_PW_BuyAward
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

----------------------------------------------------------------------------------------------------
-- ������Ʒ
CREATE PROCEDURE WSP_PW_BuyAward
	@UserID	INT,					-- �û���ʶ
	@GameID INT,					-- �����Ϸid
	@AwardID INT,					-- ��Ʒ��ʶ
	@AwardType INT,					-- ��Ʒ���ͱ�ʶ
	@AwardName nvarchar(20),		-- ��Ʒ����
	@AwardPrice INT,				-- ��Ʒ�۸�
	@AwardCount INT,				-- ��������
	@TotalAmount INT,				-- �ܽ��
	@Gold INT,				        -- �һ���Ϸ��ֵ(����)
	@Diamond INT,				    -- �һ���ʯֵ��������
	@Compellation NVARCHAR(16),		-- ��ʵ����
	@MobilePhone NVARCHAR(16),		-- �ֻ�����
	@Province NVARCHAR(16),					-- ʡ��
	@City NVARCHAR(16),						-- ����
	@Area NVARCHAR(16),						-- ����
	@DwellingPlace NVARCHAR(128),	-- ��ϸ��ַ
	@BuyIP NVARCHAR(15),			-- ����IP                     
	@OrderID nvarchar(128),			-- ��������	
	@strErrorDescribe NVARCHAR(127) OUTPUT	-- �����Ϣ
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- �˻���Ϣ
DECLARE @AwardTicket INT
DECLARE @SumGold BIGINT
DECLARE @SumDiamond BIGINT
DECLARE @BeforeScore BIGINT
DECLARE @BeforeDiamond BIGINT
declare @BeforeInsure BIGINT
--

-- ִ���߼�
BEGIN
	-- ��֤�û�
	SELECT @UserID=UserID FROM [WHQJAccountsDB].dbo.AccountsInfo 
	WHERE UserID=@UserID
	select @AwardTicket=isnull(AwardTicket,0) from [WHQJTreasureDB].dbo.UserCurrency where Userid=@UserID

	IF @UserID IS NULL
	BEGIN
		SET @strErrorDescribe='�û�������'
		RETURN 101
	END

	-- ��֤����
	IF @TotalAmount <= 0
	BEGIN
		SET @strErrorDescribe='�һ�ʧ�ܣ�֧��Ԫ�����쳣'
		RETURN 101
	END

	IF @TotalAmount>@AwardTicket
	BEGIN
		SET @strErrorDescribe='�һ�ʧ�ܣ���ȯ������'
		RETURN 101
	END
	 --�һ���ƷΪ����
	if @AwardType=1
	 begin
	 -- �һ���Ϸ��
	    if @Gold>0
		 begin
		 SELECT @BeforeScore = Score, @BeforeInsure=InsureScore FROM WHQJTreasureDB.DBO.GameScoreInfo(NOLOCK) WHERE UserID = @UserID
		IF @BeforeScore IS NULL 
		BEGIN
			INSERT WHQJTreasureDB.DBO.GameScoreInfo (UserID,Score,InsureScore) VALUES (@UserID,0,0)
			SET @BeforeScore = 0
			set @BeforeInsure=0
		END
		 SET @SumGold=@Gold*@AwardCount
		    update [WHQJTreasureDB].dbo.GameScoreInfo SET score=score+@SumGold WHERE UserID=@UserID
      ----�����ˮ
	    INSERT INTO WHQJRecordDB.dbo.RecordTreasureSerial
			(SerialNumber,MasterID,UserID,TypeID,CurScore,CurInsureScore,ChangeScore,ClientIP,CollectDate)
		VALUES(dbo.WF_GetSerialNumber(), 0, @UserID, 5, @BeforeScore, @BeforeInsure, @SumGold, @BuyIP, getdate())

		 end


		  -- �һ���ʯ
	    if @Diamond>0
		 begin
		 SELECT @BeforeDiamond =Diamond FROM WHQJTreasureDB.DBO.UserCurrency(NOLOCK) WHERE UserID = @UserID
		IF @BeforeDiamond IS NULL 
		BEGIN
			INSERT WHQJTreasureDB.DBO.UserCurrency (UserID,Diamond,AwardTicket) VALUES (@UserID,0,0)
			SET @BeforeDiamond = 0
		END
		 SET @SumDiamond=@Diamond*@AwardCount
		    update [WHQJTreasureDB].dbo.UserCurrency SET Diamond=Diamond+@SumDiamond WHERE UserID=@UserID
      ----��ʯ��ˮ
	    INSERT INTO WHQJRecordDB.dbo.RecordDiamondSerial(SerialNumber,MasterID,UserID,TypeID,CurDiamond,ChangeDiamond,ClientIP,CollectDate) 
		VALUES(dbo.WF_GetSerialNumber(),0,@UserID,12,@BeforeDiamond,@SumDiamond,@BuyIP,getdate())

		 end
	 end


	-- ���½���
	--BEGIN TRAN
	UPDATE [WHQJTreasureDB].dbo.UserCurrency SET AwardTicket=AwardTicket-@TotalAmount

	WHERE UserID=@UserID
	
	-- ���붩��
	INSERT INTO AwardOrder(OrderID,AwardID,UserID,GameID,AwardType,AwardName,UnitPrice,BuyNum,PayTicket,Gold,Diamond,Compellation,
		MobilePhone,Province,City,Area,DetailAddress,ClinetIP)
	VALUES(@OrderID,@AwardID,@UserID,@GameID,@AwardType,@AwardName,@AwardPrice,@AwardCount,@TotalAmount,@Gold,@Diamond,@Compellation,
		@MobilePhone,@Province,@City,@Area,@DwellingPlace,@BuyIP)

    ----��ȯ��ˮ
	  
	    INSERT INTO WHQJRecordDB.dbo.RecordAwardTicketSerial(SerialNumber,MasterID,UserID,TypeID,CurAwardTicket,ChangeAwardTicket,ClientIP,CollectDate) 
		VALUES(dbo.WF_GetSerialNumber(),0,@UserID,10,@AwardTicket,0-@TotalAmount,@BuyIP,getdate())


	SELECT @OrderID AS OrderID
		
	--���½�Ʒ
	if @AwardType<>1
	UPDATE AwardInfo SET Inventory=Inventory-@AwardCount WHERE AwardID=@AwardID
	--COMMIT TRAN
	
	RETURN 0
END
RETURN 0
GO