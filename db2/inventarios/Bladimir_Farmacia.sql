/*
Se solicita informe de todos los movimientos de inventarios con los siguientes �tems.
c�digo consecutivo, consecutivo, fecha movimiento, c�digo suministro, tipo de movimiento (entrada, salida, traslado), bodega de entrada, bodega de salida, cantidad, valor unitario, valor total, transacci�n usada para el movimiento.

Si es posible el estado de contabilizaci�n del movimiento.

El informe debe ser realizado para poder filtrar por mes y a�o de movimiento.

*/
SELECT * FROM HOSVITAL.DOCUCON WHERE DOCCOD='ASA';

SELECT * FROM HOSVITAL.KARDEX1;
SELECT * FROM HOSVITAL.TRANINV;
SELECT * FROM HOSVITAL.BODEGAS;
SELECT * FROM HOSVITAL.MOVINV4;
SELECT * FROM HOSVITAL.MOVINV3;
SELECT * FROM HOSVITAL.MOVCONT3;


SELECT K.DOCTIP AS TIPO_DOC,K.DOCNRO AS CONSECUTIVO, K.MSRESO AS COD_MED, M.MSNOMG AS MEDICAMENTO,K.MOVES AS TIPO_MOV,K.BODEGA AS BODEGA_SALIDA,B.BODDESC AS BODEGASAL,K.MOVBOD AS BODEGA_ENTRADA,B1.BODDESC AS BODEGAENT, K.MOVCNT AS CANTIDAD, K.MOVVLU AS VALOR_UNITARIO, K.MOVVLT AS VALOR_TOTAL, K.TRANCOD AS TRANSACCION, T.TRANDSC AS DESCRIPCION,
(SELECT CASE WHEN INV.DOCEST='C' then 'Contabilizado'  WHEN INV.DOCEST='A' then 'Anulado'  WHEN INV.DOCEST='N' then 'Activa'  WHEN INV.DOCEST='R' then 'Reversion Por Anulacio' END	
 FROM HOSVITAL.MOVINV3 INV
 WHERE INV.EMPCOD= K.EMPCOD AND INV.DOCCOD= K.DOCTIP AND INV.DOCNRO= K.DOCNRO)
 ESTADO_DOCUMENTO
FROM HOSVITAL.KARDEX1 K
INNER JOIN HOSVITAL.MAESUM1 M ON (M.MSRESO=K.MSRESO)
INNER JOIN HOSVITAL.TRANINV T ON (T.EMPCOD='01' AND T.TRANCOD= K.TRANCOD)
INNER JOIN HOSVITAL.BODEGAS  B ON (B.BODEGA = K.BODEGA)
INNER JOIN HOSVITAL.BODEGAS  B1 ON (B1.BODEGA = K.MOVBOD)
WHERE K.EMPCOD='01' AND K.MOVFCH >= '2021-06-01 00:00:00' AND K.MOVFCH <= '2021-06-30 00:00:00'
ORDER BY K.MOVFCH ;
