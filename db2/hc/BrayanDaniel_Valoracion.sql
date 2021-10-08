select * from hosvital.hccom1 where hisfhorat >= '2020-11-20 00:00:00'; -- FHCINDESP


SELECT cap.mptdoc,cap.mpcedu,cap.mpnomc,h1.hisfhorat as fecha_triage,
(select h2.hisfhorat
 from hosvital.hccom1 h2
  where h2.histipdoc=h1.histipdoc and h2.hisckey = h1.hisckey and h2.hctvin1= h1.hctvin1 and h2.fhcindesp='GN' and
  h2.hisfhorat = (select min(h3.hisfhorat) from hosvital.hccom1 h3  where h3.histipdoc=h2.histipdoc and h3.hisckey = h2.hisckey and h3.hctvin1= h2.hctvin1 and h3.fhcindesp='GN' having count(*) = 1)
) as fecha_evolucion_medica
FROM hosvital.hccom1 h1 
inner join hosvital.capbas cap on (cap.mptdoc =h1.histipdoc and cap.mpcedu= h1.hisckey)
where  h1.hisfhorat >= '2020-11-01 00:00:00' and h1.fhcindesp ='TR' and h1.hisclpr = '3'
order by hisfhorat; 




SELECT cap.mptdoc as tipo_doc,cap.mpcedu as documento,cap.mpnomc as paciente ,h1.hctvin1 No_ingreso,h1.hisfhorat as fecha_triage,
(select min (h2.hisfhorat)
 from hosvital.hccom1 h2
  where h2.histipdoc=h1.histipdoc and h2.hisckey = h1.hisckey and h2.hctvin1= h1.hctvin1 and h2.fhcindesp='GN'
) as fecha_evolucion_medica
FROM hosvital.hccom1 h1 
inner join hosvital.capbas cap on (cap.mptdoc =h1.histipdoc and cap.mpcedu= h1.hisckey)
where  h1.hisfhorat >= '2020-01-01 00:00:00' and h1.fhcindesp ='TR' and h1.hisclpr = '3' -- and h1.hisckey= '93181929' 
order by hisfhorat; 

 --  CC 	93181929       	JUAN CAMILO OLAYA QUIÑONEZ                                               	2020-11-29 14:06:43.000000	null	2020-11-29 13:58:32.000000	

select hisckey,hiscsec, hisfhorat, fhcindesp , hctvin1 from hosvital.hccom1 where hisckey = '93181929' order by hiscsec;