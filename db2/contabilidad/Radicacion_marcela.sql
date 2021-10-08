select *  from hosvital.admglo01 where aglremnr = 24634 ;
select *  from hosvital.admglo11 where aglremnr = 24634 ;

select * from hosvital.movcxc where mccnumobl='615874';

--Caso 0. Testeo

select * from hosvital.admglo01  where aglremfc >= '2020-11-01' and aglremfc <= '2020-11-30';
select * from hosvital.admglo11 where aglremnr=26404;
select * from hosvital.admglo11 where aglremnr=26343;
select * from hosvital.admglo11 where aglremnr=26209	; -- aui muestra remision en nov / radicacion en enero 2021
select * from hosvital.admglo11 where AGLFRDFAC >= '2020-01-01' AND AGLFRDFAC <= '2020-12-31' AND MONTH(AGLFRDFAC)  <>  MONTH(AGLFCHRAD); -- 160
/* ESTAS REMISIONES LES PASA ESO : 24634  25587 25754 25789 25790 25791 25831	25832 25665		*/		


-- Caso Nro 1

select * from hosvital.admglo01 where aglremnr=26435; -- fecha de remision 2021-01-20 / no hay de radicacion
select * from hosvital.admglo11 where aglremnr=26435;
select mpnfac,facfch from hosvital.maeate where mpnfac = 647113	 ;


-- caso Nro 2

select * from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac = '2020-11-30' order by  aglfrdfac;

select * from hosvital.admglo11 where  mpnfac in (640305,640391,640431 );


select count(*) from hosvital.admglo11 where aglfrdfac = '2020-11-20'; -- 64

select * from hosvital.admglo11 where aglfrdfac = '2020-11-20'; --

select count(*) from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30'  and aglconfec ='0001-01-01 00:00:00.0000';

create table hosvital.admglo11_cop_marcela as (select *  from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30'  and aglconfec ='0001-01-01 00:00:00.0000') with data;

select * from hosvital.admglo11_cop_marcela;

select *  from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30'  and aglconfec ='0001-01-01 00:00:00.0000';-- 121
-- remisones nros 26181, 26138, 26159,26189,26191,26193,26195,26197,26198

select * from hosvital.admglo01 where aglremnr in (26181, 26138, 26159,26189,26191,26193,26195,26197,26198);
/*
Remision               tercero                   fecha-hora de remision		fecha-hora de radicacion
26138	860002400-2    	2020-11-24	10:20:37	0	2020-11-25	15:05:52	
26159	860066942-7    	2020-11-03	15:43:55	0	2020-11-25	15:06:32	
26181	900156264-2    	2020-11-19	15:01:47	0	2020-11-20	15:05:12	
26189	860066942-7    	2020-11-24	08:45:23	0	2020-11-25	15:09:38	
26191	860002184-6    	2020-11-25	09:09:43	0	2020-11-25	15:12:38	
26193	860028415-5    	2020-11-25	12:08:39	0	2020-11-25	15:14:50	
26195	860002180-7    	2020-11-26	07:35:36	0	2020-11-26	15:16:53	
26197	891700037-9    	2020-11-26	10:13:26	0	2020-11-26	15:18:13	
26198	800130907-4    	2020-11-26	15:17:50	0	2020-11-27	15:19:39	

*/


update hosvital.admglo11
set
 where  mpnfac in ( );

create table hosvital.admglo11_radica_nov2020 as (select *  from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30'  and aglconfec ='0001-01-01 00:00:00.0000') with data;

select * from hosvital.admglo11_radica_nov2020 ;


select * from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30' order by  aglfchrad;
select * from hosvital.admglo11 where aglfrdfac >= '2020-11-01' and  aglfrdfac <= '2020-11-30' order by  aglconfec;




select count(*) from hosvital.admglo11
where  mpnfac in (select mpnfac from hosvital.admglo11_radica_nov2020); --121

select mpnfac, facfch from hosvital.maeate where mpnfac in (select mpnfac from hosvital.admglo11_radica_nov2020);


/*
update hosvital.admglo11
set aglconfec ='2020-11-30 23:59:59'
where  mpnfac in (select mpnfac from hosvital.admglo11_radica_nov2020);


update hosvital.admglo11
set aglfrdfac ='2020-12-01'
where  mpnfac in (select mpnfac from hosvital.admglo11_radica_nov2020);

*/






select *  from hosvital.admglo11 where aglfchrad >= '2021-01-01 00:00:00' order by aglfchrad;
