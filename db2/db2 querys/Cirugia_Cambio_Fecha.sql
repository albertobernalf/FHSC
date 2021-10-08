select * from hosvital.procir where mpcedu = '52414990';
select * from hosvital.procir1 where  procircod =  110409;	
select * from hosvital.procir2 where  procircod =  110409;

select * from hosvital.descirmed where codcir = 110409;
select * from hosvital.descirmed1 where codcir = 110409;


update hosvital.procir
set profec='2019-03-28', profecf='2019-03-28'
 where  procircod =  110409;