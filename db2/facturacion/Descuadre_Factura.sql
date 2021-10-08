/*

Me pueden colaborar por favor indicarme a qué se debe esta diferencia entre lo facturado del área de facturación  y lo contabilizado en el área de contabilidad que generó esta inconsistencia, muchas gracias.

638795	                 5.642.578		638795	                  5.645.683	0	           (3.105)
639393	               23.751.199		639393	               23.792.503	0	        (41.304)

*/


select mpnfac, matipdoc, macscp, prcodi,macanpr,mpinte, mavatp,mod(mpinte,macanpr),   mapvlrsiv, mahoncod, (mapvlrsiv - mpinte) as descuadre
 from hosvital.maeate2
where  mpnfac = 639393 and mpinte <>  mapvlrsiv    and fcptpotrn='F' and maesanup <>'S';

select mpnfac, matipdoc, macscp, prcodi,macanpr,mpinte, mavatp,mod(mpinte,macanpr),   mapvlrsiv, mahoncod, (mapvlrsiv - mpinte) as descuadre
 from hosvital.maeate2
where  mpnfac = 638795 and mpinte <>  mapvlrsiv    and fcptpotrn='F' and maesanup <>'S';



select count(*)  from hosvital.maeate2 where mpnfac in (638795);  -- 1437	
select count(*)  from hosvital.maeate2 where mpnfac in (639393);  -- 404	
select count(*)  from hosvital.maeate3 where mpnfac in (639393);  -- 495
select count(*)  from hosvital.maeate3 where mpnfac in (638795);  -- 0


select * from hosvital.maeate2 where mpnfac = 639393;
select * from hosvital.maeate3 where mpnfac = 639393;

select mpnfac, sum(mpinte) mpinte,sum(mapvlrsiv) mpsiv, sum(mavatp)mavatp  , sum(mavatp -mapvlrsiv ) dif, sum(macanpr * mpinte) mul
  from hosvital.maeate2
where  mpnfac in (639393, 638795) and  fcptpotrn='F' and maesanup <>'S'
group by mpnfac;


select mpnfac, sum(maSvlrsiv) mpsiv, sum(mavatS)mavatp  , sum(mavatS -maSvlrsiv ) dif, sum(macanS * MAVALU) mul  -- 7131345.000000	+  16661158.00	
  from hosvital.maeate3
where  mpnfac in (639393, 638795) and  fcStpotrn='F' and maesanuS <>'S'
group by mpnfac;


select * From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 639393;





SELECT MVCNAT, SUM(MVCVLR)
 From hosvital.movcont2
 where doccod='FAR' AND MVCNRO = 639393
GROUP BY MVCNAT ;


/*
C	23751199.00	
D	23792503.00	-- 23792503 DIF 41304


*/

select * from hosvital.maeate2 where mpnfac = 638795 ; -- AND MAVATP = 41304;
select * from hosvital.maeate3 where mpnfac = 639393  AND  macscs = 1;
select * from hosvital.maeate3 where mpnfac = 639393  AND  msreso ='0009J05A';
select * from hosvital.maeate3 where mpnfac = 639393  AND  msreso ='0001MQ02';


SELECT MVCNRO, MVCDET, SUBSTRING(MVCDET,12,15)  From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 639393 AND MVCNAT='C' AND MVCDET LIKE ('%Suminist%'); 
SELECT count(*)  From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 639393 AND MVCNAT='C' AND MVCDET LIKE ('%Suminist%');
SELECT *  From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 639393 AND MVCNAT='C' AND MVCDET LIKE ('%Suminist%');  --332

select m2.mvcnro,m2.mvccsc,m2.mvcdet,m2.mvcvlr, m3.msreso,m3.mavats,m3.macscs con_maeate3
from hosvital.movcont2 m2
inner join hosvital.maeate3 m3 on (m3.mpnfac = m2.mvcnro and m3.msreso = SUBSTRING(m2.MVCDET,12,15))
where m2.doccod='FAR' AND M2.MVCNRO=639393 AND M2.MVCNAT='C' AND  M2.MVCDET LIKE ('%Suminist%')
order by m3.mSRESO,M3.MACSCS; 






select MPNFAC , NUMBER(MVCDET)  From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 639393 AND MVCNAT='C'; 

select COUNT(*) From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 639393 AND MVCNAT='C';  -- 642 REGISTROS
-- Contra

select COUNT(*)
  from hosvital.maeate2
where  mpnfac in (639393) and  fcptpotrn='F' and maesanup <>'S'; -- 310	


select COUNT(*)
  from hosvital.maeate3
where  mpnfac in (639393) and  fcStpotrn='F' and maesanuS <>'S';  --332	

select * From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 639393 AND MVCVLR>=41303 and  MVCDET LIKE ('%Sum%') ORDER BY MVCVLR;

select mpnfac, sum(maSvlrsiv) mpsiv, sum(mavatS)mavatp  , sum(mavatS -maSvlrsiv ) dif, sum(macanS * MAVALU) mul  -- 7131345.000000	+  16661158.00	
  from hosvital.maeate3
where  mpnfac in (639393) and  fcStpotrn='F' and maesanuS <>'S'
group by mpnfac;

-----------------

SElect *  From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 639393  AND   MVCDET LIKE ('%Proce%')   and  SUBSTRING(MVCDET,15,6) ='890413' ;  -- 720539.00

UPDATE hosvital.movcont2
SET MVCVLRLC =25000, MVCVLR = 25000
 where doccod='FAR' AND MVCNRO = 639393  AND   MVCDET LIKE ('%Proce%')   and  SUBSTRING(MVCDET,15,6) ='890413'  AND MVCCSC=544;


