      SUBROUTINE SOFO
C
C     MODULE USED TO TRANSFER NASTRAN DATA BLOCKS TO THE SOF FILE FOR
C     PURPOSES OF SAVING THE DATA FOR SUBSEQUENT RUNS OR SUBSEQUENT
C     EXECUTION STEPS.  THE CALLING SEQUENCE TO THE MODULE IS
C
C     SOFO     A,B,C,D,E//V,N,DRY/C,N,NAME/C,N,IA/C,N,IB/C,N,IC/
C                         C,N,ID/C,N,IE $
C
      INTEGER         SYSBUF,DRY,FILE,XXXX
      DIMENSION       FILE(5),MODNAM(2),MCB(7)
      CHARACTER       UFM*23,UWM*25
      COMMON /XMSSG / UFM,UWM
      COMMON /BLANK / DRY,NAME(2),ITEMS(2,5)
      COMMON /ZZZZZZ/ IZ(1)
      COMMON /SYSTEM/ SYSBUF,NOUT
      DATA    FILE  / 101,102,103,104,105/
      DATA    MODNAM/ 4HSOFO,4H    /
      DATA    IBLNK , XXXX / 4H    ,4HXXXX/
C
      DO 5 I = 1,5
      IF (ITEMS(1,I).EQ.XXXX .OR. ITEMS(1,I).EQ.0) ITEMS(1,I) = IBLNK
    5 CONTINUE
C
      IF (DRY .LT. 0) RETURN
      NZ = KORSZ(IZ)
      IF (3*SYSBUF .GT. NZ) CALL MESAGE (-8,0,MODNAM(1))
      IB1 = NZ  - SYSBUF + 1
      IB2 = IB1 - SYSBUF - 1
      IB3 = IB2 - SYSBUF
      CALL SOFOPN (IZ(IB1),IZ(IB2),IZ(IB3))
C
C     COPY MATRICES FROM NASTRAN DATA BLOCKS TO SOF.
C
      DO 50 I = 1,5
      IF (ITEMS(1,I) .EQ. IBLNK) GO TO 50
      MCB(1) = FILE(I)
      CALL RDTRL (MCB)
      IF (MCB(1) .LT. 0) GO TO 50
      CALL MTRXO (FILE(I),NAME(1),ITEMS(1,I),0,ITEST)
      GO TO (10,50,50,20,30,50), ITEST
   10 WRITE (NOUT,1010) UWM,ITEMS(1,I),NAME(1),NAME(2)
      DRY = -2
      GO TO 50
   20 WRITE (NOUT,1020) UWM,NAME(1),NAME(2)
      DRY = -2
      GO TO 60
   30 WRITE (NOUT,1030) UWM,ITEMS(1,I)
      DRY = -2
   50 CONTINUE
   60 CALL SOFCLS
      RETURN
C
C     ERROR MESSAGES.
C
 1010 FORMAT (A25,' 6211, MODULE SOFO - ITEM ',A4,' OF SUBSTRUCTURE ',
     1        2A4,' HAS ALREADY BEEN WRITTEN.')
 1020 FORMAT (A25,' 6212, MODULE SOFO - THE SUBSTRUCTURE ',2A4,
     1       ' DOES NOT EXIST.')
 1030 FORMAT (A25,' 6213, MODULE SOFO - ',A4,' IS AN ILLEGAL ITEM NAME')
      END
