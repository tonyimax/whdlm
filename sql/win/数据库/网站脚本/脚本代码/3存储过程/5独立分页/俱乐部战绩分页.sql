/*********************************************************************************
*      Function:  WEB_PageView_DrawInfo									         *
*      Description:                                                              *
*             Sql2008��ҳ�洢����												 *
*      Finish DateTime:                                                          *
*             2018/6/8														     *          
*********************************************************************************/
USE WHQJGroupDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WEB_PageView_GroupDrawInfo]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WEB_PageView_GroupDrawInfo]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.WEB_PageView_GroupDrawInfo
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
CREATE TABLE #Tb_GroupRoomInfo_Cache
(
	GroupID INT,
	RoomID INT,
	PlayMode INT,
	KindName NVARCHAR(50),
	DrawCount INT,
	BigWinnerID INT,
	BigWinnerName NVARCHAR(50),
	MinTableScore BIGINT,
	RoomRevenue BIGINT,
	StartTime DATETIME,
	EndTime DATETIME,
	RowID INT
)

BEGIN
	IF @Where IS NULL SET @Where=N''
	
	-- ��¼����
	DECLARE @countSql NVARCHAR(4000)  
	
	IF @RecordCount IS NULL
	BEGIN
		SET @countSql='SELECT @TotalRecord=Count(*) FROM RecordGroupRoomInfo(NOLOCK) '+@Where
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
	
	INSERT INTO #Tb_GroupRoomInfo_Cache EXEC ('SELECT * FROM (SELECT TOP '+@TotalRecordForPageIndex+
			' GroupID,RoomID,PlayMode,KindName,DrawCount,BigWinnerID,BigWinnerName,MinTableScore,RoomRevenue,StartTime,EndTime,
			ROW_NUMBER() OVER ('+@Order+') AS PageView_RowNo
			FROM RecordGroupRoomInfo(NOLOCK) ' + @Where +' ) AS TempPageViewTable
			WHERE TempPageViewTable.PageView_RowNo > '+ @CurrentPageSize)

	EXEC ('SELECT * FROM #Tb_GroupRoomInfo_Cache')
	EXEC ('SELECT * FROM RecordGroupDrawInfo(NOLOCK) WHERE RoomID IN(SELECT RoomID FROM #Tb_GroupRoomInfo_Cache)')
	EXEC ('SELECT * FROM RecordGroupDrawScore(NOLOCK) WHERE RoomID IN(SELECT RoomID FROM #Tb_GroupRoomInfo_Cache)')
	EXEC ('SELECT UserID,GameID,Accounts,NickName,IsAndroid FROM WHQJAccountsDB.dbo.AccountsInfo(NOLOCK) WHERE UserID IN(SELECT UserID FROM RecordGroupDrawScore(NOLOCK) WHERE RoomID IN(SELECT RoomID FROM #Tb_GroupRoomInfo_Cache))')
	
	DROP TABLE #Tb_GroupRoomInfo_Cache
END
RETURN 0
GO
