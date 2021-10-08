-- 1. Backups de las Tablas antes de comenzar

SELECT *
INTO BKP.MOVCXP_20161229_17_00
FROM MOVCXP


SELECT *
INTO BKP.HOOBLPRV_20161229_17_00
FROM HOJOBLPRV

SELECT COUNT(*) FROM BKP.MOVCXP_20161229_17_00   --297713
SELECT COUNT(*) FROM BKP.HOOBLPRV_20161229_17_00  --51912


SELECT * FROM DOCUCON WHERE DOCCOD='CDC'
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro = 31489
SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCXPNro = 31489
1,AJN,AJP,AJT,CDC,CFA,CXP,TAC,TCM,TRC  -- E CREDITOS
1,AJN,AJP,AJT,CCC, CXP,NC,CCE,TCM,TLA  -- EN DEBITOS


-- 2. Validacion de la informacion















-- Actualziacion de datos

-- RESUMEN ... Ajuste

-- Se analizan querys inicialmente enviados, no se puede utilizar por no coincidor los consecutivos de la movcont2 con la movcxp
-- Se crean diferentes querys de diferencias pero no son posibles por salir muchas fials en las consultas
-- La ing Paaul crea un scriot base que recepciono
-- Se recepciona archivo de inconsistencias . (La idea es trabajar sobre esta base )
-- Se debe cuadrar la contabilidad contra la cuenta por pagar ...


-- Ajuste en pruebas :: 22 Dcumentos

SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31507
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31507 AND MvCNat='C'  -- CAT 23359502            
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '900630118' AND HOPNOOBL= '309' AND CntVig=2016  -- 764526.00  ,, 764526.00


-- CFA 31489

-- primer Caso :

BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31507 AND MvCNat='C' AND MvCVlr =764526;

SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31507

SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNRO=31507
 -- ROLLBACK;
 -- COMMIT
 SELECT * FROM MOVCXP WHERE PRVCOD= '900630118' AND  MvCxPNuOb = '309'
 SELECT * FROM HOJOBLPRV WHERE PRVCOD = '900630118' AND HOPNOOBL= '309' AND CntVig=2016  

 SELECT @@SERVERNAME
 
SELECT * FROM MOVCXP WHERE DOCCOD='CXP' AND MvCxPNro=14587  --3074992.29   -- DEJAR EN CEROS
SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MvCNro=14587 AND MvCNat='C'  -- 0.00 EN CONTABILIDAD            
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '41306463' AND HOPNOOBL= '919' AND CntVig=2016  -- 764526.00  ,, 764526.00
SELECT * FROM HOJOBLPRV WHERE HOPNOOBL= 'JM 681936'

-- Segundo caso :

BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31489 AND MvCNat='C' AND MvCVlr =164576.00;
 -- COMMIT

 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31489
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31489 AND MvCNat='C'  -- CAT 23359502            
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '79331018' AND HOPNOOBL= '160' AND CntVig=2016  -- 164576.00.00  ,, 764526.00


-- Tercer Caso

BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31490 AND MvCNat='C' AND MvCVlr =267436.00;
 -- COMMIT

 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31490
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31490 AND MvCNat='C'  -- CAT 23359502            
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '79331018' AND HOPNOOBL= '161' AND CntVig=2016  --267436.00

-- Cuarto Caso


BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31494 AND MvCNat='C' AND MvCVlr =547104.00;
 -- COMMIT

 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31494
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31494 AND MvCNat='C'  -- CAT 547104.00          
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '900449300' AND HOPNOOBL= '239' AND CntVig=2016  --547104.00

-- Quinta


BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31501 AND MvCNat='C' AND MvCVlr =1334400.00;
 -- COMMIT

 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31501
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31501 AND MvCNat='C'  -- CAT 31334400.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '830001458' AND HOPNOOBL= '922' AND CntVig=2016



-- Sexts


BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31506 AND MvCNat='C' AND MvCVlr =247248.000;
 -- COMMIT

 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31506
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31506 AND MvCNat='C'  -- CAT 247248.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '900630118' AND HOPNOOBL= '310' AND CntVig=2016


-- Septima (REVISAR QUE APSO)

BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31507 AND MvCNat='C' AND MvCVlr =764526.00;
 -- COMMIT

 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31507
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31507 AND MvCNat='C'  -- CAT 764526.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '900630118' AND HOPNOOBL= '309'AND CntVig=2016


