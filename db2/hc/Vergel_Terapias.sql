select * from hosvital.maeate2;

select * from hosvital.hccom5;
select * from hosvital.hccom51 where hcfchrord >='2019-02-01 00:00:00' order by hisckey,hiscsec,hcprccod;

select * from hosvital.hccom51 where  hisckey='PAK525849' and hiscsec = 4 and hcprccod='893812';

select * from hosvital.maemed1;

select * from hosvital.hccom1 where hisfhorat >='2020-02-01 00:00:00';


select * from hosvital.reisldhsp;

select year(h51.hcfchrord ),month(h51.hcfchrord ),h51.hcprccod,mae.prnomb,maemed1.mmnomm,
case when h51.hcprcest ='O'  then 'Ordenado'
	when h51.hcprcest ='N'  then 'Anulado'
	when h51.hcprcest ='E'  then 'En tramite'
	when h51.hcprcest ='A'  then 'Aplicado'
	when h51.hcprcest ='X'  then 'ResultadopExterno'
	when h51.hcprcest ='I'  then 'Interpretado' end, i.ingcodpab, i.ingcsc,count(*)
from hosvital.hccom51 h51
inner join hosvital.hccom1 h1 on (h1.histipdoc= h51.histipdoc and h1.hisckey=h51.hisckey and h1.hiscsec=h51.hiscsec )
inner join hosvital.maepro mae on (mae.prcodi=h51.hcprccod)
inner  join hosvital.maemed1 maemed1 on (maemed1.mmusuario = h51.rprusrrgs)
inner join hosvital.ingresomp i on (i.mptdoc =h51.histipdoc and i.mpcedu=h51.hisckey and i.ingcsc = h51.hctvin51   and  i.clapro <> 1)
where h51.hcfchrord >='2019-01-01 00:00:00'  and h51.hcfchrord <='2020-02-28 00:00:00' and h51.hcprccod in ('931001','939403','933601','890610','937000','937201','937202','937203','893703','893805','903839','903062','903110','893812','938303','939402','939401','890410','890411','890413','890412')
and (i.mptdoc,i.mpcedu,i.ingcsc) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro = 1) 
and h51.hisckey in ('1000000332')
 group by year(h51.hcfchrord ),month(h51.hcfchrord ),h51.hcprccod,mae.prnomb,maemed1.mmnomm,h51.hcprcest, i.ingcodpab, i.ingcsc
order by  year(h51.hcfchrord ),month(h51.hcfchrord ),h51.hcprccod,mae.prnomb,maemed1.mmnomm,h51.hcprcest,i.ingcodpab, i.ingcsc;


--O Ordenado N Anulado E En Tramite A Aplicado X Resultado Externo I Interpretado 

select * from hosvital.ingresomp where mpcedu = '1000000332' order by ingcsc;
select * from hosvital.ingresos where mpcedu = '1000000332' order by ingcsc;

select hisckey,hiscsec,hcmeddis,rprusrrgs from hosvital.hccom51 where hisckey='1000000332' order by hcfchrord;   -- hcmeddis

select * from hosvital.hccom1 where  hisckey='1000000332'  and hiscsec = 149;  -- MG768	

select * from hosvital.hccom51 where  hisckey='1000000332'  and hiscsec = 149;

select * from hosvital.ingresomp where ingfecmop >= '2019-12-01 00:00:00' order by  mpcedu,ingcsc,ingfecmop;



select distinct(clapro), count(*) from hosvital.ingresos group by clapro  ;

-- 1000062120     	
--1000064484     	
--1000065348     	

---
----
--- Otra voz . Hasta aquip esta bien


select year(h51.hcfchrord ),month(h51.hcfchrord ),h51.hcprccod,mae.prnomb,maemed1.mmnomm,
case when h51.hcprcest ='O'  then 'Ordenado'
	when h51.hcprcest ='N'  then 'Anulado'
	when h51.hcprcest ='E'  then 'En tramite'
	when h51.hcprcest ='A'  then 'Aplicado'
	when h51.hcprcest ='X'  then 'ResultadopExterno'
	when h51.hcprcest ='I'  then 'Interpretado' end ,i.ingcodpab,I.INGCSC
, count(*)
from hosvital.hccom51 h51
inner join hosvital.hccom1 h1 on (h1.histipdoc= h51.histipdoc and h1.hisckey=h51.hisckey and h1.hiscsec=h51.hiscsec )
inner join hosvital.maepro mae on (mae.prcodi=h51.hcprccod)
left  join hosvital.maemed1 maemed1 on (maemed1.mmusuario = h51.rprusrrgs)
inner join hosvital.ingresomp i on (i.mptdoc =h51.histipdoc and i.mpcedu=h51.hisckey and i.ingcsc = h51.hctvin51   and  i.clapro <> 1)
where h51.hcfchrord >='2019-01-01 00:00:00'  and h51.hcfchrord <='2020-02-28 00:00:00' and h51.hcprccod in ('931001','939403','933601','890610','937000','937201','937202','937203','893703','893805','903839','903062','903110','893812','938303','939402','939401','890410','890411','890413','890412')
and (h1.histipdoc, h1.hisckey,h1.hctvin1) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro = 1) 
  and h51.hisckey in ('1000000332')  AND H51.HCFCHRAP BETWEEN i.ingfecmop and ingfecmoe
 group by year(h51.hcfchrord ),month(h51.hcfchrord ),h51.hcprccod,mae.prnomb,maemed1.mmnomm ,h51.hcprcest ,i.ingcodpab,I.INGCSC
