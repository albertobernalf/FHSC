select  SUM(mvbvlr)
from hosvital.movban m
where m.empcod='01' and h.clicod = m.trccod and m.doccod IN ('RNA')   and m.mcdpto = '001' and m.MVBDET IN ('R','N') and m.PRCTESCOD='R'  and m.mvbvlr <>0  AND m.MVBACT= 'R';


-- Estos son los recibos de caja registrados

select *   -- 55062087832.00	Diferencia 579410221 en tesoreria da 55641498053
--select sum(mvbvlr)
from hosvital.movban 
where trccod = '900298372' and doccod='RNA' and empcod='01' and mcdpto='001' and MVBDET IN ('S') and PRCTESCOD='R'  and  mvbvlr <>0  AND  MVBACT= 'S'
 ORDER BY MVBNROCMP;  --  and prcvigtrn=2019;  -- 55062087832.00	

-- Estos recibos de caja estan sin registrar , nunca se dijo que facturas registraban

--select *  -- aqui si cuadran los valores con la pantalla de tesoreria
select sum(mvbvlr)
from hosvital.movban 
where trccod = '900298372' and doccod='RNA' and empcod='01' and mcdpto='001' and MVBDET IN ('R','N')  and PRCTESCOD='R'  and  mvbvlr <>0  AND  MVBACT= 'R'  ;
--ORDER BY MVBNROCMP ; 



select * from hosvital.docucon where doccod='RNA';  -- RNA	RECIBO DE CAJA NEGOCIO ASISTENCIAL                          	
select * from hosvital.docucon where DOCDSC LIKE ('%DETALLE%');  -- DR  / DRC

select * from hosvital.movcxc where doccod= 'DRC' and clicod= '900298372' and cntvig>=2018;    --  where 

select * from hosvital.movcxc where doccod= 'RNA' and clicod= '900298372';


-- ejemplo : RNA 6251
select * from hosvital.docucon where doccod='CEG'; 

select * from hosvital.movcxc where doccod= 'DRC' and clicod= '900298372' and cntvig>=2018 AND MCCNUMOBL = '423004';

SELECT * FROM HOSVITAL.MOVBAN WHERE  doccod= 'DRC' and TRCCOD= '900298372'  ; --  AND MVBNROCMP=22142;

SELECT * FROM HOSVITAL.MOVBAN1 WHERE DOCCOD='RNA' AND MVBNROCMP=5366 ; -- aQUI ESTA

SELECT * FROM HOSVITAL.MOVBAN2  WHERE DOCCOD='RNA' AND MVBNROCMP=5366 ; -- AQUI ES DONDE }SE RELACIONAN

SELECT * FROM HOSVITAL.MOVBAN2 WHERE  MVB2CD='DRC' AND MVB2CN=22142 ;

-- Ojo este no esta detallado

SELECT * FROM HOSVITAL.MOVBAN1 WHERE   DOCCOD='RNA' AND MVBNROCMP=6231 ;
SELECT * FROM HOSVITAL.MOVBAN2 WHERE   DOCCOD='RNA' AND MVBNROCMP=6231 ;

-- ESTE ESTA DETALLADO

SELECT * FROM HOSVITAL.MOVBAN WHERE  doccod= 'RNA' and TRCCOD= '900298372'  AND  MVBNROCMP=1301 ; -- MVBDOCDET =  10341
SELECT * FROM HOSVITAL.MOVBAN1 WHERE   DOCCOD='RNA' AND MVBNROCMP=1301 ;
SELECT * FROM HOSVITAL.MOVBAN2 WHERE   DOCCOD='RNA' AND MVBNROCMP=1301 ;
SELECT * FROM HOSVITAL.MOVBAN2 WHERE  MVB2CD='DRC' AND MVB2CN=10341 ;


--Otro ejemplo fACTURA 407609 ,,EN DRC 22903
select * from hosvital.movcxc where doccod= 'DRC' AND CNTVIG =2019  ; --and MVCXCNRO= 10341 ;   

--En que recibo de caja
SELECT * FROM HOSVITAL.MOVBAN WHERE  doccod= 'RNA'   AND  MVBNROCMP=6581 ; -- AQUI DICE QUE ESTA DETALLADO EN EL MVBDOCDET=22903
SELECT * FROM 	 HOSVITAL.MOVBAN WHERE MVBDOCDET=22903;
SELECT * FROM HOSVITAL.MOVBAN2 WHERE  MVB2CD='DRC' AND MVB2CN=22903 ; 
SELECT * FROM HOSVITAL.MOVBAN1 WHERE   DOCCOD='RNA' AND MVBNROCMP=6581 ;
SELECT * FROM HOSVITAL.MOVBAN2 WHERE   DOCCOD='RNA' AND MVBNROCMP=6581 ;  -- PERO NO DETALLADO
--aQUI DICE NO DETALLADO

