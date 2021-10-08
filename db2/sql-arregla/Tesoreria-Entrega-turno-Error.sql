



-- Veamos los recibos de caja asociados con la entrega de runo

SELECT * FROM ABONOS  where turcod in (53476) ORDER BY ABONUM -- 23 RECIBOS DE CAJA
SELECT SUM(ABOVLR) FROM ABONOS  where turcod in (53476)  -- 193000


select * from entturn1  where turcod in (53476) -- 190300
select * from entturn  where turcod in (53476) -- 193000

aNd codpago='AE'

SELECT * FROM ABONOS  where turcod in (53476) ORDER BY ABONUM 
select * from entturn  where turcod in (53476) -- 193000  -- El Total
select * from entturn1  where turcod in (53476) -- 193000 -- DISCRIMINADO POR TIPO DE PAGO

begin transaction;
update entturn1
set EntVlrPag=190300  -- estaba 190300  /  193000
where turcod in (53476)
-- commit;
-- rollbac;

begin transaction;
update entturn1
set EntVlrPag=193000  -- estaba 190300  /  193000
where turcod in (53476)
-- commit;
-- rollbac;



SELECT * FROM ABONOS WHERE ABONUM = 674954
SELECT * FROM ABONOS1 WHERE ABONUM = 674954 order by abonum  -- Este Abono No esta en la tabla Abonos1

begin transaction;
update ABONOS
set ABOSDO= 0 -- estaba en ceros / 2700
where ABONUM =674954 -- estaba en ceros
-- commit;



SELECT a.turcod,SUM(A.ABOVLR),SUM(A.ABOSDO), SUM(a.aboapl)
FROM ABONOS A
WHERE A.TURCOD=53476 
group by A.turcod
-- EL ABONO NRO  674940


SELECT * FROM ABONOS WHERE TURCOD=53476 order by abonum


SELECT A.ABONUM,A.ABOVLR,A.AboFecRei,A.ABOSDO,B.CodPago,B.ABOValPgo
FROM ABONOS A, ABONOS1 B
WHERE A.TURCOD=53476 AND A.ABONUM=B.ABONUM
ORDER BY A.ABONUM


SELECT SUM(A.ABOVLR),SUM(A.ABOSDO)
FROM ABONOS A, ABONOS1 B
WHERE A.TURCOD=53476 AND A.ABONUM=B.ABONUM -- 190300 / 2700 -- SIN CONTAR EL ABONO NRO 674954
-- EL ABONO NRO  674940


select * from entturn1  where turcod in (53476) -- 190300
select * from entturn  where turcod in (53476) -- 193000
select abosdo,* from ABONOS where ABONUM = 674954
select * from MAEATE4 where abonum = 674954
select * from tmpfac4 where abonum = 674954

SELECT * FROM MAEATE WHERE MPCEDU = '20963686'
SELECT * FROM MAEATE4 WHERE MPNFAC = 2394162 -- SE LE APLICO EL 674955


SELECT * FROM ABONOS WHERE ABONUM = 674954

SELECT * FROM ABONOS WHERE ABONUM IN (674954,674955)