-- OCTAVA

ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31508 AND MvCNat='C' AND MvCVlr =2300000.00;
 -- COMMIT

 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31508
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31508 AND MvCNat='C'  -- CAT 2300000.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '900726527' AND HOPNOOBL= 'CR 409'AND CntVig=2016


--NOVENA



BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31509 AND MvCNat='C' AND MvCVlr =2229810.00;
 -- COMMIT

 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31509
  SELECT * FROM MOVCXP WHERE  MvCxPNuOb='23996'
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31509 AND MvCNat='C'  -- CAT 2229810.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '860520610' AND HOPNOOBL= '23996' AND CntVig=2016

BEGIN TRANSACTION; 
UPDATE  HOJOBLPRV
SET HOPTOTCRE= 2229810.00 WHERE PRVCOD = '860520610' AND HOPNOOBL= '23996' AND CntVig=2016

	ROLLBACK

--DECIMA

BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31510 AND MvCNat='C' AND MvCVlr =8124826.00;
 -- COMMIT
   SELECT * FROM MOVCXP WHERE  MvCxPNuOb='23996'
 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31510
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31510  AND MvCNat='C'  -- CAT 8124826.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '860520610' AND HOPNOOBL= '23996' AND CntVig=2016


BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVlrObl = 10354636.00, HOPTotCre = 10354636.00,HojBasDes=10354636.00
WHERE PRVCOD = '860520610' AND HOPNOOBL= '23996' AND CntVig=2016
-- COMMIT

-- DECIMAPRIMERA


BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31513 AND MvCNat='C' AND MvCVlr =581436.00;
 -- COMMIT
   SELECT * FROM MOVCXP WHERE  MvCxPNuOb='23996'
 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31513
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31513  AND MvCNat='C'  -- CAT 581436.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '830116846' AND HOPNOOBL= '5344' AND CntVig=2016


-- OTRAS

BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31514 AND MvCNat='C' AND MvCVlr =604360.00;
 -- COMMIT
   SELECT * FROM MOVCXP WHERE  MvCxPNuOb='23996'
 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31514
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31514  AND MvCNat='C'  -- CAT 604360.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '830116846' AND HOPNOOBL= '5314' AND CntVig=2016


-- OTRA NO ESTA HECJA

BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CFA' AND MvCNro=31519 AND MvCNat='C' AND MvCVlr =92880.00;
 -- COMMIT
   SELECT * FROM MOVCXP WHERE  MvCxPNuOb='23996'
 SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31519
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MvCNro=31519  AND MvCNat='C'  -- CAT 92880.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '800149695' AND HOPNOOBL= '-CV1-861946' AND CntVig=2016

-- otra mas

BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CXP' AND MvCNro=14567 AND MvCNat='C' AND MvCVlr =460370.00;
 -- COMMIT
   SELECT * FROM MOVCXP WHERE  MvCxPNuOb='23996'
 SELECT * FROM MOVCXP WHERE DOCCOD='CXP' AND MvCxPNro=14567
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MvCNro=14567  AND MvCNat='C'  -- CAT 123200.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '890704196' AND HOPNOOBL= '	' AND CntVig=2016

-- OTRAS MAS

BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CXP' AND MvCNro=14572 AND MvCNat='C' AND MvCVlr =468000.00;
 -- COMMIT
   SELECT * FROM MOVCXP WHERE  MvCxPNuOb='23996'
 SELECT * FROM MOVCXP WHERE DOCCOD='CXP' AND MvCxPNro=14572
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MvCNro=14572  AND MvCNat='C'  -- CAT 468000.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '830038274' AND HOPNOOBL= 'DH-16-004' AND CntVig=2016

-- OTRA MAS
-- PENMDIET ESTE PAA MAÑANA
-- PENMDIET ESTE PAA MAÑANA
-- PENMDIET ESTE PAA MAÑANA
-- PENMDIET ESTE PAA MAÑANA



BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CXP' AND MvCNro=14588 AND MvCNat='C' AND MvCVlr = 3174745.92
 -- COMMIT
   SELECT * FROM MOVCXP WHERE  MvCxPNuOb='919' AND PrvCod= '830001458'
 SELECT * FROM MOVCXP WHERE DOCCOD='CXP' AND MvCxPNro=14588

 SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MvCNro=14588  AND MvCNat='C'  -- CAT EN CEROS
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '830001458' AND HOPNOOBL= '919' AND CntVig=2016  -- ESTABA EN 3174745.92
SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MvCNro=14587  AND MvCNat='C'  -- CAT EN CEROS

