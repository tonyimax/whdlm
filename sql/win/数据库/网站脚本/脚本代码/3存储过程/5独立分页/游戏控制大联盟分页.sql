/*********************************************************************************
*      Function:  WEB_PageView_Group									         *
*      Description:                                                              *
*             Sql2008��ҳ�洢����												 *
*      Finish DateTime:                                                          *
*             2018/6/8														     *          
*********************************************************************************/
USE WHQJGroupDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WEB_PageView_GroupGameControl]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WEB_PageView_GroupGameControl]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.WEB_PageView_GroupGameControl
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
CREATE TABLE #Tb_GroupGameControl_Cache
(
	GroupID BIGINT,
	CreaterID INT,
	CreaterGameID INT,
	CreaterNickName NVARCHAR(32),
	GroupName NVARCHAR(32),
	GroupStatus TINYINT,
	MemberCount SMALLINT,
	MaxMemberCount SMALLINT,
	CreateDateTime DATETIME,
	CanUseMedal TINYINT,
	AllScore INT,
	TodayScore INT,
	AllRevenue INT,
	TodayRevenue INT,
	RowID INT
)

BEGIN
	IF @Where IS NULL SET @Where=N''
	
	-- ��¼����
	DECLARE @countSql NVARCHAR(4000)  
	
	IF @RecordCount IS NULL
	BEGIN
		SET @countSql='SELECT @TotalRecord=Count(*) FROM IMGroupProperty(NOLOCK) '+@Where
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
	

			
	INSERT INTO #Tb_GroupGameControl_Cache EXEC ('SELECT * FROM (SELECT TOP '+@TotalRecordForPageIndex+
			' GroupID,CreaterID,CreaterGameID,CreaterNickName,GroupName,GroupStatus,MemberCount,MaxMemberCount,CreateDateTime,CanUseMedal,
			(SELECT ISNULL(SUM(ScoreCount),0) FROM dbo.RecordUserDayInfo WHERE GroupID=IMGroupProperty.GroupID) AS AllScore,
			(SELECT ISNULL(SUM(ScoreCount),0) FROM dbo.RecordUserDayInfo WHERE GroupID=IMGroupProperty.GroupID AND DATEDIFF(DAY,InsertTime,GETDATE())=0) AS TodayScore,
			(SELECT ISNULL(SUM(RevenueCount),0) FROM dbo.RecordUserDayInfo WHERE GroupID=IMGroupProperty.GroupID) AS AllRevenue,
			(SELECT ISNULL(SUM(RevenueCount),0) FROM dbo.RecordUserDayInfo WHERE GroupID=IMGroupProperty.GroupID AND DATEDIFF(DAY,InsertTime,GETDATE())=0) AS TodayRevenue,
			ROW_NUMBER() OVER ('+@Order+') AS PageView_RowNo
			FROM IMGroupProperty(NOLOCK) ' + @Where +' '+@Order+' ) AS TempPageViewTable
			WHERE TempPageViewTable.PageView_RowNo > '+ @CurrentPageSize)

	EXEC ('SELECT * FROM #Tb_GroupGameControl_Cache')
	EXEC ('SELECT GroupID,Ingot,ConsumeIngot,BattleCreate,Score FROM IMGroupWealth(NOLOCK) WHERE GroupID IN(SELECT GroupID FROM #Tb_GroupGameControl_Cache)')
	EXEC ('SELECT GroupID,AwardPoint FROM IMGroupMember(NOLOCK) WHERE MemberRight=1 AND GroupID IN(SELECT GroupID FROM #Tb_GroupGameControl_Cache)')
	DROP TABLE #Tb_GroupGameControl_Cache
END
RETURN 0
GO
