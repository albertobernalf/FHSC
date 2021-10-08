SELECT * FROM HOSVITAL.MAEEMP WHERE MENNIT='CS0111';

SELECT * FROM HOSVITAL.MAETPA3;

SELECT * FROM HOSVITAL.ADMGLO01;

SELECT * FROM HOSVITAL.MOVBAN WHERE DOCCOD='RNA';


SELECT SUBSTRING(M.MECNTR,1,9),MENOMB, M2.MTUDES,'2','NA',
(SELECT SUM(MOV.MVBVLR)
 FROM HOSVITAL.MOVBAN MOV
 WHERE  DOCCOD='RNA'AND MOV.MVBFCH>='2019-07-01 00:00:00' AND MOV.MVBFCH <='2019-07-31 23:59:59'  AND MOV.TRCCOD = SUBSTRING(M.MECNTR,1,9)) AS RNA,
(SELECT  SUM(ADM.AGLRADVR)
 FROM HOSVITAL.ADMGLO01 ADM
 WHERE SUBSTRING(ADM.EMPRNIT,1,9) = SUBSTRING(M.MECNTR,1,9) AND ADM.AGLRADFC>= '2019-07-01' AND ADM.AGLRADFC<= '2019-07-31'
) AS RADICADO
FROM HOSVITAL.MAEEMP M
INNER JOIN HOSVITAL.MAEEMP3 M3 ON (M3.MENNIT= M.MENNIT ) -- AND  M3.MTUCO1=
INNER JOIN HOSVITAL.MAETPA2 M2 ON ( M2.MTUCOD= M3.MTUCO1)
WHERE M.MENNIT  IN  ('CS0111' ,'SS0110');

SELECT * FROM HOSVITAL.MAEEMP WHERE MECNTR LIKE '900156264%';

SELECT * FROM HOSVITAL.ADMGLO11; where emprnit='SS0111';


-- ORTROQUERY


SELECT SUBSTRING(M.MECNTR,1,9),MENOMB, M2.MTUDES,'2','NA',
(SELECT SUM(MOV.MVBVLR)
 FROM HOSVITAL.MOVBAN MOV
 WHERE  DOCCOD='RNA'AND MOV.MVBFCH>='2019-07-01 00:00:00' AND MOV.MVBFCH <='2019-07-31 23:59:59'  AND MOV.TRCCOD = SUBSTRING(M.MECNTR,1,9)) AS RNA,
(SELECT  SUM(MAE.MATOTF)
 FROM HOSVITAL.ADMGLO01 ADM
   INNER JOIN HOSVITAL.ADMGLO11 ADM11 ON (ADM11.AGLREMNR = ADM.AGLREMNR)
  INNER JOIN HOSVITAL.MAEATE MAE ON (MAE.MPNFAC = ADM11.MPNFAC AND  MAE.MPMENI=M3.MENNIT AND MAE.MAESTF NOT IN ('1','10'))
 WHERE SUBSTRING(ADM.EMPRNIT,1,9) = SUBSTRING(M.MECNTR,1,9) AND ADM.AGLRADFC>= '2019-07-01' AND ADM.AGLRADFC<= '2019-07-31'
) AS RADICADO
FROM HOSVITAL.MAEEMP M
INNER JOIN HOSVITAL.MAEEMP3 M3 ON (M3.MENNIT= M.MENNIT ) -- AND  M3.MTUCO1=
INNER JOIN HOSVITAL.MAETPA2 M2 ON ( M2.MTUCOD= M3.MTUCO1)
WHERE m.mecntr = '900156264-2' ;  --M.MENNIT  IN  ('CS0111' ,'SS0110');

-- OROQWUERY

SELECT SUBSTRING(M.MECNTR,1,9),MENOMB,'NA',
(SELECT SUM(MOV.MVBVLR)
 FROM HOSVITAL.MOVBAN MOV
 WHERE  DOCCOD='RNA'AND MOV.MVBFCH>='2019-07-01 00:00:00' AND MOV.MVBFCH <='2019-07-31 23:59:59'  AND MOV.TRCCOD = SUBSTRING(M.MECNTR,1,9)) AS RNA,
(SELECT  SUM(ADM.AGLRADVR)
 FROM HOSVITAL.ADMGLO01 ADM
 WHERE SUBSTRING(ADM.EMPRNIT,1,9) = SUBSTRING(M.MECNTR,1,9) AND ADM.AGLRADFC>= '2019-07-01' AND ADM.AGLRADFC<= '2019-07-31'
) AS RADICADO
FROM HOSVITAL.MAEEMP M
INNER JOIN HOSVITAL.MAEEMP3 M3 ON (M3.MENNIT= M.MENNIT ) 
WHERE M.MENNIT  IN  ('CS0111' ,'SS0110');



