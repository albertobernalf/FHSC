SELECT * FROM HOSVITAL.INGRESOS;
-- 1query
select year(ingfecadm)  ano , clapro,count(*) from hosvital.ingresos where ingfecadm >= '2020-01-01 00:00:00' and  ingfecadm <= '2021-05-31 23:59:59' and clapro in ('3','5')  group by year(ingfecadm),clapro; 

--2 query
select * from hosvital.hccom1;

select cap.mptdoc,cap.mpcedu,cap.mpnomc, i.ingfecadm, h1.hiscltr
from hosvital.ingresos i
inner join hosvital.hccom1 h1 on (h1.histipdoc = i.mptdoc and h1.hisckey=i.mpcedu and h1.hctvin1 = i.ingcsc and h1.fhcindesp='TR')
inner join hosvital.capbas cap on (cap.mptdoc = i.mptdoc and cap.mpcedu=i.mpcedu)
where i.ingfecadm >= '2020-01-01 00:00:00' and  i.ingfecadm >= '2021-01-01 00:00:00'
order by i.ingfecadm ;

--3 query
select * from hosvital.repexc1 where repcons like ('%INGRE%');;

-- 4 QUERY EGRESOS

select year(ingfecegr)  ano , clapro,count(*) from hosvital.ingresos where ingfecegr >= '2020-01-01 00:00:00' and  ingfecegr <= '2021-05-31 23:59:59'   group by year(ingfecegr),clapro; 

-- quinto query

select * from hosvital.maeate;

-- Facturados

select m.mpnfac,cap.mptdoc,cap.mpcedu,cap.mpnomc, i.ingfecadm, i.ingfecegr,mae.mpnomp as pabellon, (days(i.ingfecegr) - days(i.ingfecadm)) estancia
from hosvital.maeate m
inner join hosvital.ingresos  i on (i.mptdoc = m.mptdoc and i.mpcedu = m.mpcedu and i.ingcsc = m.mactving)
inner join hosvital.capbas cap on (cap.mptdoc = i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maepab mae on (mae.mpcodp = m.faccodpab)
where i.ingfecadm >= '2020-01-01' and  i.ingfecadm <= '2021-05-31' and m.mpclpr  in ('2') and m.mpnfac = (select max(m1.mpnfac) from hosvital.maeate m1 where m1.mptdoc=m.mptdoc and m1.mpcedu=m.mpcedu and m1.mactving=m.mactving)
order by i.ingfecadm ;


--Acostados


select cap.mptdoc,cap.mpcedu,cap.mpnomc, i.ingfecadm, i.ingfecegr,mae.mpnomp as pabellon, (days(i.ingfecegr) - days(i.ingfecadm)) estancia
from hosvital.tmpfac t
inner join hosvital.ingresos  i on (i.mptdoc = t.tftdoc and i.mpcedu = t.tfcedu and i.ingcsc = t.tmctving)
inner join hosvital.capbas cap on (cap.mptdoc = i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maepab mae on (mae.mpcodp = t.tfccodpab)
where  i.ingfecadm >= '2020-01-01 00:00:00' and  i.ingfecadm <= '2021-05-31 23:59:59' and t.clapro  in ('2') and i.inginslc='S'
order by i.ingfecadm ;

select *  from hosvital.tmpfac;

-- query unidos


select cap.mptdoc,cap.mpcedu,cap.mpnomc, i.ingfecadm, i.ingfecegr,mae.mpnomp as pabellon, (days(i.ingfecegr) - days(i.ingfecadm)) estancia
from hosvital.maeate m
inner join hosvital.ingresos  i on (i.mptdoc = m.mptdoc and i.mpcedu = m.mpcedu and i.ingcsc = m.mactving)
inner join hosvital.capbas cap on (cap.mptdoc = i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maepab mae on (mae.mpcodp = m.faccodpab)
where i.ingfecadm >= '2020-01-01 00:00:00' and  i.ingfecadm <= '2021-05-31 23:59:59' and m.mpclpr  in ('2') and m.mpnfac = (select max(m1.mpnfac) from hosvital.maeate m1 where m1.mptdoc=m.mptdoc and m1.mpcedu=m.mpcedu and m1.mactving=m.mactving)
union
select cap.mptdoc,cap.mpcedu,cap.mpnomc, i.ingfecadm, i.ingfecegr,mae.mpnomp as pabellon, (days(i.ingfecegr) - days(i.ingfecadm)) estancia
from hosvital.tmpfac t
inner join hosvital.ingresos  i on (i.mptdoc = t.tftdoc and i.mpcedu = t.tfcedu and i.ingcsc = t.tmctving)
inner join hosvital.capbas cap on (cap.mptdoc = i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.maepab mae on (mae.mpcodp = t.tfccodpab)
where  i.ingfecadm >= '2020-01-01 00:00:00' and  i.ingfecadm <= '2021-05-31 23:59:59' and t.clapro  in ('2') and i.inginslc='S'
order by 4 ;

-- Reingresos antes de 15 dias

select i.mptdoc,i.mpcedu,cap.mpnomc as paciente, i.ingcsc, i.ingfecadm,i.ingfecegr,
(select i3.ingfecadm from hosvital.ingresos i3 where i3.mptdoc=i.mptdoc and i3.mpcedu=i.mpcedu and  i3.ingcsc = (i.ingcsc - 1) ) ingreso_anterior_fecha
from hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu = i.mpcedu)
where i.ingfecadm >= '2020-01-01 00:00:00' and  i.ingfecadm <= '2021-05-31 23:59:59' and i.clapro  in ('2','3','5') and
          (i.mptdoc,i.mpcedu) in (select i2.mptdoc, i2.mpcedu from hosvital.ingresos i2 where i2.mptdoc=i.mptdoc and i2.mpcedu=i.mpcedu and days(i2.ingfecadm )  <= (days(i.ingfecegr) +15) and  i2.ingcsc  <  i.ingcsc   and i2.clapro  in ('2','3','5')) --and i.mpcedu='1000212823'
order by i.mpcedu,i.ingcsc;

select * from hosvital.ingresos where mpcedu ='1000001776' order by ingfecadm;

-- Otra voz

select i.mptdoc,i.mpcedu,cap.mpnomc as paciente, i.ingcsc, i.ingfecadm,i.ingfecegr,
(select i3.ingfecadm from hosvital.ingresos i3 where i3.mptdoc=i.mptdoc and i3.mpcedu=i.mpcedu and  i3.ingcsc = (i.ingcsc - 1) ) ingreso_anterior_fecha
from hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu = i.mpcedu)
where i.ingfecadm >= '2020-01-01 00:00:00' and  i.ingfecadm <= '2021-05-31 23:59:59' and i.clapro  in ('2','3','5') and
          (days(i.ingfecadm)) <=  (select  (days(i2.ingfecegr) + 15)  from hosvital.ingresos i2 where i2.mptdoc=i.mptdoc and i2.mpcedu=i.mpcedu and  i2.clapro  in ('2','3','5') and i2.ingcsc =
			(select max(i4.ingcsc) from hosvital.ingresos i4 where i4.mptdoc=i.mptdoc and i4.mpcedu=i.mpcedu and i4.ingcsc< i.ingcsc)

)
order by i.mpcedu,i.ingcsc;