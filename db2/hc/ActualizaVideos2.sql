select * from HOSVIPRU.IMAPRONQ WHERE HISCKEY= '219549' ; --   AND HISCSEC =3 ;


select * from HOSVITAL.IMAPRONQ WHERE IMAFECHOR>= '2020-01-01 00:00:00' ORDER BY IMAFECHOR ;

UPDATE HOSVIPRU.IMAPRONQ
SET  IMARUTPRO = '\\192.168.2.52\imagenes\3-219549-CC-3-881202-1.pdf'
where hisckey = '219549' and hiscsec= 3 and codpro='881202';

select * from hosvital.IMAPRONQ where hisckey = '41889411' ; -- and hiscsec= 51;
	
-- LA CONSULTA

SELECT  *  --  IMARUTPRO, locate(' ', IMARUTPRO                    ) , substring(IMARUTPRO,1,   locate(' ', IMARUTPRO                    )       -1                       )||'.pdf'
from HOSVItal.IMAPRONQ 
WHERE  IMAFECHOR>= '2019-01-01 00:00:00'  and IMARUTPRO not like ('%pdf%');

-- LA ACTUALIZACION                                                                                                                                        	

update HOSVITAL.IMAPRONQ 
set  IMARUTPRO =  substring(IMARUTPRO,1,   locate(' ', IMARUTPRO                    )  -1                            )||'.pdf'
where IMAFECHOR>= '2020-01-01 00:00:00'  and IMARUTPRO not like ('%pdf%');  --  AND hisckey='17170994';  --  AND HISCSEC=301;



select * 
from HOSVITAL.IMAPRONQ 
where hisckey='3029559' ;


--estaba
-- 17170994       	CC 	192	903703   	4	\\192.168.2.52\IMAGENES\4-17170994-CC-192-903703-1.pdf                                                                                                                                                                                                    	2020-03-05 14:36:21.000000		1	P	

/*

delete from HOSVITAL.IMAPRONQ where hisckey='17170994' and hiscsec=192;;
*/