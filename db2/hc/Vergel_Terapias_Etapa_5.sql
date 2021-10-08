select distinct year(m2.mafepr),  month(m2.mafepr) , m.mpnomp,maemed1.mmnomm,mae.prnomb,
(
select count(*) 
from hosvital.hccom51 h51 inner join hosvital.hccom1 h1 on (h1.histipdoc=h51.histipdoc and h1.hisckey=h51.hisckey and h1.hiscsec=h51.hiscsec) 
inner join hosvital.maepro mae on (mae.prcodi=h51.hcprccod)
inner join hosvital.ingresos i on (i.mptdoc=h51.histipdoc and i.mpcedu=h51.hisckey and i.ingcsc=h51.hctvin51)
left join hosvital.maemed1 maem1 on (maem1.mmusuario=h51.rprusrrgs) 
where year(h51.hcfchrord)=year(m2.mafepr) and month(h51.hcfchrord) =month(m2.mafepr)  and maem1.mmcodm= m2.mmcodm  and  h51.hcprccod = m2.prcodi  and (h1.histipdoc, h1.hisckey,h1.hctvin1) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1) 
and i.ingcodpeg=m2.macodpab
) as ordenado,
(select sum(tm2.macanpr) 
from hosvital.maeate2 tm2 
inner join hosvital.maeate tmaeate on (tmaeate.mpnfac = tm2.mpnfac) 
inner join hosvital.maepab tm on (tm.mpcodp = tm2.macodpab) 
inner join hosvital.maemed1 tmaemed1 on (tmaemed1.mmcodm = tm2.mmcodm) 
inner join hosvital.maepro tmae on (tmae.prcodi = tm2.prcodi) 
where year(tm2.mafepr) = year(m2.mafepr) and month(tm2.mafepr) =month(m2.mafepr)  and tmaemed1.mmcodm= m2.mmcodm  and  tm2.prcodi = m2.prcodi  and (tmaeate.mptdoc, tmaeate.mpcedu,tmaeate.mactving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1)   and tm2.fcptpotrn='F' and  tm2.maesanup <>'S'  AND tm2.macodpab = m2.macodpab
) as Qantidad_facturado,
(select count(*) 
from hosvital.hccom51 h51 
inner join hosvital.hccom1 h1 on (h1.histipdoc=h51.histipdoc and h1.hisckey=h51.hisckey and h1.hiscsec=h51.hiscsec) 
inner join hosvital.maepro mae on (mae.prcodi=h51.hcprccod) 
inner join hosvital.ingresos i on (i.mptdoc=h51.histipdoc and i.mpcedu=h51.hisckey and i.ingcsc=h51.hctvin51)
left join hosvital.maemed1 maem1 on (maem1.mmusuario=h51.rprusrrgs)
where year(h51.hcfchrord)=year(m2.mafepr) and month(h51.hcfchrord) =month(m2.mafepr)  and maem1.mmcodm= m2.mmcodm  and h51.hcprcest in('A','I') and  h51.hcprccod = m2.prcodi  and (h1.histipdoc, h1.hisckey,h1.hctvin1) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1)   and i.ingcodpeg=m2.macodpab
) as aplicado,
(select count(*) from hosvital.hccom51 h51 
inner join hosvital.hccom1 h1 on (h1.histipdoc=h51.histipdoc and h1.hisckey=h51.hisckey and h1.hiscsec=h51.hiscsec)
inner join hosvital.maepro mae on (mae.prcodi=h51.hcprccod)
inner join hosvital.ingresos i on (i.mptdoc=h51.histipdoc and i.mpcedu=h51.hisckey and i.ingcsc=h51.hctvin51)
 left join hosvital.maemed1 maem1 on (maem1.mmusuario=h51.rprusrrgs) 
where year(h51.hcfchrord) = year(m2.mafepr) and month(h51.hcfchrord) =month(m2.mafepr)  and maem1.mmcodm= m2.mmcodm  and h51.hcprcest='N' and  h51.hcprccod = m2.prcodi  and (h1.histipdoc, h1.hisckey,h1.hctvin1) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1)   and i.ingcodpeg=m2.macodpab
) as No_realizado
 from hosvital.maeate2 m2
 inner join hosvital.maeate maeate on (maeate.mpnfac = m2.mpnfac)
 inner join hosvital.maepab m on (m.mpcodp = m2.macodpab)
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm = m2.mmcodm) 
inner join hosvital.maepro mae on (mae.prcodi = m2.prcodi)
where m2.mafepr >= '2019-12-01 00:00:00' and m2.mafepr<='2020-02-28 23:59:59' and m2.prcodi in ('931001','939403','933601','890610','937000','937201','937202','937203','893703','893805','903839','903062','903110','893812','938303', '939402','939401','890410','890411','890413','890412') and (maeate.mptdoc, maeate.mpcedu,maeate.mactving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1)   and maemed1.mmcodm='FT085' AND M2.PRCODI='939403'