SELECT * FROM HOSVITAL.MOVBAN2 WHERE   DOCCOD='DRC' AND MVBNROCMP=22903 ; 
SELECT * FROM HOSVITAL.MOVBAN2 WHERE  MVB2CD='DRC' AND MVB2CN=22903 ;
SELECT * FROM HOSVITAL.MOVBAN WHERE  doccod= 'RNA'  AND  MVBNROCMP=6581 ;  -- EN MVBDOCDET ESTA 22903

-- Aqui dice que esta detallado

select * 
from hosvital.movban 
where  MVBNROCMP=6581  and doccod='RNA' and empcod='01' and mcdpto='001' and MVBDET IN ('S') and PRCTESCOD='R'  and  mvbvlr <>0  AND  MVBACT= 'S'
ORDER BY MVBNROCMP;  

--
SELECT * FROM HOSVITAL.MOVCXC WHERE MCCNUMOBL = '407609'; -- LA FCTURA SOLO ESTA POR  542800.00	 Y ELDRC TAB SOLO CAUSO  15917.00	
SELECT  MAESTF FROM HOSVITAL.MAEATE WHERE MPNFAC = 407609;   ---MATOTF = 542800.00 ESTA ANULADA CONTAB ILIOZADA

-- HAY QUE MIRAR MAS EJEMPLOS


SELECT * FROM HOSVITAL.MOVCXC  WHERE MCCFCH >= '2019-01-01 00:00:00' AND DOCCOD='DRC';

-- eJEMPLO 2 DRC 22795 FACTURA 507170         	

SELECT * FROM HOSVITAL.MOVCXC WHERE MCCNUMOBL = '507170'; -- HAY DOS DRC   22262 , 22795

SELECT * FROM HOSVITAL.MOVBAN WHERE MVBDOCDET IN (  '22262','22795')  ;   -- AQUI EST CAMPO ESTA EN CEROS
SELECT * FROM HOSVITAL.MOVBAN WHERE DOCCOD='RNA' AND  MVBNROCMP IN ('5306','6535');
SELECT * FROM HOSVITAL.MOVBAN1 WHERE DOCCOD='RNA' AND  MVBNROCMP IN ('5306','6535');

SELECT * FROM HOSVITAL.MOVBAN2 WHERE DOCCOD='DRC' AND  MVBNROCMP IN ( '22262','22795');  -- PERO NO DETALLADO
SELECT * FROM HOSVITAL.MOVBAN2 WHERE  MVB2CD='DRC' AND  MVB2CN IN ( '22262','22795') ;  -- PERO NO DETALLADO

-- CONCLUYE EN EL MOMENTO NO ESTAN UTILIZANDO EL APLICATIVO DE CXC PARA DETALLAR O LO ESTAN UTILIZANDO PERO HOSVITAL NO GUARDA EL DETALLE

SELECT * FROM HOSVITAL.MOVBAN WHERE MVBDOCDET  LIKE (  '%22756%')  ; 

-- Aqui el global

SELECT MCXC.DOCCOD, year(MCXC.mccfch)||'-'||month(MCXC.mccfch)||' '||day(MCXC.mccfch),   MCXC.MVCXCNRO,SUM(MCXC.MCCVLR) AS TOTAL,MOV.DOCCOD, MOV.MVBNROCMP  , mov.mvbvlr
FROM HOSVITAL.MOVCXC MCXC
left join  HOSVITAL.MOVBAN MOV on (MOV.MVBDOCDET = MCXC.MVCXCNRO)
WHERE  MCXC.cntvig=2019  and MCXC.DOCCOD='DRC' and mcxc.clicod= '900298372' -- AND mccfch >= '2019-01-01 00:00:00' -- MCXC.MVCXCNRO   IN (  '22262','22795','22756')  
GROUP BY   MCXC.DOCCOD,   MCXC.mccfch, MCXC.MVCXCNRO,MOV.DOCCOD, MOV.MVBNROCMP, mov.mvbvlr
order by MCXC.MVCXCNRO;

-- Ahora respecto de registrados y detallados tenemos

