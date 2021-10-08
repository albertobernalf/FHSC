
-- terumo

select * from hosvital.movcxp where doccod='CA' and mvcxpnro= 6679;  --  tiene que ir cero y ajustart el saldo x que en contab esta en cero	
select * from hosvital.movcont2 where doccod='CA' and mvcnro = 6679;  -- tien otro tercero   900361174 

update 	  hosvital.movcxp  -- estaba en 346250.00
set mvcxpval = 0
where doccod='CA' and mvcxpnro= 6679 and  mvcxpval= -346250.00	 and  prvcod= '900361174' and mvcxpnuob ='00025930 ';

select * from hosvital.hojoblprv 
where cntvig=2019 and prvcod='900361174' and hopnoobl= '00025930';

update hosvital.hojoblprv        -- estaba 13157500.00	
set hoptotcre =13503750	
WHERE HOPNOOBL IN ('00025930') AND   prvcod= '900361174' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotcre =12811250.00		;	

-- Porvenir  SUBIR CNS 677 EL DEBITO Y AJUSTAR SALDO TERCERO  800224808      	 
  -- Y REF  NOM.JUNIO18    	


	 
select * from hosvital.movcxp where doccod='ACP' and mvcxpnro= 1745 AND MVCXPNUOB = 'NOM.JUNIO18' AND MVCXPVAL= 3125 ; 	


select * from hosvital.movcont2 where doccod='ACP' and mvcnro = 1745 AND MVCDOCRF1= 'NOM.JUNIO18' AND MVCVLR = 3125.00	 ; 

select * from hosvital.movcont2 where doccod='ACP' and mvcnro = 1745  AND MVCVLR = 3125.00	 AND CNTCOD='23700501' ;
 

select * from hosvital.movcont2 where doccod='CNS' and mvcnro = 677  AND MVCVLR = 3125.00	 ;  -- sUBIR ELCNS select * from hosvital.movcont2 where doccod='ACP' and mvcnro = 1745  AND MVCVLR = 3125.00	 ;  DEBITO


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3er CASO
-- nIT 830009783

select * from hosvital.movcont2 where doccod='CNS' and mvcnro = 858 AND TRCCOD= '830009783';     -- SUBIR EL DEBITO NOM.ABRIL19      , Y VALOR 	 1104.00	 DEBITO  CTA :23701001            	





-- tRIGESIMA


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CNS' AND MVCNRO  IN (858) and mvcnat='D' AND TRCCOD= '830009783';


--Insert

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-04-29 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='CNS' and mvcnro = 858 and mvcnat='D' AND CNTCOD= '23701001' AND MVCCSC = 11 AND TRCCOD= '830009783' ;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '830009783' and  HOPNOOBL IN ('NOM.ABRIL19') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb = hoptotdeb + 1104												
WHERE HOPNOOBL IN ('NOM.ABRIL19') AND   prvcod= '830009783' and CNTVIG= 2019 and cntcod= '23701001' and  hoptotdeb =3288700.00			;  -- ojoerro en la  B-68158



-- fin trigesima






--------------------------------------------------------
-- 7 caso  ya esta rersuelto

-- ESTAS DOS CUENTAS DEBEN SER N/A VIGENCIA 20|19 ESTA CXP

-- 4 CASO  ya esta resuelto
-- 860007336


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CEG' AND MVCNRO  IN (29960) and mvcvlr = 81400;  --  and trccod = ' ';

select * from hosvital.movcxp where mvcxpnuob = 'PENS.NOV18' and prvcod='860007336' ;
 
-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '860007336' and  HOPNOOBL IN ('PENS.NOV18') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotcre = 81400												
WHERE HOPNOOBL IN ('PENS.NOV18') AND   prvcod= '860007336' and CNTVIG= 2018 and cntcod= '23702501' and  hoptotdeb =162800.00			;  -- ojoerro en la  B-68158


----------------  --CasoNo 5  TAREA POR RESOLVER

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='ACP' AND MVCNRO  IN (1854,1856) ;  -- and mvcvlr = 5100;  
 --subir a movcxp el ACP 1856 la obligaciobn  CAJA DIC 2017  	 debito x 5100.00	 --actualizar el saldo


insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-03-01 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='ACP' and mvcnro = 1856  and mvcnat='D' AND CNTCOD= '23809001' AND MVCCSC = 1 AND TRCCOD= '80851086' ;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '80851086' and  HOPNOOBL IN ('CAJA DIC 2017') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb = 5046776.00	-- estaba 5041676.00											
WHERE HOPNOOBL IN ('CAJA DIC 2017') AND   prvcod= '80851086' and CNTVIG= 2019 and cntcod= '23809001' and  hoptotdeb =5041676.00; 


