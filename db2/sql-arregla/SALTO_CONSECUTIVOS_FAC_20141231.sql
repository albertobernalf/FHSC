FAC (16 Documentos)
 


2041770, 2041772, 2041786, 2041861, 2042007, 2042024, 2042030, 2042043, 2042084, 2042129
2042286   ,   2042299, 2042314
2045782
2047066, 2047139
 


NCG  14849


-- Proceso :

select * from maeate where mpnfac IN (2034974,2037514,2037911, 2037919,2037921,2037968,2037975,2038032,2038222,2038233,2038427,2038965)  --, )  
order by mpnfac



BEGIN TRANSACTION;DELETE FROM MAEATE WHERE MPNFAC = 1999794; END;

-- PRIMERA FACTURA No 2034974

begin transaction;
insert into maeate
select 2389769    ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2389770 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA
SP_HELP MOVCONT3
begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2389769     ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen , mvccnvmon ,  mvcorigen ,NULL,   mvcestpre ,NULL,NULL,NULL
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2389770
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


select * from movcxc where mccnumobl = '2041770'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2041770'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2034974
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2034974
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2041770'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2041770 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2041770 
select * from hojobl where hojnumobl = '2041770'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2389769     ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2389769     ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 ,NULL,NULL
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2389770  AND MVCNAT='D' AND MVCCSC=1

SELECT * FROM MOVCONT2
SP_HELP MOVCONT2
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2389769     ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2389769     ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 ,NULL,NULL
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2389770  AND MVCNAT='C' AND MVCCSC=3
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2389769 ' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2389769 ' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 , CONVERT(DATETIME,'1753-01-01 00:00:01.000') ,  0 ,  CONVERT(DATETIME,'1753-01-01 00:00:01.000') ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec,NULL,CONVERT(DATETIME,'1753-01-01 00:00:01.000'),NULL,NULL,CONVERT(DATETIME,'1753-01-01 00:00:01.000'),NULL,NULL,CONVERT(DATETIME,'1753-01-01 00:00:01.000'),NULL 
  FROM HOJOBL WHERE HOJNUMOBL='2389770' AND CNTVIG=2016 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SP_HELP HOJOBL
SELECT * FROM HOJOBL

-- segundop

SELECT * FROM MOVCONT3  WHERE DOCCOD='FAC' AND MVCNRO  IN (2041770)
SELECT * FROM MOVCONT2  WHERE DOCCOD='FAC' AND MVCNRO  IN (2041770)

SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2021183' )


-- SEGUNDA FACTURA No 2041772

begin transaction;
insert into maeate
select 2041772   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2041771 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2041772    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2041771
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2041772'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2041772'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2041772
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2041772
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2041772'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2041772 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2041772 
select * from hojobl where hojnumobl = '2041772'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2041772    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2041772    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2041771  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2041772    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2041772    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2041771  AND MVCNAT='C' AND MVCCSC=3
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2041772' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2041772' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2041771' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK


SELECT * FROM MOVCONT3  WHERE DOCCOD='FAC' AND MVCNRO  IN (2041772)
SELECT * FROM MOVCONT2  WHERE DOCCOD='FAC' AND MVCNRO  IN (2041772)

SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2041772' )


-- TERCERA


begin transaction;
insert into maeate
select 2041786   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2041785 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2041786    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2041785
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2041786'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2041786'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2041786
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2041786
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2041786'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2041786 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2041786 
select * from hojobl where hojnumobl = '2041786'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2041786    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2041786    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2041785  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2041786    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2041786    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2041785  AND MVCNAT='C' AND MVCCSC=2
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2041786' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2041786' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2041785' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK


SELECT * FROM MOVCONT3  WHERE DOCCOD='FAC' AND MVCNRO  IN (2037911)
SELECT * FROM MOVCONT2  WHERE DOCCOD='FAC' AND MVCNRO  IN (2037911)

SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2037911' )


