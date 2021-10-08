select * from hosvital.hojobl where hojnumobl in ('644851','645851','646715');
select * from hosvital.nihojobl  where nihojno in ('644851','645851','646715');
select count(*) from hosvital.nihojobl where nicntvig=2021;
select * from hosvital.nihojobl where nicntvig=2021;

select * from hosvital.nihojobl;
select min (nihojfo) from hosvital.nihojobl where nihojfo not in ( '0001-01-01 00:00:00.0000','1901-01-01 00:00:00.00000') ;

select *  from hosvital.nihojobl where nihojfo  in ( '2006-06-01 00:00:00.0000') ;

-- Radicaion

select * from hosvital.nihojobl where nihojno in ('641233');