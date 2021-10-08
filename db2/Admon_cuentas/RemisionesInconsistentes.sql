


select * from hosvital.admglo11 where  aglremnr =  22722;

select a.aglremnr, sum(b.matotf)
from  hosvital.admglo11 a, hosvital.maeate b
where a.aglremnr in (22726) and a.mpnfac = b.mpnfac and b.maestf  not in ('1','10')
group by a.aglremnr;

-- diferentes 22893 , 22869,  22870,  22872,22873, 22792, 22892,  22917, 22918,  22891,  22839, 22910
-- No actualizar las de arriba


select * from hosvital.admglo11 where aglremnr in (22726);
select * from hosvital.admglo01 where aglremnr in (23379
);


/*  Estas  remisiones no cuadran


	
*/

--New case

select a.aglremnr,adm.aglradvr as vlr_radicado , sum(b.matotf - mavapu) as vlr_facturacion,count(*) as facturas
from  hosvital.admglo11 a, hosvital.maeate b, hosvital.admglo01 adm
where a.aglremnr = adm.aglremnr and
a.aglremnr in (25785) and a.mpnfac = b.mpnfac and b.maestf  not in ('1','10')   and a.aglfacdev <> 'D'
group by a.aglremnr,adm.aglradvr
order by  a.aglremnr;
-- mal  23368
-- Este seria el query masivo


update hosvital.admglo01 x
set x.aglradvr = (select sum(b.matotf - b.mavapu)
	from  hosvital.admglo11 a, hosvital.maeate b
	where a.aglremnr = x.aglremnr and a.mpnfac = b.mpnfac and b.maestf  not in ('1','10')   and a.aglfacdev <> 'D'
	)
where x.aglremnr= 25785 And x.aglradvr=21383786.00				
		 ;	





-- esta mal 22910
select * from hosvital.admglo01 where  aglremnr =22807;  --este para pruebas


update hosvital.admglo01 
set aglradvr=     72984138
where  aglremnr =22916;




