SELECT  MMESTADO,COUNT(*)
FROM HOSVItal.MAEMED1 
GROUP BY MMESTADO;

/*

A	1638 - 409 = 1229	
I	3182	
	
A	1346	1346 - 1229 = 117
I	3483	

	
	
	
	
	
	

	


*/



select    m1.mmcodm as codigo_medico,
m1. mmnomm as nombre_medico,
m1.MMRegM as registro_medico,
m1.MTipDoc as tipo_docuemnto,
m1.MMCedM as cedula_medico,
m1.MMFIRMA as firma_medico,
m1.mmestado as estado_maemed1,
a.AUsrEst as estado_usuario  
from hosvital.maemed1 as m1
inner join Hosvital.admusr as a on (m1.mmusuario=a.ausrid)
where m1.mmfirma in('no_imagen.jpg','') and m1.MMEstado='A' and a.AUsrEst='S';   --  409


create table hosvital.cop_maemed1 as (select * from hosvital.maemed1) with data;


select count(*) from hosvital.maemed1 ;  -- 4820	
select count(*) from hosvital.cop_maemed1 ;  -- 4820	

select mmestado,count(*) from hosvital.cop_maemed1  group by mmestado; 

/*
A	1638	
I	3182	
	
*/

/*

A	1206	
I	3602	
*/

update  hosvital.maemed1 m1
set m1.MMEstado ='I'
where  m1.mmfirma in('no_imagen.jpg','') and m1.MMEstado='A'  and m1.mmusuario in (select  a.ausrid from hosvital.admusr a
					              where a.ausrest='S'); -- 409

select mmcodm,mmestado from hosvital.maemed1 where mmcodm= 'EJ856';
select mmcodm,mmestado from hosvital.cop_maemed1 where MMEstado='I';