order by  year(h51.hcfchrord ),month(h51.hcfchrord ),h51.hcprccod,mae.prnomb,maemed1.mmnomm, h51.hcprcest ,i.ingcodpab,I.INGCSC;

select * from hosvital.hccom1 where  hisckey='1000062120'  and hiscsec = 149;  -- MG768	

select * from hosvital.hccom51 where  hisckey='1000000332'  and hctvin51=1 order by HCPRCCOD;  -- and hiscsec = 149;

select * from hosvital.ingresomp where mpcedu= '1000000332';
select * from hosvital.ingresos where mpcedu= '1000000332';

select hcprccod,hcprcest,count(*)
 from hosvital.hccom51 where  hisckey='1000062120'  
group by hcprccod,hcprcest;  

/*
873313   	E	1	
873420   	E	1	
893812   	A	3	
931001   	N	1	
931001   	A	2	
883522   	A	1
2019	12	893812   	REGISTRO DE OXIMETRIA CUTANEA                                                                                                                                                                                                                   	JUAN FELIPE QUINTERO SERNA              	Aplicado	2	
2019	12	893812   	REGISTRO DE OXIMETRIA CUTANEA                                                                                                                                                                                                                   	PAOLA ALEJANDRA MARTIN                  	Aplicado	1	
2019	12	931001   	TERAPIA FISICA INTEGRAL SOD                                                                                                                                                                                                                     	ANDREA  CASTRO SANCHEZ                  	Aplicado	1	
2019	12	931001   	TERAPIA FISICA INTEGRAL SOD                                                                                                                                                                                                                     	ANDREA  CASTRO SANCHEZ                  	Anulado	1	
2019	12	931001   	TERAPIA FISICA INTEGRAL SOD                                                                                                                                                                                                                     	MAYERLY ANDREA GONZALEZ PARRADO         	Aplicado	1	

	
*/



-- Consulta Final


select year(h51.hcfchrord) as ano,month(h51.hcfchrord ) as mes,h51.hcprccod proc,mae.prnomb as nombre_procedimiento,maemed1.mmnomm as medico, case when h51.hcprcest='O' then 'Ordenado' when h51.hcprcest='N' then 'Anulado' when h51.hcprcest='E' then 'En tramite' when h51.hcprcest='A' then 'Aplicado' when h51.hcprcest='X' then 'ResultadopExterno' when h51.hcprcest='I' then 'Interpretado' end as estado ,count(*) as total from hosvital.hccom51 h51 inner join hosvital.hccom1 h1 on (h1.histipdoc=h51.histipdoc and h1.hisckey=h51.hisckey and h1.hiscsec=h51.hiscsec) inner join hosvital.maepro mae on (mae.prcodi=h51.hcprccod) left join hosvital.maemed1 maemed1 on (maemed1.mmusuario=h51.rprusrrgs) where h51.hcfchrord>='2019-01-01 00:00:00' and h51.hcfchrord<='2020-02-05 23:59:59' and h51.hcprccod in ('931001','939403','933601','890610','937000','937201','937202','937203','893703','893805','903839','903062','903110','893812','938303', '939402','939401','890410','890411','890413','890412') and (h1.histipdoc, h1.hisckey,h1.hctvin1) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1)    and h51.hisckey in ('1000000332')
group by year(h51.hcfchrord ),month (h51.hcfchrord),h51.hcprccod,mae.prnomb,maemed1.mmnomm ,h51.hcprcest order by year(h51.hcfchrord ),month(h51.hcfchrord ),h51.hcprccod,mae.prnomb,maemed1.mmnomm,h51.hcprcest;


SELECT HISCKEY,hcprccod, RPRUSRRGS,HCPRCEST, HCTVIN51,COUNT(*)
 FROM HOSVITAL.HCCOM51
WHERE hcfchrord>= '2019-04-01 00:00:00'AND hcfchrord <= '2019-04-30 23:59:59' AND  HCPRCCOD='893805'
GROUP BY   HISCKEY,hcprccod, RPRUSRRGS,HCPRCEST,HCTVIN51 ORDER BY HISCKEY;

SELECT *FROM HOSVITAL.INGRESOS WHERE MPCEDU IN ('19063716','19219463',    '19225702', '24285644'       	);


--Nueva Consulta con lom facturado 

select * from hosvital.maeate2; -- prcodi,mafepr,macodpab,mmcodm,macanpr