BEGIN TRANSACTION;
UPDATE MOVCXP
SET MvCxPVal=0
WHERE DOCCOD='CXP' AND MvCxPNro=14587;
-- COMMIT;

/*¨PENDIENTE */

BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVlrObl=0
 WHERE PRVCOD = '830001458' AND HOPNOOBL= '919' AND CntVig=2016 
 -- COMMIT;



 -- OTRAS MAS

 BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CXP' AND MvCNro=14588 AND MvCNat='C' AND MvCVlr =3174745.92;
 -- COMMIT
   SELECT * FROM MOVCXP WHERE  MvCxPNuOb='919'
 SELECT * FROM MOVCXP WHERE DOCCOD='CXP' AND MvCxPNro=14588
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MvCNro IN (14588, 14587)  AND MvCNat='C'  -- CAT 3174745.92
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '830001458' AND HOPNOOBL= '919' AND CntVig=2016

BEGIN TRANSACTION;
UPDATE MOVCXP
SET MvCxPVal=0
WHERE DOCCOD='CXP' AND MVCXPNRO=14587
-- COMMIT;

-- OTRA MAS
BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CXP' AND MvCNro=14604 AND MvCNat='C' AND MvCVlr =6679660.00;
 -- COMMIT
   SELECT * FROM MOVCXP WHERE  MvCxPNuOb='FC-2025'
 SELECT * FROM MOVCXP WHERE DOCCOD='CXP' AND MvCxPNro=14604
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MvCNro=14604  AND MvCNat='C'  -- CAT 6679660.00
  SELECT * FROM MOVCONT2 WHERE TrcCod='830072846' AND CntCod IN ('23359502','23353001')
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '830072846' AND HOPNOOBL= 'FC-2025' AND CntVig=2016

BEGIN TRANSACTION;  -- SE BORRA
DELETE FROM HOJOBLPRV
WHERE PRVCOD = '830072846' AND HOPNOOBL= 'FC-2025' AND CntVig=2016 AND CntCod='23353001'
-- COMMIT

-- OTRAS MAS

            

			 BEGIN TRANSACTION;
INSERT INTO MOVCXP([EMPCOD]           ,[DOCCOD]           ,[MCDpto]           ,[MvCxPNro]           ,[MvCxPCsc]           ,[CntVig]           ,[MvCxPFch]           ,[MvCxPMB]
           ,[MVCxPTC]           ,[MvCxPNuOb]           ,[CntCod]           ,[PrvCod]           ,[MvCxPNat]           ,[MvCxPVal]           ,[MvCxPVEx]           ,[CnUCod]
           ,[CnUSub]           ,[CNCCOD]           ,[CntSub]           ,[MvCxPCnc]           ,[MvCxPAct]           ,[MVCXPTer]           ,[FljCajCod]
           ,[FljCajCon])
SELECT EMPCOD,DOCCOD,MCDPTO,MVCNRO,MVCCSC,CNTVIG,MVCCFCH,'PES',1.00,MVCDOCRF1,CNTCOD,TRCCOD,MVCNAT,MvCVlr,MvCVlr,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCDET,0,'N',0,0
FROM MOVCONT2
 WHERE DOCCOD='CXP' AND MvCNro=14630 AND MvCNat='C' AND MvCVlr =12876000.00;
 -- COMMIT
   SELECT * FROM MOVCXP WHERE  MvCxPNuOb='23996'
 SELECT * FROM MOVCXP WHERE DOCCOD='CXP' AND MvCxPNro=14630
 SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MvCNro=14630  AND MvCNat='C'  -- CAT 12876000.00
SELECT * FROM HOJOBLPRV WHERE PRVCOD = '860026182' AND HOPNOOBL= '022005018' AND CntVig=2016

-- CASO DE JHONSON

SELECT * FROM HOJOBLPRV WHERE HOPNoObl= 'JM 681936' AND CntVig=2016

BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVLROBL=591853, HOPTotCre=591853, HOPVLRCUO=591853, HojBasDes=591853
WHERE HOPNoObl= 'JM 681936' AND CntVig=2016
-- COMMIT;



