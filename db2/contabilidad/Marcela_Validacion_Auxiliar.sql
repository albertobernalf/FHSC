select * from hosvipru.movcont3 where doccod='CEG' AND MVCNRO=34446;  -- LOCAL JULIO
select * from hosvipru.movcont2 where doccod='CEG' AND MVCNRO=34446;


-- LOCAL

select * from hosvipru.terceros where trcrazsoc like ('BECTON%DIC%');
SELECT * FROM hosvipru.RSMAUX WHERE RSMANO=2020 AND RSMMES<=3 AND RSMCTNCON='22050502';
select * from hosvipru.resmcue where  rsmano=2020 and rsmmes<=3 and rsmctncon='22050502'  and trccod='860020309';

SELECT * FROM hosvipru.NIMOVCON1 WHERE DOCCOD='CEG' AND NIMCNRO= 34446; -- NIIF JULO
SELECT * FROM hosvipru.NIMOVCON2 WHERE DOCCOD='CEG' AND NIMCNRO= 34446;

-- NIIF


SELECT * FROM hosvipru.NIRSMAUX WHERE NIRCANIO=2020 AND NIRCMES<=3 AND NIRCCUE='22050502';
select * from hosvipru.NIRSMGEN  where  NIRCANIO=2020 and NIRCMES <=3 and NIRCCUE='22050502'  and trccod='860020309';

INSERT INTO hosvipru.NIRSMGEN VALUES (18700574,'01','22050502',  '001','','','','',    '860020309',    2020,	1,	5,	0.00,	0.00,	9817500.00,
	9817500.00,	'M',	0.00,	0.00);	

update hosvipru.NIRSMGEN
set nircmes=1,nircgact=0.00
where NIRCIDN=18700574;


delete from  hosvipru.NIRSMAUX where NIRCIDN=18700573;

select * from hosvipru.NIRSMGEN ORDER BY NIRCIDN;
select MAX(NIRCIDN)  from hosvipru.NIRSMGEN ; -- 18700573	
	
select * from hosvipru.NIRSMGEN where NIRCIDN >= 18700573	
;
