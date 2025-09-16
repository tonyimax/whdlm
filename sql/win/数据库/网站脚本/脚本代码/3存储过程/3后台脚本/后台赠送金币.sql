----------------------------------------------------------------------
-- ʱ�䣺2010-03-16
-- ��;�����ͽ��
----------------------------------------------------------------------

USE WHQJTreasureDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WSP_PM_GrantTreasure]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WSP_PM_GrantTreasure]
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO
----------------------------------------------------------------------

CREATE PROCEDURE WSP_PM_GrantTreasure
	@MasterID INT,				-- ����Ա��ʶ
	@ClientIP VARCHAR(15),		-- ���͵�ַ
	@UserID INT,				-- �û���ʶ
	@AddGold BIGINT,			-- ���ͽ��
	@Reason NVARCHAR(32)		-- ���ͱ�ע	
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- �û������Ϣ
DECLARE @CurScore BIGINT
DECLARE @CurInsureScore BIGINT
DECLARE @Nullity TINYINT
DECLARE @DateTime DATETIME
DECLARE @RegisterIP NVARCHAR(15)
DECLARE @RegisterDate DATETIME
DECLARE @RegisterMachine NVARCHAR(32)
DECLARE @InsureScore BIGINT

-- ִ���߼�
BEGIN
	-- �û���֤
	SELECT @Nullity=Nullity,@RegisterIP=RegisterIP,@RegisterDate=RegisterDate,@RegisterMachine=RegisterMachine FROM WHQJAccountsDB.dbo.AccountsInfo WITH(NOLOCK) WHERE UserID = @UserID
	IF @Nullity IS NULL OR @Nullity = 1
	BEGIN
		RETURN 1001
	END
	
	--�ж��Ƿ��ڷ��������Ϸ��
	IF EXISTS(SELECT * FROM GameScoreLocker WHERE UserID=@UserID)
	BEGIN
		RETURN 1001
	END
	
	-- ��ȡ�û���ʯ
	SELECT @CurScore=Score,@CurInsureScore=InsureScore FROM GameScoreInfo WHERE UserID = @UserID
	IF @AddGold <=0  
	BEGIN
	  if @CurScore IS NULL
	   begin
		RETURN 1002
	   end
	   else if abs(@AddGold)>@CurScore
	   begin
	     RETURN 1003
	   end
	END

	IF @CurScore IS NULL
	BEGIN
		INSERT INTO GameScoreInfo(UserID,Score,InsureScore,RegisterIP,RegisterDate,RegisterMachine) VALUES(@UserID,@AddGold,0,@RegisterIP,@RegisterDate,@RegisterMachine)
	END
	ELSE
	BEGIN
		UPDATE GameScoreInfo SET Score = Score+@AddGold WHERE UserID=@UserID
	END



	-- д�����ͼ�¼
	SET @DateTime = GETDATE()
	INSERT INTO WHQJRecordDB.dbo.RecordGrantTreasure(MasterID,ClientIP,CollectDate,UserID,CurGold,AddGold,Reason) VALUES(@MasterID,@ClientIP,@DateTime,@UserID,@CurScore,@AddGold,@Reason)
	-- д����ˮ��¼
	INSERT INTO WHQJRecordDB.dbo.RecordTreasureSerial(SerialNumber,MasterID,UserID,TypeID,CurScore,CurInsureScore,ChangeScore,ClientIP,CollectDate) 
	VALUES(dbo.WF_GetSerialNumber(),@MasterID,@UserID,0,@CurScore,@CurInsureScore,@AddGold,@ClientIP,@DateTime)

END
RETURN 0

