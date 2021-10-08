-- Primero cnseguir los folios del paciente a listar de acuerdo supongo a un rango de fechas

select histipdoc,hisckey, hiscsec from hosvital.hccom1 h1 where  h1.histipdoc='CC' and h1.hisckey='20106205' and hisfhorat >='2021-01-01 00:00:00' and hisfhorat <='2021-12-31 23:59:59' order by hiscsec;

-- Cabezote . Datos del paciente debe ir improeso al comienzo de cada pagina

-- Cuales son los estado civiles
-- Problema cual es el ingreso a tomar  ? hccom1 o ingresos cual tabla ara revisar el contrato
-- grupo sanguineo
-- Esta encadenaod al minimo ingreso


select cap.mptdoc, cap.mpcedu , cap.mpnomc , maeemp.menomb as empresa ,   maetpa3.mtnomp as afiliado, varchar_format(cap.mpfchn ,'dd/mm/yyyy') as fecha_nacimiento , concat((days(current_date) - days(date(cap.mpfchn)))/365, ' AÑOS') as edad_actual, case when cap.mpsexo='M' then 'Masculino'  when cap.mpsexo='F' then 'Femenino' end  as sexo, cap.MPTipAfi	  as grupo_sanguineo,    case when cap.MPEstC= 'C' THEN 'Casado'      when cap.MPEstC= 'S' THEN 'Soltero'  when cap.MPEstC= 'U' THEN 'Union Libre'  when cap.MPEstC= 'V' THEN 'Viudo'  when cap.MPEstC= 'P' THEN ''  when cap.MPEstC= 'O' THEN ''        ELSE ''        end          as estado_civil,     cap.mptele as telefono,cap.mpdire as direccion,   mb2.mdnomb barrio,     
mb.mdnomd departamento ,mb1.mdnomm municipio,    ocu.modesc  as ocupacion,et.mpdscet etnia, et1.mpdnetn  as grupo_etnico,                niv.niveddsc nivel_educativo,ate.ateespdes atencion_especial,
dis.discdsc discapacidad,pob.GruPobDes grupo_poblacional, concat(concat(concat(concat(concat(concat(i.ingnmresp ,' '),i.ingnmresp2),' '), i.ingapres),' '),i.ingapres2)  as responsable,  i.ingtelresp    as telefono,case when i.ingparresp='H' then'HIJO' when i.ingparresp='P' then'Padre'  end     as parentesco,i.ingnoac as acompanante,  i.ingteac as  telefono_acompanante 
from hosvital.capbas cap
inner join hosvital.maedmb mb on (mb.mdcodd= cap.mdcodd)
inner join hosvital.maedmb1 mb1 on (mb1.mdcodd= mb.mdcodd and  mb1.mdcodm = cap.mdcodm)
inner join hosvital.maedmb2 mb2 on (mb2.mdcodd= mb1.mdcodd and  mb2.mdcodm = mb1.mdcodm and mb2.mdcodb = cap.mdcodb)
inner join hosvital.etnias et on (et.mpcodet= cap.mpcpetn)
inner join hosvital.etnias1 et1 on (et1.mpcodet = cap.MPCPEtn	)
--inner join hosvital.hccom1 h1 on (h1.histipdoc= cap.mptdoc and h1.hisckey=cap.mpcedu and  h1.hiscsec = 1)
inner join hosvital.ingresos i on (i.mptdoc =cap.mptdoc and i.mpcedu=cap.mpcedu and  i.ingcsc=( select  min(i2.ingcsc) from hosvital.ingresos i2 where i2.mptdoc = i.mptdoc and i2.mpcedu=i.mpcedu))
inner join hosvital.maeemp maeemp on (maeemp.mennit = i.ingnit)
inner join hosvital.nivedu niv on (niv.nivedco= cap.mpnivedu)
left join hosvital.maeocu ocu on (ocu.mocodi=cap.MOCodPri)
inner join hosvital.GruPob pob on (pob.GruPobCod= cap.MPGrPo)
inner join hosvital.discpac dis on (dis.disccod = cap.MPCodDisc)
inner join hosvital.ateesp ate on (ate.ateespcod = cap.MPGrEs)
-- inner join hosvital.nivlate nv on (nv.nivcod = i.nivcod)
inner join hosvital.maepac  maepac on (maepac.mptdoc = i.mptdoc and maepac.mpcedu=i.mpcedu and maepac.mennit= i.ingnit)
inner join hosvital.maetpa3 maetpa3 on (maetpa3.mtucod=maepac.mtucod and maetpa3.mtcodp=maepac.mtcodp)
where cap.mptdoc ='CC' and cap.mpcedu ='79338503';


