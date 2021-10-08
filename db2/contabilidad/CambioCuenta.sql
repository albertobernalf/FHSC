/*


('51050529',	'61050529',	'61100529',	'61150529',	'61160529',	'61170529',	'61200529',	'61250529',	'61300529',	
'51050530',	'61050530',	'61100530',	'61150530',	'61160530',	'61170530',	'61200530',	'61250530',	'61300530',	
'51050531',	'61050531',	'61100531',	'61150531',	'61160531',	'61170531',	'61200531',	'61250531',	'61300531',	
'51050532',	'61050532',	'61100532',	'61150532',	'61160532',	'61170532',	'61200532',	'61250532',	'61300532',	
'51050533',	'61050533',	'61100533',	'61150533',	'61160533',	'61170533',	'61200533',	'61250533',	'61300533')	
*/

select * from hosvital.cuentas where  cntcod='26351001' AND CNTVIG=2021;  --2019-08-21 08:46:17.000000	
select * from hosvital.cuentas where   cntcod='61050529 ' AND CNTVIG>=2020;  --2019-08-21 08:46:17.000000
select * from hosvital.cuentas where  empcod='02' and cntcod like ('1805%')  AND CNTVIG=2020;  --2019-08-21 08:46:17.000000
select * from hosvital.cuentas where  empcod='02' and cntcod like ('1892%')  AND CNTVIG=2020;  --2019-08-21 08:46:17.000000
select * from hosvital.cuentas where  empcod='02' and cntcod like ('43%')  AND CNTVIG=2020;  --2019-08-21 08:46:17.000000

select * from hosvital.cuentas where  empcod='01' and cntcod in ('51050534','61050534','61100534','61150534','61160534','61170534','61200534','61250534','61300534')
AND CNTVIG=2021;  --2019-08-21 08:46:17.000000
	
update  hosvital.cuentas 
set cntfchcre = '2021-01-01 00:00:00' 
 where  empcod='01' and cntcod in ('26351001') AND CNTVIG=2021;



update  hosvital.cuentas 
set  cntint='N/A'  -- ESTABA CONTABILIDAD    	
where empcod='01' and cntcod='42180501'  AND CNTVIG=2020;


update  hosvital.cuentas 
set cntfchcre = '2021-01-01 00:00:00'  , cntint='N/A'
 where  empcod='01' and cntcod in ('51050534','61050534','61100534','61150534','61160534','61170534','61200534','61250534','61300534')
AND CNTVIG=2021;

('51050534','61050534','61100534','61150534','61160534','61170534','61200534','61250534','61300534')


update  hosvital.cuentas 
set cntfchcre = '2019-01-01 00:00:00'  , cntint='N/A'
where empcod='03' and cntcod='51309501' and cntvig=2019;



update  hosvital.cuentas 
set  cntint='N/A'
where empcod='02' and cntcod='519570';


select * from hosvital.NIcuentas where empcod='01' and NIcntcod='';

select * from hosvital.NIcuentas where empcod='01' and NIcntcod in   ('26351001') and nicntvig=2021;


update  hosvital.NIcuentas 
set NICNTFC = '2021-01-01 00:00:00'  
where empcod='01' and nicntcod  in ('26351001') AND niCNTVIG=2021;


update  hosvital.NIcuentas  -- estaba CONTABILIDAD    	
set NICNTINT='N/A'
where empcod='01' and NIcntcod='22050507'  and nicntvig=2021;


update  hosvital.NIcuentas  -- estaba CONTABILIDAD    	
set NICNTINT='N/A'
where empcod='01' and NIcntcod in ('421805','4218','42180501')   and nicntvig=2021;

update  hosvital.NIcuentas 
set NICNTFC = '2021-01-01 00:00:00'  , NICNTINT='N/A'
where empcod='01' and nicntcod  in ('51050534','61050534','61100534','61150534','61160534','61170534','61200534','61250534','61300534')
AND niCNTVIG=2021;



update  hosvital.NIcuentas 
set NICNTFC = '2019-01-01 00:00:00'  , NICNTINT='N/A'
where empcod='02' and NIcntcod='51356501' and nicntvig=2020;



select * from hosvital.NIcuentas where empcod='03' and NIcntcod='42504502';

update  hosvital.NIcuentas 
set  NICNTINT='N/A'
where empcod='03' and NIcntcod='42504502'  AND NICNTVIG=2019;

-- Actuliza cuenta en documento contabñe


select * from hosvital.movcont3 where doccod='NCF' and mvcnro=6723;
select * from hosvital.movcont2 where doccod='NCF' and mvcnro=6723;

update hosvital.movcont2 set cntcod= '11200502'  where doccod='RCF' and mvcnro=200 and mvccsc=1;

select * from hosvital.nimovcon1    where doccod='RCF' and nimcnro=193;