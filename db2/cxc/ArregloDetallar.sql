select * from hosvital.hojobl where hojnumobl in ('431423','431880','441199') and cntvig=2019;

select * from hosvital.hojobl where hojnumobl in ('431423','431880','441199') and cntvig=2019;

select * from hosvital.hojobl where  clicod='806008394' and cntvig=2019 and (hojtotdeb-hojtotcre) >0;

select * from hosvital.movcxc where mccnumobl   in ('431423',   '564027');

select maestf, mpnfac from hosvital.maeate where mpnfac in ('431423',         	
'431880',
'441199' ,        	
'564027'  ,       	
'566088 ')        	
     	;

select * from hosvital.movcxc where mccnumobl = '441199';

select * from hosvital.cuentas where cntcod='13020601' ;

select * from hosvital.hojobl where hojnumobl in ('565317','566794') and cntvig=2019;

update  hosvital.hojobl set hojesthom='N' where hojnumobl in  ('565317','566794')  and cntvig=2019;