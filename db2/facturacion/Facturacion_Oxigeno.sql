select * from hosvital.maepro where prnomb like ('%LIQUIDO%');
select * from hosvital.maepro where prnomb like ('%OXIGE%');
SELECT * FROM HOSVITAL.MAEATE2;

SELECT M.MPNFAC FACTURA, CAP.MPTDOC TIPO_DOC, CAP.MPCEDU DOCUMENTO, CAP.MPNOMC PACIENTE, M2.PRCODI CODIGO, MAEPRO.PRNOMB PROCEDIMIENTO,M2.MACANPR CANTIDAD, M2.MAVATP VALOR_TTAL
FROM HOSVITAL.MAEATE M
INNER JOIN HOSVITAL.MAEATE2 M2 ON (M2.MPNFAC= M.MPNFAC AND M2.MAESANUP<> 'S' AND M2.FCPTPOTRN='F')
INNER JOIN HOSVITAL.MAEPRO MAEPRO ON (MAEPRO.PRCODI=M2.PRCODI AND (MAEPRO.PRNOMB LIKE ('%LIQUIDO%') OR MAEPRO.PRNOMB LIKE   ('%OXIGE%')))
INNER JOIN HOSVITAL.CAPBAS CAP ON (CAP.MPTDOC= M.MPTDOC AND CAP.MPCEDU= M.MPCEDU)
WHERE M.FACFCH>= '2021-01-01'
ORDER BY M.MPNFAC