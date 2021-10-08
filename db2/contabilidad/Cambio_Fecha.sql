-- En comprobantes de egreso solo la fecha
--  los datos no se pueden modificar
-- Es necesario la autorizacion de la jefe Yuly Ballesteros


select * from hosvital.movcont3 where doccod='ACH' and mvcnro in  (1518);  -- 2019-09-02 10:48:02.000000	
select * from hosvital.movcont2 where doccod='ACH' and mvcnro in (1518) ;
select * from hosvital.movcXC where doccod='ACH' and mvcXCnro in (1347,1348) ;


select * from hosvital.movBAN where doccod='ACH'  and MVBNROCMP in (1518) ;


SELECT * FROM HOSVITAL.DOCUCON WHERE  DOCCOD ='ACH';

SELECT * FROM HOSVITAL.MOVCONT3 WHERE  EMPCOD='01' AND DOCCOD='CNS' AND MVCNRO in (1234);
SELECT * FROM HOSVITAL.MOVCONT2 WHERE  EMPCOD='01' AND DOCCOD='CNS' AND MVCNRO in (1234);

update
hosvital.movcont3 
set mvcfch='2021-05-31 00:00:00.00000'
 WHERE  EMPCOD='01' AND DOCCOD='ACH' AND MVCNRO in (1518);

update
hosvital.movcont2
set mvccfch='2021-05-31',mvcmes=5
 WHERE  EMPCOD='01' AND DOCCOD='ACH' AND MVCNRO in (1518);

update
hosvital.MOVBAN
set MVBFCH='2021-05-31 00:00:00'
where doccod='ACH' and   MVBNROCMP in (1518) ;


update
hosvital.movcont3 
set mvcfch='2019-05-31 00:00:00'
where doccod='FV' and mvcnro  in (56) ;

select * from hosvital.movcont2 where doccod='PCP' and mvcnro in (2242) ;

update
hosvital.movcont2
set mvccfch='2019-09-30',mvcmes=9
where doccod='PCP' and mvcnro in (2242) ;

select * from hosvital.nimovcon2 where doccod='FV' and nimcnro in (98);

select * from hosvital.nimovcon1 where doccod='PCP' and nimcnro in (2242);
select * from hosvital.nimovcon1 where doccod='RSD' and nimcnro in (559);
select * from hosvital.nimovcon1 where doccod='RSD' and nimcnro in (561);

select * from hosvital.movcont3 where doccod='DRC' and mvcnro in (23232) ;
select * from hosvital.movcont2 where doccod='DRC' and mvcnro in (23232) ;
select * from hosvital.movcXC where doccod='DRC' and mvcXCnro in (23232) ;

update
hosvital.movcont3 
set mvcfch='2020-08-31 00:00:00'
where doccod='HON' and mvcnro  in (17781) ;

select * from hosvital.movcont2 where doccod='NGR' and mvcnro in (31637, 31638,31639,31640) ;

update
hosvital.movcont2
set mvccfch='2019-08-31',mvcmes=8
where doccod='ACH' and mvcnro in (1363) ;



update
hosvital.movcXC
set MCCFCH='2019-05-31 00:00:00'
where doccod='DRC' and mvcXCnro in (23232) ;


--- NIF

select * from hosvital.nimovcon1 where doccod='HON' and nimcnro in (17781) ;

UPDATE  hosvital.nimovcon1 
SET NIMC1FCH= '2020-08-31 00:00:00.00000'
where doccod='HON' and nimcnro in (17781) ;


select * from hosvital.nimovcon2 where doccod='HON' and nimcnro in  (17781);

UPDATE  hosvital.nimovcon2
SET NIMC2FCH= '2020-08-31' , NIMC2MES=8
where doccod='HON' and nimcnro in (17781) ;




select * from hosvital.movcont3 where doccod='NBN' AND MVCNRO = 3370;
select * from hosvital.movcont2 where doccod='NBN' AND MVCNRO = 3370;


UPDATE  hosvital.movcont2
SET CNTCOD= '21050502'
 where doccod='NBN' AND MVCNRO = 3050 AND MVCCSC=2;

UPDATE  hosvital.movcont2
SET CNTCOD= '11200501'
 where doccod='NBN' AND MVCNRO = 3050 AND MVCCSC=1;


SELECT * FROM HOSVITAL.NIMOVCON2 WHERE DOCCOD='NBN' AND NIMCNRO=3370;

UPDATE  HOSVITAL.NIMOVCON2
SET NICNTCOD= '11200501'
 where doccod='NBN' AND NIMCNRO = 3050 AND NIMC2CSC=1;

UPDATE  HOSVITAL.NIMOVCON2
SET NICNTCOD= '21050502'
 where doccod='NBN' AND NIMCNRO = 3050 AND NIMC2CSC=2;
