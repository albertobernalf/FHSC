-- Traza de medicamentos

select * from hosvital.capbas where mpcedu= '3266171'; -- Paciente viene de hospitalizacion UI2019 , ingresa a la UCI hoy 17/07/2019
select * from hosvital.ingresos where mpcedu= '3266171'; -- Ingreso nro 9 2019-06-27 03:36:22.000000	


select * from hosvital.capbas where mpcedu= '1000521705'; -- OPaciente viene de hospitalizacion UI215
select * from hosvital.ingresos where mpcedu= '1000521705'; -- Ingreso nro 1 hoy jul-17-2019


-- Query traza Paciente que viene de hospitalizacion

select * from hosvital.maeconc;
select * from hosvital.maeviapl;
select * from hosvital.UndMedi;
select * from hosvital.FrmSmns where hisckey= '3266171'  and hiscsec=794  order by hiscsec;
-- C03C 	A01 	294 	70	


select * from hosvital.maesum1 where MSNOMG  like ('%NOREPINEFRINA%');  -- 0539N07A        --nidad de aoplicacion msundapl=mk / mscncunm / msundmct='mg' / msfrundapl=4,0
select * from hosvital.maesum1 where msnomg  like ('%FUROSEMI%');	 -- 0171C03C       ,, estado emn D
select * from hosvital.maesum1 where msreso='0171C03C';	

select * from hosvital.FrmSmns where hisckey= '3266171'  and hiscsec=794 AND FSMMSRESO= '0171C03C';
select * from hosvital.FrmSmns1 where hisckey= '3266171'  and hiscsec=844; -- La fecha de despoacho esta en 2019-07-18 08:51:00.000000  veamos a v er si kla modifica
select * from hosvital.FrmSmns where hisckey= '3266171'  and hiscsec=778  order by hiscsec;

select  a.hisckey,a.hiscsec as folio, case when a.hcsmstgr='O' then 'Nuevo'  when a.hcsmstgr='C' then 'Continuar'   when a.hcsmstgr='S' then 'Suspendido'  when a.hcsmstgr='M' then 'Modificacion' end  as Accion                          ,a.fsmdscmdc as descripcion, a.FSmCntDia as dias,A.FsDiTrAdi AS dias_adicionales, a.hiscansum as dosis, a.HCSmCnDsp as cantidad_entregada, 
dsp.DSmFch as fecha_despacho,dsp.DSmCntDes as cant_despachada,un.unmddes as medida,      case when a.hcfsfrh='93' then  'Dosis Unica' else a.hcfsfrh end  as frecuencia,maec.cncdes  as concentracion,via.viapldsc  as via,
 a.fsmfhrreg as fecha_formulacion_medico, b.hcfhhrap as fecha_hora_programacion_enfermera, b.asfecpapl as fecha_hora_Aplicacion, b.hcsumest as estado_aplicacion, c.mmnomm as usuario_aplicacion ,
--dsp1.DSmCnsMov as consec_despa,dsp1.DSmCntMov as cant_despacho,
dsp1.dsmtpotrn as tipo,dsp1.dsmcntmov cantidad,
dsp1.DsCnsDsp as consecutivo_despacho
from hosvital.FrmSmns as a 
inner  join hosvital.FrmSmns1 as b on (a.histipdoc = b.histipdoc and a.hisckey=b.hisckey  and a.hiscsec=b.hiscsec and a.hictvin = b.hictvin1 and a.mscodi=b.mscodi and a.msprac=b.msprac and a.msform=b.msform and a.cnccd = b.cnccd)
left   join hosvital.maemed1 as c on (b.asusuapl=c.mmcodm )
inner join hosvital.maeconc maec on (maec.cnccd   = a.cnccd)
inner join hosvital.maeviapl  via  on (via.viaplcod   = a.hcfsvia)
inner join hosvital.UndMedi  un   on (un.unmdcod   = a.hcsmundcd )
left  join hosvital.dspfrmc  dsp   on (dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec= a.hiscsec and  dsp.msreso = a.fsmmsreso)
left join hosvital.dspfrmc1  dsp1   on (dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso)
where b.hisckey='3266171' and fsmfhrreg>='2019-07-17 00:00:00' ; 

select * from hosvital.dspfrmc where hisckey= '3266171' and hiscsec=844 and msreso= '0171C03C';

select * from hosvital.dspfrmc1 where hisckey= '3266171' and hiscsec=844 and msreso= '0171C03C';

select * from hosvital.dspfrmc1 where  DsCnsDsp=3362445 and msreso= '0171C03C';
select * from hosvital.maesum1 where msnomg like ('%OMEPRAZOL 20 MG CAPSULA%');  --        A02B 	C01 	124 	10		
select * from hosvital.FrmSmns where hisckey= '3266171'  and hiscsec=778 AND FSMMSRESO= '0171C03C';  
select * from hosvital.FrmSmns1 where hisckey= '3266171'  and hiscsec=778 ; -- AND FSMMSRESO= '0171C03C';    	
	


-- Query traza Paciente nuevo



