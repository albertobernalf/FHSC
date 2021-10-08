/*
0  1  2	3	4	6	8	10	12	18	24	
36	40	48	60	72	74	75	76	
77	78	79	80	90	91	92	--93	94	95	

*/

select HISTIPDOC, HISCKEY, HISCSEC, FSMFHRREG, FSMDSCMDC,hcfsfrh from hosvital.FrmSmns where  FSMFHRREG >= '2020-01-01 00:00:00' AND hcfsfrh in (92);
select HISTIPDOC, HISCKEY, HISCSEC, FSMFHRREG, FSMDSCMDC,hcfsfrh  from hosvital.FrmSmns where hisckey='2293479' and hiscsec=62;

-- Buscar en Frecuencia codificacion: Bolo, Ahora , hioras etc, campor en la frmsmns = hcfsfrh =
--  1,2,3,4,6,8,12,24, horas
-- 5,15,30 minutos
-- Dosis Unica
-- Ahora , bolo , inf continua
-- 7,14,21,28 dias
/*

select * from hosvital.FrmSmns where hcfsfrh='20144585' and hiscsec=1683;


 case when a.hcfsfrh='93' then  'Dosis Unica'    
  when a.hcfsfrh='95' then  'Ahora'   when a.hcfsfrh='90' then  'Bolo'  
 when a.hcfsfrh='99' then  'inf Continua'  
 when a.hcfsfrh='1' then  '1 Hora'         when a.hcfsfrh='2' then  '2 Horas'           when a.hcfsfrh='3' then  '3 Horas'             when a.hcfsfrh='4' then  '4 Horas'            when a.hcfsfrh='6' then  '6 Horas'              when a.hcfsfrh='8' then  '8 Horas'             when a.hcfsfrh='12' then  '12 Horas'                when a.hcfsfrh='24' then  '24 Horas'     when a.hcfsfrh='36' then  '36 Horas'   when a.hcfsfrh='48' then  '48 Horas'     when a.hcfsfrh='72' then  '72 Horas'       when a.hcfsfrh='94' then  '5 Minutos'     when a.hcfsfrh='91' then  '15 Minutos' 
   when a.hcfsfrh='92' then  '30 Minutos'  
  when a.hcfsfrh='74' then  '7 Dias'  when a.hcfsfrh='78' then  '14 Dias'    when a.hcfsfrh='75' then  '15 Dias'      when a.hcfsfrh='76' then  '20 Dias'  when a.hcfsfrh='77' then  '30 Dias'  else a.hcfsfrh end

*/

select * from hosvital.FrmSmns1 where hisckey='1000031345';
select * from hosvital.FrmSmns where hisckey='1000031345';

select  a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc as paciente,a.hiscsec as folio,
 case when a.hcsmstgr='O' then 'Nuevo'  when a.hcsmstgr='C' then 'Continuar'   when a.hcsmstgr='S' then 'Suspendido'  when a.hcsmstgr='M' then 'Modificacion' end  as Accion   ,
