select * from hosvital.rsmaux where rsmano=2020 and rsmmes=10 and rsmctncon = '13012501' ;
select * from hosvital.rsmaux where rsmano=2020 and rsmmes=10 and rsmctncon >= '13012501'  ORDER BY rsmctncon;


select * from hosvital.terceros where trcrazsoc like ('%SURA%');
/*
800256161      	
890903790       es con este el problema	

*/

select * from hosvital.resmcue where rsmano=2020 and rsmmes=10 and rsmctncon = '13012501'  and trccod IN ('800256161','890903790');
select * from hosvital.resmcue where rsmano=2020 and rsmmes=10  and trccod IN ('800256161','890903790');

select * from hosvital.resmcue where rsmano=2020 and rsmmes>= 1  and rsmctncon = '13012501'  and trccod IN ('800256161','890903790');

SELECT * FROM HOSVITAL.TERCEROS WHERE TRCCOD IN ('800256161','890903790');

select * from hosvital.movcont2 where mvcanio=2020 and mvcmes=10 and trccod='890903790';
select * from hosvital.movcont3 where doccod='FAD' AND MVCNRO IN (1723,1724);
select * from hosvital.movcont3 where doccod='RNA' AND MVCNRO IN (8219,8267);

update  hosvital.movcont3 
set mvcmayaux='S',MVCMAYGEN='S'
where EMPCOD='01' AND doccod='FAD' AND MVCNRO IN (1723,1724);


select * from hosvital.movcont3 where doccod='FAD' AND MVCNRO IN (1701,1712);