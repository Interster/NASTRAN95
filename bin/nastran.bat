@echo off
set cwd=%cd%
if "%nasthome%"=="" goto notset
goto run

:run
echo The current work Directory is - %cwd%
set rfdir=%nasthome%\rf
set nasexec=%nasthome%\sb\nastran.exe
set naschk=%nasthome%\sb\chkfil.exe
set tmp=%nasthome%\test\tmp
set projectdir=%nasthome%\test

set probname=%1
set dbmem=200000000
set ocmem=100000000
set ft01=none
set ft04=%probname%.dic
set ft05=%probname%.inp
set ft06=%probname%.out
set ft08=none
set ft11=%probname%.op2
set plt2=none
::set plt2=%probname%.plt
mkdir %nasthome%\test\tmp
set nasscr=%tmp%
set ft12=none
set ft15=none
set ft16=none
set sof1=none
set sof2=none
set sft12=
set nptp=%probname%.nptp
set lognm=%probname%.log
echo ---
echo Input file        : %ft05%     
echo Output file       : %ft06% 
echo Logfile           : %lognm% 
echo Punch file        : %ft01% 
echo Plot file         : %plt2% 
echo Checkpoint NPTP   : %nptp% 
echo Checkpoint dict.  : %ft04% 
echo Restart OPTP      : %optp% 
echo FTN11 file        : %ft11% 
echo FTN12 file        : %ft12% 
echo SOF1 file         : %sof1% 
echo SOF2 file         : %sof2% 
echo FTN15 file        : %ft15% 
echo FTN16 file        : %ft16% 
echo --- 
echo Memory for Open Core    : %ocmem%
echo In-Memory DB Allocation : %dbmem%
echo Work Directory          : %nasscr% %sdir%

set NPTPNM=%nptp%
set PLTNM=%probname%.plt
set DICTNM=%ft04%
set PUNCHNM=%probname%.pnh
set OUT11=%probname%.out11
set IN12=%probname%.in12
set DIRCTY=%nasscr%
set LOGNM=%lognm%
set RFDIR=%rfdir%
set SOF1=%sof1%
set SOF2=%sof2%
set OPTPNM=none
set FTN11=%ft11%
set FTN12=none
set FTN13=none
set FTN14=none
set FTN17=none
set FTN18=none
set FTN19=none
set FTN20=none
set FTN15=none
set FTN16=none
set FTN21=none
set FTN22=none
set FTN23=none
set DBMEM=%dbmem%
set OCMEM=%ocmem%
set FT05=%ft05%
set FT06=%ft06%
set CWD=%cwd%
set PROJ=%projectdir%
echo ---
echo ==== NASTRAN is beginning execution of %probname% ====
%nasexec%
echo ====   NASTRAN has completed problem %probname%   ====
goto end

:notset
echo nasthome enviroment variable is NOT defined - aborting...

:end