select year(m2.mafepr),month(m2.mafepr) , m.mpnomp,maemed1.mmnomm, sum(m2.macanpr) as total_facturado

from hosvital.maeate2 m2
inner join hosvital.maeate maeate on (maeate.mpnfac = m2.mpnfac)
inner join hosvital.maepab m on (m.mpcodp = m2.macodpab)
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm = m2.mmcodm)
inner join hosvital.maepro mae on (mae.prcodi = m2.prcodi)
where m2.mafepr >= '2019-01-01 00:00:00' and m2.mafepr<='2020-02-05 23:59:59' and m2.prcodi in ('931001','939403','933601','890610','937000','937201','937202','937203','893703','893805','903839','903062','903110','893812','938303', '939402','939401','890410','890411','890413','890412') and (maeate.mptdoc, maeate.mpcedu,maeate.mactving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1)    and maeate.mpcedu in ('1000000332')
group by  year(m2.mafepr),month(m2.mafepr) , m.mpnomp,maemed1.mmnomm
order by year(m2.mafepr),month(m2.mafepr) , m.mpnomp,maemed1.mmnomm;

select * from hosvital.maeate2;


select distinct year(m2.mafepr),  month(m2.mafepr) , m.mpnomp,maemed1.mmnomm,mae.prnomb,
(select sum(tm2.macanpr)
from hosvital.maeate2 tm2
inner join hosvital.maeate tmaeate on (tmaeate.mpnfac = tm2.mpnfac)
inner join hosvital.maepab tm on (tm.mpcodp = tm2.macodpab)
inner join hosvital.maemed1 tmaemed1 on (tmaemed1.mmcodm = tm2.mmcodm)
inner join hosvital.maepro tmae on (tmae.prcodi = tm2.prcodi)
where year(tm2.mafepr) = year(m2.mafepr) and month(tm2.mafepr) =month(m2.mafepr)  and tmaemed1.mmcodm= m2.mmcodm  and  tm2.prcodi = m2.prcodi  and (tmaeate.mptdoc, tmaeate.mpcedu,tmaeate.mactving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1)   and tm2.fcptpotrn='F' and  tm2.maesanup <>'S'  -- and tmaeate.mpcedu in ('1000000332')
)  as Qantidad_facturado,
(
select count(*) 
from hosvital.hccom51 h51 
inner join hosvital.hccom1 h1 on (h1.histipdoc=h51.histipdoc and h1.hisckey=h51.hisckey and h1.hiscsec=h51.hiscsec) 
inner join hosvital.maepro mae on (mae.prcodi=h51.hcprccod) 
left join hosvital.maemed1 maem1 on (maem1.mmusuario=h51.rprusrrgs) 
where year(h51.hcfchrord) = year(m2.mafepr) and month(h51.hcfchrord) =month(m2.mafepr)  and maem1.mmcodm= m2.mmcodm  and h51.hcprcest='A' and  h51.hcprccod = m2.prcodi  and (h1.histipdoc, h1.hisckey,h1.hctvin1) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1)  --  and h51.hisckey in ('1000000332') 
)   as aplicado,
(
select count(*) 
from hosvital.hccom51 h51 
inner join hosvital.hccom1 h1 on (h1.histipdoc=h51.histipdoc and h1.hisckey=h51.hisckey and h1.hiscsec=h51.hiscsec) 
inner join hosvital.maepro mae on (mae.prcodi=h51.hcprccod) 
left join hosvital.maemed1 maem1 on (maem1.mmusuario=h51.rprusrrgs) 
where year(h51.hcfchrord) = year(m2.mafepr) and month(h51.hcfchrord) =month(m2.mafepr)  and maem1.mmcodm= m2.mmcodm  and h51.hcprcest='N' and  h51.hcprccod = m2.prcodi  and (h1.histipdoc, h1.hisckey,h1.hctvin1) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1)  --  and h51.hisckey in ('1000000332') 
)   as No_realizado
from hosvital.maeate2 m2
inner join hosvital.maeate maeate on (maeate.mpnfac = m2.mpnfac)
inner join hosvital.maepab m on (m.mpcodp = m2.macodpab)
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm = m2.mmcodm)
inner join hosvital.maepro mae on (mae.prcodi = m2.prcodi)
where m2.mafepr >= '2019-01-01 00:00:00' and m2.mafepr<='2020-02-05 23:59:59' and m2.prcodi in ('931001','939403','933601','890610','937000','937201','937202','937203','89AAbb**
3703','893805','903839','903062','903110','893812','938303', '939402','939401','890410','890411','890413','890412') and (maeate.mptdoc, maeate.mpcedu,maeate.mactving) not in (select mptdoc,mpcedu,ingcsc from hosvital.ingresos where clapro=1)   -- and maeate.mpcedu in ('1000000332')
order by year(m2.mafepr),month(m2.mafepr) , m.mpnomp,maemed1.mmnomm;





