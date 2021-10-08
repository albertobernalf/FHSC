SELECT * FROM HOSVITAL.MAEMED1;
SELECT * FROM HOSVITAL.PROCIR;

SELECT * FROM HOSVITAL.PROCIR WHERE PROFEC >= '2019-04-01' AND PROCIRCOD = 106335	;

SELECT * FROM HOSVITAL.PROCIR1 WHERE PROCIRCOD = 106335;
SELECT * FROM HOSVITAL.PROCIR2 WHERE PROCIRCOD = 106335;
  -- PERSTIP = TIPO PARTICIPANTE / PERSCOD = EL MED / PROCIRCOD LA CIRUGIA
SELECT DISTINCT (PERSTIP) FROM HOSVITAL.PROCIR2;
/*
01	02	 03	04	
05	06	07	08	
4 	
*/

SELECT P.PROCIRCOD  AS CODIGO_CIRUGIA, P.PROFECF  AS FECHA_CIRUGIA,  
	CASE P.PROESTA WHEN '1' THEN 'RESERVADA' WHEN '2' THEN 'CONFIRMADA' WHEN '3' THEN 'CANCELADA' WHEN '4' THEN 'REALIZADA' WHEN '5' THEN 'FACTURADA' WHEN '6' THEN 'PENDIENTE' WHEN '7' 	THEN 'CON INSTRUCCIONES' END AS ESTADO,
from
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = P.PROCIRCOD AND P22.PERSTIP='01'
) k
FROM HOSVITAL.PROCIR P
WHERE P.PROFEC>= '2019-04-01' AND P.PROFEC<= '2019-04-30'  AND  P.PROCIRCOD =106335;



SELECT k.procircod,k.PROFECF  AS FECHA_CIRUGIA,K.ESTADO
from
(select  P.PROCIRCOD  , P.PROFECF  ,  
	CASE P.PROESTA WHEN '1' THEN 'RESERVADA' WHEN '2' THEN 'CONFIRMADA' WHEN '3' THEN 'CANCELADA' WHEN '4' THEN 'REALIZADA' WHEN '5' THEN 'FACTURADA' WHEN '6' THEN 'PENDIENTE' WHEN '7' 	THEN 'CON INSTRUCCIONES' END ESTADO
FROM HOSVITAL.PROCIR P
WHERE P.PROFEC>= '2019-04-01' AND P.PROFEC<= '2019-04-30'  AND  P.PROCIRCOD =106335
) k;

SELECT * FROM HOSVITAL.PROCIR2 WHERE PROCIRCOD = 106335; 


SELECT k.procircod,k.PROFECF  AS FECHA_CIRUGIA
from
(select * FROM HOSVITAL.PROCIR P WHERE   P.PROCIRCOD =106335 )k 
from
(SELECT *  FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD =106335   AND P22.PERSTIP='01') t 
where k.PROFEC>= '2019-04-01' AND k.PROFEC<= '2019-04-30'  AND  k.procircod= 106335	;

----------------------------------------------
----------------------------------------------



SELECT kk.mmcedm, kk.PROCIRCOD  , kk.PROFECF  ,  kk.estado,kk.procons,kk.consdet ,kk.horinicir, kk.horfincir, kk.origen,kk.tipo_doc, kk.cedula,kk.paciente,kk.mpfchn,kk.mpsexo,kk.mptele,kk.mennit,kk.menomb,kk.espccod,kk.menome,kk.crgcod,kk.prnomb,kk.cirujano,kk.tipo_anestesia,kk.cod_via, kk.via,
kk.TIPO_CIRUGIA, kk.COMPLICACIONES, kk.TIPO_HERIDA,kk.MTVO_CANCELACION,kk.PTCNTUVR,
(select hnrdsc from hosvital.honrios where hnrcod='01')
 as honr01,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='01'
) as med,
(select hnrdsc from hosvital.honrios where hnrcod='02')
 as honr02,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='02'
) as med2,
(select hnrdsc from hosvital.honrios where hnrcod='03')
 as honr03,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='03'
) as med3,
(select hnrdsc from hosvital.honrios where hnrcod='04')
 as honr04,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='04'
) as med4,
(select hnrdsc from hosvital.honrios where hnrcod='05') as honr05,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='05'
) as med5,
(select hnrdsc from hosvital.honrios where hnrcod='06') as honr06,
(SELECT P22.PERSCOD
 FROM  HOSVITAL.PROCIR2 P22
WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='06'
) as med6,
(select hnrdsc from hosvital.honrios where hnrcod='07')  as honr07,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='07') as med7,
(select hnrdsc from hosvital.honrios where hnrcod='07')  as honr08,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='08') as med8,
(select hnrdsc from hosvital.honrios where hnrcod='09')  as honr09,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='09') as med9,
(select hnrdsc from hosvital.honrios where hnrcod='10')  as honr10,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='10') as med10,
(select hnrdsc from hosvital.honrios where hnrcod='11')  as honr11,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='11') as med11,
(select hnrdsc from hosvital.honrios where hnrcod='12')  as honr12,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='12') as med12,
(select hnrdsc from hosvital.honrios where hnrcod='13')  as honr13,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='13') as med13,
(select hnrdsc from hosvital.honrios where hnrcod='14')  as honr14,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='14') as med14,
(select hnrdsc from hosvital.honrios where hnrcod='15')  as honr15,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='15') as med15,
(select hnrdsc from hosvital.honrios where hnrcod='16')  as honr16,
(SELECT P22.PERSCOD FROM  HOSVITAL.PROCIR2 P22 WHERE P22.PROCIRCOD = kk.PROCIRCOD AND P22.PERSTIP='16') as med16
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
from hosvital.procir p,hosvital.procir2 p2, hosvital.capbas c, hosvital.maeemp m, hosvital.procir1 p1, hosvital.maepro m1, hosvital.maemed1 m2,hosvital.consul c1, hosvital.descirmed d1,
         	   hosvital.ingresos i, hosvital.maeesp m3, hosvital.vias v, hosvital.maeate mx, hosvital.portar1 po1
