@echo off

if NOT "%1" == "" goto _run
echo.
echo Example: %0 192.168.5
echo.

goto _end

:_run
echo Scan subnet %1.0/24 ... ...
for /L %%v in (1,1,254) do start /min ping -n 1 %1.%%v

rem sleep for 2sec.
ping 127.0.0.1 -n 5 > nul

arp -a | find "%1."

:_end
