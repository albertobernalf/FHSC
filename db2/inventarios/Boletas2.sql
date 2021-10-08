select * from hosvital.bltainv where bltano=2020 and bltmes=10;
select * from hosvital.bltainv2 where bltano=2020 and bltmes=10 and bltnro>=406;
select * from hosvital.bltainv3 where bltano=2020 and bltmes=10;

/*

update hosvital.bltainv
set codusu='51777802',fecactinv='2020-10-30 09:50:01', estactinv='S'
 where bltano=2020 and bltmes=10 and bltnro in (405,407,408,409,410);

*/

select * from hosvital.bltainv where bltano=2020 and bltmes=10;

select * from hosvital.bltainv2 where bltano=2020 and bltmes=10 and bltnro >=  405 order by bltnro;

select count(*) from hosvital.bltainv2 where bltano=2020 and bltmes=10 and bltnro >=  405 ; -- 16/53/58/63/81/103/113/907/913/935/950/985/1018/1034/1036/1045

select bltnro,count(*) from hosvital.bltainv2 where bltano=2020 and bltmes=10 and bltnro >=  405  group by bltnro; 


-- 0259LB01       	


select * from hosvital.bltainv3 where bltano=2020 and bltmes=10 and bltnro >=  405 order by bltnro;

select count(*) from hosvital.bltainv3 where bltano=2020 and bltmes=10 and bltnro >=  405 ; -- 2358

select * from hosvital.bltainv3_copia;
