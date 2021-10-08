


--  TODAS LAS CUENTAS

select TRCCOD, CNTCOD, MVCNAT, SUM(mvcbse) BASE, SUM(MVCVLR) VALOR
 from hosvital.movcont2  M2 
where m2.empcod='01' and m2.mvcanio=2020 and   m2.trccod='830014193'  AND MVCIMPCOD <> '' and  (m2.DOCCOD, m2.MVCNRO ) IN (SELECT m3.DOCCOD, m3.MVCNRO FROM HOSVITAL.MOVCONT3  m3 WHERE m3.doccod=m2.doccod and m3.mvcnro=m2.mvcnro and  m3.mvcest !='N')
GROUP BY TRCCOD,CNTCOD,  MVCNAT
ORDER BY CNTCOD ;

-- TABLAS D BLANCE

SELECT * FROM HOSVITAL.RESMCUE  WHERE RSMANO=2020 AND RSMMES>=12  AND TRCCOD='900136603'  AND RSMCTNCON='23654004';

--  OTRO CODIGO

select TRCCOD, MVCNAT, SUM(mvcbse) BASE, SUM(MVCVLR) VALOR
 from hosvital.movcont2  M2 
where m2.empcod='01' and m2.mvcanio=2020 and   m2.trccod='901357140' AND  CNTCOD='23654004' AND MVCIMPCOD <> '' and  (m2.DOCCOD, m2.MVCNRO ) IN (SELECT m3.DOCCOD, m3.MVCNRO FROM HOSVITAL.MOVCONT3  m3 WHERE m3.doccod=m2.doccod and m3.mvcnro=m2.mvcnro and  m3.mvcest !='N')
GROUP BY TRCCOD,  MVCNAT ;


-- Query con impueto

--  Query Totales por IMPUESTO

select TRCCOD, MVCIMPCOD,cntcod,MVCNAT, SUM(mvcbse) BASE, SUM(MVCVLR) VALOR
 from hosvital.movcont2  M2 
where m2.empcod='01' and m2.mvcanio=2020 and   m2.trccod='830014193'  AND MVCIMPCOD <> '' and  (m2.DOCCOD, m2.MVCNRO ) IN (SELECT m3.DOCCOD, m3.MVCNRO FROM HOSVITAL.MOVCONT3  m3 WHERE m3.doccod=m2.doccod and m3.mvcnro=m2.mvcnro and  m3.mvcest !='N')   and MVCIMPCOD='RETENCIO'
GROUP BY TRCCOD, MVCIMPCOD,cntcod,MVCNAT ;


-- Query Detalle un impuesto y cuenta


select *
 from hosvital.movcont2  M2 
where m2.empcod='01' and m2.mvcanio=2020 and   m2.trccod='830014193'  AND MVCIMPCOD <> '' and  (m2.DOCCOD, m2.MVCNRO ) IN (SELECT m3.DOCCOD, m3.MVCNRO FROM HOSVITAL.MOVCONT3  m3 WHERE m3.doccod=m2.doccod and m3.mvcnro=m2.mvcnro and  m3.mvcest !='N')   and MVCIMPCOD='RETENCIO'
ORDER BY TRCCOD, MVCIMPCOD, cntcod;

-- Query Totales TODOS los impuetso y cuenta


select TRCCOD,MVCIMPCOD, cntcod,MVCNAT, SUM(mvcbse) BASE, SUM(MVCVLR) VALOR
 from hosvital.movcont2  M2 
where m2.empcod='01' and m2.mvcanio=2020 and   m2.trccod='830014193'  AND MVCIMPCOD <> '' and  (m2.DOCCOD, m2.MVCNRO ) IN (SELECT m3.DOCCOD, m3.MVCNRO FROM HOSVITAL.MOVCONT3  m3 WHERE m3.doccod=m2.doccod and m3.mvcnro=m2.mvcnro and  m3.mvcest !='N')  --  and MVCIMPCOD='RETENCIO'
GROUP BY TRCCOD, MVCIMPCOD, cntcod,MVCNAT 
ORDER BY TRCCOD, MVCIMPCOD, cntcod;

-- Movimiento impuestos - cuenta

select MVCNAT,SUM(mvcbse) BASE, SUM(MVCVLR)
 from hosvital.movcont2 m2
where m2.empcod='01' and mvcanio=2020 and trccod='830014193' and  cntcod ='23652502' and mvcimpcod = 'RETENCIO' and  (m2.DOCCOD, m2.MVCNRO ) IN (SELECT m3.DOCCOD, m3.MVCNRO FROM HOSVITAL.MOVCONT3  m3 WHERE m3.doccod=m2.doccod and m3.mvcnro=m2.mvcnro and  m3.mvcest !='N')  
GROUP BY MVCNAT;