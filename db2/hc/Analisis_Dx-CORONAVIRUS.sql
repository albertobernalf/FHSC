SELECT * FROM HOSVIPRU.MAEATE WHERE MPCEDU= '21105669';

UPDATE HOSVIPRU.MAEATE 
SET MAESTF=0
WHERE MPCEDU= '21105669';

SELECT * FROM HOSVITAL.INGRESOS  WHERE MPCEDU= '3251373';

SELECT * FROM HOSVITAL.MAEDIA WHERE DMNOMB LIKE('%CORONAVI%');

/*
B342 	
B972 	
*/


SELECT * FROM HOSVIPRU.HCDIAGN WHERE HISCKEY='19136135';

SELECT MPCEDU, INGCSC,  INGDXCLI, INGENTDX,  INGSALDX,INGDXSAL1,  INGDXSAL2, INGDXSAL3,  INGFAC
 FROM HOSVIPRU.INGRESOS WHERE MPCEDU='11293090' AND INGCSC=1;
--C181, D121,  D373


SELECT * FROM HOSVIPRU.TMPFAC WHERE TFCEDU= '52176163';


SELECT MPCEDU,  INGDXCLI, INGENTDX,  INGSALDX,INGDXSAL1,  INGDXSAL2, INGDXSAL3,  INGFAC
 FROM HOSVITAL.INGRESOS  WHERE INGFECADM>= '2020-04-01 00:00:00' AND INGDXCLI IN ('B342','B972');

SELECT MACTVING FROM HOSVITAL.MAEATE WHERE MPNFAC= 627714	
;

UPDATE HOSVIPRU.MAEATE 
SET MAESTF=0
WHERE MPNFAC = 627714	;

SELECT * FROM HOSVITAL.HCDIAGN 
WHERE (HISCKEY,HISCSEC) IN (SELECT  HISCKEY,HISCSEC FROM HOSVITAL.HCCOM1 WHERE HISCKEY='20913777' AND HCTVIN1=8);


SELECT * FROM HOSVITAL.HCCOM1 WHERE HISCKEY='20913777' AND HCTVIN1=8;

SELECT MPCEDU, INGCSC,  INGDXCLI, INGENTDX,  INGSALDX,INGDXSAL1,  INGDXSAL2, INGDXSAL3,  INGFAC
 FROM HOSVIPRU.INGRESOS  WHERE INGFECADM>= '2020-04-01 00:00:00' AND INGDXCLI IN ('B342','B972')  AND INGSALDX NOT IN ('B342','B972') ;

update
hosvipru.ingresos
set ingdxsal1='J448',INGSALDX='J448'
WHERE MPCEDU='20913777' AND INGCSC=8;

--INGENTDX DX PPAL DE INGRESO
-- INGDXCLI = DX PPAL DE SALIDA
-- INGDXSAL2 =DX RELACIONADOS DE SALIDA

--SDO DX =B342
--TERCER DX=B972
-- EL PROGRAMA COLOCO EN INGSALDX3= B342 	
-- EN INGSALDX3 COLOCO  = I500 

-- COLOCO EN LA TMPFAC B972 CAMPO=	TFDI4S


SELECT MPCEDU, INGCSC,  INGDXCLI, INGENTDX,  INGSALDX,INGDXSAL1,  INGDXSAL2, INGDXSAL3,  INGFAC
 FROM HOSVIPRU.INGRESOS WHERE MPCEDU='3251373' AND INGCSC=1;


UPDATE HOSVIPRU.HCCOM51
SET HCPRCEST = 'E' -- 
where hisckey = '11293090'  and hiscsec in  (567,372)  --  and HISCSEC in (2972)
 AND hcprcest= 'O'  ;   

SELECT * FROM HOSVIPRU.HCDIAGN WHERE HISCKEY='3251373';
SELECT * FROM HOSVIPRU.INGRESOS  WHERE MPCEDU= '3251373';

SELECT * FROM HOSVIPRU.TMPFAC WHERE TFCEDU= '3251373';