-- Lectura

select * from hosvital.hccom1 where hisckey='41601616' order by hiscsec;

-- query Arreglo

update hosvital.hccom1 h 	
set (h.hiscfk,h.hiscfcon, h.hisfing, h.hisfsal,h.hisfhorat) = (select x.hiscfk,x.hiscfcon, x.hisfing, x.hisfsal, x.hisfhorat
			 from hosvital.hccom1 x
			where x.histipdoc=h.histipdoc and x.hisckey=h.hisckey and x.hiscsec=2)
 where h.histipdoc='CC' and h.hisckey= '41601616' and h.hiscsec =1;