-- CUARTA 2041861

begin transaction;
insert into maeate
select 2041861   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2041860 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2041861    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2041860
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2041861'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2041861'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2041861
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2041861
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2041861'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2041861 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2041861 
select * from hojobl where hojnumobl = '2037919'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2041861    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,2041861    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2041860  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2041861    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2041861    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2041860  AND MVCNAT='C' AND MVCCSC=2
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2041861' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2041861' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2041860' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK


SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2041861' )


-- QUINTA 2042007

begin transaction;
insert into maeate
select 2042007   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2042006 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2042007    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2042006
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2042007'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2042007'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042007
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042007
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2042007'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042007 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042007 
select * from hojobl where hojnumobl = '2042007'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042007    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042007    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042006  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042007    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042007    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042006  AND MVCNAT='C' AND MVCCSC=2
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2037919' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2042007' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2042006' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2042007' )

-- SEXTA


begin transaction;
insert into maeate
select 2042024   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2042023 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2042024    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2042023
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2042024'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2042024'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042024
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042024
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2042024'
--commit;


BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042024    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042024    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042023  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042024    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042024    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042023  AND MVCNAT='C' AND MVCCSC=2
-- COMMIT;
-- ROLLBACK


BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2042024' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2042023' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2042024' )

-- SEPTIMA 2042030



begin transaction;
insert into maeate
select 2042030   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2042029 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2042030    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2042029
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2042030'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2042030'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042030
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042030
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2042030'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042030 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042030 
select * from hojobl where hojnumobl = '2042030'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042030    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042030    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042029  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042030    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042030    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042029  AND MVCNAT='C' AND MVCCSC=3
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2042030' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2042030' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2042029' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2042029' )



-- OCTAVA


begin transaction;
insert into maeate
select 2042043   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2042042 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2042043    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2042042
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2042043'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2042043'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042043
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042043
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2042043'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042043 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042043 
select * from hojobl where hojnumobl = '2042043'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042043    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042043    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042042  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042043    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042043    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042042  AND MVCNAT='C' AND MVCCSC=2
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2042043' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2042043' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2042042' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2042043' )


-- NOVENA 2042084

begin transaction;
insert into maeate
select 2042084   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2042083 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2042084    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2042083
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2042084'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2042084'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042084
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042084
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2042084'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042084 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042084 
select * from hojobl where hojnumobl = '2042084'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042084    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042084    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042083  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042084    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042084    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042083  AND MVCNAT='C' AND MVCCSC=2
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2042084' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2042084' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2042083' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2042084' )



--DECIMA 2042129



begin transaction;
insert into maeate
select 2042129   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2042128 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2042129    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2042128
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2042129'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2042129'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042129
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042129
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2042129'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042129 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042129 
select * from hojobl where hojnumobl = '2042129'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042129    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042129    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042128  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042129    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042129    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042128  AND MVCNAT='C' AND MVCCSC=2
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2042129' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2042129' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2042128' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2042129' )




-- DECIMA PRIMERA 2042286



begin transaction;
insert into maeate
select 2042286   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2042285 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2042286    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2042285
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2042286'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2042286'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042286
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042286
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2042286'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042286 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042286 
select * from hojobl where hojnumobl = '2042286'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042286    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042286    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042285  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042286    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042286    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042285  AND MVCNAT='C' AND MVCCSC=3
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2042286' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2042286' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2042285' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2042285' )


--DECIMA SEGUNDA


begin transaction;
insert into maeate
select 2042299   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2042298 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2042299    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2042298
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2042299'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2042299'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042299
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042299
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2042299'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042299 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042299 
select * from hojobl where hojnumobl = '2042299'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042299    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042299    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042298  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042299    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042299    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042298  AND MVCNAT='C' AND MVCCSC=3
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2042299' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2042299' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2042298' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2038965' )

-- decima tercera



