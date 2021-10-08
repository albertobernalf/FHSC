select * from hosvital.capbas where mpcedu = '79839132';
select * from hosvital.hccom1 where hisckey  = '79839132' order by hiscsec;

select * from hosvital.ingresos where mpcedu='79839132';
select * from hosvital.maeate  where mpcedu='79839132'; -- factura no 605706	  ingreso 1

update  hosvital.ingresos 
set inginslc='S'
where mpcedu='79839132' and ingcsc= 1;