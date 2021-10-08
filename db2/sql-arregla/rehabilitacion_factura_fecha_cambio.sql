select * from MAEATE2 where mpnfac = 2393331 and MACscP= 2-- 2016-08-23
select * from MAEATE2 where mpnfac = 2390752 and MACscP= 2-- 2016-10-19 14:30:00.000

begin transaction ;
update MAEATE2
set MAFePr = '2016-10-19 14:30:00.00'
where mpnfac = 2390752 and MACscP= 2;
-- commit;
-- rollback



begin transaction ;
update MAEATE2
set MAFePr = '2016-08-23 17:05:00.00'
where mpnfac = 2393331 and MACscP= 2;
-- commit;

