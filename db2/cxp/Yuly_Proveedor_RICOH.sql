select * from hosvital.movcxp  where doccod='CA' AND  MVCXPNRO=5719;

--RFE247534      	


SELECT * FROM HOSVITAL.HOJOBLPRV WHERE HOPNOOBL IN ('RFE247534','PROVDIC2018') AND CNTVIG>= 2018;



SELECT HOPNOOBL, SUM(HOPTOTCRE-HOPTOTDEB)
FROM HOSVITAL.HOJOBLPRV 
WHERE HOPNOOBL IN ('RFE247534','PROVDIC2018','RFE247535')   AND CNTVIG>= 2018
GROUP BY HOPNOOBL;


SELECT HOPNOOBL, SUM(HOPTOTCRE)  CREDITOS , SUM(HOPTOTDEB) DEBITOS,  SUM(HOPTOTCRE)  - SUM(HOPTOTDEB)  AS DIFERENCIA
FROM HOSVITAL.HOJOBLPRV 
WHERE HOPNOOBL IN ('RFE247534','PROVDIC2018','RFE247535')   AND CNTVIG>= 2018 AND PRVCOD = '800026212'
GROUP BY HOPNOOBL;


SELECT SUM(HOPTOTCRE)  CREDITOS , SUM(HOPTOTDEB) DEBITOS,  SUM(HOPTOTCRE)  - SUM(HOPTOTDEB)  AS DIFERENCIA
FROM HOSVITAL.HOJOBLPRV 
WHERE  CNTVIG>= 2018 AND PRVCOD = '800026212';



-- Desde CUENTAS X OPAGAR

SELECT HOPNOOBL,cntcod,SUM(HOPTOTCRE)  CREDITOS , SUM(HOPTOTDEB) DEBITOS,  SUM(HOPTOTCRE)  - SUM(HOPTOTDEB)  AS DIFERENCIA
FROM HOSVITAL.HOJOBLPRV 
WHERE  CNTVIG>= 2018 AND PRVCOD = '800026212' and HOPNOOBL IN ('RFE247534','PROVDIC2018','RFE247535') 
GROUP BY HOPNOOBL,cntcod
order by  HOPNOOBL;

--DESDE CONTABILIDAD

SELECT m.TRCCOD,m.MVCDOCRF1,m.cntcod,
(select sum(m1.mvcvlr)
 from hosvital.movcont2 m1
 where m1.cntvig= 2019 and m1.MVCDOCRF1=m.MVCDOCRF1 and m1.trccod=m.trccod and mvcnat='C') as creditos,
(select sum(m1.mvcvlr)
 from hosvital.movcont2 m1
 where m1.cntvig= 2019 and m1.MVCDOCRF1=m.MVCDOCRF1 and m1.trccod=m.trccod and mvcnat='D') as debitos,
(select sum(case when m1.mvcnat = 'C' then m1.mvcvlr else - m1.mvcvlr end)
 from hosvital.movcont2 m1
 where m1.cntvig= 2019 and m1.MVCDOCRF1=m.MVCDOCRF1 and m1.trccod=m.trccod ) as diferencia
FROM HOSVITAL.MOVCONT2 m
WHERE m.CNTVIG = 2019 AND m.TRCCOD= '800026212' and m.MVCDOCRF1 IN ('RFE247534','PROVDIC2018','RFE247535') 
group by TRCCOD,MVCDOCRF1,m.cntcod
order by MVCDOCRF1 ;

select * from hosvital.movcont2 where cntvig=2019 and tRCCOD= '800026212' and cntcod in ('23357501','23353001','26053001') and mvcnat='C';

select * from hosvital.movcont2 where cntvig=2019 and tRCCOD= '800026212' and m.MVCDOCRF1 = 'PROVDIC2018' and mvcnat='C';


select * from hosvital.movcont2
 where cntvig=2019 and tRCCOD= '800026212' and cntcod in ('23357501','23353001','26053001') and mvcnat='C' and
    (empcod,doccod,mvcnro,mvccsc,cntcod,mvcdocrf1,mvcvlr)  not in (select empcod,doccod,mvcxpnro,mvcxpcsc,cntcod,mvcxpnuob,mvcxpval from  hosvital.movcxp where cntvig=2019 and prvcod= '800026212' and mvcxpnat='C');





 -- TERCERO : 800026212   RICOH

