select * from hosvital.citmed where citnum=549389;  -- esta en F
select * from hosvital.citmed1 where citnum=549389;  -- esta en F
 

update hosvital.citmed 
set citestp='C'
where citnum = 552101;

select * from hosvital.citmed1 where citnum = 525265;

update hosvital.citmed1
set citesta='C'
where citnum = 552101;

select * from hosvital.tmpfac where tfcedu='19388477';
select * from hosvital.ingresos where mpcedu='19388477';

select * from hosvital.maeemp where mecntr='890903407-9';   -- COMPAÑIA SURAMERICANA DE SEGUROS S.A.	
SELECT * FROM HOSVITAL.HCCOM1 WHERE HISCKEY= '19388477';