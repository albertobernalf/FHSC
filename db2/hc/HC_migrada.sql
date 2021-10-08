set schema hosvital;

select  h1.hisckey,h1.hiscsec,h1.hiscfk, h1.hisfhorat,h33.evofec, h33.evohor
from hosvital.hccom1 h1, hosvital.hccom33 h33
where h1.hisckey='686338' and h1.histipdoc=h33.histipdoc and h1.hisckey=h33.hisckey and h1.hiscsec=h33.hiscsec -- and h1.hiscfk<> h33.evofec 
order by h1.hiscsec; -- 16 filas


select  h1.hisckey,h1.hiscsec,h1.hiscfk, h1.hisfhorat,h33.evofec, h33.evohor
from hosvital.hccom1 h1, hosvital.hccom33 h33
where h1.hisckey='686338' and h1.histipdoc=h33.histipdoc and h1.hisckey=h33.hisckey and h1.hiscsec=h33.hiscsec  -- and h1.hiscfk<> h33.evofec 
     and h1.hiscfk <> (select x33.evofec from hosvital.hccom33 x33 where x33.histipdoc=h1.histipdoc and x33.hisckey=h1.hisckey and x33.hiscsec=h1.hiscsec);

select  h1.hisckey,h1.hiscsec,h1.hiscfk, h1.hisfhorat,h33.evofec, h33.evohor
from hosvital.hccom1 h1, hosvital.hccom33 h33
where h1.hisckey='686338' and h1.histipdoc=h33.histipdoc and h1.hisckey=h33.hisckey and h1.hiscsec=h33.hiscsec  -- and h1.hiscfk<> h33.evofec 
     and h33.evofec <> (select h11.hiscfk from hosvital.hccom1 h11 where h11.histipdoc=h1.histipdoc and h11.hisckey=h1.hisckey and h11.hiscsec=h1.hiscsec);

update hosvital.hccom33 h33
set h33.evofec = (select h111.hiscfk
	from hosvital.hccom1 h111
	where h111.histipdoc=h33.histipdoc and h111.hisckey=h33.hisckey and h111.hiscsec=h33.hiscsec)
where h33.hisckey='686338' and h33.histipdoc ='CE'  and h33.evofec <>  (select h11.hiscfk from hosvital.hccom1 h11 where h11.histipdoc=h33.histipdoc and h11.hisckey=h33.hisckey and h11.hiscsec=h33.hiscsec);

select * from hosvital.hccom where hisckey='686338';
select * from hosvital.hccom516 where hisckey='686338';
select * from hosvital.hccom514 where hisckey='686338';


select *  from   hosvital.hccom1
 where hisckey='686338' and   hiscsec=340;

update   hosvital.hccom1
set hiscmmed='MG666'
 where hisckey='686338' and histipdoc='CE' and   hiscsec=340;

select * from hosvital.ingresos where mpcedu= '686338';
select * from hosvital.tmpfac where tfcedu= '686338';

select hisckey, histipdoc,hiscsec, hiscfcon, hisfhorat, date(hisfhorat)  from hosvital.hccom1 where hisckey ='686338'  and   date (hiscfcon) <> date (hisfhorat) order by hiscsec;

update hosvital.hccom1 
set hiscfcon=hisfhorat
 where histipdoc='CE' and  hisckey ='686338'  and   date (hiscfcon) <> date (hisfhorat);

