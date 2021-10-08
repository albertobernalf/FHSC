

select * from hosvital.maepab;
select * from hosvital.maepab11 where mpcedu = '15887394' order by hiscamfec;

select * from hosvital.ingresos where mpcedu = '15887394' ; --  estaba ADRES        	

select * from hosvital.maepac where  mpcedu = '15887394' ;;  --AS0012       	
select * from hosvital.tmpfac where tfcedu = '15887394';

update hosvital.ingresos
set ingnit= 'AS0012'
where mpcedu = '15887394' ;

