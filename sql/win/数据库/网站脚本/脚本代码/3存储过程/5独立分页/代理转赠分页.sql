/*********************************************************************************
*      Function:  WEB_PageView_AgentGrant									     *
*      Description:                                                              *
*             Sql2008��ҳ�洢����												 *
*      Finish DateTime:                                                          *
*             2018/6/8														     *          
*********************************************************************************/
USE WHQJAgentDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WEB_PageView_AgentGrant]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WEB_PageView_AgentGrant]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.WEB_PageView_AgentGrant
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
CREATE TABLE #Tb_AgentGrant_Cache
(
	SourceUserID INT,
	TargetUserID INT,
	TradeType TINYINT,
	SourceBefore BIGINT,
	TargetBefore BIGINT,
	Amount BIGINT,
	ClientIP NVARCHAR(15),
	CollectDate DATETIME,
	RowID INT
)

BEGIN
	IF @Where IS NULL SET @Where=N''
	
	-- ��¼����
	DECLARE @countSql NVARCHAR(4000)  
	
	IF @RecordCount IS NULL
	BEGIN
		SET @countSql='SELECT @TotalRecord=Count(*) FROM ReturnAwardGrant(NOLOCK) '+@Where
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
	
	INSERT INTO #Tb_AgentGrant_Cache EXEC ('SELECT * FROM (SELECT TOP '+@TotalRecordForPageIndex+
			' SourceUserID,TargetUserID,TradeType,SourceBefore,TargetBefore,Amount,ClientIP,CollectDate,
			ROW_NUMBER() OVER ('+@Order+') AS PageView_RowNo
			FROM ReturnAwardGrant(NOLOCK) ' + @Where +' ) AS TempPageViewTable
			WHERE TempPageViewTable.PageView_RowNo > '+ @CurrentPageSize)

	EXEC ('SELECT * FROM #Tb_AgentGrant_Cache')
	EXEC ('SELECT UserID,GameID,Accounts,NickName FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) WHERE UserID IN(SELECT SourceUserID FROM #Tb_AgentGrant_Cache) OR UserID IN(SELECT TargetUserID FROM #Tb_AgentGrant_Cache)')
	DROP TABLE #Tb_AgentGrant_Cache
END
RETURN 0
GO

