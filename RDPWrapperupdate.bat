@echo off & title ����RDPWrap.ini
 
set INI_Path="C:\Program Files\RDP Wrapper\rdpwrap.ini"
set INI_Dir="C:\Program Files\RDP Wrapper"
 
::���Ȩ��
setlocal enabledelayedexpansion>nul
net session>nul
if !ERRORLEVEL! EQU 2 (
	set "args=!args: ="^&chr^(32^)^&"%!"
	
	set "args="/C"&chr(32)&chr(34)&chr(94)&chr(34)&"%~f0""
	mshta "vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe", !args!, NULL, "runas", NULL)(window.close)"&&exit
)
 
echo.����ֹͣԶ��������񡭡�
echo Y | net stop UmRdpService
echo Y | net stop TermService
 
::ɾ���������ļ�
:DeleteFile
del %INI_Path%
if exist %INI_Path% (
	echo.�ļ� %INI_Path% �Ա�ռ�ã����ֶ��ر�ռ�ø��ļ��ĳ���
	start "" %INI_Dir%
	pause
	goto :DeleteFile
)
 
echo.�������������ļ�����
curl "https://raw.githubusercontents.com/sebaxakerhtc/rdpwrap.ini/master/rdpwrap.ini">%INI_Path%
 
echo.��������Զ��������񡭡�
C:\WINDOWS\System32\svchost.exe -k NetworkService
net start TermService
 
echo.������ɣ���������Խ�����
pause>nul