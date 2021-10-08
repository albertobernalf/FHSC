select  * from hosvital.ingresos where mpcedu ='14951492';

UPDATE  hosvital.ingresos 
set inginslc='S', INGFECEGR='2021-03-05 12:04:29.00000'  -- ESTABA ''  0001-0100
where mpcedu ='14951492';

UPDATE  hosvital.ingresos 
set inginslc='N',INGFECEGR='0001-01-01 00:00:00.00000'
where mpcedu ='14951492';


select * from hosvital.tmpfac where tfcedu='14951492';

select  mpcedu, ingmotsal from hosvital.ingresos where mpcedu ='14951492';

select distinct(ingmotsal) from hosvital.ingresos;

update hosvital.ingresos  -- 2021-03-05 01:50:00.000000	I718 	MG611  382	 MG611	 727195407 		
set   ingfchm='',ingcaum=''
 where mpcedu ='14951492';

select * from hosvital.hccom1 where hisckey='14951492' order by hiscsec;

select  * from hosvital.ingresos where mpcedu ='51946896';
select mpfesh from hosvital.tmpfac where tfcedu ='51946896';