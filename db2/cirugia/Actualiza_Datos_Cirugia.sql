select *  from hosvital.procir where procircod =118093;
select *  from hosvital.procir1 where procircod =118093;
select *  from hosvital.procir2 where procircod =118093;
select *  from hosvital.procir3 where procircod =118093;
select *  from hosvital.procir4 where procircod =118093;

select * from hosvital.descirmed where codcir= 118093;
select * from hosvital.descirmed1 where codcir= 118093;
select * from hosvital.descirmed2 where codcir= 118093;

select *  from hosvital.turqui where procircod=118093;

update  hosvital.turqui 
set tuqfching= '2019-10-28',  tuqfchsal= '2019-10-28',
where procircod=118093;

select *  from hosvital.turqui1;  --   where procircod=118093;


update  hosvital.procir  -- estaba el 27/10/2019
set profec='2019-10-28'
where procircod =118093;