-- Se busca ingreso del paciente yb se anota la fecha de egreo
select * from hosvital.ingresos where mpcedu=  '20620655'; -- ingreso 1

-- Se buscan los folio,las fechas del ingreso

select HISTIPDOC,HISCKEY,HCTVIN1 AS INGRESO,HISFSAL,HISFECSAL from hosvital.hccom1 where hisckey=   '20620655' and hctvin1= 2 order by hiscsec;

--Se busca en la tmpfac el campo TFFCHS, 

select TFTDOC,TFCEDU, TMCTVING,TFFCHS  from hosvital.tmpfac where tfcedu=  '20620655'; -- tffchs


-- Se actualiza la TMPFAC con la fecha  de salida de la tabla ingresos y de acuerdo al numero de ingreso del paciente

update  hosvital.tmpfac set tffchs= '2020-03-01 20:20:14.' where tfcedu=  '20620655'  and tmctving=2; 

-- Se actualiza laHCCOM1 el campo HISCFECSAL con el valor del campo hisfsal solo para el ingreso a facturar

update hosvital.hccom1
set hisfecsal=hisfsal
where histipdoc='CC' AND hisckey= '20620655' and hctvin1=2;


