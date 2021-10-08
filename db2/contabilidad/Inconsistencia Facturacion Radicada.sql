select * from hosvital.hojobl where hojnumobl = '627166';  -- 
select * from hosvital.nihojobl  where nihojno='627166';
select * from hosvital.hojobl;

update  hosvital.hojobl
set clicod='860066942'
where hojnumobl = '627166';  -- 

select * from hosvital.maeate where mpnfac = 627166; -- 79263648       	

update  hosvital.nihojobl
set clicod='860066942'
where nihojno = '627166';  

select * from hosvital.maeemp where mennit='206';
select * from hosvital.terceros where trccod='860066942';

select * from hosvital.terceros where trccod='41746660';
select * from hosvital.terceros where trccod='79263648';


select * from hosvital.maeate where mpnfac = 614798;

select * from hosvital.hojobl where hojnumobl = '614798';  -- 
select * from hosvital.nihojobl  where nihojno='614798';

update  hosvital.nihojobl
set clicod='41746660'
where nihojno = '614798' and nicntvig=2020;  
