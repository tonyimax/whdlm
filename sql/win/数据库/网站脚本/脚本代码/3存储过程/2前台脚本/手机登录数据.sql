----------------------------------------------------------------------------------------------------
-- ��Ȩ��2011
-- ʱ�䣺2012-02-23
-- ��;���ֻ���¼���ݻ�ȡ
----------------------------------------------------------------------------------------------------

USE WHQJNativeWebDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_PW_GetMobileLoginData') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PW_GetMobileLoginData
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

----------------------------------------------------------------------------------------------------

CREATE PROCEDURE NET_PW_GetMobileLoginData

WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- ִ���߼�
BEGIN
	
	-- ��ȡϵͳ����
	SELECT StatusName,StatusValue FROM WHQJAccountsDB.dbo.SystemStatusInfo WITH(NOLOCK)

	-- ��ȡ�ͷ�����
	SELECT Field1 AS Phone,Field2 AS WeiXin,Field3 AS QQ,Field4 AS Link FROM ConfigInfo WITH(NOLOCK) WHERE ConfigKey =N'SysCustomerService'

	-- ��ȡϵͳ����
	SELECT TOP 10 NoticeID,NoticeTitle,MoblieContent,PublisherTime,PlatformType FROM SystemNotice WITH(NOLOCK) WHERE Nullity=0 ORDER BY IsTop DESC,SortID ASC,NoticeID DESC

	-- ��ȡ�����Դ
	SELECT Title,ResourceURL,LinkURL,SortID,PlatformType FROM Ads WITH(NOLOCK) WHERE [Type] = 3 ORDER BY SortID ASC

	SELECT Title,ResourceURL,LinkURL,SortID,PlatformType FROM Ads WITH(NOLOCK) WHERE [Type] = 4 ORDER BY SortID ASC

	---��ȡ���߹������
	SELECT isnull(ExchangeRatio,0) FROM [WHQJPlatformDB].dbo.GameProperty WITH(NOLOCK) WHERE ID=306 and ExchangeType=0--��ʯ����
	SELECT isnull(ExchangeRatio,0) FROM [WHQJPlatformDB].dbo.GameProperty WITH(NOLOCK) WHERE ID=306 and ExchangeType=1--��ҹ���
	  ----�����
	 SELECT Title,ResourceURL,LinkURL,SortID,PlatformType FROM Ads WITH(NOLOCK) WHERE [Type] = 6 ORDER BY SortID ASC
	 ---ǩ����Ʒ����
	 select GoodsID,GamePackageGoods.PackageID,GamePackageGoods.TypeID,GamePackage.TypeID as PackageTypeID, GamePackageGoods.ResourceURL,Name,SortID  from  [WHQJPlatformDB].dbo.GamePackageGoods left join  [WHQJPlatformDB].dbo.[GamePackage] on GamePackageGoods.PackageID=[GamePackage].PackageID  ORDER BY SortID ASC

	 --����Ȧ��������
	 SELECT OptionName,OptionValue FROM [WHQJGroupDB].dbo.[IMGroupOption] WITH(NOLOCK)
	   
END

RETURN 0

GO