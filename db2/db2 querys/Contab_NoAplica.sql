select *  from hosvital.cuentas  where empcod='02' and cntcod = '417105';

/*

update hosvital.cuentas
set cntint= 'N/A',CNTFCHCRE='2019-05-31 14:19:05'
 where empcod='02'  and cntcod IN ('4171','417105','41710505') ;


update hosvital.cuentas
set cntint= 'CXP'
 where empcod='03'  and cntcod = '23809001';
*/

select *  from hosvital.cuentas  where empcod='03' and cntcod = '51451601'; 	

update hosvital.cuentas
set cntint= 'N/A'
 where empcod='03'  and cntcod = '51451601';

select *  from hosvital.nicuentas  where empcod='03' and nicntcod = '51451601'; 

update hosvital.nicuentas
set nicntint= 'N/A'
 where empcod='03'  and nicntcod = '51451601';


select *  from hosvital.cuentas  where empcod='01' and cntcod = '42101501' AND CNTVIG=2019 ;
select *  from hosvital.cuentas  where empcod='01' and cntcod = '42955502' AND CNTVIG=2019;

-- Desde aquip



update hosvital.cuentas
set cntint= 'N/A'
 where empcod='01'  and cntcod = '42101501'  AND CNTVIG=2019;


update hosvital.cuentas
set cntint= 'N/A'
 where empcod='01'  and cntcod = '42955502'  AND CNTVIG=2019;


select *  from hosvital.nicuentas  where empcod='01' and nicntcod = '42101501' and nicntvig=2019 ;   --- estaba TESORERIA       	
select *  from hosvital.nicuentas  where empcod='01' and nicntcod = '42955502' and nicntvig=2019;  --- estaba TESORERIA       	

update hosvital.nicuentas
set nicntint= 'N/A'
 where empcod='01'  and nicntcod = '42101501' AND nicntvig=2019;

update hosvital.nicuentas
set nicntint= 'N/A'
 where empcod='01'  and nicntcod = '42955502' and nicntvig=2019;

-- ULTIOMO

update hosvital.cuentas
set cntint= 'N/A',CNTFCHCRE='2019-05-31 14:19:05'
 where empcod='02'  and cntcod IN ('4171','417105','41710505') AND CNTVIG=2019 ;

select *  from hosvital.cuentas  where empcod='02' and cntcod  IN ('4171','417105','41710505');


update hosvital.nicuentas
set nicntint= 'N/A' , NICNTFC='2019-05-31 00:00:00'
 where empcod='02'  and nicntcod  IN ('4171','417105','41710505') and nicntvig=2019;

select *  from hosvital.nicuentas  where empcod='02' and nicntcod  IN ('4171','417105','41710505') and nicntvig=2019;  