-- Triage
--  Falta la prioridad del triage , de donde debe salir ?

select h1.hiscsec as folio,h1.hisfhorat as fecha_folio, 'TRIAGE' ,  h1.hiscltr as triage, des.hisdesdet as observaciones, h1.hiscltr as clasificacion_triage, '' as triage_prioridad
 from hosvital.hccom1 h1
inner join hosvital.hccom1des des on (des.histipdoc=h1.histipdoc and des.hisckey=h1.hisckey and des.hiscsec= h1.hiscsec)
where h1.histipdoc='CC' and h1.hisckey='19245411' and h1.hiscsec=104 and h1.fhcindesp='TR';


-- Evoluciones - Consultas, Revision, soap  etc Medica:

select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,
case when des1.hisdesatr='HISCMOTCON' then 'MOTIVO DE CONSULTA'  when des1.hisdesatr='FHCOBSTRG' then 'OBSERVACIONES'  when des1.hisdesatr='HISCEXFIS2' then 'EXAMEN FISICO'  when des1.hisdesatr='EVODESA' then 'ANALISIS'  when des1.hisdesatr='EVODESP' then 'PLAN Y MANEJO' when des1.hisdesatr='EVODESO' then 'OBJETIVO' when des1.hisdesatr='EVODESS' then 'SUBJETIVO' when des1.hisdesatr='HISCREVSI2' then 'REVISION X SISTEMAS'  
when des1.hisdesatr='HISCEXFIS3' then 'EXAMEN FISICO 3' when des1.hisdesatr='HISCEXFIS4' then 'EXAMEN FISICO 4' when des1.hisdesatr='HISCEXFIS5' then 'EXAMEN FISICO 5' when des1.hisdesatr='HISCEXFIS6' then 'EXAMEN FISICO 6' when des1.hisdesatr='HISCEXFIS9' then 'EXAMEN FISICO 9' when des1.hisdesatr='HISCEXFI10' then 'EXAMEN FISICO 10' when des1.hisdesatr='HISCEXFI11' then 'EXAMEN FISICO 11' when des1.hisdesatr='HISCEXFI12' then 'EXAMEN FISICO 12' when des1.hisdesatr='HISCEXFI13' then 'EXAMEN FISICO 13' when des1.hisdesatr='HISCEXFI14' then 'EXAMEN FISICO 14' when des1.hisdesatr='HISCEXFI15' then 'EXAMEN FISICO 15' when des1.hisdesatr='HISCREVSI4' then 'REVISION 4' when des1.hisdesatr='HISCREVSI6' then 'REVISION 6' when des1.hisdesatr='HISCREVSI7' then 'REVISION 7' when des1.hisdesatr='HISCREVSI8' then 'REVISION 8' when des1.hisdesatr='HISCREVSI9' then 'REVISION 9' 
when des1.hisdesatr='HISCREVSI10' then 'REVISION 10' when des1.hisdesatr='HISCREVSI11' then 'REVISION 11' when des1.hisdesatr='HISCREVSI12' then 'REVISION 12' when des1.hisdesatr='HISCREVSI13' then 'REVISION 13' 
when des1.hisdesatr='HISCREVS14' then 'REVISION 14' when des1.hisdesatr='HISCREVSI15' then 'REVISION 15'  END , des1.hisdesdet as descripcion,   h1.hiscenfact as enfermedad_actual
from  hosvital.hccom1des des1
left join hosvital.hccom1 h1 on (h1.histipdoc=des1.histipdoc and h1.hisckey=des1.hisckey and h1.hiscsec = des1.hiscsec)
where des1.histipdoc='CC' and des1.hisckey='79338503' and des1.hiscsec=1 and h1.fhcindesp IN ('GN')
union
select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,
'EVOLUCION MEDICA' , H33.evodes as descripcion,   h1.hiscenfact as enfermedad_actual
from   hosvital.hccom1 h1 
left join hosvital.hccom33 h33 on (h33.histipdoc=h1.histipdoc and h33.hisckey=h1.hisckey and h33.hiscsec = h1.hiscsec)
where h1.histipdoc='CC' and h1.hisckey='79338503' and h1.hiscsec=1 and h1.fhcindesp IN ('GN');