-------------------------------------------
-----------------------------------------------

-- Query para saber que documentos RNA y DRC tiene asociada una factura


SELECT M.DOCCOD,M.MVBNROCMP, M.MVBFCH AS FECHA_RC,  CXC.DOCCOD  ,CXC.MVCXCNRO, CXC.MCCFCH AS FEC_DETALLE,CXC.CLICOD AS TERCERO, TER.TRCRAZSOC AS NOMBRE,M1.MVB1VL1 AS VALOR_RECIBO  ,CXC.MCCNUMOBL AS FACTURA,CXC.MCCVLR AS VALOR_FACTURA, CASE WHEN M.MVBDET='S' THEN 'Detallado'  WHEN M.MVBDET='N' THEN 'No Detallado' END AS ESTADO_DETALLE    , CASE WHEN M.MVBACT='S' THEN 'Registrado'  WHEN M.MVBACT='N' THEN 'No Registrado' END AS ESTADO
FROM  HOSVITAL.MOVBAN2 M2
LEFT  JOIN HOSVITAL.MOVBAN1 M1 ON (M2.DOCCOD=M1.DOCCOD AND M2.MVBNROCMP=M1.MVBNROCMP)
LEFT   JOIN HOSVITAL.MOVBAN M ON (M2.DOCCOD=M.DOCCOD AND M2.MVBNROCMP=M.MVBNROCMP)
RIGHT  JOIN HOSVITAL.MOVCXC CXC ON (M2.MVB2CD=CXC.DOCCOD  AND M2.MVB2CN=CXC.MVCXCNRO      )
LEFT JOIN HOSVITAL.TERCEROS TER ON (CXC.CLICOD = TER.TRCCOD )
WHERE  cxc.doccod='DRC' AND cxc.mccnumobl = '576854' 
ORDER  BY M2.MVBNROCMP ;


---------------------------------------------------
--------------------------------------------------------


---

----
SELECT * FROM HOSVITAL.MAEEMP WHERE mecntr = '900156264-2';
select * from hosvital.movban  where doccod='RNA' AND MVBNROCMP=6922;;
select * from hosvital.movban1 where doccod='RNA' AND MVBNROCMP=6922;;
select * from hosvital.movban2 where doccod='RNA' AND MVBNROCMP=6922;;

select * from hosvital.movcxc where doccod = 'RNA'; --  and mvcxcnro=6922;

select * from hosvital.movcont2 where doccod='RNA' AND MVCNRO=6922;

SELECT * FROM HOSVITAL.MOVCXC WHERE MCCNUMOBL='';
select * from hosvital.admglo01;
select * from hosvital.admglo11;

-- Detalle facturas de Nueva eps julio/2019

select adm11.mpnfac, mae.facfch fecha_fac,mae.mpmeni,mae.matotf, mae.maestf estado_fac, adm01.aglradfc as radica, adm11.aglfaces esado_radicacion
 from hosvital.admglo11 adm11
inner join hosvital.admglo01 adm01 on (adm01.aglremnr = adm11.aglremnr  )
inner join hosvital.maeate mae on (mae.matipdoc='2' and mae.mpnfac=adm11.mpnfac)
 where adm01.aglradfc >= '2019-07-01' and adm01.aglradfc <= '2019-07-31' and adm01.emprnit ='900156264-2' ;

-- Sumatria facturas x contratos de nueva eps

select mae.mpmeni, sum(mae.matotf) total
 from hosvital.admglo11 adm11
inner join hosvital.admglo01 adm01 on (adm01.aglremnr = adm11.aglremnr  )
inner join hosvital.maeate mae on (mae.matipdoc='2' and mae.mpnfac=adm11.mpnfac)
 where adm01.aglradfc >= '2019-07-01' and adm01.aglradfc <= '2019-07-31' and adm01.emprnit ='900156264-2' 
group by mae.mpmeni;

-- DRC de las facturas
-- Nota . No hay DRC asociados al oro contrato


select adm11.mpnfac, mae.facfch fecha_fac,mae.mpmeni,mae.matotf, mae.maestf estado_fac, adm01.aglradfc as radica, adm11.aglfaces esado_radicacion,mov.doccod,mov.mvcxcnro,mov.mccvlr as valor_drc
 from hosvital.admglo11 adm11
