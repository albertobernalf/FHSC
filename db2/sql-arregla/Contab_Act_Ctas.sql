select * from hosvital.cuentas  where empcod='03' and cntcod = '51050528' ;

update  hosvital.cuentas  
set cntfchcre='2019-01-01 00:00:00', cntint= 'N/A'
where empcod='03' and cntcod = '51050528' ;

select * from hosvital.nicuentas  where empcod='03' and NIcntcod = '51050528' ;

update  hosvital.NIcuentas  
set NICNTFC='2019-01-01 00:00:00', NICntint= 'N/A'
where empcod='03' and NIcntcod = '51050528' ;