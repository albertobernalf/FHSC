select * from HOSVITAL.movinV1 where MVTOLOT= '190527' ORDER BY MVTONRORQ;

select * from HOSVITAL.requisici where reqnro= 59475	; -- reqfch=  2020-01-15	
select * from HOSVITAL.requisi1  where reqnro= 59475	;
select * from HOSVITAL.movinV1 where doccod='ASA' AND DOCNRO= 12100648; -- MVTOFECRE = 2020-01-15
select * from HOSVITAL.movinV4 where doccod='ASA' AND DOCNRO =   12100648; --  FCHMVT =  2019-12-13 12:37:52.000000	
select * from HOSVITAL.movinV3 where doccod='ASA' AND DOCNRO =   12100648;

SELECT * FROM HOSVITAL.DOCUCON  WHERE DOCDSC LIKE ('%ENTRADA%');

select * from HOSVITAL.movinV1 where doccod='ENC' AND DOCNRO= 33717; -- MVTOFECRE = 2020-01-15
select * from HOSVITAL.movinV4 where doccod='ENC' AND DOCNRO =   33717;
SELECT * FROM HOSVITAL.MAESUM1 WHERE MSRESO='0017HM01';


-- PACIENTE  1108835085
-- 13453769
select * from HOSVITAL.movinV1 where MVTOLOT= '190527' ORDER BY MVTONRORQ;  -- LLEGAS TASTA REQ 59467	

select * from HOSVITAL.movinV1 where DOCCOD='ASA' AND DOCNRO =12051753;


-- Prueba
-- Paciente 13453769
-- Genera ASA 

select * from HOSVITAL.movinV1 where DOCCOD='ASA' AND DOCNRO =12051754; -- Mañana en la Mañana LEGALIZAR

-- Paciente 23263681 ana cecilia
-- Generar ASA  o Despacho mañana Y LEGALIZAR MAÑANA TEMPRANO -12051755 


select * from HOSVITAL.movinV1 where DOCCOD='ASA' AND DOCNRO =12051755; 


SELECT r.reqnro requisicion, r1.msreso cod_med,  m.msnomg medicamento,r1.reqcanapr cantiad, r1.reqcanenv enviada, (r1.reqcanapr   - r1.reqcanenv) Penediente
FROM hosvital.requisici r 
inner join hosvital.requisi1 r1 on (r1.reqnro = r.reqnro)
inner join hosvital.maesum1 m on (m.msreso=r1.msreso)
where r.reqfch >= '2021-01-01 ' and r.reqfch <= '2021-01-31'
order by r.reqfch,r.reqnro