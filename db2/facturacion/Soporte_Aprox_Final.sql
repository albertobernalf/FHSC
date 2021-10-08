select m.menomb,a.mpnfac, a.macscp, a.prcodi,a.mahoncod,a.mpinte,a.mavatp,a.mavlrtot , round( a.mavatp) as redondeado 
from  hosvital.maeate2 a , hosvital.maeate b, hosvital.maeemp m
where a.mpnfac = b.mpnfac and b.mpmeni = m.mennit and a.mafepr >= '2019-04-01 00:00:01'  and a.prcodi in 
(select b.prcodi from   hosvital.maeate2 b where b.mpnfac = a.mpnfac and mod(b.mavatp, 1) <> 0);

select * from hosvital.maeate2;
select * from hosvital.maeate;

select distinct (b.mpnfac) 
from  hosvital.maeate2 a , hosvital.maeate b, hosvital.maeemp m
where a.mpnfac = b.mpnfac and b.mpmeni = m.mennit and a.mafepr >= '2019-04-01 00:00:01'  and a.prcodi in 
(select b.prcodi from   hosvital.maeate2 b where b.mpnfac = a.mpnfac and mod(b.mavatp, 1) <> 0) and a.mpnfac not in
(select mpnfac from hosvital.admglo11)

order by b.mpnfac;

select * from hosvital.admglo11;

select mpnfac,mactving,matotf,matotp,matots, mavals,mavaab,mavapu , facfch,masalcxc  from hosvital.maeate where mpnfac in (
576860,	
577810,	
577871,	
577876,	
577975,	
578050,	
578078,	
578101	




);
/*


577944	1	3467115.75	1967122.75	1499993.00	3229446.75	237669.00	237669.00	2019-05-14	3229446.75	
577944	1	3467116.00	1967123.00	1499993.00	3229447.00	237669.00	237669.00	2019-05-14	3229447.00	


*/