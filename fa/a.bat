@echo off
if "%1"=="" goto error
iverilog -s TEST -o %~n1 %~nx1
vvp %~n1 > %~n1.output

pause
exit

:error
echo ƒGƒ‰[
pause
exit