SELECT *  FROM  HOSVITAL.MOVCXP WHERE MVCXPNUOB IN ('RFE247534','PROVDIC2018','RFE247535') AND  PRVCOD = '800026212'  ORDER BY  MVCXPNUOB;

/*
01	ACP	001      	1826	114	2018	2018-12-31 00:00:00.000000	PES	1.00	PROVDIC2018    	23357501            	800026212      	C	29517500.00	0.00	   	   	         	         	PROVISION DICIEMBRE 2018                                                                            	S	N	    	    	
*/

-- INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5719,1,2019,'2019-01-04 10:51:41.000000','PES',1.00,'RFE247534','23357501','800026212','D',21717500.00	,0.00,' ',' ',' ',' ','CARGO FIJO SERV. BOX DICOM DICIEMBRE 2018 ','S','N',' ',' ');


 INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5719,4,2019,'2019-01-04 00:00:00','PES',1.00,'PROVDIC2018','23357501','800026212','D',21717500.00	,0.00,' ',' ',' ',' ','CARGO FIJO SERV. BOX DICOM DICIEMBRE 2018 ','S','N',' ',' ');

INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5720,2,2019,'2019-01-04 00:00:00','PES',1.00,'PROVDIC2018','23357501','800026212','D',6392222.00	,0.00,' ',' ',' ',' ','CLICKS COLOR BLANC Y NEGRO DIC 2018','S','N',' ',' ');


--  INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5720,1,2019,'2019-01-04 00:00:00','PES',1.00,'RFE247535','23353001','800026212','C',6392222.00	,0.00,' ',' ',' ',' ','CLICKS COLOR BLANC Y NEGRO DIC 2018','S','N',' ',' ');



SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CA' AND MVCNRO  IN (5719,5720);
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='ACP' AND MVCNRO  IN (1838) AND TRCCOD= '800026212';

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE HOPNOOBL IN ('RFE247534','PROVDIC2018','RFE247535') AND PRVCOD = '800026212' AND  CNTVIG>= 2018;


SELECT m.TRCCOD,m.cntcod,
(select sum(m1.mvcvlr)
 from hosvital.movcont2 m1
 where m1.cntvig= 2019  and m1.trccod=m.trccod and mvcnat='C') as creditos,
(select sum(m1.mvcvlr)
 from hosvital.movcont2 m1
 where m1.cntvig= 2019  and m1.trccod=m.trccod and mvcnat='D') as debitos,
(select sum(case when m1.mvcnat = 'C' then m1.mvcvlr else - m1.mvcvlr end)
 from hosvital.movcont2 m1
 where m1.cntvig= 2019  and m1.trccod=m.trccod ) as diferencia
FROM HOSVITAL.MOVCONT2 m
WHERE m.CNTVIG = 2019 AND m.TRCCOD= '800026212' and m.cntcod=  '23357501'
group by TRCCOD,m.cntcod;


SELECT m.TRCCOD,m.doccod,m.mvcnro,m.cntcod,
(select sum(m1.mvcvlr)
 from hosvital.movcont2 m1
 where m1.cntvig= 2019 and m1.MVCDOCRF1=m.MVCDOCRF1 and m1.trccod=m.trccod and mvcnat='C') as creditos,
(select sum(m1.mvcvlr)
 from hosvital.movcont2 m1
 where m1.cntvig= 2019 and m1.MVCDOCRF1=m.MVCDOCRF1 and m1.trccod=m.trccod and mvcnat='D') as debitos,
(select sum(case when m1.mvcnat = 'C' then m1.mvcvlr else - m1.mvcvlr end)
 from hosvital.movcont2 m1
 where m1.cntvig= 2019 and m1.MVCDOCRF1=m.MVCDOCRF1 and m1.trccod=m.trccod ) as diferencia
