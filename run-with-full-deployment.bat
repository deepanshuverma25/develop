rem stop the tomcat - 
rem change the working directory for this batch file
rem cd C:\work\projects\TradeFlow\apache-tomcat-8.5.38\bin
rem call START /W C:\work\projects\TradeFlow\apache-tomcat-8.5.38\bin\shutdown.bat
rem exit

pushd C:\projects\nrs\bb-codebase
rem delete the log files
del /q C:\projects\nrs\apache-tomcat-8.5.38\logs\*
del /q C:\projects\nrs\apache-tomcat-8.5.38\fw-files\logs\*

rem delete the nrsapi webapp
rmdir /Q /S C:\projects\nrs\apache-tomcat-8.5.38\webapps\nrsapi

rem ren C:\projects\nrs\bb-codebase\deploy\target\nrsapi

rem rename the webapp folder in deploy directory
ren C:\projects\nrs\bb-codebase\deploy\target\fw.deploy-1.0.0-RC1-SNAPSHOT nrsapi

rem deploy nrs webapp in tomcat
xcopy /E /H /C /R /Q /Y /I C:\projects\nrs\bb-codebase\deploy\target\nrsapi C:\projects\nrs\apache-tomcat-8.5.38\webapps\nrsapi

cd C:\projects\nrs\bb-codebase
rem start the tomcat
cd C:\projects\nrs\apache-tomcat-8.5.38\bin
C:\projects\nrs\apache-tomcat-8.5.38\bin\startup.bat

cd C:\projects\nrs\bb-codebase