a.fsmdscmdc as descripcion, a.FSmCntDia as dias,A.FsDiTrAdi AS dias_adicionales, a.hiscansum as dosis, un.unmddes as medida,      case when a.hcfsfrh='93' then  'Dosis Unica' else a.hcfsfrh end  as frecuencia,maec.cncdes  as concentracion,via.viapldsc  as via, a.fsmfhrreg as fecha_formulacion_medico,
(select dsp.DSmFch from hosvital.dspfrmc  dsp where  dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec= a.hiscsec and  dsp.msreso = a.fsmmsreso)  as fecha_dispensacion
,(select dsp.DSmCntDes from hosvital.dspfrmc  dsp where  dsp.histipdoc=a.histipdoc and dsp.hisckey=a.hisckey and dsp.hiscsec= a.hiscsec and  dsp.msreso = a.fsmmsreso)  as cantidad_despachada
,(select min(dsp1.DsCnsDsp) from hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DS') as consec_despacho
,(select sum(dsp1.dsmcntmov) from  hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DS') as cantidad_despachada
,(select sum(dsp1.dsmcntmov) from  hosvital.dspfrmc1  dsp1  where  dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.hiscsec= a.hiscsec and  dsp1.msreso = a.fsmmsreso and  dsp1.dsmtpotrn ='DV') as cantidad_devuelta,
(select min(b.hcfhhrap) from  hosvital.FrmSmns1 b 
where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=1) as fecha_hora_programacion_enfermera1
,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(min(b.asfecpapl)),'-'),lpad(month( min(b.asfecpapl)),2,'0')),'-'),lpad(day(min(b.asfecpapl)),2,'0')),' '),lpad(hour(min(b.asfecpapl)),2,'0')),':'),lpad(minute(min(b.asfecpapl)),2,'0')),'    ' ),min(mae.mmnomm))     from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=1 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion1
/*,
(select min(b.hcfhhrap) from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=2) as fecha_hora_programacion_enfermera2,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)    from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=2 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion2,
(select min(b.hcfhhrap) from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=3) as fecha_hora_programacion_enfermera3,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)     from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=3 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion3,
(select min(b.hcfhhrap) from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=4) as fecha_hora_programacion_enfermera4,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)   from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=4 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion4,
(select min(b.hcfhhrap) from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=5) as fecha_hora_programacion_enfermera5,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)     from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=5 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion5,
(select min(b.hcfhhrap) from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=6) as fecha_hora_programacion_enfermera6,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(b.asfecpapl),'-'),lpad(month( b.asfecpapl),2,'0')),'-'),lpad(day(b.asfecpapl),2,'0')),' '),lpad(hour(b.asfecpapl),2,'0')),':'),lpad(minute(b.asfecpapl),2,'0')),'    ' ),mae.mmnomm)    from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=6 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion6
*/
from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd   = a.cnccd)
inner join hosvital.maeviapl  via  on (via.viaplcod   = a.hcfsvia)
inner join hosvital.UndMedi  un   on (un.unmdcod   = a.hcsmundcd )
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu = a.hisckey)
where  fsmfhrreg>='2020-06-10 00:00:00'  and  fsmfhrreg<='2020-10-30 23:59:59'   -- and a.hisckey='1000031345' -- and a.hiscsec in (112,127) --and a.hiscsec = a.fsmfolorg;
order by a.histipdoc ,a.hisckey,a.hiscsec ; 

select hisckey,hiscsec,mscodi,msprac,msform,cnccd, hiscansum, hictvin, fsmdscmdc, fsmcntdia, fsmmsreso, fsmcntsol,hcsmstgr,fsmfolorg  from hosvital.FrmSmns where hisckey='1013652059' and hiscsec in (54,49,44);
-- hcsumest = 'A' = aPLICADO, 'D'='DESPACHADO' O= 'ORDENADO' 'rEGISTRADO'
-- HCSUMCNS = Consecutivo

select hisckey,hiscsec,mscodi,msprac,msform,cnccd,hcsumcns,hcsumest,hcfhhrap, asfecpapl,  asusuapl, hictvin1 from hosvital.FrmSmns1 where hisckey='1013652059' and hiscsec in (54,49,44);
select * from hosvital.dspfrmc1 where hisckey='1013652059' and hiscsec in (54,49,44);
select * from hosvital.FrmSmns1 where hisckey='1013652059' and hiscsec in (54,49,44);

-- sUPER qUERY QUE LOS UNE

select f.hisckey,f.hiscsec,f.mscodi,f.msprac,f.msform ,f.cnccd,f.fsmmsreso,f.fsmcntdia,f.fsmcntsol,f.hcsmstgr estado1,f.fsmfolorg,f1.hcsumcns consec,f1.hcsumest estado,f1.hcfhhrap programado,f1.asfecpapl aplicado,f1.asusuapl usuario,f1.hictvin1
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd)
where f.hisckey='1013652059' and f. hiscsec in (54,49,44)
order by f.hiscsec;

select f.hisckey,f.hiscsec,f.mscodi,f.msprac,f.msform ,f.cnccd,f.fsmmsreso,f.fsmcntdia,f.fsmcntsol,f.hcsmstgr estado1,f.fsmfolorg,f1.hcsumcns consec,f1.hcsumest estado,f1.hcfhhrap programado,f1.asfecpapl aplicado,f1.asusuapl usuario,f1.hictvin1
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd)
where f.hisckey='1013652059' and f. hiscsec in (54,49,44)
order by f.hiscsec;

-- Query que los une con despachos farmacia

select f.hisckey,f.hiscsec,f.mscodi,f.msprac,f.msform ,f.cnccd,f.fsmmsreso,f.fsmcntdia,f.fsmcntsol,f.hcsmstgr estado1,f.fsmfolorg,f1.hcsumcns consec,f1.hcsumest estado,f1.hcfhhrap programado,f1.asfecpapl aplicado,f1.asusuapl usuario,f1.hictvin1,
dsp1.dsmcntmov farmacia_despacha
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd)
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.hisckey='1013652059' and f. hiscsec in (54,49,44)
order by f.hiscsec;