SElect *  From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 639393  AND   MVCDET LIKE ('%Proce%')   and  SUBSTRING(MVCDET,15,6) ='938303' ;  -- 720539.00

UPDATE hosvital.movcont2
SET MVCVLRLC =8152, MVCVLR = 8152
 where doccod='FAR' AND MVCNRO = 639393  AND   MVCDET LIKE ('%Proce%')   and  SUBSTRING(MVCDET,15,6) ='938303'  AND MVCCSC IN (545,582);

SElect *  From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 638795  AND   MVCDET LIKE ('%Proce%')   and  SUBSTRING(MVCDET,15,6) ='903859'  ORDER BY MVCVLR;  -- 720539.00

UPDATE hosvital.movcont2
SET MVCVLRLC =5524, MVCVLR = 5524
 where doccod='FAR' AND MVCNRO = 638795  AND   MVCDET LIKE ('%Proce%')   and  SUBSTRING(MVCDET,15,6) ='903859'  AND MVCCSC IN (1403);

SELECT * FROM HOSVITAL.NIMOVCON1 WHERE DOCCOD='FAR' AND NIMCNRO=637528;
SELECT * FROM HOSVITAL.NIMOVCON2 WHERE DOCCOD='FAR' AND NIMCNRO=637528;

 AND NIMC2CSC =1403;

SELECT * FROM HOSVITAL.NIMOVCON1 WHERE DOCCOD='FAR' AND NIMCNRO=638795;
SELECT * FROM HOSVITAL.NIMOVCON2 WHERE DOCCOD='FAR' AND NIMCNRO=639393 AND NIMC2CSC IN (544);

UPDATE HOSVITAL.NIMOVCON2
SET NIMC2VL=5524,NIMC2VLR=5524
 WHERE DOCCOD='FAR' AND NIMCNRO=638795 AND NIMC2CSC =1403;


UPDATE HOSVITAL.NIMOVCON2
SET NIMC2VL=8152,NIMC2VLR=8152
 WHERE DOCCOD='FAR' AND NIMCNRO=639393 AND NIMC2CSC IN (545,582);


UPDATE HOSVITAL.NIMOVCON2
SET NIMC2VL=25000,NIMC2VLR=25000
 WHERE DOCCOD='FAR' AND NIMCNRO=639393 AND NIMC2CSC  =544;




  -- 720539.00
	
----------------
-- Factura No 639393

/*
Diferencias :
Factura NO 639393 Procedimientos 890413 Facturado =25000 Contabilizado = 0
		    938303 Facturado =16304  Contabilizado = 0

Factura NO 638795 Procedimiento 903859 Facturado 723644  Contabilizado : 720539


Suministros NO 639393 Procedimientos 890413 Factura =25000 Contab = 0
		   938303 Factura =16304  Contab = 0

Factura NO 638795 Procedimiento 903859 Factura 723644  Contab : 720539



*/

select m2.mvcnro,SUBSTRING(m2.MVCDET,12,10),sum(m2.mvcvlr)
from hosvital.movcont2 m2
where m2.doccod='FAR' AND M2.MVCNRO=638795  AND M2.MVCNAT='C' AND  M2.MVCDET LIKE ('%Sum%') 
group by m2.mvcnro,SUBSTRING(m2.MVCDET,12,10)
order by m2.mvcnro,SUBSTRING(m2.MVCDET,12,10); 

select m2.mvcnro,SUBSTRING(m2.MVCDET,12,10),sum(m2.mvcvlr)
from hosvital.movcont2 m2
where m2.doccod='FAR' AND M2.MVCNRO=638795  AND M2.MVCNAT='C' AND  M2.MVCDET LIKE ('%Sum%') 
group by m2.mvcnro,SUBSTRING(m2.MVCDET,12,10)
order by m2.mvcnro,SUBSTRING(m2.MVCDET,12,10); 


-- Sumatorias Facturacion

select SUM(MVCVLR) From hosvital.movcont2 where doccod='FAR' AND MVCNRO = 638795  AND   MVCDET LIKE ('%Proce%')   and  SUBSTRING(MVCDET,15,6) ='903859' ;  -- 720539.00
	
select mpnfac, sum(maPvlrsiv) mpsiv, sum(mavatP) mavatp   
  from hosvital.maeate2
where  mpnfac in (638795) and  fcPtpotrn='F' and maesanuP <>'S' AND PRCODI= '903859'
group by mpnfac;  -- 723644.0000	


-- Querys cruza Facturacion COn Contabilidad

select m2.mvcnro,m2.mvccsc,m2.mvcdet,m2.mvcvlr, m3.msreso,m3.mavats,m3.macscs con_maeate3
from hosvital.movcont2 m2
inner join hosvital.maeate3 m3 on (m3.mpnfac = m2.mvcnro and m3.msreso = SUBSTRING(m2.MVCDET,12,15))
where m2.doccod='FAR' AND M2.MVCNRO=638795 AND M2.MVCNAT='C' AND  M2.MVCDET LIKE ('%Suminist%')
order by m3.mSRESO,M3.MACSCS; 



select m2.mvcnro,m2.mvccsc,m2.mvcdet,m2.mvcvlr, m3.prcodi,m3.mavatp,m3.MACsCp con_maeate2
from hosvital.movcont2 m2
inner join hosvital.maeate2 m3 on (m3.mpnfac = m2.mvcnro and m3.PRCODI = SUBSTRING(m2.MVCDET,15,6))
where m2.doccod='FAR' AND M2.MVCNRO=638795 AND M2.MVCNAT='C' AND  M2.MVCDET LIKE ('%Proced%') 
order by m3.PRCODI,M3.MACsCp; 
