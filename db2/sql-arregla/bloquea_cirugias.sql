-- Consultas por numero de ciriugia / Cedula 
select PROCIRCOD,PROINDUSO from HOSVITAL.procir wherE procircod in (114623    );

select * from procir where mpcedu = '23262880';

select proinduso from hosvital.procir where procircod in (12407        );
SELECT * FROM CAPBAS WHERE MPCEDU = '1070012895';


select *  from hosvital.procir where procircod in (112407        );
-- Actualiza la cirugia bloqueada


update hosvital.procir  -- ESTABA EN H
set proinduso = 'N'
where procircod = 114623        ; 

select procircod,proinduso from procir  wherE procircod in (68687 )

-- ROLLBACK
-- commit


select * from procir where PROFSEP >= '2014-04-01' AND   proinduso ='S'