inner join hosvital.admglo01 adm01 on (adm01.aglremnr = adm11.aglremnr  )
inner join hosvital.maeate mae on (mae.matipdoc='2' and mae.mpnfac=adm11.mpnfac)
left join hosvital.movcxc mov on (mov.mccnumobl=cast (mae.mpnfac  as varchar(15)) and mov.doccod='DRC')
 where adm01.aglradfc >= '2019-07-01' and adm01.aglradfc <= '2019-07-31' and adm01.emprnit ='900156264-2' ;


-- DRC Sumatoria x Contratos
--Nota los drc no suman la cantidad de los rna

select mae.mpmeni, sum(mov.mccvlr) total_drc  -- CS0111       	1325239184.73	
 from hosvital.admglo11 adm11
inner join hosvital.admglo01 adm01 on (adm01.aglremnr = adm11.aglremnr  )
inner join hosvital.maeate mae on (mae.matipdoc='2' and mae.mpnfac=adm11.mpnfac)
inner join hosvital.movcxc mov on (mov.mccnumobl=cast (mae.mpnfac  as varchar(15)) and mov.doccod='DRC')
 where adm01.aglradfc >= '2019-07-01' and adm01.aglradfc <= '2019-07-31' and adm01.emprnit ='900156264-2' 
group by mae.mpmeni;

-- Regimen

/*

(select  sum(mov.mccvlr) 
 from hosvital.admglo11 adm11
inner join hosvital.admglo01 adm01 on (adm01.aglremnr = adm11.aglremnr  )
inner join hosvital.maeate mae on (mae.matipdoc='2' and mae.mpnfac=adm11.mpnfac)
inner join hosvital.movcxc mov on (mov.mccnumobl=cast (mae.mpnfac  as varchar(15)) and mov.doccod='DRC')
 where mae.mpmeni = m.mennit and adm01.aglradfc >= '2019-07-01' and adm01.aglradfc <= '2019-07-31' and adm01.emprnit ='900156264-2' 
) as sumatoria_drc,

( select maet.mtudes
from hosvital.MAETPA2 maet
inner join hosvital.maeemp3 maeemp3 on (maeemp3.mennit=m.mennit and maeemp3.mtuco1=maet.mtucod)
where maeemp3.mtcodp = (select max(y.mtcodp) from hosvital.maeemp3 y where y.mennit=maeemp3.mennit)
) as regimen,

*/

SELECT * FROM HOSVITAL.MAEEMP3 WHERE MENNIT IN  ('CS0111' ,'SS0110');
SELECT * FROM HOSVITAL.MAETPA2;

select * from hosvital.empress;


SELECT SUBSTRING(M.MECNTR,1,9), empre.empdsc empresa,m.MENOMB, case wheN m.meestado='0' then 'ACTIVO'  wheN m.meestado='1' then 'INACTIVO' END AS ESTADO_CONTRATO,
M.mennit,'2','NA',
(SELECT SUM(MOV.MVBVLR)
 FROM HOSVITAL.MOVBAN MOV
 WHERE  DOCCOD='RNA'AND MOV.MVBFCH>='2019-07-01 00:00:00' AND MOV.MVBFCH <='2019-07-31 23:59:59'  AND MOV.TRCCOD = SUBSTRING(M.MECNTR,1,9)) AS RNA,
(SELECT  SUM(MAE.MATOTF)
 FROM HOSVITAL.ADMGLO01 ADM
   INNER JOIN HOSVITAL.ADMGLO11 ADM11 ON (ADM11.AGLREMNR = ADM.AGLREMNR)
  INNER JOIN HOSVITAL.MAEATE MAE ON (MAE.MPNFAC = ADM11.MPNFAC AND  MAE.MPMENI=M.MENNIT AND MAE.MAESTF NOT IN ('1','10')) 

 WHERE SUBSTRING(ADM.EMPRNIT,1,9) = SUBSTRING(M.MECNTR,1,9) AND ADM.AGLRADFC>= '2019-07-01' AND ADM.AGLRADFC<= '2019-07-31'
) AS RADICADO
FROM HOSVITAL.MAEEMP M
inner join hosvital.empress empre on (empre.mecntr =m.mecntr)
order by m.mecntr, m.mennit;


select * from HOSVITAL.MOVBAN MOV;
select * from hosvital.empress;



SELECT substring(empre.mecntr,1, 9) ,empre.empdsc empresa,  SUM(MOV.MVBVLR)
 FROM HOSVITAL.MOVBAN MOV
inner join hosvital.empress empre on (substring(empre.mecntr,1,9) =mov.trccod)
 WHERE  DOCCOD='RNA'AND MOV.MVBFCH>='2019-07-01 00:00:00' AND MOV.MVBFCH <='2019-07-31 23:59:59' 
group by empre.mecntr,empre.empdsc 
order by empre.mecntr;