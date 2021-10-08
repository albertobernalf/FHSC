select * from hosvital.movcont3 where doccod='CA' AND MVCNRO =7264;    


UPDATE  hosvital.movcont3
SET MVCFCH ='2019-04-30 00:00:00'
 where doccod='CA' AND MVCNRO =7264; 

select * from hosvital.movcont2 where doccod='CA' AND MVCNRO =7264;  -- ach 1324  30-abril--2019

UPDATE  hosvital.movcont2
SET MVCCFCH ='2019-04-30', MVCMES=4
 where doccod='CA' AND MVCNRO =7264; 


select * from hosvital.NImovcon2  where doccod='LAN'; -- AND NIMCNRO =1604;  -- ach 1324  30-abril--2019
select * from hosvital.nimovcon1  where doccod='LAN' ; -- AND NIMCNRO =1604;  -- ach 1324  30-abril--2019

UPDATE  hosvital.nimovcon1
SET NIMC1FCH ='2019-04-30 00:00:00'
 where doccod='CA' AND NIMCNRO =7264; 

UPDATE  hosvital.nimovcon2
SET NIMC2FCH ='2019-04-30', NIMC2ANIO=4
 where doccod='CA' AND NIMCNRO =7264; 


select * from hosvital.movcxp where doccod='LAN' AND MVCXPNRO = 1604;