FROM HOSVITAL.MOVCONT2 m
WHERE m.CNTVIG = 2019 AND m.TRCCOD= '800026212' and  m.cntcod=  '23357501'
group by TRCCOD,MVCDOCRF1,m.doccod,m.mvcnro,m.cntcod
order by m.doccod,m.mvcnro;

SELECT doccod, mvcxpnro, cntvig, mvcxpnuob,cntcod,mvcxpnat,mvcxpval FROM  HOSVITAL.MOVCXP WHERE MVCXPNUOB IN ('RFE247534','PROVDIC2018','RFE247535') AND  PRVCOD = '800026212'  and cntcod='23357501' ORDER BY  MVCXPNUOB;

	

--------------------------------

 INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5719,4,2019,'2019-01-04 00:00:00','PES',1.00,'PROVDIC2018','23357501','800026212','D',21717500.00	,0.00,' ',' ',' ',' ','CARGO FIJO SERV. BOX DICOM DICIEMBRE 2018 ','S','N',' ',' ');

INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5720,2,2019,'2019-01-04 00:00:00','PES',1.00,'PROVDIC2018','23357501','800026212','D',6392222.00	,0.00,' ',' ',' ',' ','CLICKS COLOR BLANC Y NEGRO DIC 2018','S','N',' ',' ');
 INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5719,1,2019,'2019-01-04 10:51:41.000000','PES',1.00,'RFE247534','23357501','800026212','D',21717500.00	,0.00,' ',' ',' ',' ','CARGO FIJO SERV. BOX DICOM DICIEMBRE 2018 ','S','N',' ',' ');


SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '800026212' and  HOPNOOBL IN ('PROVDIC2018') AND CNTVIG>= 2018;
SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '800026212' and  HOPNOOBL IN ('RFE247534') AND CNTVIG>= 2018;


update hosvital.hojoblprv
set hoptotdeb = 29517500.00	
WHERE HOPNOOBL IN ('PROVDIC2018') AND CNTVIG= 2019 and hoptotdeb = 1407778.00	;
	

update hosvital.hojoblprv
set hoptotdeb = 21717500.00	
WHERE HOPNOOBL IN ('RFE247534') AND CNTVIG= 2019 and cntcod= '23357501' and  hoptotdeb = 29517500.00	;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CA' AND MVCNRO  IN (5712,5713,5715,5716) and mvcnat='D';

 INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5713,4,2019,'2019-01-15 00:00:00','PES',1.00,'PROVDIC2018','23357501','830053800','D',3149433.00,0.00,' ',' ',' ',' ','SERV. TELEVISION DE 02 ENERO  A 01 FEB 2019 ','S','N',' ',' ');
 INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5715,4,2019,'2019-01-15 00:00:00','PES',1.00,'PROVDIC2018','23357501','830053800','D',4281390.00,0.00,' ',' ',' ',' ','SERV. TELEFONIA VOZ IP 2018 DICIEMBRE','S','N',' ',' ');
 INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5716,4,2019,'2019-01-15 00:00:00','PES',1.00,'PROVDIC2018','23357501','830053800','D',4192370.00,0.00,' ',' ',' ',' ','SERV.INTERNET DICIEMBRE 2018 ','S','N',' ',' ');

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '830053800' and  HOPNOOBL IN ('PROVDIC2018') AND CNTVIG>= 2018;

update hosvital.hojoblprv
set hoptotdeb = 13685714.00		
WHERE HOPNOOBL IN ('PROVDIC2018') AND   prvcod= '830053800' and CNTVIG= 2019 and cntcod= '23357501' and  hoptotdeb = 0	;

---------------------------------------------------------------------------
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CA' AND MVCNRO  IN (5711) and mvcnat='D';

 INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5711,4,2019,'2019-01-16 00:00:00','PES',1.00,'PROVDIC2018','23357501','830133755','D',14224240.00,0.00,' ',' ',' ',' ','SERV. DIC 2018 ESTERILIZACION POR AUTOCLAVE TERMO DESTRUCCION CONTROLADA ','S','N',' ',' ');

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '830133755' and  HOPNOOBL IN ('PROVDIC2018') AND CNTVIG>= 2018;

