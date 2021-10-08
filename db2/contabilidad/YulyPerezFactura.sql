select count(*) from hosvital.movcont2 where doccod='FAR' AND MVCNRO = 646674 ; --AND  MVCVLR=28647 ;
select * from hosvital.NIMOVCON2 where doccod='FAR' AND NIMCNRO = 646674 AND NIMC2CPT LIKE ('%890413%');

UPDATE  hosvital.NIMOVCON2
SET NIM2CVL=4000,NIM2C2VLR=40000
 where doccod='FAR' AND NIMCNRO = 646674 AND  NIMC2CSC= 113 AND NIMC2CPT LIKE ('%890413%');


select * from hosvital.movcont2 where doccod='FAR' AND MVCNRO = 644785 AND  MVCVLR=28647;
select * from hosvital.NIMOVCON2 where doccod='FAR' AND NIMCNRO = 646674 AND NIMC2CPT LIKE ('%890413%');

UPDATE  hosvital.NIMOVCON2
SET NIMc2VL=3814,NIMC2VLR=3814
 where doccod='FAR' AND NIMCNRO = 644785 AND  NIMC2CSC= 24;
