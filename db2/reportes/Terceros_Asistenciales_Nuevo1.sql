

SELECT kk.mmcedm, kk.PROCIRCOD  , kk.PROFECF  ,  kk.estado,kk.procons,kk.consdet ,kk.horinicir, kk.horfincir, kk.origen,kk.tipo_doc, kk.cedula,kk.paciente,kk.mpfchn,kk.mpsexo,kk.mptele,kk.mennit,kk.menomb,kk.espccod,kk.menome,kk.crgcod,kk.prnomb,kk.cirujano,kk.tipo_anestesia,kk.cod_via, kk.via,
kk.TIPO_CIRUGIA, kk.COMPLICACIONES, kk.TIPO_HERIDA,kk.MTVO_CANCELACION,kk.PTCNTUVR,
(select hnrdsc from hosvital.honrios where hnrcod='01')
 as honr01,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='01' and  p22.PERSESP  NOT IN(136,138,52)   AND p22.PERSEST='S' 
) as med,
(select hnrdsc from hosvital.honrios where hnrcod='02')
 as honr02,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='02' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' 
) as med2,
(select hnrdsc from hosvital.honrios where hnrcod='03')
 as honr03,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='03' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' 
) as med3,
(select hnrdsc from hosvital.honrios where hnrcod='04' )
 as honr04,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='04' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' 
) as med4,
(select hnrdsc from hosvital.honrios where hnrcod='05') as honr05,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='05' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' 
) as med5,
(select hnrdsc from hosvital.honrios where hnrcod='06') as honr06, 
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='06' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' 
) as med6,
(select hnrdsc from hosvital.honrios where hnrcod='07')  as honr07,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='07' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med7,
(select hnrdsc from hosvital.honrios where hnrcod='07')  as honr08,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='08' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med8,
(select hnrdsc from hosvital.honrios where hnrcod='09')  as honr09,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='09' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med9,
(select hnrdsc from hosvital.honrios where hnrcod='10')  as honr10,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='10' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med10,
(select hnrdsc from hosvital.honrios where hnrcod='11')  as honr11,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='11' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med11,
(select hnrdsc from hosvital.honrios where hnrcod='12')  as honr12,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='12' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med12,
(select hnrdsc from hosvital.honrios where hnrcod='13')  as honr13,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='13' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med13,
(select hnrdsc from hosvital.honrios where hnrcod='14')  as honr14,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='14' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med14,
(select hnrdsc from hosvital.honrios where hnrcod='15')  as honr15,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='15' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med15,
(select hnrdsc from hosvital.honrios where hnrcod='16')  as honr16,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='16' and  p22.PERSESP  NOT IN(136,138)   AND p22.PERSEST='S' ) as med16
from
(select  m2.mmcedm,p.procircod as procircod,c.mptdoc as tipo_doc,c.mpcedu as cedula,c.mpnomc as paciente,c.mpfchn,c.mpsexo,c.mptele,m.mennit,m.menomb,
p1.espccod,m3.menome,
p1.crgcod,m1.prnomb,m2.mmnomm as cirujano,
case d1.tipane when  'G' THEN 'GENERAL' when 'R' THEN 'REGIONAL' when  'L' THEN 'LOCAL' when 'N' THEN 'NO APLICA' END AS TIPO_ANESTESIA,
v.viacod as cod_via, v.viadsc as via,case p.PROSIT WHEN '1' THEN 'PROGRAMADA' when '2' THEN 'URGENCIAS' when '3' THEN 'TRAUMA' END AS TIPO_CIRUGIA, 
d1.DESCOM AS COMPLICACIONES,  CASE d1.TIPHER when '1' THEN 'LIMPIA' when '2' THEN 'LIMPIA CONTAMINADA' when '3' THEN 'CONTAMINADA' when '4' THEN 'SUCIA' END AS TIPO_HERIDA,
p.PROMOTCAN AS MTVO_CANCELACION,po1.PTCNTUVR,
CASE p.PROESTA WHEN '1' THEN 'RESERVADA' WHEN '2' THEN 'CONFIRMADA' WHEN '3' THEN 'CANCELADA' WHEN '4' THEN 'REALIZADA' WHEN '5' THEN 'FACTURADA' WHEN '6' THEN 'PENDIENTE' WHEN '7' 	THEN 'CON INSTRUCCIONES' END ESTADO, p.profecf as profecf,p.procons,c1.consdet,d1.horinicir, d1.horfincir,
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
WHERE P.PROFEC>= '2019-03-21' AND P.PROFEC<= '2019-04-30'   -- AND  P.PROCIRCOD =  110791												and  po.PTEST = 'S'  and  p2.PERSESP  NOT IN(136,138,52)   AND p2.PERSEST='S' and p1.CRGHNRCI ='01' 
			and meppvig = (select max(meppvig) 
			                  from  HOSVITAL.MAEEMP31 m311
	                                                                         where m311.mennit =  m31.mennit)

-- 104996		 
) kk
group by  kk.mmcedm,kk.PROCIRCOD  ,kk.PROFECF  ,  kk.estado, kk.procons,kk.consdet ,kk.horinicir, kk.horfincir,kk.origen,kk.tipo_doc, kk.cedula,kk.paciente,kk.mpfchn,kk.mpsexo,kk.mptele,kk.mennit,kk.menomb ,
kk.espccod,kk.menome,kk.crgcod,kk.prnomb,kk.cirujano,kk.tipo_anestesia,kk.cod_via, kk.via,kk.TIPO_CIRUGIA, kk.COMPLICACIONES, kk.TIPO_HERIDA,kk.MTVO_CANCELACION,kk.PTCNTUVR
order by  kk.mmcedm,kk.procircod;


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
select * from hosvital.portar1 where ptcodi= '146' and  prcodi in ('530001','541701');
-- forliqcod ='102'
select * from hosvital.forliq where forliqcod ='102';
select * from hosvital.forliq1 where forliqcod ='102'; --hnrcod,, forliqcar  ,, forliqvlhn


select * from hosvital.procir where procircod = 110791; 
select * from hosvital.procir1 where procircod = 110791;
select * from hosvital.procir2 where procircod = 110791;
select * from hosvital.capbas where mpcedu = '19071147';
select * from hosvital.consul where conscod=131;
select * from hosvital.descirmed where codcir = 110454;
	
