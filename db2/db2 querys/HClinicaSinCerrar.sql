-- Caso paciente :
--23448573	DIOSELINA RINCON DE RODRIGUEZ	"PROCEDIMIENTO 770501 NO SE PUEDE CARGAR A FACTURACION PORQUE SU VALOR ES 0 AL LIQUIDARLO CON EL CONTRATRO CS01111
--PROCEDIMIENTO 793501 NO SE PUEDE CARGAR A FACTURACION PORQUE SU VALOR ES 0 AL LIQUIDARLO CON EL CONTRATRO CS01111
--EXTRACCION DE DISPOSITIVO INMPANATADO EN FEMUR CODIGO 786501 NO AUTORIZADO
--PRUEBAS CRUZADAS ARA TRANSFUSION DE SANGRE 
--PRCESAMIENTO DE LA UNIDAD DE GLOBULOS ROJOS
--RADIOGRAFIA DE CADERA, RODILLA,FEMUR, NO APLICADAS, ELECTROCARDOGRAMA NO SE PUEDE INTERPRETAR "

select * from hosvital.maepac where mpcedu = '23448573'; -- contrato  CS0111       	


select * from hosvital.maeemp31 where mennit = 'CS0111';  -- portafolio 146
-- Procedimiento 770501 parametrizado requiere autorizacion .. En el modulo deautorizaciones esta AUTORIZADA
-- Procedimiento 793501 parametrizado requiere autorizacion .. En el modulo deautorizaciones esta AUTORIZADA
-- Procedimiento 786501  parametrizado requiere autorizacion .. En el modulo deautorizaciones esta EN TRAMITE

SELECT * FROM HOSVITAL.TMPFAC1 WHERE TFCEDU = '23448573' AND TFPRC1 = '793501' ;

select * from hosvital.hccom51 where hisckey = '23448573' and hcprccod in ( '793501','786501','873420');

select * from hosvital.maepro where prcodi ='793501';

select * from hosvital.hccom51 where hisckey = '23448573' and hiscsec = 335 ; -- and hcprccod = '793501';
select * from hosvistal.hccom5 where hisckey = '23448573' and hiscsec = 335;    -- nd hcprccod = '793501';
select * from hosvital.maepro where prcodi ='573201';

--caso nro 2

select * from hosvital.hccom51 where hisckey = '447449'  and hcprccod = '573201';
select * from hosvital.maepac where mpcedu = '23448573'; -- contrato  CS0111       

SELECT * FROM HOSVITAL.TMPFAC1 WHERE TFCEDU = '447449' ; --  AND TFPRC1 = '573201' ;   --no cayoa facturacion solo hatas que se responda


-- Caso 3188522

-- Busco contrato y portafolio del pacienrte


select * from hosvital.maepac where mpcedu = '3188522'; -- contrato  CS0111       	
select * from hosvital.maeemp31 where mennit = 'CS0111';  -- portafolio 146

-- Busco autorizaciones del paciente

-- Busco el ingreso actual del páciente

SELECT * FROM HOSVITAL.TMPFAC WHERE TFCEDU = '3188522' ; -- Ingreso Nro 1 
SELECT * FROM HOSVITAL.TMPFAC1 WHERE TFCEDU = '3188522' ;

-- Busacamos cirugias

select * from hosvital.procir where mpcedu = '3188522';
select * from hosvital.procir1 where procircod =110655	;  --862003   	/  867202   	
select * from hosvital.procir where mpcedu =110655;
select * from hosvital.procir2 where procircod = 110655;
select * from hosvital.procir3 where procircod = 110655;
select * from hosvital.procir4 where procircod = 110655;



-- Otro caso




-- Busco contrato y portafolio del pacienrte


select * from hosvital.maepac where mpcedu = '19466493'; -- contrato  CS0111       	
select * from hosvital.maeemp31 where mennit = 'SS0021';  -- portafolio 148

-- Busco autorizaciones del paciente

-- Busco el ingreso actual del páciente

SELECT * FROM HOSVITAL.TMPFAC WHERE TFCEDU = '19466493' ; -- Ingreso Nro 1 
SELECT * FROM HOSVITAL.TMPFAC1 WHERE TFCEDU = '19466493' ORDER BY TFPRC1 ;

-- Busacamos cirugias

select * from hosvital.procir   where mpcedu = '19466493';
select * from hosvital.procir1 where procircod =	110370;  --862003   	/  867202   	
select * from hosvital.procir   where mpcedu =110370;
select * from hosvital.procir2 where procircod = 110370;
select * from hosvital.procir3 where procircod = 110370;
select * from hosvital.procir4 where procircod = 110370;

SELECT * FROM HOSVITAL.PORTAR1  WHERE PTCODI = '148' AND PRCODI = '862001';




