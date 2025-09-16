----------------------------------------------------------------------
-- ʱ�䣺2010-03-16
-- ��;������ѫ��
----------------------------------------------------------------------

USE WHQJGroupDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WSP_PM_GrantMedal]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WSP_PM_GrantMedal]
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO
----------------------------------------------------------------------

CREATE PROCEDURE WSP_PM_GrantMedal
	@MasterID INT,				-- ����Ա��ʶ
	@ClientIP VARCHAR(15),		-- ���͵�ַ
	@GroupID INT,				-- ����ȦID
	@AddMedal BIGINT,			-- ����ѫ��
	@strErrorDescribe NVARCHAR(127)	OUTPUT		-- �����Ϣ
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- �û������Ϣ
DECLARE @CurMedal BIGINT
DECLARE @Nullity TINYINT
DECLARE @CanUseMedal TINYINT
DECLARE @DateTime DATETIME

-- ִ���߼�
BEGIN
	-- �û���֤
	SELECT  @Nullity=GroupStatus,@CanUseMedal=CanUseMedal FROM dbo.IMGroupProperty WHERE GroupID=@GroupID 
	IF @Nullity IS NULL 
	BEGIN
		SET @strErrorDescribe = N'��Ǹ������Ȧ�����ڣ�'
		RETURN 1001
	END
	
	IF  @Nullity = 0
	BEGIN
		SET @strErrorDescribe = N'��Ǹ������Ȧ�ѽ��ã�'
		RETURN 1001
	END
	
	IF @CanUseMedal IS NULL OR @CanUseMedal<1
	BEGIN
		SET @strErrorDescribe = N'��Ǹ��ѫ��ģʽδ������'
		RETURN 1002
	END
	
	SELECT @CurMedal=Score FROM dbo.IMGroupWealth WHERE GroupID=@GroupID
	IF @AddMedal<=0
	BEGIN
		IF @CurMedal IS NULL
		BEGIN
			SET @strErrorDescribe = N'��Ǹ���˻������ڣ�'
			RETURN 1003
		END
		ELSE IF ABS(@AddMedal)>@CurMedal
		BEGIN
			SET @strErrorDescribe = N'��Ǹ��ѫ�������Կ۳���'
			RETURN 1004
		END
	END
	
	IF @CurMedal IS NULL
	BEGIN
		INSERT INTO dbo.IMGroupWealth( GroupID ,Ingot ,ConsumeIngot ,BattleCreate ,Score)VALUES(@GroupID,0,0,0,@AddMedal)
	END
	ELSE
	BEGIN
		UPDATE dbo.IMGroupWealth SET Score=Score+@AddMedal WHERE GroupID=@GroupID
	END
	
	INSERT INTO dbo.RecordGroupScoreChange( GroupID ,BeforeScore ,ChangeType ,ChangeScore ,AfterScore ,CollectDate)
	VALUES  ( @GroupID ,@CurMedal ,2 , @AddMedal , @CurMedal+@AddMedal , GETDATE())
	
END
RETURN 0