SELECT MCXC.DOCCOD, year(MCXC.mccfch)||'-'||month(MCXC.mccfch)||' '||day(MCXC.mccfch),   MCXC.MVCXCNRO,MOV.TRCCOD, SUM(MCXC.MCCVLR) AS TOTAL,MOV.DOCCOD, MOV.MVBNROCMP  , mov.mvbvlr, MOV.MVBDET, MOV.MVBACT
FROM HOSVITAL.MOVCXC MCXC
left join  HOSVITAL.MOVBAN MOV on (MOV.MVBDOCDET = MCXC.MVCXCNRO)
WHERE MCXC.cntvig>=2017 and  MCXC.DOCCOD='DRC'  and mcxc.clicod= '900298372'  -- AND mccfch >= '2019-01-01 00:00:00' -- MCXC.MVCXCNRO   IN (  '22262','22795','22756')  
GROUP BY   MCXC.DOCCOD,   MCXC.mccfch, MCXC.MVCXCNRO,MOV.TRCCOD,MOV.DOCCOD, MOV.MVBNROCMP, mov.mvbvlr,MOV.MVBDET, MOV.MVBACT
order by MCXC.MVCXCNRO;

-- Ahora respecto de registrados y detallados pero a nivel de cada factura

SELECT MCXC.DOCCOD, year(MCXC.mccfch)||'-'||month(MCXC.mccfch)||' '||day(MCXC.mccfch),   MCXC.MVCXCNRO,MOV.TRCCOD, mcxc.mccnumobl, SUM(MCXC.MCCVLR) AS TOTAL,
SUM(HOJ.HOJTOTDEB - HOJ.HOJTOTCRE) AS SALDO,
MOV.DOCCOD, MOV.MVBNROCMP  , mov.mvbvlr, MOV.MVBDET, MOV.MVBACT
FROM HOSVITAL.MOVCXC MCXC
INNER JOIN  hosvital.HOJOBL HOJ ON (HOJ.HOJNUMOBL=MCXC.MCCNUMOBL AND HOJ.CNTVIG=2019 AND (HOJ.HOJTOTDEB-HOJ.HOJTOTCRE >0))
left join  HOSVITAL.MOVBAN MOV on (MOV.MVBDOCDET = MCXC.MVCXCNRO)
WHERE MCXC.cntvig>=2010 and  MCXC.DOCCOD='DRC'  and mcxc.clicod= '900298372'  
GROUP BY   MCXC.DOCCOD,   MCXC.mccfch, MCXC.MVCXCNRO,MOV.TRCCOD,mcxc.mccnumobl,   MOV.DOCCOD, MOV.MVBNROCMP, mov.mvbvlr,MOV.MVBDET, MOV.MVBACT
order by MCXC.MVCXCNRO,mcxc.mccnumobl;


-- Query para saber cuakles facturas no tienen DRC despues del 01-enero del 2019

select *
from hosvital.hojobl h
where h.hojfchobl >= '2019-01-01 00:00:00' and hojnumobl not in (select mccnumobl from hosvital.movcxc m where doccod='DRC');

select *  from hosvital.movcxc  where  mccnumobl in ('407135');
SELECT * FROM HOSVITAL.HOJOBL WHERE HOJNUMOBL = '407135'; -- LA VIGENCIA ESTA EN LA HOJOBL Y EN LA MOVCXC NO MIRAR VIGENCIA



-- Query reorganizado de las que tienen saldo/ pero no seri mejor de todas como seria ?
-- Debe listar todas las facturas vigencia 2019


