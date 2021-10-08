select * from hosvital.movcxc where mccnumobl='640305';

select * from hosvital.admglo11 where mpnfac >= 640300 order by mpnfac;

select * from hosvital.admglo11 where mpnfac in (640305, 640391,640431,640443);

select * from hosvital.movcxc where mccnumobl in ('640305', '640391','640431','640443');

select * from hosvital.admglo11 where aglfrdfac='2020-11-20' order by mpnfac;

select * from hosvital.admglo11 where aglfrdfac>='2020-11-20' and aglfrdfac<='2020-11-30'  order by mpnfac;
select * from hosvital.admglo11 where aglfrdfac>='2020-11-20' and aglfrdfac<='2020-11-30' and aglcondoc != 'FAD'  order by mpnfac;
select * from hosvital.admglo11 where aglfrdfac>='2020-11-20' and aglfrdfac<='2020-11-30' and aglcondoc = 'FAD'  order by mpnfac;

select aglremnr, mpnfac,aglfrdfac,aglcondoc,aglconnro,aglconfec,aglpercer,aglfchrad from hosvital.admglo11 where aglfrdfac in ('2020-11-20','2020-11-25','2020-11-26','2020-11-27');
select aglremnr, mpnfac,aglfrdfac,aglcondoc,aglconnro,aglconfec,aglpercer,aglfchrad from hosvital.admglo11 where aglfrdfac>='2020-11-01' and aglfrdfac<='2020-11-30' and month(aglfchrad)=12;
select aglremnr, mpnfac,aglfrdfac,aglcondoc,aglconnro,aglconfec,aglpercer,aglfchrad from hosvital.admglo11 where aglfrdfac>='2020-11-01' and aglfrdfac<='2020-11-30' and month(aglfchrad)=11;

select * from hosvital.maeate where mpnfac in (640305,640391);
select * from   hosvital.admglo11 where  mpnfac in (640305,640391);