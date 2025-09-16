----------------------------------------------------------------------
-- ʱ�䣺2018-8-14
-- ��;�����ͽ�ȯ
----------------------------------------------------------------------

USE WHQJTreasureDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WSP_PM_GrantAwardTicket]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WSP_PM_GrantAwardTicket]
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO
----------------------------------------------------------------------

CREATE PROCEDURE WSP_PM_GrantAwardTicket
	@MasterID INT,				-- ����Ա��ʶ
	@ClientIP VARCHAR(15),		-- ���͵�ַ
	@UserID INT,				-- �û���ʶ
	@AddAwardTicket BIGINT,			-- ���ͽ�ȯ
	@TypeID INT,				-- ��¼����
	@CollectNote NVARCHAR(32)	-- ���ͱ�ע	
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- �û���ȯ��Ϣ
DECLARE @CurAwardTicket BIGINT
DECLARE @Nullity TINYINT
DECLARE @DateTime DATETIME

-- ִ���߼�
BEGIN
	-- �û���֤
	SELECT @Nullity=Nullity FROM WHQJAccountsDB.dbo.AccountsInfo WITH(NOLOCK) WHERE UserID = @UserID
	IF @Nullity IS NULL
	BEGIN
		RETURN 1001
	END
	IF @Nullity = 1
	BEGIN
		RETURN 1001
	END

	-- ��ȡ�û���ʯ
	SELECT @CurAwardTicket=AwardTicket FROM UserCurrency WHERE UserID = @UserID
	IF @AddAwardTicket <=0  
	BEGIN
	  if @CurAwardTicket IS NULL
	   begin
		RETURN 1001
	   end
	   else if abs(@AddAwardTicket)>@CurAwardTicket
	   begin
	     RETURN 1001
	   end
	END

	IF @CurAwardTicket IS NULL
	BEGIN
		SET @CurAwardTicket = 0
		INSERT INTO UserCurrency(UserID,AwardTicket) VALUES(@UserID,@AddAwardTicket)
	END
	ELSE
	BEGIN
		UPDATE UserCurrency SET AwardTicket = AwardTicket + @AddAwardTicket WHERE UserID=@UserID
	END

	SET @DateTime = GETDATE()
	INSERT INTO WHQJRecordDB.dbo.RecordGrantAwardTicket(MasterID,UserID,TypeID,CurAwardTicket,AddAwardTicket,ClientIP,CollectDate,CollectNote) 
	VALUES(@MasterID,@UserID,@TypeID,@CurAwardTicket,@AddAwardTicket,@ClientIP,@DateTime,@CollectNote)

	 ----��ȯ��ˮ
	    INSERT INTO WHQJRecordDB.dbo.RecordAwardTicketSerial(SerialNumber,MasterID,UserID,TypeID,CurAwardTicket,ChangeAwardTicket,ClientIP,CollectDate) 
		VALUES(dbo.WF_GetSerialNumber(),0,@UserID,0,@CurAwardTicket,@AddAwardTicket,@ClientIP,getdate())

END
RETURN 0

