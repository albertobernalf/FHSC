select ordenro, ordecodbod , ordefch, ordeobs from hosvital.compcab where ordenro in (28749, 28700, 28701, 28573, 28702, 28751, 28750, 28105,28675);

update hosvital.compcab 
set  ordecodbod='00'
where ordenro in (28749, 28700, 28701, 28573, 28702, 28751, 28750, 28105,28675);


select * from hosvital.compcab2 where ordenro = 23264;
select * from hosvital.cencost;
select * from hosvital.bodegas order by bodega;

select * from hosvital.requisici where reqnro=58146;
select * from hosvital.requisi1 where reqnro=58146;	
