USE [WHQJNativeWebDB]
GO

/****** Object:  Table [dbo].[WxScanLoginRecord]    Script Date: 2019/11/7 20:05:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1
FROM SYS.TABLES
WHERE name=N'WxScanLoginRecord')
DROP TABLE [dbo].[WxScanLoginRecord]
GO

CREATE TABLE [dbo].[WxScanLoginRecord]
(
  [RecordID] [int] IDENTITY(1,1) NOT NULL,
  [Key] [nvarchar](32) NOT NULL,
  [OpenID] [nvarchar](32) NOT NULL,
  [UnionID] [nvarchar](32) NOT NULL,
  [AccessToken] [nvarchar](512) NOT NULL,
  [RefreshToken] [nvarchar](512) NOT NULL,
  [State] [tinyint] NOT NULL,
  [CollectDate] [datetime] NOT NULL,
  [CollectClientIP] [nvarchar](15) NOT NULL,
  [PickDate] [datetime] NULL,
  [PickClientIP] [nvarchar](15) NULL,
    CONSTRAINT [PK_WxScanLoginRecord] PRIMARY KEY CLUSTERED 
  (
	[RecordID] ASC
  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
  ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[WxScanLoginRecord] ADD  CONSTRAINT [DF_WxScanLoginRecord_Key]  DEFAULT (N'') FOR [Key]
GO

ALTER TABLE [dbo].[WxScanLoginRecord] ADD  CONSTRAINT [DF_WxScanLoginRecord_OpenID]  DEFAULT (N'') FOR [OpenID]
GO

ALTER TABLE [dbo].[WxScanLoginRecord] ADD  CONSTRAINT [DF_WxScanLoginRecord_UnionID]  DEFAULT (N'') FOR [UnionID]
GO

ALTER TABLE [dbo].[WxScanLoginRecord] ADD  CONSTRAINT [DF_WxScanLoginRecord_AccessToken]  DEFAULT (N'') FOR [AccessToken]
GO

ALTER TABLE [dbo].[WxScanLoginRecord] ADD  CONSTRAINT [DF_WxScanLoginRecord_RefreshToken]  DEFAULT (N'') FOR [RefreshToken]
GO

ALTER TABLE [dbo].[WxScanLoginRecord] ADD  CONSTRAINT [DF_WxScanLoginRecord_State]  DEFAULT ((0)) FOR [State]
GO

ALTER TABLE [dbo].[WxScanLoginRecord] ADD  CONSTRAINT [DF_WxScanLoginRecord_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

ALTER TABLE [dbo].[WxScanLoginRecord] ADD  CONSTRAINT [DF_WxScanLoginRecord_CollectClientIP]  DEFAULT (N'') FOR [CollectClientIP]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'RecordID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'Key'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OpenID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'OpenID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UnionID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'UnionID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权Token' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'AccessToken'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刷新Token' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'RefreshToken'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权状态（0：已授权未获取，1：已授权已获取）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'CollectClientIP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'获取时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'PickDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'获取IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WxScanLoginRecord', @level2type=N'COLUMN',@level2name=N'PickClientIP'
GO


