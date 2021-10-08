-- caso 2

select * from hosvital.hccom51 where hisckey='28880622' and hcfchrord >= '2021-01-14 00:22:18'  and hcprccod='906913'; -- 255

select * from INTERLAB.ordenes where orclin like('%28880622 CC 255%');
	
select * from interlab.detorde where orclin like ('%28880622 CC 255%') ; -- AND ORDCODEX= '906913' ;

select * from interlab.detorde where ordfacfe >= '2021-01-01' and ORDCODEX= '906913' order by ordfacfe ;

select * from hosvital.hccom51 where hcfchrord >= '2021-01-01 00:00:00'  and hcprccod='906913' ORDER BY hcfchrord ;
-- general
select * from hosvital.hccom51  where hcfchrord >= '2020-12-24 08:00:00' and hcprctpop=2 order by hcfchrord;  
select * from hosvital.hccom51 WHERE HISCKEY= '20210846' AND HISCSEC=1108;
select * from interlab.result  where refecrep >= '2020-12-24' order by rehorrep;  -- 2020-12-23	19:08:47	
select * from interlab.detresu where redferep >= '2020-12-24' order by redhorep; 

select * from interlab.detorde where orclin like ('%1023928314 CC 29%') AND ORDCODEX= '906913' ;
select * from interlab.detorde where orclin like ('%463150%CC%1061%') AND ORDCODEX= '906913' ;
select * from interlab.detorde where orclin like ('%2842552 CC 300%') AND ORDCODEX= '906913' ;
select * from interlab.detorde where orclin like ('%37625965 CC 21%') AND ORDCODEX= '906913' ;



select * from interlab.ORDENES where orclin like ('%1023928314 CC 29%') 
