select count(*) from hosvipru.nirsmaux; -- 183037	
select count(*) from hosvipru.nirsmgen; -- 8990245	

create table hosvipru.nirsmax_20200708 as (select * from hosvipru.nirsmaux) with data;
create table hosvipru.nirsmgen_20200708 as (select * from hosvipru.nirsmgen) with data;


select count(*) from  hosvipru.nirsmax_20200708 ; -- 183037	
select count(*) from hosvipru.nirsmgen_20200708; -- 8990245

select * from hosvipru.nirsmaux where nircanio=2020 and nircmes=1 and nirccue='14555001';
select * from hosvipru.nirsmgen where nircanio=2020 and nircmes=1 and nirccue='14555001';

--

select * from hosvipru.nirsmaux where nircanio=2019 and nircmes=13 and nirccue='14555001';
select * from hosvipru.nirsmgen where nircanio=2019 and nircmes=13 and nirccue='14555001';



update  hosvipru.nirsmaux
set  nircaact=-nircaact
where nircanio=2019 and nircmes=13 and nirccue='14555001';


update  hosvipru.nirsmgen 
set nircgact= -nircgact
where nircanio=2019 and nircmes=13 and nirccue='14555001';


select * from hosvipru.nirsmgen where nircanio=2020 and nircmes=1 and nirccue='14555001' and nircgact <> nircgant;

select sum(nircgcre), sum(nircgdeb), sum(nircgact), sum(nircgant)
 from hosvipru.nirsmgen where nircanio=2020 and nircmes=1 and nirccue='14555001';

-- 12476057.00	11670087.00	-16010123.51	-16816093.51	

-- 14551001
-- 14552001
--  14555001


-- Actualizacion de cuentas 1

select * from hosvipru.nirsmaux where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14551501';
select * from hosvipru.nirsmgen where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14551501';


update  hosvipru.nirsmaux
set  nircaact=-nircaact
where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14551501';


update  hosvipru.nirsmgen 
set nircgact= -nircgact
where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14551501';



-- Actualizacion de cuentas 2

select * from hosvipru.nirsmaux where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14555001';
select * from hosvipru.nirsmgen where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14555001';


update  hosvipru.nirsmaux
set  nircaact=-nircaact
where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14555001';


update  hosvipru.nirsmgen 
set nircgact= -nircgact
where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14555001';


-- Actualizacion de cuentas 3

select * from hosvipru.nirsmaux where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14555001';
select * from hosvipru.nirsmgen where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14555001';


update  hosvipru.nirsmaux
set  nircaact=-nircaact
where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14555001';


update  hosvipru.nirsmgen 
set nircgact= -nircgact
where nircemp='01' and nircanio=2019 and nircmes=13 and nirccue='14555001';