-- VEA MOS LOS SALDOS nEGATIVOS

select * from HOJOBLPRV where HOPVlrObl <0 and CntVig <= 2016
select distinct(HOPNoObl) from HOJOBLPRV where HOPVlrObl <0 and CntVig <= 2016  -- hay 18 oBLIGACIONS cON SALDO mENOS A 0

-- 1
select * from MOVCXP where mvcxpnuob = '0143-1036634'
select * from HOJOBLPRV where HOPNoObl= '0143-1036634' and CntVig=2016   --and  PrvCod= '1053777362'
select * from MOVCONT2 where TrcCod='860045854' and CntCod= '22050101'
select * from HOJOBLPRV where HOPNoObl= '0689-142002' and CntVig=2016
select * from MOVCXP where mvcxpnuob = '0689-142002'
 

begin transaction;
delete from HOJOBLPRV where HOPNoObl= '0143-1036634' and CntVig=2016  and HOPVlrObl<0
-- commit
-- rollback;
-- es negativo con el proveedor : 860045854      

-- 2  
select * from MOVCXP where mvcxpnuob = '0714-2647'
select * from HOJOBLPRV where HOPNoObl= '0714-2647' and CntVig=2016   --and  PrvCod= '1053777362'
select * from MOVCONT2 where TrcCod='900319753'   --nO HAY REGISTROS DE ESTE PROVEEDOR
select * from HOJOBLPRV where HOPNoObl= '0689-142002' and CntVig=2016

 begin transaction;
delete from HOJOBLPRV where HOPNoObl= '0714-2647' and CntVig=2016  and HOPVlrObl<0
-- commit
-- rollback;

-- 3 
select * from MOVCXP where mvcxpnuob = 'PPA4-573403'
select * from HOJOBLPRV where HOPNoObl= 'PPA4-573403' and CntVig=2016   --and  PrvCod= '1053777362'
select * from MOVCONT2 where TrcCod='800085013' and CntVig=2016  order by cntcod --nO HAY REGISTROS DE ESTE PROVEEDOR

 begin transaction;
delete from HOJOBLPRV where HOPNoObl= 'PPA4-573403' and CntVig=2016  and HOPVlrObl<0
-- commit
-- rollback;


--4

select * from MOVCXP where mvcxpnuob = 'PPA3-487133'
select * from HOJOBLPRV where HOPNoObl= 'PPA3-487133' and CntVig=2016   --and  PrvCod= '1053777362'
select * from MOVCONT2 where TrcCod='800085013' and CntVig=2016  order by cntcod --nO HAY REGISTROS DE ESTE PROVE

 begin transaction;
delete from HOJOBLPRV where HOPNoObl= 'PPA3-487133' and CntVig=2016  and HOPVlrObl<0
-- commit
-- rollback;


-- 5



select * from MOVCXP where mvcxpnuob = 'JM 685445'
select * from HOJOBLPRV where HOPNoObl= 'JM 685445' and CntVig=2016   --and  PrvCod= '1053777362'
select * from MOVCONT2 where doccod='CFA' AND MVCNRO = 31585 

 begin transaction;
UPDATE   HOJOBLPRV 
SET HOPVLRCUO= 77528837.00, HOPVLROBL=7528837.00, HOPTOTCRE=7528837.00,HOJBASDES=7528837.00
where HOPNoObl= 'JM 685445' and CntVig=2016  
-- commit

--6

select * from MOVCXP where mvcxpnuob = '-CV1-818429'
select * from HOJOBLPRV where HOPNoObl= '-CV1-818429' and CntVig=2016   --and  PrvCod= '1053777362'
select * from MOVCONT2 where doccod='CFA' AND MVCNRO = 31485 
SELECT * FROM MOVCONT2 WHERE TrcCod= '800149695' AND CntVig=2016 AND MvCDocRf1= '-CV1-818429'

 begin transaction;
UPDATE   HOJOBLPRV 
SET HOPVLRCUO= 69905440, HOPVLROBL=69905440, HOPTOTCRE=69905440,HOJBASDES=69905440
where HOPNoObl= '-CV1-818429' and CntVig=2016  
-- commit
-- ROLLBACK


-- 7

