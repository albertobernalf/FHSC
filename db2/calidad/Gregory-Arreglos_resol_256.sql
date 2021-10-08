   ALTER SEQUENCE hosvital.ley2_256  RESTART;


--Query Cirugias: Sugenrecia por la Factura ? que pabellones o por el ingreso -- la misma consulta me dan 179 y antes como 770 semestre pasado

select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('4', '|'),NEXT VALUE FOR hosvital.ley2_256), '|'),c.mptdoc), '|'),c.mpcedu), '|'),varchar_format(c.mpfchn,'YYYY')), '-'),varchar_format(c.mpfchn,'MM')), '-'),varchar_format(c.mpfchn,'DD')), '|'),case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end), '|'),c.mpape1), '|'),c.mpape2), '|'),c.mpnom1), '|'),c.mpnom2), '|'),
 m11.menomb), '|'),concat(m1.mdcodd,lpad(m1.mdcodm,3,'0'))), '|'),
p1.crgcod), '|'),year(p.profsep)), '-'),lpad(month(p.profsep),2,'0')), '-'),lpad(day(p.profsep),2,'0')), '|'), year(p.profec)), '-'),lpad(month(p.profec),2,'0')), '-'),lpad(day(p.profec),2,'0')), '|'),case when p1.crgest ='S' then '1' when p1.crgest ='N' then '2'       end), '|'), '|') -- ,'SI',' ','NO'
from hosvital.procir p
inner join hosvital.capbas c on (c.mptdoc=p.mptdoc and c.mpcedu=p.mpcedu)
inner join hosvital.procir1 p1 on (p1.procircod=p.procircod)
inner join hosvital.maedmb m on (  m.mdcodd =c.mdcodd)
inner join hosvital.maeemp m11 on (m11.mennit=p.proeps)
inner join hosvital.maedmb1 m1  on (m1.mdcodd=c.mdcodd and m1.mdcodm=c.mdcodm)
inner join hosvital.maeate mae on (mae.mptdoc=p.mptdoc and mae.mpcedu=p.mpcedu and mae.mactving = p.proctvin and mae.mpmeni=p.proeps)
where    p.profec >= '2020-01-01' and p.profec <= '2020-03-31' and  p1.crgcod >='010101' and p1.crgcod <= '869700' and p.proesta in ('4','5') and p1.crgest='S' 
 and mae.faccodpab in ('8','10','41','42') ;
--  and i.mpcodp in ('8','10','41','42') ;

select * from hosvital.procir where mpcedu='19211135';
select * from hosvital.procir1 where procircod in ('115553','115616') ;
select * from hosvital.maeemp where mennit='85';
select * from hosvital.capbas where mpcedu='19211135'; -- mmcodm =18 / mccodd=11
select * from  hosvital.maedmb;
select * from hosvital.maeate where mpcedu= '19211135';

select * from  hosvital.maedmb1 where mdcodd='11' and mdcodm =18 ;

select * from hosvital.maeate;
select * from hosvital.maepab order by mpcodp;

-- Otra  version originar de  las cirugias noriginales. Conclute toca filtrar pabellones Consultya externa, cirugia, cirugia hemodinamia --porque asi no mas salen com 3316

select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('4', '|'),NEXT VALUE FOR hosvital.ley2_256), '|'),c.mptdoc), '|'),c.mpcedu), '|'),varchar_format(c.mpfchn,'YYYY')), '-'),varchar_format(c.mpfchn,'MM')), '-'),varchar_format(c.mpfchn,'DD')), '|'),case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end), '|'),c.mpape1), '|'),c.mpape2), '|'),c.mpnom1), '|'),c.mpnom2), '|'),
 m11.menomb), '|'),concat(m1.mdcodd,lpad(m1.mdcodm,3,'0'))), '|'),
p1.crgcod), '|'),year(p.profsep)), '-'),lpad(month(p.profsep),2,'0')), '-'),lpad(day(p.profsep),2,'0')), '|'), year(p.profec)), '-'),lpad(month(p.profec),2,'0')), '-'),lpad(day(p.profec),2,'0')), '|'),case when p1.crgest ='S' then '1' when p1.crgest ='N' then '2'       end), '|'), '|') -- ,'SI',' ','NO'
from hosvital.procir p
inner join hosvital.capbas c on (c.mptdoc=p.mptdoc and c.mpcedu=p.mpcedu)
inner join hosvital.procir1 p1 on (p1.procircod=p.procircod)
inner join hosvital.maedmb m on (  m.mdcodd =c.mdcodd)
inner join hosvital.maeemp m11 on (m11.mennit=p.proeps)
inner join hosvital.maedmb1 m1  on (m1.mdcodd=c.mdcodd and m1.mdcodm=c.mdcodm)
where  p.profec >= '2019-07-01' and p.profec <= '2019-12-31' and   p1.crgcod >='010101' and p1.crgcod <= '869700' and p.proesta in ('4','5') and p1.crgest='S'  ;


-- Query Triage -- Solo miro todos los pacbelleone y triage 1 y 2 -- 246



