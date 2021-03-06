      SUBROUTINE SUBC
C
      COMPLEX         GUSAMP,SBKDE1,SBKDE2,
     1                F4,F4S,AM4,F5S,F6S,AM4TST,SUM3,SUM4,AM5TT,AM6,
     2                SUMSV1,SUMSV2,SVKL1,SVKL2,F5,F5T,AM5,AM5T,
     3                AI,A,B,BSYCON,ALP,F1,AM1,ALN,BLKAPM,BKDEL3,F1S,C1,
     4                C2P,C2N,
     5                C2,AMTEST,FT2,BLAM1,FT3,AM2,SUM1,SUM2,F2,BLAM2,
     6                FT2T,C1T,FT3T,F2P,AM2P,SUM1T,SUM2T,
     7                C1P,C1N,BKDEL1,BKDEL2,BLKAP1,ARG,ARG2,
     8                FT3TST,C1A,C2A,C3A,CEXP1,CEXP2,CEXP3,CEXP1A,
     9                CEXP2A,CEXP3A,CONST,
     O                BC,BC2,BC3,BC4,BC5,CA1,CA2,CA3,CA4,
     1                CLIFT,CMOMT,C4A,CEXP4,CEXP5,CEXP4A,CEXP5A,
     2                PRES1,PRES2,PRES3,PRES4,QRES4,FQA,FQB,T1,T2,T3,FQ7
      DIMENSION       PRES1(21),PRES2(21),PRES3(21),PRES4(21),QRES4(21),
     1                SBKDE1(201),SBKDE2(201),
     2                SUMSV1(201),SUMSV2(201),SVKL1(201),SVKL2(201),
     3                XLSV1(21),XLSV2(21),XLSV3(21),XLSV4(21)
      CHARACTER       UFM*23
      COMMON /XMSSG / UFM
      COMMON /SYSTEM/ SYSBUF,IBBOUT
      COMMON /BLK1  / SCRK,SPS,SNS,DSTR,AI,PI,DEL,SIGMA,BETA,RES
      COMMON /BLK2  / BSYCON
      COMMON /BLK3  / SBKDE1,SBKDE2,F4,F4S,AM4,F5S,F6S,AM4TST,SUM3,SUM4,
     1                AM5TT,AM6,SUMSV1,SUMSV2,SVKL1,SVKL2,F5,F5T,AM5,
     2                AM5T,A,B,ALP,F1,AM1,ALN,BLKAPM,BKDEL3,F1S,C1,C2P,
     3                C2N,C2,AMTEST,FT2,BLAM1,FT3,AM2,SUM1,SUM2,F2,
     4                BLAM2,FT2T,C1T,FT3T,F2P,AM2P,SUM1T,SUM2T,C1P,C1N,
     5                BKDEL1,BKDEL2,BLKAP1,ARG,ARG2,FT3TST,BC,BC2,BC3,
     6                BC4,BC5,CA1,CA2,CA3,CA4,CLIFT,CMOMT,PRES1,PRES2,
     7                PRES3,PRES4,QRES4,FQA,FQB,FQ7
      COMMON /BLK4  / I,R,Y,A1,B1,C4,C5,GL,I6,I7,JL,NL,RI,RT,R5,SN,SP,
     1                XL,Y1,AMU,GAM,IDX,INX,NL2,RL1,RL2,RQ1,RQ2,XL1,
     2                ALP1,ALP2,GAMN,GAMP,INER,IOUT,REDF,STAG,STEP,
     3                AMACH,BETNN,BETNP,BKAP1,XLSV1,XLSV2,XLSV3,XLSV4,
     4                ALPAMP,AMOAXS,GUSAMP,DISAMP,PITAXS,PITCOR
