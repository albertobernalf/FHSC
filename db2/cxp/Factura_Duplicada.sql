select * from hosvital.hojoblprv where hopnoobl ='2039' and cntvig=2019;  -- fecha de cancelacion estaba en 2019-05-21

update hosvital.hojoblprv 
set hojfchcan='0001-01-01'
where hopnoobl ='2039' and cntvig=2019; 


select * from hosvital.movcxp where  mvcxpnuob like ('%2039%') and cntvig=2019 and prvcod= '52343719';

select * from hosvital.movcont2 where doccod='CA' and  mvcnro  in ('7019','7504');