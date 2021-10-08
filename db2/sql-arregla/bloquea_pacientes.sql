SELECT * FROM CAPBAS WHERE MPNOMC LIKE ('%RUTH%ROJAS%RODRIGUEZ%')
-- LO CONSULTO
-- REVISO EL NOMBRE DEL PACIENTE

SELECT * FROM CAPBAS WHERE MPCEDU ='1075666327'
	
SELECT TFTDOC,TFCEDU,tfadmfac,tmctving FROM TMPFAC WHERE TFCEDU = '214991'

-- LO ACTUALIZO

	begin transaction;
	update tmpfac
	set tfadmfac = 'N'
	where tfcedu in ('354281431');
-- COMMIT
-- rollback

IP: 172.16.106.51

select * from ingresos where mpcedu  = '1075666327' and ingcsc in (49,51)

select * from maeate where mpcedu= '1075660350' order by mactving

-- 