select * from MOVCXP where mvcxpnuob = '-CV1-818428'
select * from HOJOBLPRV where HOPNoObl= '-CV1-818428' and CntVig=2016   --and  PrvCod= '1053777362'
select * from MOVCONT2 where doccod='CFA' AND MVCNRO = 31486 
SELECT * FROM MOVCONT2 WHERE TrcCod= '800149695' AND CntVig=2016 AND MvCDocRf1= '-CV1-818429'

 begin transaction;
UPDATE   HOJOBLPRV 
SET HOPVLRCUO= 78494761.00, HOPVLROBL=78494761.00, HOPTOTCRE=78494761.00,HOJBASDES=78494761.00
where HOPNoObl= '-CV1-818428' and CntVig=2016  
-- commit
-- ROLLBACK

-- 7

SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31519
select * from MOVCXP where mvcxpnuob = '104-35077187'
select * from HOJOBLPRV where HOPNoObl= '104-35077187' and CntVig=2016   --and  PrvCod= '1053777362'
select * from HOJOBLPRV where HOPNoObl= '-CV1-861946' and CntVig=2016   --and  PrvCod= '1053777362'

select * from MOVCONT2 where doccod='CFA' AND MVCNRO = 31519 
SELECT * FROM MOVCONT2 WHERE MvCDocRf1='104-35077187' -- El documnto de referencia no existe
SELECT * FROM MOVCONT2 WHERE TrcCod= '800149695' AND CntVig=2016 AND CNTCOD='22050101' AND MvCNat='C' AND  MvCDocRf1='104-35077187'

 begin transaction;
DELETE FROM   HOJOBLPRV 
where HOPNoObl= '104-35077187' and CntVig=2016  
-- commit
-- ROLLBACK

-- 8



SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31519
select * from MOVCXP where mvcxpnuob = '22-3308389'
select * from HOJOBLPRV where HOPNoObl= '22-3308389' and CntVig=2016   --and  PrvCod= '1053777362'
select * from MOVCONT2 where doccod='CXP' AND MVCNRO = 14654 
SELECT * FROM MOVCONT2 WHERE TrcCod= '800149695' AND CntVig=2016 AND CNTCOD='22050101' AND MvCNat='C' AND    MvCDocRf1='22-3308389'

 begin transaction;
DELETE FROM   HOJOBLPRV 
where HOPNoObl= '22-3308389'  and CntVig=2016  and HOPVlrObl<0
-- commit
-- ROLLBACK


-- 9


SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31519
select * from MOVCXP where mvcxpnuob = '22-3313939'
select * from HOJOBLPRV where HOPNoObl= '22-3313939' and CntVig=2016   --and  PrvCod= '1053777362'
select * from MOVCONT2 where doccod='CXP' AND MVCNRO = 14654 
SELECT * FROM MOVCONT2 WHERE TrcCod= '830037946' AND CntVig=2016 AND CNTCOD='22050101' AND MvCNat='C' AND    MvCDocRf1='22-3313939'

 begin transaction;
DELETE FROM   HOJOBLPRV 
where HOPNoObl= '22-3313939'  and CntVig=2016  and HOPVlrObl<0
-- commit
-- ROLLBACK}

---------------------------------------------
---------------------------------------------
---------------------------------------------
-- HASTA AQUI 9 + 21 = 31 Obligaciones a AJUSTAR

---------------------------------------------
---------------------------------------------
---------------------------------------------
-- Otrs casos 

SELECT * FROM HOJOBLPRV WHERE HOPNoObl IN  ('C 13527', 
'C 13539'        ,
'C 13542'        ,
'CS-01-16'       ,
'CS-02-16'       ,
'-818428',
'-818429',
'-861946',
'GRLA 768',       
'HBS 9920'            ) AND CntVig=2016
ORDER BY HOPNOOBL



-- 10 ESTA NO ESAT BIEN ...

select distinct(HOPNoObl) from HOJOBLPRV where HOPVlrObl <0 and CntVig <= 2016  

SELECT * FROM MOVCXP WHERE DOCCOD='CFA' AND MvCxPNro=31492
select * from MOVCXP where mvcxpnuob = '7485'
select * from HOJOBLPRV where HOPNoObl= '7485' and CntVig=2016   --and  PrvCod= '19262239       '
select * from MOVCONT2 where doccod='CFA' AND MVCNRO = 31492 