SELECT HOJ.HOJNUMOBL AS FACTURA,hoj.clicod as cliente, HOJ.HOJFCHOBL AS FECHA_OBLIGACION, hoj.hojvlrobl as valor_obligacion,(HOJ.HOJTOTDEB - HOJ.HOJTOTCRE) AS SALDO,
(select mov.mvcxcnro
 from hosvital.movcxc mov
 where mov.clicod=hoj.clicod and mov.mccnumobl = hoj.hojnumobl and mov.doccod='DRC' and (mov.mvcxcnro||' '||MOV.MCCCSC) = (select min(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod )
) as DRC,
(select mov.mccvlr
 from hosvital.movcxc mov
 where mov.clicod=hoj.clicod and mov.mccnumobl = hoj.hojnumobl and mov.doccod='DRC' and mov.mvcxcnro||' '||MOV.MCCCSC = (select min(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod )
) as valor_DRC,
(select mban.mvbnrocmp
from hosvital.movban mban, hosvital.movcxc mov
where mban.trccod=mov.clicod and mov.clicod=hoj.clicod and mov.mccnumobl= hoj.hojnumobl and mov.doccod='DRC' and mov.mvcxcnro = mban.mvbdocdet  and mov.mvcxcnro||' '||MOV.MCCCSC = (select min(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod )
) as rna,
(select mban.mvbvlr
from hosvital.movban mban, hosvital.movcxc mov
where mban.trccod=mov.clicod and mov.clicod=hoj.clicod and mov.mccnumobl= hoj.hojnumobl and mov.doccod='DRC' and mov.mvcxcnro = mban.mvbdocdet and mov.mvcxcnro||' '||MOV.MCCCSC = (select min(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod )
) as valor_rna,
(select 'Registrado: '||mban.mvbact||' Detallado: '||mban.mvbdet
from hosvital.movban mban, hosvital.movcxc mov
where mban.trccod=mov.clicod and mov.clicod=hoj.clicod and mov.mccnumobl= hoj.hojnumobl and mov.doccod='DRC' and mov.mvcxcnro = mban.mvbdocdet and mov.mvcxcnro||' '||MOV.MCCCSC = (select min(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod )
) as rna_estados,
(
select mov.mvcxcnro
 from hosvital.movcxc mov
 where mov.clicod=hoj.clicod and mov.mccnumobl = hoj.hojnumobl and mov.doccod='DRC' and mov.mvcxcnro||' '||MOV.MCCCSC = (select max(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod) and mov.mvcxcnro||' '||MOV.MCCCSC != (select min(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod)
) as DRC1,
(select mov.mccvlr
 from hosvital.movcxc mov
 where mov.clicod=hoj.clicod and mov.mccnumobl = hoj.hojnumobl and mov.doccod='DRC' and mov.mvcxcnro||' '||MOV.MCCCSC = (select max(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod ) and mov.mvcxcnro||' '||MOV.MCCCSC != (select min(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod)
) as valor_DRC1,
(select mban.mvbnrocmp
from hosvital.movban mban, hosvital.movcxc mov
where mban.trccod=mov.clicod and mov.clicod=hoj.clicod and mov.mccnumobl= hoj.hojnumobl and mov.doccod='DRC' and mov.mvcxcnro = mban.mvbdocdet  and mov.mvcxcnro||' '||MOV.MCCCSC = (select max(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod ) and mov.mvcxcnro||' '||MOV.MCCCSC != (select min(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod)
) as rna1,
(select mban.mvbvlr
from hosvital.movban mban, hosvital.movcxc mov
where mban.trccod=mov.clicod and mov.clicod=hoj.clicod and mov.mccnumobl= hoj.hojnumobl and mov.doccod='DRC' and mov.mvcxcnro = mban.mvbdocdet and mov.mvcxcnro||' '||MOV.MCCCSC = (select max(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod ) and mov.mvcxcnro||' '||MOV.MCCCSC != (select min(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod)
) as valor_rna1,
(select 'Registrado: '||mban.mvbact||' Detallado: '||mban.mvbdet
from hosvital.movban mban, hosvital.movcxc mov
where mban.trccod=mov.clicod and mov.clicod=hoj.clicod and mov.mccnumobl= hoj.hojnumobl and mov.doccod='DRC' and mov.mvcxcnro = mban.mvbdocdet and mov.mvcxcnro||' '||MOV.MCCCSC = (select max(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod ) and mov.mvcxcnro||' '||MOV.MCCCSC != (select min(mov1.mvcxcnro||' '||MOV1.MCCCSC) from hosvital.movcxc mov1 where mov1.clicod=mov.clicod and mov1.mccnumobl=mov.mccnumobl and mov1.doccod=mov.doccod)
) as rna_estados1
FROM HOSVITAL.HOJOBL HOJ
WHERE HOJ.CNTVIG=2019   -- AND HOJ.CLICOD= '830113831'  -- and (hoj.hojtotdeb - hoj.hojtotcre) >0  -- and hoj.hojnumobl = '518111' AND HOJ.CLICOD= '830003564'
order by hoj.clicod ,hoj.hojnumobl ;  -- llega hasta kla fact 518106         	
--ESTA ES LA DIF : 508855.00	


-- Query que muestra el tiotal deñrna y el total de los drc


select movban.doccod,movban.mvbnrocmp,movban.mvbfch,movban.trccod,movban.mvbvlr,mov.doccod,mov.mvcxcnro, sum(mov.mccvlr), (movban.mvbvlr  - sum(mov.mccvlr)) as dif, 'Registrado: '||movban.mvbact||' Detallado: '||movban.mvbdet
from hosvital.movban movban, hosvital.movcxc mov where  mov.cntvig= 2019 and movban.doccod='RNA' and movban.mvbfch>= '2018-01-01 00:00:00' and movban.trccod = mov.clicod and movban.MVBDOCDET = mov.mvcxcnro and mov.doccod='DRC' group by  movban.doccod,movban.mvbnrocmp,movban.mvbfch,movban.trccod,mvbvlr,mov.doccod,mov.mvcxcnro,'Registrado: '||movban.mvbact||' Detallado: '||movban.mvbdet
order by movban.doccod, movban.mvbnrocmp;


-- valores de un drc --23117524
/*
RNA	6076	2018-09-05 00:00:00.000000	860009578      	19871744.00	DRC	23053	19680596.00	191148.00	Registrado: S Detallado: S	
*/

select mov.cntvig,mov.doccod,mov.mvcxcnro,mov.mccnumobl,mov.clicod,mov.mccvlr,
(select sum(mov1.mccvlr)
from hosvital.movcxc mov1
where  mov1.mccnumobl = mov.mccnumobl and mov1.mccnat='D' and  mov1.doccod != 'FAD'
) as debitos,
(select sum(mov1.mccvlr)
from hosvital.movcxc mov1
where  mov1.mccnumobl = mov.mccnumobl  and mov1.mccnat='C' and  mov1.doccod != 'FAD'

) as creditos
from hosvital.movcxc mov
where mov.doccod='DRC' and mov.mvcxcnro=23053 
order by mccvlr ;

 -- 518005         	860009578      	1040329.00	5797592.00	6353226.00	


select * from hosvital.movcxc where mccnumobl in ('518005');

select * from hosvital.movcont2 where doccod='FAR' and mvcnro =518005;

SELECT doccod, mvcnro, sum(case when mvcnat='C' then mvcvlr end) as credito,sum(case when mvcnat='D' then mvcvlr end) as debito
from hosvital.movcont2
where doccod='FAR' and mvcnro =518005
group by doccod, mvcnro;


select * from hosvital.hojobl where hojnumobl = '518005' and cntvig=2019;

select sum(mov1.mccvlr)
from hosvital.movcxc mov1
where  mov1.mccnumobl = '518005' and mov1.mccnat='C' and  mov1.doccod  not in  ('FAD','RGL');  --5797592.00		


select sum(mov1.mccvlr)
from hosvital.movcxc mov1
where  mov1.mccnumobl = '518005' and mov1.mccnat='D' and  mov1.doccod  not in  ('FAD','RGL');       --5241958.00	

SELECT * FROM HOSVITAL.DOCUCON WHERE DOCCOD= 'RGL';

-- RNA , sin DRC asociado :

SELECT DOCCOD, MVBNROCMP,MVBFCH, TRCCOD,MVBVLR,MVBDET,MVBACT
 FROM HOSVITAL.MOVBAN WHERE DOCCOD='RNA' AND MVBFCH >= '2018-01-01 00:00:00' AND MVBDOCDET='0'
ORDER BY MVBFCH ;

-- El rna 5468, dice que esta registrado y detallado , pero no hay relacion con el drc
-- Miren esta joyita


-- Este ejemplo es importante :

select * from hosvital.movcxc  where DOCCOD = 'DRC' AND McccnC LIKE ('%RNA%5468%');

SELECT * FROM HOSVITAL.MOVBAN WHERE  MVBDOCDET=22301;

SELECT * FROM HOSVITAL.MOVBAN WHERE DOCCOD='RNA' AND MVBNROCMP = 5468;  -- ESTA POR 358433147.00
SELECT * FROM HOSVITAL.MOVBAN1 WHERE DOCCOD='RNA' AND MVBNROCMP = 5468;
SELECT * FROM HOSVITAL.MOVBAN2 WHERE DOCCOD='RNA' AND MVBNROCMP = 5468;
	
select SUM(MCCVLR)
 from hosvital.movcxc 
 where DOCCOD = 'DRC' AND McccnC LIKE ('%RNA%5468%');   -- 358624016.30	

-- VEAMOS TODAS LAS TABLASPARA UN drc APLICADO y con datos en la movban

SELECT * FROM HOSVITAL.MOVBAN WHERE DOCCOD='RNA' AND MVBNROCMP = 4517;  -- ESTA POR 358433147.00
/*
01	RNA	001      	4517	1	2016-12-29 12:14:59.000000	25	PES	1.00	INGRESO RECAUDO CARTERA                                                                             	0	0	                                                            	800130907      	D	526031915.00	0.00	 	    	  	0	 	N	0001-01-01	               	 	R	-23 	             	2017-04-24 13:25:59.000000	NA2   	S	S	19998	 	 	  	                                                            	JULIMAR   	0	2016	001      	0.00	N	L	          	0	




01	RNA	001      	5468	1	2018-01-11 17:04:11.000000	17	PES	1.00	INGRESO RECAUDO CARTERA                                                                             	0	0	                                                            	900156264      	D	358433147.00	0.00	 	    	  	0	 	N	0001-01-01	               	 	R	-23 	             	0001-01-01 00:00:00.000000	      	S	S	0	 	 	  	                                                            	JULIMAR   	0	2018	         	0.00	 	 	          	0	


*/

SELECT * FROM HOSVITAL.MOVBAN1 WHERE DOCCOD='RNA' AND MVBNROCMP = 4517;
/*
01	RNA	001      	4517	1	1	800130907      	NA2   	S	526031915.00	526031915.00	2016-12-29 12:14:59.000000	0001-01-01 00:00:00.000000	null	0.00	
01	RNA	001      	5468	1	1	900156264      	      	S	358433147.00	358433147.00	2018-01-11 17:04:11.000000	0001-01-01 00:00:00.000000	null	0.00	

*/
SELECT * FROM HOSVITAL.MOVBAN2 WHERE DOCCOD='RNA' AND MVBNROCMP = 4517;

/*
01	RNA	001      	4517	1	1	1	01	DRC	19998	001      	  	   	0	         	
01	RNA	001      	5468	1	1	1	01	DRC	0	         	  	   	0	         	

*/

SELECT * FROM HOSVITAL.MOVCXC WHERE MCCCNC LIKE ('%RNA 5992%');
SELECT * FROM HOSVITAL.MOVCXC WHERE MCCCNC LIKE ('%RNA 5997%');

SELECT * FROM HOSVITAL.MOVBAN  WHERE  MVBDOCDET IN (22530,22527); -- Como no estan relacinados  en la movbamn no salen en cxcobrar

SELECT * FROM HOSVITAL.MOVBAN1 WHERE  DOCCOD='RNA' AND MVBNROCMP IN ( 5992,5997)   ; 

 --398386104.00	
-- 14556992.00	

select doccod,mvcxcnro,SUM(MCCVLR)
 from hosvital.movcxc 
 where DOCCOD = 'DRC' AND ( McccnC  like  ('%5992%')  or    McccnC  like  ('%5997%')         )
group by  doccod,mvcxcnro;  

/*
DRC	22527	395224989.00	
DRC	22528	11812497.00	
DRC	22530	14433206.00	


*/

SELECT * FROM HOSVITAL.MOVBAN WHERE  DOCCOD='RNA' AND MVBNROCMP IN ( 5992,5997)   ;  -- ESTOS RNA NO TIENE DETALLADOS
SELECT doccod,mvbnrocmp,mvbvlr,MVBDOCDET  FROM HOSVITAL.MOVBAN WHERE  DOCCOD='RNA' AND MVBNROCMP IN ( 5992,5997)   ; 
/*
RNA	5992	398386104.00	0	
RNA	5997	14556992.00	0		
*/
update hosvital.movban set  MVBDOCDET = 22527 where  DOCCOD='RNA' AND MVBNROCMP IN ( 5992) and  MVBDOCDET=0 and  mvbvlr=398386104.00  -- estaba en ceros	
;
update hosvital.movban set  MVBDOCDET = 0  where  DOCCOD='RNA' AND MVBNROCMP IN ( 5992) and  MVBDOCDET=22527 and  mvbvlr=398386104.00  -- estaba en ceros	
;


insert into  hosvital.movban2 values ('01','RNA','001',5992,1,1,1,'01','DRC',22527,'001',' ',' ',0,' ');

delete from hosvital.movban2 where doccod='RNA' AND MVBNROCMP = 5992;

SELECT * FROM HOSVITAL.MOVBAN1 WHERE  DOCCOD='RNA' AND MVBNROCMP IN ( 5992,5997)   ;
SELECT * FROM HOSVITAL.MOVBAN2 WHERE  DOCCOD='RNA' AND MVBNROCMP IN ( 5992,5997)   ;  -- no hay datos


-- Query que detecta que RNA se deben aplicar :


select DOCCOD,MVCXCNRO, MCCFCH,MCCNUMOBL, MCCCNC,INSTR(MCCCNC,'RNA'), 
case when substr(MCCCNC,( INSTR(MCCCNC,'RNA') +3  ),1)  != '' then substr(MCCCNC,( INSTR(MCCCNC,'RNA') +3  ),4) else   substr(MCCCNC,( INSTR(MCCCNC,'RNA') +4  ),4) end
 from hosvital.movcxc 
 where DOCCOD = 'DRC' AND  McccnC  like  ('%RNA%') AND MCCFCH >= '2019-03-01 00:00:00'
ORDER by  doccod,mvcxcnro;  

-- UPDATE PARA RELACIONAR RNA CON DRC

update hosvital.movban
set  mvbdocdet= 22910	
where doccod='RNA' and MVBNROCMP= 6515;
select * from  hosvital.movban where doccod='RNA' and MVBNROCMP= 6604;
select * from  hosvital.movban1 where doccod='RNA' and MVBNROCMP= 6604;
select * from  hosvital.movban2 where doccod='RNA' and MVBNROCMP= 6604;
select * from  hosvital.movban2 where doccod='RNA' ;

-- Insert a la mpvban1 desde la movban

-- INSERT into hosvital.movban1
select
from hosvital.movban
where doccod=' ' and 

-- Insert a la movban2 desde la movban

-- INSERT into hosvital.movban2
select empcod,doccod,mcdpto,MVBNROCMP,mvbcsc,1,1,'01','DRC',6515,'001','','',0,''
from hosvital.movban where doccod='RNA' and MVBNROCMP= 6515;

--Cuales de las que se dicen estar REGISTRADAS, VERDADERAMENTE nO ESTAN rEGISTRADAS

-- O sea en la movban campo  MVBDOCDET con valor y en la movban2 campo mvb2cn= el valor_trc

select doccod, mvbnrocmp, mvbcsc, mvbfch, trccod, mvbvlr, mvbdocdet,  mvbdet,  mvbact  from hosvital.movban where mvbfch >= '2018-01-01 00:00:01' and doccod = 'RNA' and mvbact='S' and MVBDOCDET= 0; -- Aqui hay que actualualizar


-- Miren estos RNA, no estan en la movcxc

select DOCCOD,MVCXCNRO, MCCFCH,MCCNUMOBL, MCCCNC,INSTR(MCCCNC,'RNA'), 
case when substr(MCCCNC,( INSTR(MCCCNC,'RNA') +3  ),1)  != '' then substr(MCCCNC,( INSTR(MCCCNC,'RNA') +3  ),4) else   substr(MCCCNC,( INSTR(MCCCNC,'RNA') +4  ),4) end
 from hosvital.movcxc 
 where DOCCOD = 'DRC' AND  McccnC  like  ('%RNA%') AND MCCFCH >= '2019-03-01 00:00:00' and (   case when substr(MCCCNC,( INSTR(MCCCNC,'RNA') +3  ),1)  != '' then substr(MCCCNC,( INSTR(MCCCNC,'RNA') +3  ),4) else   substr(MCCCNC,( INSTR(MCCCNC,'RNA') +4  ),4) end      )   not  in (select  MVBNROCMP from  hosvital.movban mov  where mov.mvbdocdet  = hosvital.movcxc .mvcxcnro)
ORDER by  doccod,mvcxcnro;  

select * from hosvital.movban where mvbdocdet=22910;

select * from hosvital.movban1  where  doccod = 'RNA'  and MVBNROCMP = 5468;
select * from hosvital.movban2  where  doccod = 'RNA'  and MVBNROCMP = 5468; -- aiomcampo mvb2cn = valor_DRC


select DOCCOD,MVCXCNRO, MCCFCH,MCCNUMOBL, MCCCNC, clicod,mccvlr,
case when substr(MCCCNC,( INSTR(MCCCNC,'RNA') +3  ),1)  != '' then substr(MCCCNC,( INSTR(MCCCNC,'RNA') +3  ),4) else   substr(MCCCNC,( INSTR(MCCCNC,'RNA') +4  ),4) end
 from hosvital.movcxc 
 where DOCCOD = 'DRC' AND  McccnC  like  ('%RNA%') AND MCCFCH >= '2018-01-01 00:00:00' and (case when substr(MCCCNC,( INSTR(MCCCNC,'RNA') +3  ),1)  != '' then substr(MCCCNC,( INSTR(MCCCNC,'RNA') +3  ),4) else   substr(MCCCNC,( INSTR(MCCCNC,'RNA') +4  ),4) end )  
not in (select  mvbdocdet from hosvital.movban)
ORDER by  doccod,mvcxcnro;  


-- que es lo que pasa ,parece que el guarda ceros cuando hay muchos recivbos de caja No es uno a uno

-- Veamos el comportamiento de la movban1 cuales estan en la movban que noestan en la movban1


select * from hosvital.movban
where doccoD='RNA' AND    MVBFCH >= '2018-01-01 00:00:00' AND  MVBNROCMP  NOT IN (SELECT MVBNROCMP FROM HOSVITAL.MOVBAN1 WHERE DOCCOD='RNA')
ORDER BY MVBNROCMP;


-- Veamos el comportamiento de la movban2 cuales estan en la movban que noestan en la movban2
-- Sera que son las mismas???


select * from hosvital.movban
where doccoD='RNA' AND    MVBFCH >= '2018-01-01 00:00:00' AND  MVBNROCMP  NOT IN (SELECT MVBNROCMP FROM HOSVITAL.MOVBAN2 WHERE DOCCOD='RNA')
ORDER BY MVBNROCMP;

-- cuales estan en la movban2 que no estan en la movban NINGUNA

select * from hosvital.movban2
where doccoD='RNA'  AND  MVBNROCMP  NOT IN (SELECT MVBNROCMP FROM HOSVITAL.MOVBAN WHERE DOCCOD='RNA')
ORDER BY MVBNROCMP;

-- cuales estan en la movban2 que no estan en la movban1 NINGUNA


select * from hosvital.movban2
where doccoD='RNA'  AND  MVBNROCMP  NOT IN (SELECT MVBNROCMP FROM HOSVITAL.MOVBAN1 WHERE DOCCOD='RNA')
ORDER BY MVBNROCMP;






select  * from hosvital.movban where  mvbdocdet=22263;
select  * from hosvital.movban2 where  doccod='RNA'  and MVBNROCMP=5576;

-- Pasos para encontrar a que RNA se debe aplicar

-- Se busca el detalle en la movcxc de a cual se le aplico

select * from hosvital.movcxc where mccnumobl = '424886';	

-- se busca el RNA
SELECT * FROM HOSVITAL.MOVBAN WHERE doccod='RNA' and MVBNROCMP=5992;


SELECT * FROM HOSVITAL.MOVBAN WHERE  MVBDOCDET=22528;  -- mvbdocdet esta en ceros // perop es que este recibode caja va para muchos cual DRC le coloco
-- Busco si hay registro movban1

SELECT * FROM HOSVITAL.MOVBAN1  WHERE doccod='RNA' and MVBNROCMP=5992;


-- Busco si hay registro movban2

SELECT * FROM HOSVITAL.MOVBAN2  WHERE doccod='RNA' and MVBNROCMP=5992;   -- OPS NO HAY NADA

--DIAGNOSTICOS :

-- Se coloco el RNA en el detalle del documento contable
-- En algunos casos no se cruza EL RNA con el DRC 
-- Muchos registrados RNA, no tienen DRC asociados con detalles del RNA en referencia en la movcxc , por lo tanto no va a ver relacion de la movcxc con la movmab
-- hay registros en la movban que  no estan en la movban1 ni tampoco en la movban2
-- 


select * from hosvital.movban where EMPCOD='02' AND DOCCOD='RC';
select * from hosvital.movban where DOCCOD='DR';


select * from hosvital.movban where EMPCOD='01' AND DOCCOD='RNA' and mvbnrocmp in ('6031','5586','5265','4748');

UPDATE HOSVITAL.MOVBAN
SET MVBDET='S',  MVBACT='S'
 where EMPCOD='01' AND DOCCOD='RNA' and mvbnrocmp in ('6031','5586','5265','4648');

-- Octubre 25/2019

select * from hosvital.movban  where  doccod = 'RNA'  and MVBNROCMP = 7220;
select * from hosvital.movban1  where  doccod = 'RNA'  and MVBNROCMP = 7220;

UPDATE hosvital.movban
SET MVBACT='S' --  Estaba en R
 where  doccod = 'RNA'  and MVBNROCMP IN (7220,7236,7015,7035,7055,7005,7102,7131,7166,7145);


select * from hosvital.movban2  where  doccod = 'RNA'  and MVBNROCMP = 7220; 
