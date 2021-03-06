SELECT * FROM HOSVITAL.MOVCONT3 WHERE DOCCOD='FAR' AND MVCNRO = 572870;
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO = 572870;

/*
Contabilización Facturación Radicada, Remisión #22394                                               	
Contabilización Facturación Radicada, Remisión #22479                                               	
Contabilización Facturación Radicada, Remisión #22537          
No ha subido la remsion nro  22675	

*/                                     	

select *from hosvital.admglo11 where mpnfac = 572870; -- esta en la remisoon nro 22675	del 08/04/2019

SELECT * FROM HOSVITAL.TERCEROS WHERE TRCCOD IN ('20571096','20571096','900298372');

select * from hosvital.movcont3 where doccod='FAD'  and  mvcfch >= '2019-03-01 00:00:00';

select * from hosvital.movcont3 where doccod='FAD'  and  mvcfch >= '2019-04-01 00:00:00';

select * from hosvital.admglo01 where  aglremnr in (22394,22479,22537);


--  veamos esta remision, ya contabilizada

select * from hosvital.admglo01  where aglremnr =  22394 ;
select * from hosvital.admglo11 where  aglremnr =  22394 ;
-- Esta si esta contabilizada la facturacioin radicada el 01 de abril veamos DOS facturas


SELECT * FROM HOSVITAL.MOVCONT3 WHERE DOCCOD='FAR' AND MVCNRO in (566760,566806	);
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO  in (566760,566806	);	

-- Veamos estios dos terceros, comparados con el que ya tengo

SELECT * FROM HOSVITAL.TERCEROS WHERE TRCCOD IN ('800246953','79312984','900298372');

-- ESTA ES LA CONTABILIZACION LOCAL


SELECT * FROM HOSVITAL.MOVCONT3 WHERE DOCCOD='FAR' AND MVCNRO  IN (572870, 569183, 569192);
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO IN (572870, 569183, 569192);

select * from hosvital.maeate where mpnfac = 572870;
SELECT * FROM HOSVITAL.MAEEMP WHERE MENNIT ='SS0021';

select * from hosvital.admglo01  where aglremnr =  22675 ;
select * from hosvital.admglo11 where  MPNFAC =  572870 ; 

SELECT * FROM HOSVITAL.MOVCONT2 
WHERE DOCCOD='FAR' AND TRCCOD = '900298372' AND MVCCFCH >='2019-03-01'; 

SELECT * FROM HOSVITAL.HOJOBL WHERE HOJNUMOBL IN ('572870', '569183', '569192','569246','569269') ORDER BY HOJNUMOBL;

SELECT *  FROM HOSVITAL.TERCEROS WHERE TRCCOD = '20571096';

INSERT INTO HOSVITAL.HOJOBL
SELECT  EMPCOD,HOJNUMOBL,'900298372',CNTVIG,'13010601',MCDPTO,DOCCOD,MENNIT,CNUCOD,CNUSUB,HOJFCHOBL,HOJVLRCUO,HOJCUOINI,HOJVLROBL,HOJTOTDEB,HOJTOTDEB,HOJTIPPAG,HOJTPPGDS,
HOJNUMCUO,22675,HOJFCHREM,HOJNRORAD,HOJFCHRAD,HOJTIPGLO,HOJSTAGLO,HFCHRECGL,HJFCHRADGL,HJFCANOBL,HOJVLRGLO,HOINDDEV,HONORADG,HOJMATIPD,HOJNROCAS,HOJCARRCH,
CONTIP,CONCOD,HOJFCHRCH,HOJUSRRCH,HOJINDFAC,HOJDOCRES,HOJNOMRES,HOJAPERES,HOJCNSING,HOJESTHOM,HOJINDREC,HOJPRF,HOJFCHRAR,HOJNUMRAR,HOJUSUINF,HOJFCHINF,HOJINDINF,HOJOBLCLU,
HOJOBLCLF,HOJOBLCLE
 FROM HOSVITAL.HOJOBL
WHERE HOJNUMOBL IN  ('572870');

DELETE FROM HOSVITAL.HOJOBL WHERE HOJNUMOBL IN ('572870') AND CLICOD = '900298372' AND CNTCOD ='13010601';

UPDATE HOSVITAL.HOJOBL 
SET CLICOD = '900298372'
WHERE HOJNUMOBL IN ('572870') AND CLICOD ='20571096';

SELECT * FROM HOSVITAL.CUENTAS WHERE CNTCOD = '1301' AND CNTVIG=2019;
select * from hosvital.nihojobl where nihojno = '572870';

UPDATE HOSVITAL.niHOJOBL 
SET CLICOD = '900298372'
WHERE nihojno IN ('572870') AND CLICOD ='20571096';

------------------------------------------------
SELECT * FROM HOSVITAL.MOVCONT3 WHERE DOCCOD='FAR' AND MVCNRO = 570683;
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='FAR' AND MVCNRO = 570683;  --900298372      	
SELECT * FROM HOSVITAL.HOJOBL WHERE HOJNUMOBL IN ('570683') and cntvig=2019 ORDER BY HOJNUMOBL;

UPDATE HOSVITAL.HOJOBL 
SET CLICOD = '900298372'
WHERE HOJNUMOBL IN ('570683') AND CLICOD ='19480578';

select * from hosvital.nihojobl where nihojno = '570683';

UPDATE HOSVITAL.niHOJOBL 
SET CLICOD = '900298372'
WHERE nihojno IN ('570683') AND CLICOD ='19480578';

