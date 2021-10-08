-- Primero cnseguir los folios del paciente a listar de acuerdo supongo a un rango de fechas

select histipdoc,hisckey, hiscsec from hosvital.hccom1 h1 where  h1.histipdoc='CC' and h1.hisckey='20106205' and hisfhorat >='2021-01-01 00:00:00' and hisfhorat <='2021-12-31 23:59:59' order by hiscsec;

-- Cabezote . Datos del paciente debe ir improeso al comienzo de cada pagina

-- Cual es la tabla de estado civiles
-- Problema cual es el ingreso a tomar  ? hccom1 o ingresos cual tabla ara revisar el contrato
-- grupo sanguineo
-- Esta encadenaod al minimo ingreso
SELECT MPEstC FROM HOSVITAL.CAPBAS  WHERE MPCEDU='19237826';

select cap.mptdoc, cap.mpcedu , cap.mpnomc , maeemp.menomb as empresa ,   maetpa3.mtnomp as afiliado, varchar_format(cap.mpfchn ,'dd/mm/yyyy') as fecha_nacimiento , concat((days(current_date) - days(date(cap.mpfchn)))/365, ' AÑOS') as edad_actual, case when cap.mpsexo='M' then 'Masculino'  when cap.mpsexo='F' then 'Femenino' end  as sexo, cap.MPTipAfi	  as grupo_sanguineo,   
 case when cap.MPEstC= 'C' THEN 'Casado'      when cap.MPEstC= 'S' THEN 'Soltero'  when cap.MPEstC= 'U' THEN 'Union Libre'  when cap.MPEstC= 'V' THEN 'Viudo'  when cap.MPEstC= 'P' THEN 'Separado'  when cap.MPEstC= 'O' THEN ''        ELSE ''        end          as estado_civil,     cap.mptele as telefono,cap.mpdire as direccion,   mb2.mdnomb barrio,     
mb.mdnomd departamento ,mb1.mdnomm municipio,    case when ocu.modesc is null then 'NINGUNA' else  ocu.modesc  end  as ocupacion,case when et.mpdscet is null then 'NO APLICA' else  et.mpdscet end  etnia, et1.mpdnetn  as grupo_etnico,       case when niv.niveddsc is null then 'NO APLIC' else  niv.niveddsc end nivel_educativo,ate.ateespdes atencion_espec0ial,
dis.discdsc discapacidad,pob.GruPobDes grupo_poblacional, concat(concat(concat(concat(concat(concat(i.ingnmresp ,' '),i.ingnmresp2),' '), i.ingapres),' '),i.ingapres2)  as responsable, 
 i.ingtelresp    as telefono,case when i.ingparresp='H' then'HIJO' when i.ingparresp='P' then'Padre'  when i.ingparresp='F' then 'Familiar'  end     as parentesco,i.ingnoac as acompanante,  i.ingteac as  telefono_acompanante 
from hosvital.capbas cap
inner join hosvital.maedmb mb on (mb.mdcodd= cap.mdcodd)
inner join hosvital.maedmb1 mb1 on (mb1.mdcodd= mb.mdcodd and  mb1.mdcodm = cap.mdcodm)
inner join hosvital.maedmb2 mb2 on (mb2.mdcodd= mb1.mdcodd and  mb2.mdcodm = mb1.mdcodm and mb2.mdcodb = cap.mdcodb)
left join hosvital.etnias et on (et.mpcodet= cap.mpcpetn)
left join hosvital.etnias1 et1 on (et1.mpcodet = cap.MPCPEtn)
--inner join hosvital.hccom1 h1 on (h1.histipdoc= cap.mptdoc and h1.hisckey=cap.mpcedu and  h1.hiscsec = 1)
inner join hosvital.ingresos i on (i.mptdoc =cap.mptdoc and i.mpcedu=cap.mpcedu and  i.ingcsc=( select  min(i2.ingcsc) from hosvital.ingresos i2 where i2.mptdoc = i.mptdoc and i2.mpcedu=i.mpcedu))
inner join hosvital.maeemp maeemp on (maeemp.mennit = i.ingnit)
left join hosvital.nivedu niv on (niv.nivedco= cap.mpnivedu)
left join hosvital.maeocu ocu on (ocu.mocodi=cap.MOCodPri)
left  join hosvital.GruPob pob on (pob.GruPobCod= cap.MPGrPo)
left join hosvital.discpac dis on (dis.disccod 	= cap.MPCodDisc)
left join hosvital.ateesp ate on (ate.ateespcod = cap.MPGrEs)
-- inner join hosvital.nivlate nv on (nv.nivcod = i.nivcod)
inner join hosvital.maepac  maepac on (maepac.mptdoc = i.mptdoc and maepac.mpcedu=i.mpcedu and maepac.mennit= i.ingnit)
inner join hosvital.maetpa3 maetpa3 on (maetpa3.mtucod=maepac.mtucod and maetpa3.mtcodp=maepac.mtcodp)
where cap.mptdoc ='CC' and cap.mpcedu ='19237826';

-- Triage


select h1.hiscsec as folio,h1.hisfhorat as fecha_folio, 'TRIAGE' ,  h1.hiscltr as triage, des.hisdesdet as observaciones, h1.hiscltr as clasificacion_triage,  gpo.diadscgru as triage_prioridad
 from hosvital.hccom1 h1
inner join hosvital.hccom1des des on (des.histipdoc=h1.histipdoc and des.hisckey=h1.hisckey and des.hiscsec= h1.hiscsec)
inner join hosvital.gpotria gpo on (gpo.diacodgru = h1.hiscltr)
where h1.histipdoc='CC' and h1.hisckey='19245411' and h1.hiscsec=104 and h1.fhcindesp='TR';


-- Evoluciones - Consultas, Revision, soap  etc Medica:

