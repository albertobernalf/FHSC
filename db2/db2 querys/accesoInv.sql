select * from hosvital.pergrup ;

select * from hosvital.pergrup where  pergrpcod = 'INVENTARIOS';

select * from hosvital.admgrp;

select * from hosvital.admsys;
select * from hosvital.admsys1 where asysid = 'INVENTARIOS';

select * from hosvital.admevn;

select * from hosvital.admusr where ausrest = 'S';
select * from hosvital.admusr where ausrid ='19465673';

select * from hosvital.admusr where ausrest = 'S' and agrpid = 'INVENTARIOS';

select * from hosvital.perexc;

select  p.ausrid usuario,x.ausrdsc nombre_usuario, a.asysid modulo, a.apgmid programa, p.aevnid opcion, p.acriter criterio 
from hosvital.admsys1 a,  hosvital.perexc p,  hosvital.admusr x
where a.asysid = 'INVENTARIOS'  and  a.asysid = p.asysid and a.apgmid= p.apgmid and p.ausrid = x.ausrid
order by p.ausrid;

select * from hosvital.perexc; 

