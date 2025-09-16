/*********************************************************************************
*      Function:  WEB_PageView_UserList											     *
*      Description:                                                              *
*             Sql2008��ҳ�洢����												 *
*      Finish DateTime:                                                          *
*             2018/6/8														     *          
*********************************************************************************/
USE WHQJAccountsDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WEB_PageView_UserList]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WEB_PageView_UserList]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.WEB_PageView_UserList
	@TableName		NVARCHAR(50),			-- ����
	@ReturnFields	NVARCHAR(200) = '*',	-- ��ѯ����
	@PageSize		INT = 10,				-- ÿҳ��Ŀ
	@PageIndex		INT = 1,				-- ��ǰҳ��
	@Where			NVARCHAR(500) = '',		-- ��ѯ����
	@Order			NVARCHAR(100),			-- �����ֶ�
	@PageCount		INT OUTPUT,				-- ҳ������
	@RecordCount	INT OUTPUT	        	-- ��¼����
WITH ENCRYPTION AS

--��������
SET NOCOUNT ON

-- ��������
DECLARE @TotalRecord INT
DECLARE @TotalPage INT
DECLARE @CurrentPageSize INT
DECLARE @TotalRecordForPageIndex INT
CREATE TABLE #Tb_UserPage_Cache
(
	UserID INT,
	GameID INT,
	SpreaderID INT,
	Accounts NVARCHAR(32),
	NickName NVARCHAR(32),
	Gender TINYINT,
	Nullity TINYINT,
	GameLogonTimes INT,
	LastLogonIP NVARCHAR(15),
	LastLogonDate DATETIME,
	RegisterIP NVARCHAR(15),
	RegisterDate DATETIME,
	RegisterOrigin TINYINT,
	UserRight INT,
	RowID INT
)

BEGIN
	IF @Where IS NULL SET @Where=N''
	
	-- ��¼����
	DECLARE @countSql NVARCHAR(4000)  
	
	IF @RecordCount IS NULL
	BEGIN
		SET @countSql='SELECT @TotalRecord=Count(*) FROM AccountsInfo(NOLOCK) '+@Where
		EXECUTE sp_executesql @countSql,N'@TotalRecord int out',@TotalRecord OUT
	END
	ELSE
	BEGIN
		SET @TotalRecord=@RecordCount
	END		
	
	SET @RecordCount=@TotalRecord
	SET @TotalPage=(@TotalRecord-1)/@PageSize+1	
	SET @CurrentPageSize=(@PageIndex-1)*@PageSize

	-- ������ҳ�����ܼ�¼��
	SET @PageCount=@TotalPage
	SET @RecordCount=@TotalRecord
	IF @PageCount IS NULL SET @PageCount = 0
	IF @RecordCount IS NULL SET @RecordCount = 0

	-- ���ؼ�¼
	SET @TotalRecordForPageIndex=@PageIndex*@PageSize
	
	INSERT INTO #Tb_UserPage_Cache EXEC ('SELECT * FROM (SELECT TOP '+@TotalRecordForPageIndex+
			' UserID,GameID,SpreaderID,Accounts,NickName,Gender,Nullity,GameLogonTimes,LastLogonIP,LastLogonDate,RegisterIP,RegisterDate,RegisterOrigin,UserRight,
			ROW_NUMBER() OVER ('+@Order+') AS PageView_RowNo
			FROM AccountsInfo(NOLOCK) ' + @Where +' ) AS TempPageViewTable
			WHERE TempPageViewTable.PageView_RowNo > '+ @CurrentPageSize)

	EXEC ('SELECT * FROM #Tb_UserPage_Cache')
	EXEC ('SELECT UserID,GameID,NickName FROM AccountsInfo(NOLOCK) WHERE UserID IN(SELECT SpreaderID FROM #Tb_UserPage_Cache WHERE SpreaderID>0)')
	EXEC ('SELECT UserID,AgentID FROM WHQJAgentDB.dbo.AgentBelowInfo(NOLOCK) WHERE UserID IN(SELECT UserID FROM #Tb_UserPage_Cache)')
	EXEC ('SELECT AgentID,GameID,NickName FROM AccountsInfo(NOLOCK) WHERE AgentID IN(SELECT AgentID FROM WHQJAgentDB.dbo.AgentBelowInfo(NOLOCK) WHERE UserID IN(SELECT UserID FROM #Tb_UserPage_Cache))')
	
	DROP TABLE #Tb_UserPage_Cache
END
RETURN 0
GO
