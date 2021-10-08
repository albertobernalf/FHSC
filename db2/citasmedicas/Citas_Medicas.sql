select citnum,citced,citfchhra, citstscit, citcmbdto
    from hosvital.ctrlcitas where  citfchhra>='2019-01-01 00:00:00'  and citnum = 520269	
 order by citnum,citfchhra ;
-- med que atendio
-- especialidad


select * from hosvital.citmed;
select * from hosvital.citmed1;
select * from hosvital.citmed2; --medico de atencion

select cit.citnum as cita, cap.mptdoc as tipo_doc, cap.mpcedu as docuemtno , cap.mpnomc,
(select  ctrl1.citfchhra
 from hosvital.ctrlcitas ctrl1
 where ctrl1.citnum= ctrl.citnum and ctrl1.citstscit='R' and   ctrl1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='R' )  ) as Fecha_reservada,
(select  ctrl1.citfchhra
 from hosvital.ctrlcitas ctrl1
 where ctrl1.citnum= ctrl.citnum and ctrl1.citstscit='C' and   ctrl1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='C' )) as Fecha_Confirmada,
(select  ctrl1.citfchhra
 from hosvital.ctrlcitas ctrl1
 where ctrl1.citnum= ctrl.citnum and ctrl1.citstscit='A' and   ctrl1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='A' )) as Fecha_Atendida,
(select        
  case when (days(c1.citfchhra) - days(c2.citfchhra))= 0 then 0 else  ( days(c1.citfchhra) - days(c2.citfchhra)-1)      end               
from hosvital.ctrlcitas c1, hosvital.ctrlcitas c2
where c1.citnum= ctrl.citnum and ctrl.citnum=c2.citnum and
            c1.citstscit='A'  and c1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='A' )
          and  c2.citstscit='C' and   c2.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='C' )
) as tiempo_a_Atendida_dias,

(select        
    case when (days(c1.citfchhra) - days(c2.citfchhra))= 0 then (hour(c1.citfchhra) - hour(c2.citfchhra)) else (  hour(time('23:59:59')) - hour( c1.citfchhra)   +  hour( c2.citfchhra)  - hour(time('00:00:00'))  ) end              
from hosvital.ctrlcitas c1, hosvital.ctrlcitas c2
where c1.citnum= ctrl.citnum and ctrl.citnum=c2.citnum and
            c1.citstscit='A'  and c1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='A' )
          and  c2.citstscit='C' and   c2.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='C' )
) as tiempo_a_Atendida_horas,
(select        
  case when (days(c1.citfchhra) - days(c2.citfchhra))= 0 then (minute(c1.citfchhra) - minute(c2.citfchhra)) else (  minute(time('23:59:59')) - minute( c1.citfchhra)   +  minute( c2.citfchhra)  - minute(time('00:00:00'))  ) end        
from hosvital.ctrlcitas c1, hosvital.ctrlcitas c2
where c1.citnum= ctrl.citnum and ctrl.citnum=c2.citnum and
            c1.citstscit='A'  and c1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='A' )
          and  c2.citstscit='C' and   c2.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='C' )
) as tiempo_a_Atendida_minutos,
(select  ctrl1.citfchhra
 from hosvital.ctrlcitas ctrl1
 where ctrl1.citnum= ctrl1.citnum and ctrl1.citstscit='F' and   ctrl1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='F' )) as Fecha_Facturada,
mae.mmnomm as medico
from hosvital.ctrlcitas ctrl
inner join hosvital.citmed1 cit on (cit.citnum=ctrl.citnum)
inner join hosvital.capbas cap on (cap.mptdoc=cit.cittipdoc and cap.mpcedu = cit.citced )
inner join hosvital.citmed2 cit2 on  (cit2.citnum=cit.citnum)
inner join hosvital.maemed1 mae on (mae.mmcodm = cit2.mmcodm)
where ctrl.citfchhra>= '2019-05-01 00:00:00' and  ctrl.citfchhra<= '2019-05-31 00:00:00'
order by  ctrl.citnum;


/**
--acotado
*/


select cit.citnum as cita, cap.mptdoc as tipo_doc, cap.mpcedu as docuemtno , cap.mpnomc,(select  ctrl1.citfchhra from hosvital.ctrlcitas ctrl1
 where ctrl1.citnum= ctrl.citnum and ctrl1.citstscit='R' and   ctrl1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='R' )  ) as Fecha_reservada,(select  ctrl1.citfchhra
 from hosvital.ctrlcitas ctrl1  where ctrl1.citnum= ctrl.citnum and ctrl1.citstscit='C' and   ctrl1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='C' )) as Fecha_Confirmada,
(select  ctrl1.citfchhra  from hosvital.ctrlcitas ctrl1  where ctrl1.citnum= ctrl.citnum and ctrl1.citstscit='A' and   ctrl1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='A' )) as Fecha_Atendida,(select case when (days(c1.citfchhra) - days(c2.citfchhra))= 0 then 0 else  ( days(c1.citfchhra) - days(c2.citfchhra)-1)  end from hosvital.ctrlcitas c1, hosvital.ctrlcitas c2
where c1.citnum= ctrl.citnum and ctrl.citnum=c2.citnum and  c1.citstscit='A'  and c1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='A' )
          and  c2.citstscit='C' and   c2.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='C' ) ) as tiempo_a_Atendida_dias,
(select case when (days(c1.citfchhra) - days(c2.citfchhra))= 0 then (hour(c1.citfchhra) - hour(c2.citfchhra)) else (  hour(time('23:59:59')) - hour( c1.citfchhra)   +  hour( c2.citfchhra)  - hour(time('00:00:00'))  ) end              
from hosvital.ctrlcitas c1, hosvital.ctrlcitas c2 where c1.citnum= ctrl.citnum and ctrl.citnum=c2.citnum and  c1.citstscit='A'  and c1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='A' )
          and  c2.citstscit='C' and   c2.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='C' ) ) as tiempo_a_Atendida_horas, (select        
  case when (days(c1.citfchhra) - days(c2.citfchhra))= 0 then (minute(c1.citfchhra) - minute(c2.citfchhra)) else (  minute(time('23:59:59')) - minute( c1.citfchhra)   +  minute( c2.citfchhra)  - minute(time('00:00:00'))  ) end        
from hosvital.ctrlcitas c1, hosvital.ctrlcitas c2 where c1.citnum= ctrl.citnum and ctrl.citnum=c2.citnum and  c1.citstscit='A'  and c1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='A' )
          and  c2.citstscit='C' and   c2.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='C' ) ) as tiempo_a_Atendida_minutos,(select  ctrl1.citfchhra
 from hosvital.ctrlcitas ctrl1  where ctrl1.citnum= ctrl1.citnum and ctrl1.citstscit='F' and   ctrl1.citfchhra = (select min(ctrl2.citfchhra) from hosvital.ctrlcitas ctrl2 where ctrl2.citnum=ctrl.citnum and  ctrl2.citstscit='F' )) as Fecha_Facturada,
mae.mmnomm as medico from hosvital.ctrlcitas ctrl inner join hosvital.citmed1 cit on (cit.citnum=ctrl.citnum) inner join hosvital.capbas cap on (cap.mptdoc=cit.cittipdoc and cap.mpcedu = cit.citced ) inner join hosvital.citmed2 cit2 on  (cit2.citnum=cit.citnum) inner join hosvital.maemed1 mae on (mae.mmcodm = cit2.mmcodm) where ctrl.citfchhra>=? and  ctrl.citfchhra<= ?  order by  ctrl.citnum