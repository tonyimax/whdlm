----------------------------------------------------------------------------------------------------
-- ��Ȩ��2017
-- ʱ�䣺2017-10-11
-- ��;���û�������Ϸ
----------------------------------------------------------------------------------------------------

USE WHQJAccountsDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_PW_AddUserLoadGame') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PW_AddUserLoadGame
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

----------------------------------------------------------------------------------------------------

CREATE PROCEDURE NET_PW_AddUserLoadGame
	@dwUniteID		INT,    -- ��ʶ
	@dwTypeID		INT,    -- ��0 ͨ��  1 ���  2 ����
	@dwKindID		INT,	-- ��Ϸ��ʶ
	@dwSortID		INT		-- �����ʶ
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- ִ���߼�
BEGIN
	IF @dwTypeID=0
	BEGIN
		IF EXISTS(SELECT ID FROM AccountsGame(NOLOCK) WHERE TypeID=@dwTypeID AND KindID=@dwKindID)
		BEGIN
			RETURN 1001
		END
		INSERT INTO AccountsGame(UniteID,TypeID,KindID,SortID) VALUES(0,0,@dwKindID,@dwSortID)
	END
	ELSE
	BEGIN
		IF EXISTS(SELECT ID FROM AccountsGame(NOLOCK) WHERE UniteID=@dwUniteID AND TypeID=@dwTypeID AND KindID=@dwKindID)
		BEGIN
			RETURN 1001
		END
		INSERT INTO AccountsGame(UniteID,TypeID,KindID,SortID) VALUES(@dwUniteID,@dwTypeID,@dwKindID,@dwSortID)
	END
END

RETURN 0

GO


