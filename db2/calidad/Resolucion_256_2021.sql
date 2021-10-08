-- PENDIENTE : Subquery de citas medicas 
-- Los registrios tipos eventos adveross y el otro
-- Solo falta reemplazar eñes ñ
-- Ultima version 2021

--Nombre del Archivo :

 -- MCA195MOCA20190630NI860007373C01.tx
-- MCA195MOCA20190731NI860007373C01.txt
-- MCA195MOCA20200331NI860007373C01.txt
-- MCA195MOCA20200630NI860007373C01.txt
-- MCA195MOCA20200930NI860007373C01.txt
-- MCA195MOCA20201231NI860007373C01.txt
-- MCA195MOCA20210331NI860007373C01.txt
-- MCA195MOCA20210630NI860007373C01.txt

-- Inicializar secuencia

   ALTER SEQUENCE hosvital.ley2_256  RESTART ;


-- 1 Query

-- 1|110010413101|NI|860007373|2021-04-01|2021-06-30|total_registros




-- 2 Query Citas Medicas

/*
b.2 Registro tipo 2 - Registro de detalle de oportunidad en citas
Mediante el registro tipo 2, las entidades reportan el detalle de la información de oportunidad en citas. Se debe reportar un registro tipo 2 por cada cita de primera vez en el año por cada usuario y por cada especialidad, salvo en los procedimientos ecografía y resonancia magnética nuclear para los que se debe diligenciar la información de todas los procedimientos solicitados. Cabe resaltar que la información solicitada es únicamente para las citas o procedimientos no quirúrgicos listados en el campo 11 de este registro de detalle.
*/


select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('2','|'), NEXT VALUE FOR hosvital.ley2_256),'|'), c.mptdoc),'|'),c.mpcedu),'|'),year(c.mpfchn)),'-'),lpad(month(c.mpfchn),2,'0')),'-'),lpad(day(c.mpfchn),2,'0')),'|'),    case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end    ),'|'),replace(mpape1,'Ñ','N')),'|'),replace(mpape2,'Ñ','N')),'|'),replace(c.mpnom1,'Ñ','N')),'|'),replace(c.mpnom2,'Ñ','N')),'|'),m.menomb),'|'),
case     when i2.citpro>='881112' and i2.citpro<='882841'  then  '8' 
 when i2.citpro>= '883101' and i2.citpro<='883910'  then  '9'  end),'|'),
year(c1.citfchhra)),'-'),  lpad(month(c1.citfchhra),2,'0')),'-'),   lpad(day(c1.citfchhra),2,'0')),'|'),'1'),'|') ,
year(i.citfecpa)),'-'),  lpad(month(i.citfecpa),2,'0')),'-'),   lpad(day(i.citfecpa),2,'0')),'|'),
year(i.citfecsol)),'-'),  lpad(month(i.citfecsol),2,'0')),'-'),   lpad(day(i.citfecsol),2,'0'))
from hosvital.capbas c
inner join hosvital.citmed1 i on (i.cittipdoc=c.mptdoc and i.citced=c.mpcedu)
inner join hosvital.citmed i2 on (i2.citnum= i.citnum and i2.citcancep<>'S')
inner join hosvital.citmed2 i3 on (i3.citnum= i.citnum)
inner join hosvital.ctrlcitas c1 on (c1.citnum= i.citnum and c1.citstscit='R')
inner join hosvital.maeemp m on (m.mennit = i.citnrocto)
where  i.citfecpa >= '2021-04-01'  and i.citfecpa <= '2021-06-30' and ((i2.citpro >='881112'  and  i2.citpro <='882841' )or  (i2.citpro >= '883101' and i2.citpro<='883910'  ))
and
           c1.citfchhra = (select min (d.citfchhra) from hosvital.ctrlcitas d where d.citnum=i.citnum and d.citstscit='R')
;
-- order by 1;

-- replace(mpape2,'Ñ','N')

-- query 2.1

