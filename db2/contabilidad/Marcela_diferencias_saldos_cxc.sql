select * from hosvital.hojobl;

select cntvig,sum(hojvlrobl) , sum(hojtotcre), sum(hojtotdeb)  from hosvital.hojobl
 where empcod='01' and  cntvig >= 2020 and hojvlrobl <> hojtotdeb - hojtotcre + hojvlrobl and hojfchobl <= '2020-12-31 23:59:59'  group by cntvig order by cntvig;
select hojnumobl , hojvlrobl from hosvital.hojobl where cntvig >= 2020 and hojvlrobl>= 1097344 order by hojvlrobl;

select *  from hosvital.hojobl
 where empcod='01' and  cntvig >= 2020 and hojvlrobl <> hojtotdeb - hojtotcre + hojvlrobl and hojfchobl <= '2020-12-31 23:59:59' ;

select hojnumobl, clicod, cntvig, hojvlrobl, hojfchobl,hojtotcre, hojtotdeb 
 from hosvital.hojobl
 where empcod='01' and  cntvig = 2020 and hojvlrobl <> hojtotdeb - hojtotcre + hojvlrobl and hojfchobl <= '2020-12-31 23:59:59' and hjfcanobl <> '0001-01-01'
order by hojvlrobl;


select y.hojnumobl, y.clicod, y.cntvig, y.hojvlrobl, y.hojfchobl,y.hojtotcre, y.hojtotdeb ,y.hjfcanobl
 from hosvital.hojobl y
 where empcod='01' and  cntvig = 2020 and y.hojfchobl <= '2020-12-31 23:59:59'  and   hjfcanobl = '0001-01-01' and hojnumobl in (select x.hojnumobl from hosvital.hojobl x where x.empcod=y.empcod and x.cntvig=2021 and x.cntcod=y.cntcod and x.hojnumobl=y.hojnumobl);


select  y.cntvig, sum(y.hojvlrobl), sum(y.hojtotcre), sum(y.hojtotdeb )
 from hosvital.hojobl y
 where empcod='01' and  cntvig >= 2020 and y.hojfchobl <= '2020-12-31 23:59:59'  and   hjfcanobl = '0001-01-01' 
group by   y.cntvig;

select empcod,hojnumobl ,hojfchobl, cntvig,  cntcod, hojvlrobl,hojtotdeb,hojtotcre,hjfcanobl  from hosvital.hojobl where hojnumobl in ('644822','645985','644789');

update  hosvital.hojobl
set hojvlrobl=703543.00	,hojtotdeb=703543.00		, hojtotcre=703543.00			
 where empcod='01' and cntvig=2021 and   hojnumobl in ('645985') and cntcod= '13010501';



update  hosvital.hojobl
set hojvlrobl=703543.00	,hojtotdeb=703543.00		, hojtotcre=0			
 where empcod='01' and cntvig=2021 and   hojnumobl in ('645985') and cntcod= '13020501';



select * from hosvital.movcxc where mccnumobl = '645985';
select * from hosvital.movcxc where  cntvig=2021;

-- veamos NIIF de cxc
-- Ojo No se ha corrido

select * from hosvital.nihojobl where nihojno  in ('644822','645985','644789');
select * from hosvital.nihojobl where nicntvig =2021 order by nihojfo;

select count(*) from hosvital.nihojobl where empcod= '01' and nicntvig =2021 ; -- 5447 /5521/5853	/5891/5895/81577/81726/81750	/81839/84283/85739/86071/88710	/88806/105525	
	

				
select count(*) from hosvital.nihojobl where empcod= '01' and nicntvig =2021 and  nihojfo <= '2020-12-31 23:59:59'; -- 79898	
select count(*) from hosvital.hojobl where empcod= '01' and cntvig =2021 anh hojfchobl  <= '2020-12-31 23:59:59';  -- 54188	


select count(*) from hosvital.hojobl where empcod= '01' and cntvig =2021 ;  -- 54179	

select * from hosvital.nihojobl where empcod= '01' and nicntvig =2021 ;

select * from hosvital.nihojobl  where nihojno= '646816' ;
select * from hosvital.nihojobl where nihojno  in ('644851','646715','645851');
select * from hosvital.nihojobl where nihojno  in ('645613');
select * from hosvital.nimovcxc
where  nimccno in  ('644851','646715','645851');;