BEGIN TRANSACTION;
UPDATE MOVCXP
SET MVCXCPAL= 2038700.00
WHERE DOCOD='CXP' AND MvCxPNro= 14174
-- COMMIT;
-- ROLLBACK;

 begin transaction;
DELETE FROM   HOJOBLPRV 
where HOPNoObl= '22-3313939'  and CntVig=2016  and HOPVlrObl<0
-- commit
-- ROLLBACK

-- DE AQUI EN ADELANTE LA QUE ESTE MAL EN SUMAS DE CREDITOS

------------------- ESTOS CASOS NO ESTAN AJUSTADOS     -----------------------
------------------- ESTOS CASOS NO ESTAN AJUSTADOS     -----------------------
------------------- ESTOS CASOS NO ESTAN AJUSTADOS     -----------------------
------------------- ESTOS CASOS NO ESTAN AJUSTADOS     -----------------------
-- DE AQUI PARA ABAJO ----------


-- 1 CASO

select * from MOVCXP where mvcxpnuob = 'JM 683906'
select * from HOJOBLPRV where HOPNoObl= 'JM 683906' and CntVig=2016 
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MVCNRO =31444
 
BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVLROBL=  3996058.00, HOPTotCre=3996058.00, HojBasDes=3996058.00
 where HOPNoObl= 'JM 683906' and CntVig=2016  
 -- COMMIT;

 -- 2 CASO


 select * from MOVCXP where mvcxpnuob = 'JM 683054'
select * from HOJOBLPRV where HOPNoObl= 'JM 683054'
 and CntVig=2016 
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MVCNRO =31419


BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVLROBL=  3181620.00, HOPTotCre=3181620.00, HojBasDes=3181620.00
 where HOPNoObl= 'JM 683054' and CntVig=2016  
 -- COMMIT;

  -- 3 CASO

 select * from MOVCXP where mvcxpnuob = 'HBS 9920'
select * from HOJOBLPRV where HOPNoObl= 'HBS 9920'
 and CntVig=2016 
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MVCNRO =31430


BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVLROBL=  408600.00, HOPTotCre=408600.00, HojBasDes=408600.00
 where HOPNoObl= 'HBS 9920'  and CntVig=2016  
 -- COMMIT;

   -- 4 CASO

 select * from MOVCXP where mvcxpnuob = 'GRLA 768' 
select * from HOJOBLPRV where HOPNoObl= 'GRLA 768'
 and CntVig=2016 
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MVCNRO =31480


BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVLROBL=  505257.00, HOPTotCre=505257.00, HojBasDes=505257.00
 where PRVCOD= '19423748' AND  HOPNoObl= 'GRLA 768'  and CntVig=2016  
 -- COMMIT;

-- 5 CASO


 select * from MOVCXP where mvcxpnuob = 'CS-02-16' 
select * from HOJOBLPRV where HOPNoObl= 'CS-02-16'
 and CntVig=2016 
SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MVCNRO =14609


BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVLROBL=  922680.00, HOPTotCre=922680.00, HojBasDes=922680.00
 where PRVCOD= '19091154' AND  HOPNoObl= 'CS-02-16'  and CntVig=2016  
 -- COMMIT;


 -- 6 CASO

 select * from MOVCXP where mvcxpnuob = 'CS-01-16' 
select * from HOJOBLPRV where HOPNoObl= 'CS-01-16'
 and CntVig=2016 
SELECT * FROM MOVCONT2 WHERE DOCCOD='CXP' AND MVCNRO =14610


BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVLROBL=  932000.00, HOPTotCre=932000.00, HojBasDes=932000.00
 where PRVCOD= '19091154' AND  HOPNoObl= 'CS-01-16'  and CntVig=2016  
 -- COMMIT;


 -- 7 CASO
        


  select * from MOVCXP where mvcxpnuob = 'C 13542 ' 
select * from HOJOBLPRV where HOPNoObl= 'C 13542 '
 and CntVig=2016 
SELECT * FROM MOVCONT2 WHERE DOCCOD='CFA' AND MVCNRO =31453


BEGIN TRANSACTION;
UPDATE HOJOBLPRV
SET HOPVLROBL=  19579200.00, HOPTotCre=19579200.00, HojBasDes=19579200.00
 where PRVCOD= '830142523' AND  HOPNoObl= 'C 13542'  and CntVig=2016  
 -- COMMIT;

 -- 8 Caso



      