-- Query que los une con despachos farmacia Total el fuerte1

select f.hisckey,f.hiscsec,f.mscodi,f.msprac,f.msform ,f.cnccd,f.fsmmsreso,f.fsmcntsol,max(f1.hcsumcns) aplico,dsp1.dsmcntmov farmacia_despacha
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd and f1.hcsumest='A')
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.hisckey='1013652059' and f. hiscsec in (54,49,44)
group by  f.hisckey,f.hiscsec,f.mscodi,f.msprac,f.msform ,f.cnccd,f.fsmmsreso,f.fsmcntsol,dsp1.dsmcntmov
order by f.hiscsec;


-- Query que los une con despachos farmacia Total el fuerte2

select f.hisckey,sum(f.fsmcntsol),sum(ifnull(f1.hcsumcns,0)) aplico,sum(dsp1.dsmcntmov) farmacia_despacha,
(
sum(f.fsmcntsol)  - 
sum(ifnull(f1.hcsumcns,0)) 
) No_Aplico
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd and f1.hcsumest='A')
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.hisckey='1013652059' and f. hiscsec in (54,49,44) and   f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest='A')
group by  f.hisckey     ;




select * from hosvital.maemed1;
select distinct hcfsfrh from hosvital.FrmSmns order by hcfsfrh ;

--  Primera propuesta Query Enfermeria Aplicacion de Medicamentos

select  a.histipdoc as tipo_doc,a.hisckey as documento,cap.mpnomc as paciente,a.hiscsec as folio,
 case when a.hcsmstgr='O' then 'Nuevo'  when a.hcsmstgr='C' then 'Continuar'   when a.hcsmstgr='S' then 'Suspendido'  when a.hcsmstgr='M' then 'Modificacion' end  as Accion   ,
a.fsmdscmdc as descripcion, maec.cncdes  as concentracion, a.FSmCntDia as Cantidad,A.FsDiTrAdi AS dias_adicionales, a.hiscansum as dosis, un.unmddes as medida,   

 case when a.hcfsfrh='93' then  'Dosis Unica'      when a.hcfsfrh='95' then  'Ahora'   when a.hcfsfrh='90' then  'Bolo'   when a.hcfsfrh='99' then  'inf Continua'   when a.hcfsfrh='1' then  '1 Hora'  
          when a.hcfsfrh='2' then  '2 Horas'           when a.hcfsfrh='3' then  '3 Horas'             when a.hcfsfrh='4' then  '4 Horas'            when a.hcfsfrh='6' then  '6 Horas'              when a.hcfsfrh='8' then  '8 Horas'             when a.hcfsfrh='12' then  '12 Horas'   
              when a.hcfsfrh='24' then  '24 Horas'     when a.hcfsfrh='36' then  '36 Horas'   when a.hcfsfrh='48' then  '48 Horas'     when a.hcfsfrh='72' then  '72 Horas'       when a.hcfsfrh='94' then  '5 Minutos'     when a.hcfsfrh='91' then  '15 Minutos'   
 when a.hcfsfrh='92' then  '30 Minutos'    when a.hcfsfrh='74' then  '7 Dias'    when a.hcfsfrh='78' then  '14 Dias'   when a.hcfsfrh='75' then  '15 Dias' 
       when a.hcfsfrh='76' then  '20 Dias'  when a.hcfsfrh='77' then  '30 Dias'  else 'NULO' end AS FRECUENCIA,

