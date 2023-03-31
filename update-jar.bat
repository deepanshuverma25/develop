
rem store the current working directory
pushd .

rem delete the log files
del /q C:\work\projects\TradeFlow\apache-tomcat-8.5.38-fw-postgresql\logs\*
del /q C:\work\projects\TradeFlow\apache-tomcat-8.5.38-fw-postgresql\fw-files\logs\*

rem copy the jar file
copy /Y  target\*1.0.0-RC1-SNAPSHOT.jar C:\work\projects\TradeFlow\apache-tomcat-8.5.38-fw-postgresql\webapps\tds\WEB-INF\lib


rem start the tomcat if argument passed in run
if /I "%1"=="run" (
cd C:\work\projects\TradeFlow\apache-tomcat-8.5.38-fw-postgresql\bin
C:\work\projects\TradeFlow\apache-tomcat-8.5.38-fw-postgresql\bin\startup.bat
popd
)
