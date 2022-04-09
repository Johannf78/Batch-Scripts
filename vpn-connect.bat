@echo off

REM Test Target
set target=10.224.52.1

:start

Ping %target% -n 1 | find "TTL" > NUL
REM echo errorlevel: %errorlevel%

if %errorlevel%==0 (
	echo VPN is connected
) else (
	echo VPN is not connected
	echo VPN is reconnecting
	"C:\Program Files\OpenVPN Connect\OpenVPNConnect.exe" -connect-shortcut=1637325436920
)

timeout 120
goto start