-- Diagnosticos :

SELECT * FROM HOSVITAL.HCDIAGN WHERE hisckey='79338503' and hiscsec =766;

select  hc.histipdoc,hc.hisckey,hc.hiscsec as folio, hc.hcdxcod, m.dmnomb, case when hc.hcdxcls=2 then 'DESCARTADO'  when hc.hcdxcls=1 then 'PRINCIPAL' when hc.hcdxcls=0 then 'RELACIONADO'  END
from hosvital.hcdiagn hc 
inner join hosvital.maedia m on (m.dmcodi= hc.hcdxcod)
where hc.histipdoc='CC' and hc.hisckey='79338503' and hc.hiscsec =766
order by hc.hcdxcls, hc.hccnsdx ;

-- Registro Medico

select  h1.hiscsec as folio,mae.mmnomm, mae.mmregm as reg,esp.menome, mae.mmfirma
from hosvital.hccom1 h1 
INNER JOIN HOSVITAL.MaEMED1 MAE on (mae.mmcodm = h1.hiscmmed)
inner join hosvital.maeesp esp on (esp.mecode= h1.hcesp)
where  h1.histipdoc='CC' and h1.hisckey='79338503' and h1.hiscsec = 1;


-- Notas de Enfermeria

select h1.hiscsec as folio, h1.hisfhorat as fecha_folio, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,
h33.evodes,'Nota realizada por:' ,maemed1.mmnomm,concat(concat(cast(h33.evofec as varchar(10)),' '),h33.evohor)
from hosvital.hccom1 h1 
left join  hosvital.hccom33 h33 on (h33.histipdoc=h1.histipdoc and h33.hisckey=h1.hisckey and h33.hiscsec = h1.hiscsec )
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm=h33.evomed)
where h1.histipdoc='CC' and h1.hisckey='79338503'  -- and h1.hiscsec = 19 
and h1.fhcindesp IN ('EN')
order by h1.hiscsec;

-- Registro Medico

select  mae.mmnomm, mae.mmregm as reg,esp.menome
from hosvital.hccom1 h1 
INNER JOIN HOSVITAL.MaEMED1 MAE on (mae.mmcodm = h1.hiscmmed)
inner join hosvital.maeesp esp on (esp.mecode= h1.hcesp)
where  h1.histipdoc='CC' and  h1.hisckey='51945773' and h1.hiscsec = 9;

-- Formatos
select * from hosvital.encues;
select * from hosvital.encues1;
select * from hosvital.encuesp;
select * from hosvital.encuess;
select * from hosvital.encues1;
select * from hosvital.encues2;
select * from hosvital.encues3;
select * from hosvital.encues4;


select * from hosvital.hccom1 h1 where  h1.histipdoc='CC' and h1.hisckey='19245411'  and h1.hiscsec =27; 
select * from hosvital.hccom1des h1 where  h1.histipdoc='CC' and h1.hisckey='19245411'  and h1.hiscsec =27; 
select * from hosvital.resencu  where restdopac='CC' and resdocpac='19245411'  and resfolpac =27; 

-- Formulacion Medica

