select * from hosvital.hojoblprv where cntvig= 2019 and  prvcod = '52588414'  ;


strat transaction;
SAVEPOINT SAVEPOINT2 ON ROLLBACK RETAIN CURSORS;

update hosvital.hojoblprv
set hoptppz='1'
where cntvig=2019 and  prvcod = '52588414' and hoptppz='001';
ROLLBACK  TO SAVEPOINT SAVEPOINT2 ;

select * from hosvital.hojoblprv where cntvig= 2019 and  prvcod = '52588414' and hoptppz='001';