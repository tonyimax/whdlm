TITLE ���������콢�����ݿ���վ���� �Զ���װ������ر�

COLOR 0A
CLS
@echo off
CLS
echo.
echo *************************************************************************
echo.
echo *******************�����콢��һ����װ�ű�������ʼ************************ 
echo.
echo *******************��Ȩ���У������������Ƽ����޹�˾**********************
echo.
echo *************************************************************************
echo.

md D:\���ݿ�\�콢ƽ̨

set rootPath=1���ݿⴴ��\
osql -E -i "%rootPath%1���ݿⴴ��.sql"
osql -E -i "%rootPath%2���ݱ���.sql"

set rootPath=2���ݿ�����\
osql -E -i "%rootPath%3���½ű�.sql"
osql -E -i "%rootPath%1ϵͳ����.sql"
osql -E -i "%rootPath%2��̨����.sql"


set rootPath=3�洢����\1���ýű�\
osql -d WHQJAccountsDB -E  -n -i "%rootPath%��ҳ����.sql"
osql -d WHQJGameScoreDB -E  -n -i "%rootPath%��ҳ����.sql"
osql -d WHQJNativeWebDB -E  -n -i "%rootPath%��ҳ����.sql"
osql -d WHQJPlatformDB -E  -n -i "%rootPath%��ҳ����.sql"
osql -d WHQJPlatformManagerDB -E  -n -i "%rootPath%��ҳ����.sql"
osql -d WHQJRecordDB -E  -n -i "%rootPath%��ҳ����.sql"
osql -d WHQJTreasureDB -E  -n -i "%rootPath%��ҳ����.sql"
osql -d WHQJAgentDB -E  -n -i "%rootPath%��ҳ����.sql"
osql -d WHQJGroupDB -E  -n -i "%rootPath%��ҳ����.sql"

osql -d WHQJAccountsDB -E  -n -i "%rootPath%���ַ���.sql"
osql -d WHQJGameScoreDB -E  -n -i "%rootPath%���ַ���.sql"
osql -d WHQJNativeWebDB -E  -n -i "%rootPath%���ַ���.sql"
osql -d WHQJPlatformDB -E  -n -i "%rootPath%���ַ���.sql"
osql -d WHQJPlatformManagerDB -E  -n -i "%rootPath%���ַ���.sql"
osql -d WHQJRecordDB -E  -n -i "%rootPath%���ַ���.sql"
osql -d WHQJTreasureDB -E  -n -i "%rootPath%���ַ���.sql"
osql -d WHQJAgentDB -E  -n -i "%rootPath%���ַ���.sql"
osql -d WHQJGroupDB -E  -n -i "%rootPath%���ַ���.sql"

osql -d WHQJAccountsDB -E  -n -i "%rootPath%������ˮ��.sql"
osql -d WHQJGameScoreDB -E  -n -i "%rootPath%������ˮ��.sql"
osql -d WHQJNativeWebDB -E  -n -i "%rootPath%������ˮ��.sql"
osql -d WHQJPlatformDB -E  -n -i "%rootPath%������ˮ��.sql"
osql -d WHQJPlatformManagerDB -E  -n -i "%rootPath%������ˮ��.sql"
osql -d WHQJRecordDB -E  -n -i "%rootPath%������ˮ��.sql"
osql -d WHQJTreasureDB -E  -n -i "%rootPath%������ˮ��.sql"
osql -d WHQJAgentDB -E  -n -i "%rootPath%������ˮ��.sql"
osql -d WHQJGroupDB -E  -n -i "%rootPath%������ˮ��.sql"

set rootPath=3�洢����\2ǰ̨�ű�\
osql -E -i "%rootPath%����ս������.sql"
osql -E -i "%rootPath%����������.sql"
osql -E -i "%rootPath%�����¼.sql"
osql -E -i "%rootPath%������.sql"
osql -E -i "%rootPath%�����ϵ��ѯ.sql"
osql -E -i "%rootPath%�����̨��¼.sql"
osql -E -i "%rootPath%������ȡ����.sql"
osql -E -i "%rootPath%����ת������.sql"
osql -E -i "%rootPath%��ֵ����.sql"
osql -E -i "%rootPath%��ȡ���а�����.sql"
osql -E -i "%rootPath%��ֵ����.sql"
osql -E -i "%rootPath%���ֲ�ս������.sql"
osql -E -i "%rootPath%��ȡ���а���.sql"
osql -E -i "%rootPath%��ȡ�ƹ㷵������.sql"
osql -E -i "%rootPath%��ȡ�ƹ���ѽ���.sql"
osql -E -i "%rootPath%��ȡע�����ͽ���.sql"
osql -E -i "%rootPath%�ֻ���ֵ��Ʒ.sql"
osql -E -i "%rootPath%�ֻ���¼�ɹ�����.sql"
osql -E -i "%rootPath%�ֻ���¼����.sql"
osql -E -i "%rootPath%�ֻ���ȡ��Ϸ����.sql"
osql -E -i "%rootPath%��Ұ󶨴���.sql"
osql -E -i "%rootPath%�û���������.sql"
osql -E -i "%rootPath%�û�ע��.sql"
osql -E -i "%rootPath%�û�ע��΢��.sql"
osql -E -i "%rootPath%���߳�ֵ.sql"
osql -E -i "%rootPath%���߶���.sql"
osql -E -i "%rootPath%����ƻ����ֵ.sql"
osql -E -i "%rootPath%��ʯ�һ����.sql"
osql -E -i "%rootPath%���ֻ�.sql"
osql -E -i "%rootPath%����Ʒ.sql"
osql -E -i "%rootPath%ÿ�շ���.sql"

