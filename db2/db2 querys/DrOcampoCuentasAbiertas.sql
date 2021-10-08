select * from hosvital.ingresos  LIMIT 100;
select * from hosvital.tmpfac1;

select count(*) 
from hosvital.ingresos 
where
 ingfecegr = '0001-01-01 00:00:00.000000';  -- Adnisiones sin fecha de egreso 96901	


select count(*) from hosvital.tmpfac;  -- 2327  Cuentas Activas	
select count(*) from hosvital.tmpfac1;  -- 42969	Proced- Suministros
	
select count(*) from hosvital.tmpfac2;  -- 2259	

-- Detalle


select * from hosvital.ingresos 
where ingfecegr = '0001-01-01 00:00:00.000000'
ORDER BY INGFECADM; 


-- Primera estadistica

SELECT YEAR(INGFECADM) , MONTH(INGFECADM), COUNT(*)
FROM HOSVITAL.INGRESOS
WHERE   ingfecegr = '0001-01-01 00:00:00.000000'
GROUP BY YEAR(INGFECADM) , MONTH(INGFECADM)
ORDER BY  YEAR(INGFECADM) , MONTH(INGFECADM);


-- Segunda estadistica, Con valores

select  I.MPTDOC,I.MPCEDU,I.INGCSC, I.INGFECADM,
(SELECT sum(t1.TFVLRTOT)
 FROM HOSVITAL.TMPFAC1 T1
WHERE T1.tfTDOC = I.MPTDOC and t1.tfcedu = i.mpcedu  and I.ingcsc = t1.tmctving and t1.tfestaanu1 <> 'S'
having  sum(t1.TFVLRTOT) >0
) as procedimientos
from hosvital.ingresos I, HOSVITAL.CAPBAS C
where I.ingfecegr = '0001-01-01 00:00:00.000000' AND
          I.MPTDOC = C.MPTDOC AND I.MPCEDU = C.MPCEDU 
ORDER BY INGFECADM; 


SELECT * FROM HOSVITAL.TMPFAC;
SELECT * FROM HOSVITAL.TMPFAC1;

select * from hosvital.tmpfac1 where tfcedu  in ('20121703');  -- 1204400.00	

-- Query desde la Facturacion

select  I.MPTDOC,I.MPCEDU,C.MPNOMC,I.INGCSC, I.INGFECADM,I.ingfecegr,
(SELECT sum(t1.TFVatp)
 FROM HOSVITAL.TMPFAC1 T1
WHERE T1.tfTDOC = T.tfTDOC and t1.tfcedu =t.tfcedu  and t.tmctving = t1.tmctving and t1.tfestaanu1 = 'N' and t1.tfptpotrn ='F'
having  sum(t1.TFVatp) >0
) as procedimientos,
(SELECT sum(t1.TFVats)
 FROM HOSVITAL.TMPFAC2 T1
WHERE T1.tfTDOC = T.tfTDOC and t1.tfcedu =t.tfcedu  and t.tmctving = t1.tmctving and t1.tfestaanu2  = 'N' and t1.tfstpotrn ='F'
having  sum(t1.TFVats) >0
) as suministros
from hosvital.ingresos I, HOSVITAL.CAPBAS C,  hosvital.tmpfac t
where I.ingfecegr = '0001-01-01 00:00:00.000000' AND
          I.MPTDOC = C.MPTDOC AND I.MPCEDU = C.MPCEDU  and
          I.MPTDOC = t.tfTDOC AND I.MPCEDU = t.tfCEDU  and
         t.tmctving = i.ingcsc
order by I.INGFECADM;


select * from hosvital.tmpfac1 where tfcedu = '20182601';
select * from hosvital.tmpfac1;