select 
concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('2','|'), NEXT VALUE FOR hosvital.ley2_256),'|'), c.mptdoc),'|'),c.mpcedu),'|'),year(c.mpfchn)),'-'),lpad(month(c.mpfchn),2,'0')),'-'),lpad(day(c.mpfchn),2,'0')),'|'),    case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end    ),'|'),replace(mpape1,'Ñ','N')),'|'),creplace(mpape2,'Ñ','N')),'|'),replace(mpnom1,'Ñ','N')),'|'),replace(mpnom2,'Ñ','N')),'|'),m.menomb),'|'),
case     	when i2.citpro='890266' OR i2.citpro='89020205'  then  '3' 
	when i2.citpro='890250' OR i2.citpro='89020227'  OR i2.citpro='89020228'   OR i2.citpro='89030227'   then  '5' 
	when i2.citpro='890235' OR i2.citpro='89020202'  then  '7'  end
),'|'),
year(c1.citfchhra)),'-'),  lpad(month(c1.citfchhra),2,'0')),'-'),   lpad(day(c1.citfchhra),2,'0')),'|'),'1'),'|') ,
year(i.citfecpa)),'-'),  lpad(month(i.citfecpa),2,'0')),'-'),   lpad(day(i.citfecpa),2,'0')),'|'),
year(i.citfecsol)),'-'),  lpad(month(i.citfecsol),2,'0')),'-'),   lpad(day(i.citfecsol),2,'0'))
from hosvital.capbas c
inner join hosvital.citmed1 i on (i.cittipdoc=c.mptdoc and i.citced=c.mpcedu)
inner join hosvital.citmed i2 on (i2.citnum= i.citnum and i2.citcancep<>'S')
inner join hosvital.citmed2 i3 on (i3.citnum= i.citnum)
inner join hosvital.ctrlcitas c1 on (c1.citnum= i.citnum and c1.citstscit='R')
inner join hosvital.maeemp m on (m.mennit = i.citnrocto)
where   i.citfecpa >= '2021-04-01'  and i.citfecpa <= '2021-06-30' 
and i2.citpro in ('890266','89020205', '890250',  '89020227',   '89020228', '89030227',     '890235','89020202')  and i2.citprivez='S'
 and
/* 
concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(c1.citnum,year(c1.citfchhra)),'-'),month(c1.citfchhra)),'-'),day(c1.citfchhra)),' '),hour(c1.citfchhra)) ,':'),minute(c1.citfchhra)),':'),second(c1.citfchhra))           = (select min (concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(c1.citnum,year(x1.citfchhra)),'-'),month(x1.citfchhra)),'-'),day(x1.citfchhra)),' '),hour(x1.citfchhra)) ,':'),minute(x1.citfchhra)),':'),second(x1.citfchhra)))
							       from hosvital.ctrlcitas x1
							       where x1.citnum = c1.citnum and x1.citstscit=c1.citstscit)
*/
c1.citfchhra = (select min (d.citfchhra) from hosvital.ctrlcitas d where d.citnum=i.citnum and d.citstscit='R')
;


--order by c.mpape1,c.mpape2,c.mpnom1,c.mpnom2;

select * from hosvital.citmed where citfec >='2018-01-01' and citpro  in ('890201','890203','890202');
select * from hosvital.maePRO where PRNOMB  like('%CONSULTA%PRIMERA%MEDI%GENERA%'); 890201    89020202 
select * from hosvital.maePRO where PRNOMB  like('%CONSULTA%PRIMERA%ODONTO%');  -- 890203   	
select * from hosvital.maePRO where PRNOMB  like('%CONSULTA%PRIMERA%INTERNA%');  -- 890266   , 89020205 	
select * from hosvital.maePRO where PRNOMB  like('%CONSULTA%PRIMERA%PEDIATRIA%'); -- 89020213  89030213 	 	
select * from hosvital.maePRO where PRNOMB  like('%CONSULTA%PRIMERA%CIRUGIA%GENERA%');  -- 890235   	 89020202 	
	


-- 3er Query

select
concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(
concat(concat(concat(concat(concat('3','|'), NEXT VALUE FOR hosvital.ley2_256),'|'),'NI'),'830007373'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |')
from sysibm.sysdummy1 ;


-- 4to Query


/*

b.4 Registro tipo 4 - Registro de detalle de programación de procedimientos quirúrgicos realizados en quirófano
Mediante el registro tipo 4, las entidades reportan el detalle de la información de la programación de procedimientos quirúrgicos realizados en quirófano. Se debe reportar un registro tipo 4 por cada procedimiento quirúrgico realizado en quirófano aplicados a un usuario en el periodo de reporte. La información solicitada es únicamente para los procedimientos quirúrgicos realizados en quirófano con codificación CUPS entre 01.0.1.01 y 86.9.7.00. La codificación CUPS se encuentra descrita en la Resolución 4678 de 2015.
*/

-- 4.1. Cirugias Query Coprrecto

select 
concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('4', '|'),NEXT VALUE FOR hosvital.ley2_256), '|'),c.mptdoc), '|'),c.mpcedu), '|'),varchar_format(c.mpfchn,'YYYY')), '-'),varchar_format(c.mpfchn,'MM')), '-'),varchar_format(c.mpfchn,'DD')), '|'),case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end), '|'),replace(c.mpape1,'Ñ','N')), '|'),replace(c.mpape2,'Ñ','N')), '|'),replace(c.mpnom1 ,'Ñ','N')), '|'),replace(c.mpnom2,'Ñ','N')), '|'),
 m11.menomb), '|'),      concat(m1.mdcodd,   CASE WHEN M1.MDCODD='11' THEN '001' ELSE                    lpad(m1.mdcodm,3,'0') END)              ), '|'),
