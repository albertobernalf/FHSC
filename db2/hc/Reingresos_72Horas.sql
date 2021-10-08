select i.mptdoc,i.mpcedu,cap.mpnomc,i.ingcsc,i.ingfecadm,year(i.ingfecadm),month(i.ingfecadm)
from hosvital.ingresos i
inner join hosvital.capbas cap on (cap.mptdoc=i.mptdoc and cap.mpcedu=i.mpcedu)
where i.ingfecadm >= '2019-09-01 00:00:00'  and (year(i.ingfecadm)||month(i.ingfecadm)) = (select (year(i2.ingfecadm)||month(i2.ingfecadm))  from hosvital.ingresos i2
					                    where i2.mptdoc=i.mptdoc and i2.mpcedu=i.mpcedu and i2.ingcsc <> i.ingcsc and  (year(i2.ingfecadm)||month(i2.ingfecadm) ) <= 									(year(i.ingfecadm)||month(i.ingfecadm) + 3) and   (year(i2.ingfecadm)||month(i2.ingfecadm)) > (year(i.ingfecadm)||month(i.ingfecadm))   )
order by  i.mptdoc,i.mpcedu,cap.mpnomc,i.ingcsc;


SELECT T1.INGFECADM AS INGRESO,T4.MPNOMP AS SERVICIO, T1.MPTDOC AS TIPODOC,T1.MPCEDU AS DOCUMENTO,T2.MPNOM1 AS NOMBRE,T2.MPNOM2 AS NOMBRE2,T2.MPAPE1 AS PRIMER_APELLIDO,T2.MPAPE2 AS SEGUNDO_APELLIDO,T2.MPFCHN AS NACIO,T2.MPSEXO AS SEXO,T2.MPDIRE AS DIRECCION,T2.MPTELE AS TELEFONO,T6.HISCLTR AS TRIAGE,t1.ingmedsal, T12.mmnomm as medico_ordena_salida 
FROM HOSVITAL.INGRESOS T1 
INNER JOIN HOSVITAL.CAPBAS T2 ON (T1.MPTDOC=T2.MPTDOC  AND T1.MPCEDU=T2.MPCEDU)
INNER JOIN HOSVITAL.MAEPAB T4 ON (T4.MPCODP=T1.MPCODP AND T4.MPCODP IN (1,7,35,20,21,23)) 
LEFT JOIN HOSVITAL.MAEMED1 T5 ON (T5.MMCODM=T1.INGCOMT) 
LEFT JOIN HOSVITAL.MAEDIA T3 ON (T3.DMCODI=T1.INGENTDX) 
LEFT JOIN HOSVITAL.HCCOM1 T6 ON (T6.HISTIPDOC=T1.MPTDOC AND T6.HISCKEY=T1.MPCEDU AND T6.HCTVIN1=T1.INGCSC) 
inner join HOSVITAL.maemed1 T12 on (T12.mmcodm=T1.ingmedsal) 
WHERE T1.INGFECADM>='2019-09-01 00:00:00' AND T1.INGFECADM <='2019-10-31 23:59:59' AND T1.INGFECADM<(SELECT MIN(T9.INGFECADM)  FROM HOSVITAL.INGRESOS T9 WHERE T9.MPTDOC=T1.MPTDOC AND T9.MPCEDU= T1.MPCEDU AND T9.MPCODP IN 	(1,7,35,20,21,23) AND T6.FHCINDESP ='TR' AND T9.INGFECADM>T1.INGFECADM AND (YEAR(T9.INGFECADM)||MONTH(T9.INGFECADM)) <= (YEAR(T1.INGFECADM)||MONTH(T1.INGFECADM) + 3))
 ORDER BY T1.INGFECADM,TO_CHAR(T1.INGFECADM,'HH:MM');

SELECT * FROM HOSVITAL.MAEPAB; -- 1,7,35,20,21,23
