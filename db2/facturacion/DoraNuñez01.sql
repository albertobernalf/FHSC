/*
Atentamente solicito de su valiosa colaboración generando reporte de que contratos a que empresas a la fecha se encuentran activos 
y a su vez que vigencia tienen,
 adicionalmente que traiga el portafolio de suministros e insumos al cual este se encuentra ligado
*/

SELECT * FROM HOSVITAL.EMPRESS;
SELECT * FROM HOSVITAL.MAEEMP;
SELECT * FROM HOSVITAL.MAEEMP1;
SELECT * FROM HOSVITAL.MAEEMP31;-- ORTA PROCE
SELECT * FROM HOSVITAL.MAEEMP32; --  VIGENCIAS SUMINISTROS - PSCODI.MENNIT
SELECT * FROM HOSVITAL.MAEEMP33; 
SELECT * FROM HOSVITAL.PORTARSU;
SELECT * FROM HOSVITAL.MAECTOS  WHERE MENNIT='126';
SELECT * FROM HOSVITAL.MAECTOS  WHERE MENNIT='12';


SELECT * FROM HOSVITAL.MAEEMP32 WHERE MENNIT='12';

SELECT E.MECNTR NIT, E.EMPDSC  EMPRESA, M.MENNIT, M.MENOMB CONTRATO, CTOS.MECFCHA1 VIGENCIA_CONTRATO, SU.PSDESC PORTAFOLIO_SUMINISTROS
FROM HOSVITAL.EMPRESS E
INNER JOIN HOSVITAL.MAEEMP M ON (M.MECNTR=E.MECNTR AND M.MEESTADO=0)
INNER JOIN HOSVITAL.MAECTOS CTOS ON (CTOS.MENNIT=M.MENNIT)
INNER JOIN HOSVITAL.MAEEMP32 M32 ON (M32.MENNIT=M.MENNIT )
INNER JOIN HOSVITAL.PORTARSU SU ON (SU.PSCODI = M32.PSCODI AND SU.PSEST='S')
WHERE M32.MEPSVIG = (SELECT MAX(M322.MEPSVIG) FROM HOSVITAL.MAEEMP32 M322 WHERE M322.MENNIT=M32.MENNIT)  AND
             CTOS.MECFCHA1  = (SELECT MAX(CTOS1.MECFCHA1 ) FROM HOSVITAL.MAECTOS CTOS1 WHERE CTOS1.MENNIT=CTOS.MENNIT) 
ORDER BY  E.MECNTR, E.EMPDSC;

SELECT E.MECNTR NIT, E.EMPDSC  EMPRESA, M.MENNIT, M.MENOMB CONTRATO, CTOS.MECFCHA1 VIGENCIA_CONTRATO, SU.PSDESC PORTAFOLIO_SUMINISTROS
FROM HOSVITAL.EMPRESS E
INNER JOIN HOSVITAL.MAEEMP M ON (M.MECNTR=E.MECNTR AND M.MEESTADO=0)
INNER JOIN HOSVITAL.MAECTOS CTOS ON (CTOS.MENNIT=M.MENNIT)
INNER JOIN HOSVITAL.MAEEMP32 M32 ON (M32.MENNIT=M.MENNIT )
INNER JOIN HOSVITAL.PORTARSU SU ON (SU.PSCODI = M32.PSCODI AND SU.PSEST='S')
WHERE M32.MEPSVIG = (SELECT MAX(M322.MEPSVIG) FROM HOSVITAL.MAEEMP32 M322 WHERE M322.MENNIT=M32.MENNIT AND M322.MTUCO1 = M32.MTUCO1)  AND
             CTOS.MECFCHA1  = (SELECT MAX(CTOS1.MECFCHA1 ) FROM HOSVITAL.MAECTOS CTOS1 WHERE CTOS1.MENNIT=CTOS.MENNIT) 
ORDER BY  E.MECNTR, E.EMPDSC;

