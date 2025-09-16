----------------------------------------------------------------------
-- 时间：2010-03-16
-- 用途：赠送勋章
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
	@MasterID INT,				-- 管理员标识
	@ClientIP VARCHAR(15),		-- 赠送地址
	@GroupID INT,				-- 亲友圈ID
	@AddMedal BIGINT,			-- 赠送勋章
	@strErrorDescribe NVARCHAR(127)	OUTPUT		-- 输出信息
WITH ENCRYPTION AS

-- 属性设置
SET NOCOUNT ON

-- 用户金币信息
DECLARE @CurMedal BIGINT
DECLARE @Nullity TINYINT
DECLARE @CanUseMedal TINYINT
DECLARE @DateTime DATETIME

-- 执行逻辑
BEGIN
	-- 用户验证
	SELECT  @Nullity=GroupStatus,@CanUseMedal=CanUseMedal FROM dbo.IMGroupProperty WHERE GroupID=@GroupID 
	IF @Nullity IS NULL 
	BEGIN
		SET @strErrorDescribe = N'抱歉，亲友圈不存在！'
		RETURN 1001
	END
	
	IF  @Nullity = 0
	BEGIN
		SET @strErrorDescribe = N'抱歉，亲友圈已禁用！'
		RETURN 1001
	END
	
	IF @CanUseMedal IS NULL OR @CanUseMedal<1
	BEGIN
		SET @strErrorDescribe = N'抱歉，勋章模式未开启！'
		RETURN 1002
	END
	
	SELECT @CurMedal=Score FROM dbo.IMGroupWealth WHERE GroupID=@GroupID
	IF @AddMedal<=0
	BEGIN
		IF @CurMedal IS NULL
		BEGIN
			SET @strErrorDescribe = N'抱歉，账户不存在！'
			RETURN 1003
		END
		ELSE IF ABS(@AddMedal)>@CurMedal
		BEGIN
			SET @strErrorDescribe = N'抱歉，勋章余额不足以扣除！'
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

