select * from hosvital.audserv2 where autcsc in (477);
select * from hosvital.audserv where  autcedu='52238507';
select * from hosvital.audserv3 where autcsc in (477);
select * from hosvital.audserv WHERE AUTTIP='S';

select a.doccod documento,a.autcsc consecutivo , a.autfecsol fecha_solicitado , a.auttipdoc tipodoc ,a.autcedu documento,c.mpnomc paciente,a.autobs1 obs1, a2.autserv proced,a2.autservfch fecha_serv,a.autfolio folio, a2.autservobs obs2 ,case when a.autestado ='A' then  'Autorizada'  when a.autestado ='P' then  'Pendiente' end as estado, case when a.auttip='P' THEN 'Procedimiento'   when a.auttip='S' THEN 'Suministro' END TIPO
from hosvital.audserv a
left  join hosvital.audserv2 a2 on (a2.doccod=a.doccod and a2.autcsc=a.autcsc)
left  join hosvital.audserv3 a3 on (a3.doccod=a.doccod and a3.autcsc=a.autcsc  and a3.autserv = a2.autserv)
inner join hosvital.capbas c on (c.mptdoc = a.auttipdoc and c.mpcedu=a.autcedu)
where  a.doccod in ('AU7','AU8') AND a.autfecsol >= '2020-12-30' and a.autfecsol <= '2021-01-06' and a.autcedu='1015455037'
order by a.autfecsol,a3.autserv;

select * from hosvital.procir  where mpcedu='52238507';