select h1.hiscsec as folio,h1.hisfhorat fecha, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,
case when des1.hisdesatr='HISCMOTCON' then 'MOTIVO DE CONSULTA'  when des1.hisdesatr='FHCOBSTRG' then 'OBSERVACIONES'  when des1.hisdesatr='HISCEXFIS2' then 'EXAMEN FISICO'  when des1.hisdesatr='EVODESA' then 'ANALISIS'  when des1.hisdesatr='EVODESP' then 'PLAN Y MANEJO' when des1.hisdesatr='EVODESO' then 'OBJETIVO' when des1.hisdesatr='EVODESS' then 'SUBJETIVO' when des1.hisdesatr='HISCREVSI2' then 'REVISION X SISTEMAS'  
when des1.hisdesatr='HISCEXFIS3' then 'EXAMEN FISICO 3' when des1.hisdesatr='HISCEXFIS4' then 'EXAMEN FISICO 4' when des1.hisdesatr='HISCEXFIS5' then 'EXAMEN FISICO 5' when des1.hisdesatr='HISCEXFIS6' then 'EXAMEN FISICO 6' when des1.hisdesatr='HISCEXFIS9' then 'EXAMEN FISICO 9' when des1.hisdesatr='HISCEXFI10' then 'EXAMEN FISICO 10' when des1.hisdesatr='HISCEXFI11' then 'EXAMEN FISICO 11' when des1.hisdesatr='HISCEXFI12' then 'EXAMEN FISICO 12' when des1.hisdesatr='HISCEXFI13' then 'EXAMEN FISICO 13' when des1.hisdesatr='HISCEXFI14' then 'EXAMEN FISICO 14' when des1.hisdesatr='HISCEXFI15' then 'EXAMEN FISICO 15' when des1.hisdesatr='HISCREVSI4' then 'REVISION 4' when des1.hisdesatr='HISCREVSI6' then 'REVISION 6' when des1.hisdesatr='HISCREVSI7' then 'REVISION 7' when des1.hisdesatr='HISCREVSI8' then 'REVISION 8' when des1.hisdesatr='HISCREVSI9' then 'REVISION 9' 
when des1.hisdesatr='HISCREVSI10' then 'REVISION 10' when des1.hisdesatr='HISCREVSI11' then 'REVISION 11' when des1.hisdesatr='HISCREVSI12' then 'REVISION 12' when des1.hisdesatr='HISCREVSI13' then 'REVISION 13' 
when des1.hisdesatr='HISCREVS14' then 'REVISION 14' when des1.hisdesatr='HISCREVSI15' then 'REVISION 15'  END , des1.hisdesdet as descripcion,   h1.hiscenfact as enfermedad_actual
from  hosvital.hccom1des des1
left join hosvital.hccom1 h1 on (h1.histipdoc=des1.histipdoc and h1.hisckey=des1.hisckey and h1.hiscsec = des1.hiscsec)
where des1.histipdoc='CC' and des1.hisckey='5812348' and des1.hiscsec=566 and h1.fhcindesp IN ('GN')
union
select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,
'EVOLUCION MEDICA' , H33.evodes as descripcion,   h1.hiscenfact as enfermedad_actual
from   hosvital.hccom1 h1 
left join hosvital.hccom33 h33 on (h33.histipdoc=h1.histipdoc and h33.hisckey=h1.hisckey and h33.hiscsec = h1.hiscsec)
where h1.histipdoc='CC' and h1.hisckey='5812348' and h1.hiscsec=566 and h1.fhcindesp IN ('GN');


-- Diagnosticos :

SELECT * FROM HOSVITAL.HCDIAGN WHERE hisckey='79338503' and hiscsec =766;

select  hc.histipdoc,hc.hisckey,hc.hiscsec as folio, hc.hcdxcod cod_dx, m.dmnomb diagnostico, case when hc.hcdxcls=2 then 'DESCARTADO'  when hc.hcdxcls=1 then 'PRINCIPAL' when hc.hcdxcls=0 then 'RELACIONADO'  END tipo
from hosvital.hcdiagn hc 
inner join hosvital.maedia m on (m.dmcodi= hc.hcdxcod)
where hc.histipdoc='CC' and hc.hisckey='21075328' and hc.hiscsec =2
order by hc.hcdxcls, hc.hccnsdx ;

-- Registro Medico

select  h1.hiscsec as folio,mae.mmnomm, mae.mmregm as reg,esp.menome, mae.mmfirma as ruta_firma
from hosvital.hccom1 h1 
INNER JOIN HOSVITAL.MaEMED1 MAE on (mae.mmcodm = h1.hiscmmed)
inner join hosvital.maeesp esp on (esp.mecode= h1.hcesp)
where  h1.histipdoc='CC' and h1.hisckey='21075328' and h1.hiscsec = 2;


-- Notas de Enfermeria

select h1.hiscsec as folio, h1.hisfhorat as fecha_folio, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,
h33.evodes EVOLUCION,'Nota realizada por:' NOTA1 ,maemed1.mmnomm ENFERMERA,concat(concat(cast(h33.evofec as varchar(10)),' '),h33.evohor) FECHA
from hosvital.hccom1 h1 
left join  hosvital.hccom33 h33 on (h33.histipdoc=h1.histipdoc and h33.hisckey=h1.hisckey and h33.hiscsec = h1.hiscsec )
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm=h33.evomed)
where h1.histipdoc='CC' and h1.hisckey='20106205'  and h1.hiscsec  IN (1040 ,1042,1043,1044)
and h1.fhcindesp IN ('EN')
order by h1.hiscsec;

-- Registro Medico