-- Validemos NIIf cxp
select * from hosvital.nihojoblp where nicntvig=2021;
select * from hosvital.nimovcxp where nicntvig >= 2020 and nimcpno ='170752' and prvcod='811028445';




select * from hosvital.nihojobl x  where x.empcod= '01' and x.nicntvig =2021 and x.nihojno not in (select hojnumobl y  from hosvital.hojobl y  where y.empcod='01' and y.cntvig=2021 and y.hojnumobl = x.nihojno)  ; 
select * from hosvital.nihojobl where nihojno = '471211'      ;
select * from hosvital.hojobl where hojnumobl = '471211'      ;


select count(*) from hosvital.hojobl where empcod= '01' and cntvig =2021 ; 

-- veamos FAN

select count(*) from hosvital.nihojobl where empcod= '03' and nicntvig =2021 and  nihojfo <= '2020-12-31 23:59:59'; -- 274	
select count(*) from hosvital.hojobl where empcod= '03' and cntvig =2021 AND hojfchobl  <= '2020-12-31 23:59:59';  -- 18/ 77


-- Validemos NIIf cxp
select count(*) from hosvital.nihojoblp where EMPCOD='03' AND  nicntvig=2021  AND NIHOPFO <= '2020-12-31 23:59:59';  -- 200
select count(*) from hosvital.hojoblprv where empcod='03' and cntvig=2021 and hopfchobl <= '2020-12-31 23:59:59'; -- Esta en ceros, / 202
select count(*) from hosvital.hojoblprv where empcod='03' and cntvig=2021 and hopfchobl <= '2020-12-31 23:59:59';
select * from hosvital.hojoblprv;
select * from hosvital.cuentas;

select * from hosvital.hojoblprv h  where h.empcod='03' and h.cntcod not in (select c.cntcod from hosvital.cuentas c where c.empcod='03' and c.cntcod = h.cntcod);
select * from hosvital.hojoblprv  WHERE EMPCOD='03' AND  HOPNOOBL= 'RETEICA 6B' AND CNTCOD = '';

/*
VALORES A BOPRRAR
03	899999061      	RETEICA 6B     	003      	2020	                    	   	   	         	         	2020-12-31 23:59:59.000000	0001-01-01 00:00:00.000000	30 	4799000.00	0.00	4799000.00	0.00	4799000.00	0.00	N	0001-01-01	 	0	4799000.00	   	         	   	0	 	         	             	             	



*/

SELECT * FROM HOSVITAL.MOVCONT3 WHERE DOCCOD='CCB' AND MVCNRO = 14;
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CCB' AND MVCNRO = 14;
SELECT * FROM HOSVITAL.MOVCXP WHERE DOCCOD='CCB' AND MVCXPNRO= 14;
SELECT * FROM HOSVITAL.MOVCXP WHERE empcod='03' and  mvcxpnuob = 'RETEICA 6B';
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CAF' AND MVCNRO = 46;
SELECT * FROM HOSVITAL.MOVCONT3 WHERE DOCCOD='CAF' AND MVCNRO = 46;
-- 
DELETE from hosvital.hojoblprv  WHERE EMPCOD='03' AND  CNTVIG=2020 AND HOPNOOBL= 'RETEICA 6B' AND CNTCOD = '';

-- ESTABA CERRADO

update HOSVITAL.MOVCONT3
set mvcest = 'N'
 WHERE EMPCOD='03' AND  DOCCOD='CAF' AND MVCNRO = 46;

/*
ESTABA EN 4799000.00	
0.00	


*/

update HOSVITAL.MOVCont2
set MVCVLR = 0,  MVCVLRLC=0
 WHERE empcod='03' and  doccod='CAF' AND mvcnro= 46 ;




update HOSVITAL.MOVCXP  -- ESTABA EN 4799000.00	
set cntcod= '',MVCXPVAL=0
 WHERE empcod='03' and  mvcxpnuob = 'RETEICA 6B' and doccod='CAF' AND mvcxpnro= 46;

-- veamos FAN

select count(*) from hosvital.nihojobl where empcod= '02' and nicntvig =2021 and  nihojfo <= '2020-12-31 23:59:59'; -- 2408	
select count(*) from hosvital.hojobl where empcod= '02' and cntvig =2021 AND hojfchobl  <= '2020-12-31 23:59:59';  -- 305
-- Validemos NIIf cxp
select count(*) from hosvital.nihojoblp where EMPCOD='02' AND  nicntvig=2021  AND NIHOPFO <= '2020-12-31 23:59:59'; -- 140
