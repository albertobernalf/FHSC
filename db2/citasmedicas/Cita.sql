select  * from hosvital.hojobl where hojnumobl in ('253034','254646');

select  *  from hosvital.admglo11 where  mpnfac  in  (253034,254646);

select * from hosvital.admglo11 where aglfrdfac >='2019-05-01' and   aglfrdfac <='2019-05-31' ; --  aglconfec= '0001-01-01 00:00:00.000000	' , aglpercer='N'

update hosvital.admglo11
set  aglfchrad='2015-11-18 17:07:27.00000', aglfrdfac ='2015-11-17'
where  mpnfac  in  (253034,254646);


select * from hosvital.ingresos where ingfac = 578601; -- 525600	
select * from hosvital.citmed where citnum = 525600;  -- citestp='F'
select * from hosvital.citmed1 where citnum = 525600;  -- citesta='F'
select * from hosvital.ctrlcitas where citnum = 525600;  -- esta facturada


select * from hosvital.ingresos where ingfac = 577442; -- 523375	
	
select * from hosvital.ctrlcitas where citnum = 523375;

select * from hosvital.refact where refatnum = 578601;
select * from hosvital.refact1 where refatnum = 578601;

-- Para poder facturarr en citas medicas una cita medica facturada y anulada

-- cambiar estado en lacitmed a ATENDIDA citest cre
-- cambiar estado en lacitmed1 a ATENDIDA citetpt creo y citfac en 0 CEROS
-- En ctrlcitas cambiar estado a A y estado ATENDIDAD, donde aplique este FACTURADA
