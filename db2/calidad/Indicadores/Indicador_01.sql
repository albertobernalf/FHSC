-- P.-2.6
-- Sumatoria de días de estancia de los pacientes en los servicios de hospitalización en el periodo.

select  year(i.ingfecadm), month(i.ingfecadm), case when i.clapro =1 then 'AMBULATORIO'  when i.clapro =2 then 'HOSPITALIZADO' when i.clapro =3 then 'URGENCIAS' END SERVICIO,
          sum(i.ingfecegr - i.ingfecadm) total_dias
from hosvital.ingresos i
where i.ingfecadm >= '2021-01-01 00:00:00' and i.ingfecadm <= '2021-12-31 23:59:59' and i.clapro=1
group by  year(i.ingfecadm), month(i.ingfecadm),clapro;

-- P.2.7
--Total de personas atendidas en urgencias en el periodo
select * from hosvital.ingresos;

select  year(i.ingfecadm), month(i.ingfecadm), case when i.clapro =1 then 'AMBULATORIO'  when i.clapro =2 then 'HOSPITALIZADO' when i.clapro =3 then 'URGENCIAS' END SERVICIO,
          count(*) total
from hosvital.ingresos i
where i.ingfecadm >= '2021-01-01 00:00:00' and i.ingfecadm <= '2021-12-31 23:59:59' and i.clapro=3
group by  year(i.ingfecadm), month(i.ingfecadm),clapro;


-- P.2.8
-- Total de personas atendidas en consulta externa
select  year(i.ingfecadm), month(i.ingfecadm), case when i.clapro =1 then 'AMBULATORIO'  when i.clapro =2 then 'HOSPITALIZADO' when i.clapro =3 then 'URGENCIAS' END SERVICIO,
          count(*) total
from hosvital.ingresos i
where i.ingfecadm >= '2021-01-01 00:00:00' and i.ingfecadm <= '2021-12-31 23:59:59' and i.clapro=1
group by  year(i.ingfecadm), month(i.ingfecadm),clapro;

-- P.2.9
--Total de personas atendidas en el servicio de apoyo diagnóstico y complementación terapéutica.

select * from hosvital.hccom51  where hcfchrord>= '2021-01-01 00:00:00' and hcfchrord>= '2021-10-02 23:59:59' and hisckey ='1000625173';

select  year(i.ingfecadm), month(i.ingfecadm),count(*)
from hosvital.ingresos i
where  i.ingfecadm >= '2021-01-01 00:00:00' and i.ingfecadm <= '2021-12-31 23:59:59' and (i.mptdoc,i.mpcedu) in (select h5.histipdoc, h5.hisckey from hosvital.hccom5 h5 where h5.hcprctip='1')
group by  year(i.ingfecadm), month(i.ingfecadm);


-- P.2.10 
-- Total de egresos de hospitalización.

select  year(i.ingfecegr), month(i.ingfecegr), case when i.clapro =1 then 'AMBULATORIO'  when i.clapro =2 then 'HOSPITALIZADO' when i.clapro =3 then 'URGENCIAS' END SERVICIO,count(*) total
from hosvital.ingresos i
where i.ingfecegr >= '2021-01-01 00:00:00' and i.ingfecegr <= '2021-12-31 23:59:59' and i.clapro=1
group by  year(i.ingfecegr), month(i.ingfecegr),clapro;

-- P.2.11
-- Total de personas atendidas en urgencias.

-- es igual a la P.2.7


-- P.2.12
-- Sumatoria de días de estancia de los pacientes en los servicios de hospitalización

-- es igual a la P.2.6

-- P.2.13
-- Número de pacientes que reingresan al servicio de urgencias en la misma institución antes de 72 horas con el mismo diagnóstico de egreso




-- P.2.13
-- Número total de egresos vivos atendidos en el servicio de urgencias durante el periodo definido

select  year(i.ingfecegr), month(i.ingfecegr), case when i.clapro =1 then 'AMBULATORIO'  when i.clapro =2 then 'HOSPITALIZADO' when i.clapro =3 then 'URGENCIAS' END SERVICIO,count(*) total
from hosvital.ingresos i
where i.ingfecegr >= '2021-01-01 00:00:00' and i.ingfecegr <= '2021-12-31 23:59:59' and i.clapro=2 and i.ingfchm = '0001-01-01 00:00:00.000000' and i.clapro=2
group by  year(i.ingfecegr), month(i.ingfecegr), i.clapro;


-- P.2.14
-- Número de pacientes que reingresan al servicio de hospitalización, en la misma institución,antes de 15 días, por el mismo diagnóstico de egreso en el período.

select
from hosvital.ingresos i
where i.ingfecegr >= '2021-01-01 00:00:00' and i.ingfecegr <= '2021-12-31 23:59:59' and i.clapro=1




-- P.2.14
-- Número total de egresos vivos atendidos en el servicio de hospitalización en el periodo

select  year(i.ingfecegr), month(i.ingfecegr), case when i.clapro =1 then 'AMBULATORIO'  when i.clapro =2 then 'HOSPITALIZADO' when i.clapro =3 then 'URGENCIAS' END SERVICIO,count(*) total
from hosvital.ingresos i
where i.ingfecegr >= '2021-01-01 00:00:00' and i.ingfecegr <= '2021-12-31 23:59:59' and i.clapro=1 and i.ingfchm = '0001-01-01 00:00:00.000000' and i.clapro=1
group by  year(i.ingfecegr), month(i.ingfecegr), i.clapro;


