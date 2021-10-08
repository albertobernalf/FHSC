select m1.mmcodm,m1.mmnomm,c.mptdoc,c.mpcedu,c.mpnomc,h1.hctvin1,h1.hiscsec,h1.hisfhorat, i.ingcaue as casusa_externa,c1.cedetall as nombre_causa, mae.menomb as contrato from hosvital.hccom1 h1 inner join hosvital.ingresos i on (i.mptdoc =h1.histipdoc and i.mpcedu=h1.hisckey and i.ingcsc=h1.hctvin1) inner join hosvital.capbas c on (c.mptdoc=i.mptdoc and c.mpcedu= i.mpcedu) inner join hosvital.maemed1 m1 on (m1.mmcodm=h1.hiscmmed) inner join  hosvital.MAECAUE c1  on i.ingcaue=c1.cecodigo 
inner join hosvital.maeemp mae on (mae.mennit=h1.fhccodcto)
where i.ingfecadm>='2019-08-20 00:00:00' and  i.ingfecadm<='2019-08-20 23:59:59' and  (i.mptdoc,i.mpcedu,i.ingcsc)in (select x.histipdoc,x.hisckey,x.hctvin1 from hosvital.hccom1 x where x.hiscmmed=m1.mmcodm) order by m1.mmcodm;

-- Tipo de folio TR-EN-GE
-- fhccodcto

select * from hosvital.hccom1 where hisckey='23448573' and hisfhorat >= '2019-08-01 00:00:00';

-- medico,ced pac, nom paciene, fecha folio, nrofolio, tipo_folio ,fec ingreo, fecha sal delfolio, contrato

--

select h1.hiscmmed cod_med ,med.mmnomm as medico,cap.mptdoc tipo_doc,cap.mpcedu documento,h1.hiscsec folio, case when h1.fhcindesp='GN' then 'Medico' when h1.fhcindesp='EN' then 'Enfermeria' when h1.fhcindesp='TR' then 'Triage' end tipo_folio,
h1.hisfing as ingreso , h1.hisfsal as egreso,
case when (year(h1.hisfsal) + month(h1.hisfsal) ) < (year(h1.hisfing) + month(h1.hisfing) )    then (   1440 -    hour(h1.hisfing)*60 -  minute(h1.hisfing) +   (hour(h1.hisfsal)*60+ minute(h1.hisfsal))) 
                when (year(h1.hisfsal) + month(h1.hisfsal) ) = (year(h1.hisfing) + month(h1.hisfing)) and  day(h1.hisfsal) > day(h1.hisfing)     then (   1440 -    hour(h1.hisfing)*60 -  minute(h1.hisfing) +   (hour(h1.hisfsal)*60+ minute(h1.hisfsal))) 

               when (year(h1.hisfsal) + month(h1.hisfsal) ) > (year(h1.hisfing) + month(h1.hisfing) )    then (   1440 -    hour(h1.hisfing)*60 -  minute(h1.hisfing) +   (hour(h1.hisfsal)*60+ minute(h1.hisfsal))) 
      when (year(h1.hisfsal) + month(h1.hisfsal) ) = (year(h1.hisfing) + month(h1.hisfing) ) then  ((hour(h1.hisfsal)*60+ minute(h1.hisfsal)) -  hour(h1.hisfing)*60 - minute(h1.hisfing))
 else ''   end as tiempo_atencion

from hosvital.hccom1 h1
inner join hosvital.capbas cap on (cap.mptdoc=h1.histipdoc and cap.mpcedu=h1.hisckey)
inner join hosvital.maemed1 med on (med.mmcodm=h1.hiscmmed)
inner join hosvital.maeemp mae  on (mae.mennit= h1.fhccodcto)
where  h1.hisfhorat >= '2019-08-01 00:00:00' and h1.hisfhorat <= '2019-08-03 00:00:00';

--Query Acotado


select h1.hiscmmed cod_med ,med.mmnomm as medico,cap.mptdoc tipo_doc,cap.mpcedu documento,h1.hiscsec folio, case when h1.fhcindesp='GN' then 'Medico' when h1.fhcindesp='EN' then 'Enfermeria' when h1.fhcindesp='TR' then 'Triage' end tipo_folio,h1.hisfing as ingreso , h1.hisfsal as egreso,case when (year(h1.hisfsal) + month(h1.hisfsal) ) < (year(h1.hisfing) + month(h1.hisfing) )    then (   1440 -    hour(h1.hisfing)*60 -  minute(h1.hisfing)+ (hour(h1.hisfsal)*60+ minute(h1.hisfsal))) when (year(h1.hisfsal) + month(h1.hisfsal) ) = (year(h1.hisfing) + month(h1.hisfing)) and  day(h1.hisfsal) > day(h1.hisfing) then (1440 -hour(h1.hisfing)*60 -minute(h1.hisfing)+ (hour(h1.hisfsal)*60+ minute(h1.hisfsal))) when (year(h1.hisfsal) +  month(h1.hisfsal))>(year(h1.hisfing) + month(h1.hisfing))  then (1440 - hour(h1.hisfing)*60-minute(h1.hisfing)+ (hour(h1.hisfsal)*60+ minute(h1.hisfsal))) when (year(h1.hisfsal) + month(h1.hisfsal) ) = (year(h1.hisfing) + month(h1.hisfing) ) then  ((hour(h1.hisfsal)*60+ minute(h1.hisfsal))-hour(h1.hisfing)*60 - minute(h1.hisfing)) else '' end as tiempo_atencion from hosvital.hccom1 h1 inner join hosvital.capbas cap on (cap.mptdoc=h1.histipdoc and cap.mpcedu=h1.hisckey)
inner join hosvital.maemed1 med on (med.mmcodm=h1.hiscmmed) inner join hosvital.maeemp mae  on (mae.mennit= h1.fhccodcto) where  h1.hisfhorat >= '2019-08-01 00:00:00' and h1.hisfhorat <= '2019-08-03 00:00:00' order by h1.hisfing;