select  a.hiscsec as folio, h1.hisfhorat fecha,  a.fsmcntdia as cantidad, concat(concat(a.hiscansum , ' ')   , u.unmddes)     as Dosis, a.fsmdscmdc as descripcion,via.viapldsc as via,  
case when a.hcfsfrh = 99  then 'Infusion Continua'  when a.hcfsfrh = 95 then 'Ahora' when a.hcfsfrh = 93  then 'Dosis Unica'  when a.hcfsfrh = 24 then '24 Horas' when a.hcfsfrh = 12 then '12 Horas'  when a.hcfsfrh = 8 then '8 Horas' when a.hcfsfrh = 6 then '6 Horas' when a.hcfsfrh = 4 then '4 Horas'  when a.hcfsfrh = 91 then '1 Hora'  when a.hcfsfrh = 1 then '1 Hora'   else cast(a.hcfsfrh as varchar(10)) end  as frecuencia,
case when a.hcsmstgr = 'O' then 'Nuevo'  when a.hcsmstgr = 'S' then 'Suspendido'   when a.hcsmstgr = 'M' then 'Modificado'   when a.hcsmstgr = 'C' then 'Continuar'   when a.hcsmstgr = 'D' then ''                     
  when a.hcsmstgr = 'N' then 'Sin Cambios'     when a.hcsmstgr = 'A' then ''   when a.hcsmstgr = 'N' then 'Nuevo' END ACCION
from hosvital.FrmSmns as a 
inner join hosvital.undmedi u on (u.unmdcod=a.hcsmundcd)
inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
inner join hosvital.hccom1 h1 on (h1.histipdoc = a.histipdoc and h1.hisckey=a.hisckey  and h1.hiscsec=a.hiscsec )
where  a.histipdoc='CC' and  a.hisckey='79338503'  -- and a.hiscsec =833 
and a.hcsmstgr <> 'X' order by a.hiscsec; 

-- Registro Medico

select  mae.mmnomm, mae.mmregm as reg,esp.menome
from hosvital.hccom1 h1 
INNER JOIN HOSVITAL.MaEMED1 MAE on (mae.mmcodm = h1.hiscmmed)
inner join hosvital.maeesp esp on (esp.mecode= h1.hcesp)
where  h1.histipdoc='CC' and h1.hisckey='51895509' and h1.hiscsec = 503;

-- Cirugias

-- Cirugias Canceladas

select h1.histipdoc,h1.hisckey,h1.hiscsec folio,h1.hisfhorat as fecha,case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end,
h5.hiscpcan cantidad,pro.prnomb as descripcion,  'Cancelado' as Cancelado,'Medico' AS MOTIVO_CANCELACION,h51.hcobscan as observaciones,concat(concat(maemed1.mmnomm,'-RM: '), maemed1.mmregm) as usuario_cancela,h51.hcprfhcad as fecha_cancelacion, h5.hiscpobs
from hosvital.hccom1 h1
inner join hosvital.hccom5 h5 on (h5.histipdoc=h1.histipdoc and h5.hisckey=h1.hisckey  and h5.hiscsec=h1.hiscsec and h5.hcprctip= 5 and h5.hcprstgr='C')
inner join hosvital.hccom51 h51 on (h51.histipdoc= h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec=h5.hiscsec and h51.hcprccod= h5.hcprccod)
inner join hosvital.maepro pro on (pro.prcodi=h51.hcprccod)
left join hosvital.maemed1 maemed1 on (maemed1.mmusuario=h51.hcpruscad)
 where  h1.histipdoc='CC' and h1.hisckey='79338503'  and h1.hiscsec =868
order by pro.prcodi;


-- Cirugias Realizadas

