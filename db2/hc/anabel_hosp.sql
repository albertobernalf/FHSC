-- número de documento, tipo de documento, nombre del paciente, fecha de nacimiento, fecha de consulta, 
-- servicio que lo atiende, diagnóstico de ingreso y diagnóstico de salida ligado a una especialidad.

select hc.histipdoc,hc.hisckey,hc.hiscsec, hg1.hcdxcod,hg1.hcdxtip
from hosvital.hccom1 hc
left join hosvital.hcdiagn hg1 on (hg1.histipdoc=hc.histipdoc and hg1.hisckey= hc.hisckey and hg1.hiscsec=hc.hiscsec and hg1.hcdxtip='CN')
where hc.hisfhorat>= '2020-05-25 00:00:00'  ;


select distinct hcdxtip  from hosvital.hcdiagn; -- cn,cr ,id, ds

select * from hosvital.hccom1 where hisfhorat>='2020-06-02 00:00:00' ; -- ,hcesp
select *  from hosvital.hcdiagn where hisckey='19474421';
select * from hosvital.capbas;
select * from hosvital.ingresos;
select * from hosvital.maepab; -- (1,3,4,5,6,7,11,12,13,14,15,16,,17,18,20,21,22,23,24,25,26,27,28,29,30,34,35,36,43,44)
select * from hosvital.maedia;


select i.mptdoc as tipo_doc ,i.mpcedu as documento, cap.mpnomc as paciente, cap.mpfchn as fecha_nacio, i.ingfecadm as fecha_ingreso,  i.ingentdx as dx_ingreso,
hc.hisfhorat as fecha_atencion, hc.hccodpab as cod_pabellon, mae.mpnomp as pabellon, hc.hcesp as cod_esp, esp.menome as nombre_especial,
hg1.hcdxcod   as dx, maedia.dmnomb as nombre_dx
from hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.hccom1 hc on (hc.histipdoc = i.mptdoc and hc.hisckey= i.mpcedu and hc.hctvin1 = i.ingcsc and fhcindesp='GN')
left join hosvital.hcdiagn hg1 on (hg1.histipdoc=hc.histipdoc and hg1.hisckey= hc.hisckey and hg1.hiscsec = hc.hiscsec)
inner join hosvital.maepab mae on (mae.mpcodp =hc.hccodpab)
inner join hosvital.maedia maedia on (maedia.dmcodi=hc.hcesp)
inner join hosvital.maeesp esp on (esp.mecode=hc.hcesp)
where  hc.hisfhorat >= '2020-05-01 00:00:00' and hc.hisfhorat <= '2020-06-30 23:59:59' and hg1.hcdxtip='CN'
order by i.mptdoc,i.mpcedu,hc.hisfhorat;

-- Ejemplos
select * from hosvital.maeesp;
/*
CC 	1024499021     	16	S300 	CN	
CC 	79055945       	99	S525 	CN	



79449857       	CC 	9	
1023025036     	CC 	6	
20270177       	CC 	1	
35490546       	CC 	77	
52204872       	CC 	2	
79330388       	CC 	5	
4066976        	CC 	2	
1015997362     	CC 	422	
40376181       	CC 	34	
23623134       	CC 	56	
53010271       	CC 	1	
19452820       	CC 	500	
27857865       	CC 	2024	
1023863734     	CC 	7	
39765412       	CC 	56	
19452820       	CC 	502	
41380122       	CC 	752	
17073767       	CC 	16	
41381612       	CC 	99	
     	
*/

select i.mptdoc as tipo_doc ,i.mpcedu as documento, cap.mpnomc as paciente, hc.hiscsec, hc.hctvin1,    cap.mpfchn as fecha_nacio, i.ingfecadm as fecha_ingreso,  i.ingentdx as dx_ingreso,
hc.hisfhorat as fecha_atencion,  mae.mpnomp as pabellon, esp.menome as nombre_especial,
hg1.hcdxcod   as dx, maedia.dmnomb as nombre_dx
from hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.hccom1 hc on (hc.histipdoc = i.mptdoc and hc.hisckey= i.mpcedu and hc.hctvin1 = i.ingcsc and fhcindesp='GN')
left join hosvital.hcdiagn hg1 on (hg1.histipdoc=hc.histipdoc and hg1.hisckey= hc.hisckey and hg1.hiscsec = hc.hiscsec  and hg1.hcdxtip='CN')
inner join hosvital.maepab mae on (mae.mpcodp =hc.hccodpab)
inner join hosvital.maedia maedia on (maedia.dmcodi=hg1.hcdxcod)
inner join hosvital.maeesp esp on (esp.mecode=hc.hcesp)
where  hc.hisckey in ('79449857','1023025036') and  hc.hisfhorat >= '2020-06-01 00:00:00' and hc.hisfhorat <= '2020-06-30 23:59:59' 
order by i.mptdoc,i.mpcedu,hc.hisfhorat;

