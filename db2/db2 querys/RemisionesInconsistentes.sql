


select * from hosvital.admglo11 where  aglremnr =  22722;

select a.aglremnr, sum(b.matotf)
from  hosvital.admglo11 a, hosvital.maeate b
where a.aglremnr in (22726) and a.mpnfac = b.mpnfac and b.maestf  not in ('1','10')
group by a.aglremnr;

-- diferentes 22893 , 22869,  22870,  22872,22873, 22792, 22892,  22917, 22918,  22891,  22839, 22910
-- No actualizar las de arriba


select * from hosvital.admglo11 where aglremnr in (22726);
select * from hosvital.admglo01 where aglremnr in (22753);


/*  Estas  remisiones no cuadran


	
*/

--New case

select a.aglremnr, sum(b.matotf - mavapu),count(*)
from  hosvital.admglo11 a, hosvital.maeate b
where a.aglremnr in (23038,22995,22998,23031,23003,23049,23001,23043,22925,23024,22926,23022,23014,23020,23016,23017,23015,23030,23023,23018,22996,23037,22906,22983,22977,23068,23069,23070,22742,22976,
22984,23066,22882,22883,22975,23052,23039,23041,23111,23113,23109,23129,23071,22987,22981,23060,23063,23062,23048,23061,23044,23118,23142,23134,23120,23121,23124,23045,23065,22805,22805,22885,23027,
23138,23033,22945,22944,23151,22986,22797,23028,23059,22985,23148,22982,23064,22914,23032,23158,23159,23161,22913,22947,22962,22896,22971,22965,23125,23152) and a.mpnfac = b.mpnfac and b.maestf  not in ('1','10')   and a.aglfacdev <> 'D'
group by a.aglremnr
order by  a.aglremnr;

-- Este seria el query masivo


update hosvital.admglo01 x
set x.aglradvr = (select sum(b.matotf - b.mavapu)
	from  hosvital.admglo11 a, hosvital.maeate b
	where a.aglremnr = x.aglremnr and a.mpnfac = b.mpnfac and b.maestf  not in ('1','10')   and a.aglfacdev <> 'D'
	)
where x.aglremnr= 23037  and aglradvr=            86948056.70    ; 




-- esta mal 22910
select * from hosvital.admglo01 where  aglremnr =22807;  --este para pruebas


update hosvital.admglo01 
set aglradvr=     72984138
where  aglremnr =22916;




