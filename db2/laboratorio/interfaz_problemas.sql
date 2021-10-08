select * from interlab.detorde where ordferec >= '2020-12-23'  order by ordhorec;  --16:36:28	
-- 52372323 CC 87                          	
select * from interlab.detorde where orclin like ('%70512985%') order by  ordferec,ordhorec;

select * from hosvital.tipproc;

select * from hosvital.hccom51  where hcfchrord >= '2020-12-23 12:00:00' and hcprctpop=2 order by hcfchrord;  -- 2020-12-23 16:43:58.000000	
select * from interlab.detorde where orclin like ('%11374761%') order by  ordferec,ordhorec; -- fol 543
select * from interlab.ordenes where orclin like ('%11374761%')  order by orclin;


select * from interlab.detorde where orclin like ('%11374761%') order by  ordferec,ordhorec; -- fol 543
select * from interlab.ordenes where orclin like ('%11374761%')  order by orclin;


-- Ultima orden a ordenes interfase


select orclin, orfecrec, orhorrec, orfecsol,orhorsol, orcifol from interlab.ordenes where orfecrec>='2020-12-24' order by orfecrec, orhorrec;

select *  from interlab.ordenes where orfecrec>='2020-12-24' order by orfecrec, orhorrec;
select * from interlab.detorde where ordfacfe >= '2020-12-24' order by ordfachr;

select * from hosvital.hccom51 where hisckey='52814933' and hiscsec = 5;  -- 906914    902205   
	
select * from interlab.detorde where orclin like ('%52814933%');

-- caso 2

select *  from interlab.ordenes where orfecrec>='2021-01-23' order by orfecrec, orhorrec;
select * from interlab.detorde where ordfacfe >= '2021-01-23' order by ordfachr;

select * from hosvital.hccom51 where hisckey='1023903404' and hiscsec = 70;  -- 906914    902205   



select * from INTERLAB.ordenes where orclin like('%20210846%');
	
select * from interlab.detorde where orclin like ('%20210846%');


-- general
select * from hosvital.hccom51  where hcfchrord >= '2021-01-23 00:00:00' and hcprctpop=2 order by hcfchrord;  
select * from hosvital.hccom51 WHERE HISCKEY= '20210846' AND HISCSEC=1108;
select * from interlab.result  where refecrep >= '2021-01-23' order by rehorrep;  -- 2020-12-23	19:08:47	
select * from interlab.detresu where redferep >= '2021-01-23' order by redhorep; 