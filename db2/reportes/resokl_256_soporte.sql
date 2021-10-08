
select i.citnum, concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('2','|'), NEXT VALUE FOR hosvital.ley2_256),'|'), c.mptdoc),'|'),c.mpcedu),'|'),year(c.mpfchn)),'-'),month(c.mpfchn)),'-'),day(c.mpfchn)),    case when c.mpsexo='M' then 'H' when c.mpsexo='F' then 'M' else  'I' end    ),'|'),c.mpape1),'|'),c.mpape2),'|'),c.mpnom1),'|'),c.mpnom2),'|'),m.mecodrip),'|'),
case     when i2.citpro>='881112' and i2.citpro<='882841'  then  '8' 
 when i2.citpro>= '883101' and i2.citpro<='883910'  then  '9'  end),'|'),
year(c1.citfchhra)),'-'),  lpad(month(c1.citfchhra),2,'0')),'-'),   lpad(day(c1.citfchhra),2,'0')),'|'),' SI'),'|') ,
year(i.citfecpa)),'-'),  lpad(month(i.citfecpa),2,'0')),'-'),   lpad(day(i.citfecpa),2,'0')),'|'),
year(i.citfecsol)),'-'),  lpad(month(i.citfecsol),2,'0')),'-'),   lpad(day(i.citfecsol),2,'0')),'|')
from hosvital.capbas c
inner join hosvital.citmed1 i on (i.cittipdoc=c.mptdoc and i.citced=c.mpcedu and i.citesta <> 'I')
inner join hosvital.citmed i2 on (i2.citnum= i.citnum)
inner join hosvital.citmed2 i3 on (i3.citnum= i.citnum)
inner join hosvital.ctrlcitas c1 on (c1.citnum= i.citnum and c1.citstscit='R' )
inner join hosvital.maeemp m on (m.mennit = i.citnrocto)
where i.citfecpa >= '2019-01-01'  and i.citfecpa <= '2019-06-30'  and c.mpcedu= '51603507' and ((i2.citpro >='881112'  and  i2.citpro <='882841' )or  (i2.citpro >= '883101' and i2.citpro<='883910'  )) and
           c1.citfchhra = (select min (d.citfchhra) from hosvital.ctrlcitas d where d.citnum=i.citnum and d.citstscit='R')
 ;
-- and having count(*) <= 1
--group by 1;

select * from hosvital.citmed1 where citced= '51603507' ;  --  Este caso se repite y facturado radicado
select * from hosvital.citmed  where citnum  in (526654	,526655	);

select * from hosvital.citmed2  where citnum   in (526654	,526655	);
select * from hosvital.ctrlcitas  where citnum  in (526654	,526655	);

select * from hosvital.ingresos where ingnumcit in ('531121','531122','531135');

/* facturas
584353	
584354	
584355	

*/
	
select * from hosvital.citmed  where citnum  in ('584353','584354','584355');
/*
531121	
531122	
531135	


*/

select  maestf  from hosvital.maeate where mpnfac in ('584353','584354'	,'584355');	  --estan radicadas
