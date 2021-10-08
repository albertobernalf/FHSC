select case i.clapro when '1' THEN 'AMBULATORIO' when '2' then 'HOSPITALIZACION' when '3' THEN 'URGENCIAS' when '4' then 'TRATAMIENTO ESPECIAL' when '5' THEN 'URGENCIAS' end as servicio,mp.mpnomp as pabellon,i.mpnumc as cama_ingreso, mm.faccodcam as cama_salida,mae.menome as especialidad_ingreso,m.menomb as contrato ,c.mptdoc as tipodoc, c.mpcedu as documento, c.mpnomc as paciente, i.ingfecadm as ingreso from hosvital.capbas c inner join hosvital.ingresos i on (i.mptdoc=c.mptdoc and i.mpcedu=c.mpcedu) inner join hosvital.maepab mp on (mp.mpcodp=i.mpcodp) inner join hosvital.maeemp m on (m.mennit=i.ingnit) left join hosvital.maeate mm on (mm.mptdoc=i.mptdoc and mm.mpcedu=i.mpcedu and mm.mactving=i.ingcsc) inner join hosvital.maeesp mae on (mae.mecode=i.ingesmt) where i.ingfecadm>='2019-01-01 00:00:00' and i.ingfecadm<='2019-05-30 23:59:59' order by i.ingfecadm;

--colocar eltipopde docimento y eldocimento

-- Informe
select  * from hosvital.hccom1 where hisfhorat>='2019-05-21 00:00:00';

--del servicio urgencias, la clasificaion del triage, tipo_doc,documento paciente, nombre paciente,fecha-hora del triage

-- alternaitvamente si se puede traer la fecha - hora de laentrasda a consulra traer elmedico que atiende
--rtepote  INGRESOS TRIAGE

-- CC 	1012426631     	


select case i.clapro when '1' THEN 'AMBULATORIO' when '2' then 'HOSPITALIZACION' when '3' THEN 'URGENCIAS' when '4' then 'TRATAMIENTO ESPECIAL' when '5' THEN 'URGENCIAS' end as servicio,
c.mptdoc as tipodoc, c.mpcedu as documento, c.mpnomc as paciente, i.ingfecadm as ingreso, hc.hiscltr as triage,hc.hisfhorat as fecha_triage,hc.hiscmmed , m1.mmnomm as medico_triage,
(select min(hc1.hisfhorat)
from hosvital.hccom1 hc1 where hc1.histipdoc=hc.histipdoc and hc1.hisckey=hc.hisckey and hc1.hctvin1=hc.hctvin1 and  hc1.fhcindesp = 'GN' -- and hc1.hctvin1=2
) as fecha_atencion,
(select m2.mmnomm
from hosvital.hccom1 hc1 , hosvital.maemed1 m2
where hc1.histipdoc=hc.histipdoc and hc1.hisckey=hc.hisckey and hc1.hctvin1=hc.hctvin1 and  hc1.fhcindesp = 'GN' and hc1.hiscmmed=m2.mmcodm and
           hc1.hisfhorat = (select min(hc111.hisfhorat)  from hosvital.hccom1 hc111 where  hc111.histipdoc=hc1.histipdoc and hc111.hisckey=hc1.hisckey and hc111.hctvin1=hc1.hctvin1 and  hc111.fhcindesp = 'GN')
) as medico_atencion
from hosvital.capbas c 
inner join hosvital.ingresos i on (i.mptdoc=c.mptdoc and i.mpcedu=c.mpcedu) 
inner  join hosvital.hccom1 hc on (hc.histipdoc = i.mptdoc and hc.hisckey=i.mpcedu and hc.hctvin1=i.ingcsc and hc.fhcindesp='TR' )
inner join hosvital.maemed1 m1 on (m1.mmcodm = hc.hiscmmed )
where i.ingfecadm>='2019-05-01 00:00:00' and i.ingfecadm<='2019-05-30 23:59:59' and i.clapro in ('3','5') -- and c.mpcedu = '1012426631'
order by i.ingfecadm;


select  min(hisfhorat) from hosvital.hccom1 where hisckey='1012426631'  and  fhcindesp  in ('GN') and hctvin1=2;   --order by hiscsec;