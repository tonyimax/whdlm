/*********************************************************************************
*      Function:  WEB_PageView_Group									         *
*      Description:                                                              *
*             Sql2008��ҳ�洢����												 *
*      Finish DateTime:                                                          *
*             2018/6/8														     *          
*********************************************************************************/
USE WHQJGroupDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WEB_PageView_GroupDebugUser]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WEB_PageView_GroupDebugUser]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.WEB_PageView_GroupDebugUser
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
CREATE TABLE #Tb_GroupDebug_CacheUser
(
	GroupID BIGINT,
	UserID  INT,
	GameID	INT,
	NickName VARCHAR(50),
	UserStatus INT,
	MemberRight INT,
	IsAndroid INT,
	CurrentScore BIGINT,
	TodayScore BIGINT,
	AllScore BIGINT,
	TodayRevenue  BIGINT,
	AllRevenue BIGINT,
	AddAllScore BIGINT,
	LessAllScore BIGINT,
	OnlineTime BIGINT,
	EnterTime DATETIME,
	LeaveTime DATETIME,
	RowID INT
)

BEGIN
	IF @Where IS NULL SET @Where=N''
	
	-- ��¼����
	DECLARE @countSql NVARCHAR(4000)  
	
	IF @RecordCount IS NULL
	BEGIN
		SET @countSql='SELECT @TotalRecord=Count(*) FROM IMGroupMember(NOLOCK) igm INNER JOIN WHQJAccountsDB.dbo.AccountsInfo ai ON ai.UserID = igm.UserID  '+@Where
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
	
	INSERT INTO #Tb_GroupDebug_CacheUser EXEC ('SELECT * FROM (SELECT TOP '+@TotalRecordForPageIndex+
			' igm.GroupID,ai.UserID,ai.GameID,ai.NickName,igm.UserStatus,igm.MemberRight,ai.IsAndroid,igm.Score,
			(SELECT ISNULL(SUM(ScoreCount),0) FROM dbo.RecordUserDayInfo WHERE GroupID=igm.GroupID AND UserID=igm.UserID AND DATEDIFF(DAY,InsertTime,GETDATE())=0) AS TodayScore,
			(SELECT ISNULL(SUM(ScoreCount),0) FROM dbo.RecordUserDayInfo WHERE GroupID=igm.GroupID AND UserID=igm.UserID ) AS AllScore,
			(SELECT ISNULL(SUM(RevenueCount),0) FROM dbo.RecordUserDayInfo WHERE GroupID=igm.GroupID AND UserID=igm.UserID AND DATEDIFF(DAY,InsertTime,GETDATE())=0) AS TodayRevenue,
			(SELECT ISNULL(SUM(RevenueCount),0) FROM dbo.RecordUserDayInfo WHERE GroupID=igm.GroupID AND UserID=igm.UserID ) AS AllRevenue,
			(SELECT ISNULL(SUM(ChangeScore),0) FROM dbo.RecordUserScoreChange WHERE ChangeType=0 AND UserID=igm.UserID AND GroupID=igm.GroupID) AS AddAllScore,
			(SELECT ISNULL(SUM(ChangeScore),0) FROM dbo.RecordUserScoreChange WHERE ChangeType=1 AND UserID=igm.UserID AND GroupID=igm.GroupID) AS LessAllScore,
			 igm.OnlineTimeCount,igm.EnterTime,igm.LeaveTime,
			ROW_NUMBER() OVER ('+@Order+') AS PageView_RowNo
			FROM IMGroupMember(NOLOCK) igm INNER JOIN WHQJAccountsDB.dbo.AccountsInfo ai ON ai.UserID = igm.UserID ' + @Where +' '+@Order+' ) AS TempPageViewTable
			WHERE TempPageViewTable.PageView_RowNo > '+ @CurrentPageSize)

	EXEC ('SELECT * FROM #Tb_GroupDebug_CacheUser')
	
	DROP TABLE #Tb_GroupDebug_CacheUser
END
RETURN 0
GO