via.viapldsc  as via, a.fsmfhrreg as fecha_formulacion_medico,
(select b.hcfhhrap from  hosvital.FrmSmns1 b where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=1) as fecha_hora_programacion_enfermera1,
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(year(min(b.asfecpapl)),'-'),lpad(month(min( b.asfecpapl)),2,'0')),'-'),lpad(day(min(b.asfecpapl)),2,'0')),' '),lpad(hour(min(b.asfecpapl)),2,'0')),':'),lpad(minute(min(b.asfecpapl)),2,'0')),'    ' ),min(mae.mmnomm))     from  hosvital.FrmSmns1 b, hosvital.maemed1 mae where b.histipdoc = a.histipdoc and b.hisckey=a.hisckey  and b.hiscsec=a.hiscsec and b.hictvin1 = a.hictvin  and b.mscodi=a.mscodi and b.msprac=a.msprac and b.msform=a.msform and b.cnccd =a.cnccd and b.HCSumCns=1 and b.asusuapl=mae.mmcodm     ) as fecha_aplicacion1
/*,
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
*/
from hosvital.FrmSmns as a 
inner join hosvital.maeconc maec on (maec.cnccd   = a.cnccd)
inner join hosvital.maeviapl  via  on (via.viaplcod   = a.hcfsvia)
inner join hosvital.UndMedi  un   on (un.unmdcod   = a.hcsmundcd )
inner join hosvital.capbas cap on (cap.mptdoc=a.histipdoc and cap.mpcedu = a.hisckey)
where  fsmfhrreg>='2020-01-01 00:00:00'  and  fsmfhrreg<='2020-10-17 23:59:59'   and a.hcsmstgr <> 'X'  
order by a.histipdoc ,a.hisckey,a.hiscsec ;

-- 2da Consulta Sobre Estudios Paraclinicos
/*

case when h51.HCPrcEst = 'O' then 'Ordenado'
 when h51.HCPrcEst = 'N' then 'Anulado'
 when h51.HCPrcEst = 'C' then 'Cancelado desde HC'
 when h51.HCPrcEst = 'E' then 'En Tramite'
 when h51.HCPrcEst = 'A' then 'Aplicado'
 when h51.HCPrcEst = 'X' then 'Resultado Externo'
 when h51.HCPrcEst = 'I' then 'Interpretado' END AS ESTADO


N 
C 
E 
A 
X 
I 

*/


select * from HOSVITAL.TIPPROC;
select * from hosvital.maepro;

SELECT * FROM HOSVITAL.HCCOM5;

SELECT * FROM HOSVITAL.HCCOM5 WHERE HISCKEY='28957669' ORDER BY HISCSEC;
SELECT * FROM HOSVITAL.HCCOM51 WHERE HISCKEY='28957669' ORDER BY HISCSEC;



select YEAR(H.HISFHORAT),MONTH(H.HISFHORAT),  t.tiprdes,
case when h51.HCPrcEst = 'O' then 'Ordenado'
 when h51.HCPrcEst = 'N' then 'Anulado'
 when h51.HCPrcEst = 'C' then 'Cancelado desde HC'
 when h51.HCPrcEst = 'E' then 'En Tramite'
 when h51.HCPrcEst = 'A' then 'Aplicado'
 when h51.HCPrcEst = 'X' then 'Resultado Externo'
 when h51.HCPrcEst = 'I' then 'Interpretado' END AS ESTADO,COUNT(*)
FROM HOSVITAL.HCCOM1 H
INNER JOIN HOSVITAL.HCCOM51 H51 ON (H51.HISTIPDOC=H.HISTIPDOC AND H51.HISCKEY=H.HISCKEY AND H51.HISCSEC=H.HISCSEC )
INNER JOIN HOSVITAL.TIPPROC T ON (T.TIPRCOD = H51.HCPRCTPOP  )
INNER JOIN HOSVITAL.MAEPRO MAE ON (mae.tpprcd = t.tiprcod and MAE.PRCODI=H51.HCPRCCOD )
WHERE H.HISFHORAT >= '2020-01-01 00:00:00' AND H.HISFHORAT<= '2020-10-31 23:59:59'  
GROUP BY   YEAR(H.HISFHORAT),MONTH(H.HISFHORAT), t.tiprdes, h51.HCPrcEst
order by   YEAR(H.HISFHORAT),MONTH(H.HISFHORAT), t.tiprdes, h51.HCPrcEst;

-- 3 Consulta los Paraclinicos como detallados por paciente

select * from hosvital.hccom51 where Hcfchrap>= '2020-10-01 00:00:00';
select * from hosvital.hccom51r where HISCKEY='23484572';

select H51.Hcfchrap fecha_aplicacion,   t.tiprdes tipo ,cap.mpnomc paciente ,h.hiscsec folio, h51.hcprccod procedimientos,mae.prnomb procedimiento,
case when h51.HCPrcEst = 'O' then 'Ordenado'
 when h51.HCPrcEst = 'N' then 'Anulado'
 when h51.HCPrcEst = 'C' then 'Cancelado desde HC'
 when h51.HCPrcEst = 'E' then 'En Tramite'
 when h51.HCPrcEst = 'A' then 'Aplicado'
 when h51.HCPrcEst = 'X' then 'Resultado Externo'
 when h51.HCPrcEst = 'I' then 'Interpretado' END AS ESTADO
