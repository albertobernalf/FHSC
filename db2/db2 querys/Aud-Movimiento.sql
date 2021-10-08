select  * from hosvital.movcont2 where doccod='CCA'  and mvcnro = 2576;
select * from hosvital.cuentas where cntcod= '26200501';

update  hosvital.movcont2
set cntvig=2019
where  doccod='CCA'  and mvcnro = 2576 and cntvig=0;


select  * from hosvital.movcont2 where doccod='CEG'  and mvcnro = 31199;  -- F0321
select * from hosvital.cuentas where cntcod= '26200501';

SELECT * FROM HOSVITAL.DOCUCON WHERE DOCCOD='CEG';  --COMPROBANTE DE EGRESO

update  hosvital.movcont2
set CNCCOD='F0321'
where  doccod='CEG'  and mvcnro = 31199 and CNCCOD='F321' AND MVCCSC = 5 AND MVCVLRLC= 15318.00	
	
