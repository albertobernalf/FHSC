select  * from hosvital.hojoblprv where cntvig= 2019 and prvcod='52469665'  ;   	


select  count(*) from hosvital.hojoblprv where cntvig= 2019 and hoptppz='001' and cast(hoptppz as numeric)= 1; -- 490 registros
select  * from hosvital.hojoblprv where cntvig= 2019 and hoptppz='001' and cast(hoptppz as numeric)= 1;




SAVEPOINT SAVEPOINT1 ON ROLLBACK RETAIN CURSORS;
update hosvital.hojoblprv
set hoptppz='1'
where cntvig=2019 and prvcod = '52469665' and hoptppz='001' and cast(hoptppz as numeric)= 1;
ROLLBACK TO SAVEPOINT SAVEPOINT1;




