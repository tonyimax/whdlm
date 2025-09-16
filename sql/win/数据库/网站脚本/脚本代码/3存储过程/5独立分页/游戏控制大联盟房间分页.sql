/*********************************************************************************
*      Function:  WEB_PageView_Group									         *
*      Description:                                                              *
*             Sql2008��ҳ�洢����												 *
*      Finish DateTime:                                                          *
*             2018/6/8														     *          
*********************************************************************************/
USE WHQJGroupDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WEB_PageView_GroupGameControlSub]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WEB_PageView_GroupGameControlSub]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.WEB_PageView_GroupGameControlSub
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
	KindID INT,
	PlayMode INT,
	ConfigSysStorage BIGINT,
	ConfigPlayerStorage BIGINT,
	ConfigParameterK INT,
	CurResetCount INT,
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
		SET @countSql='SELECT @TotalRecord=Count(*) FROM IMGroupShareStorageProperty(NOLOCK) '+@Where
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
			' GroupID,KindID,PlayMode,ConfigSysStorage,ConfigPlayerStorage,ConfigParameterK,CurResetCount,
			0 AS AllScore,
			0 AS TodayScore,
			(SELECT ISNULL(SUM(RoomRevenue),0) FROM WHQJGroupDB.dbo.RecordGroupRoomInfo WHERE GroupID=IMGroupShareStorageProperty.GroupID AND  KindID=IMGroupShareStorageProperty.kindID) AS AllRevenue,
			(SELECT ISNULL(SUM(RoomRevenue),0) FROM WHQJGroupDB.dbo.RecordGroupRoomInfo WHERE GroupID=IMGroupShareStorageProperty.GroupID AND  KindID=IMGroupShareStorageProperty.kindID
			 AND DATEDIFF(DAY,EndTime,GETDATE())=0) AS TodayRevenue,
			ROW_NUMBER() OVER ('+@Order+') AS PageView_RowNo
			FROM IMGroupShareStorageProperty(NOLOCK) ' + @Where +' '+@Order+') AS TempPageViewTable
			WHERE TempPageViewTable.PageView_RowNo > '+ @CurrentPageSize)
			
			
	DECLARE @i INT =1
	DECLARE @count INT 
	DECLARE @GroupId INT
	DECLARE @KindId INT
	DECLARE @Score INT
	select @count = COUNT(1) from #Tb_GroupGameControl_Cache;		
	WHILE (@count>=@i)
	BEGIN
		SELECT @GroupId=GroupID,@KindId=KindID FROM #Tb_GroupGameControl_Cache WHERE RowID=@i
		SELECT  @Score=ISNULL(SUM(rgds.Score),0) FROM dbo.RecordGroupDrawInfo rgdi INNER JOIN dbo.RecordGroupDrawScore rgds ON rgds.DrawID = rgdi.DrawID 
				WHERE rgdi.GroupID=@GroupID AND rgdi.KindID=@KindID
		UPDATE #Tb_GroupGameControl_Cache SET AllScore=@Score WHERE GroupID=GroupID AND KindID=@KindId
		
		SELECT  @Score=ISNULL(SUM(rgds.Score),0) FROM dbo.RecordGroupDrawInfo rgdi INNER JOIN dbo.RecordGroupDrawScore rgds ON rgds.DrawID = rgdi.DrawID 
				WHERE rgdi.GroupID=@GroupID AND rgdi.KindID=@KindID AND DATEDIFF(DAY,rgds.InsertTime,GETDATE())=0
		UPDATE #Tb_GroupGameControl_Cache SET TodayScore=@Score WHERE GroupID=GroupID AND KindID=@KindId
		
		set @i = @i + 1;
	END


	EXEC ('SELECT * FROM #Tb_GroupGameControl_Cache')
			
	DROP TABLE #Tb_GroupGameControl_Cache
END
RETURN 0
GO