select  mae.mmnomm MEDICO, mae.mmregm as registro,esp.menome especialidad, mae.mmfirma as ruta_firma
from hosvital.hccom1 h1 
INNER JOIN HOSVITAL.MaEMED1 MAE on (mae.mmcodm = h1.hiscmmed)
inner join hosvital.maeesp esp on (esp.mecode= h1.hcesp)
where  h1.histipdoc='CC' and  h1.hisckey='51945773' and h1.hiscsec = 9;

-- Formatos:

-- Formato TADITR

select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,ep.enccod, e2.encpre, e1.encagrdsc, e2.encpredsc  , ''
from hosvital.encuesp  ep
inner join hosvital.hccom1 h1 on (h1.histipdoc='CC'  and h1.hisckey='21075328' and h1.hiscsec = 544)
inner join hosvital.encues1 e1 on (e1.empcod=ep.empcod and e1.enccod = ep.enccod)
inner join hosvital.encues2  e2 on (e2.empcod=e1.empcod and e2.enccod = e1.enccod and e2.encver= e1.encver and e2.encagrpr=  e1.encagrpr and e2.enculcit in (0,5) )
WHERE  e2.enccod='TADITR' --and e2.encpre in (15,16,17,18)     
union
select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,ep.enccod,   e2.encpre,  e1.encagrdsc, e2.encpredsc ,
( select   CASE when r1.resSele = '1' then 'NO' when r1.ressele = '0'  then 'SI' when r1.reSsele = '2'  then 'NOPIS' END
	FROM HOSVITAL.RESENCU r
	inner join hosvital.resencu1 r1 on (r1.empcod=r.empcod and r1.mcdpto = r.mcdpto and r1.encver=r.encver and r1.resctvre=r.resctvre )  
	inner  join hosvital.encues1  e1 on (e1.empcod=r.empcod and e1.enccod = r.enccod and e1.encver= r.encver)
	left join hosvital.encues2  e22 on (e22.empcod=e1.empcod and e22.enccod = e1.enccod and e22.encver= e1.encver and e22.encagrpr=  e1.encagrpr)
	inner join hosvital.encues3  e3 on (e3.empcod=e22.empcod and e3.enccod = e22.enccod and e3.encver= e22.encver and e3.encagrpr=  e22.encagrpr and e3.encpre=e22.encpre  and  e3.encctvres=r1.resencctv )
	left join hosvital.encues4  e4 on (e4.empcod=e3.empcod and e4.enccod = e3.enccod and e4.encver= e3.encver and e4.encagrpr=  e3.encagrpr and e4.encpre=e3.encpre and e4.encitmcns=r1.ressele AND E4.encctcore = r1.resencctv)
	WHERE r.restdopac='CC' AND r.RESDOCPAC='21075328' and r.resfolpac=544  and r1.empcod= e2.empcod and r1.enccod=e2.enccod and r1.encver= e2.encver  and  r1.resencctv = e2.encpre
	GROUP BY r1.ressele
)
from hosvital.encuesp  ep
inner join hosvital.hccom1 h1 on (h1.histipdoc='CC'  and h1.hisckey='21075328' and h1.hiscsec = 544)
inner join hosvital.encues1 e1 on (e1.empcod=ep.empcod and e1.enccod = ep.enccod)
inner join hosvital.encues2  e2 on (e2.empcod=e1.empcod and e2.enccod = e1.enccod and e2.encver= e1.encver and e2.encagrpr=  e1.encagrpr and e2.enculcit not in (0,5) )
WHERE  e2.enccod='TADITR' -- and e2.encpre in (17,18,20,23)
order by 1,2,3,4,5;   

-- Formato  LIMDES


select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,e1.empcod,e1.enccod, e1.ENCAGRDSC,
'' as valor1, ' ' as valor2, ' ' as valor3, ' ' as valor4
from hosvitaL.encues1 e1
INNER JoIN hosvital.hccom1 h1 on (1=1)
where  h1.histipdoc='CC'  and h1.hisckey='1000033893' and h1.hiscsec = 51 and e1.enccod='LIMDES'
union
select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,e1.empcod,e1.enccod, 'REALIZO LIMPIEZA Y DESINFECCION ? ',
'' as valor1, ' ' as valor2, ' ' as valor3, ' ' as valor4
from hosvitaL.encues1 e1
INNER JoIN hosvital.hccom1 h1 on (1=1)
where  h1.histipdoc='CC'  and h1.hisckey='1000033893' and h1.hiscsec = 51 and e1.enccod='LIMDES'
union
select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,e2.empcod,e2.enccod, e2.encpredsc,
(select e4.encitcdsc
 from hosvital.encues4 e4
where e4.empcod=r1.empcod and e4.enccod= r1.enccod and e4.encver=r1.encver and e4.encagrpr=e2.encagrpr and e4.encpre = e2.encpre   and  e4.encctcore = r1.resencctv and e4.encitmcns=1
),case when r1.ressele=0 then '-'  when r1.ressele=1 then 'X'  end,
(select e4.encitcdsc
 from hosvital.encues4 e4
where e4.empcod=r1.empcod and e4.enccod= r1.enccod and e4.encver=r1.encver and e4.encagrpr=e2.encagrpr and e4.encpre = e2.encpre  and  e4.encctcore = (r1.resencctv+1) and e4.encitmcns=2),
(select case when r11.ressele=0 then '-'  when r11.ressele=1 then 'X'  end
 from hosvital.resencu1 r11
where r11.empcod=r1.empcod and r11.enccod= r1.enccod and r11.encver=r1.encver  and r11.resctvre= r1.resctvre  and r11.resencctv = (r1.resencctv+1) )
from hosvital.resencu r
inner join hosvital.resencu1 r1 on (r1.empcod=r.empcod and r1.mcdpto=r.mcdpto and r1.enccod= r.enccod  and r1.encver=r.encver and r1.resctvre= r.resctvre)
inner join hosvital.encues2 e2 on (e2.empcod=r1.empcod and e2.enccod= r1.enccod and e2.encver=r1.encver and e2.encpredsc <> '.')
inner join hosvital.encues3 e3 on (e3.empcod=r1.empcod and e3.enccod= r1.enccod and e3.encver=r1.encver and e3.encagrpr = e2.encagrpr and e3.encpre= e2.encpre )
INNER JoIN hosvital.hccom1 h1 on (h1.histipdoc = r1.restdopac and h1.hisckey = r1.resdocpac and h1.hiscsec = r1.resfolpac )
inner join  hosvital.encues4  e4 on (e4.empcod=e3.empcod and e4.enccod= e3.enccod and e4.encver=e3.encver and e4.encagrpr = e3.encagrpr and e4.encpre= e3.encpre  and  e4.encctcore=r1.resencctv)
where   h1.histipdoc='CC'  and h1.hisckey='1000033893' and h1.hiscsec = 51 and e2.enccod='LIMDES' and e4.encitmcns=1;

