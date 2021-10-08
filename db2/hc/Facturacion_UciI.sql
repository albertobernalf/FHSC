-- UCI DESDD2018 -- UCI
--CED,NOMBRE,CAMA,VALOR_FACTURA,


select * from hosvital.maeate2 where mafepr>='2019-05-01 00:0:00' ;

select * from hosvital.maepab11 where mpcedu='1003086881';
select * from hosvital.maeate where mpcedu='1003086881';

select * from hosvital.tmpfac1;
select * from hosvital.cptserv; --  cptcod,  cptdesc
select * from hosvital.tmpfac1 where tfcedu='1000290157';
select * from hosvital.maeate  where mpcedu='1000290157';
select * from hosvital.maeate2;
select * from hosvital.maeate3;
select  distinct(prcpto) from hosvital.maepro;     -- tpprcd
select * from hosvital.maesum1;
select * from hosvital.maepro;
SELECT * FROM HOSVITAL.TIPPROC;





select i.ingfac,i.mptdoc,i.mpcedu, i.ingcsc,m11.hiscamfec,m11.hiscamhor, m11.mpnumc,m11.hiscamedo,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.tpprcd and serv.cptcod='01' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as consultas,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.prcpto and serv.cptcod='02' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as Proced_dx,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.prcpto and serv.cptcod='03' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as No_qx,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.prcpto and serv.cptcod='04' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as Quirurgicos,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.prcpto and serv.cptcod='05' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as stancias,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.prcpto and serv.cptcod='06' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as Estancias,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.prcpto and serv.cptcod='07' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as Honorarios,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.prcpto and serv.cptcod='08' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as Derechos_sala,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.prcpto and serv.cptcod='10' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as Banco_Sangre,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.prcpto and serv.cptcod='11' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as pROTESIS_oRTESIS,
(select sum(mae3.mavats)
from hosvital.maeate mae, hosvital.maeate3 mae3
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae3.mpnfac  and mae3.fcstpotrn='F' and mae3.maespanus <>'S'
) as Materiales_Insumos,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.cptserv serv
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and serv.cptcod=maepro.prcpto and serv.cptcod='14' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S'

) as Traslados
from hosvital.ingresos i, hosvital.maepab11 m11
where m11.hiscamfec>= '2018-01-01' and m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc and m11.mpcodp in  (3,11,12,43,44) and i.mpcedu='1000290157'
order by m11.mptdoc,m11.mpcedu,m11.hiscnsing,m11.hiscamfec,m11.hiscamhor;


select * from hosvital.maepab where mpcodp in (3,11,12,43,44);
select * from hosvital.maepab11; -- where mpcodp in (3,11,12,43,44);

----------------------------------
----------------------------------
-- El mismo quey pero por tipo deprocedimeinto
----------------------------------
----------------------------------

