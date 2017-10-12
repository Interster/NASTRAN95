# what flags you want to pass to the Fortran compiler & linker
FFLAGS = -g -w -fno-range-check -fno-automatic -fcray-pointer -std=legacy

# this lists the binaries to produce, the (non-PHONY, binary) targets in
# the previous manual Makefile
bin_PROGRAMS = nastran
nastran_SOURCES = bckrec.f  dbmdmp.f  dsbrc1.f  dsnmdd.f	dsskrc.f  exfowr.f  klock.f   savpos.f \
bldpk.f   dbmfdp.f  dsclos.f  dsnmrd.f	dsspos.f  fbsv.f    logfil.f  second.f \
bldpki.f  dbmint.f  dscpos.f  dsnmwr.f	dsupkc.f  filpos.f  mapfns.f  sgino.f \
bldpkn.f  dbmio.f   dsefwr.f  dsocff.f	dswrit.f  fornum.f  mpyq.f    skpfil.f \
bpack.f   dbmlbk.f  dsfwr1.f  dsopen.f	dswrnb.f  forwrt.f  nasopn.f  sofio.f \
btstrp.f  dbmmgr.f  dsgefl.f  dsopff.f	dswrt1.f  fwdrec.f  nastim.f  tdate.f \
bufchk.f  dbmmov.f  dsgncl.f  dsprcl.f	dsxfsz.f  getstb.f  nastrn.f  umffd.f \
bunpak.f  dbmnam.f  dsgnop.f  dsrdmb.f	dszbkk.f  getstr.f  numtyp.f  unpack.f \
bunpk.f   dbmrel.f  dsgnrd.f  dsrdnb.f	dummy.f   geturn.f  open.f    vaxsch.f \
dbmrlb.f  dsgnwr.f  dsrdpb.f	emgsoc.f  gnfiat.f  pack.f    waltim.f \
close.f   dbmsrf.f  dshxdd.f  dsread.f	endget.f  ibmopn.f  putstr.f  write.f \
conmsg.f  dbmstf.f  dshxdp.f  dsrlse.f	endgtb.f  intpk.f   qopen.f   wrtblk.f \
corwds.f  defcor.f  dsinqr.f  dssdcb.f	endput.f  intpki.f  rdblk.f   wrtfmt.f \
cputim.f  delscr.f  dsiodd.f  dssend.f	eof.f	  k2b.f     read.f    xsem00.f \
dbmalb.f  dmpmat.f  dsipk1.f  dssize.f	errtrc.f  khrbcd.f  rectyp.f  zblpki.f \
dbmdfc.f  dsblpk.f  dsmsg1.f  dsskfb.f	exford.f  khrfn1.f  rewind.f  zntpki.f \
dbmdia.f  dsbpnk.f  dsmsg.f   dsskff.f	exfort.f  khrfn4.f  rfopen.f

nastran_LDADD = ../mis/libnastran.a ../bd/libnastbd.a

