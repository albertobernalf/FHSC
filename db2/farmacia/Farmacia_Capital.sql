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
where a.hisckey='20076044' and fsmfhrreg<='2019-11-30 23:59:59' ; 



-- Query Capital

select * from hosvital.capbas;

select cap.mpnom1 as nombre1,cap.mpnom2 as nombre2, cap.mpape1 as apellido1,cap.mpape2 as apellido2,
 a.histipdoc as tipo_doc,a.hisckey as numero_documento, cap.mpsexo genero ,cap.mpdire direccion,cap.mptele telefono,cap.mdcodm ciudad ,cap.mdcodd depto ,mae.menomb,'FHSC',' ' as denominador_comun,maec.cncdes  as concentracion,
a.fsmdscmdc  as forma_farmaceutica, via.viapldsc  as via_administracion,case when a.hcfsfrh='93' then  'Dosis Unica' else a.hcfsfrh end  as frecuencia,  a.FsTiTrDi duracion_tratamiento,         a.FSmCntDia as cantidad_prescrita,
(select case when sum(dsp1.dsmcntmov) is null then 0 else sum(dsp1.dsmcntmov)  end  from  hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DS')   as cantidad_despachada,
(select case when sum(dsp1.dsmcntmov) is null then 0 else sum(dsp1.dsmcntmov)  end  from  hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DV')  as cantidad_devuelta,
(
(select case when sum(dsp1.dsmcntmov) is null then 0 else sum(dsp1.dsmcntmov)  end  from  hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DS') -
(select case when sum(dsp1.dsmcntmov) is null then 0 else sum(dsp1.dsmcntmov)  end  from  hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DV') 
) neto_entregado,

(select min(hc1.hcdxcod)  from hosvital.hcdiagn hc1 where hc1.histipdoc= hc.histipdoc and hc1.hisckey = hc.hisckey and hc1.hiscsec= hc.hiscsec  and hc1.hcdxcls=1 ) as dx_principal,
(select  min(hc1.hcdxcod) from hosvital.hcdiagn hc1 where hc1.histipdoc= hc.histipdoc and hc1.hisckey = hc.hisckey and hc1.hiscsec= hc.hiscsec  and hc1.hcdxcls=0) as dx_relacionado,

 a.fsmfhrreg as fecha_prescripcion,' ' as fecha_autorizacion,
(select dsp.DSmFch from hosvital.dspfrmc  dsp where  dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec= a.hiscsec and  dsp.msreso = a.fsmmsreso)  as fecha_entrega,

a.hiscsec as numero_registro,' '  as no_aut_entrega
from hosvital.FrmSmns as a 
inner join hosvital.hccom1  hc on (hc.histipdoc=a.histipdoc and hc.hisckey = a.hisckey and hc.hiscsec=a.hiscsec and hc.fhccodcto in ('SS0021','CAPITAL SALUS','CS0021','CAPITALCONT')  )
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu=a.hisckey)
inner join hosvital.maeconc maec on (maec.cnccd   = a.cnccd)
inner join hosvital.maeviapl  via  on (via.viaplcod   = a.hcfsvia)
inner join hosvital.maeemp mae on  (mae.mennit = hc.fhccodcto)
where  fsmfhrreg>='2019-11-01 00:00:00'  AND  fsmfhrreg<='2019-12-31 23:59:59' 
order by a.hisckey,a.hiscsec;


select * from hosvital.frmsmns  where hisckey='24431055' and hiscsec=167 and fsmmsreso='0471N02B';  
;

select * from hosvital.frmsmns;
select * from hosvital.maeemp;
select * from hosvital.hccom1;
 select * from hosvital.maeemp where menomb like ('%CAPITAL%');
select * from hosvital.dspfrmc where hisckey='24431055' and hiscsec=167 and msreso='0471N02B';    
select * from hosvital.dspfrmc1 where hisckey='24431055' and hiscsec=167 and msreso='0471N02B';   
select * from hosvital.hcdiagn where hisckey='1000936182' ;

