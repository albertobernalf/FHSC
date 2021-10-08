select * from hosvital.proveedor1 where prvcon like('%COLO%');;

select * from hosvital.proveedor1 where  prvcod='800192101';

select * from hosvital.terceros where trcrazsoc like ('%COLOMBIAM%');
select * from hosvital.terceros where trcrazsoc like ('%ABCARE%');

select * from hosvital.hojoblprv where  empcod='01' and cntvig='2019' and prvcod='800192101';

select * from hosvital.hojoblprv where  empcod='01' and cntvig='2019' and prvcod='800192101';

select * from hosvital.terceros where trcCOD='800192101';

select * from hosvital.proveedor1 where PRVCOD= '901154519';
select * from hosvital.terceros where trcrazsoc like ('%INGERA%');

select * from hosvital.hojoblprv where  empcod='01' and cntvig='2019' and prvcod IN ('800192101','901154519','860034594');
  	select * from hosvital.descirmed where cedpac='20858903';
