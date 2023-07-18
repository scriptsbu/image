@echo off
color 4
title AddAdminPriv


@echo !!!!!!!!!!!!!!!BE SURE TO HAVE THE USER CONNECTED TO THE VPN ON EMPLOYEE-FULL-PUSH!!!!!!!!!!!!!!!

@echo !!!!!!!!!!!!!!!EDIT THIS .BAT FILE ALTER EGO ACCOUNT TO YOUR OWN ACCOUNT BEFORE PROCEEDING!!!!!!!!!!!!!!!

Pause

systeminfo | findstr /B "Domain"

@echo VERIFY THAT THE MACHINE HAS DOMAIN JOINED AS TORCROBOTICS.NET
pause

runas /user:torcrobotics\alberto.santiago.1 "cmd.exe /k lusrmgr.msc"

@echo RUN lusrmgr.msc IN THE NEWLY OPENED CMD IF IT DIDN'T OPEN.

pause