-- Querys Certificados de Retenciones


SELECT * FROM HOSVITAL.RESMCUE  WHERE RSMANO=2020 AND RSMMES>=12  AND TRCCOD='17068260'  AND RSMCTNCON='23654004';

select  * from hosvital.movcont2 where mvcanio=2020 and trccod='830023819' and  cntcod ='23658504';

select  mvcimpcod, mvcnat, sum(mvcbse)  base  , sum(mvcvlr) total  from hosvital.movcont2 where mvcanio=2020 and trccod='830023819' and  cntcod ='23658504'   group by mvcimpcod,mvcnat;	