-- Formato DISINV



-- Formulacion Medica

select  a.hiscsec as folio, h1.hisfhorat fecha,  a.fsmcntdia as cantidad, concat(concat(a.hiscansum , ' ')   , u.unmddes)     as Dosis, a.fsmdscmdc as descripcion,via.viapldsc as via,  
case when a.hcfsfrh = 99  then 'Infusion Continua'  when a.hcfsfrh = 95 then 'Ahora' when a.hcfsfrh = 93  then 'Dosis Unica'  when a.hcfsfrh = 24 then '24 Horas' when a.hcfsfrh = 12 then '12 Horas'  when a.hcfsfrh = 8 then '8 Horas' when a.hcfsfrh = 6 then '6 Horas' when a.hcfsfrh = 4 then '4 Horas'  when a.hcfsfrh = 91 then '1 Hora'  when a.hcfsfrh = 1 then '1 Hora'   else cast(a.hcfsfrh as varchar(10)) end  as frecuencia,
case when a.hcsmstgr = 'O' then 'Nuevo'  when a.hcsmstgr = 'S' then 'Suspendido'   when a.hcsmstgr = 'M' then 'Modificado'   when a.hcsmstgr = 'C' then 'Continuar'   when a.hcsmstgr = 'D' then ''                     
  when a.hcsmstgr = 'N' then 'Sin Cambios'     when a.hcsmstgr = 'A' then ''   when a.hcsmstgr = 'N' then 'Nuevo' END ACCION
from hosvital.FrmSmns as a 
inner join hosvital.undmedi u on (u.unmdcod=a.hcsmundcd)
inner join hosvital.maeviapl via on (via.viaplcod=a.hcfsvia)
inner join hosvital.hccom1 h1 on (h1.histipdoc = a.histipdoc and h1.hisckey=a.hisckey  and h1.hiscsec=a.hiscsec )
where  a.histipdoc='CC' and  a.hisckey='21075328'  and a.hiscsec =2 
and a.hcsmstgr <> 'X' order by a.hiscsec; 

-- Registro Medico

select  mae.mmnomm, mae.mmregm as reg,esp.menome, mae.mmfirma as ruta_firma
from hosvital.hccom1 h1 
INNER JOIN HOSVITAL.MaEMED1 MAE on (mae.mmcodm = h1.hiscmmed)
inner join hosvital.maeesp esp on (esp.mecode= h1.hcesp)
where  h1.histipdoc='CC' and h1.hisckey='51895509' and h1.hiscsec = 503;

-- Cirugias

-- Cirugias Canceladas


select h1.histipdoc,h1.hisckey,h1.hiscsec folio,h1.hisfhorat as fecha,case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end SERVICIO,
h5.hiscpcan cantidad,pro.prnomb as descripcion,  'Cancelado' as Cancelado, case when h51.hcmocntp='1' then 'Admistrativo' when h51.hcmocntp='3' then 'Medico'  end AS MOTIVO_CANCELACION,h51.hcobscan as observaciones,concat(concat(maemed1.mmnomm,'-RM: '), maemed1.mmregm) as usuario_cancela,h51.hcprfhcad as fecha_cancelacion, h5.hiscpobs
from hosvital.hccom1 h1
inner join hosvital.hccom5 h5 on (h5.histipdoc=h1.histipdoc and h5.hisckey=h1.hisckey  and h5.hiscsec=h1.hiscsec and h5.hcprctip= 5 )
inner join hosvital.hccom51 h51 on (h51.histipdoc= h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec=h5.hiscsec and h51.hcprccod= h5.hcprccod and h51.hcprCEST='C')
inner join hosvital.maepro pro on (pro.prcodi=h51.hcprccod)
left join hosvital.maemed1 maemed1 on (maemed1.mmusuario=h51.hcpruscad)
 where  h1.histipdoc='CC' and h1.hisckey='5039048'  and h1.hiscsec >=2
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
left join hosvital.procir2 p2 on (p2.procircod=p1.procircod and p2.perstip='01')
left join hosvital.maemed1 m1 on (m1.mmcodm = p2.perscod )
left join hosvital.maeesp esp on (esp.mecode=p2.persesp)
inner join hosvital.vias v on (v.viacod  = p1.viacod)
inner join hosvital.descirmed d on (d.codcir = p.procircod)	
inner join hosvital.maemed1 m11 on (m11.mmcodm = d.codmed)
inner join hosvital.maeesp esp11 on (esp11.mecode=d.codesp)
inner join hosvital.maedia edia on (edia.dmcodi=d.diaent)
inner join hosvital.maedia edia11 on (edia11.dmcodi=d.diasal)
left   join hosvital.DesCirTej  tej on (tej.codcir=d.codcir)	
where  h1.histipdoc='CC' and h1.hisckey='52384414'  and h1.hiscsec =57
order by h1.hiscsec; 