-- CaspNo 6

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CNS' AND MVCNRO  IN (774) and cntcod like ('25%');
SELECT   * FROM  HOSVITAL.MOVCXP WHERE  DOCCOD='CNS' AND MVCXPNRO  IN (774);

UPDATE HOSVITAL.MOVCXP
SET   MVCXPMB='PES'
 WHERE  DOCCOD='CNS' AND MVCXPNRO  IN (774) AND MVCXPNUOB='VAC2018';

  --  a)
/*
SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CNS' AND MVCNRO  IN (774) and cntcod like ('25%');
SELECT   *FROM  HOSVITAL.MOVCXP WHERE  DOCCOD='CNS' AND MVCXPNRO  IN (774);

-- Tarea
-- subir todos los debitos de este docuemto de la cuenta  like  like ('25%');
-- yb actuakliza el saldo de cada obligacion
--OJOOOO
-- Ojo la credito no
--OJOOOOO
*/
----------------------------------------------------------

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-01-14 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='CNS' and mvcnro = 774  and mvcnat='D' AND CNTCOD= '25150501' AND MVCCSC =8  AND TRCCOD= '79558464' ;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '79558464' and  HOPNOOBL IN ('INT.CES2018') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =243733.56													
WHERE HOPNOOBL IN ('INT.CES2018') AND   prvcod= '79558464' and CNTVIG= 2019 and cntcod= '25150501' and  hoptotdeb =0; 


-------------------------------------------------------------




--   b)

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CNS' AND MVCNRO  IN (775) and cntcod like ('25%');

/*
igual que el anteriro excepto el CRERDITO
-- subir a movcxp
-- actualizar obligaciones
-- son solo una cuenta contable  25250501            	

*/
----------------------------------------------------------

insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-01-14 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='CNS' and mvcnro = 775  and mvcnat='D' AND CNTCOD= '25250501' AND MVCCSC =2  AND TRCCOD= '79830762' ;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '79830762' and  HOPNOOBL IN ('VAC2018') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =hoptotdeb +  8432364.02												
WHERE HOPNOOBL IN ('VAC2018') AND   prvcod= '79830762' and CNTVIG= 2019 and cntcod= '25250501' and  hoptotdeb =0; 


-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------


-- Casos del dia Junio 12 DEL 2019

-- Punto Nro 3


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='CEG' AND MVCNRO  IN (29960) AND MVCVLR= 81400;   -- and cntcod like ('25%');
SELECT   *FROM  HOSVITAL.MOVCXP WHERE  DOCCOD='CEG' AND MVCXPNRO  IN (29960) AND MVCXPCSC = 16;

UPDATE HOSVITAL.MOVCXP SET MVCXPNUOB = 'PENS.OCT18'  WHERE  DOCCOD='CEG' AND MVCXPNRO  IN (29960) AND MVCXPCSC = 16; -- ESTABA PENS.NOV18     	


insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2018-11-27 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='CEG' and mvcnro = 29960  AND  MVCCSC =16  AND TRCCOD= '860007336' ;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '860007336' and  HOPNOOBL IN ('PENS.OCT18') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =162800												
WHERE HOPNOOBL IN ('PENS.OCT18') AND   prvcod= '860007336' and CNTVIG= 2019 and cntcod= '23702501' and  hoptotdeb =81400; 



-- Punto Nro 2
--No seconocen cuales cuentas contables afectan.
-- No existe la obligacion NOM.JUN18
-- A cuales registros se lesdebe colocar la obligacion y a cualesNOp


SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='ACP' AND MVCNRO  IN (1745) AND MVCVLR = 49752 ;   -- and cntcod like ('25%');
SELECT   *FROM  HOSVITAL.MOVCXP WHERE  DOCCOD='ACP' AND MVCXPNRO  IN (1745) AND  MVCXPVAL= 49752 ;

UPDATE  HOSVITAL.MOVCXP SET  MVCXPNUOB = 'NOM.JUNIO18' WHERE  DOCCOD='ACP' AND MVCXPNRO  IN (1745) AND  MVCXPVAL= 49752 AND MVCXPNUOB='NOM.JUNIO';


insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2018-11-27 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='CEG' and mvcnro = 29960  AND  MVCCSC =16  AND TRCCOD= '860007336' ;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '860000648' and  HOPNOOBL IN ('NOM.JUNIO18') AND CNTVIG>= 2018;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =49752.00													
WHERE HOPNOOBL IN ('NOM.JUNIO18') AND   prvcod= '860000648' and CNTVIG= 2019 and cntcod= '23701001' and  hoptotdeb =00; 



-- Punto Nro 1
-- Como se organiza -- Como se crea

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2638)   ; -- AND MVCCSC= 4  ;   -- and cntcod like ('25%');