select p.procircod,h1.histipdoc,h1.hisckey,h1.hiscsec folio,h1.hisfhorat as fecha,case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,p1.crgcnt as cantidad,p1.crgcod codigo,m.prnomb descripcion, 
(
select m2.mpngrp 
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac)
where m.mptdoc=h1.histipdoc  and m.mpcedu= h1.hisckey and m.mactving= h1.hctvin1 and m2.prcodi=p1.crgcod AND m2.MAHONCOD='01'
group by m2.mpngrp
) as Grupo_Quirurgico_facturado, 
(select t1.tfngrp
from hosvital.tmpfac t
inner join hosvital.tmpfac1 t1 on (t1.tftdoc = t.tftdoc and t1.tfcedu=t.tfcedu and t1.tmctving= t.tmctving  and  t1.tfptpotrn = 'F' AND t1.tfhnrcod='01' )
where  t.tftdoc =h1.histipdoc  and t.tfcedu= h1.hisckey and t.tmctving= h1.hctvin1   and t1.tfprc1=p1.crgcod
group by t1.tfngrp
) as Grupo_Quirurgico_acostado, 
concat(concat (m1.mmcodm,' ') , m1.mmnomm) as medico, esp.menome as especialidad,  
m11.mmcodm ,m11.mmnomm medico_cirugia, esp11.menome as especialida,
edia.dmcodi,edia.dmnomb as diag_preoperatorio,edia11.dmcodi,edia11.dmnomb as diag_postoperatorio,
case when d.tipher=1 then 'LIMPIA' when d.tipher=2 then 'LIMPIA CONTAMINADA' else 'Otra' end  as tipo_herida,case   when d.tipane='S' then 'SEDACION'  when d.tipane='G' then 'GENERAL'  when d.tipane='R' then 'REGIONAL' when d.tipane='L' then 'LOCAL' else 'Otro tipo' end  as tipo_anestesia,
'tipo_cirugia', d.cansan as cantidad_sangrado,'ml',case when d.viaing='D' then 'Diferente Via'  when d.viaing='U' then 'Unica Via'  end  as Via,v.viadsc as via,
 d.fecinicir as Realizacion_acto_Quirurgico, d.horinicir as hora_inicio, d.horfincir as  hora_final,
 tieper as tiempo_perfusion,d.tieclamp as tiempo_clamp, 'Minuto',
d.descir as descripcion_quirurgica,case  when d.DesIndCom ='N' then 'No' when d.DesIndCom ='S' then 'Si'  end as Complicaciones, d.deshalenc as hallazgos, case when tej.coddestej  <> '' then 'Si' else 'No' end as enviado_a_patologia, tej.coddestej
from hosvital.hccom1 h1
inner  join hosvital.procir p on (p.mptdoc = h1.histipdoc and p.mpcedu=h1.hisckey and p.proctvin = h1.hctvin1 and p.proflicx = h1.hiscsec )
inner join hosvital.procir1 p1 on (p1.procircod=p.procircod)
inner join hosvital.maepro m on (m.prcodi=p1.crgcod)
inner join hosvital.procir2 p2 on (p2.procircod=p1.procircod and p2.perstip='01')
inner join hosvital.maemed1 m1 on (m1.mmcodm = p2.perscod )
inner join hosvital.maeesp esp on (esp.mecode=p2.persesp)
inner join hosvital.vias v on (v.viacod  = p1.viacod)
inner join hosvital.descirmed d on (d.codcir = p.procircod)	
inner join hosvital.maemed1 m11 on (m11.mmcodm = d.codmed)
inner join hosvital.maeesp esp11 on (esp11.mecode=d.codesp)
inner join hosvital.maedia edia on (edia.dmcodi=d.diaent)
inner join hosvital.maedia edia11 on (edia11.dmcodi=d.diasal)
left   join hosvital.DesCirTej  tej on (tej.codcir=d.codcir)	
 where  h1.histipdoc='CC' and h1.hisckey='79338503'  --and h1.hiscsec =19
order by h1.hiscsec; 

-- Participantes a la cirugia

select h1.histipdoc,h1.hisckey,h1.hiscsec,p2.perscod,maemed1.mmnomm, case when p2.perstip='01' then 'Especialista Qx' when p2.perstip='05' then 'Ayudante' when p2.perstip='07' then 'Instrumentador' when p2.perstip='04' then 'Anestesiologo' end tipo, case when p2.persest='S' then 'Si' when p2.persest='N' then 'No'  else '' end participo
from hosvital.hccom1 h1
inner join hosvital.procir p on (p.mptdoc = h1.histipdoc and p.mpcedu=h1.hisckey and p.proctvin = h1.hctvin1 and p.proflicx = h1.hiscsec )
inner join hosvital.procir2 p2 on (p2.procircod=p.procircod)
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm = p2.perscod)
where  h1.histipdoc='CC' and h1.hisckey='79338503' and h1.hiscsec =765
order by p2.perscod; 


