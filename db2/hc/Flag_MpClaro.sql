SELECT * FROM HOSVITAL.MAEPAB;

-- FLAG MPCLARO 
-- no se que pasa 
-- no esta dce acuerdo con autorizaciones o
-- ver que pasa ?

/*
3= Hospitalizacion
=TratamientoEspecial
5=Urgencias
1=Ambulatorio
5=Triage
*/

SELECT * FROM HOSVITAL.INGRESOS WHERE MPCEDU='19291523' ORDER BY INGCSC;