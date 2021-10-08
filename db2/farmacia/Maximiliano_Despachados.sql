/*
Necesito me ayuden con este archivo donde se visualice lo siguiente
PABELLÓN Y SERVICIO
CANTIDADES DESPACHADAS
TIPO DE MEDICAMENTO O DISPOSITIVO MÉDICO
NOMBRE DEL SUMINISTRO
*/

select * from hosvital.maepab;

select distinct mstipo from hosvital.maesum1;
select msreso, mstipo from hosvital.maesum1 where mstipo='L';

select distinct MSClaDM from hosvital.maesum1;

select MSTIPO,MSRESO, MSNOMG, MSClaDM from hosvital.maesum1 where mstipo='S';  -- MSClaDM in ('Cl','CIIA','CIIB','CIII');

select mstipo,count(*) from hosvital.maesum1 group by mstipo;

select * from hosvital.maesum1 where msreso ='F008M03';

select MSTIPO,MSClaDM  from hosvital.maesum1 where msreso ='F008M03A';

--  o = otros
--m = medicamentos

select * from hosvital.dspfrmc1 where dsmfhrmov >= '2021-03-01 00:00:00' order by hisckey,msreso;

-- Por Especialidad
select * from hosvital.frmsmns;
select * from hosvital.maeesp;


select esp.menome especialidad, case when m1.mstipo='S' then 'Suministro'  when m1.mstipo='O' then 'Otro' end tipo, case when  MSClaDM ='CIII'  then 'Clase III'  when  MSClaDM ='CIIA'  then 'Clase IIa' when  MSClaDM ='CIIB'  then 'Clase IIb'  else 'Suministro' end as tipo_dispositivo,  dsp1.msreso cod_med, m1.msnomg ,sum(dsp1.dsmcntmov)
from hosvital.dspfrmc1 dsp1
inner join hosvital.maesum1 m1 on (m1.msreso = dsp1.msreso )
--inner join hosvital.frmsmns f on (f.histipdoc=dsp1.histipdoc and f.hisckey=f.hiscekey
inner join hosvital.hccom1 hc on (hc.histipdoc=dsp1.histipdoc and  hc.hisckey=dsp1.hisckey and hc.hiscsec=dsp1.hiscsec)
inner join hosvital.maeesp esp on (esp.mecode=hc.hcesp)
where dsp1.dsmfhrmov >= '2021-03-01 00:00:00' and dsp1.dsmfhrmov <= '2021-03-31 00:00:00' and  m1.mstipo in ('O','S')
group by  esp.menome,m1.mstipo, m1.MSClaDM  ,dsp1.msreso , m1.msnomg 
order by esp.menome,m1.mstipo, m1.MSClaDM  ,dsp1.msreso , m1.msnomg;

-- Por Dispositivo Medico

select dsp1.dspabellon, maepab.mpnomp pabellon,case when m1.mstipo='S' then 'Suministro'  when m1.mstipo='O' then 'Otro' end tipo, case when  MSClaDM ='CIII'  then 'Clase III'  when  MSClaDM ='CIIA'  then 'Clase IIa' when  MSClaDM ='CIIB'  then 'Clase IIb'  else 'Suministro' end as tipo_dispositivo,  dsp1.msreso cod_med, m1.msnomg ,sum(dsp1.dsmcntmov)
from hosvital.dspfrmc1 dsp1
inner join hosvital.maesum1 m1 on (m1.msreso = dsp1.msreso )
inner join hosvital.maepab maepab on (maepab.mpcodp = dsp1.dspabellon)
where dsp1.dsmfhrmov >= '2021-03-01 00:00:00' and dsp1.dsmfhrmov <= '2021-03-31 00:00:00' and  m1.mstipo in ('O','S')
group by  dsp1.msreso , m1.msnomg, m1.mstipo, m1.MSClaDM  ,dsp1.dspabellon, maepab.mpnomp 
order by dsp1.msreso , m1.msnomg, dsp1.dspabellon, maepab.mpnomp ;