begin transaction;
insert into maeate
select 2042314   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2042313 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2042314    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2042313
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2042314'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2042314'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042314
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042314
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2042314'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2042314 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2042314 
select * from hojobl where hojnumobl = '2042314'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042314    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042314    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042313  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2042314    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2042314    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2042313  AND MVCNAT='C' AND MVCCSC=3
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2042314' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2042314' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2042313' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2042314' )


-- decimo cuarta

begin transaction;
insert into maeate
select 2045782   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2045781 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2045782    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2045781
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2045782'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2045782'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2045782
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2045782
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2045782'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2045782 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2045782 
select * from hojobl where hojnumobl = '2045782'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2045782    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2045782    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2045781  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2045782    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2045782    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2045781  AND MVCNAT='C' AND MVCCSC=3
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2045782' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2045782' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2045781' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2045782' )

-- decimo quinta



begin transaction;
insert into maeate
select 2047066   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2047065 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2047066    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2047065
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2047066'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2047066'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2047066
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2047066
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2047066'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2047066 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2047066 
select * from hojobl where hojnumobl = '2047066'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2047066    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2047066    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2047065  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2047066    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2047066    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2047065  AND MVCNAT='C' AND MVCCSC=3
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2047066' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2047066' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2047065' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN ('2047066' )


-- decimo sexta



begin transaction;
insert into maeate
select 2047139   ,  matipdoc ,  facdscprf ,  mpcedu ,  mptdoc ,  mpclpr ,  mpmeni,  mafchi ,  mahori ,
  manore ,  matire ,  matere ,  maviai ,  madi1i ,  madi2i ,  madi3i ,  mamein ,  maesmi ,  maesms ,  mameeg ,  madi1s ,  madi2s ,  madi3s ,  masege ,
  macopr ,  matipa ,  matian ,  mafchm ,  macamu ,  maquia ,  maests ,  macaue ,  maccom ,  maestp ,  mamots ,  mafche ,  mahore ,
  mahoro ,  mafchs ,  macmad ,  0 ,  0 ,  micodi ,  0 ,  0 ,  0 ,  0 ,  mavpau ,  mavdsc ,  mavnpu ,
  maulcn ,  maulcp ,  maulcs ,  maccfc ,  msuing ,  msusal ,  msufac ,  msuafa ,  macoan ,  1 ,  mpfria ,
  '' ,  mafcfa ,  mptucod ,  mptcodp ,  mpptcodi ,
  mpcsubp ,  mpmsubp ,  maviva ,  '' ,  mafces ,  mpnume ,  mpcomp ,  facfch ,  manomaut ,  matpeaut ,  mavlraut ,
  macpgpgo ,  macpglqd ,  scccod ,  sccemp ,  faccodpab ,  faccodcam ,  turcod ,  facsnume ,  facsnitasg ,  facsfchvin ,  facsvepl ,
  facsvema ,  facsveti ,  facsvemo ,  facsvecl ,  facscndacc ,  facssitacc ,  facsfchacc ,  facscodd ,  facscodm ,  facsrulurb ,  facsindasg ,  facsfchvfi ,
  facstpicnd ,  facscedcnd ,  facsnomcnd ,  facsmcodfc ,  facsnomsuc ,  facstpoec ,  facsdesec ,  facsnomemp ,
  facscodde ,  facscodme ,  facscoddcn ,  facscodmcn ,  malugexp ,
  madocdcl ,  madecla ,  maluexcnd ,  mainfacc ,  madircnd ,  matelcnd ,
  mactving ,  matidodc ,  mavlrimpt ,
  manrnotcr ,  mafchnot ,  maestnot ,  maucnaqx ,  maultcci ,  manrcerd ,  maubifac ,
  mausufac ,  mactvact ,  mainddev ,  maestenv ,  maestcan ,  0 ,
  maclsdoc ,  maobsfac ,  maapere ,
  mavpocon ,  mavlrtiv
