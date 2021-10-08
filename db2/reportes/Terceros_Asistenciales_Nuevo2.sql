

SELECT kk.cedula_med, kk.procircod  , kk.fecha_cirugia  ,  kk.estado,kk.cod_sala,kk.sala ,kk.hora_inicio, kk.hora_final, kk.origen,kk.tipo_doc, kk.cedula,kk.paciente,kk.fecha_nacimiento,kk.genero,kk.telefono,kk.cod_eps,kk.eps,kk.espccod,kk.menome,kk.crgcod,kk.procedimiento,kk.total_procedimientos,kk.cirujano,kk.tipo_anestesia,kk.cod_via, kk.via,
kk.TIPO_CIRUGIA, kk.COMPLICACIONES, kk.TIPO_HERIDA,kk.MTVO_CANCELACION,kk.PTCNTUVR,kk.ptcodi,
(select hnrdsc from hosvital.honrios where hnrcod='01')
 as honorario01,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='01' and  p22.PERSESP  NOT IN(136,138,52)   AND p22.PERSEST='S' 
) as med,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '01'
) as liq,

(select hnrdsc from hosvital.honrios where hnrcod='02')
 as honorario02,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='02' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' 
) as med2,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '02'
) as liq2,
(select hnrdsc from hosvital.honrios where hnrcod='03')
 as honorario03,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='03' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' 
) as med3,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '03'
) as liq3,
(select hnrdsc from hosvital.honrios where hnrcod='04' )
 as  honorario04,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='04' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' 
) as med4,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '04'
) as liq4,
(select hnrdsc from hosvital.honrios where hnrcod='05') as honorario05,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='05' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' 
) as med5,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '05'
) as liq5,
(select hnrdsc from hosvital.honrios where hnrcod='06') as honorario06, 
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='06' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' 
) as med6,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '06'
) as liq6,
(select hnrdsc from hosvital.honrios where hnrcod='07')  as honorario07,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='07' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med7,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '07'
) as liq7,
(select hnrdsc from hosvital.honrios where hnrcod='07')  as honorario08,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='08' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med8,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '08'
) as liq8,
(select hnrdsc from hosvital.honrios where hnrcod='09')  as honorario09,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='09' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med9,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '09'
) as liq9,
(select hnrdsc from hosvital.honrios where hnrcod='10')  as honorario10,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='10' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med10,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '10'
) as liq10,
(select hnrdsc from hosvital.honrios where hnrcod='11')  as honorario11,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='11' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med11,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '11'
) as liq11,
(select hnrdsc from hosvital.honrios where hnrcod='12')  as honorario12,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='12' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med12,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '12'
) as liq12,
(select hnrdsc from hosvital.honrios where hnrcod='13')  as honorario13,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='13' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med13,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '13'
) as liq13,
(select hnrdsc from hosvital.honrios where hnrcod='14')  as honorario14,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='14' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med14,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '14'
) as liq14,
(select hnrdsc from hosvital.honrios where hnrcod='15')  as honorario15,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='15' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med15,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '15'
) as liq15,
(select hnrdsc from hosvital.honrios where hnrcod='16')  as honorario16,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='16' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med16,
(SELECT f1.forliqvlhn*kk.PTCNTUVR*pp1.ptporc/100 FROM  HOSVITAL.forliq1 f1, hosvital.portar1 pp1 WHERE kk.ptcodi=pp1.ptcodi and pp1.prcodi = kk.crgcod and pp1.forliqcod=f1.forliqcod and f1.hnrcod = '16'
) as liq16
from
(select  p.provia,m2.mmcedm as cedula_med, p.procircod ,c.mptdoc as tipo_doc,c.mpcedu as cedula,c.mpnomc as paciente,c.mpfchn as fecha_nacimiento,c.mpsexo as genero,c.mptele as telefono,m.mennit as cod_eps,m.menomb as eps,
p1.espccod,m3.menome,p1.crgcod ,m1.prnomb as procedimiento,     p1.CRGCNT as total_procedimientos,    m2.mmnomm as cirujano,
case d1.tipane when  'G' THEN 'GENERAL' when 'R' THEN 'REGIONAL' when  'L' THEN 'LOCAL' when 'N' THEN 'NO APLICA' END AS TIPO_ANESTESIA,
v.viacod as cod_via, v.viadsc as via,case p.PROSIT WHEN '1' THEN 'PROGRAMADA' when '2' THEN 'URGENCIAS' when '3' THEN 'TRAUMA' END AS TIPO_CIRUGIA, 
d1.DESCOM AS COMPLICACIONES,  CASE d1.TIPHER when '1' THEN 'LIMPIA' when '2' THEN 'LIMPIA CONTAMINADA' when '3' THEN 'CONTAMINADA' when '4' THEN 'SUCIA' END AS TIPO_HERIDA,
p.PROMOTCAN AS MTVO_CANCELACION,po1.PTCNTUVR ,po1.ptcodi,
CASE p.PROESTA WHEN '1' THEN 'RESERVADA' WHEN '2' THEN 'CONFIRMADA' WHEN '3' THEN 'CANCELADA' WHEN '4' THEN 'REALIZADA' WHEN '5' THEN 'FACTURADA' WHEN '6' THEN 'PENDIENTE' WHEN '7' 	THEN 'CON INSTRUCCIONES' END ESTADO, p.profecf as fecha_cirugia,p.procons as cod_sala,c1.consdet as sala,d1.horinicir as hora_inicio, d1.horfincir as hora_final,
	case i.clapro WHEN '1' THEN 'AMBULATORIO' WHEN '2' THEN 'HOSPITALIZACION' WHEN '3' THEN 'URGENCIAS' WHEN '4' THEN 'TRATAMIENTO ESPECIAL' WHEN '5' THEN 'URGENCIAS' END AS ORIGEN
from hosvital.procir p
inner join hosvital.procir2 p2 on (p2.procircod = p.procircod )
inner join hosvital.procir1 p1 on (p1.procircod = p.procircod)
inner join hosvital.maepro m1 on (p1.crgcod= m1.prcodi)
inner join hosvital.maemed1 m2 on (p1.medcod = m2.mmcodm )
inner join hosvital.capbas c  on (p.mptdoc=c.mptdoc and p.mpcedu=c.mpcedu)
inner join hosvital.maeemp m on (p.proeps=m.mennit)
inner join hosvital.consul c1 on (p.procons = c1.conscod)
inner join hosvital.descirmed d1 on (p.procircod = d1.codcir)
inner join hosvital.ingresos i on (i.mptdoc = p.mptdoc and i.mpcedu = p.mpcedu  and i.ingcsc =  p.proctvin)
inner join hosvital.maeesp m3 on (m3.mecode=p1.espccod)
inner join hosvital.vias v on (p1.viacod = v.viacod)
inner join hosvital.maeemp31 m31 on (m31.mennit =p.proeps)
left join hosvital.portar po on (po.ptcodi = m31.ptcodi )
left join hosvital.portar1 po1 on (po1.ptcodi = m31.ptcodi and po1.prcodi = p1.CRGCOD)
WHERE P.PROFEC>= '2019-03-20' AND P.PROFEC<= '2019-04-21'    -- AND  P.PROCIRCOD =  111080															and  po.PTEST = 'S'  and  p2.PERSESP  NOT IN(136,138,52)   AND p2.PERSEST='S' and p1.CRGHNRCI ='01' 
			and meppvig = (select max(meppvig) 
			                  from  HOSVITAL.MAEEMP31 m311
	                                                                         where m311.mennit =  m31.mennit)

-- 104996		 
) kk
group by  kk.cedula_med,kk.procircod  ,kk.fecha_cirugia  ,  kk.estado, kk.cod_sala,kk.sala ,kk.hora_inicio, kk.hora_final,kk.origen,kk.tipo_doc, kk.cedula,kk.paciente,kk.fecha_nacimiento,kk.genero,kk.telefono,kk.cod_eps,kk.eps ,
kk.espccod,kk.menome,kk.crgcod,kk.procedimiento,kk.total_procedimientos,kk.cirujano,kk.tipo_anestesia,kk.cod_via, kk.via,kk.TIPO_CIRUGIA, kk.COMPLICACIONES, kk.TIPO_HERIDA,kk.MTVO_CANCELACION,kk.PTCNTUVR,kk.ptcodi
order by  kk.cedula_med,kk.procircod;


