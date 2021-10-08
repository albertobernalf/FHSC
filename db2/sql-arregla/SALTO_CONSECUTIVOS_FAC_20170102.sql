
FAC

2395798 

DIC 14        2395798

NFR 12615, 12616
NCG 30300, 30331, 30412
TCE 57990



-- Proceso :

select MAEstF,MATOTF,* from maeate where mpnfac  IN (2395798 ) order by mpnfac

SP_HELP MAEATE

BEGIN TRANSACTION;

-- PRIMERA FACTURA No 2034974
begin transaction;
insert into maeate
select 2395798,MPNFac
MATipDoc,FacDscPrf,MPCedu,MPTDoc,MPClPr,MPMeNi,MAFchI,MAHorI,MANoRe,MAApeRe,MATiRe,MATeRe,MAViaI,MADi1I,MADi2I,MADi3I,MAMeIn,MAEsMI,MAEsMS,MaMeEg,MADi1S,
MADi2S,MaDi3S,MASeGe,MACoPr,MATiPa,MATiAn,MAFchM,MACaMu,MAQuiA,MAEstS,MACauE,MACCom,MAEstP,MAMotS,MAFchE,MAHorE,MAHorO,MAFchS,MACMAD,0,0,MICodI,
0,0,0,0,MAVPaU,MAVDsc,MAVNPU,MAUlCN,MAUlCP,MAUlCS,MACCFC,MSUIng,MSUSal,MSUFac,MSUAFa,MACoAn,'1',MPFria,MPnuma,MAFCFA,MPTUCod,MPTCodP,MPPTCodi,MPCSubP,MPMSubP,
MAViva,MAIDPC,MAFCES,MPNume,MPComp,FacFch,MANomAut,MATpeAut,MAVlrAut,MACpgPgo,MaCpgLqd,SCCCod,SccEmp,FacCodPab,FacCodCam,TurCod,FacSNitAsg,FacSVePl,FacSVeMa,
FacSVeTi,FacSVeMo,FacSVeCl,FacSCndAcc,FacSSitAcc,FacSFchAcc,FacSCodD,FacSCodM,FacSRulUrb,FacSIndAsg,FacSTpICnd,FacSCedCnd,FacSNomCnd,FacSMCodFC,FacSNomSuc,FacSTpoEC,
FacSDesEC,FacSNomEmp,FacSCodDE,FacSCodME,FacSCodDCn,FacSCodMCn,MaLugExp,MaDocDcl,MaDecla,MaLuExCnd,MaInfAcc,MaDirCnd,MaTelCnd,MaCtvIng,MaTiDoDc,MaVlrImpt,FacSNume,FacSFchVIn,
FacSFchVFi,MaNrNotCr,MaFchNot,MaEstNot,MaUCnAqx,MaUltCci,MaNrCerD,MaUbiFac,MaUsuFac,MaCtvAct,MaIndDev,MaEstEnv,MaEstCan,MaSalCXC,MaClsDoc,MaObsFac,
MaCodCaj,MaDocFac,MaSedPun,MaVPOCon,MaVlrTIv,MaNumFAgr,MaTipFAgr,MaTipOpe,FacFchHor,MACONCAP,MAECODPAQ
	from maeate 
where mpnfac = 2395799;
-- commit;
-- rollback


-- FINANCIERA
SP_HELP MOVCONT3
begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2395798      ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen , mvccnvmon ,  mvcorigen ,NULL,   mvcestpre ,NULL,NULL,NULL
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2395799
-- COMMIT;
-- ROLLBACK;
SELECT * FROM MOVCONT3
MvCMayGen
MvCCnvMon
MvCOrigen
MVCNumEqu
MvcEstPre
MVCDOCEQU
MVCSEDEQU
MVCFORPAG
select * from movcont3 where mvcnro = 2395798 
select * from movcont2 where mvcnro = 2395798 

select * from movcxc where mccnumobl = '2041770'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2041770'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2034974
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2034974
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2041770'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2401806
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2401806 
select * from hojobl where hojnumobl = '2401807'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2401806      ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2401806      ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 ,NULL,NULL
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2401807  AND MVCNAT='D' AND MVCCSC=1