update hosvital.hojoblprv
set hoptotdeb = 17000000.00			
WHERE HOPNOOBL IN ('PROVDIC2018') AND   prvcod= '830133755' and CNTVIG= 2019 and cntcod= '23357501' and  hoptotdeb = 2775760.00;
---------------------------------------------

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CA' AND MVCNRO  IN (5717) and mvcnat='D';

 INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5717,4,2019,'2019-01-06 00:00:00','PES',1.00,'PROVDIC2018','23357501','860063875','D',50000000.00,0.00,' ',' ',' ',' ','SERV. ENERGIA PERIODO DICIEMBRE 2018  ','S','N',' ',' ');

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '860063875' and  HOPNOOBL IN ('PROVDIC2018') AND CNTVIG>= 2018;

update hosvital.hojoblprv
set hoptotdeb = 50000000.00			
WHERE HOPNOOBL IN ('PROVDIC2018') AND   prvcod= '860063875' and CNTVIG= 2019 and cntcod= '23357501' and  hoptotdeb =0;

---------------------------------------------
---------------------------------------------
---------------------------------------------

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CA' AND MVCNRO  IN (5725) and mvcnat='D';

 INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5725,4,2019,'2019-01-15 00:00:00','PES',1.00,'PROVDIC2018','23357501','890929877','D',38186874.00,0.00,' ',' ',' ',' ','SERV. ALIMENTACION PACIENTES DEL 25 DIC AL 31 DIC 2018   ','S','N',' ',' ');

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '890929877' and  HOPNOOBL IN ('PROVDIC2018') AND CNTVIG>= 2018;

update hosvital.hojoblprv
set hoptotdeb = 65000000.00			
WHERE HOPNOOBL IN ('PROVDIC2018') AND   prvcod= '890929877' and CNTVIG= 2019 and cntcod= '23357501' and  hoptotdeb =26813126.00	
;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CA' AND MVCNRO  IN (5718) and mvcnat='D';

 INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5718,4,2019,'2019-01-10 00:00:00','PES',1.00,'PROVDIC2018','23357501','890929877','D',3171396.00,0.00,' ',' ',' ',' ','SERV. ALMACENAMIENTO Y ORG. DE ARCHIVO DICIEMBRE 2018   ','S','N',' ',' ');
 
delete  from   HOSVITAL.MOVCXP where  prvcod= '890929877' and mvcxpnro=5718 and  mvcxpval=3171396.00	
;

INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5718,4,2019,'2019-01-10 00:00:00','PES',1.00,'PROVDIC2018','23357501','860020382','D',3171396.00,0.00,' ',' ',' ',' ','SERV. ALMACENAMIENTO Y ORG. DE ARCHIVO DICIEMBRE 2018   ','S','N',' ',' ');



SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '860020382' and  HOPNOOBL IN ('PROVDIC2018') AND CNTVIG>= 2018;

update hosvital.hojoblprv
set hoptotdeb = 4000000		
WHERE HOPNOOBL IN ('PROVDIC2018') AND   prvcod= '860020382' and CNTVIG= 2019 and cntcod= '23357501' and  hoptotdeb =828604.00	
;

--------------------------------------
--------------------------------------

-- Se busca en la contabilidad el registro que no subio a cuentas x pagar

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CA' AND MVCNRO  IN (5714) and mvcnat='D';


select * from hosvital.movcxp;


create table  hosvital.porpagar  (EMPCOD  CHARACTER(2),DOCCOD CHARACTER(3),MCDPTO character(9),MVCXPNRO DECIMAL(15,0),MVCXPCSC decimal(5,0),CNTVIG decimal(4,0),
MVCXPFCH timestamp,MVCXPMB character(3),MVCXPTC decimal(11,2),MVCXPNUOB character(15),CNTCOD character(20),PRVCOD   character(15),MVCXPNAT character(1),MVCXPVAL decimal(17,2),	       	                    	                    MVCXPVEX decimal (17,2),CNUCOD character(3),CNUSUB character(3),CNCCOD character(9),CNTSUB character(9),MVCXPCNC character(100),MVCXPACT character(1),
MVCXPTER character(1),FLJCAJCOD character(4),FLJCAJCON character(4));
	           	                    	                    
