SELECT * FROM HOSVITAL.MAEEMP WHERE MENOMB LIKE ('%SERVISA%');  --AS0012       	
SELECT * FROM HOSVITAL.MAEATE;
SELECT MPNFAC, MPMENI, MAUSUFAC,FACCODPAB ,MAUBIFAC,MAESTENV,MAINDDEV,MAESTCAN,MACTVAC FROM HOSVITAL.MAEATE WHERE FACFCH >='2019-04-01'  AND MPMENI  IN ('AS0012','ADRES')  AND MAESTF NOT IN ('1','10');
SELECT * FROM HOSVITAL.MAEATE WHERE FACFCH >='2019-04-01'  AND MPMENI IN ('AS0012','ADRES')  AND MAESTF NOT IN ('1','10');

/*
CEDULA DESHIRLEY
53039523
23968249
1023968249
A MANYURY CABEZAS RAMIERZ
*/

SELECT * FROM HOSVITAL.MAEATE WHERE FACFCH >='2019-04-01'  AND MPMENI  IN ('AS0012','ADRES')  AND MAESTF NOT IN ('1','10') AND MPNFAC IN (576231	,574725,574730	); -- MACTVACT=1

UPDATE HOSVITAL.MAEATE
SET  MACTVACT=0
 WHERE MPNFAC IN (574725,574730	);




