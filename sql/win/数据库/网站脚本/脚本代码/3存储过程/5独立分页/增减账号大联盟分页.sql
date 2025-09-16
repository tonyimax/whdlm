/*********************************************************************************
*      Function:  WEB_PageView_Group									         *
*      Description:                                                              *
*             Sql2008��ҳ�洢����												 *
*      Finish DateTime:                                                          *
*             2018/6/8														     *          
*********************************************************************************/
USE WHQJGroupDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WEB_PageView_GroupDebug]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WEB_PageView_GroupDebug]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.WEB_PageView_GroupDebug
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
CREATE TABLE #Tb_GroupDebug_Cache
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
	UserCount INT,
	AICount INT,
	OnlineUserCount INT,
	OnlinAICount INT,
	AllScore BIGINT,
	LaveNoDistributionScore BIGINT,
	AIDistributionScore BIGINT,
	UserCarryScore BIGINT,
	AICarryScore BIGINT,
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
	
	INSERT INTO #Tb_GroupDebug_Cache EXEC ('SELECT * FROM (SELECT TOP '+@TotalRecordForPageIndex+
			' GroupID,CreaterID,CreaterGameID,CreaterNickName,GroupName,GroupStatus,MemberCount,MaxMemberCount,CreateDateTime,CanUseMedal,
			(SELECT  COUNT(0) FROM dbo.IMGroupMember igm INNER JOIN WHQJAccountsDB.dbo.AccountsInfo  ai ON ai.UserID = igm.UserID WHERE igm.GroupID=IMGroupProperty.GroupID AND ai.IsAndroid=0) AS UserCount,
			(SELECT  COUNT(0) FROM dbo.IMGroupMember igm INNER JOIN WHQJAccountsDB.dbo.AccountsInfo  ai ON ai.UserID = igm.UserID WHERE igm.GroupID=IMGroupProperty.GroupID AND ai.IsAndroid=1) AS AICount,
			(SELECT  COUNT(0) FROM dbo.IMGroupMember igm INNER JOIN WHQJAccountsDB.dbo.AccountsInfo  ai ON ai.UserID = igm.UserID WHERE igm.GroupID=IMGroupProperty.GroupID AND ai.IsAndroid=0 AND igm.UserStatus=1 ) AS OnlineUserCount,
			(SELECT  COUNT(0) FROM dbo.IMGroupMember igm INNER JOIN WHQJAccountsDB.dbo.AccountsInfo  ai ON ai.UserID = igm.UserID WHERE igm.GroupID=IMGroupProperty.GroupID AND ai.IsAndroid=1 AND igm.UserStatus=1 ) AS OnlinAICount,
			(SELECT ISNULL(SUM(ChangeScore),0) FROM RecordGroupScoreChange WHERE  GroupID=IMGroupProperty.GroupID AND ChangeType=2) AS AllScore,
			(SELECT Score FROM dbo.IMGroupWealth WHERE GroupID=IMGroupProperty.GroupID) AS LaveNoDistributionScore,
			(SELECT ISNULL(SUM(DistributeTotalScore),0) FROM WHQJAccountsDB.dbo.GroupAIParameter WHERE GroupID=IMGroupProperty.GroupID) AS AIDistributionScore,
			(SELECT ISNULL(SUM(igm.Score),0) FROM dbo.IMGroupMember igm INNER JOIN WHQJAccountsDB.dbo.AccountsInfo ai ON ai.UserID = igm.UserID WHERE  igm.GroupID=IMGroupProperty.GroupID AND ai.IsAndroid=0) AS UserCarryScore,
			(SELECT ISNULL(SUM(igm.Score),0) FROM dbo.IMGroupMember igm INNER JOIN WHQJAccountsDB.dbo.AccountsInfo ai ON ai.UserID = igm.UserID WHERE  igm.GroupID=IMGroupProperty.GroupID AND ai.IsAndroid=1) AS AICarryScore,
			ROW_NUMBER() OVER ('+@Order+') AS PageView_RowNo
			FROM IMGroupProperty(NOLOCK) ' + @Where +' '+@Order+') AS TempPageViewTable
			WHERE TempPageViewTable.PageView_RowNo > '+ @CurrentPageSize)

	EXEC ('SELECT * FROM #Tb_GroupDebug_Cache')
	
	DROP TABLE #Tb_GroupDebug_Cache
END
RETURN 0
GO