C
      AM4TST = 0.0
      S1 = SPS*DEL - SIGMA
      S2 = SPS/(DSTR**2)
      S3 = SNS/DSTR
      S4 = SPS + SNS
      T3 = CEXP(-AI*SIGMA)
      DO 70 I = 1,200
      R  = I
      GAMP = 2.0*PI*R + S1
      GAMN =-2.0*PI*R + S1
      C1P = (GAMP/DSTR) - SCRK
      C2P = (GAMP/DSTR) + SCRK
      ALP = GAMP*S2 - S3*CSQRT(C1P)*CSQRT(C2P)
      T1  = ALP - DEL
      CALL AKAPM (ALP,BKDEL3)
      SBKDE1(I+1) = BKDEL3
      SUM1 = CEXP(AI*(ALP*SPS-GAMP))*(ALP*SPS-GAMP)*BKDEL3/((ALP*DSTR**2
     1     - GAMP*SPS)*T1)*(F6S*T1/(T1+GL) + F5S
     2     + B*AI/(BKDEL1*BKAP1)*(DEL-AMU)/(ALP-DEL))
      C1N  = (GAMN/DSTR) - SCRK
      C2N  = (GAMN/DSTR) + SCRK
      ALN  = GAMN*S2 - S3*CSQRT(C1N)*CSQRT(C2N)
      T2   = ALN - DEL
      CALL AKAPM (ALN,BKDEL3)
      SBKDE2(I+1) = BKDEL3
      SUM2 = CEXP(AI*(ALN*SPS-GAMN))*(ALN*SPS-GAMN)*BKDEL3/((ALN*DSTR**2
     1     - GAMN*SPS)*T2)*(F6S*(T2)/(T2+GL) + F5S
     2     + B*AI/(BKDEL1*BKAP1)*(DEL-AMU)/(T2))
      C1P  = CEXP(-AI*(T1)*SPS)
      C2P  = CEXP(-AI*(T1)*SNS)
      C1N  = CEXP(-AI*(T2)*SPS)
      C2N  = CEXP(-AI*(T2)*SNS)
      F4   = F4 + SUM1*T3*AI/(T1)*(C1P-C2P) + SUM2*T3*AI/(T2)*(C1N-C2N)
      AM4  = AM4 + SUM1*T3*(AI*SPS*C1P/(T1) - AI*SNS*C2P/(T1) + 1.0/
     1       ((T1)**2)*(C1P-C2P)+AI*(2.0-SPS)/(T1)*(C1P-C2P)) +
     2       SUM2*T3*(AI*SPS*C1N/(T2)-AI*SNS*C2N/(T2) + 1.0/
     3       ((T2)**2)*(C1N-C2N) + AI*(2.0-SPS)/(T2)*(C1N-C2N))
      I6   = I + 1
      TEMP = (SPS-SNS)/RL1
      C1A  =-AI*T1
      C2A  =-AI*T2
      C3A  = AI*DEL
      CEXP1  = CEXP(C1A*SNS)
      CEXP2  = CEXP(C2A*SNS)
      CEXP3  = CEXP(C3A*SNS)
      CEXP1A = CEXP(C1A*TEMP)
      CEXP2A = CEXP(C2A*TEMP)
      CEXP3A = CEXP(C3A*TEMP)
      CONST  = FQ7/(2.0*PI)
      TEMP2  = 2.0*PI*R/S4
      C4A    =-AI*S1
      CEXP4  = CEXP(C4A*(2.0*SNS/S4+0.5))
      CEXP5  = CEXP(C4A*0.5)
      CEXP4A = CEXP(C4A*TEMP/S4)
      CEXP5A = CEXP(C4A*TEMP/(SPS+SNS))
      XL     = SNS
      DO 459 JL = 1,NL
      PRES4(JL) = PRES4(JL) - T3*(SUM1*CEXP1 + SUM2*CEXP2
     1          + CONST*CEXP3*(CEXP4*SIN(TEMP2*(SNS+XL))/R
     2          - CEXP5*SIN(TEMP2*(SPS+XL))/R))
      XL    = XL + TEMP
      CEXP1 = CEXP1*CEXP1A
      CEXP2 = CEXP2*CEXP2A
      CEXP3 = CEXP3*CEXP3A
      CEXP4 = CEXP4*CEXP4A
      CEXP5 = CEXP5*CEXP5A
  459 CONTINUE
      IF (CABS((AM4-AM4TST)/AM4) .LT. 0.0006) GO TO 75
      AM4TST = AM4
   70 CONTINUE
      GO TO 9994
   75 CONTINUE
      TEMP  = (SPS-SNS)/RL1
      TEMP1 = 2.0*SNS/S4 + 0.5
      TEMP2 = 0.5 - (SPS+SNS)/S4
      C1A   = AI*DEL
      C2A   =-AI*S1
      C3A   =-C2A
      CEXP1 = CEXP(C1A*SNS)
      CEXP2 = CEXP(C2A*TEMP1)
      CEXP3 = CEXP(C3A*TEMP2)
      CEXP1A= CEXP(C1A*TEMP)
      CEXP2A= CEXP(C2A*TEMP/S4)
      CONST = T3*FQ7/2.0
      XL    = SNS
      DO 4596 JL = 1,NL
      PRES4(JL) = PRES4(JL) - CONST*CEXP1*(CEXP2*((SNS+XL)/S4-0.5)
     1          - CEXP3*((SPS+XL)/S4-1.5))
      XL    = XL + TEMP
      CEXP1 = CEXP1*CEXP1A
      CEXP2 = CEXP2*CEXP2A
      CEXP3 = CEXP3*CEXP2A
 4596 CONTINUE
      CALL SUBCC
      RETURN
C
 9994 WRITE  (IBBOUT,3015) UFM
 3015 FORMAT (A23,' - AMG MODULE -SUBROUTINE SUBC.  AM4 LOOP DID NOT ',
     1       'CONVERGE.')
      CALL MESAGE (-61,0,0)
      RETURN
      END