p1.crgcod), '|'),year(p.profsep)), '-'),lpad(month(p.profsep),2,'0')), '-'),lpad(day(p.profsep),2,'0')), '|'), year(p.profec)), '-'),lpad(month(p.profec),2,'0')), '-'),lpad(day(p.profec),2,'0')), '|'),case when p1.crgest ='S' then '1' when p1.crgest ='N' then '2'       end), '|'), '|') ,
CASE WHEN p1.crgest='S' then ' ' else  '1' end)       ,'|'),
case when  p1.crgest='S' then '2' else '1' end)  -- ,'SI',' ','NO'
from hosvital.procir p
inner join hosvital.capbas c on (c.mptdoc=p.mptdoc and c.mpcedu=p.mpcedu)
inner join hosvital.procir1 p1 on (p1.procircod=p.procircod)
inner join hosvital.maedmb m on (  m.mdcodd =c.mdcodd)
inner join hosvital.maeemp m11 on (m11.mennit=p.proeps)
inner join hosvital.maedmb1 m1  on (m1.mdcodd=c.mdcodd and m1.mdcodm=c.mdcodm)
where    p.profec >= '2021-04-01' and p.profec <= '2021-06-30' and  p1.crgcod >='010101' and p1.crgcod <= '869700' and p.proesta in ('4','5')   and p1.crgest='S' 
order by p.procircod ;

-- 4.2 Canceladas Query correcto

select 
concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('4', '|'),NEXT VALUE FOR hosvital.ley2_256), '|'),c.mptdoc), '|'),c.mpcedu), '|'),varchar_format(c.mpfchn,'YYYY')), '-'),varchar_format(c.mpfchn,'MM')), '-'),varchar_format(c.mpfchn,'DD')), '|'),case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end), '|'),replace(c.mpape1,'Ñ','N')), '|'),replace(c.mpape2,'Ñ','N')), '|'),replace(c.mpnom1,'Ñ','N')), '|'),replace(c.mpnom2,'Ñ','N')), '|'),
 m11.menomb), '|'),      concat(m1.mdcodd,   CASE WHEN M1.MDCODD='11' THEN '001' ELSE                    lpad(m1.mdcodm,3,'0') END)              ), '|'),
p1.crgcod), '|'),year(p.profsep)), '-'),lpad(month(p.profsep),2,'0')), '-'),lpad(day(p.profsep),2,'0')), '|'), year(p.profec)), '-'),lpad(month(p.profec),2,'0')), '-'),lpad(day(p.profec),2,'0')), '|'),
2), '|'), '|') ,
CASE WHEN P.Promtcntp= '1' THEN '1' WHEN P.Promtcntp= '2' THEN '2'  WHEN P.Promtcntp= '3' THEN '3'  END)       ,'|'),2)
from hosvital.procir p
inner join hosvital.capbas c on (c.mptdoc=p.mptdoc and c.mpcedu=p.mpcedu)
inner join hosvital.procir1 p1 on (p1.procircod=p.procircod)
inner join hosvital.maedmb m on (  m.mdcodd =c.mdcodd)
inner join hosvital.maeemp m11 on (m11.mennit=p.proeps)
inner join hosvital.maedmb1 m1  on (m1.mdcodd=c.mdcodd and m1.mdcodm=c.mdcodm)
where p.profec >= '2021-04-01' and p.profec <= '2021-06-30' and  p1.crgcod >='010101' and p1.crgcod <= '869700' and p.proesta in ('3')  
order by p.procircod;

-- 5to Query

select
concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(
concat(concat(concat(concat(concat('5','|'), NEXT VALUE FOR hosvital.ley2_256),'|'),'NI'),'830007373'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |'),'    |')
from sysibm.sysdummy1 ;


-- 6to Query


/*

b.6 Registro tipo 6 - Registro de detalle de urgencias (Triage II).
Mediante el registro tipo 6, las entidades reportan el detalle de la información de urgencias (Triage II) ocurridas durante el período de reporte.
*/


select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('6','|'),NEXT VALUE FOR hosvital.ley2_256),'|'), c.mptdoc),'|'),c.mpcedu),'|'),   varchar_format(c.mpfchn,'YYYY')),'-'),varchar_format(c.mpfchn,'MM')),'-'),varchar_format(c.mpfchn,'DD')  ),'|'),case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end),'|'),c.mpape1),'|'),c.mpape2),'|'),c.mpnom1),'|'),c.mpnom2),'|'),m11.menomb),'|'),
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(year(h1.hisfhorat),'-'),varchar_format(h1.hisfhorat,'MM')),'-'),varchar_format(h1.hisfhorat,'DD')),'|'), varchar_format(h1.hisfhorat,'HH24')),':'),varchar_format(h1.hisfhorat,'MI')),'|')
 from hosvital.hccom1 h1 