Admisiones ingresos  x Ingresos;

select * from  hosvital.porpagar;
delete  from hosvital.porpagar;

-- Se inserta en la movcxp el registro que no esta

insert into hosvital.porpagar (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-01-04 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='CA' and mvcnro = 5714 and mvcnat='D';

 -- INSERT INTO  HOSVITAL.MOVCXP VALUES ('01','CA','001',5714,4,2019,'2019-01-04 00:00:00','PES',1.00,'PROVDIC2018','23357501','800153993','D',746408.00,0.00,' ',' ',' ',' ','PLAN CLARO EMPRESARIAL 22 NOV 2018 A DIC 3300 TD    ','S','N',' ',' ');

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '800153993' and  HOPNOOBL IN ('PROVDIC2018') AND CNTVIG>= 2018;

-- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb = 746408.00				
WHERE HOPNOOBL IN ('PROVDIC2018') AND   prvcod= '800153993' and CNTVIG= 2019 and cntcod= '23357501' and  hoptotdeb =0	;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Plantilla:

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2773) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='FB-68130'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2773)  ; -- and mvcnat='D';




--Insert
 -- select * from hosvital.PORPAGAR where doccod='NCP' AND MVCXPNRO= 2773;

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-19 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2773 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB-68130') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   1052062				
WHERE HOPNOOBL IN ('FB-68130') AND   prvcod= '805026666' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;

-----------------------  BIEN DESDE AQUIP -----------------------
--------------------------------------------------------------------

-- Segunda


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2774) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='FB-68131'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2774)  ; -- and mvcnat='D';




--Insert


insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-19 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2774 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB-68131') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   839177				
WHERE HOPNOOBL IN ('FB-68131') AND   prvcod= '805026666' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;



-- Tercera


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2775) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='FB-68132'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2775)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-19 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2775 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB-68132') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   538407.00					
WHERE HOPNOOBL IN ('FB-68132') AND   prvcod= '805026666' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;


-- Cuarta


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2777) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='FB-68135'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2777)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-19 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2777 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB-68135') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   163349.00						
WHERE HOPNOOBL IN ('FB-68135') AND   prvcod= '805026666' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;




-- Quinta


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2778) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='FB-68136'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2778)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-19 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2778 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB-68136') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   800339.00							
WHERE HOPNOOBL IN ('FB-68136') AND   prvcod= '805026666' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;



-- Sexta


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2779) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='FB-68137'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2779)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-19 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2779 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB-68137') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   829431.00								
WHERE HOPNOOBL IN ('FB-68137') AND   prvcod= '805026666' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;


-- Septima


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2780) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='FB-68138'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2780)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-19 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2780 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB-68138') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   878015.00									
WHERE HOPNOOBL IN ('FB-68138') AND   prvcod= '805026666' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;



-- Octava


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2781) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='FB-68249'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2781)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-20 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2781 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB-68249') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   538407.00									
WHERE HOPNOOBL IN ('FB-68249') AND   prvcod= '805026666' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;


-- Novena


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2768) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='B-68115'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2768)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-28 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2768 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '830023819' and  HOPNOOBL IN ('B-68115') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   228074.00										
WHERE HOPNOOBL IN ('B-68115') AND   prvcod= '830023819' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;


-- Decima


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2770) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='B-68158'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2770)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-28 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2770 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '830023819' and  HOPNOOBL IN ('B-68158') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   132818.00										
WHERE HOPNOOBL IN ('B-68158') AND   prvcod= '830023819' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;


-- UnDecima


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2769) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='B-68116'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2769)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-28 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2769 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '830023819' and  HOPNOOBL IN ('B-68116') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =   931590.00										
WHERE HOPNOOBL IN ('B-68116') AND   prvcod= '830023819' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;



-- DuoDecima


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2770) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='B-68158'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2770)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-28 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2770 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 4;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '830023819' and  HOPNOOBL IN ('B-68158') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =  132818.00											
WHERE HOPNOOBL IN ('B-68158') AND   prvcod= '830023819' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;