--Notas

SELECT  ptcodi
 FROM HOSVITAL.MAEEMP31   m31
where   mennit = 'CS0111' and meppvig = (select max(meppvig) 
			from  HOSVITAL.MAEEMP31 m311
			where m311.mennit =  m31.mennit);


select *
from hosvital.procir p, hosvital.procir2 p2
where p.procircod = p2.procircod and p.procircod = p2.procircod and
          p.procircod = 104996;


select * from hosvital.ingresos where mpcedu ='19071147' ;
select * from hosvital.maeemp31 where mennit='CS0111';
-- 530001   	541701   	
select * from hosvital.portar1 where ptcodi= '146' and  prcodi in ('530001');  -- forliqcod
-- forliqcod ='102'
select * from hosvital.forliq where forliqcod ='102';
select * from hosvital.forliq1 where forliqcod ='102'; --hnrcod,, forliqcar  ,, forliqvlhn



select distinct (provia) from hosvital.procir; --where procircod = 110791; 

select * from hosvital.procir1 where procircod = 110791;
select * from hosvital.procir2 where procircod = 110791;
select * from hosvital.capbas where mpcedu = '19071147';
select * from hosvital.consul where conscod=131;
select * from hosvital.descirmed where codcir = 110454;
	

select * from hosvital.procir where procircod = 110565;

select * from hosvital.ingresos where  mpcedu = '110565';	-- and ingcsc=9;


-- por unica via o diferente via
  si es ujnica via el 1 proced al 100% y el sdo al 60%
 si es por diferen tiva el pro al 100%  y el segundo al 75

la factura nro 573939 es unica via

-- elde mayor uvr  va al 100%

-- mmphome


select * from 