-- Registro Medico

select  H1.HISCSEC AS FOLIO, mae.mmnomm, mae.mmregm as reg,esp.menome
from hosvital.hccom1 h1 
inner JOIN HOSVITAL.MaEMED1 MAE on (mae.mmcodm = h1.hiscmmed)
inner join hosvital.maeesp esp on (esp.mecode= h1.hcesp)
where  h1.histipdoc='CC' and h1.hisckey='51945773' and h1.hiscsec = 11;

-- ParaClinicos

-- Laboratorios

-- Pendiente colocar uniodades ejemplo : mg/dl
-- No lista los Cancelados, folio 833 ver como cambiar la forma del quey parta que muestre todos

select h1.hiscsec as folio, h5.hcprccod, h1.hisfhorat as fecha_folio, h5.hiscpcan cantidad ,maepro.prnomb as descripcion,   h5.hiscpobs descripcion,case when h5.hcprstgr='C' THEN 'Cancelado'   when h5.hcprstgr='N' THEN 'No se realizo' when h5.hcprstgr='E' THEN 'En Proceso'    when h5.hcprstgr='A' THEN 'Realizado'   when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END as estado,
 r51.hcfechres as fecha_hora_aplicacion ,resul.reddesca  as resultados,  resul.redresu valor, resul.redvalrf referencia,concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm as interpretado_por, h51.hcfehint fecha_interpreta, h51.hcintres interpretacion
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod)
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.hccom51R  r51 on (r51.histipdoc=h5.histipdoc and r51.hisckey=h1.hisckey and r51.hiscsec= h5.hiscsec and r51.hcprccns =  h51.hcprccns and r51.hcprccod = h5.hcprccod )
left join  interlab.detresu resul on (  substring(resul.orclin,(locate(' ',resul.orclin) + 1),2) = h5.histipdoc and  substring(resul.orclin,1,(locate(' ',resul.orclin) -1))    =  h5.hisckey and substring(resul.orclin,  (locate(' ',resul.orclin) + 4), 11) = cast(h5.hiscsec as varchar(11))    and resul.ordcodex = h5.hcprccod)
left   join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs)
wHere  h5.histipdoc='CC' and h5. hisckey='20106205' and h5.hiscsec=837 
and h5.hcprctip =  2 
order by h5.hcprccod,resul.reddesca;

--  Procedimientos No Qx

select h1.hiscsec as folio, h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb,
h5.hiscpobs descripcion,case  when h5.hcprstgr='C' THEN 'Cancelado'  when h5.hcprstgr='N' THEN 'No se realizo'    when h5.hcprstgr='E' THEN 'En Proceso'  when h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  when h5.hcprstgr='E' THEN 'Pendiente' END estado, 
r51.hcfechres as fecha_y_hora_aplicacion,  concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por,
maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta, h51.hcintres as interpretacion, h51.hcresult resultados ,case when h51.hcintres='' then des2.hcdscatr else h51.hcintres end
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod)
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
left join hosvital.hccom51R  r51 on (r51.histipdoc=h5.histipdoc and r51.hisckey=h1.hisckey and r51.hiscsec= h5.hiscsec and r51.hcprccns =  h51.hcprccns  and r51.hcprccod = h5.hcprccod)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs)
left join hosvital.hccom2des des2 on (des2.histipdoc=h51.histipdoc and des2.hisckey=h51.hisckey and des2.hiscsec= h51.hiscsec and des2.hcprccod = h51.hcprccod and des2.hcprccns =  h51.hcprccns and des2.hcdesatr='HCResult' )
wHere  h5.histipdoc='CC' and h5. hisckey='51945773' and h5.hiscsec=555  and  h5.hcprctip =  4 
order by h5.hcprccod;