select  a.hisckey,a.hiscsec as folio, case when a.hcsmstgr='O' then 'Nuevo'  when a.hcsmstgr='C' then 'Continuar'   when a.hcsmstgr='S' then 'Suspendido'  when a.hcsmstgr='M' then 'Modificacion' end  as Accion                          ,a.fsmdscmdc as descripcion, a.FSmCntDia as dias,A.FsDiTrAdi AS dias_adicionales, a.hiscansum as dosis, a.HCSmCnDsp as cantidad_entregada, 
dsp.DSmFch as fecha_despacho,dsp.DSmCntDes as cant_despachada,un.unmddes as medida,      case when a.hcfsfrh='93' then  'Dosis Unica'   when a.hcfsfrh='95' then  'Ahora'    when a.hcfsfrh='93' then  'Dosis Unica'  else a.hcfsfrh end  as frecuencia,maec.cncdes  as concentracion,via.viapldsc  as via,
 a.fsmfhrreg as fecha_formulacion_medico, b.hcfhhrap as fecha_hora_programacion_enfermera, b.asfecpapl as fecha_hora_Aplicacion, b.hcsumest as estado_aplicacion, c.mmnomm as usuario_aplicacion ,
--dsp1.DSmCnsMov as consec_despa,dsp1.DSmCntMov as cant_despacho,
dsp1.dsmtpotrn as tipo,dsp1.dsmcntmov cantidad,

dsp1.DsCnsDsp as consecutivo_despacho
from hosvital.FrmSmns as a 
inner  join hosvital.FrmSmns1 as b on (a.histipdoc = b.histipdoc and a.hisckey=b.hisckey  and a.hiscsec=b.hiscsec and a.hictvin = b.hictvin1 and a.mscodi=b.mscodi and a.msprac=b.msprac and a.msform=b.msform and a.cnccd = b.cnccd)
left   join hosvital.maemed1 as c on (b.asusuapl=c.mmcodm )
inner join hosvital.maeconc maec on (maec.cnccd   = a.cnccd)
inner join hosvital.maeviapl  via  on (via.viaplcod   = a.hcfsvia)
inner join hosvital.UndMedi  un   on (un.unmdcod   = a.hcsmundcd )
left  join hosvital.dspfrmc  dsp   on (dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec= a.hiscsec and  dsp.msreso = a.fsmmsreso)
left join hosvital.dspfrmc1  dsp1   on (dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso)
where b.hisckey='1000521705' and fsmfhrreg>='2019-07-01 00:00:00' ; 


-- Query estructurado

select  a.histipdoc as tipo_doc,a.hisckey as documento,a.hiscsec as folio,
 case when a.hcsmstgr='O' then 'Nuevo'  when a.hcsmstgr='C' then 'Continuar'   when a.hcsmstgr='S' then 'Suspendido'  when a.hcsmstgr='M' then 'Modificacion' end  as Accion   ,
a.fsmdscmdc as descripcion, a.FSmCntDia as dias,A.FsDiTrAdi AS dias_adicionales, a.hiscansum as dosis, un.unmddes as medida,      case when a.hcfsfrh='93' then  'Dosis Unica' else a.hcfsfrh end  as frecuencia,maec.cncdes  as concentracion,via.viapldsc  as via, a.fsmfhrreg as fecha_formulacion_medico,
(select dsp.DSmFch from hosvital.dspfrmc  dsp where  dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec= a.hiscsec and  dsp.msreso = a.fsmmsreso)  as fecha_dispensacion,
(select dsp.DSmCntDes from hosvital.dspfrmc  dsp where  dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec= a.hiscsec and  dsp.msreso = a.fsmmsreso)  as cantidad_despachada,
(select dsp1.DsCnsDsp from hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DS') as consec_despacho,
(select sum(dsp1.dsmcntmov) from  hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DS') as cantidad_despachada,
(select sum(dsp1.dsmcntmov) from  hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DV') as cantidad_devuelta,
(select b.hcfhhrap from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=1) as fecha_hora_programacion_enfermera1,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)     from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=1 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion1,
(select b.hcfhhrap from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=2) as fecha_hora_programacion_enfermera2,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)    from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=2 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion2,
(select b.hcfhhrap from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=3) as fecha_hora_programacion_enfermera3,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)     from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=3 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion3,
(select b.hcfhhrap from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=4) as fecha_hora_programacion_enfermera4,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)   from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=4 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion4,
(select b.hcfhhrap from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=5) as fecha_hora_programacion_enfermera5,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)     from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=5 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion5,
(select b.hcfhhrap from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=6) as fecha_hora_programacion_enfermera6,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)    from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=6 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion6
from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd   = a.cnccd)
inner join hosvital.maeviapl  via  on (via.viaplcod   = a.hcfsvia)
inner join hosvital.UndMedi  un   on (un.unmdcod   = a.hcsmundcd )
where  fsmfhrreg>='2020-10-15 00:00:00'  and  fsmfhrreg<='2020-10-20 23:59:59'
order by a.histipdoc ,a.hisckey,a.hiscsec ; 

