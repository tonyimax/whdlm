----------------------------------------------------------------------------------------------------
-- ��Ȩ��2011
-- ʱ�䣺2012-02-23
-- ��;����̨������ѯ
----------------------------------------------------------------------------------------------------

USE WHQJAccountsDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_Batch_GetUserInfo') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_Batch_GetUserInfo
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

----------------------------------------------------------------------------------------------------

CREATE PROCEDURE NET_Batch_GetUserInfo
	@dwUserID		INT,					-- �û�I D
	@dwGameID		INT,					-- ��ϷI D
	@dwAgentID		INT,					-- ����I D
	@dwAccounts		NVARCHAR(32),			-- �û��˺�
	@dwNickName		NVARCHAR(32)			-- �û��ǳ�
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- ִ���߼�
BEGIN
	IF @dwUserID>0
	BEGIN
		SELECT UserID,GameID,SpreaderID,Accounts,NickName,FaceID,CustomID,AgentID FROM AccountsInfo(NOLOCK) WHERE UserID=@dwUserID
	END
	ELSE IF @dwGameID>0
	BEGIN
		SELECT UserID,GameID,SpreaderID,Accounts,NickName,FaceID,CustomID,AgentID FROM AccountsInfo(NOLOCK) WHERE GameID=@dwGameID
	END
	ELSE IF @dwAgentID>0
	BEGIN
		SELECT UserID,GameID,SpreaderID,Accounts,NickName,FaceID,CustomID,AgentID FROM AccountsInfo(NOLOCK) WHERE AgentID=@dwAgentID
	END
	ELSE IF @dwAccounts!=''
	BEGIN
		SELECT UserID,GameID,SpreaderID,Accounts,NickName,FaceID,CustomID,AgentID FROM AccountsInfo(NOLOCK) WHERE Accounts=@dwAccounts
	END
	ELSE IF @dwNickName!=''
	BEGIN
		SELECT UserID,GameID,SpreaderID,Accounts,NickName,FaceID,CustomID,AgentID FROM AccountsInfo(NOLOCK) WHERE NickName=@dwNickName
	END
END

RETURN 0

GO