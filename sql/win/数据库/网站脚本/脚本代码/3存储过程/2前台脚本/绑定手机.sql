USE [WHQJAccountsDB]
GO

----------------------------------------------------------
--���ֻ���
IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].NET_PW_BindMolible') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].NET_PW_BindMolible
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO
CREATE PROCEDURE NET_PW_BindMolible
@Userid  int,  ---�û�id
@Molible nvarchar(20),  ---�ֻ���
@Code    nvarchar(10),   ---��֤��
@time    int,    ---��֤�����ʱ�䣨��λ���룩
@strErrorDescribe NVARCHAR(127) OUTPUT			-- �����Ϣ
as
 -- ��������
SET NOCOUNT ON

-- ������Ϣ
DECLARE @createtime datetime---��֤�����ʱ��
DECLARE @RS INT-----������� -1��֤�����-2��֤�����1�󶨳ɹ�
declare @intervaltime int----������֤��ͻ�ȡ��֤����ʱ�䣨��λ���룩
declare @BindMolibleReward int ---���ֻ��Ž���
declare @Gameid int----��Ϸid 
declare @PreScore int ---����ǰ���
declare @PreInsureScore int ---����ǰ���н��
set @RS=-1
select @BindMolibleReward=StatusValue from  SystemStatusInfo where StatusName='BindMolibleReward' 

select @createtime=CollectTime FROM dbo.CheckCode where PhoneNum=@Molible and CheckCode=@Code
select @Gameid=isnull(Gameid,0) from AccountsInfo where UserID=@Userid

IF EXISTS(SELECT * FROM dbo.AccountsInfo WHERE RegisterMobile=@Molible)
BEGIN
	SET  @strErrorDescribe='�ֻ�������ڰ��˺�'
	RETURN 1001
END

   if @Gameid>0 and @createtime is not null
    begin
	select @PreScore=Score,@PreInsureScore=InsureScore from [WHQJTreasureDB].dbo.[GameScoreInfo] where UserID=@UserID

  set @intervaltime=DATEDIFF(ss,@createtime,getdate());
  ---�ж���֤���Ƿ����
  if @time<@intervaltime
    begin
	set  @RS=-2
	end
	---���ֻ���
  else
   begin
        update AccountsInfo set RegisterMobile=@Molible where UserID=@Userid
		if @BindMolibleReward>0
		begin
		update [WHQJTreasureDB].dbo.[GameScoreInfo] set Score=Score+@BindMolibleReward where UserID=@Userid
		-- ��ˮ��
		 INSERT INTO WHQJRecordDB.dbo.RecordTreasureSerial
      (SerialNumber,MasterID,UserID,TypeID,CurScore,CurInsureScore,ChangeScore,ClientIP,CollectDate)
      VALUES(dbo.WF_GetSerialNumber(), 0, @UserID, 16, @PreScore, @PreInsureScore, @BindMolibleReward, '', GETDATE())
       DELETE FROM  dbo.CheckCode where PhoneNum=@Molible and CheckCode=@Code
	   end
       set  @RS=1
   end
   end
  set @strErrorDescribe=@RS