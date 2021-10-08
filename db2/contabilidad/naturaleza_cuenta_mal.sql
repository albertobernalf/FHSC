select * from hosvipru.nirsmaux;
select * from hosvipru.nirsmgen;

-- create table hosvipru.nirsmaux_copia_2020 as (select * from hosvipru.nirsmaux where (nircanio = 2019 and nircmes=12) or  (nircanio = 2020 and nircmes>=1)) with data; 

select * from hosvipru.nirsmaux_copia_2020  order by nircanio,nircmes;

-- create table hosvipru.nirsmgen_copia_2020 as (select * from hosvipru.nirsmgen where (nircanio = 2019 and nircmes=12) or  (nircanio = 2020 and nircmes>=1)) with data; 


select * from hosvipru.nirsmgen_copia_2020  order by nircanio,nircmes;