FROM HOSVITAL.HCCOM1 H
INNER JOIN HOSVITAL.HCCOM51 H51 ON (H51.HISTIPDOC=H.HISTIPDOC AND H51.HISCKEY=H.HISCKEY AND H51.HISCSEC=H.HISCSEC )
INNER JOIN HOSVITAL.TIPPROC T ON (T.TIPRCOD = H51.HCPRCTPOP  )
INNER JOIN HOSVITAL.MAEPRO MAE ON (mae.tpprcd = t.tiprcod and MAE.PRCODI=H51.HCPRCCOD )
inner join hosvital.capbas cap on (cap.mptdoc=h.histipdoc and cap.mpcedu = h.hisckey)
WHERE H.HISFHORAT >= '2020-01-01 00:00:00' AND H.HISFHORAT<= '2020-10-31 23:59:59'  AND H.HISCKEY='23484572'
order by t.tiprdes, h51.hcprccod ;


-- 4. Medicamentos , Nuevo - Continuar


-- 5. Pantalla de Citas Medicas

select * from hosvital.citmed;
select * from hosvital.citmed1;
select * from hosvital.citmed2;
select * from hosvital.consul;
select * from hosvital.capbas;


select c.citfec fecha_cita,c.cithori hora, c.citcons NumConsultorio,cons.consdet Consultorio ,  m.mmnomm as medico,cap.mpnomc paciente,
case when c.citestp ='C' then 'Confirmada'
when c.citestp ='R' then 'Reservada'
when c.citestp ='A' then 'Atendida'
when c.citestp ='N' then 'Cancelada'
when c.citestp ='F' then 'Facturada' end estado_cita

from hosvital.citmed c
inner join hosvital.citmed1 c1 on (c1.citnum = c.citnum)
inner join hosvital.capbas cap on (cap.mptdoc = c1.cittipdoc and cap.mpcedu = c1.citced)
inner join hosvital.consul cons on (cons.conscod = c.citcons)
inner join hosvital.citmed2 c2 on (c2.citnum = c.citnum)
inner join hosvital.maemed1 m on (m.mmcodm = c2.mmcodm)
--where c.citfec >= '2020-10-26' and  c.citfec  <= '2020-10-26'
where c.citfec >= current_date and  c.citfec  <= current_date
order by m.mmnomm,c.citfec,c.cithori;

-- 6 Pantalla Estancia Hospitalizados

select * from hosvital.ingresos;
select * from hosvital.tmpfac;
select * from hosvital.maepab;

select  mae.mpnomp pabellon, t.tfccodcam cama , date(i.ingfecadm) ingreso,cap.mpnomc as paciente, i.ingfecegr,  i.inginslc as salida_clinica,
(case when i.ingfecegr <> '0001-01-01 00:00:00.00000' then  (  days(i.ingfecegr)  )      else days(current_date) end - days(i.ingfecadm))  dias_estancia
from hosvital.tmpfac t
inner join hosvital.ingresos i on (i.mptdoc=t.tftdoc and i.mpcedu = t.tfcedu and t.tmctving = i.ingcsc)
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu = i.mpcedu)
inner join hosvital.maepab mae on (mae.mpcodp= t.tfccodpab)
where mae.mpclapro=2
order by mae.mpnomp , t.tfccodcam;

select * from hosvital.maepab1;

-- Ultima version del query

select  mae.mpnomp pabellon, t.tfccodcam cama , date(i.ingfecadm) ingreso,cap.mpnomc as paciente, i.ingfecegr EGRESO,  i.inginslc as Alta_Medica,
(case when i.ingfecegr <> '0001-01-01 00:00:00.00000' then  (  days(i.ingfecegr)  )      else days(current_date) end - days(i.ingfecadm))  estancia_en_Dias
from hosvital.tmpfac t
inner join hosvital.ingresos i on (i.mptdoc=t.tftdoc and i.mpcedu = t.tfcedu and t.tmctving = i.ingcsc)
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu = i.mpcedu)
inner join hosvital.maepab mae on (mae.mpcodp= t.tfccodpab)
inner join hosvital.maepab1 maepab1 on (maepab1.mpudoc=cap.mptdoc and maepab1.mpuced=cap.mpcedu and maepab1.mpcodp = t.tfccodpab  and  maepab1.mpnumc = t.tfccodcam)
where mae.mpclapro=2
order by mae.mpnomp , t.tfccodcam;


-- Super Query Consola Hospitalaria


