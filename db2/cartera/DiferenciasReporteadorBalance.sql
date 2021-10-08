SELECT * FROM HOSVITAL.HOJOBL  WHERE CNTVIG=2020 AND  CLICOD='800162035' AND (HOJTOTDEB - HOJTOTCRE)  > 0 ORDER BY  (HOJTOTDEB - HOJTOTCRE);
 

-- Desde el punto de vista de la Contabilidad

SELECT CNTCOD,  SUM  (HOJTOTDEB - HOJTOTCRE)  FROM HOSVITAL.HOJOBL  WHERE CNTVIG=2020 AND CLICOD='800162035' AND (HOJTOTDEB - HOJTOTCRE)  > 0 AND HJFCANOBL=  '0001-01-01'
GROUP BY CNTCOD;

--860002183

SELECT CNTCOD,  SUM  (HOJTOTDEB - HOJTOTCRE)  FROM HOSVITAL.HOJOBL  WHERE CNTVIG=2020 AND CLICOD='860002183'  AND HOJFCHOBL <= '2020-03-31 23:59:59' AND (HOJTOTDEB - HOJTOTCRE)  > 0 AND HJFCANOBL=  '0001-01-01'
GROUP BY CNTCOD;

/*

13032001            	133048.00	
13022001            	2990166.00	
13999001            	716278.00	

*/

SELECT *  FROM HOSVITAL.RESMCUE WHERE  RSMANO=2020 AND RSMMES=3 AND TRCCOD='860002183' ;

SELECT SUM(RSMSALANT), SUM(RSMCRE), SUM(RSMDEB),SUM(RSMSALACT)  FROM HOSVITAL.RESMCUE WHERE  RSMANO=2020 AND RSMMES=4 AND TRCCOD='860002183' ;


--  469.090.414 	 468.826.411 
-- 472205603.00	


-- Desde el punto de Vista de la Cartera

select * from hosvital.movcxc;

select distinct mov.mccnumobl,
(select sum(movx.mccvlr)
 from hosvital.movcxc movx
 where MOV.MCCNUMOBL = MOVX.MCCNUMOBL AND movx.mccnat='D') DEBITOS,
(select sum(movx.mccvlr)
 from hosvital.movcxc movx
 where MOV.MCCNUMOBL = MOVX.MCCNUMOBL AND movx.mccnat='C') CREDITOS,
(select SUM(CASE WHEN movx.mccnat = 'D' THEN  movx.mccvlr  WHEN movx.mccnat = 'C' THEN  -movx.mccvlr END)
 from hosvital.movcxc movx
 where MOV.MCCNUMOBL = MOVX.MCCNUMOBL ) SALDO
from hosvital.movcxc mov
where mov.empcod='01' and mov.cntvig=2020
order by mccnumobl;


select distinct mov.mccnumobl, mov.cntcod,
(select sum(movx.mccvlr)
 from hosvital.movcxc movx
 where MOV.MCCNUMOBL = MOVX.MCCNUMOBL and mov.cntcod = movx.cntcod AND movx.mccnat='D') DEBITOS,
(select sum(movx.mccvlr)
 from hosvital.movcxc movx
 where MOV.MCCNUMOBL = MOVX.MCCNUMOBL AND  mov.cntcod = movx.cntcod and  movx.mccnat='C') CREDITOS,
(select SUM(CASE WHEN movx.mccnat = 'D' THEN  movx.mccvlr  WHEN movx.mccnat = 'C' THEN  -movx.mccvlr END)
 from hosvital.movcxc movx
 where MOV.MCCNUMOBL = MOVX.MCCNUMOBL  and mov.cntcod = movx.cntcod) SALDO
from hosvital.movcxc mov
where mov.empcod='01' and mov.cntvig=2020
order by mov. mccnumobl, mov.cntcod;


-- veamoslo por NIT

order by mccnumobl;


select * from hosvital.movcxc where mccfch>= '2019-01-01 00:00:00' ;
select * from hosvital.movcxc where mccnumobl in ('608261','608380');       
select * from hosvital.hojobl; 	



select distinct mov.clicod, mov.cntcod,
(select sum(movx.mccvlr)
 from hosvital.movcxc movx
 where  mov.empcod=movx.empcod  and movx.mccfch <= '2020-03-31 23:59:59' and MOV.clicod = MOVX.clicod and mov.cntcod = movx.cntcod AND movx.mccnat='D') DEBITOS,
(select sum(movx.mccvlr)
 from hosvital.movcxc movx
 where mov.empcod=movx.empcod and movx.mccfch <= '2020-03-31 23:59:59' and MOV.clicod = MOVX.clicod AND  mov.cntcod = movx.cntcod and  movx.mccnat='C') CREDITOS,
(select SUM(CASE WHEN movx.mccnat = 'D' THEN  movx.mccvlr  WHEN movx.mccnat = 'C' THEN  -movx.mccvlr END)
 from hosvital.movcxc movx
 where mov.empcod=movx.empcod and movx.mccfch <= '2020-03-31 23:59:59' and MOV.clicod = MOVX.clicod  and mov.cntcod = movx.cntcod) SALDO
from hosvital.movcxc mov
where mov.empcod='01'  and mov.clicod = '860002183' and mov.mccfch <= '2020-03-31 23:59:59' and mov.cntcod not in ('13052001','13062001') and mov.mccnumobl in (select h.hojnumobl from hosvital.hojobl h where h.empcod='01'and h.cntcod= mov.cntcod and (h.hojtotdeb - h.hojtotcre ) > 0 and hjfcanobl = '0001-01-01' )
order by mov. clicod, mov.cntcod;

/*

860002183      	13012001            	35916121.00	35916121.00	0.00	
860002183      	13022001            	42815379.00	32712630.00	10102749.00	
860002183      	13032001            	3367950.00	3234902.00	133048.00	
860002183      	13999001            	9293000.00	8576722.00	716278.00	


*/

select * FROM hosvital.hojobl;

select sum(hojtotdeb-hojtotcre)
from hosvital.hojobl
where empcod='01' and cntvig=2020 and  clicod = '860002183' and (hojtotdeb - hojtotcre ) > 0 and hojfchobl <= '2020-03-31 23:59:59' ;


select * -- sum(hojtotdeb-hojtotcre)
from hosvital.hojobl
where empcod='01' and cntvig=2020 and  clicod = '860002183' and hojfchobl <= '2020-03-31 23:59:59' and hojfchrad <> '0001-01-01 00:00:00.00000' and hojtotdeb <> hojtotcre and  hjfcanobl <> '0001-01-01' ;


select HOJNUMOBL,CLICOD,MENNIT,HOJFCHOBL,HOJVLROBL,HOJTOTDEB,HOJTOTCRE,(HOJTOTDEB - HOJTOTCRE) AS SALDO,hjfcanobl
from hosvital.hojobl
where empcod='01' and cntvig=2020  -- AND  CLICOD= '860002183'
 and hojfchobl <= '2020-03-31 23:59:59' and hojfchrad <> '0001-01-01 00:00:00.00000' and hojtotdeb <> hojtotcre and  hjfcanobl <> '0001-01-01' ;




SELECT COUNT(*)
FROM  hosvital.hojobl 
where empcod='01' and cntvig=2020  and hojfchobl <= '2020-03-31 23:59:59' and hojfchrad <> '0001-01-01 00:00:00.00000' and hojtotdeb <> hojtotcre and  hjfcanobl = '1901-01-01' AND MENNIT='90';

SELECT * FROM  HOSVITAL.MAEEMP WHERE MENNIT='90';