WHERE P.PROFEC>= '2019-04-01' AND P.PROFEC<= '2019-04-30'   AND  P.PROCIRCOD =104996		 
	and p.procircod = p2.procircod 
		and p1.procircod = p.procircod and p1.crgcod= m1.prcodi and p1.medcod = m2.mmcodm and
	p.mptdoc=c.mptdoc and p.mpcedu=c.mpcedu and p.proeps=m.mennit and p.procons = c1.conscod and p.procircod = d1.codcir and
                              i.mptdoc = p.mptdoc and i.mpcedu = p.mpcedu  and i.ingcsc =  p.proctvin and m3.mecode=p1.espccod and p1.viacod = v.viacod and
	p.mptdoc = mx.mptdoc and p.mpcedu = mx.mpcedu and p.proctvin =mx.mactving and
     	       po1.ptcodi = mx.mpptcodi and po1.prcodi = p1.CRGCOD
) kk
group by  kk.mmcedm,kk.PROCIRCOD  ,kk.PROFECF  ,  kk.estado, kk.procons,kk.consdet ,kk.horinicir, kk.horfincir,kk.origen,kk.tipo_doc, kk.cedula,kk.paciente,kk.mpfchn,kk.mpsexo,kk.mptele,kk.mennit,kk.menomb ,
kk.espccod,kk.menome,kk.crgcod,kk.prnomb,kk.cirujano,kk.tipo_anestesia,kk.cod_via, kk.via,kk.TIPO_CIRUGIA, kk.COMPLICACIONES, kk.TIPO_HERIDA,kk.MTVO_CANCELACION,kk.PTCNTUVR;

----------------------




select * from hosvital.ingresos where mpcedu ='212967' ;
select * from hosvital.tmpfac where tfcedu = '212967';
select * from hosvital.maeate where mpcedu = '212967' and mactving=6;
select * from hosvital.procir2 where procircod = 104996;
select * from hosvital.procir where procircod = 104996;
select * from hosvital.procir1 where procircod = 104996;
select * from hosvital.capbas;
select * from hosvital.maeemp;
select * from hosvital.maemed1;
select * from hosvital.maeesp;
select * from hosvital.maepac where mpcedu = '212967';
select * from hosvital.honrios ;
SELECT * FROM HOSVITAL.MAEEMP31  -- where   mennit = 'CS0111'
order by mennit;

select * from hosvital.maeemp31 
where mennit = 'SS0021';	


SELECT  ptcodi
 FROM HOSVITAL.MAEEMP31   m31
where   mennit = 'CS0111' and meppvig = (select max(meppvig) 
			from  HOSVITAL.MAEEMP31 m311
			where m311.mennit =  m31.mennit);

select * from hosvital.maeate ;  -- mpptcod



select  m.mpptcodi,po1.PTCNTUVR,p1.CRGCOD
from hosvital.procir p, hosvital.maeate m, hosvital.portar1 po1, hosvital.procir1 p1
where p.procircod = 106335 and p.mptdoc = m.mptdoc and p.mpcedu = m.mpcedu and p.proctvin =m.mactving and
       po1.ptcodi = m.mpptcodi and po1.prcodi = p1.CRGCOD and p.procircod = p1.procircod ;


select *
from hosvital.procir p, hosvital.procir2 p2
where p.procircod = p2.procircod and p.procircod = p2.procircod and
          p.procircod = 106335









