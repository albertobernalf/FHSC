SELECT * FROM HOSVITAL.MOVBAN;
SELECT *  FROM HOSVITAL.CONCIECAJ;
SELECT *  FROM HOSVITAL.CIECAJA WHERE CCJFCH >= '2021-01-01 00:00:00';
SELECT *  FROM HOSVITAL.CIECAJA1 C1 WHERE (C1.DOCCOD, C1.CCJCOD) IN (SELECT C.DOCCOD, C.CCJCOD FROM HOSVITAL.CIECAJA C WHERE C.CCJFCH >= '2021-01-01 00:00:00' AND C.DOCCOD=C1.DOCCOD AND C.CCJCOD=C1.CCJCOD);
SELECT * FROM HOSVITAL.ACTFIJ  WHERE ACFCHACT >='2021-01-01';
SELECT * FROM HOSVITAL.ACTFIJCLA;
SELECT * FROM HOSVITAL.ACTFIJTMP WHERE FCHREG >='2021-01-01 00:00:00';
SELECT * FROM HOSVITAL.ACTFIJTRA1 WHERE ACFFCHTRA>= '2021-01-01';
SELECT * FROM HOSVITAL.ACTDEP;
SELECT * FROM HOSVITAL.MOVACTFIJ  WHERE MOVACTFCH >= '2015-01-01 00:00:00';
SELECT * FROM HOSVITAL.MOVACTFIJ1;
SELECT * FROM HOSVITAL.HOJOBLPRV ;
SELECT * FROM HOSVITAL.MOVCXP CXP WHERE  CXP.MVCXPNUOB IN ( SELECT H.HOPNOOBL FROM HOSVITAL.HOJOBLPRV H   WHERE (H.HOPVLROBL - H.HOPTOTCRE <> 0) AND  (H.HOPVLROBL - H.HOPTOTDEB <> 0) AND H.HOJFCHCAN <> '0001-01-01');
SELECT * FROM HOSVITAL.HOJOBLPRV WHERE (HOPVLROBL - HOPTOTCRE <> 0) AND  (HOPVLROBL - HOPTOTDEB <> 0) AND HOJFCHCAN <> '0001-01-01';
SELECT * FROM HOSVITAL.NIMOVCXP  NI WHERE NI.NIMCPNO IN (SELECT  NI2.NIHOPNO FROM HOSVITAL.NIHOJOBLP NI2 WHERE (NI2.NIHOPVO -  NI2.NIHOPTC <> 0) AND  (NI2.NIHOPVO -  NI2.NIHOPTD <> 0)  AND NI2.NIHOPFC <> '0001-01-01'); 
SELECT * FROM HOSVITAL.NIHOJOBLP WHERE (NIHOPVO -  NIHOPTC <> 0) AND  (NIHOPVO -  NIHOPTD <> 0)  AND NIHOPFC <> '0001-01-01';   
SELECT * FROM HOSVITAL.NIHOJOBLCXC WHERE NIHOJFO >='2019-01-01 00:00:00';
SELECT COUNT(*) FROM HOSVITAL.INGRESOS;   -- 742702	
SELECT * FROM HOSVITAL.INGRESOS I
WHERE I.INGCSC IN (SELECT MAX(I2.INGCSC) FROM HOSVITAL.INGRESOS I2 WHERE I2.MPTDOC=I.MPTDOC  AND I2.MPCEDU=I.MPCEDU);
ORDER BY I.MPTDOC,I.MPCEDU;
SELECT * FROM HOSVITAL.INGRESOMP I
WHERE I.INGCSC IN (SELECT MAX(I2.INGCSC) FROM HOSVITAL.INGRESOS I2 WHERE I2.MPTDOC=I.MPTDOC  AND I2.MPCEDU=I.MPCEDU)
ORDER BY I.MPTDOC,I.MPCEDU;
SELECT * FROM HOSVITAL.MAEPAB;
SELECT * FROM HOSVITAL.MAEPAB1;
SELECT * FROM HOSVITAL.MAEPAB11 M
WHERE M.HISCNSING IN (SELECT MAX(I2.INGCSC) FROM HOSVITAL.INGRESOS I2 WHERE I2.MPTDOC=M.MPTDOC  AND I2.MPCEDU=M.MPCEDU)
ORDER BY M.MPTDOC, M.MPCEDU;
SELECT * FROM HOSVITAL.ABONOS WHERE ABOFCH >= '2021-01-01';
SELECT * FROM HOSVITAL.ABONOS1 A1 WHERE (A1.ABODOC,A1.ABONUM) IN (SELECT A1.ABODOC, A.ABONUM A FROM HOSVITAL.ABONOS A WHERE A.ABOFCH >= '2021-01-01' AND A.ABODOC=A1.ABODOC AND A.ABONUM= A1.ABONUM) ;
-- EL ULTIMO INGRESO DEL PACIENTE
SELECT * FROM HOSVITAL.CITMED;
SELECT * FROM HOSVITAL.CITMED1;
SELECT * FROM HOSVITAL.CITMED11 WHERE CITNAFEC >= '2021-01-01 00:00:00';
SELECT * FROM HOSVITAL.CITMED2 WHERE CITFECME >= '2021-01-01';
SELECT * FROM HOSVITAL.CITMED3;
SELECT * FROM HOSVITAL.CITMED31;
SELECT * FROM HOSVITAL.DSPFRMC1;
SELECT * FROM HOSVITAL.PROCIR WHERE PROFEC >=  '2021-01-01';;
SELECT * FROM HOSVITAL.PROCIR1 P1 WHERE P1.PROCIRCOD IN (SELECT P.PROCIRCOD FROM HOSVITAL.PROCIR P WHERE P.PROFEC >= '2021-01-01');
SELECT * FROM HOSVITAL.PROCIR2 P2  WHERE P2.PROCIRCOD IN (SELECT P.PROCIRCOD FROM HOSVITAL.PROCIR P WHERE P.PROFEC >= '2021-01-01'); ;
SELECT * FROM HOSVITAL.PROCIR3 P3  WHERE P3.PROCIRCOD IN (SELECT P.PROCIRCOD FROM HOSVITAL.PROCIR P WHERE P.PROFEC >= '2021-01-01');;
SELECT * FROM HOSVITAL.PROCIR4  P4  WHERE P4.PROCIRCOD IN (SELECT P.PROCIRCOD FROM HOSVITAL.PROCIR P WHERE P.PROFEC >= '2021-01-01');;
SELECT * FROM HOSVITAL.DESCIRMED D WHERE D.CODCIR  IN (SELECT P.PROCIRCOD FROM HOSVITAL.PROCIR P WHERE P.PROFEC >= '2021-01-01');; ;
SELECT * FROM HOSVITAL.DESCIRMED1 D1 WHERE D1.CODCIR  IN (SELECT P.PROCIRCOD FROM HOSVITAL.PROCIR P WHERE P.PROFEC >= '2021-01-01');; ;;
SELECT * FROM HOSVITAL.MONRECANS M WHERE M.PROCIRCOD IN (SELECT P.PROCIRCOD FROM HOSVITAL.PROCIR P WHERE P.PROFEC >= '2021-01-01');;;
SELECT * FROM HOSVITAL.TURQUI T WHERE T.PROCIRCOD IN (SELECT P.PROCIRCOD FROM HOSVITAL.PROCIR P WHERE P.PROFEC >= '2021-01-01');;
SELECT * FROM HOSVITAL.TURQUI1 T1 WHERE T1.PROCIRCOD IN (SELECT P.PROCIRCOD FROM HOSVITAL.PROCIR P WHERE P.PROFEC >= '2021-01-01');;;
SELECT *  FROM HOSVITAL.HCCOM6;
SELECT *  FROM HOSVITAL.HCCOM1DES;
SELECT *  FROM HOSVITAL.HCCOM61;
SELECT * FROM HOSVITAL.HCCOM HX WHERE (HX.HISTIPDOC, HX.HISCKEY ) IN (    SELECT T.TFTDOC, T.TFCEDU FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=HX.HISTIPDOC AND T.TFCEDU=HX.HISCKEY    ) ;;
SELECT * FROM HOSVITAL.HCCOM1 H WHERE (H.HISTIPDOC, H.HISCKEY, H.HCTVIN1) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY AND T.TMCTVING = H.HCTVIN1 ) ;
SELECT * FROM HOSVITAL.HCCOM1DES HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOM2DES  HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOM3DES  HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOM33 HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOM44 HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOM5 H WHERE (H.HISTIPDOC, H.HISCKEY, H.HCTVIN5) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY AND T.TMCTVING = H.HCTVIN5 ) ;;
SELECT * FROM HOSVITAL.HCCOM51 H WHERE (H.HISTIPDOC, H.HISCKEY, H.HCTVIN51) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY AND T.TMCTVING = H.HCTVIN51 ) ;;
SELECT * FROM HOSVITAL.HCCOM51R HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOM511 HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOM6 HX WHERE (HX.HISTIPDOC, HX.HISCKEY ) IN (    SELECT T.TFTDOC, T.TFCEDU FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=HX.HISTIPDOC AND T.TFCEDU=HX.HISCKEY    ) ;;
SELECT * FROM HOSVITAL.HCCOM61 HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOM7 HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOM8 HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOM9 HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.HCCOMEVOS HX  WHERE (HX.HISTIPDOC, HX.HISCKEY, HX.HISCSEC) IN ( SELECT H.HISTIPDOC, H.HISCKEY, H.HISCSEC FROM HOSVITAL.HCCOM2DES H WHERE (H.HISTIPDOC, H.HISCKEY, H.HISCSEC) IN (SELECT T.TFTDOC, T.TFCEDU, T.TMCTVING FROM HOSVITAL.TMPFAC T WHERE T.TFTDOC=H.HISTIPDOC AND T.TFCEDU=H.HISCKEY )   ) ;
SELECT * FROM HOSVITAL.ENVHR WHERE ENVFECORI>= '2021-01-01 00:00:00' ;
SELECT * FROM HOSVITAL.ENVHR1 E WHERE (E.DOCCOD, E.ENVNRO) IN (SELECT E1.DOCCOD, E1.ENVNRO FROM HOSVITAL.ENVHR E1  WHERE E1.DOCCOD=E.DOCCOD AND E1.ENVNRO= E.ENVNRO); 
SELECT * FROM HOSVITAL.AUDSERV  WHERE AUTFECSOL>= '2021-01-01';;
SELECT * FROM HOSVITAL.AUDSERV1  A1 WHERE (A1.DOCCOD,A1.AUTCSC) IN (SELECT A.DOCCOD, A.AUTCSC FROM HOSVITAL.AUDSERV A  WHERE A.AUTFECSOL>= '2021-01-01');
SELECT * FROM HOSVITAL.AUDSERV2 A2 WHERE (A2.DOCCOD,A2.AUTCSC) IN (SELECT A.DOCCOD, A.AUTCSC FROM HOSVITAL.AUDSERV A  WHERE A.AUTFECSOL>= '2021-01-01');;
SELECT * FROM HOSVITAL.AUDSERV3 A3 WHERE (A3.DOCCOD,A3.AUTCSC) IN (SELECT A.DOCCOD, A.AUTCSC FROM HOSVITAL.AUDSERV A  WHERE A.AUTFECSOL>= '2021-01-01');;
SELECT * FROM HOSVITAL.REFCREF WHERE REFFCH >= '2021-01-01 00:00:00';
SELECT * FROM HOSVITAL.REPEXC;
SELECT * FROM HOSVITAL.REPEXC1;
SELECT * FROM HOSVITAL.REPEXC2;
SELECT * FROM HOSVITAL.REPEXC3;
SELECT * FROM HOSVITAL.REPEXC4;
SELECT * FROM HOSVITAL.REPEXC5;
SELECT * FROM HOSVITAL.ADGLOSAS WHERE GLOFCHREC >= '2021-01-01';
SELECT * FROM HOSVITAL.ADGLOSAS1 WHERE MPNFAC IN (SELECT MPNFAC  FROM HOSVITAL.ADGLOSAS WHERE GLOFCHREC >= '2021-01-01') ;
SELECT * FROM HOSVITAL.ADGLOSAS3 WHERE MPNFAC IN (SELECT MPNFAC  FROM HOSVITAL.ADGLOSAS WHERE GLOFCHREC >= '2021-01-01') ;;
SELECT * FROM HOSVITAL.ADMGLO01 WHERE AGLREMFC >= '2021-01-01';
SELECT * FROM HOSVITAL.ADMGLO11  WHERE MPNFAC IN (SELECT MPNFAC  FROM HOSVITAL.ADMGLO01 WHERE AGLREMFC >= '2021-01-01');
SELECT * FROM HOSVITAL.INTERCN  WHERE INTFCHRSL >= '2021-01-01 00:00:00';
SELECT * FROM HOSVITAL.INTERCN1  WHERE (HISTIPDOC, HISCKEY, HISCSEC) IN (SELECT HISTIPDOC, HISCKEY, HISCSEC FROM HOSVITAL.INTERCN  WHERE INTFCHRSL >= '2021-01-01 00:00:00') ;
SELECT * FROM HOSVITAL.DATSOAT;
SELECT * FROM HOSVITAL.EMPTRAAFI;
SELECT * FROM HOSVITAL.EMPTRAAFI1;
SELECT * FROM HOSVITAL.FACTUR;
SELECT * FROM HOSVITAL.FCTAG02;
SELECT * FROM HOSVITAL.FCTAG03;
SELECT * FROM HOSVITAL.FCTAG04;
SELECT * FROM HOSVITAL.FCTAG04X;
SELECT * FROM HOSVITAL.FLUJCAJA;
SELECT * FROM HOSVITAL.FLUJCAJA1;
SELECT * FROM HOSVITAL.FLUJCAJA11;
SELECT * FROM HOSVITAL.LIQUIDOS;
SELECT * FROM HOSVITAL.LIQUIDOS1;
SELECT * FROM HOSVITAL.PQUEUE;
SELECT * FROM HOSVITAL.PQUEUE1;
SELECT * FROM HOSVITAL.MOVBAN WHERE MVBFCH>= '2021-01-01 00:00:00' ;
SELECT * FROM HOSVITAL.MOVBAN1 M1 WHERE (M1.DOCCOD,M1.MVBNROCMP) IN (SELECT M.DOCCOD, M.MVBNROCMP  FROM HOSVITAL.MOVBAN M WHERE M.MVBFCH>= '2021-01-01 00:00:00'  AND M.DOCCOD=M1.DOCCOD AND M.MVBNROCMP =  M1.MVBNROCMP) ;
SELECT * FROM HOSVITAL.MOVBAN2  M2  WHERE (M2.DOCCOD,M2.MVBNROCMP) IN (SELECT M.DOCCOD, M.MVBNROCMP  FROM HOSVITAL.MOVBAN M WHERE M.MVBFCH>= '2021-01-01 00:00:00'  AND M.DOCCOD=M2.DOCCOD AND M.MVBNROCMP =  M2.MVBNROCMP) ;	
SELECT * FROM HOSVITAL.ADGLOSAS WHERE GLOFCHREC>= '2021-01-01';
SELECT * FROM HOSVITAL.ADGLOSAS1 AD1 WHERE (AD1.MPNFAC) IN (SELECT AD.MPNFAC FROM HOSVITAL.ADGLOSAS AD WHERE AD.MPNFAC = AD1.MPNFAC);
SELECT * FROM HOSVITAL.ADGLOSAS3  AD3 WHERE (AD3.MPNFAC) IN (SELECT AD.MPNFAC FROM HOSVITAL.ADGLOSAS AD WHERE AD.MPNFAC = AD3.MPNFAC);
SELECT * FROM HOSVITAL.ADMGLO01 WHERE AGLREMFC >= '2021-01-01';
SELECT * FROM HOSVITAL.ADMGLO11 ADM WHERE (ADM.AGLDOCCD, ADM.AGLREMNR) IN (SELECT ADM1.AGLDOCCD, ADM1.AGLREMNR ADM1 FROM HOSVITAL.ADMGLO01 ADM1 WHERE ADM1.AGLREMFC >= '2021-01-01' AND
ADM1.AGLDOCCD=ADM.AGLDOCCD AND ADM1.AGLREMNR=ADM.AGLREMNR);
SELECT * FROM HOSVITAL.BODEGAS;
SELECT * FROM HOSVITAL.BODEGAS1;
SELECT * FROM HOSVITAL.BODUSR;
SELECT * FROM HOSVITAL.MAEDMB3;

