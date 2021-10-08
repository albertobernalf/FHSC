SELECT I.MPTDOC TIPO_DOC,I.MPCEDU DOCUMENTO,M.MENOMB,C.MPNOMC PACIENTE, I.INGFECADM INGRESO,I.INGFECEGR EGRESO --,I.INGENTDX dxe1 ,I.INGSALDX dxs2,I.INGDXSAL1 dxs3, I.INGDXSAL2 dxs4, I.INGDXSAL3 dxs5 
FROM HOSVITAL.INGRESOS I INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC=I.MPTDOC AND C.MPCEDU=I.MPCEDU) 
INNER JOIN HOSVITAL.MAEEMP M ON (M.MENNIT=I.INGNIT) 
WHERE I.CLAPRO = 5 AND I.INGFECEGR >='2020-08-01 00:00:00' AND  I.INGFECEGR <='2020-08-31 00:00:00'  
 ORDER BY I.INGFECADM;

SELECT * FROM HOSVITAL.INGRESOS WHERE MPCEDU='6707276';


SELECT I.MPTDOC TIPO_DOC,I.MPCEDU DOCUMENTO,M.MENOMB,C.MPNOMC PACIENTE, I.INGFECADM INGRESO,I.INGFECEGR EGRESO 
FROM HOSVITAL.INGRESOS I
 INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC=I.MPTDOC AND C.MPCEDU=I.MPCEDU) 
INNER JOIN HOSVITAL.MAEEMP M ON (M.MENNIT=I.INGNIT) 
WHERE I.CLAPRO = 5 AND I.INGFECEGR >='2020-08-01 00:00:00' AND  I.INGFECEGR <='2020-08-31 00:00:00'   AND I.INGFECEGR < (I.INGFECADM + 6 HOURS) ;




SELECT I.MPTDOC TIPO_DOC,I.MPCEDU DOCUMENTO,M.MENOMB,C.MPNOMC PACIENTE, I.INGFECADM INGRESO,I.INGFECEGR EGRESO 
FROM HOSVITAL.INGRESOS I
 INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC=I.MPTDOC AND C.MPCEDU=I.MPCEDU) 
INNER JOIN HOSVITAL.MAEEMP M ON (M.MENNIT=I.INGNIT) 
WHERE I.CLAPRO = 5 AND I.INGFECEGR >='2020-08-01 00:00:00' AND  I.INGFECEGR <='2020-08-31 00:00:00'   AND I.INGFECEGR BETWEEN (I.INGFECADM + 6 HOURS) AND (I.INGFECADM + 12 HOURS) ;



SELECT I.MPTDOC TIPO_DOC,I.MPCEDU DOCUMENTO,M.MENOMB,C.MPNOMC PACIENTE, I.INGFECADM INGRESO,I.INGFECEGR EGRESO 
FROM HOSVITAL.INGRESOS I
 INNER JOIN HOSVITAL.CAPBAS C ON (C.MPTDOC=I.MPTDOC AND C.MPCEDU=I.MPCEDU) 
INNER JOIN HOSVITAL.MAEEMP M ON (M.MENNIT=I.INGNIT) 
WHERE I.CLAPRO = 5 AND I.INGFECEGR >='2020-08-01 00:00:00' AND  I.INGFECEGR <='2020-08-31 00:00:00'   AND I.INGFECEGR BETWEEN (I.INGFECADM + 12 HOURS) AND (I.INGFECADM + 24 HOURS) ;
