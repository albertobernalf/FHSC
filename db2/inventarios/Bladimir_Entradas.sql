/*
código de producto
nombre de producto
fecha de última entrada almacen
valor unitario con el que ingresó la última vez al almacén
cantidades registradas en la última entrada a almacén 
proveedor 
*/

select * from hosvital.entralm;-- entanro, doccod,prvcod, entafch
select * from hosvital.entralm1; -- entacnt ,, entavlru, entamfch,entattal, entestitm,
select * from hosvital.proveedor1; -- prvcod , prvcon, prvcrgcon

select distinct entestitm  from hosvital.entralm1;

select m.msreso as codigo_producto, m.msnomg as nombre_producto,
(select max(concat(concat ( concat(concat ( cast(e1.entamfch as character(50)), ' ') , e1.entavlru ),' '),e1.entacnt))
 from hosvital.entralm e
 inner join hosvital.entralm1 e1 on (e1.doccod=e.doccod and  e1.entanro  = e.entanro   )
 where e.entaest in ('C','F','P','S') AND e1.msreso = m.msreso and e1.entestitm in ('N','S') and  e1.entacsc = (select max(e4.entacsc) from hosvital.entralm1 e4 where e4.doccod=e1.doccod and e4.entanro= e1.entanro and e4.msreso=e1.msreso)                                               ) as fecha_ult_entrada
 ,(select max(e1.entavlru)
 from hosvital.entralm e
 inner join hosvital.entralm1 e1 on (e1.doccod=e.doccod and  e1.entanro  = e.entanro   )
 where e.entaest in ('C','F','P','S') AND  e1.msreso = m.msreso and e1.entestitm in ('N','S')   and concat(concat(concat(concat(concat(concat(concat( cast(e1.entamfch as character(50)),' '),e1.msreso),' ') ,' ')  ,e1.entavlru),' ' ) ,            e1.entacsc)   =
									(select max(concat(concat(concat(concat(concat(concat(concat(cast(e2.entamfch as character(50)),' '),e2.msreso), ' '), ' ')  ,e1.entavlru) ,' '),                  e2.entacsc))
				                 					  from hosvital.entralm1 e2
				                					   where --  e2.doccod=e.doccod and e2.entanro=e.entanro and
								 e2.msreso = e1.msreso                                    )    ) as vUnit_ult_entrada ,
(select max(e1.entacnt)
 from hosvital.entralm e
 inner join hosvital.entralm1 e1 on (e1.doccod=e.doccod and  e1.entanro  = e.entanro   )
 where e.entaest in ('C','F','P','S') AND  e1.msreso = m.msreso and e1.entestitm in ('N','S')   and concat(concat(concat(concat(concat(concat(concat( cast(e1.entamfch as character(50)),' '),e1.msreso),' ') ,' ')  ,e1.entavlru),' ' ) ,            e1.entacsc)   =
									(select max(concat(concat(concat(concat(concat(concat(concat(cast(e2.entamfch as character(50)),' '),e2.msreso), ' '), ' ')  ,e1.entavlru) ,' '),                  e2.entacsc))
				                 					  from hosvital.entralm1 e2
				                					   where --  e2.doccod=e.doccod and e2.entanro=e.entanro and
									 e2.msreso = e1.msreso                                    )    ) as vCantidad_ult_entrada,
(select max(t.trcrazsoc)
 from hosvital.entralm e
inner join hosvital.terceros t on (t.trccod= e.prvcod )
 inner join hosvital.entralm1 e1 on (e1.doccod=e.doccod and  e1.entanro  = e.entanro   )
 where e.entaest in ('C','F','P','S') AND  e1.msreso = m.msreso and e1.entestitm in ('N','S')   and concat(concat(concat(concat(concat(concat(concat( cast(e1.entamfch as character(50)),' '),e1.msreso),' ') ,' ')  ,e1.entavlru),' ' ) ,            e1.entacsc)   =
									(select max(concat(concat(concat(concat(concat(concat(concat(cast(e2.entamfch as character(50)),' '),e2.msreso), ' '), ' ')  ,e1.entavlru) ,' '),                  e2.entacsc))
				                 					  from hosvital.entralm1 e2
				                					   where --  e2.doccod=e.doccod and e2.entanro=e.entanro and
									 e2.msreso = e1.msreso                                    )    ) as Proveedor_ult_entrada


									