SELECT * FROM HOSVITAL.DOCCONCEN;
SELECT * FROM HOSVITAL.ESTREQ;
SELECT * FROM HOSVITAL.FINSERV;
SELECT * FROM HOSVITAL.MAEDIA;
SELECT * FROM HOSVITAL.MAEFLAG;
SELECT * FROM HOSVITAL.MARCAS;
SELECT  * FROM HOSVITAL.PABPUNRUT;
SELECT * FROM HOSVITAL.PEDPAQQX;
SELECT * FROM HOSVITAL.MAEPAC;
SELECT * FROM HOSVITAL.PUNRUT;
SELECT * FROM HOSVITAL.PUNRUTASO;
SELECT * FROM HOSVITAL.PUNRUTUSU;
SELECT * FROM HOSVITAL.PUNRUTUSU1;
SELECT * FROM HOSVITAL.REPEXC;
SELECT * FROM HOSVITAL.REPEXC1;
SELECT * FROM HOSVITAL.REPEXC2;
SELECT * FROM HOSVITAL.REPEXC3;
SELECT * FROM HOSVITAL.MAEESP;
SELECT * FROM HOSVITAL.MAEESP1;
SELECT * FROM HOSVITAL.MAEESP2;
SELECT * FROM HOSVITAL.MAEESP3;
SELECT * FROM HOSVITAL.MAEESP4;
SELECT * FROM HOSVITAL.MAEDIR;
SELECT * FROM HOSVITAL.MAEDMB;
SELECT * FROM HOSVITAL.MAEDMB1;
SELECT * FROM HOSVITAL.MAEDMB2;
SELECT * FROM HOSVITAL.MAEDMB3;
SELECT * FROM HOSVITAL.MAEESP;
SELECT * FROM HOSVITAL.MAEESP1;
SELECT * FROM HOSVITAL.MAEESP2;
SELECT * FROM HOSVITAL.MAEESP3;
SELECT * FROM HOSVITAL.MAEESP4;
SELECT * FROM HOSVITAL.MAEDIR;
SELECT * FROM HOSVITAL.MAEDMB;
SELECT * FROM HOSVITAL.MAEDMB1;
SELECT * FROM HOSVITAL.MAEDMB2;
SELECT * FROM HOSVITAL.MAEDMB3;
SELECT * FROM HOSVITAL.MAECAUE;
SELECT * FROM HOSVITAL.TIPPROC;
SELECT * FROM HOSVITAL.GRRIPS;
SELECT * FROM HOSVITAL.FINPRO;
SELECT * FROM HOSVITAL.PLNBEN;
SELECT * FROM HOSVITAL.NIVLATE;
SELECT * FROM HOSVITAL.AGRPDIAG;
SELECT * FROM HOSVITAL.MAEOTRDIA;
SELECT * FROM HOSVITAL.MAEOTRDI1;
SELECT * FROM HOSVITAL.ETNIAS;
SELECT * FROM HOSVITAL.TIPDOC,
SELECT * FROM HOSVITAL.TIPDOCASI;
SELECT * FROM HOSVITAL.NIVEDU;
SELECT * FROM HOSVITAL.maeips;
SELECT * FROM HOSVITAL.maemed;
SELECT * FROM HOSVITAL.maemed1;
SELECT * FROM HOSVITAL.MAEMED2;
SELECT * FROM HOSVITAL.MAEMED3;
SELECT * FROM HOSVITAL.MAEMED4;
SELECT * FROM HOSVITAL.MAEMED5;
SELECT * FROM HOSVITAL.MAEMED21;
SELECT * FROM HOSVITAL.MAEMED22;
SELECT * FROM HOSVITAL.MAEMED31;
SELECT * FROM HOSVITAL.ETNIAS1;
SELECT * FROM HOSVITAL.MAEPAB1;
SELECT * FROM HOSVITAL.MAEPAB2;
SELECT * FROM HOSVITAL.MAEPAB3;
SELECT * FROM HOSVITAL.MAEPAB11;
SELECT * FROM HOSVITAL.MAEPAB12;
SELECT * FROM HOSVITAL.MAEPAB13;
SELECT * FROM HOSVITAL.CONSUL;
SELECT * FROM HOSVITAL.CONSUL1;
SELECT * FROM HOSVITAL.CONSUL2;
SELECT * FROM HOSVITAL.MAETPP;
SELECT * FROM HOSVITAL.MAEDNL;
SELECT * FROM HOSVITAL.MAEDL1;
SELECT * FROM HOSVITAL.BANCOS;
SELECT * FROM HOSVITAL.CTR001;
SELECT * FROM HOSVITAL.CTR002;
SELECT * FROM HOSVITAL.DOCUCON;
SELECT * FROM HOSVITAL.DOCUCONA;
SELECT * FROM HOSVITAL.DOCUCON1;
SELECT * FROM HOSVITAL.DOCUCON1A;
SELECT * FROM HOSVITAL.CENCOSPRO;
SELECT * FROM HOSVITAL.CLAESTPAC;
SELECT * FROM HOSVITAL.MAECEC2;
SELECT * FROM HOSVITAL.MAESED;
SELECT * FROM HOSVITAL.FRMFRMC;
SELECT * FROM HOSVITAL.DEPEND;
SELECT * FROM HOSVITAL.honrios;
SELECT * FROM HOSVITAL.maeant1;
SELECT * FROM HOSVITAL.maeant2;
SELECT * FROM HOSVITAL.UNDMEDI;
SELECT * FROM HOSVITAL.ENCUESDX;
SELECT * FROM HOSVITAL.ENCUESE;
SELECT * FROM HOSVITAL.ENCUESP;
SELECT * FROM HOSVITAL.ENCUESU;
SELECT * FROM HOSVITAL.ENCUES1;
SELECT * FROM HOSVITAL.ENCUES2;
SELECT * FROM HOSVITAL.ENCUES3;
SELECT * FROM HOSVITAL.ENCUES4;
SELECT * FROM HOSVITAL.maecjs;
SELECT * FROM HOSVITAL.maecjs1;
SELECT * FROM HOSVITAL.MAECJS2;
SELECT * FROM HOSVITAL.PRMMULTAS;
SELECT * FROM HOSVITAL.PRMMULTAS1;
SELECT * FROM HOSVITAL.PTOATN;
SELECT * FROM HOSVITAL.PTOATNT;
SELECT * FROM HOSVITAL.GEORISEX;
SELECT * FROM HOSVITAL.MAEUBIGE;
SELECT * FROM HOSVITAL.MAEUBIGED;
SELECT * FROM HOSVITAL.MAEUBIGEO;
SELECT * FROM HOSVITAL.EMPRESS;
SELECT * FROM HOSVITAL.MAEEMPR;
SELECT * FROM HOSVITAL.MAEEMP1;
SELECT * FROM HOSVITAL.MAEEMP2;
SELECT * FROM HOSVITAL.MAEEMP3;
SELECT * FROM HOSVITAL.MAEEMP31;
SELECT * FROM HOSVITAL.MAEEMP31;
SELECT * FROM HOSVITAL.MAEEMP4;
SELECT * FROM HOSVITAL.MAEEMP5;
SELECT * FROM HOSVITAL.MAEEMP6;
SELECT * FROM HOSVITAL.MAEEMP7;
SELECT * FROM HOSVITAL.MAEEMP8;
SELECT * FROM HOSVITAL.MAEEMP9;
SELECT * FROM HOSVITAL.TARIFAC;
SELECT * FROM HOSVITAL.TARIFAC1;
SELECT * FROM HOSVITAL.TARIFAC2;
SELECT * FROM HOSVITAL.TARIFAS;
SELECT * FROM HOSVITAL.MAEPRO;
SELECT * FROM HOSVITAL.MAEPROCON;
SELECT * FROM HOSVITAL.MAEPRODOS;
SELECT * FROM HOSVITAL.MAEPROESU;
SELECT * FROM HOSVITAL.MAEPROPROT;
SELECT * FROM HOSVITAL.MAEPROSUM;
SELECT * FROM HOSVITAL.MAEPROT;
SELECT * FROM HOSVITAL.MAEPROTDX;
SELECT * FROM HOSVITAL.MAEPROV;
SELECT * FROM HOSVITAL.MAEPRO1;
SELECT * FROM HOSVITAL.MAEPRO2;
SELECT * FROM HOSVITAL.MAEPRO3;
SELECT * FROM HOSVITAL.MAEPRO4;
SELECT * FROM HOSVITAL.MAEPRO5;
SELECT * FROM HOSVITAL.PORTAR;
SELECT * FROM HOSVITAL.PORTAREX;
SELECT * FROM HOSVITAL.PORTARSED;
SELECT * FROM HOSVITAL.PORTARSSE;
SELECT * FROM HOSVITAL.PORTARSU;
SELECT * FROM HOSVITAL.PORTARS1;
SELECT * FROM HOSVITAL.PORTARS11;
SELECT * FROM HOSVITAL.PORTARS2;
SELECT * FROM HOSVITAL.PORTAR1;
SELECT * FROM HOSVITAL.PORTER;
SELECT * FROM HOSVITAL.MAESUMN;
SELECT * FROM HOSVITAL.MAESUMND;
SELECT * FROM HOSVITAL.MAESUMNDX;
SELECT * FROM HOSVITAL.MAESUMNHO;
SELECT * FROM HOSVITAL.MAESUM1;
SELECT * FROM HOSVITAL.MAESUM1V;
SELECT * FROM HOSVITAL.MAESUM11;
SELECT * FROM HOSVITAL.GLOSAS;
SELECT * FROM HOSVITAL.GLOSAC;
SELECT * FROM HOSVITAL.FORLIQ;
SELECT * FROM HOSVITAL.FORLIQ1;
SELECT * FROM HOSVITAL.FORLIQ2;
SELECT * FROM HOSVITAL.FORLIQ12;
SELECT * FROM HOSVITAL.PRCMULOPC;
SELECT * FROM HOSVITAL.FACTOR;
SELECT * FROM HOSVITAL.HOMPROC;
SELECT * FROM HOSVITAL.MOVANTU;
SELECT * FROM HOSVITAL.GPOTRIA;
SELECT * FROM HOSVITAL.DIATRIA;
SELECT * FROM HOSVITAL.DIATRIA;
SELECT * FROM HOSVITAL.DIATRIAP1;
SELECT * FROM HOSVITAL.DIATRIA1;
SELECT * FROM HOSVITAL.DESCIRMED;
SELECT * FROM HOSVITAL.DESCIRMED1;
SELECT * FROM HOSVITAL.RSLPRC1;
SELECT * FROM HOSVITAL.RSPNQX;
SELECT * FROM HOSVITAL.PRBXPRC;
SELECT * FROM HOSVITAL.PRBXPRC1;
SELECT * FROM HOSVITAL.VIAS;
SELECT * FROM HOSVITAL.VIASTRNS;
SELECT * FROM HOSVITAL.OBSFRMC;
SELECT * FROM HOSVITAL.PRTCLIN;
SELECT * FROM HOSVITAL.PRTCLIN1;
SELECT * FROM HOSVITAL.PLAEJETRA;
SELECT * FROM HOSVITAL.PLAEJETR1;
SELECT * FROM HOSVITAL.PLAEJETR2;
SELECT * FROM HOSVITAL.DOCCONCEN;
SELECT * FROM HOSVITAL.ESQFORASI;
SELECT * FROM HOSVITAL.ESQFORAS1;
SELECT * FROM HOSVITAL.ESQFORAS2;
SELECT * FROM HOSVITAL.MONITOREOS;
SELECT * FROM HOSVITAL.MONITOREO1;
SELECT * FROM HOSVITAL.MONITORE2;	
SELECT * FROM HOSVITAL.MAEPNT;
SELECT * FROM HOSVITAL.MAESNT;
SELECT * FROM HOSVITAL.MAESNT1;
SELECT * FROM HOSVITAL.RPTNVL;
SELECT * FROM HOSVITAL.RPTNVL1;
SELECT * FROM HOSVITAL.RPTNVL2;
SELECT * FROM HOSVITAL.maetpans;
SELECT * FROM HOSVITAL.MAETPA2;
SELECT * FROM HOSVITAL.MAETPA3;
SELECT * FROM HOSVITAL.MAEVIAPL;
SELECT * FROM HOSVITAL.IMAHC;
SELECT * FROM HOSVITAL.CONASIS;
SELECT * FROM HOSVITAL.CONASIS1;
SELECT * FROM HOSVITAL.TIPSIN;
SELECT * FROM HOSVITAL.ESTENFREN;
SELECT * FROM HOSVITAL.ESTENFRE1;
SELECT * FROM HOSVITAL.PUNFRA;
SELECT * FROM HOSVITAL.MAESIS;
SELECT * FROM HOSVITAL.MAETTOHOS;
SELECT * FROM HOSVITAL.ANTAYUAIE;
SELECT * FROM HOSVITAL.TIPOANTE;
SLECT * FROM HOSVITAL.DIAGAIEPI;
SELECT * FROM HOSVITAL.REPEXC;
SELECT * FROM HOSVITAL.REPEXC1;
SELECT * FROM HOSVITAL.REPEXC2;
SELECT * FROM HOSVITAL.REPEXC3;
SELECT * FROM HOSVITAL.REPEXC4;
SELECT * FROM HOSVITAL.RIE4505;
SELECT * FROM HOSVITAL.RIE4505L1;
SELECT * FROM HOSVITAL.ADMLOG;
SELECT * FROM HOSVITAL.ADMPGM;
SELECT * FROM HOSVITAL.ADMSYS;
SELECT * FROM HOSVITAL.ADMSYS1;
SELECT * FROM HOSVITAL.ADMGRP;
SELECT * FROM HOSVITAL.ADMGRP1;
SELECT * FROM HOSVITAL.ADMUSR;
SELECT * FROM HOSVITAL.ADMUSR1;
SELECT * FROM HOSVITAL.PERGRUP;
SELECT * FROM HOSVITAL.PEREXC;
SELECT * FROM HOSVITAL.PRMSIS;
SELECT * FROM HOSVITAL.EMPRESA;
SELECT * FROM HOSVITAL.CENUTIL;
SELECT * FROM HOSVITAL.CENUTIL1;
SELECT * FROM HOSVITAL.CENCOST;
SELECT * FROM HOSVITAL.CENCOST1;
SELECT * FROM HOSVITAL.MAESED;
SELECT * FROM HOSVITAL.MAESED1;
SELECT * FROM HOSVITAL.MAESED2;
SELECT * FROM HOSVITAL.MAESED3;
SELECT * FROM HOSVITAL.MAESED4;
SELECT * FROM HOSVITAL.TIPCUE;
SELECT * FROM HOSVITAL.TIPCUE1;
SELECT * FROM HOSVITAL.TIPCUE2;
SELECT * FROM HOSVITAL.CUENTAS;
SELECT * FROM HOSVITAL.CUENTAS1;
SELECT * FROM HOSVITAL.CMPPRE;
SELECT * FROM HOSVITAL.CMPPRE1;
SELECT * FROM HOSVITAL.MONEDAS;
SELECT * FROM HOSVITAL.MONEDA1;
SELECT * FROM HOSVITAL.PAIS;
SELECT * FROM HOSVITAL.NICUENTAS;
SELECT * FROM HOSVITAL.NICUENTASH;
SELECT * FROM HOSVITAL.AGRDOC;
SELECT * FROM HOSVITAL.AGRDOC1;
SELECT * FROM HOSVITAL.AGRDOC2;
SELECT * FROM HOSVITAL.DOCUCON;
SELECT * FROM HOSVITAL.DOCUCON1;
SELECT * FROM HOSVITAL.DOCUCONA;
SELECT * FROM HOSVITAL.DOCUCON1A;
SELECT * FROM HOSVITAL.CONCEPT1;
SELECT * FROM HOSVITAL.CONCEPT11;
SELECT * FROM HOSVITAL.METRICA;
SELECT * FROM HOSVITAL.FORMPAG;
SELECT * FROM HOSVITAL.PARMCON1;
SELECT * FROM HOSVITAL.PARMCON2;
SELECT * FROM HOSVITAL.pEriodos;
SELECT * FROM HOSVITAL.ANTIG;
SELECT * FROM HOSVITAL.ANTIG1;
SELECT * FROM HOSVITAL.REPBALCON;
SELECT * FROM HOSVITAL.REPBALCONT;
SELECT * FROM HOSVITAL.REPBALCO1;
SELECT * FROM HOSVITAL.REPBALGRP;
SELECT * FROM HOSVITAL.REPBALSUB;
SELECT * FROM HOSVITAL.REPBALTOT;
SELECT * FROM HOSVITAL.REPCENTROS;
SELECT * FROM HOSVITAL.REPCENTROS1;
SELECT * FROM HOSVITAL.PARMINV;
SELECT * FROM HOSVITAL.PARMCON;
SELECT * FROM HOSVITAL.PARMCON1;
SELECT * FROM HOSVITAL.PARMCON2;
SELECT * FROM HOSVITAL.GRUPIMP;
SELECT * FROM HOSVITAL.IMPUEST;
SELECT * FROM HOSVITAL.IMPUESTOS;
SELECT * FROM HOSVITAL.TPOCONT;
SELECT * FROM HOSVITAL.TIPTER;
SELECT * FROM HOSVITAL.TIPDOC;
SELECT * FROM HOSVITAL.TIPDOCASI;
SELECT * FROM HOSVITAL.TIPENT;
SELECT * FROM HOSVITAL.TIPENT1;
SELECT * FROM HOSVITAL.TERCEROS;
SELECT * FROM HOSVITAL.TERCEROS1;
SELECT * FROM HOSVITAL.CLIENTE;
SELECT * FROM HOSVITAL.CLIENTE1;
SELECT * FROM HOSVITAL.CLIENTE3;
SELECT * FROM HOSVITAL.CLIENTE4;
SELECT * FROM HOSVITAL.CnRgImp;
SELECT * FROM HOSVITAL.CnRgImp1;
SELECT * FROM HOSVITAL.CnRgImp2;
SELECT * FROM HOSVITAL.CerinFtri;
SELECT * FROM HOSVITAL.EstMedMag;
SELECT * FROM HOSVITAL.EstMedMag1;
SELECT * FROM HOSVITAL.ActEcon;
SELECT * FROM HOSVITAL.Clase;
SELECT * FROM HOSVITAL.Traninv;
SELECT * FROM HOSVITAL.Traninv1;
SELECT * FROM HOSVITAL.TipBod;
SELECT * FROM HOSVITAL.TipBod1;
SELECT * FROM HOSVITAL.Bodegas;
SELECT * FROM HOSVITAL.Bodegas1;
SELECT * FROM HOSVITAL.BodUsr;
SELECT * FROM HOSVITAL.MotRech;
SELECT * FROM HOSVITAL.GrpInv;
SELECT * FROM HOSVITAL.GrpCtaInv;
SELECT * FROM HOSVITAL.GructaInv;
SELECT * FROM HOSVITAL.GructaIn1;
SELECT * FROM HOSVITAL.GructoCta;
SELECT * FROM HOSVITAL.GructoCt1;
SELECT * FROM HOSVITAL.CtaInv;
SELECT * FROM HOSVITAL.CtaInv1;
SELECT * FROM HOSVITAL.GrpBodEnt;
SELECT * FROM HOSVITAL.GrpBodEn1;
SELECT * FROM HOSVITAL.PrmCmp;
SELECT * FROM HOSVITAL.PrmCm1;
SELECT * FROM HOSVITAL.Proveedor;
SELECT * FROM HOSVITAL.Proveedor1;
SELECT * FROM HOSVITAL.Proveedor2;
SELECT * FROM HOSVITAL.Proveedor3;
SELECT * FROM HOSVITAL.PrvProd;
SELECT * FROM HOSVITAL.PrvSer;
SELECT * FROM HOSVITAL.ViaTrns;
SELECT * FROM HOSVITAL.MesCnsPr;
SELECT * FROM HOSVITAL.CauNdsp;
SELECT * FROM HOSVITAL.GrpInv;
SELECT * FROM HOSVITAL.Maesum1;
SELECT * FROM HOSVITAL.Maesum1;
SELECT * FROM HOSVITAL.MAesum2;
SELECT * FROM HOSVITAL.Maesum1V;
SELECT * FROM HOSVITAL.Maesum11;
SELECT * FROM HOSVITAL.MaesumND;
SELECT * FROM HOSVITAL.MaesumNDX;
SELECT * FROM HOSVITAL.UndMed;
SELECT * FROM HOSVITAL.UndMedI;
SELECT * FROM HOSVITAL.Marcas;
SELECT * FROM HOSVITAL.GrpServ;
SELECT * FROM HOSVITAL.GrpServ1;
SELECT * FROM HOSVITAL.MaeServ;
SELECT * FROM HOSVITAL.GrpCTaServ;
SELECT * FROM HOSVITAL.GrpCTaSer1;
SELECT * FROM HOSVITAL.Dr1pRM;
SELECT * FROM HOSVITAL.Dr2pRM;
SELECT * FROM HOSVITAL.Dr3pRM;
SELECT * FROM HOSVITAL.Dr4pRM;
SELECT * FROM HOSVITAL.Bancos;
SELECT * FROM HOSVITAL.Chequera;
SELECT * FROM HOSVITAL.Cheques;
SELECT * FROM HOSVITAL.Procteso;
SELECT * FROM HOSVITAL.Procteso1;
SELECT * FROM HOSVITAL.FlujCaja;
SELECT * FROM HOSVITAL.FlujCaja1;
SELECT * FROM HOSVITAL.FlujCaja11;
SELECT * FROM HOSVITAL.CajMen;
SELECT * FROM HOSVITAL.CajMen1;
SELECT * FROM HOSVITAL.CajMen2;
SELECT * FROM HOSVITAL.RelConCam;
SELECT * FROM HOSVITAL.RelConCa1;
SELECT * FROM HOSVITAL.ForCOnCI;;
SELECT * FROM HOSVITAL.Acumula;
SELECT * FROM HOSVITAL.Concili;
SELECT * FROM HOSVITAL.Grupos;
SELECT * FROM HOSVITAL.SubGrp;
SELECT * FROM HOSVITAL.Marcas;
SELECT * FROM HOSVITAL.Funciona;
SELECT * FROM HOSVITAL.FOrmAdq;
SELECT * FROM HOSVITAL.Ubigeo;
SELECT * FROM HOSVITAL.Ubigeo1;
SELECT * FROM HOSVITAL.UbigeOX;
SELECT * FROM HOSVITAL.TranActFij;
SELECT * FROM HOSVITAL.TranActFi1;
SELECT * FROM HOSVITAL.NIPER;



