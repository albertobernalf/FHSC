
SELECT * FROM HOSVIPRU.TIPDOC;
SELECT * FROM HOSVIPRU.GN_HOMC2;

SELECT *  FROM HOSVIPRU.GN_HOMC2 WHERE HOM_VALO IN (SELECT TIPCODDOC FROM HOSVIPRU.TIPDOC);

SELECT * FROM HOSVIPRU.TIPDOCASI;

SELECT *  FROM HOSVIPRU.GN_HOMC2 WHERE HOM_VALH IN (SELECT MPTDOC FROM HOSVIPRU.TIPDOCASI);


-- Query para ver la tabla RESSEV

SELECT * FROM HOSVIPRU.RESSEV WHERE RESFEC >= '2019-12-01 00:00:00' and restip='FC';

-- Query para ver Facturacion

select * from hosvipru.maeate where facfch>= '2019-12-01';


--  Estas facturas No han pasado por error

SELECT * FROM HOSVIPRU.RESSEV WHERE RESFEC >= '2019-12-01 00:00:00' and restip='FC' and resxmlres like('%false%');


--- Query para arreglar datos para REENVIO

UPDATE  HOSVIPRU.RESSEV
SET RESRET='1'
WHERE RESFEC >= '2019-12-01 00:00:00' and restip='FC' AND RESNUM in (12);

-- facturas para ser reenviadas:

SELECT * FROM HOSVIPRU.RESSEV WHERE RESFEC >= '2019-12-01 00:00:00' and restip='FC' and RESRET='1';

--Facturas que han pasado a Transfiriendo :

SELECT empcod,restip,resnum,resfec,resret FROM HOSVIPRU.RESSEV WHERE RESFEC >= '2019-12-01 00:00:00' and restip='FC' and resxmlres like('%true%');

select * from hosvipru.tmpfac where tffchi>='2019-10-20' and tfmeni ='CS0101' ;