from hosvital.maesum1 m
order by m.msnomg;


/*

 veamos estos dos

0015MQ11       	BARRERA DE COLOSTOMIA NO.45 (CARAYA)                                                                                                                                                                                                                                	2020-02-04-16.04.07.000000                         22900.000000 10.00	27600.000000	
0025MQ11       	BARRERA DE COLOSTOMIA NO.70 (CARAYA)                                                                                                                                                                                                                                	2020-02-04-16.04.07.000000                         22900.000000 10.00	28961.000000	


*/


select * from hosvital.proveedor1 where prvcod='900789717';
select * from hosvital.terceros where trccod in ('900789717');

select * from hosvital.entralm where entanro in (43501) ;
select * from hosvital.entralm1 where ENTANRO in (43389, 37281) ;
select * from hosvital.entralm1 where entamfch >= '2010-01-01 00:00:00' and  msreso ='0015MQ11';

/*   acotado  */

select m.msreso as codigo_producto, m.msnomg as nombre_producto,(select max(concat(concat ( concat(concat ( cast(e1.entamfch as character(50)), ' ') , e1.entavlru ),' '),e1.entacnt))
 from hosvital.entralm e  inner join hosvital.entralm1 e1 on (e1.doccod=e.doccod and  e1.entanro  = e.entanro   )
 where e.entaest in ('C','F','P','S') AND e1.msreso = m.msreso and e1.entestitm in ('N','S') and  e1.entacsc = (select max(e4.entacsc) from hosvital.entralm1 e4 where e4.doccod=e1.doccod and e4.entanro= e1.entanro and e4.msreso=e1.msreso)) as fecha_ult_entrada ,(select max(e1.entavlru)  from hosvital.entralm e  inner join hosvital.entralm1 e1 on (e1.doccod=e.doccod and  e1.entanro  = e.entanro)
 where e.entaest in ('C','F','P','S') AND e1.msreso = m.msreso and e1.entestitm in ('N','S')  and concat(concat(concat(concat(concat(concat(concat( cast(e1.entamfch as character(50)),' '),e1.msreso),' ') ,' ')  ,e1.entavlru),' ' ) ,            e1.entacsc) =(select max(concat(concat(concat(concat(concat(concat(concat(cast(e2.entamfch as character(50)),' '),e2.msreso), ' '), ' ')  ,e1.entavlru) ,' '),e2.entacsc))  from hosvital.entralm1 e2 where 
e2.msreso = e1.msreso)) as vUnit_ult_entrada ,(select max(e1.entacnt) from hosvital.entralm e  inner join hosvital.entralm1 e1 on (e1.doccod=e.doccod and  e1.entanro =e.entanro) where e.entaest in ('C','F','P','S') AND  e1.msreso = m.msreso and e1.entestitm in ('N','S')  and concat(concat(concat(concat(concat(concat(concat( cast(e1.entamfch as character(50)),' '),e1.msreso),' ') ,' ')  ,e1.entavlru),' ' ) ,e1.entacsc) =				(select max(concat(concat(concat(concat(concat(concat(concat(cast(e2.entamfch as character(50)),' '),e2.msreso), ' '), ' ')  ,e1.entavlru) ,' '),e2.entacsc)) from hosvital.entralm1 e2 where e2.msreso = e1.msreso)) as vCantidad_ult_entrada,
(select max(t.trcrazsoc) from hosvital.entralm e inner join hosvital.terceros t on (t.trccod= e.prvcod ) inner join hosvital.entralm1 e1 on (e1.doccod=e.doccod and  e1.entanro=e.entanro)
 where e.entaest in ('C','F','P','S') AND  e1.msreso = m.msreso and e1.entestitm in ('N','S')   and concat(concat(concat(concat(concat(concat(concat( cast(e1.entamfch as character(50)),' '),e1.msreso),' ') ,' ')  ,e1.entavlru),' ' ) ,            e1.entacsc)=(select max(concat(concat(concat(concat(concat(concat(concat(cast(e2.entamfch as character(50)),' '),e2.msreso), ' '), ' ')  ,e1.entavlru) ,' '), e2.entacsc)) from hosvital.entralm1 e2 where e2.msreso = e1.msreso                           )) as Proveedor_ult_entrada from hosvital.maesum1 m
order by m.msnomg;
