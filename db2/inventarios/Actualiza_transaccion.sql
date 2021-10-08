SELECT * FROM HOSVITAL.TMPFAC WHERE TFCEDU='79970920';

select * from hosvital.movinv4 where doccod='AEN' and fchmvt>= '2019-05-31 00:00:00' order by docnro;

select * from hosvital.movinv3 where doccod='AEN' and mvtofch >= '2019-05-30 00:00:00' ORDER BY DOCNRO;  -- and fchmvt>= '2019-05-31 00:00:00' order by docnro;

UPDATE  hosvital.movinv3 SET TRANCOD='DEVASIS'  where doccod='AEN'  AND DOCNRO=413640 and mvtofch >= '2019-05-30 00:00:00' 	;