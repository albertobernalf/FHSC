-- Query No 1
-- Reporte Ordenes de Laboratorio que No caen  a tablas intermedias  ORDENES
-- Problemas de parametrizacion del lab o dl medico


SELECT * FROM HOSVITAL.HCCOM51;


select cap.mptdoc tipo_doc,cap.mpcedu documento,cap.mpnomc paciente, h51.hiscsec folio,h51.hcfchrord fecha_orden, h51.hcprccod, m.prnomb as procedimiento,m.prdister, m.printres
from hosvital.hccom51 h51
inner join hosvital.capbas cap on (cap.mptdoc = h51.histipdoc and cap.mpcedu= h51.hisckey)
inner join hosvital.maepro m on (m.prcodi = h51.hcprccod)
where h51.hcfchrord >= '2021-03-01 00:00:01' and h51.hcfchrord <= '2021-03-31 23:59:59' and h51.hcprctpop='2' and h51.hcordamb<>'S'  
						and  (h51.histipdoc, h51.hisckey , cast(h51.hiscsec as varchar(11)) )  not in
						(select  substring(o1.orclin,(locate(' ',o1.orclin) + 1),2)   ,  substring(o1.orclin,1,(locate(' ',o1.orclin) -1))
                                        						,substring(o1.orclin,  (locate(' ',o1.orclin) + 4), 11)
						from interlab.ordenes o1
						where substring(o1.orclin,(locate(' ',o1.orclin) + 1),2) =h51.histipdoc and  substring(o1.orclin,1,(locate(' ',o1.orclin) -1))=  h51.hisckey   and substring(o1.orclin,  (locate(' ',o1.orclin) + 4), 11)  =cast(h51.hiscsec  as varchar(11))
)	
order by  h51.hcfchrord, h51.hcfchrord ;



-- Query No 2
-- Reporte Prdenes de Laboratorio que No caen  a tablas intermedias  DETORDE -
--  Demora  DATACORP

select cap.mptdoc tipo_doc,cap.mpcedu documento,cap.mpnomc paciente, h51.hiscsec folio,h51.hcfchrord fecha_orden, h51.hcprccod, m.prnomb as procedimiento,m.prdister, m.printres
from hosvital.hccom51 h51
inner join hosvital.capbas cap on (cap.mptdoc = h51.histipdoc and cap.mpcedu= h51.hisckey)
inner join hosvital.maepro m on (m.prcodi = h51.hcprccod)
where h51.hcfchrord >= '2021-03-08 00:00:01' and h51.hcfchrord <= '2021-03-31 23:59:59' and h51.hcprctpop='2'   and h51.hcordamb<>'S'  and h51.hisckey='20665561'
						and  (h51.histipdoc, h51.hisckey , cast(h51.hiscsec as varchar(11)) )   in
						(select  substring(o1.orclin,(locate(' ',o1.orclin) + 1),2)   ,  substring(o1.orclin,1,(locate(' ',o1.orclin) -1))
                                        						,substring(o1.orclin,  (locate(' ',o1.orclin) + 4), 11)
						from interlab.ordenes o1
						where substring(o1.orclin,(locate(' ',o1.orclin) + 1),2) =h51.histipdoc and  substring(o1.orclin,1,(locate(' ',o1.orclin) -1))=  h51.hisckey   and substring(o1.orclin,  (locate(' ',o1.orclin) + 4), 11)  = cast(h51.hiscsec  as varchar(11))
)
						
						and (h51.histipdoc,h51.hisckey,cast(h51.hiscsec  as varchar(11)), h51.hcprccod) not in
						(select  substring(d1.orclin,(locate(' ',d1.orclin) + 1),2),substring(d1.orclin,1,(locate(' ',d1.orclin) -1)),substring(d1.orclin,  (locate(' ',d1.orclin) + 4), 11),d1.ordcodex
						from interlab.detorde d1
						where substring(d1.orclin,(locate(' ',d1.orclin) + 1),2) =h51.histipdoc  and  substring(d1.orclin,1,(locate(' ',d1.orclin) -1))=  h51.hisckey  and   substring(d1.orclin,  (locate(' ',d1.orclin) + 4), 11) =cast(   h51.hiscsec as varchar(11))  and d1.ordcodex=h51.hcprccod)
order by  h51.hcfchrord, h51.hcfchrord ;					

--  Pruebas con datos
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
/*
911005   	
911003   	
911018   	
911020   	
911021   	
911021   	
911107   	
911107   	
*/

---------------------------------------------------------------------------------------

select * from interlab.ordenes where orclin like ('%20665561%656%901217%');
select * from interlab.ordenes where orclin like ('%20665561%656%');


	
select * from interlab.detorde where orclin like ('%20665561%685%')  and ordcodex='911021' ;
select * from interlab.detorde where orclin like ('%20665561%685%')  and ordcodex='911020' ;
select * from interlab.detorde where orclin like ('%20665561%685%')  and ordcodex='911107' ;


select * from interlab.detorde where orclin like ('%20665561%685%');

select orclin, substring(h51.orclin,(locate(' ',h51.orclin) + 1),2)   ,  substring(h51.orclin,1,(locate(' ',h51.orclin) -1)) ,
substring(h51.orclin,  (locate(' ',h51.orclin) + 4), 5)		 
 from interlab.ordenes h51 where h51.orfecsol >= '2021-02-01';


select * from hosvital.hccom51 h51
where h51.hcfchrord >= '2021-03-01 00:00:00' and h51.hcfchrord <= '2021-03-01 23:59:59' and h51.hcprctpop='2'
order by  h51.hcfchrord ;

select * from interlab.ordenes where orfecrec >= '2021-03-01' order by orfecrec;

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