-- Para sacar el ultimo folio

select i.mptdoc as tipo_doc ,i.mpcedu as documento, cap.mpnomc as paciente, hc.hiscsec, hc.hctvin1,    cap.mpfchn as fecha_nacio, i.ingfecadm as fecha_ingreso,  i.ingentdx as dx_ingreso, maedia2.dmnomb as nombre_dx_ingreso,
hc.hisfhorat as fecha_atencion,  mae.mpnomp as pabellon, esp.menome as nombre_especial,
hg1.hcdxcod   as dx, maedia.dmnomb as nombre_dx,hg1.hcdxtip
from hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.hccom1 hc on (hc.histipdoc = i.mptdoc and hc.hisckey= i.mpcedu and hc.hctvin1 = i.ingcsc and hc.fhcindesp='GN')
left join hosvital.hcdiagn hg1 on (hg1.histipdoc=hc.histipdoc and hg1.hisckey= hc.hisckey and hg1.hiscsec = hc.hiscsec  and hg1.hcdxtip='CN' and hg1.hcdxcls=1)
inner join hosvital.maepab mae on (mae.mpcodp =hc.hccodpab)
inner join hosvital.maedia maedia on (maedia.dmcodi=hg1.hcdxcod)
inner join hosvital.maedia maedia2 on (maedia2.dmcodi= i.ingentdx)
inner join hosvital.maeesp esp on (esp.mecode=hc.hcesp)
where  hc.hisckey in ('79449857','1023025036') and  hc.hisfhorat >= '2020-06-01 00:00:00' and hc.hisfhorat <= '2020-06-30 23:59:59' and hc.hisfhorat = (select max(hc1.hisfhorat)
									from hosvital.hccom1 hc1
									where hc1.histipdoc=hc.histipdoc and hc1.hisckey=hc.hisckey and 											hc1.hctvin1=hc.hctvin1 and hc1.fhcindesp= hc.fhcindesp
									)
           
order by i.mptdoc,i.mpcedu,hc.hisfhorat;

select * from hosvital.hcdiagn where hisckey='79449857';


-- Para sacar el ultimo folio 
-- Ultimo CN

select i.mptdoc as tipo_doc ,i.mpcedu as documento, cap.mpnomc as paciente,  cap.mpfchn as fecha_nacio, i.ingfecadm as fecha_ingreso,  i.ingentdx as dx_ingreso,
hc.hisfhorat as fecha_atencion,  mae.mpnomp as pabellon, esp.menome as nombre_especial,
hg1.hcdxcod   as dx, maedia.dmnomb as nombre_dx
from hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
inner join hosvital.hccom1 hc on (hc.histipdoc = i.mptdoc and hc.hisckey= i.mpcedu and hc.hctvin1 = i.ingcsc and hc.fhcindesp='GN')
left join hosvital.hcdiagn hg1 on (hg1.histipdoc=hc.histipdoc and hg1.hisckey= hc.hisckey and hg1.hiscsec = hc.hiscsec  and hg1.hcdxtip='CN' and hg1.hcdxcls=1)
inner join hosvital.maepab mae on (mae.mpcodp =hc.hccodpab)
inner join hosvital.maedia maedia on (maedia.dmcodi=hg1.hcdxcod)
inner join hosvital.maeesp esp on (esp.mecode=hc.hcesp)
where    hc.hisfhorat >= '2020-06-01 00:00:00' and hc.hisfhorat <= '2020-06-30 23:59:59'  and hc.hisfhorat = (select max(hc1.hisfhorat)
									from hosvital.hccom1 hc1
									where hc1.histipdoc=hc.histipdoc and hc1.hisckey=hc.hisckey and 											hc1.hctvin1=hc.hctvin1 and hc1.fhcindesp= hc.fhcindesp
									) 
order by i.mptdoc,i.mpcedu,hc.hisfhorat;

select distinct hisckey
from hosvital.hccom1
 where hisfhorat>= '2020-06-01 00:00:00'
;