where h1.histipdoc=i.mptdoc  and h1.hisckey=i.mpcedu and h1.hctvin1 = i.ingcsc and h1.hiscltr='2' and h1.fhcindesp='TR'

) as fecha_triage,
(select MIN(concat(concat(concat(concat(concat(concat(concat(concat(year(h1.hisfhorat),'-'),varchar_format(h1.hisfhorat,'MM')),'-'),varchar_format(h1.hisfhorat,'DD')),'|'), varchar_format(h1.hisfhorat,'HH24')),':'),varchar_format(h1.hisfhorat,'MI')))
 from hosvital.hccom1 h1 
where h1.histipdoc=i.mptdoc  and h1.hisckey=i.mpcedu and h1.hctvin1 = i.ingcsc and h1.fhcindesp='GN' and h1.hisfhorat = (select min(h11.hisfhorat)  from hosvital.hccom1 h11 
where h11.histipdoc=i.mptdoc  and h11.hisckey=i.mpcedu and h11.hctvin1 = i.ingcsc and  h11.fhcindesp=h1.fhcindesp)

) as fecha_consulta
from hosvital.capbas c
inner join hosvital.ingresos  i on (i.mptdoc=c.mptdoc and i.mpcedu=c.mpcedu)
inner join hosvital.hccom1 h111 on (h111.histipdoc=i.mptdoc and h111.hisckey=i.mpcedu and h111.hctvin1 = i.ingcsc and h111.fhcindesp='TR'  and  h111.hiscltr='2')
inner join hosvital.maeemp m11 on (m11.mennit=h111.FHCCodCto)
where  i.ingfecadm >= '2021-04-01 00:00:00' and i.ingfecadm  <= '2021-06-30 23:59:59'  and i.mpcodp in (1,18,20,21,35,38,39,40);
 
------------
-- segunda parte
-------

select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('6','|'),NEXT VALUE FOR hosvital.ley2_256),'|'), c.mptdoc),'|'),c.mpcedu),'|'),   varchar_format(c.mpfchn,'YYYY')),'-'),varchar_format(c.mpfchn,'MM')),'-'),varchar_format(c.mpfchn,'DD')  ),'|'),case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end),'|'),replace(c.mpape1,'Ñ','N')),'|'),replace(c.mpape2,'Ñ','N')),'|'),replace(c.mpnom1,'Ñ','N')),'|'),replace(c.mpnom2,'Ñ','N')),'|'),m11.menomb),'|'),
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(year(h1.hisfhorat),'-'),varchar_format(h1.hisfhorat,'MM')),'-'),varchar_format(h1.hisfhorat,'DD')),'|'), varchar_format(h1.hisfhorat,'HH24')),':'),varchar_format(h1.hisfhorat,'MI')),'|')
 from hosvital.hccom1 h1 
where h1.histipdoc=i.mptdoc  and h1.hisckey=i.mpcedu and h1.hctvin1 = i.ingcsc and h1.hiscltr='2' and h1.fhcindesp='TR'

) as fecha_triage,
(select MIN(concat(concat(concat(concat(concat(concat(concat(concat(year(h1.hisfhorat),'-'),varchar_format(h1.hisfhorat,'MM')),'-'),varchar_format(h1.hisfhorat,'DD')),'|'), varchar_format(h1.hisfhorat,'HH24')),':'),varchar_format(h1.hisfhorat,'MI')))
 from hosvital.hccom1 h1 
where h1.histipdoc=i.mptdoc  and h1.hisckey=i.mpcedu and h1.hctvin1 = i.ingcsc and h1.fhcindesp='GN' and h1.hisfhorat = (select min(h11.hisfhorat)  from hosvital.hccom1 h11 
where h11.histipdoc=i.mptdoc  and h11.hisckey=i.mpcedu and h11.hctvin1 = i.ingcsc and  h11.fhcindesp=h1.fhcindesp)

) as fecha_consulta
from hosvital.capbas c
inner join hosvital.ingresos  i on (i.mptdoc=c.mptdoc and i.mpcedu=c.mpcedu)
inner join hosvital.hccom1 h111 on (h111.histipdoc=i.mptdoc and h111.hisckey=i.mpcedu and h111.hctvin1 = i.ingcsc and h111.fhcindesp='TR'  and  h111.hiscltr='2')
inner join hosvital.maeemp m11 on (m11.mennit=h111.FHCCodCto)
where  i.ingfecadm >= '2021-04-01 00:00:00' and i.ingfecadm  <= '2021-06-30 23:59:59' ; -- and i.mpcodp in (1,18,20,21,35,38,39,40)
 