-- Participantes a la cirugia

select h1.histipdoc,h1.hisckey,h1.hiscsec,p2.perscod,maemed1.mmnomm, case when p2.perstip='01' then 'Especialista Qx' when p2.perstip='05' then 'Ayudante' when p2.perstip='07' then 'Instrumentador' when p2.perstip='04' then 'Anestesiologo' end tipo, case when p2.persest='S' then 'Si' when p2.persest='N' then 'No'  else '' end participo
from hosvital.hccom1 h1
inner join hosvital.procir p on (p.mptdoc = h1.histipdoc and p.mpcedu=h1.hisckey and p.proctvin = h1.hctvin1 and p.proflicx = h1.hiscsec )
inner join hosvital.procir2 p2 on (p2.procircod=p.procircod)
inner join hosvital.maemed1 maemed1 on (maemed1.mmcodm = p2.perscod)
where  h1.histipdoc='CC' and h1.hisckey='52384414' and h1.hiscsec =57
order by p2.perscod; 


-- Registro Medico

select  H1.HISCSEC AS FOLIO, mae.mmnomm, mae.mmregm as reg,esp.menome, mae.mmfirma as ruta_firma
from hosvital.hccom1 h1 
inner JOIN HOSVITAL.MaEMED1 MAE on (mae.mmcodm = h1.hiscmmed)
inner join hosvital.maeesp esp on (esp.mecode= h1.hcesp)
where  h1.histipdoc='CC' and h1.hisckey='51945773' and h1.hiscsec = 11;

-- Fomatos
-- LIMDES

select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,e1.empcod,e1.enccod, e1.ENCAGRDSC,
'' as valor1, ' ' as valor2, ' ' as valor3, ' ' as valor4
from hosvitaL.encues1 e1
INNER JoIN hosvital.hccom1 h1 on (1=1)
where  h1.histipdoc='CC'  and h1.hisckey='1000033893' and h1.hiscsec = 51 and e1.enccod='LIMDES'
union
select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,e1.empcod,e1.enccod, 'REALIZO LIMPIEZA Y DESINFECCION ? ',
'' as valor1, ' ' as valor2, ' ' as valor3, ' ' as valor4
from hosvitaL.encues1 e1
INNER JoIN hosvital.hccom1 h1 on (1=1)
where  h1.histipdoc='CC'  and h1.hisckey='1000033893' and h1.hiscsec = 51 and e1.enccod='LIMDES'
union
select  h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,e2.empcod,e2.enccod, e2.encpredsc,
(select e4.encitcdsc
 from hosvital.encues4 e4
where e4.empcod=r1.empcod and e4.enccod= r1.enccod and e4.encver=r1.encver and e4.encagrpr=e2.encagrpr and e4.encpre = e2.encpre   and  e4.encctcore = r1.resencctv and e4.encitmcns=1
),case when r1.ressele=0 then '-'  when r1.ressele=1 then 'X'  end,
(select e4.encitcdsc
 from hosvital.encues4 e4
where e4.empcod=r1.empcod and e4.enccod= r1.enccod and e4.encver=r1.encver and e4.encagrpr=e2.encagrpr and e4.encpre = e2.encpre  and  e4.encctcore = (r1.resencctv+1) and e4.encitmcns=2),
(select case when r11.ressele=0 then '-'  when r11.ressele=1 then 'X'  end
 from hosvital.resencu1 r11
where r11.empcod=r1.empcod and r11.enccod= r1.enccod and r11.encver=r1.encver  and r11.resctvre= r1.resctvre  and r11.resencctv = (r1.resencctv+1) )
from hosvital.resencu r
inner join hosvital.resencu1 r1 on (r1.empcod=r.empcod and r1.mcdpto=r.mcdpto and r1.enccod= r.enccod  and r1.encver=r.encver and r1.resctvre= r.resctvre)
inner join hosvital.encues2 e2 on (e2.empcod=r1.empcod and e2.enccod= r1.enccod and e2.encver=r1.encver and e2.encpredsc <> '.')
inner join hosvital.encues3 e3 on (e3.empcod=r1.empcod and e3.enccod= r1.enccod and e3.encver=r1.encver and e3.encagrpr = e2.encagrpr and e3.encpre= e2.encpre )
INNER JoIN hosvital.hccom1 h1 on (h1.histipdoc = r1.restdopac and h1.hisckey = r1.resdocpac and h1.hiscsec = r1.resfolpac )
inner join  hosvital.encues4  e4 on (e4.empcod=e3.empcod and e4.enccod= e3.enccod and e4.encver=e3.encver and e4.encagrpr = e3.encagrpr and e4.encpre= e3.encpre  and  e4.encctcore=r1.resencctv)
where   h1.histipdoc='CC'  and h1.hisckey='1000033893' and h1.hiscsec = 51 and e2.enccod='LIMDES' and e4.encitmcns=1;

-- TADITR

