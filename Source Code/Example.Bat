@Echo off
cls
Title Circle Function Usage - Demo - www.thebateam.org - Example By Kvc
Set "Path=%Path%;%CD%;%CD%\Files;"

Setlocal enabledelayedexpansion
Echo. Click on any two points points / locations on console...
:Start
Set _Point_1_X=
Set _Point_1_Y=
Set _Point_2_X=
Set _Point_2_Y=
Set _OK=F
:Mid
for /f "Tokens=1,2,3 delims=:" %%A in ('batbox /m') do (
	If /i "!_Point_1_X!" == "" (Set _Point_1_X=%%A && Set _Point_1_Y=%%B && Set _OK=F) ELSE (Set _Point_2_X=%%A && Set _Point_2_Y=%%B && Set _OK=T)
)
If /i "!_OK!" == "T" (
	Set /A Radius=!_Point_1_X!-!_Point_2_X!
	Set Radius=!Radius:-=!
	Call Circle !_Point_1_X! !_Point_1_Y! !Radius! x 0f
	Goto :Start
	)
batbox /c 0x08 /g !_Point_1_X! !_Point_1_Y! /d x
Goto :mid