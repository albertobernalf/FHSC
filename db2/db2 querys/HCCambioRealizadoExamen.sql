select * from hosvital.hccom1 where hisckey ='79373889 ' and hiscsec = 13;  -- 912002

select * from hosvital.hccom5 where hisckey = '79373889' and hiscsec=13 and HCPRCCOD='912002';

select * from hosvital.hccom51 where hisckey = '79373889' and hiscsec=13 and HCPRCCOD='912002';


select * from hosvital.hccom5 where hisckey = '79373889' and hiscsec=29 and HCPRCCOD='893812';    -- HCPRSTGR ='O';
select * from hosvital.hccom51 where hisckey = '79373889' and hiscsec=29 and HCPRCCOD='893812';  -- HCPRSTGR ='O';


UPDATE HOSVITAL.HCCOM51
SET HCPRCEST = 'A',HCFCHRAP='2019-04-09 07:14:28.000000'
where hisckey = '79373889'  and hiscsec=13 and HCPRCCOD='912002' AND HCPRCCNS=2;--ESTABA EN O

UPDATE HOSVITAL.HCCOM51
SET HCPRCEST = 'A',HCFCHRAP='0001-01-01 00:00:00.000000'
where hisckey = '79373889'  and hiscsec=13 and HCPRCCOD='912002' AND HCPRCCNS=2;--ESTABA EN O

-- en proceso, cuando es cirugia y cancelarla

select * from hosvital.hccom51 where hisckey='19423210' and hcprccod= '471102';
select * from hosvital.hccom51 where hisckey='19423210' and hcprccod= '898201';


UPDATE HOSVITAL.HCCOM51
SET HCPRCEST = 'E' -- ,HCFCHRAP='0001-01-01 00:00:00.000000'
where hisckey = '19423210'  and hiscsec=119 and HCPRCCOD='471102' AND HCPRCCNS=1;--ESTABA EN O


--
select * from hosvital.hccom51 where hisckey='8317989' and hcprccod= '876122';

UPDATE HOSVITAL.HCCOM51
SET HCPRCEST = 'E' -- 
where hisckey = '8317989'  and hiscsec=4 and HCPRCCOD='876122' AND HCPRCCNS=1;  --ESTABA EN O

------------

select * from hosvital.hccom51 where hisckey='3175447' and hcprccod= '452301';

UPDATE HOSVITAL.HCCOM51
SET HCPRCEST = 'E' -- 
where hisckey = '3175447'  and hiscsec=230 and HCPRCCOD='452301' AND HCPRCCNS=1;  --ESTABA EN O

---------------

select * from hosvital.hccom51 where hisckey='41346023' and hcprccod= '883434' and hiscsec=20;

UPDATE HOSVITAL.HCCOM51
SET HCPRCEST = 'E' -- 
where hisckey = '41346023'  and hiscsec=20  and HCPRCCOD='883434';  -- AND HCPRCCNS=1;  --ESTABA EN O

------
select * from hosvital.hccom5 where hisckey='1000253528' ; 

select * from hosvital.hccom51 where hisckey='100283483' and hcprcest= 'O' and hctvin51=5;   -- ' and hcprccod= '441302';
select * from hosvital.hccom51 where hisckey='1023020728' and hcprcest= 'O' and hiscsec in (11) ; -- and hcprccod= '895100';

/* EL UPDATE

UPDATE HOSVITAL.HCCOM51
SET HCPRCEST = 'E'  -- 
where hisckey = '1023020728'  and hcprcest= 'O'      and hiscsec  in (11); 


UPDATE HOSVITAL.HCCOM51
SET  hcdistri = 'S', HCESTDIS='N'  -- 
where hisckey = '41516639'  and hcprcest= 'O'  and hiscsec  in (2); 




select hcdistri, HCESTDIS, count(*)
from hosvital.hccom5
where  hcprchca>='2019-07-02 12:00:00'
group by hcdistri, HCESTDIS;
 

