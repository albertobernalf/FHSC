select clapro, count(*) from hosvital.tmpfac where mpfesh >= '2021-08-10 00:00:00' group by clapro ;
/*
1	6	
2	80	
3	21	

*/

select * from hosvital.maeate;
select * from hosvital.ingresos where mpcedu='1006581';
select * from hosvital.tmpfac where tfcedu='1006581';

--141

select  clapro,count(*) from hosvital.ingresos where  ingfecegr >= '2021-08-10 00:0:00'  group by clapro; -- egresos = 100

/*
1	47	
3	9	
5	46	


*/


-- Facturados TOTAL

select  case when mpclpr =1 then 'AMBULATORIO'  when mpclpr =2 then 'HOSPITALIZADO' when mpclpr =3 then 'URGENCIAS' END SERVICIO  ,count(*) , sum(matotf) valor_facturado -- Facturados = 50
from hosvital.maeate 
where mafche = '2021-08-10' and maestf not in ('1','10')
group by mpclpr;

/*
1	27	
2	1	
3	6	

*/

select * from hosvital.tmpfac where tfcedu='79062667 ';  -- 302U 	
select * from hosvital.tmpfac1 where tfcedu='79062667 ';
select * from hosvital.tmpfac2 where tfcedu='79062667 ';
select * from hosvital.ingresos where mpcedu = '79062667';

select tfccodcam, mpfesh, t.* from hosvital.tmpfac t where tfcedu='80125863 ';  -- 302U 	
select * from hosvital.tmpfac1 where tfcedu='80125863 ';
select * from hosvital.tmpfac2 where tfcedu='80125863 ';
select * from hosvital.ingresos where mpcedu = '80125863';

-- Acostados Procedimientos sin cama

select case when t.clapro =1 then 'AMBULATORIO'  when t.clapro =2 then 'HOSPITALIZADO' when t.clapro =3 then 'URGENCIAS' END SERVICIO , count(*) ,
sum((select sum(t1.tfvatp) from  hosvital.tmpfac1 t1 where t1.tftdoc= t.tftdoc and t1.tfcedu= t.tfcedu and  t1.tmctving= t.tmctving and t1.tfptpotrn='F' and t1.tfestaanu1<>'S' )) acostados_proced
from hosvital.tmpfac t 
where t.mpfesh >= '2021-08-10 00:00:00'  and t.tfccodcam=''
group by t.clapro ;

-- Acostados Procedimientos con cama

select case when t.clapro =1 then 'AMBULATORIO'  when t.clapro =2 then 'HOSPITALIZADO' when t.clapro =3 then 'URGENCIAS' END SERVICIO , count(*) ,
sum((select sum(t1.tfvatp) from  hosvital.tmpfac1 t1 where t1.tftdoc= t.tftdoc and t1.tfcedu= t.tfcedu and  t1.tmctving= t.tmctving and t1.tfptpotrn='F' and t1.tfestaanu1<>'S' )) acostados_proced
from hosvital.tmpfac t 
where t.mpfesh >= '2021-08-10 00:00:00'  and t.tfccodcam<>''
group by t.clapro ;


/*
1	5	436106.00	
2	81	479699921.00	
3	21	5834220.00	
	

*/

select sum(t1.tfvatp) from hosvital.tmpfac1 t1 where (t1.tftdoc,t1.tfcedu,t1.tmctving) in (select t.tftdoc,t.tfcedu,t.tmctving from hosvital.tmpfac t  where  t.mpfesh >= '2021-08-10 00:00:00'  and t.clapro=3);

select * from hosvital.tmpfac2;

-- Acostados Suministros sin cama

select case when t.clapro =1 then 'AMBULATORIO'  when t.clapro =2 then 'HOSPITALIZADO' when t.clapro =3 then 'URGENCIAS' END SERVICIO , count(*) ,
sum((select sum(t2.tfvats) from  hosvital.tmpfac2 t2 where t2.tftdoc= t.tftdoc and t2.tfcedu= t.tfcedu and  t2.tmctving= t.tmctving and t2.tfStpotrn='F' and t2.tfestaanu2<>'S' )) acostados_suministros
from hosvital.tmpfac t 
where t.mpfesh >= '2021-08-10 00:00:00'   and t.tfccodcam=''
group by t.clapro ;


-- Acostados Suministros con cama

select case when t.clapro =1 then 'AMBULATORIO'  when t.clapro =2 then 'HOSPITALIZADO' when t.clapro =3 then 'URGENCIAS' END SERVICIO , count(*) ,
sum((select sum(t2.tfvats) from  hosvital.tmpfac2 t2 where t2.tftdoc= t.tftdoc and t2.tfcedu= t.tfcedu and  t2.tmctving= t.tmctving and t2.tfStpotrn='F' and t2.tfestaanu2<>'S' )) acostados_suministros
from hosvital.tmpfac t 
where t.mpfesh >= '2021-08-10 00:00:00'    and t.tfccodcam<>''
group by t.clapro ;

--  Con union



select 'sin cama' ,  case when t.clapro =1 then 'AMBULATORIO'  when t.clapro =2 then 'HOSPITALIZADO' when t.clapro =3 then 'URGENCIAS' END SERVICIO , count(*) ,
sum((select sum(t2.tfvats) from  hosvital.tmpfac2 t2 where t2.tftdoc= t.tftdoc and t2.tfcedu= t.tfcedu and  t2.tmctving= t.tmctving and t2.tfStpotrn='F' and t2.tfestaanu2<>'S' )) acostados_suministros
from hosvital.tmpfac t 
where t.mpfesh >= '2021-08-10 00:00:00'   and t.tfccodcam=''
group by t.clapro 
union
select 'con cama' , case when t.clapro =1 then 'AMBULATORIO'  when t.clapro =2 then 'HOSPITALIZADO' when t.clapro =3 then 'URGENCIAS' END SERVICIO , count(*) ,
sum((select sum(t2.tfvats) from  hosvital.tmpfac2 t2 where t2.tftdoc= t.tftdoc and t2.tfcedu= t.tfcedu and  t2.tmctving= t.tmctving and t2.tfStpotrn='F' and t2.tfestaanu2<>'S' )) acostados_suministros
from hosvital.tmpfac t 
where t.mpfesh >= '2021-08-10 00:00:00'    and t.tfccodcam<>''
group by t.clapro ;