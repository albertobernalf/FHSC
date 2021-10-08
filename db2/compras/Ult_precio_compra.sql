select * from hosvital.compcab2;
select * from hosvital.compcab;


SELECT c2. MSRESO AS COD_PROD,m.MSNOMG AS PRODUCTO, m.MovVlU1 ULT_PRECIO_COMPRA ,c2.ordevlru
FROM HOSVITAL.MAESUM1 m
inner join hosvital.compcab2 c2 on ( c2.msreso = m.msreso)
inner join hosvital.compcab c on (c.doccod=c2.doccod and c.ordenro = c.ordenro)
WHERE c2.doccod='IOC' and m.MSESTADO='S' and c.ordefch = (select max(cc.ordefch)
	          	                         		  from hosvital.compcab cc 
				inner join hosvital.compcab2 cc2 on (cc2.doccod=cc.doccod and cc2.ordenro = cc.ordenro and  cc2.msreso = c2.msreso) 
				where  cc2.doccod=c.doccod and cc2.ordenro = c.ordenro and cc2.msreso = c2.msreso )
group by c2. MSRESO ,m.MSNOMG , m.MovVlU1  ,c2.ordevlru
order by c2.msreso;			