SELECT   *FROM  HOSVITAL.MOVCXP WHERE  DOCCOD='NCP' AND MVCXPNRO  IN (2638) ;   -- AND  MVCXPVAL= 49752 ;


insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2018-11-30 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2638  AND  MVCCSC =4  AND TRCCOD= '805026666' AND MVCNAT='D' ;

-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB67387') AND CNTVIG>= 2018;
SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '830023819' and  HOPNOOBL IN ('B67387') AND CNTVIG= 2019;

INSERT INTO
HOSVITAL.HOJOBLPRV
SELECT EMPCOD,'805026666','FB67387',MCDPTO,CNTVIG,CNTCOD,'','','','','2018-11-30 00:00:00','2018-11-30 00:00:00',60,55883,0,55883,0,0,55883,'N','0001-01-01','N',0,55883,'','001','',0,'N','001','',''
FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '830023819' and  HOPNOOBL IN ('B67387') AND CNTVIG= 2019;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =162800												
WHERE HOPNOOBL IN ('PENS.OCT18') AND   prvcod= '860007336' and CNTVIG= 2019 and cntcod= '23702501' and  hoptotdeb =81400; 


------------------------------------------------
------------------------------------------------
-- Caso 20191016
------------------------------------------------
------------------------------------------------

-- Como se organiza -- Como se crea

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (2976)   ; -- AND MVCCSC= 4  ;   -- and cntcod like ('22%');

update HOSVITAL.MOVCONT2 
set mvcdocrf1= 'FB 72286'
WHERE DOCCOD='NCP' AND MVCNRO  IN (2976) and MVCCSC= 4;

SELECT   * FROM  HOSVITAL.MOVCXP WHERE  DOCCOD='NCP' AND MVCXPNRO  IN (2976) ;   -- AND  MVCXPVAL= 49752 ;


insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-08-12 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 2976  AND  MVCCSC =4  AND TRCCOD= '805026666' AND MVCNAT='D' ;

update hosvital.movcxp
set mvcxpnuob='FB 72286'
where doccod='NCP' and mvcxpnro = 2976 and mvcxpcsc=4;


-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB 72286') AND CNTVIG>= 2019;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =hoptotdeb + 	497820											
WHERE HOPNOOBL IN ('FB 72286') AND   prvcod= '805026666' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0; 


------------------------------------
---------------------------------------
-- Segundo caso delmismo dia
---------------------------------------

-- Como se organiza -- Como se crea

SELECT * FROM HOSVITAL.MOVCONT2 WHERE DOCCOD='NCP' AND MVCNRO  IN (3013 )   ; -- AND MVCCSC= 4  ;   -- and cntcod like ('22%');

update HOSVITAL.MOVCONT2 
set mvcdocrf1= 'FB 73297'
WHERE DOCCOD='NCP' AND MVCNRO  IN (3013) and MVCCSC= 4;

SELECT   * FROM  HOSVITAL.MOVCXP WHERE  DOCCOD='NCP' AND MVCXPNRO  IN (3013) ;   -- AND  MVCXPVAL= 49752 ;


insert into hosvital.movcxp (EMPCOD,DOCCOD,MCDPTO,MVCXPNRO,MVCXPCSC,CNTVIG,MVCXPFCH,MVCXPMB,MVCXPTC,MVCXPNUOB,CNTCOD,PRVCOD,MVCXPNAT,MVCXPVAL,MVCXPVEX,CNUCOD,CNUSUB,
CNCCOD,CNTSUB,MVCXPCNC,MVCXPACT,MVCXPTER,FLJCAJCOD,FLJCAJCON
)
select empcod, doccod,mcdpto,mvcnro,mvccsc,cntvig, '2019-09-09 00:00:01' ,' PE',1.00, mvcdocrf1,cntcod,trccod,mvcnat,mvcvlr,0.00,' ', ' ', ' ',' ', mvcdet,'S','N',' ',' '
from hosvital.movcont2
where doccod='NCP' and mvcnro = 3013  AND  MVCCSC =4  AND TRCCOD= '805026666' AND MVCNAT='D' ;

update hosvital.movcxp
set mvcxpnuob='FB 73297'
where doccod='NCP' and mvcxpnro = 3013 and mvcxpcsc=4;


-- Busco para actualizar el saldo

SELECT * FROM HOSVITAL.HOJOBLPRV WHERE prvcod= '805026666' and  HOPNOOBL IN ('FB 73297') AND CNTVIG>= 2019;

---- Actualiza el saldo

update hosvital.hojoblprv
set hoptotdeb =hoptotdeb + 	499407											
WHERE HOPNOOBL IN ('FB 73297') AND   prvcod= '805026666' and CNTVIG= 2019 and cntcod= '22050502' and  hoptotdeb =0; 




