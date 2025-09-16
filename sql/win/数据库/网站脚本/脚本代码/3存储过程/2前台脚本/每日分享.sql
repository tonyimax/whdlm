----------------------------------------------------------------------------------------------------
USE [WHQJNativeWebDB]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].PW_TimesReward') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].PW_TimesReward
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

/*ÿ����ȡ����*/
/*
DayShareLmt INT ,--ÿ�շ����������
TimeShareGold INT  ,--ÿ�η���ɹ��Ľ�ҽ���
TimeShareDiamond INT  ,--ÿ�η���ɹ�����ʯ����
*/
/*-1ʧ��0�ѳ���������1��ȡ�ɹ�*/
CREATE PROC [dbo].[PW_TimesReward]
    @userid NVARCHAR(10) ,
	@strClientIP NVARCHAR(120)
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

    DECLARE @result SMALLINT --���ؽ��
    DECLARE @cnt INT --�ѷ������
    DECLARE @DayShareLmt INT 
    DECLARE @TimeShareGold INT 
    DECLARE @TimeShareDiamond INT 
    DECLARE @StartMoney BIGINT	--�仯ǰ��ҵĽ������
    DECLARE @StartInsureScore BIGINT	--�仯ǰ��ҵ����н������
	DECLARE @StartDiamond BIGINT ---�仯ǰ��ҵ���ʯ��
	DECLARE @Dateid int ---

    DECLARE @Gameid int
    SET @result = -1  

    SELECT  @Gameid = Gameid,@UserID=UserID
    FROM    [WHQJAccountsDB].dbo.AccountsInfo
    WHERE   UserID = @userid

    SELECT  @StartMoney = Score,@StartInsureScore= InsureScore
    FROM    [WHQJTreasureDB].dbo.GameScoreInfo
    WHERE   UserID = @userid
	if @StartMoney is null
	  begin
	 insert into [WHQJTreasureDB].dbo.GameScoreInfo(UserID,Score,InsureScore) values(@UserID,0,0)
	 set @StartMoney=0
	 set @StartInsureScore=0
	 end
	  SELECT  @StartDiamond = Diamond 
    FROM    [WHQJTreasureDB].dbo.UserCurrency
    WHERE   UserID = @userid
	if @StartDiamond is null
	   begin
	  insert into [WHQJTreasureDB].dbo.UserCurrency(UserID,Diamond,AwardTicket) values(@UserID,0,0)
	  set @StartDiamond=0
	  end
	  ---��ȡ��������
    SELECT  @DayShareLmt = DayShareLmt ,
            @TimeShareGold = TimeShareGold ,
			@TimeShareDiamond = TimeShareDiamond 
    FROM    ShareConfig
    WHERE   ID = 1 and Nullity=0

	set @Dateid= CAST(CAST(getdate() AS FLOAT) AS INT)


    BEGIN 
        SELECT  @cnt = COUNT(*)
        FROM    ShareLog
        WHERE   UserID = @userid
                AND DateID = @Dateid
              
        IF   @cnt < @DayShareLmt and @TimeShareGold is not null
            BEGIN 
/*����ϵͳ��־*/
                INSERT  INTO [dbo].[ShareLog]
                        ( [UserID] ,
                          [DateID] ,
                          [Remark] ,
                          [LogTime],
						  TimeShareGold,
						  TimeShareDiamond
                        )
                VALUES  ( @userid ,
                          @Dateid ,
                          'ÿ�շ���' ,
                          GETDATE(),
						  @TimeShareGold,
						  @TimeShareDiamond
                        )
    /*��ұ仯��־*/
    --���½��
	        if @TimeShareGold>0
			   begin
                UPDATE  WHQJTreasureDB.dbo.GameScoreInfo
                 SET    Score = Score + @TimeShareGold
                WHERE   UserID = @UserID
				--�����ұ仯��־
				 -- д������ˮ��¼
    INSERT INTO  [WHQJRecordDB].dbo.RecordTreasureSerial
      (SerialNumber,MasterID,UserID,TypeID,CurScore,CurInsureScore,ChangeScore,ClientIP,CollectDate)
    VALUES(dbo.WF_GetSerialNumber(), 0, @UserID, 13, @StartMoney, @StartInsureScore, @TimeShareGold, @strClientIP, getdate())
				end
				--������ʯ
	         if @TimeShareDiamond>0
			    begin
				     UPDATE  WHQJTreasureDB.dbo.UserCurrency
                 SET    Diamond = Diamond + @TimeShareDiamond
                WHERE   UserID = @UserID
				 --������ʯ��¼
				  -- д����ʯ��ˮ��¼
     INSERT INTO [WHQJRecordDB].dbo.RecordDiamondSerial
      (SerialNumber,MasterID,UserID,TypeID,CurDiamond,ChangeDiamond,ClientIP,CollectDate)
    VALUES(dbo.WF_GetSerialNumber(), 0, @UserID, 15, @StartDiamond, @TimeShareDiamond, @strClientIP, getdate())
				 end
               
	
                SET @result = 1
            END
        ELSE 
            BEGIN
                SET @result = 0
            END        
    END
    SELECT  @result rst,@TimeShareDiamond as TimeShareDiamond,@TimeShareGold as TimeShareGold

GO


