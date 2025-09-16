/*********************************************************************************
*      Function:  WEB_PageView_ScoreBattle									     *
*      Description:                                                              *
*             Sql2008��ҳ�洢����												 *
*      Finish DateTime:                                                          *
*             2018/6/8														     *          
*********************************************************************************/
USE WHQJPlatformDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WEB_PageView_ScoreBattle]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WEB_PageView_ScoreBattle]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.WEB_PageView_ScoreBattle
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
CREATE TABLE #Tb_ScoreBattle_Cache
(
	UserID INT,
	ServerID INT,
	RoomID INT,
	CreateTableFee BIGINT,
	CellScore BIGINT,
	CountLimit TINYINT,
	CreateDate DATETIME,
	DissumeDate DATETIME,
	TaxCount BIGINT,
	PayMode TINYINT,
	RoomStatus TINYINT,
	NeedRoomCard TINYINT,
	PlayMode TINYINT,
	RowID INT
)

BEGIN
	IF @Where IS NULL SET @Where=N''
	
	-- ��¼����
	DECLARE @countSql NVARCHAR(4000)  
	
	IF @RecordCount IS NULL
	BEGIN
		SET @countSql='SELECT @TotalRecord=Count(*) FROM StreamCreateTableFeeInfo(NOLOCK) '+@Where
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
	
	INSERT INTO #Tb_ScoreBattle_Cache EXEC ('SELECT * FROM (SELECT TOP '+@TotalRecordForPageIndex+
			' UserID,ServerID,RoomID,CreateTableFee,CellScore,CountLimit,CreateDate,DissumeDate,TaxCount,PayMode,RoomStatus,NeedRoomCard,PlayMode,
			ROW_NUMBER() OVER ('+@Order+') AS PageView_RowNo
			FROM StreamCreateTableFeeInfo(NOLOCK) ' + @Where +' ) AS TempPageViewTable
			WHERE TempPageViewTable.PageView_RowNo > '+ @CurrentPageSize)

	EXEC ('SELECT * FROM #Tb_ScoreBattle_Cache')
	EXEC ('SELECT UserID,GameID,Accounts,NickName FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) WHERE UserID IN(SELECT UserID FROM #Tb_ScoreBattle_Cache)')
	EXEC ('SELECT ServerID,ServerName,KindID FROM GameRoomInfo(NOLOCK) WHERE ServerID IN(SELECT ServerID FROM #Tb_ScoreBattle_Cache)')

	DROP TABLE #Tb_ScoreBattle_Cache
END
RETURN 0
GO
