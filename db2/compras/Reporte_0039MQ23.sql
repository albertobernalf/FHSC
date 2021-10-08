/*

Según reunión realizada la semana pasada, solicito que por favor  me colaboren bajando el informe con fecha del 01 de mayo al 30 de junio donde tengamos cuantas unidades ingresaron 
y cuantas unidades se gastaron del siguiente código, proveedor suplesalud. 

0039MQ23

Gracias
*/

select * from hosvital.maesum1 where msreso='0039MQ23';

select * from hosvital.entralm1 where msreso = '0039MQ23' and entamfch >= '2019-05-01 00:00:00' ;

select * from hosvital.entralm where entanro in (19668	,
19827	,
20832	,
22273	,
24285	,
26695	) ;

select * from   hosvital.entralm1;

select * from hosvital.proveedor1  where prvcod in (
'805029546',
'17068260'   ,    	
'860500862'  ,    	
'79700446'     ,  	
'900574807'    ,  	
'830025149'     , 	
'900294380')      ;	


select * from hosvital.proveedor;

SELECT * FROM HOSVITAL.TERCEROS WHERE TRCNIT LIKE ('%805029546%');
select * from hosvital.kardex1 where msreso='0039MQ23'  and movfch >='2019-05-01 00:00:00' order by movfch ;




-- Entradas

select ent.entanro,  ent.entafch, ent.prvcod,ent.entafch, ter.trcrazsoc,ent1.entacnt  as ingresaron,ent1.entattal as valor_total
from hosvital.entralm ent
inner join hosvital.entralm1 ent1 on (ent1.entanro=ent.entanro)
inner join hosvital.proveedor1 pro on (pro.prvcod=ent.prvcod)
inner join hosvital.terceros ter on (ter.trccod=pro.prvcod)
where ent.entafch>='2019-05-01 00:00:00'  and ent.entafch<='2019-06-30 23:59:59' and ent1.msreso='0039MQ23'
order by ent.entafch ;

--Salidas

SELECT * from hosvital.kardex1;
SELECT * from hosvital.ENTRALM1;

select k.movfch,k.bodega,k.movcnt, k.movvlt as total
from hosvital.kardex1 k
where k.movfch>= '2019-05-01 00:00:00' and k.movfch <= '2019-06-30 23:59:59' and k.msreso='0039MQ23' and moves='S' 
order by k.movfch;

------------------------------------------
-------------------------------------------
--------- Estos son nuevos


select ent.entanro,  ent.entafch, ent.prvcod,ter.trcrazsoc,ent1.msreso,mae.msnomg, ent1.entacnt  as ingresaron
from hosvital.entralm ent
inner join hosvital.entralm1 ent1 on (ent1.entanro=ent.entanro)
inner join hosvital.proveedor1 pro on (pro.prvcod=ent.prvcod)
inner join hosvital.terceros ter on (ter.trccod=pro.prvcod)
inner join hosvital.maesum1 mae on (mae.msreso=ent1.msreso)
where ent.entafch>='2018-07-01 00:00:00'  and ent.entafch<='2019-06-30 23:59:59' and ent1.msreso in ('0025A03D','0156C01B','0001G03X','0002H01B','0500N01B','0467N02A','0463N02A','0491N03A','0597R03D','0001V08B','0020A02X','0001A05B',
'0001A10A','0001C0IE','0001D06A','0342J01R','0005J05A','0014L01X','0001L01X','0702R03B','0178C07A','0002A10B','0095B02A','0001J01R','0362J04A','0001N02A','0464N02A','0744J01M','0005V06D','0006A11A','001J02A','0232H01B','0002G04C','0004L04A','0008J01D','0001H05B','0002M07A','0074A12A','0800N02B','0570R01A','0155C01A','0001A11H','0023L02A')
order by ent1.msreso,ent.entafch ;

--Salidas


select k.movfch,k.bodega,k.msreso,mae.msnomg,k.movcnt
from hosvital.kardex1 k
inner join hosvital.maesum1 mae on (mae.msreso=k.msreso)
where k.movfch>= '2018-07-01 00:00:00' and k.movfch <= '2019-06-30 23:59:59' and k.msreso in ('0025A03D','0156C01B','0001G03X','0002H01B','0500N01B','0467N02A','0463N02A','0491N03A','0597R03D','0001V08B','0020A02X','0001A05B',
'0001A10A','0001C0IE','0001D06A','0342J01R','0005J05A','0014L01X','0001L01X','0702R03B','0178C07A','0002A10B','0095B02A','0001J01R','0362J04A','0001N02A','0464N02A','0744J01M','0005V06D','0006A11A','001J02A','0232H01B','0002G04C','0004L04A','0008J01D','0001H05B','0002M07A','0074A12A','0800N02B','0570R01A','0155C01A','0001A11H','0023L02A')  and moves='S' 
order by k.msreso,k.movfch;