-- Aqui vamos

-- tRIGESIMA


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2583) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='48445'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2583)  ; -- and mvcnat='D';

--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2018-11-01 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2583 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC = 3;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '900026143' and  HOPNOOBL IN ('48445') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb = 5704013												
WHERE HOPNOOBL IN ('48445') AND   prvcod= '900026143' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =926830.00		;  -- ojoerro en la  B-68158


--DecimaCuarta


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2786) and mvcnat='D';

--Actualizo la referencia en contabilidad

UPDATE  HOSVITAL.MOVCONT2 -- estaba 3480
set  mvcdocrf1='00025237'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2786)  AND MVCCSC = 3 ; 

UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='00025238'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2786)  AND MVCCSC = 4 ; 


UPDATE  HOSVITAL.MOVCONT2 
set  mvcdocrf1='00025239'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2786)  AND MVCCSC = 5 ; 



--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-02-25 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2786 and mvcnat='D' AND CNTCOD= '22050502' AND MVCCSC  IN ( 3,4,5);

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '900361174' and  HOPNOOBL IN ('00025237') AND CNTVIG>= 2018;
SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '900361174' and  HOPNOOBL IN ('00025238') AND CNTVIG>= 2018;
SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '900361174' and  HOPNOOBL IN ('00025239') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =390000.00													
WHERE HOPNOOBL IN ('00025237') AND   prvcod= '900361174' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;

update hosvital.hojoblprv
set hoptotdeb =10335000.00													
WHERE HOPNOOBL IN ('00025238') AND   prvcod= '900361174' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;

update hosvital.hojoblprv
set hoptotdeb =19012500.00													
WHERE HOPNOOBL IN ('00025239') AND   prvcod= '900361174' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;

-------------------------------------------------
------------------------------------------------

-- Caso deL2019-0827

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CI' AND MVCNRO  IN (8) ; --  and mvcnat='C';

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2018-01-01 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='CI' and mvcnro = 8 and mvcnat='C' AND CNTCOD= '23550501' AND MVCCSC  IN ( 3);


-- Busco para actualizar el saldo
SELECT * FROM HOSVITAL.MOVCXP WHERE DOCCOD='CI' AND MVCXPNRO=8;

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '860007373' and  HOPNOOBL IN ('RETE DIC') AND CNTVIG>= 2018;


---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =390000.00													
WHERE HOPNOOBL IN ('00025237') AND   prvcod= '900361174' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0	;

INSERT INTO HOSVITAL.HOJOBLPRV (EMPCOD,PRVCOD,HOPNOOBL,MCDPTO,CNTVIG,CNTCOD,CNUCOD,CNUSUB,CNCCOD,CNTSUB,HOPFCHOBL,HOPFCHRAD,HOPTPPZ,HOPVLRCUO,HOPCUOINI,HOPVLROBL,HOPVLRMEX,HOPTOTCRE,
HOPTOTDEB,HOPMVTER,HOJFCHCAN,HOPESTAFPT,HOJNROOC,HOJBASDES,HOJDOCOC,HOPSEDCAU,HOPDOCCAU,HOPNROCAU,HOPHOM,HOJSEDOC,HOPCODCON,HOPCODCOR)
SELECT EMPCOD,PRVCOD,MVCXPNUOB,MCDPTO,2019,CNTCOD,CNUCOD,CNUSUB,CNCCOD,CNTSUB,MVCXPFCH,MVCXPFCH,1,MVCXPVAL,0.00,MVCXPVAL,0.00,MVCXPVAL,0,'N','2018-01-01','N',0,0,'','002','CI',0,'N','','',''
 FROM HOSVITAL.MOVCXP 
WHERE DOCCOD='CI' AND MVCXPNRO=8 AND MVCXPCSC=3;


MVCXPCSC

MVCXPMB
MVCXPTC
MVCXPNUOB
MVCXPNAT

MVCXPVEX
MVCXPCNC
MVCXPACT
MVCXPTER
FLJCAJCOD
FLJCAJCON
