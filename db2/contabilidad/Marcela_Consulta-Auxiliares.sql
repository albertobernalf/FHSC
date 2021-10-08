select  * from hosvital.rsmaux where rsmano=2020 and rsmmes=12;
select * from hosvital.resmcue where rsmano=2020 and rsmmes=12 order by rsmctncon, trccod;
select * from hosvital.movcont2;
select * from hosvital.resmcue where rsmano=2020 and rsmmes=1 AND TRCCOD='860007373' and  rsmctncon='11050501';

/*

Fecha: 01/01/2020 a 31/12/2020
Cuentas: 1415,1420, 1421, 1424, 1435 y 1455
 

Agradezco se pueda visualizar todos los paremétros que genera el auxiliar: Tipo de documento, numero de docuemnto, fecha de documento, nit, nombre tercero, débito, crédito, saldo, concepto.

*/

select * from hosvital.movcont2 where doccod='REC' AND MVCNRO=176382;
select * from hosvital.movcont2 where doccod='CON' AND MVCNRO=7356;
select * from hosvital.terceros WHERE TRCNIT='860007373-4';



select  m.cntcod as cuenta_contable , m.doccod tipo_doc, m.mvcnro DocNro ,m.mvccfch fecha , m.cntcod as cuenta, m.mvcdet concepto , t.trcnit as nit_tercero, t.trcrazsoc tercero ,  case when mvcnat='D' then    m.mvcvlr end as debitos,  case when mvcnat='C' then    m.mvcvlr end as creditos 
from hosvital.movcont2 m
inner join hosvital.resmcue r on (r.rsmempcod = m.empcod and  r.mcdpto= m.mcdpto and r.trccod=m.trccod and r.rsmano=m.mvcanio and r.rsmmes= m.mvcmes and r.rsmctncon = m.cntcod and r.cnucod='' and r.cnusub='' and r.cnccod='' and r.cntsub='')
inner join hosvital.terceros t on (t.trccod = m.trccod)
where m.empcod='01' and M.CNTVIG=2020 AND m.mvcanio=2020  and substring(m.cntcod,1,4)  in ('1415','1420', '1421', '1424', '1435','1455')
order by m.cntcod,m.mvccfch ; 