select i.ingfac as factura,i.mptdoc as tipo_doc,i.mpcedu as documento, i.ingcsc as consecutivo_de_ingreso,c.mpnomc as paciente, i.ingfecadm as ingreso, i.ingfecegr as egreso,
(select  concat(concat(varchar_format(cast(pab11.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  , pab11.HISCAMHOR)
from hosvital.maepab11 pab11
where pab11.mptdoc=m11.mptdoc and pab11.mpcedu=m11.mpcedu and pab11.hiscnsing  = m11.hiscnsing and pab11.mpcodp in  (3,11,12,43,44) and concat(concat(concat(varchar_format(cast(pab11.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  , pab11.HISCAMHOR), pab11.hiscamctv) = (select min(concat(concat(concat(varchar_format(cast(pab12.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  ,pab12.HISCAMHOR), pab12.hiscamctv)) from hosvital.maepab11 pab12  where pab12.mptdoc=pab11.mptdoc and 		pab12.mpcedu=pab11.mpcedu and pab12.hiscnsing  = pab11.hiscnsing and pab12.mpcodp in  (3,11,12,43,44) and pab12.hiscamedo='O')		

) as  Ocupo_Primera_Vez,
(select  pab11.mpnumc
from hosvital.maepab11 pab11
where pab11.mptdoc=m11.mptdoc and pab11.mpcedu=m11.mpcedu and pab11.hiscnsing  = m11.hiscnsing and pab11.mpcodp in  (3,11,12,43,44) and concat(concat(concat(varchar_format(cast(pab11.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  , pab11.HISCAMHOR) , pab11.hiscamctv) = (select min(concat(concat(concat(varchar_format(cast(pab12.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  ,pab12.HISCAMHOR), pab12.hiscamctv)) from hosvital.maepab11 pab12  where pab12.mptdoc=pab11.mptdoc and 		pab12.mpcedu=pab11.mpcedu and pab12.hiscnsing  = pab11.hiscnsing and pab12.mpcodp in  (3,11,12,43,44) and pab12.hiscamedo='O')		

) as  Ocupo_Primera_VezCama,
(select  concat(concat(varchar_format(cast(pab11.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  , pab11.HISCAMHOR)
from hosvital.maepab11 pab11
where pab11.mptdoc=m11.mptdoc and pab11.mpcedu=m11.mpcedu and pab11.hiscnsing  = m11.hiscnsing and pab11.mpcodp in  (3,11,12,43,44) and concat(concat(concat(varchar_format(cast(pab11.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  , pab11.HISCAMHOR), pab11.hiscamctv) = (select max(concat(concat(concat(varchar_format(cast(pab12.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  ,pab12.HISCAMHOR), pab12.hiscamctv)) from hosvital.maepab11 pab12  where pab12.mptdoc=pab11.mptdoc and 		pab12.mpcedu=pab11.mpcedu and pab12.hiscnsing  = pab11.hiscnsing and pab12.mpcodp in  (3,11,12,43,44) and pab12.hiscamedo='L')		

) as Libero_Ultima_Vez,
(select  pab11.mpnumc
from hosvital.maepab11 pab11
where pab11.mptdoc=m11.mptdoc and pab11.mpcedu=m11.mpcedu and pab11.hiscnsing  = m11.hiscnsing and pab11.mpcodp in  (3,11,12,43,44) and concat(concat(concat(varchar_format(cast(pab11.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  , pab11.HISCAMHOR), pab11.hiscamctv)  = (select max(concat(concat(concat(varchar_format(cast(pab12.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  ,pab12.HISCAMHOR), pab12.hiscamctv)) from hosvital.maepab11 pab12  where pab12.mptdoc=pab11.mptdoc and 		pab12.mpcedu=pab11.mpcedu and pab12.hiscnsing  = pab11.hiscnsing and pab12.mpcodp in  (3,11,12,43,44) and pab12.hiscamedo='L')		

) as Libero_Ultima_VezCama,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.tipproc tip
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and tip.tiprcod=maepro.tpprcd and tip.tiprcod='1' and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac

) as Radiologia,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.tipproc tip
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and tip.tiprcod=maepro.tpprcd and tip.tiprcod='2'  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac

) as Laboratorios,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.tipproc tip
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and tip.tiprcod=maepro.tpprcd and tip.tiprcod='3'  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac

) as Terapias,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.tipproc tip
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and tip.tiprcod=maepro.tpprcd and tip.tiprcod='4'  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac

) as Proc_no_Qx,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.tipproc tip
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and tip.tiprcod=maepro.tpprcd and tip.tiprcod='5'  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac

) as Proc_Qx,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.tipproc tip
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and tip.tiprcod=maepro.tpprcd and tip.tiprcod='6'  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac

) as Otros,
(select cast(sum(mae2.mavatp) as float)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro,hosvital.tipproc tip
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and tip.tiprcod=maepro.tpprcd and tip.tiprcod='7'  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac

) as Estancias,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro, hosvital.tipproc tip
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and tip.tiprcod=maepro.tpprcd and tip.tiprcod='8'  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac

) as Consultas,
(select sum(mae2.mavatp)
from hosvital.maeate mae, hosvital.maeate2 mae2, hosvital.maepro maepro,hosvital.tipproc tip
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae2.mpnfac  and mae2.prcodi=maepro.prcodi and tip.tiprcod=maepro.tpprcd and tip.tiprcod='9'  and mae2.fcptpotrn='F' and mae2.maesanup <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac

) as No_Aplica,

(select sum(mae3.macans * mae3.mavalu)
from hosvital.maeate mae, hosvital.maeate3 mae3
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing and
           mae.mpnfac = mae3.mpnfac  and mae3.fcstpotrn = 'F' and mae3.maesanus <> 'S' and mae.maestf  not in ('1','10') and mae.mpnfac = i.ingfac
) as Materiales_Insumos,

(select sum(mae.matotf)
from hosvital.maeate mae
where mae.mptdoc = m11.mptdoc and mae.mpcedu=m11.mpcedu and mae.mactving=m11.hiscnsing  and mae.mpnfac = i.ingfac

) as Valor_factura
from hosvital.ingresos i, hosvital.maepab11 m11, hosvital.capbas c
where m11.hiscamfec>= '2018-01-01' and m11.mptdoc=i.mptdoc and m11.mpcedu=i.mpcedu and m11.hiscnsing=i.ingcsc and m11.mpcodp in  (3,11,12,43,44) and
              m11.mptdoc=c.mptdoc and m11.mpcedu=c.mpcedu  AND
	concat(concat(varchar_format(cast(m11.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  ,m11.HISCAMHOR) = (select min(concat(concat(varchar_format(cast(pab12.HISCAMFEC as timestamp) , 'YYYY-MM-DD'),' ')  ,pab12.HISCAMHOR)) from hosvital.maepab11 pab12  where pab12.mptdoc=m11.mptdoc and 		pab12.mpcedu=m11.mpcedu and pab12.hiscnsing  = m11.hiscnsing and pab12.mpcodp in  (3,11,12,43,44) and pab12.hiscamedo='O')	and i.ingfac not in (select mpnfac from hosvital.maeate where maestf in ('1','10'))

order by m11.mptdoc,m11.mpcedu,m11.hiscnsing,m11.hiscamfec,m11.hiscamhor;