order by year(m2.mafepr),month(m2.mafepr) , m.mpnomp,maemed1.mmnomm;


select * from hosvital.maemed1 where  mmcodm='MG01';

SELECT * FROM HOSVITAL.HCCOM51;
SELECT * FROM HOSVITAL.HCCOM5;

SELECT MPNFAC,PRCODI,MACODPAB, MAFEPR,  MACANPR
 FROM HOSVITAL.MAEATE2 WHERE MAFEPR >= '2020-02-01 00:00:00' and mafepr<='2020-02-28 23:59:59'  AND mmcodm='MG01' AND prcodi in ('931001','939403','933601','890610','937000','937201','937202','937203','893703','893805','903839','903062','903110','893812','938303', '939402','939401','890410','890411','890413','890412')
ORDER BY  ;

SELECT * FROM HOSVITAL.MAEPAB ORDER BY MPCODP;

-- FT085

select * from hosvital.maemed1 where  mmcodm='FT085';  -- GCZIZAY   	

SELECT * FROM HOSVITAL.INGRESOS;


SELECT YEAR(HCFCHRAP), MONTH(HCFCHRAP) ,HCPRCCOD,HCPRCEST,count(HCPRCCNS)
 FROM HOSVITAL.HCCOM51 
WHERE HCFCHRAP  >= '2019-12-01 00:00:00' and HCFCHRAP<='2020-02-28 23:59:59'  AND RPRUSRRGS = 'GCZIZAY' 
AND  HCPRCCOD  in ('931001','939403','933601','890610','937000','937201','937202','937203','893703','893805','903839','903062','903110','893812','938303', '939402','939401','890410','890411','890413','890412')
GROUP BY  YEAR(HCFCHRAP), MONTH(HCFCHRAP) ,HCPRCCOD,HCPRCEST

ORDER BY   YEAR(HCFCHRAP), MONTH(HCFCHRAP) ,HCPRCCOD,HCPRCEST
;

select ingfecadm,ingcodpeg from hosvital.ingresos where ingfecadm>= '2019-01-01 00:00:00';


SELECT sum( MACANPR)
 FROM HOSVITAL.MAEATE2 WHERE MAFEPR >= '2020-01-01 00:00:00' and mafepr<='2020-01-31 23:59:59'  AND mmcodm='FT085' 
 AND   fcptpotrn='F' and  maesanup <>'S'  AND PRCODI= '939403';


SELECT YEAR(HCFCHRAP), MONTH(HCFCHRAP) ,HCPRCCOD,HCPRCEST,count(HCPRCCNS)
 FROM HOSVITAL.HCCOM51 
WHERE HCFCHRAP  >= '2020-01-01 00:00:00' and HCFCHRAP<='2020-01-31 23:59:59'  AND RPRUSRRGS = 'GCZIZAY' 
AND  HCPRCCOD  in ('939403')
GROUP BY  YEAR(HCFCHRAP), MONTH(HCFCHRAP) ,HCPRCCOD,HCPRCEST

ORDER BY   YEAR(HCFCHRAP), MONTH(HCFCHRAP) ,HCPRCCOD,HCPRCEST
;

