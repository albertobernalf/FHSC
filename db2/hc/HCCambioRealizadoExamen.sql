-- Este es el query
-----------------------
/*   LA CONSULTA  ANTES DEL UPDATE*/

select histipdoc,hiscsec,hisckey,hctvin51,hcprccod,hcfchrord from hosvital.hccom51 where hisckey='38996378'  and hcprcest= 'O';

select histipdoc,hiscsec,hisckey,hctvin51,hcprccod,hcfchrord, hcprcest  from hosvital.hccom51 where hisckey LIKE '950834215041%' and  hcprcest= 'O';  --  and hiscsec=2972 
select * from hosvital.hccom51 where hisckey='168773' and hiscsec in ('373','203');

select histipdoc,hiscsec,hisckey,hctvin51,hcprccod,hcfchrord, hcprcest  from hosvital.hccom51 where hisckey='14951492' and  hcprcest= 'O';  

UPDATE HOSVITAL.HCCOM51
SET HCPRCEST = 'E' -- 
where hisckey = '749328416041960'  and hiscsec in (109)   and hcprcest= 'O';   

UPDATE HOSVITAL.HCCOM51
SET HCPRCEST = 'E' -- 
where hisckey = '80281300'    and hcprcest= 'O';  



UPDATE HOSVITAL.HCCOM51
SET HCPRCEST = 'E' -- 
where hisckey = '41635388'  and hiscsec in (4004)  AND HCPRCCOD IN ('893812')   AND hcprcest= 'O'  ;    


