Solicito su colaboracion en epicrisis de la paciente con cc 1077083009 de eps famisanar  de la factura 1708688 la epicrisis no se genero
CC39819068


SELECT * FROM CAPBAS WHERE MPCEDU = '1072706300'
SELECT * FROM INGRESOS WHERE MPCEDU = '39819068' ORDER BY INGCSC
SELECT MPNFAC,MPTDOC,MPCEDU,MACTVING,FACFCH FROM MAEATE WHERE MPNFAC = 39819068                        
SELECT * FROM HCCOM1 WHERE HISCKEY= '1077086147'  ORDER BY HISCSEC

-- Consulto las fechas de ingreso

SELECT * FROM INGRESOS WHERE MPCEDU = '09032015' ORDER BY INGCSC

SELECT * FROM TMPFAC WHERE TFCEDU  = '09032015'
SELECT * FROM MAEATE WHERE MPCEDU = '09032015'
SELECT * FROM TMPFAC6 WHERE TFCEDU = '1057593900'
BEGIN TRANSACTION;
UPDATE INGRESOS SET INGFECEGR='2015-03-11 19:10:34'
 WHERE MPCEDU = '09032015' 
 -- COMMIT

-- Paso No 1 :  Consulto Folio mayor y Folio menor:

explain SELECT hisckey,histipdoc,hiscsec,hisfhorat from hccom1
 where hisckey = '09032015' 
and hctvin1 = 1
order by hctvin1,hiscsec -- ULTIMO FOLIO = "2012-09-03 04:53:55"

-- Caso A

-- ACTUALIZO LA FECHA DE EGRESO, con la fecha del ultimo folio de el ingreso


begin transaction;
update ingresos
set ingfecegr = a.hisfhorat
from  hccom1 a,ingresos b
where ingresos.mpcedu = '39819068' and ingresos.mptdoc ='CC' and ingresos.ingcsc = 3 and
      ingresos.mpcedu = a.hisckey  and ingresos.mptdoc = a.histipdoc and ingresos.ingcsc=a.hctvin1 and
        a.hisckey=b.mpcedu and a.histipdoc=b.mptdoc and a.hctvin1 = b.ingcsc and
         a.hiscsec = (select max(x.hiscsec) from hccom1 x where x.hisckey = a.hisckey and x.histipdoc = a.histipdoc and x.hctvin1 = a.hctvin1)
-- ROLLBACK;
-- commit 		

-- Casos B

-- Actualiza la FECHA DE INGRESO, con el minimo folio para el ingreso

begin transaction;
update ingresos
set ingfecadm = a.hisfhorat,INGFEHATU= A.HISFHORAT
from  hccom1 a,ingresos b
where ingresos.mpcedu = '1057593900' and ingresos.mptdoc ='CC' and ingresos.ingcsc = 1 and
      ingresos.mpcedu = a.hisckey  and ingresos.mptdoc = a.histipdoc and ingresos.ingcsc=a.hctvin1 and
        a.hisckey=b.mpcedu and a.histipdoc=b.mptdoc and a.hctvin1 = b.ingcsc and
         a.hiscsec = (select min(x.hiscsec) from hccom1 x where x.hisckey = a.hisckey and x.histipdoc = a.histipdoc and x.hctvin1 = a.hctvin1)
-- ROLLBACK;
-- COMMIT
-- SI es actual verificar

begin transaction;
update tmpfac
set TFHORI= '01:23:05'
where tmpfac.tfcedu = '1057593900' and tmpfac.tftdoc ='CC' and tmpfac.tmctving = 1 
-- ROLLBACK;

