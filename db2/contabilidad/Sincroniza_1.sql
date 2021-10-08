
select * from hosvital.movcont3;


select count(*)
from hosvital.movcont3
where empcod='01' and  mvcfch >='2020-02-01 00:00:00' and mvcfch <='2020-02-29 23:59:59' and (doccod,mvcnro) not in ( select doccod,nimcnro from hosvital.nimovcon1 where empcod='01');

-- 654	
-- 632
-- 539
-- INAGINO HASTA 532	

select *
from hosvital.movcont3
where empcod='01' and  mvcfch >='2020-02-01 00:00:00' and mvcfch <='2020-02-29 23:59:59' and (doccod,mvcnro) not in ( select doccod,nimcnro from hosvital.nimovcon1 where empcod='01')
ORDER BY  mvcfch;

SELECT * FROM hosvital.NIMOVCON1 WHERE DOCCOD='DRC' AND NIMC1FCH >= '2020-02-01 00:00:00';
--DEBE SUBIR UNOS 100 REGISTROS DEL 6 AL 10 DE FEB
SELECT * FROM hosvital.NIMOVCON2 WHERE DOCCOD='DRC' AND NIMCNRO IN (23939,23940	);

SELECT * FROM hosvital.NIMOVCON2 WHERE DOCCOD='CA' AND NIMCNRO IN (11155,11171,11172,11173,11174,11175);  -- NO ESTAN
SELECT * FROM hosvital.MOVCONT2 WHERE DOCCOD='CA' AND MVCNRO IN (11155,11171,11172,11173,11174,11175);  -- NO ESTAN


SELECT * FROM hosvital.NIMOVCON2 where nimc2anio=2020 and nimc2mes=2 order by nimc2fch;

SELECT * FROM hosvital.NIMOVCON2 WHERE DOCCOD='ROI' AND NIMCNRO IN (3997,3998);  -- NO ESTAN
SELECT * FROM hosvital.MOVCONT2 WHERE DOCCOD='ROI' AND MVCNRO IN (3997,3998);  -- NO ESTAN



SELECT * FROM hosvital.NIMOVCON2 WHERE DOCCOD='CEG' AND NIMCNRO IN (33324,33326,33325);  -- NO ESTAN
SELECT * FROM hosvital.MOVCONT2 WHERE DOCCOD='CEG' AND MVCNRO IN (33324,33326,33325); 



-- parte de 688 que no estan

select * from hosvital.nimovcon1 where empcod='01' and  nimc1fch >='2020-02-01 00:00:00' and nimc1fch <='2020-02-29 23:59:59' 
ORDER BY  nimc1fch;



select *
from hosvital.movcont3
where empcod='01' and  mvcfch >='2020-02-01 00:00:00' and mvcfch <='2020-02-29 23:59:59' and (doccod,mvcnro)  in ( select doccod,nimcnro from hosvital.nimovcon1 where empcod='01')
ORDER BY  mvcfch;

select doccod,count(*) from hosvital.movcont3 
 where   empcod='01' and mvcfch >='2020-02-01 00:00:00' and mvcfch <='2020-02-29 23:59:59'
group by doccod
order by doccod;

select doccod,count(*) from hosvital.nimovcon1
 where   empcod='01' and nimc1fch >='2020-02-01 00:00:00' and nimc1fch <='2020-02-29 23:59:59'
group by doccod
order by doccod;

select count(*)
from hosvital.movcont3
where empcod='01' and  DOCCOD='ROI' AND mvcfch >='2020-02-01 00:00:00' and mvcfch <='2020-02-29 23:59:59' and (doccod,mvcnro) not in ( select doccod,nimcnro from hosvital.nimovcon1 where empcod='01');


select *
from hosvital.movcont3
where empcod='01' and  DOCCOD='ACH' AND mvcfch >='2020-02-01 00:00:00' and mvcfch <='2020-02-29 23:59:59' and (doccod,mvcnro) not in ( select doccod,nimcnro from hosvital.nimovcon1 where empcod='01');

