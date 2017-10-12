#!/system/bin/sh
# put in here the name of your problem file
progname="beam"
cwd=$(pwd)
echo The current work Directory is - $cwd
# set this to the correct path
nasthome="/storage/emulated/legacy/Download/N95/"
rfdir="$nasthome/rf"
tmp="$nasthome/test/tmp"
ft05="$progname.inp"
ft06="$progname.out"
nptp="$progname.nptp"
echo Input file is: $ft05
sof1="none"
sof2="none"
projectdir="$nasthome/test"
nasexec="$nasthome/sb/nastran.exe"
cp $nasexec /data/data/com.pdaxrom.cctools/root/cctools/home/
nasexec="/data/data/com.pdaxrom.cctools/root/cctools/home/nastran.exe"
chmod 755 $nasexec
#rm -r $tmp
mkdir -p $tmp
nasscr=$tmp
dbmem="14000000"
ocmem="14000000"
echo ==== NASTRAN is beginning execution of $progname ====
NPTPNM=$nptp;export NPTPNM 
PLTNM="$progname.plt";export PLTNM
DICTNM="none";export DICTNM
PUNCHNM="$progname.pnh" ;export PUNCHNM
OUT11="$progname.out11" ;export OUT11
IN12="$progname.in12" ;export IN12
FTN11="none";export FTN11
FTN12="none";export FTN12
DIRCTY=$nasscr ;export DIRCTY
lognm="$progname.log" 
LOGNM=$lognm;export LOGNM
OPTPNM="none";export OPTPNM
RFDIR=$rfdir ;export RFDIR  
FTN13="none";export FTN13
SOF1=$sof1;export SOF1
SOF2=$sof2  ;export SOF2
FTN14="none";export FTN14
FTN17="none";export FTN17
FTN18="none";export FTN18
FTN19="none";export FTN19
FTN20="none";export FTN20
FTN15="none";export FTN15
FTN16="none";export FTB16
FTN21="none";export FTN21
FTN22="none";export FTN22
FTN23="none";export FTN23
DBMEM=$dbmem;export DBMEM
OCMEM=$ocmem ;export OCMEM
FT05=$ft05;export FT05
FT06=$ft06;export FT06
CWD=$cwd;export CWD
PROJ=$projectdir;export PROJ
#printenv
rm $nptp
$nasexec
echo ===== NASTRAN has completed problem $progname =====