-- Imagenologia
-- Ojo hay ERROR AQUI revisar . Faltan  2 examenes pendientes
---555/539/
select * from hosvital.hccom5 where hisckey='51945773' and hiscsec=583  order by hcprccod;    -- hay una sola orden
select * from hosvital.hccom51 where hisckey='51945773' and hiscsec=583 order by hcprccod;   -- hay una sola orden
select * from hosvital.hccom51r where hisckey='51945773' and hiscsec=555 order by hcprccod;  -- hay dos resultados
select * from hosvital.hccom2des where hisckey='51945773' and hiscsec=539 ;

select h1.hiscsec as folio,h5.hcprccod , r51.hcprccns  ,  h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb as descripcion,case when h5.hcprstgr='C' THEN 'Cancelado'   when h5.hcprstgr='N' THEN 'No se realizo'   when h5.hcprstgr='E' THEN 'En Proceso'  when  h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END estado, 
h5.hiscpobs ,
r51.hcfechres as fecha_y_hora_aplicacion,des2.hcdscatr resultados,concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta, h51.hcintres interpretacion
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod)
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
left   join hosvital.hccom51R  r51 on (r51.histipdoc=h5.histipdoc and r51.hisckey=h1.hisckey and r51.hiscsec= h5.hiscsec and r51.hcprccns =  h51.hcprccns and r51.hcprccod = h5.hcprccod
and r51.hcconres = (select max(h511r.hcconres) from hosvital.hccom51r  h511r where h511r.histipdoc=h5.histipdoc and
h511r. hisckey=h5.hisckey and h511r.hiscsec = h5.hiscsec and h511r.hcprccod = r51.hcprccod))
left join hosvital.hccom2des des2 on (des2.histipdoc=h5.histipdoc and des2.hisckey=h1.hisckey and des2.hiscsec= h5.hiscsec and des2.hcprccod = h5.hcprccod and des2.hcprccns =  h51.hcprccns and des2.hcdesatr='HCResult'   )
left join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs)
wHere  h5.histipdoc='CC' and h5. hisckey='51945773' and h5.hiscsec=1048  and  h5.hcprctip =  1 and h51.hcprccns  = (select max(h511.hcprccns) from hosvital.hccom51 h511 where h511.histipdoc=h51.histipdoc and h511.hisckey=h51.hisckey and  h511.hiscsec=h51.hiscsec and h511.hcprccod = h51.hcprccod)
order by 2 ;

--Terapias
-- Falta el detalle de los resultados d los gases arteraile or ejemplo
-- Nota hay unos resultados que no salen


select h1.hiscsec as folio,  h5.hcprccod ,h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb,case when h5.hcprstgr='C' THEN 'Cancelado'  when h5.hcprstgr='N' THEN 'No se realizo'  when h5.hcprstgr='E' THEN 'En Proceso'  when h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END estado,
h5.hiscpobs descripcion, 
h51.hcfchrap  as fecha_y_hora_aplicacion, concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta,  h51.hcintres interpretacion, h51.hcresult resultados
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod  and h51.hcresult<>'')
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
inner join hosvital.hccom51R  r51 on (r51.histipdoc=h5.histipdoc and r51.hisckey=h1.hisckey and r51.hiscsec= h5.hiscsec and r51.hcprccns =  h51.hcprccns  and r51.hcprccod = h5.hcprccod)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs)
wHere  h5.histipdoc='CC' and h5. hisckey='20106205' and h5.hiscsec=593  and  h5.hcprctip =  3
UNION
select h1.hiscsec as folio,  h5.hcprccod, h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb,case when h5.hcprstgr='C' THEN 'Cancelado'  when h5.hcprstgr='N' THEN 'No se realizo' when h5.hcprstgr='E' THEN 'En Proceso' when h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END estado, 
h5.hiscpobs descripcion,
h51.hcfchrap  as fecha_y_hora_aplicacion,  concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta,  h51.hcintres interpretacion,des2.hcdscatr resultados
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod)
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.hccom2des des2 on (des2.histipdoc=h5.histipdoc and des2.hisckey=h1.hisckey and des2.hiscsec= h5.hiscsec and des2.hcprccod = h5.hcprccod and des2.hcprccns =  h51.hcprccns )
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs)
wHere  h5.histipdoc='CC' and h5. hisckey='20106205' and h5.hiscsec=555  and  h5.hcprctip =  3   and des2.hcdesatr='HCResult'
order by 2 ;

