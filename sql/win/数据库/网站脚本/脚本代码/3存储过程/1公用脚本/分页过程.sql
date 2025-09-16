/*********************************************************************************
*      Function:  WEB_PageView_New											     *
*      Description:                                                              *
*             Sql2008��ҳ�洢����												 *
*      Finish DateTime:                                                          *
*             2018/6/8														     *          
*********************************************************************************/

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WEB_PageView_New]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WEB_PageView_New]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.WEB_PageView_New
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

BEGIN
	IF @Where IS NULL SET @Where=N''
	
	-- ��¼����
	DECLARE @countSql NVARCHAR(4000)  
	
	IF @RecordCount IS NULL
	BEGIN
		SET @countSql='SELECT @TotalRecord=Count(*) FROM '+@TableName+'(NOLOCK) '+@Where
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
	
	EXEC	('SELECT *
			FROM (SELECT TOP '+@TotalRecordForPageIndex+' '+@ReturnFields+', ROW_NUMBER() OVER ('+@Order+') AS PageView_RowNo
			FROM '+@TableName+ '(NOLOCK) ' + @Where +' ) AS TempPageViewTable
			WHERE TempPageViewTable.PageView_RowNo > 
			'+@CurrentPageSize)
	
END
RETURN 0

GO
/*********************************************************************************
*      Function:  WEB_PageView2													 *
*      Description:                                                              *
*             Sql2005��ҳ�洢����												 *
*      Finish DateTime:                                                          *
*             2009/1/3															 *
*	   Example:																	 *
*	          WEB_PageView @Tablename = 'Table1', @Returnfields = '*',           *
*			  @PageSize = 2, @PageIndex = 1, @Where = '',					     *
*			  @OrderBy=N'ORDER BY id desc'										 *           
*********************************************************************************/

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[WEB_PageView]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[WEB_PageView]
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.WEB_PageView
	@TableName		NVARCHAR(2000),			-- ����
	@ReturnFields	NVARCHAR(1000) = '*',	-- ��ѯ����
	@PageSize		INT = 10,				-- ÿҳ��Ŀ
	@PageIndex		INT = 1,				-- ��ǰҳ��
	@Where			NVARCHAR(1000) = '',	-- ��ѯ����
	@OrderBy		NVARCHAR(1000),			-- �����ֶ�
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

BEGIN
	IF @Where IS NULL SET @Where=N''
	
	-- ��¼����
	DECLARE @countSql NVARCHAR(4000)  
	
	IF @RecordCount IS NULL
	BEGIN
		SET @countSql='SELECT @TotalRecord=Count(*) From '+@TableName+' '+@Where
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
	
	EXEC	('SELECT *
			FROM (SELECT TOP '+@TotalRecordForPageIndex+' '+@ReturnFields+', ROW_NUMBER() OVER ('+@OrderBy+') AS PageView_RowNo
			FROM '+@TableName+ ' ' + @Where +' ) AS TempPageViewTable
			WHERE TempPageViewTable.PageView_RowNo > 
			'+@CurrentPageSize)
	
END
RETURN 0
GO
			


			