from maeate 
where mpnfac = 2047138 -- 07/11/2013
-- commit;
-- rollback

-- FINANCIERA

begin transaction;
insert into movcont3
SELECT empcod ,  doccod ,  2047139    ,  mcdpto ,  'Salto de consecutivo' ,  agccdg ,  tranapl ,  mvcfch ,
  mvcmonbse ,  mvctascmb ,  mvcest ,  mvcusucre ,  mvcusuact ,  mvcfchact ,  mvcultcsc ,
  mvcmpajs ,  mvfchsys ,  mvcusuanu ,  mvcfchanu ,  mvcidetrb ,  mvcdocret ,  mvcnroret ,  mvcnroaut ,  mvcfchemi ,  mvcfchaut ,  mvsrccm ,
  mvsrcerr ,  mvcmayaux ,  mvcmaygen ,  mvcestpre ,  mvccnvmon ,  mvcorigen 
  FROM MOVCONT3
WHERE DOCCOD='FAC' AND MVCNRO=2047138
-- COMMIT;
-- ROLLBACK;

select * from movcxc where mccnumobl = '2047139'
create table movcxc_1917802 as select * from  movcxc where mccnumobl = '2047139'
create table movcont2_1917802 as select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2047139
create table movcont3_1917802 as select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2047139
create table hojobl_1917802 as select * from  hojobl where hojnumobl = '2047139'
--commit;



select * from movcont2 WHERE DOCCOD='FAC' AND MVCNRO=2047139 
select * from movcont3 WHERE DOCCOD='FAC' AND MVCNRO=2047139 
select * from hojobl where hojnumobl = '2047139'

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2047139    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2047139    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2047138  AND MVCNAT='D' AND MVCCSC=1
-- COMMIT;
-- ROLLBACK

BEGIN TRANSACTION;
INSERT INTO MOVCONT2
SELECT empcod ,  doccod ,  2047139    ,  mcdpto ,  mvccsc ,  cntvig ,  cntcod ,  cnucod ,  cnusub ,  cnccod ,  cntsub , trccod ,  2047139    ,  '' ,
  '' ,  mvcnat ,  0 ,  mvcvlrex ,  'Salto en consecutivos' ,  mvcbse ,  0 ,  mvcimpcod ,  mvccfch ,  mvcsedorg ,  mvcmes ,  mvcanio ,  mvccmpaj ,  mvcdocrf4 
FROM MOVCONT2
WHERE DOCCOD='FAC' AND MVCNRO=2047138  AND MVCNAT='C' AND MVCCSC=2
-- COMMIT;
-- ROLLBACK

select * from hojobl WHERE HOJNUMOBL >= '2047139' --limit 10
ORDER BY HOJNUMOBL

BEGIN TRANSACTION;
INSERT INTO HOJOBL
SELECT empcod ,  '2047139' ,  clicod ,  cntvig ,  cntcod ,  mcdpto ,  doccod ,  mennit , cnucod , cnusub ,  hojfchobl ,  0 ,  0 ,  0 ,
  0 ,  0 ,  hojtippag ,  hojtppgds ,  hojnumcuo ,  0 ,  '0001-01-01' ,  0 ,  '0001-01-01' ,  hojtipglo ,  hojstaglo ,  hfchrecgl ,
  hjfchradgl ,  hjfcanobl ,  hojvlrglo ,  hoinddev ,  honoradg ,  hojmatipd ,  hojnrocas ,  hojcarrch ,  contip ,  concod ,  hojfchrch ,  hojusrrch ,
  hojindfac ,  hojdocres ,  hojnomres ,  hojaperes ,  0 ,  hojesthom ,  hojindrec 
  FROM HOJOBL WHERE HOJNUMOBL='2047138' AND CNTVIG=2014 AND HOJESTHOM='N'

-- COMMIT
-- ROLLBACK
SELECT * FROM HOJOBL  WHERE HOJNUMOBL IN 2047139' )