select * from hosvital.maepab;
select * from hosvital.maepab where mpclapro=2 ;
select * from hosvital.maepab where mpclapro=2  and  mpnomp liKe ('%HOSP%')  AND mpnomp NOT LIKE ('%QUIR%') AND mpnomp NOT LIKE ('%REANI%') AND mpnomp NOT LIKE ('%CIRU%');
select * from hosvital.maepab1 where mpuced='32429665';
select * from hosvital.ingresomp where mpcedu ='32429665';
select * from hosvital.hccom51 where hisckey='32429665' and hctvin51=7 and hcprcEst IN ('O','E') order by hcfchrord;

select * from hosvital.hccom1 where hisckey='32429665' and hctvin1=7  and fhcindesp='GN' AND HISFHORAT >= '2020-10-04 20:58:45.0000';-- and hcprcEst IN ('O','E') order by hcfchrord;

-- Quer de Pruebas

select  mae.mpnomp pabellon, maepab1.mpnumc as cama, maepab1.mpfchi fecha_cama,i2.ingfecmop as ingreso_cama2, i.ingfecadm ingreso,cap.mpcedu,cap.mpnomc as paciente, i.ingfecegr EGRESO,  i.inginslc as Alta_Medica
from hosvital.ingresos i 
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu = i.mpcedu)
inner join hosvital.maepab1 maepab1 on (maepab1.mpudoc=cap.mptdoc and maepab1.mpuced=cap.mpcedu and maepab1.mpctvin=i.ingcsc)
inner join hosvital.maepab mae on (mae.mpcodp= maepab1.mpcodp)
inner join hosvital.ingresomp i2 on (i2.mptdoc=i.mptdoc and i2.mpcedu=i.mpcedu and i2.ingcsc=i.ingcsc and i2.ingcodpab=maepab1.mpcodp and i2.ingcodcam=maepab1.mpnumc)
inner join hosvital.hccom51 h51 on (h51.histipdoc = cap.mptdoc and h51.hisckey = cap.mpcedu and h51.hctvin51 = i.ingcsc and h51. hcprcEst IN ('O','E') and h51.hcfchrord <= i2.ingfecmop )
where mae.mpclapro=2 and i.mpcedu='32429665'
order by mae.mpnomp , maepab1.mpnumc;
select * from hosvital.frmsmns where hisckey='1013652059' and hiscsec in (54,49,44);
select * from hosvital.dspfrmc1 where hisckey='1013652059' and hiscsec in (54,49,44);


-- Query Consolidado

