USE WHQJAgentDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[NET_PB_RecordAgentAward]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[NET_PB_RecordAgentAward]
GO


SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

--------------------------------------------------------------------	
--
CREATE PROC [NET_PB_RecordAgentAward]
(
	@dwUserID			INT,					--�û���ʶ
	@dwReturnBase	INT,			-- ������׼
	@dwAwardType TINYINT,       -- �������ͣ�1����ֵ��������ʯ����2����Ϸ˰�շ�������ҡ�
  @strExtraField NVARCHAR(32),  --��չ�ֶΣ���ֵ������¼��ֵ����ֵ�����š�����Ϸ˰�շ�����¼����Ϸ����(��������)��

	@strErrorDescribe NVARCHAR(127) OUTPUT		--�����Ϣ
)

WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- �û���Ϣ
DECLARE @UserID INT
DECLARE @Nullity TINYINT
DECLARE @AboveAgentID INT


BEGIN
	-- ������֤
	IF @dwReturnBase<=0
	BEGIN
		SET @strErrorDescribe=N'��Ǹ����û�пɷ������'
		RETURN 1001
	END

	-- ��ѯ�û�	
	SELECT @UserID=UserID,@Nullity=Nullity FROM WHQJAccountsDB.DBO.AccountsInfo WITH(NOLOCK) WHERE UserID=@dwUserID

	-- �û�����
	IF @UserID IS NULL
	BEGIN
		SET @strErrorDescribe=N'��Ǹ�������ʺŲ����ڣ�'
		RETURN 1001
	END	

	-- �ʺŽ�ֹ
	IF @Nullity=1
	BEGIN
		SET @strErrorDescribe=N'��Ǹ�������ʺ��Ѷ��ᣡ'
		RETURN 1002
	END	

  SELECT @AboveAgentID = AgentID FROM AgentBelowInfo WHERE UserID = @dwUserID

  IF @AboveAgentID = 0 
  BEGIN
    SET @strErrorDescribe=N'��Ǹ���ʺ�δ�������޽�������'
    RETURN 1003
  END

  DECLARE @AgentAwardType TINYINT
  SELECT @AgentAwardType=StatusValue FROM WHQJAgentDB.DBO.SystemStatusInfo WHERE StatusName = N'AgentAwardType'
  IF @AgentAwardType IS NULL 
  BEGIN
    -- ������ʱ Ĭ�ϲ�����
    SET @AgentAwardType = 0
  END
  IF @AgentAwardType & @dwAwardType <> @dwAwardType
  BEGIN
    SET @strErrorDescribe=N'��Ǹ���÷���ģʽδ����'
    RETURN 1004
  END
	
    -- ������ڷ������ã�д�뷵����¼
	IF EXISTS (SELECT 1 FROM ReturnAwardConfig WHERE Nullity = 0 AND AwardType = @dwAwardType)
	BEGIN

    DECLARE @DateTime DateTime
	DECLARE @DateID INT
	DECLARE @I INT
	DECLARE @PUserID INT
	DECLARE @AwardScale DECIMAL(18,6)
	DECLARE @AwardValue BIGINT
    SET @DateTime = GETDATE()
	SET @DateID = CAST(CAST(@DateTime AS FLOAT) AS INT)

	SELECT LevelID,UserID INTO #Tb_AgentAbove_Cache FROM [dbo].[WF_GetAgentAboveAgent](@AboveAgentID) ORDER BY LevelID ASC
	SELECT @I=COUNT(UserID) FROM #Tb_AgentAbove_Cache
	IF @I>3 SET @I=3
	IF @I=0
	BEGIN
		SET @strErrorDescribe=N'��Ǹ���޷�������'
		RETURN 1005
	END
	WHILE @I>0
	BEGIN
		SELECT @PUserID=UserID FROM #Tb_AgentAbove_Cache WHERE LevelID=@I
		
		--�����˺ű����ã�ȡ�����ķ���
		IF EXISTS(SELECT * FROM dbo.AgentInfo WHERE UserID=@PUserID AND Nullity=1)
		CONTINUE;
		
		SELECT @AwardScale=AwardScale FROM ReturnAwardConfig(NOLOCK) WHERE AwardType=@dwAwardType AND AwardLevel=@I AND Nullity=0
		IF @AwardScale IS NULL SET @AwardScale=0
		SET @AwardValue = CAST((@dwReturnBase*@AwardScale) AS BIGINT)
		INSERT INTO ReturnAwardRecord(SourceUserID,TargetUserID,ReturnBase,Awardlevel,AwardScale,Award,AwardType,CollectDate,ExtraField) 
		VALUES(@UserID,@PUserID,@dwReturnBase,@I,@AwardScale,@AwardValue,@dwAwardType,@DateTime,@strExtraField)

		IF EXISTS(SELECT DateID FROM ReturnAwardSteam(NOLOCK) WHERE DateID=@DateID AND UserID=@PUserID AND AwardType=@dwAwardType AND AwardLevel=@I)
		BEGIN
			UPDATE ReturnAwardSteam SET Award=Award+@AwardValue,UpdateTime=@DateTime WHERE DateID=@DateID AND UserID=@PUserID AND AwardType=@dwAwardType AND AwardLevel=@I
		END
		ELSE
		BEGIN
			INSERT INTO ReturnAwardSteam VALUES(@DateID,@PUserID,@dwAwardType,@I,@AwardValue,@DateTime,@DateTime)
		END
		IF @dwAwardType=1
		BEGIN
			UPDATE AgentInfo SET DiamondAward=DiamondAward+@AwardValue WHERE UserID=@PUserID
		END
		ELSE
		BEGIN
			UPDATE AgentInfo SET GoldAward=GoldAward+@AwardValue WHERE UserID=@PUserID
		END
		SET @I=@I-1
	END

	END

END
RETURN 0
GO