SELECT * FROM MOVCONT2
SP_HELP MOVCONT2
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2401806      ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2401806      ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 ,NULL,NULL
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2401807  AND MVCNAT='C' AND MVCCSC=3
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL = '2401806' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2401806' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 , CONVERT(DATETIME,'1753-01-01 00:00:01.000') ,  0 ,  CONVERT(DATETIME,'1753-01-01 00:00:01.000') ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec,NULL,CONVERT(DATETIME,'1753-01-01 00:00:01.000'),NULL,NULL,CONVERT(DATETIME,'1753-01-01 00:00:01.000'),NULL,NULL,CONVERT(DATETIME,'1753-01-01 00:00:01.000'),NULL 
  FROM HOJOBL WHERE HOJNUMOBL='2401807' AND CNTVIG=2016 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK

SP_HELP HOJOBL
SELECT * FROM HOJOBL

-- segundop


begin transaction;
insert into maeate
select 2395801,MPNFac
MATipDoc,FacDscPrf,MPCedu,MPTDoc,MPClPr,MPMeNi,MAFchI,MAHorI,MANoRe,MAApeRe,MATiRe,MATeRe,MAViaI,MADi1I,MADi2I,MADi3I,MAMeIn,MAEsMI,MAEsMS,MaMeEg,MADi1S,
MADi2S,MaDi3S,MASeGe,MACoPr,MATiPa,MATiAn,MAFchM,MACaMu,MAQuiA,MAEstS,MACauE,MACCom,MAEstP,MAMotS,MAFchE,MAHorE,MAHorO,MAFchS,MACMAD,0,0,MICodI,
0,0,0,0,MAVPaU,MAVDsc,MAVNPU,MAUlCN,MAUlCP,MAUlCS,MACCFC,MSUIng,MSUSal,MSUFac,MSUAFa,MACoAn,'1',MPFria,MPnuma,MAFCFA,MPTUCod,MPTCodP,MPPTCodi,MPCSubP,MPMSubP,
MAViva,MAIDPC,MAFCES,MPNume,MPComp,FacFch,MANomAut,MATpeAut,MAVlrAut,MACpgPgo,MaCpgLqd,SCCCod,SccEmp,FacCodPab,FacCodCam,TurCod,FacSNitAsg,FacSVePl,FacSVeMa,
FacSVeTi,FacSVeMo,FacSVeCl,FacSCndAcc,FacSSitAcc,FacSFchAcc,FacSCodD,FacSCodM,FacSRulUrb,FacSIndAsg,FacSTpICnd,FacSCedCnd,FacSNomCnd,FacSMCodFC,FacSNomSuc,FacSTpoEC,
FacSDesEC,FacSNomEmp,FacSCodDE,FacSCodME,FacSCodDCn,FacSCodMCn,MaLugExp,MaDocDcl,MaDecla,MaLuExCnd,MaInfAcc,MaDirCnd,MaTelCnd,MaCtvIng,MaTiDoDc,MaVlrImpt,FacSNume,FacSFchVIn,
FacSFchVFi,MaNrNotCr,MaFchNot,MaEstNot,MaUCnAqx,MaUltCci,MaNrCerD,MaUbiFac,MaUsuFac,MaCtvAct,MaIndDev,MaEstEnv,MaEstCan,MaSalCXC,MaClsDoc,MaObsFac,
MaCodCaj,MaDocFac,MaSedPun,MaVPOCon,MaVlrTIv,MaNumFAgr,MaTipFAgr,MaTipOpe,FacFchHor,MACONCAP,MAECODPAQ
	from maeate 
where mpnfac = 2395802;
-- commit;
-- rollback


-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2395801     ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen , mvccnvmon ,  mvcorigen ,NULL,   mvcestpre ,NULL,NULL,NULL
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2395802
-- COMMIT;
-- ROLLBACK;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2395798 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2395798 
select * from hojobl where hojnumobl = '2041770'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2395801     ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2395801     ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 ,NULL,NULL
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2395802  AND MVCNAT='D' AND MVCCSC=1

SELECT * FROM MOVCONT2
SP_HELP MOVCONT2
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2395801     ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2395801     ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 ,NULL,NULL
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2395802  AND MVCNAT='C' AND MVCCSC=3
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2395798 ' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2395801' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 , CONVERT(DATETIME,'1753-01-01 00:00:01.000') ,  0 ,  CONVERT(DATETIME,'1753-01-01 00:00:01.000') ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec,NULL,CONVERT(DATETIME,'1753-01-01 00:00:01.000'),NULL,NULL,CONVERT(DATETIME,'1753-01-01 00:00:01.000'),NULL,NULL,CONVERT(DATETIME,'1753-01-01 00:00:01.000'),NULL 
  FROM HOJOBL WHERE HOJNUMOBL='2395802' AND CNTVIG=2016 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK

