--�̳�ϵͳ��Ϊ�һ�ϵͳ
USE WHQJPlatformManagerDB
GO
UPDATE dbo.Base_Module SET Title='�һ�ϵͳ' WHERE ModuleID=11

--ȥ������汾
USE WHQJAccountsDB
go
DELETE FROM  dbo.SystemStatusInfo WHERE StatusName='AgentHomeVersion'
update [SystemStatusInfo] set StatusDescription='��ֵ��0-�ޣ�1-΢�Źٷ���2-֧�����ٷ���3-΢��,֧�����ٷ�������֧����4-����ͨ��7-ȫ��' where StatusName='JJPayChannel' 
GO 


--ȥ��ע�����
USE WHQJAccountsDB
go
DELETE FROM  dbo.SystemStatusInfo WHERE StatusName='EnjoinRegister'
GO 

-- 1.1.15 ��ӵ�¼����
USE WHQJAccountsDB
INSERT DBO.SystemStatusInfo (StatusName,StatusValue,StatusString,StatusTip,StatusDescription,SortID)
VALUES (N'LogonType',7, N'��¼��������',N'��¼��������',N'��ֵ��0-�ޣ�1-΢�ŵ�¼��2-�˺ŵ�¼��3-�ο͵�¼��4-΢�ź��˺ŵ�¼��5-΢�ź��ο͵�¼��6-�˺ź��ο͵�¼��7-ȫ��',998)
GO




