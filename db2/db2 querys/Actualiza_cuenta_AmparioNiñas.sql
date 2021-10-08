select * from hosvital.cuentas where empcod='03' and cntvig = 2019 and cntcod='51451601';

update  hosvital.cuentas
set cntfchcre='2019-01-01 00:00:00.000000'
 where empcod='03' and cntvig = 2019 and cntcod='51451601' and   cntfchcre ='2019-04-04 09:53:22.000000'