select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('6','|'),NEXT VALUE FOR hosvital.ley2_256),'|'), c.mptdoc),'|'),c.mpcedu),'|'),   varchar_format(c.mpfchn,'YYYY')),'-'),varchar_format(c.mpfchn,'MM')),'-'),varchar_format(c.mpfchn,'DD')  ),'|'),case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end),'|'),c.mpape1),'|'),c.mpape2),'|'),c.mpnom1),'|'),c.mpnom2),'|'),m11.menomb),'|'),
(select concat(concat(concat(concat(concat(concat(concat(concat(concat(year(h1.hisfhorat),'-'),varchar_format(h1.hisfhorat,'MM')),'-'),varchar_format(h1.hisfhorat,'DD')),'|'), varchar_format(h1.hisfhorat,'HH24')),':'),varchar_format(h1.hisfhorat,'MI')),'|')
 from hosvital.hccom1 h1 
where h1.histipdoc=i.mptdoc  and h1.hisckey=i.mpcedu and h1.hctvin1 = i.ingcsc and h1.hiscltr='2' and h1.fhcindesp='TR'

) as fecha_triage,
(select concat(concat(concat(concat(concat(concat(concat(concat(year(h1.hisfhorat),'-'),varchar_format(h1.hisfhorat,'MM')),'-'),varchar_format(h1.hisfhorat,'DD')),'|'), varchar_format(h1.hisfhorat,'HH24')),':'),varchar_format(h1.hisfhorat,'MI'))
 from hosvital.hccom1 h1 
where h1.histipdoc=i.mptdoc  and h1.hisckey=i.mpcedu and h1.hctvin1 = i.ingcsc and h1.fhcindesp='GN' and h1.hisfhorat = (select min(h11.hisfhorat)  from hosvital.hccom1 h11 
where h11.histipdoc=i.mptdoc  and h11.hisckey=i.mpcedu and h11.hctvin1 = i.ingcsc and  h11.fhcindesp=h1.fhcindesp)

) as fecha_consulta
from hosvital.capbas c
inner join hosvital.ingresos  i on (i.mptdoc=c.mptdoc and i.mpcedu=c.mpcedu)
inner join hosvital.hccom1 h111 on (h111.histipdoc=i.mptdoc and h111.hisckey=i.mpcedu and h111.hctvin1 = i.ingcsc and h111.fhcindesp='TR'  and  h111.hiscltr in ('2'))
inner join hosvital.maeemp m11 on (m11.mennit=h111.FHCCodCto)
where  i.ingfecadm >= '2020-01-01 00:00:00' and i.ingfecadm  <= '2020-03-31 23:59:59' ; -- and i.mpcodp in (1,18,20,21,35,38,39,40,19)
 ;

select * from hosvital.maepab where mpcodp  in (1,18,20,21,35,38,39,40);
select * from hosvital.maepab order by mpcodp;

 -- resonancias - Ecografias : solo me dan 33

select 
concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('2','|'), NEXT VALUE FOR hosvital.ley2_256),'|'), c.mptdoc),'|'),c.mpcedu),'|'),year(c.mpfchn)),'-'),lpad(month(c.mpfchn),2,'0')),'-'),lpad(day(c.mpfchn),2,'0')),'|'),    case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end    ),'|'),c.mpape1),'|'),c.mpape2),'|'),c.mpnom1),'|'),c.mpnom2),'|'),m.menomb),'|'),
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
where   i.citfecpa >= '2020-01-01'  and i.citfecpa <= '2020-03-31' 

and i2.citpro in ('890266','89020205', '890250',  '89020227',   '89020228', '89030227',     '890235','89020202')  and i2.citprivez='S'

 and
/* 
concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(c1.citnum,year(c1.citfchhra)),'-'),month(c1.citfchhra)),'-'),day(c1.citfchhra)),' '),hour(c1.citfchhra)) ,':'),minute(c1.citfchhra)),':'),second(c1.citfchhra))           = (select min (concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(c1.citnum,year(x1.citfchhra)),'-'),month(x1.citfchhra)),'-'),day(x1.citfchhra)),' '),hour(x1.citfchhra)) ,':'),minute(x1.citfchhra)),':'),second(x1.citfchhra)))
							       from hosvital.ctrlcitas x1
							       where x1.citnum = c1.citnum and x1.citstscit=c1.citstscit)
*/
c1.citfchhra = (select min (d.citfchhra) from hosvital.ctrlcitas d where d.citnum=i.citnum and d.citstscit='R')
;

SELECT * FROM HOSVITAL.CITMED;

SELECT * FROM HOSVITAL.CITMED1 WHERE CITCED= ' ';

SELECT * FROM HOSVITAL.MAEPRO WHERE PRCODI IN ('890266','89020205', '890250',  '89020227',   '89020228', '89030227',     '890235','89020202');





select * from hosvital.maepro where prcodi in  ('890266','89020205', '890250',  '89020227',   '89020228', '89030227',     '890235','89020202') ;
select * from hosvital.maepro where prnomb like ('%PRIMERA%');

-- Citas de COnsulta Externa


select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('2','|'), NEXT VALUE FOR hosvital.ley2_256),'|'), c.mptdoc),'|'),c.mpcedu),'|'),year(c.mpfchn)),'-'),lpad(month(c.mpfchn),2,'0')),'-'),lpad(day(c.mpfchn),2,'0')),'|'),    case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end    ),'|'),c.mpape1),'|'),c.mpape2),'|'),c.mpnom1),'|'),c.mpnom2),'|'),m.menomb),'|'),
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
where i.citfecpa >= '2020-01-01'  and i.citfecpa <= '2020-03-31' and ((i2.citpro >='881112'  and  i2.citpro <='882841' )or  (i2.citpro >= '883101' and i2.citpro<='883910'  ))
and
           c1.citfchhra = (select min (d.citfchhra) from hosvital.ctrlcitas d where d.citnum=i.citnum and d.citstscit='R')
;