select  mae.mpnomp pabellon, maepab1.mpnumc as cama,i2.ingfecmop as ingreso_cama2, i.ingfecadm ingreso,cap.mpcedu,cap.mpnomc as paciente,i.ingcsc ingreso, i.ingfecegr EGRESO, 
(select case when count(*)  = 0 then 'Verde' else 'Rojo' end from hosvital.hccom51 h51 
 where h51.histipdoc = cap.mptdoc and h51.hisckey = cap.mpcedu and h51.hctvin51 = i.ingcsc and h51. hcprcEst IN ('O','E') and h51.hcfchrord <= i2.ingfecmop

) Pendientes_Otros_Servicios,
(select case when count(*)  = 0 then 'Rojo' else 'Verde' end from hosvital.hccom1 h1 where h1.histipdoc=cap.mptdoc and h1.hisckey = cap.mpcedu and h1.hctvin1=i.ingcsc  and h1.fhcindesp='GN' AND h1.hisfhorat >=i2.ingfecmop

) ingreso_evol_medico,
(select case when count(*)  = 0 then 'Rojo' else 'Verde' end from hosvital.hccom1 h1 where h1.histipdoc=cap.mptdoc and h1.hisckey = cap.mpcedu and h1.hctvin1=i.ingcsc  and h1.fhcindesp='EN' AND h1.hisfhorat >=i2.ingfecmop

) ingreso_evol_Enfermeria,
(select  sum(ifnull(a.FSmCntsol,0) )
from hosvital.FrmSmns a
where a.histipdoc = i.mptdoc and a.hisckey=i.mpcedu and    a.hictvin=i.ingcsc and a.hcsmstgr <> 'X' and  a.fsmfhrreg >= i2.ingfecmop

) Formulado,
(select sum(ifnull(dsp1.dsmcntmov,0))
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop -- and dsp.msreso=a.fsmmsreso 
) DESPACHADO,
(
case when (
(select  sum(ifnull(a.FSmCntsol,0) )
from hosvital.FrmSmns a
where a.histipdoc = i.mptdoc and a.hisckey=i.mpcedu and    a.hictvin=i.ingcsc and a.hcsmstgr <> 'X'   and  a.fsmfhrreg >= i2.ingfecmop

) -
(select sum(ifnull(dsp1.dsmcntmov,0))
from hosvital.dspfrmc dsp
inner join hosvital.dspfrmc1 dsp1 on  (dsp1.histipdoc=dsp.histipdoc and dsp1.hisckey=dsp.hisckey  and dsp1.dsctvin1= dsp.dsctvin  and dsp1.hiscSEC= dsp.hiscSEC and dsp1.msreso=dsp.msreso and dsp1.dsmtpotrn ='DS')
where dsp.histipdoc=i.mptdoc and dsp.hisckey=i.mpcedu  and dsp.dsctvin= i.ingcsc and  dsp1.dsmfhrmov >= i2.ingfecmop -- and dsp.msreso=a.fsmmsreso
)) > 0 then 'Pendiente x Despachar' else 'Despachado' end

) Farmacia,
(select case when count(*)  = 0 then 'Rojo' else 'Verde' end from hosvital.hccom51 h51 
 where h51.histipdoc = cap.mptdoc and h51.hisckey = cap.mpcedu and h51.hctvin51 = i.ingcsc and h51. hcprcEst IN ('O','E','A','I') and h51.hcfchrord > i2.ingfecmop

) ApoyosComplementarios,
(

select (sum(f.fsmcntsol)  - sum(ifnull(f1.hcsumcns,0)) ) No_Aplico
from hosvital.frmsmns f
inner join hosvital.frmsmns1 f1 on (f1.histipdoc= f.histipdoc and f1.hisckey = f.hisckey and f1.hiscsec=f.hiscsec and f1.mscodi=f.mscodi and f1.msprac=f.msprac and f1.msform=f.msform and f1.cnccd=f.cnccd and f1.hcsumest='A')
inner join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc= f.histipdoc and dsp1.hisckey = f.hisckey and dsp1.hiscsec=f.hiscsec and dsp1.msreso=f.fsmmsreso)
where f.histipdoc= i.mptdoc and f.hisckey = i.mpcedu and f.hictvin = i.ingcsc and
 f1.hcsumcns = (select max(f11.hcsumcns) from hosvital.frmsmns1 f11 where f11.histipdoc= f.histipdoc and f11.hisckey = f.hisckey and f11.hiscsec=f.hiscsec and f11.mscodi=f.mscodi and f11.msprac=f.msprac and f11.msform=f.msform and f11.cnccd=f.cnccd and f11.hcsumest='A')
) Enfermeria_Aplica_Med,

 case when i.inginslc ='S' then 'Alta_Medica' else ' ' end  Alta_Medica,
'Pendientes_a_devolver',
(select case when count(*) >0 then 'Facturado' else '' end
from hosvital.maeate m
where m.mptdoc=i.mptdoc and m.mpcedu = i.mpcedu and m.mactving= i.ingcsc) Facturado,
'Boleta_salida' Boleta_Salida

from hosvital.ingresos i 
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu = i.mpcedu)
inner join hosvital.maepab1 maepab1 on (maepab1.mpudoc=cap.mptdoc and maepab1.mpuced=cap.mpcedu and maepab1.mpctvin=i.ingcsc)
inner join hosvital.maepab mae on (mae.mpcodp= maepab1.mpcodp)
inner join hosvital.ingresomp i2 on (i2.mptdoc=i.mptdoc and i2.mpcedu=i.mpcedu and i2.ingcsc=i.ingcsc and i2.ingcodpab=maepab1.mpcodp and i2.ingcodcam=maepab1.mpnumc)
where mae.mpclapro=2   and  mae.mpnomp liKe ('%HOSP%')  AND mae.mpnomp NOT LIKE ('%QUIR%') AND mae.mpnomp NOT LIKE ('%REANI%') AND mae.mpnomp NOT LIKE ('%CIRU%')
 -- and i.mpcedu='1013652059' and i.ingcsc= 5
order by i.mpcedu;
-- order by mae.mpnomp , maepab1.mpnumc;
--f.hisckey='1013652059'
--- HOSPITALIZACION 4 NORTE       	415-A	2020-10-04 20:58:45.000000	2020-10-04 03:52:15.000000	32429665       	OLIVA  GONZALEZ DE URIBE                                                 	0001-01-01 00:00:00.000000	N	Rojo	-- Verde	Verde	5867.00	1232.00	
-- FORMULADO
-- 32429665       	5867.00
-- DESPACHADO	
--32429665       	1232.00

