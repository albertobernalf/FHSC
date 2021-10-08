	-- Se debe examinar :
-- fechas de remision, fechas de radicacion. La fecha de radicacion No puede ser menor que la fecha de la Factura ...
SELECT MPNFAC, AGLREMNR,AGLFRDFAC FROM ADMGLO11 WHERE MPNFAC =2229713


-- fechas de ingreso - Egreso clinica
SELECT MPTDOC,MPCEDU,INGFECADM,INGFECEGR,INGCSC,INGFAC FROM INGRESOS WHERE INGFAC = 2229713        
     
SELECT facfch,* FROM MAEATE WHERE MPNFAC = 2249836  

select * from ingresos
where mpcedu='41304737' and mptDOC='CC' AND INGCSC= 76


"2016-03-02 11:56:44"
-- Fechas de evolciones del ingreso
SELECT HISTIPDOC,HISCKEY,HISFHORAT,HISCSEC FROM HCCOM1 WHERE HISCKEY= '20962866' AND HCTVIN1 = 36 ORDER BY HISFHORAT
-- fechas de la factura.

	SELECT MPNFAC,FACFCH,MAFCHS,MAFCHI,MAHORI,MAFCHE,MAHORE,MAFCES, MACTVING,MPCEDU,MPTDOC
	FROM MAEATE WHERE MPNFAC = 2306301       

-- comparacion general de fechas

				select a.MPNFAC,a.FACFCH,a.MAFCHS,a.MAFCHI,a.MAHORI,a.MAFCHE,a.MAHORE,a.MAFCES, a.MACTVING,a.MPCEDU,a.MPTDOC,
				b.INGFECADM,b.INGFECEGR,b.INGCSC,b.INGFAC--, c.hisfhorat
				from maeate a, ingresos b
				where a.mpnfac = b.ingfac and
				     a.mpnfac =2323839      
				    

SELECT * FROM HCCOM1 WHERE HISCKEY= '35199284' AND HCTVIN1=20


-- Aqui crear con la tabla HCCOM1


select a.MPNFAC,a.FACFCH,a.MAFCHS,a.MAFCHI,a.MAHORI,a.MAFCHE,a.MAHORE,a.MAFCES, a.MACTVING,a.MPCEDU,a.MPTDOC,
b.INGFECADM,b.INGFECEGR,b.INGCSC,b.INGFAC, c.hisfhorat
from maeate a, ingresos b, HCCOM1 c
where  a.mpnfac = 2219251 and a.mptdoc=b.mptdoc and a.mpcedu = b.mpcedu and a.mactving= b.ingcsc and
      a.mpcedu = '2226084' and a.mptdoc='CC' and b.ingcsc=20 AND
      b.mptdoc=c.histipdoc and b.mpcedu=c.hisckey and
      b.ingcsc=c.hctvin1



-- De acuredo a lo anteriro MODIFICAR

select MACTVING,facfch,mafchi,mahori,mafche,mahore,mafces,* from maeate where mpnfac =2273332       

SELECT * FROM INGRESOS WHERE MPCEDU = '1018429356' AND INGCSC=3  -- and ingcsc4
--2226667  EL DIA 15/01/2016


-- Las tres tablas HCCOM1, MAEATE, INGRESOS, Pero en orden de conveniencia :
		
									select a.MPNFAC,a.FACFCH,a.MAFCHI,a.MAHORI,b.INGFECADM, c.hisfhorat, a.MAFCHS,a.MAFCHE,a.MAFCES,a.MAHORE,b.INGFECEGR, a.MACTVING,a.MPCEDU,a.MPTDOC,
									b.INGCSC,b.INGFAC
									from maeate a, ingresos b, HCCOM1 c
									where  a.mpnfac =2402535                                                                                                                                           --no se hizo 2248512                       
									 and a.mpnfac = b.ingfac AND
									      b.mptdoc=c.histipdoc and b.mpcedu=c.hisckey and
									      b.ingcsc=c.hctvin1
	-- 0056613
	
-- 11:20 LA SALIDA                
                  
-- 0054303

-- OTRA VOZ
	
SELECT facfch,MAFCES,mafche,MAFCHI,MAHORI,MAFCHS,MAHORE,MPTDOC,MPCEDU,MACTVING,* FROM MAEATE WHERE MPNFAC = 2403130                            

select * from ingresos
where mpcedu='20911028' and mptDOC='CC' AND INGCSC= 13

select * from ingresos where ingfac=2264058
select * from maeate where facfch>= '2016-08-21' order by mpnfac

--- 2336203

BEGIN TRANSACTION;
UPDATE MAEATE
SET
--MAFCHE = '2016-11-08'--,--,30
--,
MAHORE=  '08:30:00'--,--,--
----,
--,MAFCES ='2016-11-08'
--,MAFCHS='2016-11-08',
--MAFCHE='2016-11-08'
--,
--MAFCHI='2016-06-02'
--,MAHORI= '13:30:00'
 WHERE MPNFAC in      (2402535              )     

-- rollback;
-- 	COMMIT

-- Este es el query a verificar

begin transaction;
update ingresos
set --ingfecadm='2016-06-02 09:30:00'--,
Ingfecegr='2016-11-21 08:30:00.000'  
WHERE INGFAC = 2402535       
Where mpcedu='20911028' and mptDOC='TI' AND INGCSC= 13

-- COMMIT	
-- ROLLBACK

-- FIN QUERY A VERIFIACR		;	


BEGIN TRANSACTION;
UPDATE INGRESOS
SET 
--INGFECADM=CAST ('2016-03-23'||' '||SUBSTRING(CAST (INGFECADM AS VARCHAR),12,8) AS TIMESTAMP)--,
INGFECEGR=CAST ('2015-12-22'||' '||SUBSTRING(CAST (INGFECEGR AS VARCHAR),12,8) AS TIMESTAMP)
WHERE INGFAC in            (2345243     )          
   
-- rollback;
-- commit


begin transaction;
update ingresos
set -- ingfecadm='2015-12-23 09:44:29'
ingfecegr='2016-11-17 11:20:00.00'
where ingfac in (2381714    )     
      
where mpcedu='11389223' and mptDOC='CC' AND INGCSC= 16

-- COMMIT;	

BEGIN TRANSACTION;
UPDATE INGRESOS
SET 
INGFECADM=CAST ('2015-12-16'||' '||SUBSTRING(CAST (INGFECADM AS VARCHAR),12,8) AS TIMESTAMP),
INGFECEGR=CAST ('2015-12-16'||' '||SUBSTRING(CAST (INGFECEGR AS VARCHAR),12,8) AS TIMESTAMP)
WHERE INGFAC in   (2218900      )
WHERE MPTDOC='CC' AND MPCEDU     = '213380' AND INGCSC=5
-- 	COMMIT	;
-- rollback
select * from ingresos where ingfac = 2201745 
select facfch,* from maeate where mpnfac = 2204483  

begin transaction;
update maeate
set facfch ='2015-11-25'
where mpnfac= 2204483
-- commit;