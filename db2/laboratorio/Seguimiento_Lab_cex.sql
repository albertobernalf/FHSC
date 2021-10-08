select hisckey,hiscsec,hcfchrord,hcprccod, hcdistri, hcestdis,hcordamb,hcfchrap,hcfecrei,hcfecproi ,hcmedint   from hosvital.hccom51  where  hcfchrord >= '2019-07-09 00:00:00' and hcprctpop='2'
order by hcfchrord;

select * from hosvital.hccom51  where  hcfchrord >= '2019-07-10 00:00:00' and hcprctpop='2';

-- 20520280       	

select hisckey,hiscsec,hcfchrord,hcprccod, hcdistri, hcestdis,hcordamb,hcfchrap,hcfecrei,hcfecproi ,hcmedint  
 from hosvital.hccom51  where  hcfchrord >= '2019-07-09 00:00:00' and hcprctpop='2' and   hisckey='20520280'
order by hcfchrord;

select hisckey,hiscsec,hcfchrord,hcprccod, hcdistri, hcestdis,hcordamb,hcfchrap,hcfecrei,hcfecproi ,hcmedint   from hosvital.hccom51  where  hcfchrord >= '2019-07-09 00:00:00' and hcprctpop='2'
and hcprccod='907106'
order by hcfchrord;  -- 1022977751     	

update hosvital.hccom51
set hcordamb='N'
where hisckey='1141315235' and hiscsec=1 and hcprccod='907106';

select hisckey,hiscsec,hcfchrord,hcprccod, hcdistri, hcestdis,hcordamb,hcfchrap,hcfecrei,hcfecproi ,hcmedint   from hosvital.hccom51  where  hcfchrord >= '2019-07-09 00:00:00' and hcprctpop='2' and   --  hisckey='2341401' and
(histipdoc,hisckey,hctvin51)   NOT  in (select mptdoc,mpcedu,mactving from hosvital.maeate)
order by hcfchrord;


update hosvital.hccom51 set hcestdis='S' where hisckey='23607026' and hiscsec=103 and  hcprccod='903810' and hcfchrap= '0001-01-01 00:00:00.00000';
-- 21226603       	

select * from hosvital.maeate where mpcedu='79759704';

-- Primero conteo por procedimiento de cuales etan distribuidos y cuales Nop
-- Query opacientes ambuklatoris Vs distribucion . Pacintes iotros servicios Vs distrib ucion

select mpcodp, mpcedu,ingcsc  from hosvital.ingresos where mpcedu= '4866505';

select * from hosvital.maepab where mpcodp= 8;  -- consulta externa
--

select h.hcprccod,count(*)
from hosvital.hccom51 h, hosvital.ingresos i
where i.mptdoc=h.histipdoc and h.hisckey=i.mpcedu and i.ingcsc=h.hctvin51 and  h.hcfchrord >= '2019-07-10 00:00:00' and h.hcprctpop='2' and i.mpcodp=8
group by  h.hcprccod
order by hcprccod;



select h.hcprccod,count(*)
from hosvital.hccom51 h, hosvital.ingresos i
where i.mptdoc=h.histipdoc and h.hisckey=i.mpcedu and i.ingcsc=h.hctvin51 and  h.hcfchrord >= '2019-07-10 00:00:00' and h.hcprctpop='2' and i.mpcodp <> 8
group by  h.hcprccod
order by hcprccod;

set schema interpru;
select * from interpru.detorde;
