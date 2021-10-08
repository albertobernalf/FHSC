SELECT * FROM HOSVITAL.MOVCONT3 WHERE MVCFCH >='2020-06-01 00:00:00' AND DOCCOD='ISI';


-- Niif

select * from hosvital.nirsmaux where nircemp='01' and nircanio=2020 and nircmes=5 and nirccue like ('11250501%');

select n.nircemp, n.nirccue, n.trccod ,t.trcrazsoc, n.nircgdeb, n.nircgcre, n.nircgact, n.nircgant
from hosvital.nirsmgen  n
inner join hosvital.terceros t on (t.trccod= n.trccod)
where nircemp='01' and nircanio=2020 and nircmes=5 and nirccue like ('11250501%')
order by t.trcrazsoc  asc;

-- Local

select * from hosvital.rsmaux where rsmempcod='01' and rsmano=2020 and rsmmes=5 and rsmctncon like ('11250501%');
select * from hosvital.resmcue;

select r.rsmempcod, r.rsmctncon, r.trccod ,t.trcrazsoc, r.rsmdeb, r.rsmcre, r.rsmsalact, r.rsmsalant
from hosvital.resmcue  r
inner join hosvital.terceros t on (t.trccod= r.trccod)
where r.rsmempcod='01' and r.rsmano=2020 and r.rsmmes=5 and r.rsmctncon like ('11250501%')
order by t.trcrazsoc  asc;


-- 446979	01	11250501            	2020	5	5	4515.54	6010613.23	7919796.14	1913698.45

-- niif 
	
select * from hosvital.nirsmaux where nircemp='01' and nircanio=2020 and nircmes=5 and nirccue like ('11250501%');
--179632	01	11250501            	2020	5	5	4515.54	6010613.23	7919796.00	1913698.31	