-- aCOTADO

select a.histipdoc as tipo_doc,a.hisckey as documento,a.hiscsec as folio, case when a.hcsmstgr='O' then 'Nuevo' when a.hcsmstgr='C' then 'Continuar' when a.hcsmstgr='S' then 'Suspendido' when a.hcsmstgr='M' then 'Modificacion' end as Accion,a.fsmdscmdc as descripcion, a.FSmCntDia as dias,A.FsDiTrAdi AS dias_adicionales, a.hiscansum as dosis, un.unmddes as medida,case when a.hcfsfrh='93' then 'Dosis Unica' else a.hcfsfrh end as frecuencia,maec.cncdes as concentracion,via.viapldsc as via,a.fsmfhrreg as fecha_formulacion_medico,(select dsp.DSmFch from hosvital.dspfrmc dsp where dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec=a.hiscsec and dsp.msreso=a.fsmmsreso) as fecha_dispensacion,(select dsp.DSmCntDes from hosvital.dspfrmc dsp where dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec=a.hiscsec and dsp.msreso=a.fsmmsreso) as cantidad_despachada,(select dsp1.DsCnsDsp from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and dsp1.msreso= a.fsmmsreso and dsp1.dsmtpotrn ='DS') as consec_despacho,(select sum (dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn='DS') as cantidad_despachada,(select sum(dsp1.dsmcntmov) from hosvital.dspfrmc1 dsp1 where dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and dsp1.msreso = a.fsmmsreso and dsp1.dsmtpotrn ='DV') as cantidad_devuelta,(select b.hcfhhrap from hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1=a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=1) as fecha_hora_programacion_enfermera1,(select concat(concat (concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day (b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'Med:' ),mae.mmnomm) from hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1=a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=1 and b.asusuapl=mae.mmcodm) as fecha_aplicacion1,(select b.hcfhhrap from hosvital.FrmSmns1 b where b.histipdoc=a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1=a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=2) as fecha_hora_programacion_enfermera2,(select concat(concat(concat (concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day (b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'Med:' ),mae.mmnomm) from hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc= a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=2 and b.asusuapl=mae.mmcodm) as fecha_aplicacion2,(select b.hcfhhrap from hosvital.FrmSmns1 b where b.histipdoc=a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1= a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=3) as fecha_hora_programacion_enfermera3, (select concat(concat (concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day (b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'Med:' ),mae.mmnomm) from hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc=a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1=a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd=a.cnccd and b.HCSumCns=3 and b.asusuapl=mae.mmcodm) as fecha_aplicacion3,(select b.hcfhhrap from hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1=a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=4) as fecha_hora_programacion_enfermera4,(select concat(concat(concat (concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day (b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'Med:' ),mae.mmnomm) from hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc=a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1=a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=4 and b.asusuapl=mae.mmcodm) as fecha_aplicacion4,(select b.hcfhhrap from hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1=a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=5) as fecha_hora_programacion_enfermera5, (select concat(concat (concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day (b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'Med:' ),mae.mmnomm) from hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc=a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=5 and b.asusuapl=mae.mmcodm) as fecha_aplicacion5,(select b.hcfhhrap from hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1=a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=6) as fecha_hora_programacion_enfermera6,(select concat(concat(concat (concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day (b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'Med:' ),mae.mmnomm) from hosvital.FrmSmns1 b,hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey and b.hiscsec=a.hiscsec and b.hictvin1=a.hictvin and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=6 and b.asusuapl=mae.mmcodm) as fecha_aplicacion6 from hosvital.FrmSmns as a inner join hosvital.maeconc maec on (maec.cnccd= a.cnccd) inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia) inner join hosvital.UndMedi un on (un.unmdcod=a.hcsmundcd) where a.hisckey='20076044' and fsmfhrreg>=? and fsmfhrreg<=?;

--Query para lo devuelto
----------------------------


select  a.histipdoc as tipo_doc,a.hisckey as documento,a.hiscsec as folio,
a.fsmdscmdc as descripcion, a.FSmCntDia as dias, a.hiscansum as dosis, un.unmddes as medida,      case when a.hcfsfrh='93' then  'Dosis Unica' else a.hcfsfrh end  as frecuencia,maec.cncdes  as concentracion,via.viapldsc  as via,
(select dsp.DSmFch from hosvital.dspfrmc  dsp where  dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec= a.hiscsec and  dsp.msreso = a.fsmmsreso)  as fecha_dispensacion,
(select dsp1.DsCnsDsp from hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DS') as consec_despacho,
(select sum(dsp1.dsmcntmov) from  hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DS') as cantidad_despachada,
(select sum(dsp1.dsmcntmov) from  hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DV') as cantidad_devuelta
from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd   = a.cnccd)
inner join hosvital.maeviapl  via  on (via.viaplcod   = a.hcfsvia)
inner join hosvital.UndMedi  un   on (un.unmdcod   = a.hcsmundcd )
where a.hisckey='3266171' and fsmfhrreg>='2019-07-17 00:00:00' ; 

