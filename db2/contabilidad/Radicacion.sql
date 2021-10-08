select * from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac = '2020-11-30' order by  aglfrdfac;

select * from hosvital.admglo11 where  mpnfac in (640305,640391,640431 );


select count(*) from hosvital.admglo11 where aglfrdfac = '2020-11-20'; -- 64

select * from hosvital.admglo11 where aglfrdfac = '2020-11-20'; --

select count(*) from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30'  and aglconfec ='0001-01-01 00:00:00.0000';



select *  from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30'  and aglconfec ='0001-01-01 00:00:00.0000';-- 121

update hosvital.admglo11
set
 where  mpnfac in ( );

create table hosvital.admglo11_radica_nov2020 as (select *  from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30'  and aglconfec ='0001-01-01 00:00:00.0000') with data;

select * from hosvital.admglo11_radica_nov2020 ;


select * from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30' order by  aglfchrad;
select * from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30' order by  aglconfec;

--


select count(*) from hosvital.admglo11
where  mpnfac in (select mpnfac from hosvital.admglo11_radica_nov2020); --121

/*
update hosvital.admglo11
set aglconfec ='2020-11-30 23:59:59'
where  mpnfac in (select mpnfac from hosvital.admglo11_radica_nov2020);


update hosvital.admglo11
set aglfrdfac ='2020-12-01'
where  mpnfac in (select mpnfac from hosvital.admglo11_radica_nov2020);

*/

select mpnfac, facfch from hosvital.maeate where mpnfac in (select mpnfac from hosvital.admglo11_radica_nov2020);