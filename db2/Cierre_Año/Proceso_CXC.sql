SELECT COUNT(*) FROM hosvital.HOJOBL WHERE empcod='01' and  CNTVIG= 2021;  -- 55664 /1005
select count(*) from hosvital.hojobl WHERE empcod='01' and CNTVIG= 2020 and hojtotcre <> hojtotdeb; -- 55664	/ 52471	
		
select * from hosvital.hojobl WHERE CNTVIG= 2020 and hojtotcre <> hojtotdeb;
 --928	
SELECT * FROM hosvital.HOJOBL WHERE CNTVIG=2021 AND HOJFCHOBL < '2021-01-01 00:00:00';

SELECT COUNT(*) FROM hosvital.HOJOBL WHERE CNTVIG= 2021; --1011

SELECT * FROM  HOSVIPRU.HOJOBLPRV;
SELECT COUNT(*) FROM HOSVIPRU.HOJOBLPRV WHERE empcod='01' and  CNTVIG= 2021; -- 0 /3075
select count(*) from HOSVIPRU.HOJOBLPRV WHERE empcod='01' and CNTVIG= 2020 and hoPtotcre <> hoPtotdeb; -- 3075/3075
	
