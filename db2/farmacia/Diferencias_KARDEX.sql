--DIFERENCIA KARDEX VS LOTES



SELECT k.EMPCOD, k.BODEGA, k.MSRESO, k.MovSUni, Sum(L.LoteSalUnd) AS L , (MovSUni- (Sum(L.LoteSalUnd))) DIFERENCIA
FROM HOSVITAL.KARDEX k 
INNER JOIN HOSVITAL.LOTESUM L ON (k.BODEGA = L.BODEGA) AND (k.MSRESO = L.MSRESO) AND (k.EMPCOD = L.EMPCOD)
INNER JOIN HOSVITAL.MAESUM1 M ON M.MSRESO = K.MSRESO AND M.MSRESO = L.MSRESO AND M.MsCtrlLot ='S'
where K.BODEGA >='00'
GROUP BY k.EMPCOD, k.BODEGA, k.MSRESO, k.MovSUni
ORDER BY 6 DESC;

--DIFERENCIA KAREDEX VS LOTESUM1
SELECT k.EMPCOD, k.BODEGA, k.MSRESO, k.MovSUni, Sum(L1.LotSalUni) AS SumaDeLotSalUni, (MovSUni)-Sum(L1.LotSalUni) AS DIF
FROM HOSVITAL.KARDEX K 
LEFT JOIN HOSVITAL.LOTESUM1 L1 ON (k.MSRESO = L1.MSRESO) AND (k.BODEGA = L1.BODEGA) AND (k.EMPCOD = L1.EMPCOD)
INNER JOIN HOSVITAL.MAESUM1 M ON M.MSRESO = K.MSRESO AND M.MSRESO = L1.MSRESO AND M.MsCtrlLot ='S'
where K.BODEGA >='00'
GROUP BY k.EMPCOD, k.BODEGA, k.MSRESO, k.MovSUni
ORDER BY 6 DESC;

--DIFERENCIA LORESUM VS LOTESUM1

SELECT L.EMPCOD, L.MSRESO, L.BODEGA, L.LoteCod, L.PrvCod, L.LoteSalUnd, L1.LotSalUni, (LoteSalUnd)-(LotSalUni) AS DIF
FROM HOSVITAL.LOTESUM L 
LEFT JOIN HOSVITAL. LOTESUM1 L1 ON (L.PrvCod = L1.PrvCod) AND (L.LoteCod = L1.LoteCod) AND (L.BODEGA = L1.BODEGA) AND (L.MSRESO = L1.MSRESO) AND (L.EMPCOD = L1.EMPCOD)
INNER JOIN HOSVITAL.MAESUM1 M ON M.MSRESO = L.MSRESO AND M.MSRESO = L1.MSRESO AND M.MsCtrlLot ='S'  AND (LoteSalUnd)-(LotSalUni)	 <>0
GROUP BY L.EMPCOD, L.MSRESO, L.BODEGA, L.LoteCod, L.PrvCod, L.LoteSalUnd, L1.LotSalUni
ORDER BY 8 DESC;


-- No existe el registro en la tabla LOTESUM pero si esta en la tabla LOTESUM1

SELECT * FROM HOSVITAL.LOTESUM WHERE BODEGA='74' AND MSRESO='0078MQ080' ; -- AND LOTECOD='002-17' ';

SELECT * FROM HOSVITAL.LOTESUM1 WHERE BODEGA='74' AND MSRESO='0078MQ08'  AND LOTECOD='002-17 ';