set rootPath=3�洢����\3��̨�ű�\
osql -E -i "%rootPath%�˵�����.sql"
osql -E -i "%rootPath%��������IP.sql"
osql -E -i "%rootPath%�������ƻ�����.sql"
osql -E -i "%rootPath%����Ա��¼.sql"
osql -E -i "%rootPath%Ȩ�޼���.sql"
osql -E -i "%rootPath%ע��IPͳ��.sql"
osql -E -i "%rootPath%ע�������ͳ��.sql"
osql -E -i "%rootPath%������ʯ��ѯ.sql"
osql -E -i "%rootPath%��̨������ʯ.sql"
osql -E -i "%rootPath%��������.sql"
osql -E -i "%rootPath%��ȡ����������.sql"
osql -E -i "%rootPath%ϵͳ��������.sql"
osql -E -i "%rootPath%��̨���ͽ��.sql"
osql -E -i "%rootPath%��ҷֲ�.sql"
osql -E -i "%rootPath%��ʯ�ֲ�.sql"
osql -E -i "%rootPath%���ݻ���.sql"
osql -E -i "%rootPath%�������˹���Ա.sql"
osql -E -i "%rootPath%��̨������ѯ.sql"
osql -E -i "%rootPath%��ѯԼս����.sql"
osql -E -i "%rootPath%�û���ʾ��Ϸ.sql"
osql -E -i "%rootPath%�û�������Ϸ.sql"
osql -E -i "%rootPath%��̨���ͽ�ȯ.sql"
osql -E -i "%rootPath%��̨����ѫ��.sql"

set rootPath=3�洢����\4��ҵ�ű�\
osql -E -i "%rootPath%������.sql"
osql -E -i "%rootPath%ÿ������ͳ��.sql"
osql -E -i "%rootPath%�Ƹ����а�.sql"
osql -E -i "%rootPath%ʤ�����а�.sql"
osql -E -i "%rootPath%���а��ܽ���.sql"

set rootPath=3�洢����\5������ҳ\
osql -E -i "%rootPath%�û��б��ҳ.sql"
osql -E -i "%rootPath%������ҷ�ҳ.sql"
osql -E -i "%rootPath%������¼��ҳ.sql"
osql -E -i "%rootPath%��Ϸ��¼��ҳ.sql"
osql -E -i "%rootPath%���м�¼��ҳ.sql"
osql -E -i "%rootPath%�û���ʯ��ҳ.sql"
osql -E -i "%rootPath%������߷�ҳ.sql"
osql -E -i "%rootPath%ʹ�õ��߷�ҳ.sql"
osql -E -i "%rootPath%���Լս��ҳ.sql"
osql -E -i "%rootPath%����Լս��ҳ.sql"
osql -E -i "%rootPath%���ֲ���ҳ.sql"
osql -E -i "%rootPath%��������ҳ.sql"
osql -E -i "%rootPath%�����б��ҳ.sql"
osql -E -i "%rootPath%����ת����ҳ.sql"
osql -E -i "%rootPath%�����¼��ҳ.sql"
osql -E -i "%rootPath%���ֲ�����ѫ����ȡ��ҳ.sql"
osql -E -i "%rootPath%���ֲ����ѫ����ˮ��ҳ.sql"
osql -E -i "%rootPath%���ֲ�ս����ҳ.sql"
osql -E -i "%rootPath%��Ϸ���ƴ����˷����ҳ.sql"
osql -E -i "%rootPath%��Ϸ���ƴ����˷�ҳ.sql"
osql -E -i "%rootPath%�����˺Ŵ����˷�ҳ.sql"
osql -E -i "%rootPath%�����˺Ŵ������û���ҳ.sql"


set rootPath=4��ʱ��ҵ\
osql -E -i "%rootPath%ÿ�մ���˰�շ�����ʱִ��.sql"
osql -E -i "%rootPath%ÿ������ͳ�ƶ�ʱִ��.sql"
osql -E -i "%rootPath%�Ƹ����а�ִ����ҵ.sql"
osql -E -i "%rootPath%ʤ�����а�ִ����ҵ.sql"
osql -E -i "%rootPath%���а��ܽ���ִ����ҵ.sql"

set rootPath=5�����ű�\
osql -E -i "%rootPath%V1.1.1�����ű�.sql"
osql -E -i "%rootPath%΢��ɨ���¼.sql"

echo.
echo.
echo *************************************************************************
echo.
echo *******************�����콢��һ����װ�ű��������************************ 
echo.
echo *******************��Ȩ���У������������Ƽ����޹�˾**********************
echo.
echo *************************************************************************
echo.

pause


