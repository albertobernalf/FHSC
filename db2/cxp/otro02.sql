select * from hosvital.hojoblprv where hoptppz='001' and cntvig>=2017;
select count(*) from hosvital.hojoblprv where hoptppz='001' and cntvig>=2017;


update hosvital.hojoblprv
set hoptppz='1'
where hoptppz='001' and cntvig>=2017;