-- P.2.15
-- Número total de cirugías programadas que fueron canceladas por causas atribuibles a la institución


select year(p.profec), month(p.profec), proesta, count(*)
from hosvital.procir p
where p.profec >='2021-01-01' and p.profec <='2021-12-31'  and proesta = '3' and p.Promtcntp= '3' 
group by  year(p.profec), month(p.profec), proesta;

-- P.2.15
-- Número total de cirugías programadas

select * from hosvital.procir;

select year(p.profec), month(p.profec), proesta, count(*)
from hosvital.procir p
where p.profec >='2021-01-01' and p.profec <='2021-12-31' 
group by  year(p.profec), month(p.profec), proesta;

-- P.3.7
-- Sumatoria de la diferencia de días calendario entre la fecha en la que se asignó la cita de Cirugía General de primera vez y la fecha en la cual el usuario la solici


SELECT year(c.citfec), month(c.citfec), sum(days(c.citfec) - days(c1.citfecsol)) diferencia
from hosvital.citmed c
inner join hosvital.citmed1 c1 on (c1.citnum= c.citnum)
inner join hosvital.citmed2 c2 on (c2.citnum= c1.citnum and c2.mecode=137)
where c.citfec>= '2021-01-01' and c.citfec <= '2021-12-31'  
group by  year(c.citfec), month(c.citfec);

-- P.3.7
-- Número total de citas de Cirugía General de primera vez asignadas


select * from hosvital.maeesp where menome like ('%CIRUGIA%GE%');;  -- 137

SELECT year(citfecme), month(citfecme), count(*)
from hosvital.citmed2 
where citfecme>= '2021-01-01' and citfecme<= '2021-12-31' and mecode=137
group by year(citfecme), month(citfecme);

-- P.3.8
-- Sumatoria de la diferencia de días calendario entre la fecha en la que se realiza la toma de la Ecografía y la fecha en la que se solicita

-- P.3.8
-- Número total de Ecografías realizadas


select year(h51.hcfchrord), month(h51.hcfchrord), count(*)
from hosvital.hccom51 h51
inner join hosvital.maepro m on (m.prcodi=h51.hcprccod and m.prnomb like ('%ECOGRA%'))
where h51.hcfchrord >=  '2021-01-01 00:00:00' and h51.hcfchrord <=  '2021-12-31 23:59:59'
group by year(h51.hcfchrord), month(h51.hcfchrord);

-- P.3.9
-- Sumatoria del número de minutos transcurridos a partir de que el paciente es clasificado como Triage 2 y el momento en el cual es atendido en consulta de Urgencias por médico.

-- ya esta en P.3.10

-- P.3.9
-- Número total de Resonancia Magnética Nuclear realizadas

select year(h51.hcfchrord), month(h51.hcfchrord), count(*)
from hosvital.hccom51 h51
inner join hosvital.maepro m on (m.prcodi=h51.hcprccod and m.prnomb like ('%RESO%MAG%'))
where h51.hcfchrord >=  '2021-01-01 00:00:00' and h51.hcfchrord <=  '2021-12-31 23:59:59'
group by year(h51.hcfchrord), month(h51.hcfchrord);

-- P.3.10
-- Sumatoria del número de minutos transcurridos a partir de que el paciente es clasificado como Triage 2 y el momento en el cual es atendido en consulta de Urgencias por médico.


select year(h.hisfhorat), month(h.hisfhorat), sum(minute(h1.hisfhorat) - minute(h.hisfhorat)) minutos
from hosvital.hccom1 h,  hosvital.hccom1 h1
where h.hisfhorat >= '2021-01-01 00:00:00' and h.hisfhorat  <= '2021-12-31 23:59:59' and h.fhcindesp ='TR' and  h1.fhcindesp= 'GN' and h.histipdoc = h1.histipdoc and h.hisckey = h1.hisckey and h.hctvin1 = h1.hctvin1 and
           h1.hisfhorat = (select min(h3.hisfhorat) from hosvital.hccom1 h3 where h3.histipdoc=h.histipdoc and h3.hisckey = h.hisckey and h3.hctvin1= h.hctvin1 and h3.fhcindesp= 'GN')
group by year(h.hisfhorat), month(h.hisfhorat);

-- P.3.10
-- Número total de pacientes clasificados como Triage 2, en un periodo determinado

select year(i.ingfecadm), month(i.ingfecadm), count(*)
from hosvital.ingresos i
where i.ingfecadm >= '2021-01-01 00:00:00' and i.ingfecadm <= '2021-12-31 23:59:59' and (i.mptdoc,i.mpcedu, i.ingcsc) in (select h.histipdoc, h.hisckey, h.hctvin1 from hosvital.hccom1 h where h.histipdoc=i.mptdoc and h.hisckey = i.mpcedu and h.hctvin1 =  i.ingcsc and h.hiscltr=2)
group by year(i.ingfecadm), month(i.ingfecadm);






