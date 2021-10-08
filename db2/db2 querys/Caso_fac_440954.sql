select * from hosvital.movcont3 where doccod='FAR' and  mvcnro = 440954;
select * from hosvital.movcont2 where doccod='FAR' and  mvcnro = 440954;
select * from hosvital.movcxc where doccod='FAR'    and mccnumobl = '440954' ; -- and  mvcnro = 440954;
select * from hosvital.movcxc where mccnumobl = '440954' ; 

select * from hosvital.maeate where mpnfac = 440954;

select * from hosvital.hojobl where hojnumobl = '440954';

-- 133426142.00	94133653.00	133426142.00	

/*
CAC	COMPROBANTE AJUSTE CARTERA OPERACIONAL REDIG****            	
DRC	DETALLE RECIBOS CAJA CARTERA                                	
FAD	FACTURACION RADICADA                                        	
NCR	NOTA CREDITO FACTURA NO RADICA                              	
NGR	NOTAS CREDITO FAC RADICADA    

C	94784542.00	
D	133426142.00	
94133653.00	133426142.00	

                              	
*/

select * from hosvital.docucon where doccod in ('NGR','DRC','FAD','NCR','CAC');

select * from hosvital.movcxc where mccnumobl = '440954' ; 

select mccnat, sum(mccvlr)
from  hosvital.movcxc 
where mccnumobl = '440954' and doccod not in ('FAD')
group by mccnat ; 

-- estaba 133426142.00	94133653.00	133426142.00	

 
update hosvital.hojobl
set hojtotcre =  94784542
 where hojnumobl = '440954' and cntvig = 2019 and hojtotcre = 94133653.00;	

