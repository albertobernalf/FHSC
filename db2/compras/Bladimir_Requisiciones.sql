select * from HOSVITAL.requisici where reqnro= 61036; -- reqfch=  2020-01-15	
select * from hosvital.requisi1  where reqnro= 61036;
select * from hosvital.movinV1 where doccod='ASA' AND DOCNRO= 12100648; -- MVTOFECRE = 2020-01-15
select * from hosvital.movinV4 where doccod='ASA' AND DOCNRO =   12100648; --  FCHMVT =  2019-12-13 12:37:52.000000	
select * from hosvital.movinV3 where doccod='ASA' AND DOCNRO =   12100648;

select * from hosvital.movinV1 where MVTONRORQ= 60594;
select * from hosvital.movinV1; --  where MVTONRORQ= 60594;

SELECT * FRoM HOSVITAL.LOTESUM;
SELECT * FRoM HOSVITAL.LOTESUM1;
SELECT * FRoM HOSVITAL.LOTESUM2;

SELECT * FROM HOSVITAL.DOCUCON WHERE DOCCOD='ASA';


SELECT * FROM HOSVITAL.REQUISI1 WHERE REQNRO  = 60594;
SELECT *FROM

SELECT * FROM HOSVITAL.KARDEX1  WHERE MOVREQN= 60594; 
SELECT * FROM HOSVITAL.KARDEX1  WHERE DOCTIP = 'ASA'  AND DOCNRO=12103604;


--ASA : 12103604
-- REQ 


---- asa 12100648


select M4.DOCCOD,M4.DOCNRO,M4.FCHMVT AS FECHA_DESPACHO, M1.MVTOLOT AS LOTE, M1.PRVCOD AS COD_PROV,M1.MVTOCNTL AS CANTIDAD, M1.MVTONRORQ AS REQ_MOVINV1,M1.MVTOFECRE AS FECHA_EN_MOVINV1,
          R1.REQFCH AS FECHA_REQUISICION, R2.REQNRO AS REQUISICION_PROBLEMA,R2.MSRESO,R2.REQCANAPR AS CANTIDAD_REQ,M4.MVTODOCPAC AS PACIENTE
from  hosvital.movinv4 m4
INNER join hosvital.requisici r1 ON (R1.DOCCOD='IRQ' )
INNER join hosvital.movinv1 m1 ON (M4.DOCCOD=M1.DOCCOD AND M4.DOCNRO=M1.DOCNRO  AND M1.MVTONRORQ = R1.REQNRO )
INNER  join hosvital.requisi1 r2 ON (R1.DOCCOD = R2.DOCCOD AND R1.REQNRO= R2.REQNRO AND R2.MSRESO=M4.MSRESO)
where m4.doccod='ASA' AND M4.DOCNRO = 12103604 ;  -- AND R2.MSRESO= '0031HM01' ;


SELECT * FROM HOSVITAL.KARDEX1
WHERE DOCTIP='ASA' AND MOVFCH>= '2019-01-01 00:00:00' AND MSRESO IN ('0194ZZZ1','0358ZZZ1');

SELECT K.DOCTIP,K.DOCNRO,  K.MOVFCH, M.MSRESO, M.MSNOMG, K.MOVES,K.MOVCNT,K.MOVVLU, K.MOVVLT,K.MOVREQN,K.MOVCODPAC
FROM HOSVITAL.KARDEX1 K
INNER JOIN HOSVITAL.MAESUM1 M ON (M.MSRESO = K.MSRESO)
WHERE  MOVFCH>= '2019-01-01 00:00:00' AND M.MSRESO IN (SELECT  MSRESO FROM HOSVITAL.MAESUM1 WHERE MSNOMG LIKE ('%ASEPTIGEL%'));


SELECT K.DOCTIP,K.DOCNRO,  K.MOVFCH, M.MSRESO, M.MSNOMG, K.MOVES,K.MOVCNT,K.MOVVLU, K.MOVVLT,K.MOVREQN,K.MOVCODPAC
FROM HOSVITAL.KARDEX1 K
INNER JOIN HOSVITAL.MAESUM1 M ON (M.MSRESO = K.MSRESO)
WHERE  MOVFCH>= '2019-01-01 00:00:00' AND M.MSRESO IN (SELECT  MSRESO FROM HOSVITAL.MAESUM1 WHERE MSNOMG LIKE ('%ASEPTIDINA%'));