select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,ep.enccod, e2.encpre, e1.encagrdsc, e2.encpredsc  , ''
from hosvital.encuesp  ep
inner join hosvital.hccom1 h1 on (h1.histipdoc='CC'  and h1.hisckey='21075328' and h1.hiscsec = 544)
inner join hosvital.encues1 e1 on (e1.empcod=ep.empcod and e1.enccod = ep.enccod)
inner join hosvital.encues2  e2 on (e2.empcod=e1.empcod and e2.enccod = e1.enccod and e2.encver= e1.encver and e2.encagrpr=  e1.encagrpr and e2.enculcit in (0,5) )
WHERE  e2.enccod='TADITR' --and e2.encpre in (15,16,17,18)     
union
select h1.hiscsec as folio,h1.hisfhorat, case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end tipo_atencion,ep.enccod,   e2.encpre,  e1.encagrdsc, e2.encpredsc ,
( select   CASE when r1.resSele = '1' then 'NO' when r1.ressele = '0'  then 'SI' when r1.reSsele = '2'  then 'NOPIS' END
	FROM HOSVITAL.RESENCU r
	inner join hosvital.resencu1 r1 on (r1.empcod=r.empcod and r1.mcdpto = r.mcdpto and r1.encver=r.encver and r1.resctvre=r.resctvre )  
	inner  join hosvital.encues1  e1 on (e1.empcod=r.empcod and e1.enccod = r.enccod and e1.encver= r.encver)
	left join hosvital.encues2  e22 on (e22.empcod=e1.empcod and e22.enccod = e1.enccod and e22.encver= e1.encver and e22.encagrpr=  e1.encagrpr)
	inner join hosvital.encues3  e3 on (e3.empcod=e22.empcod and e3.enccod = e22.enccod and e3.encver= e22.encver and e3.encagrpr=  e22.encagrpr and e3.encpre=e22.encpre  and  e3.encctvres=r1.resencctv )
	left join hosvital.encues4  e4 on (e4.empcod=e3.empcod and e4.enccod = e3.enccod and e4.encver= e3.encver and e4.encagrpr=  e3.encagrpr and e4.encpre=e3.encpre and e4.encitmcns=r1.ressele AND E4.encctcore = r1.resencctv)
	WHERE r.restdopac='CC' AND r.RESDOCPAC='21075328' and r.resfolpac=544  and r1.empcod= e2.empcod and r1.enccod=e2.enccod and r1.encver= e2.encver  and  r1.resencctv = e2.encpre
	GROUP BY r1.ressele
)
from hosvital.encuesp  ep
inner join hosvital.hccom1 h1 on (h1.histipdoc='CC'  and h1.hisckey='21075328' and h1.hiscsec = 544)
inner join hosvital.encues1 e1 on (e1.empcod=ep.empcod and e1.enccod = ep.enccod)
inner join hosvital.encues2  e2 on (e2.empcod=e1.empcod and e2.enccod = e1.enccod and e2.encver= e1.encver and e2.encagrpr=  e1.encagrpr and e2.enculcit not in (0,5) )
WHERE  e2.enccod='TADITR' -- and e2.encpre in (17,18,20,23)
order by 1,2,3,4,5;                                                                                                                                                       

--  DISINV	


-- ParaClinicos

-- Laboratorios

-- Los Cancelados, deben mejorarse con datos como usuario que cancela etc. de ponto un uion ara cancelados

select h1.hiscsec as folio, h5.hcprccod, h1.hisfhorat as fecha_folio, h5.hiscpcan cantidad ,maepro.prnomb as descripcion,   h5.hiscpobs descripcion,case when h5.hcprstgr='C' THEN 'Cancelado'   when h5.hcprstgr='N' THEN 'No se realizo' when h5.hcprstgr='E' THEN 'En Proceso'    when h5.hcprstgr='A' THEN 'Realizado'   when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END as estado,
 r51.hcfechres as fecha_hora_aplicacion ,resul.reddesca  as resultados, concat(concat(resul.redresu,' '), resul.redunmer) valor, resul.redvalrf referencia,concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm as interpretado_por, h51.hcfehint fecha_interpreta, h51.hcintres interpretacion
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod)
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.hccom51R  r51 on (r51.histipdoc=h5.histipdoc and r51.hisckey=h1.hisckey and r51.hiscsec= h5.hiscsec and r51.hcprccns =  h51.hcprccns and r51.hcprccod = h5.hcprccod and  r51.hcprccns = h51.hcprccns and
r51.hcconres = (select max(r511.hcconres) from hosvital.hccom51r r511 where r511.histipdoc=h51.histipdoc and r511.hisckey = h51.hisckey and r511.hiscsec=h51.hiscsec and r511.hcprccod=h51.hcprccod and r511.hcprccns= h51.hcprccns))
left join  interlab.detresu resul on (  substring(resul.orclin,(locate(' ',resul.orclin) + 1),2) = h5.histipdoc and  substring(resul.orclin,1,(locate(' ',resul.orclin) -1))    =  h5.hisckey and substring(resul.orclin,  (locate(' ',resul.orclin) + 4), 11) = cast(h5.hiscsec as varchar(11))    and resul.ordcodex = h5.hcprccod)
left   join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs and maemed11.mmcedm<> '0')
wHere  h5.histipdoc='CC' and h5. hisckey='21075328' and h5.hiscsec=117
and h5.hcprctip =  2 AND H51.HCPRCCNS = (select max(h511.hcprccns) from hosvital.hccom51 h511 where h511.histipdoc=h51.histipdoc and h511.hisckey = h51.hisckey and h511.hiscsec=h51.hiscsec and h511.hcprccod=h51.hcprccod)
-- group by h1.hiscsec, h5.hcprccod, h1.hisfhorat, h5.hiscpcan ,maepro.prnomb ,   h5.hiscpobs,  h5.hcprstgr, r51.hcfechres  ,resul.reddesca  ,  resul.redresu , resul.redvalrf ,concat(maemed11.mmcedm ,maemed11.mmnomm )  ,  
-- maemed1.mmnomm , h51.hcfehint , h51.hcintres 
order by h5.hcprccod,resul.reddesca;

--  Procedimientos No Qx