-- HOSPITALIZACIÓN 7 NORTE       	765  	2020-10-24 14:59:13.000000	2020-10-22 11:54:19.000000	1000809343     	ERIC ANDREY CRUZ TORRES                                                  	2	0001-01-01 00:00:00.000000	N	--Rojo	Verde	Verde	263.00	291.00	Despachado	Rojo	
--HOSPITALIZACION 5 SUR           	508-S	2020-10-27 22:54:07.000000	2020-10-27 07:02:36.000000	1001274568     	JAHIDER ESTIBEN CASTILLO ROJAS                                           	1	2020-10-28 11:40:01.000000	S	Rojo	--Verde	Verde	60.00	79.00	Despachado	Verde	
	

SELECT * FROM HOSVITAL.HCCOM51 WHERE HISCKEY='1000809343'  AND HCFCHRORD  >='2020-10-24 14:59:13.0000';
SELECT * FROM HOSVITAL.HCCOM51 WHERE HISCKEY='1001274568'  AND HCFCHRORD  >='2020-10-27 22:54:07.0000';
-- Intentemos Agrupado por paciente MEDICAMENTOS

select * from hosvital.FrmSmns1  where hisckey='32429665' ; -- and hictvin=7 and fsmmsreso= '0019A11A' and hcsmstgr <> 'X' order by hiscsec; 
select * from hosvital.FrmSmns  where fsmfhrreg>='2020-04-01 00:00:00' AND fsmfhrreg<='2020-12-03 23:59:59' and hisckey='32429665' and hictvin=7 and fsmmsreso= '0019A11A'  and hcsmstgr <> 'X' and hiscsec=399; -- hictvin
select * from hosvital.dspfrmc  where hisckey='32429665' and dsctvin=7 and msreso='0019A11A' ; -- and hiscsec=399;  -- dsctvin
select histipdoc,hisckey,hiscsec,msreso,dsmtpotrn, dsmcntmov from hosvital.dspfrmc1  where hisckey='32429665' and dsctvin1 = 7 and msreso= '0019A11A'  and dsmtpotrn='DS' order by hiscsec ;--  and hiscsec=399 ; -- and hiscsec=399 order by msreso ;  -- dsctvin1

SELECT SUM(DSMCNTMOV)  -- 49
 from hosvital.dspfrmc1  where hisckey='32429665' and dsctvin1 = 7 and msreso= '0019A11A' AND DSMTPOTRN='DS' ;

-- Query propuesto medicamentos    

select a.hisckey, a.fsmmsreso,sum(ifnull(a.FSMCNTSOL,0) ),  sum(ifnull(a.FSmCntDia,0) ),sum(ifnull(dsp1.dsmcntmov,0))
from hosvital.FrmSmns a
left  join hosvital.dspfrmc1 dsp1 on (dsp1.histipdoc=a.histipdoc and dsp1.hisckey=a.hisckey and dsp1.dsctvin1= a.hictvin and dsp1.hiscSEC= a.hiscSEC and dsp1.msreso=a.fsmmsreso and dsp1.dsmtpotrn ='DS')
where    a.fsmfhrreg>='2020-04-01 00:00:00' AND a.fsmfhrreg<='2020-12-03 23:59:59' and  a.hisckey='32429665' and a.hictvin=7  and a.hcsmstgr <> 'X'   
and a.fsmmsreso='0019A11A' --  and a.hiscsec=399
group by a.hisckey, a.fsmmsreso;

select a.hisckey, sum(ifnull(a.FSMCNTSOL,0) )
from hosvital.FrmSmns a
where    a.fsmfhrreg>='2020-04-01 00:00:00' AND a.fsmfhrreg<='2020-12-03 23:59:59' and  a.hisckey='4326781' and a.hictvin=12  and a.hcsmstgr <> 'X'   
group by a.hisckey;

select a.hisckey, sum(ifnull(a.dsmcntmov,0))
from hosvital.DSPFRMC1 a
where   a.hisckey='4326781' and a.dsctvin1=12  and a.dsmtpotrn ='DS'  
group by a.hisckey;

-- Tintero
-- Lo que dice Yeison, Actualizar querys, solo piso y desde que llega apiso
-- seguir con el analisais de cantidad ordenada

