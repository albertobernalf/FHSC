SELECT  * FROM HOSVITAL.MAEATE ;
SELECT  * FROM HOSVITAL.INGRESOS ;
SELECT  * FROM HOSVITAL.MAEEMP; --

SELECT * FROM HOSVITAL.EMPRESS;
SELECT * FROM HOSVITAL.

SELECT M.MPNFAC,E.EMPDSC,M.MAESTF AS ESTADO,M.MATOTF
FROM HOSVITAL.MAEATE  M 
INNER JOIN HOSVITAL.MAEEMP EMP ON (EMP.MENNIT= M.MPMENI)
INNER JOIN HOSVITAL.EMPRESS E ON (E.MECNTR = EMP.MECNTR)
WHERE M.MATIPDOC='2' AND M.FACFCH >='2019-09-01' AND M.FACFCH <='2019-09-30';

SELECT  I.MPTDOC, I.MPCEDU,I.INGCSC
FROM HOSVITAL.INGRESOS I
WHERE I.INGFECADM>='2019-09-01 00:00:00'AND I.INGFECADM <='2019-09-30 23:59:59' AND I.INGFECEGR <> '0001-01-01 00:00:00.000000' AND (I.MPTDOC,I.MPCEDU,I.INGCSC) NOT IN (SELECT M.MPTDOC,M.MPCEDU,M.MACTVING FROM HOSVITAL.MAEATE M);