select h1.hiscsec as folio, h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb,case  when h5.hcprstgr='C' THEN 'Cancelado'  when h5.hcprstgr='N' THEN 'No se realizo'    when h5.hcprstgr='E' THEN 'En Proceso'  when h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  when h5.hcprstgr='E' THEN 'Pendiente' END estado, 
h5.hiscpobs descripcion,
r51.hcfechres as fecha_y_hora_aplicacion, case when h51.hcresult <> '' then h51.hcresult else des2.hcdscatr  end resultados,  concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por,
maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta, h51.hcintres as interpretacion
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod)
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
left join hosvital.hccom51R  r51 on (r51.histipdoc=h5.histipdoc and r51.hisckey=h1.hisckey and r51.hiscsec= h5.hiscsec and r51.hcprccns =  h51.hcprccns  and r51.hcprccod = h5.hcprccod)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs )
left join hosvital.hccom2des des2 on (des2.histipdoc=h51.histipdoc and des2.hisckey=h51.hisckey and des2.hiscsec= h51.hiscsec and des2.hcprccod = h51.hcprccod and des2.hcprccns =  h51.hcprccns and des2.hcdesatr='HCResult' )
wHere  h5.histipdoc='CC' and h5. hisckey='21075328' and h5.hiscsec=130 and  h5.hcprctip =  4
order by h5.hcprccod;

-- Imagenologia

select h1.hiscsec as folio,h5.hcprccod , r51.hcprccns  ,  h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb as descripcion,case when h5.hcprstgr='C' THEN 'Cancelado'   when h5.hcprstgr='N' THEN 'No se realizo'   when h5.hcprstgr='E' THEN 'En Proceso'  when  h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END estado, 
h5.hiscpobs ,
r51.hcfechres as fecha_y_hora_aplicacion,case when h51.hcresult <> '' then h51.hcresult else des2.hcdscatr  end resultados,concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta, h51.hcintres interpretacion
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
wHere  h5.histipdoc='CC' and h5. hisckey='21075328' and h5.hiscsec=2  and  h5.hcprctip =  1 and h51.hcprccns  = (select max(h511.hcprccns) from hosvital.hccom51 h511 where h511.histipdoc=h51.histipdoc and h511.hisckey=h51.hisckey and  h511.hiscsec=h51.hiscsec and h511.hcprccod = h51.hcprccod)
order by 2 ;

--Terapias

-- Canceladas

select  h1.histipdoc,h1.hisckey,h1.hiscsec folio,h1.hisfhorat as fecha,case when h1.hisclpr='2' then 'HOSPITALIZACION' when h1.hisclpr='1' then 'AMBULATORIO' when h1.hisclpr='3' then 'URGENCIAS' end,
h5.hiscpcan cantidad,pro.prnomb as descripcion,  'Cancelado' as Cancelado, case when h51.hcmocntp='1' then 'Admistrativo' when h51.hcmocntp='3' then 'Medico'  end AS MOTIVO_CANCELACION,h51.hcobscan as observaciones,concat(concat(maemed1.mmnomm,'-RM: '), maemed1.mmregm) as usuario_cancela,h51.hcprfhcad as fecha_cancelacion, h5.hiscpobs
from hosvital.hccom1 h1
inner join hosvital.hccom5 h5 on (h5.histipdoc=h1.histipdoc and h5.hisckey=h1.hisckey  and h5.hiscsec=h1.hiscsec and h5.hcprctip= 3)
inner join hosvital.hccom51 h51 on (h51.histipdoc= h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec=h5.hiscsec and h51.hcprccod= h5.hcprccod  and h51.hcprCEST='C')
inner join hosvital.maepro pro on (pro.prcodi=h51.hcprccod)
left  join hosvital.maemed1 maemed1 on (maemed1.mmusuario=h51.hcpruscad)
 where  h1.histipdoc='CC' and h1.hisckey='19237826'  and h1.hiscsec =4237
group by h1.histipdoc,h1.hisckey,h1.hiscsec ,h1.hisfhorat ,h1.hisclpr,h5.hiscpcan ,pro.prnomb ,  'Cancelado' ,h51.hcmocntp ,h51.hcobscan ,concat(concat(maemed1.mmnomm,'-RM: '), maemed1.mmregm) ,h51.hcprfhcad , h5.hiscpobs;

-- terapias/Terapias

select h1.hiscsec as folio,  h5.hcprccod ,h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb,case when h5.hcprstgr='C' THEN 'Cancelado'  when h5.hcprstgr='N' THEN 'No se realizo'  when h5.hcprstgr='E' THEN 'En Proceso'  when h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END estado,
h5.hiscpobs descripcion, h51.hcfchrap  as fecha_y_hora_aplicacion, h51.hcresult resultados,
concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta,  h51.hcintres interpretacion
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod and h5.hcprstgr<>'C' and ( (h51.hcresult<>'' and  h5.hcprstgr <>  'N' ) or  (h51.hcresult = '' and  h5.hcprstgr not in ('N'))))
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
inner join hosvital.hccom51R  r51 on (r51.histipdoc=h5.histipdoc and r51.hisckey=h1.hisckey and r51.hiscsec= h5.hiscsec and r51.hcprccns =  h51.hcprccns  and r51.hcprccod = h5.hcprccod)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs)
wHere  h5.histipdoc='CC' and h5. hisckey='21075328' and h5.hiscsec=117  and  h5.hcprctip =  3 and h51.hcresult <> ''
UNION
select h1.hiscsec as folio,  h5.hcprccod, h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb,case when h5.hcprstgr='C' THEN 'Cancelado'  when h5.hcprstgr='N' THEN 'No se realizo' when h5.hcprstgr='E' THEN 'En Proceso' when h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END estado, 
h5.hiscpobs descripcion,h51.hcfchrap  as fecha_y_hora_aplicacion ,des2.hcdscatr resultados,   
concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta,  h51.hcintres interpretacion
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod and h5.hcprstgr<>'C'   )
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.hccom2des des2 on (des2.histipdoc=h5.histipdoc and des2.hisckey=h1.hisckey and des2.hiscsec= h5.hiscsec and des2.hcprccod = h5.hcprccod and des2.hcprccns =  h51.hcprccns )
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs)
wHere  h5.histipdoc='CC' and h5. hisckey='21075328' and h5.hiscsec=117  and  h5.hcprctip =  3   and des2.hcdesatr='HCResult'
order by 2 ;

