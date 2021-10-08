select * from hosvital.movcont3 where doccod='CEG' AND MVCNRO=34446;  -- LOCAL JULIO
select * from hosvital.movcont2 where doccod='CEG' AND MVCNRO=34446;


-- LOCAL

select * from hosvital.terceros where trcrazsoc like ('BECTON%DIC%');
SELECT * FROM HOSVITAL.RSMAUX WHERE RSMANO=2020 AND RSMMES<=3 AND RSMCTNCON='22050502';
select * from hosvital.resmcue where  rsmano=2020 and rsmmes<=3 and rsmctncon='22050502'  and trccod='860020309';

SELECT * FROM HOSVITAL.NIMOVCON1 WHERE DOCCOD='CEG' AND NIMCNRO= 34446; -- NIIF JULO
SELECT * FROM HOSVITAL.NIMOVCON2 WHERE DOCCOD='CEG' AND NIMCNRO= 34446;

-- NIIF


SELECT * FROM HOSVITAL.NIRSMAUX WHERE NIRCANIO=2020 AND NIRCMES<=3 AND NIRCCUE='22050502';
select * from hosvital.NIRSMGEN  where  NIRCANIO=2020 and NIRCMES <=3 and NIRCCUE='22050502'  and trccod='860020309';

INSERT INTO HOSVITAL.NIRSMGEN VALUES (23036065,'01','22050502',  '001','','','','',    '860020309',    2020,	2,	5,	0.00,	0.00,	9817500.00,
	9817500.00,	'M',	0.00,	0.00);	

);

delete from  HOSVITAL.NIRSMAUX where NIRCIDN=23036065;

select * from hosvital.NIRSMGEN ORDER BY NIRCIDN;
select MAX(NIRCIDN)  from hosvital.NIRSMGEN ; -- 23036064	
select * from hosvital.NIRSMGEN where NIRCIDN >= 23036050;
