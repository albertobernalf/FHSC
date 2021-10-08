-- Consulta-Actualizacion ocupacion cama
-- CR03

select * from hosvital.maepab1 where mpnumc = '301-S' ;  --  where mpcedu ='22259902' order by hiscamfec,hiscamhor;

update hosvital.maepab1
set mpdisp='1' , mpfchi='2020-02-24 06:41:11', mpuced='22259902', mpudoc='CC', mpctvin =  2
 where mpnumc = '301-S' ;  

-- Consulta-Actualizacion Historico de ocupacion cama

select * from hosvital.maepab11 where mpcedu ='22259902' order by hiscamfec,hiscamhor;

insert into hosvital.maepab11 values ('28','301-S',999,'O','2020-02-24','06:41:11','22259902','CC','',2);


-- Consulta-Actualizacion ingreso de paciente

select * from hosvital.ingresos  where mpcedu='22259902';

update hosvital.ingresos  
set mpcodp= 28 ,  mpnumc='301-S'
where mpcedu='22259902' and ingcsc =2;


-- Consulta-Actualizacion Cuenta actual

select tfccodpab, tfccodcam, a.* from hosvital.tmpfac  a where tfcedu='22259902';

UPDATE HOSVITAL.TMPFAC 
SET tfccodpab=28,  tfccodcam='301-S'
 WHERE TFTDOC='CC' AND TFCEDU='22259902' AND TMCTVING=2;

-- Consulta facturas

select  mpnfac, mactving ,a.* from hosvital.maeate a where mpcedu= '22259902';