-- Interconsultas

select  h1.hiscsec as folio,  concat('INTERCONSULTA POR ',esp.menome ) Descripcion,  date(h1.hisfhorat) as fecha_orden,   case when i.intest='A' then 'Atendido'  when i.intest='O' then 'Ordenada' when i.intest='P' then 'Pendiente' end, i.intobsord OBSERVACIONES, i.intdscrsl as Resultados, i.intfchrsl, concat('RELIZADO POR ',maemed1.mmnomm) , concat('Reg: ', maemed1.mmregm ),esp.menome as especialidad
 from hosvital.intercn i
inner join hosvital.hccom1 h1 on (h1.histipdoc= i.histipdoc and h1.hisckey=i.hisckey and h1.hiscsec=i.hiscsec)
inner join hosvital.maeesp esp on (esp.mecode= i.mecode)
LEFT join hosvital.maemed1 maemed1 on (maemed1.mmusuario=i.intusrrsp)
where  i.histipdoc='CC' and i.hisckey='20106205' and i.hiscsec=557;
 
-- Incapacidades

SELECT 'CERTIFICADO DE INCAPCIDAD', cap.mpnomc as nombre, cap.mptdoc, cap.mpcedu, hc.hcdxcod, day(inc.incfecreg) as dia,month(inc.incfecreg) as mes,year(inc.incfecreg) as ano,'Ocupacion',
maeemp.menomb as empresa, caue.cedetall as tipo_incapacidad,cap.mpcedu as historia_clinica,inc.incfecini as fecha_inicia, inc.incfecfin as fecha_fin, IncDiaInc as dias_incapacidad ,    caue.cedetall  as causa_externa, case when inc.inctipate='01' then 'AMBULATORIA'    when inc.inctipate='02' then 'HOSPITALARIA'   when inc.inctipate='03' then 'URGENCIAS'  end as  tipo_atencion, 'procedimiento', 'Diagnostico a relacionar','fecha accidente de trabajo',
case when IncProAfi='N' then 'No'  when IncProAfi='S' then 'Si' end AS prorroga, 
'FUNDACION SAN CARLOS' AS EXPEDIDA_EN , ' ' AS EMPRESA_DONDE_TRABAJA, inc.IncObsMed AS OBSERVACION_PROFESIONAL, maemed1.mmnomm, maemed1.mmregm as Registro  , esp.menome as especialidad
FROM hosvital.hccom1 h1
inner join hosvital.incpac inc on (inc.inctipdoc= h1.histipdoc and inc.INCDOCAFI= h1.hisckey and inc.INCCODFOL= h1.hiscsec)
inner join hosvital.capbas cap on (cap.mptdoc = h1.histipdoc and cap.mpcedu=h1.hisckey)
inner join hosvital.hcdiagn  hc on (hc.histipdoc=h1.histipdoc and hc.hisckey=h1.hisckey and hc.hiscsec=h1.hiscsec)
inner join hosvital.ingresos i on (i.mptdoc = h1.histipdoc and i.mpcedu=h1.hisckey and i.ingcsc = h1.hctvin1)
inner join hosvital.maeemp maeemp on (maeemp.mennit=i.ingnit)
inner join hosvital.maemed1 maemed1 on (maemed1.mmusuario = inc.incusureg)
inner join hosvital.maeesp esp on (esp.mecode=inc.inccodesp)
inner join hosvital.maecaue caue  on (caue.cecodigo= inc.inccaue)
where h1.histipdoc='CC' AND h1.hisckey='51945773' and h1.hiscsec= 11;