--QUERY GASES ARTERIALES

select h1.hiscsec as folio,  h5.hcprccod ,h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb,case when h5.hcprstgr='C' THEN 'Cancelado'  when h5.hcprstgr='N' THEN 'No se realizo'  when h5.hcprstgr='E' THEN 'En Proceso'  when h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  END estado,
h5.hiscpobs descripcion, h51.hcfchrap  as fecha_y_hora_aplicacion, --h51.hcresult resultados,
prc.prbdsc  as analisis,
rs.rprtext    resultados,
prc.rngnml as valores_referencia,
concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por, maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta,  h51.hcintres interpretacion
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod and h5.hcprstgr<>'C' and ( (h51.hcresult<>'' and  h5.hcprstgr <>  'N' ) or  (h51.hcresult = '' and  h5.hcprstgr not in ('N'))))
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
inner join hosvital.hccom51R  r51 on (r51.histipdoc=h5.histipdoc and r51.hisckey=h1.hisckey and r51.hiscsec= h5.hiscsec and r51.hcprccns =  h51.hcprccns  and r51.hcprccod = h5.hcprccod)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
inner join hosvital.rslprc1 rs on (rs.histipdoc=h5.histipdoc and rs.hisckey=h5.hisckey and rs.hiscsec= h5.hiscsec and rs.hcprccod = h5.hcprccod)
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs)
inner join hosvital.prbxprc prc on (prc.prcodi=maepro.prcodi and prc.prbcod =rs.prbcod)
wHere  h5.histipdoc='CC' and h5. hisckey='21075328' and h5.hiscsec=117  and  h5.hcprctip =  3; 

-- Interconsultas

select  h1.hiscsec as folio,  concat('INTERCONSULTA POR ',esp.menome ) Descripcion,  date(h1.hisfhorat) as fecha_orden,   case when i.intest='A' then 'Atendido'  when i.intest='O' then 'Ordenada' when i.intest='P' then 'Pendiente' end, i.intobsord OBSERVACIONES, i.intdscrsl as Resultados, i.intfchrsl, concat('RELIZADO POR ',maemed1.mmnomm) , concat('Reg: ', maemed1.mmregm ),esp.menome as especialidad, maemed1.mmfirma as ruta_firma
 from hosvital.intercn i
inner join hosvital.hccom1 h1 on (h1.histipdoc= i.histipdoc and h1.hisckey=i.hisckey and h1.hiscsec=i.hiscsec)
inner join hosvital.maeesp esp on (esp.mecode= i.mecode)
LEFT join hosvital.maemed1 maemed1 on (maemed1.mmusuario=i.intusrrsp)
where  i.histipdoc='CC' and i.hisckey='21075328' and i.hiscsec=117;
 
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
where h1.histipdoc='CC' AND h1.hisckey='51945773' and h1.hiscsec= 1;

select * from hosvital.incpac where INCDOCAFI='51945773';


--Procedimientos Quirurgicos

select h1.hiscsec as folio, h1.hisfhorat as fecha_folio,h5.hiscpcan cantidad , maepro.prnomb,case  when h5.hcprstgr='C' THEN 'Cancelado'  when h5.hcprstgr='N' THEN 'No se realizo'    when h5.hcprstgr='E' THEN 'En Proceso'  when h5.hcprstgr='A' THEN 'Realizado'  when h5.hcprstgr='O' THEN 'Pendiente' when h5.hcprstgr='I' THEN 'Interpretado'  when h5.hcprstgr='E' THEN 'Pendiente' END estado, 
h5.hiscpobs descripcion,
r51.hcfechres as fecha_y_hora_aplicacion, case when h51.hcresult <> '' then h51.hcresult else des2.hcdscatr  end resultados,  concat(maemed11.mmcedm ,maemed11.mmnomm ) as realizado_por,
maemed1.mmnomm medico_interpreta, h51.hcfehint fecha_interpreta, h51.hcintres as interpretacion
from hosvital.hccom5 h5
inner join hosvital.hccom51 h51 on (h51.histipdoc=h5.histipdoc and h51.hisckey=h5.hisckey and h51.hiscsec= h5.hiscsec and h51.hcprccod = h5.hcprccod)
inner join hosvital.hccom1 h1 on (h1.histipdoc=h5.histipdoc and h1.hisckey=h5.hisckey and h1.hiscsec= h5.hiscsec)
left join hosvital.hccom51R  r51 on (r51.histipdoc=h5.histipdoc and r51.hisckey=h1.hisckey and r51.hiscsec= h5.hiscsec and r51.hcprccns =  h51.hcprccns  and r51.hcprccod = h5.hcprccod)
inner join hosvital.maepro maepro on (maepro.prcodi= h5.hcprccod)
left join hosvital.maemed1 maemed1 on (maemed1.mmcodm = h51.hcmedint)
left join hosvital.maemed1 maemed11 on (maemed11.mmusuario= h51.rprusrrgs )
left join hosvital.hccom2des des2 on (des2.histipdoc=h51.histipdoc and des2.hisckey=h51.hisckey and des2.hiscsec= h51.hiscsec and des2.hcprccod = h51.hcprccod and des2.hcprccns =  h51.hcprccns and des2.hcdesatr='HCResult' )
wHere  h5.histipdoc='CC' and h5. hisckey='52384414' and h5.hiscsec=12 and  h5.hcprctip = 5
order by h5.hcprccod;


-- Pendientes (2) :, Cancelacion de cirugias, Cancelacion de terapias
