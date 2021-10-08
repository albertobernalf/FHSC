select * from hosvital.admglo11 where  mpnfac = 639719;
select * from hosvital.hojobl  where  hojnumobl = '639719';
select * from hosvital.movcxc  where  mccnumobl = '639719';

update  hosvital.hojobl  
set  hojfchobl='2020-10-05 11:59:59.0000', hojvlrobl=663306.00	, hojtotcre=1313920.00	, hojtotdeb=1313920.00, hjfcanobl='2020-12-20'
where  empcod='01' and hojnumobl = '639719' cntvig=2021 and cntcod='13010501' ;

update  hosvital.hojobl  
set  hojfchobl='2020-11-30 12:11:57.00000', hojvlrobl=6346	, hojtotcre=6346	, hojtotdeb=6346, hjfcanobl='2020-12-20'
where  empcod='01' and hojnumobl = '639719' cntvig=2021 and cntcod='13551002' ;

update hosvital.admglo11 
set aglcondoc='',  aglconnro=0, aglconfce='0001-01-01 01:01:01.00000'
where  mpnfac = 639719;

-- Las de Thomas

select * from hosvital.admglo11 where  mpnfac in ( '638985','638986','645996');  
select * from hosvital.hojobl  where  cntvig=2021 and  hojnumobl in ( '638985','638986','645996');  -- 830014193      
SELECT * FROM HOSVITAL.NIHOJOBL WHERE nicntvig>=2021 and NIHOJNO  in ( '638985','638986','645996'); -- Se ve bien , No se porque , pues existe como obligacion LOCAL y NIIF

select * from hosvital.maeate where mpnfac  in ( '638985','638986','645996'); 
	
select * from hosvital.movcxc  where  mccnumobl in ( '638985','638986','645996');

SELECT * FROM HOSVITAL.TERCEROS WHERE TRCCOD='830014193';

-- Las demas Facturas a Radicar

SELECT * FROM HOSVITAL.NIHOJOBL WHERE NIHOJNO IN ( '639719','639723','639730','639724','642568');
select * from hosvital.movcxc  where  mccnumobl in ( '639719','639723','639730','639724','642568');

SELECT * FROM HOSVITAL.HOJOBL WHERE CNTVIG= 2021 AND HOJNUMOBL IN ( '639719','639723','639730','639724','642568');
SELECT * FROM HOSVITAL.HOJOBL WHERE CNTVIG= 2020 AND HOJNUMOBL IN ( '639719','639723','639730','639724','642568'); -- 1. No tienen saldo
							                 -- 2. Al no tener saldo , el proceso Creacion de Saldos Cuentas por cobrar No creo la obligacion 2021
							                 -- 3. Hosvital la creo la obligacion local al momento de la radicacion pero mal
							                 -- 4. No existen Obigaciones en NIIF 2021
							                 -- 5. El proceso radicacion de Facturas dice que No existe Obligacion

SELECT * FROM HOSVITAL.MOVCXC WHERE MCCNUMOBL  IN ( '639719','639723','639730','639724','642568') ORDER BY MCCNUMOBL; -- Tiene documentos ACP, RSD, CCT , FAR
