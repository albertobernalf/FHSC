select histipdoc,hiscsec,hisckey,hctvin51,hcprccod,hcfchrord, hcprcest  from hosvital.hccom51 where hisckey='3093031' and  hcprcest= 'O';  
select * from hosvital.maepro;

select h51.hcfchrord fecha_ordenado,h51.hiscsec folio, c.mptdoc tipodoc,c.mpcedu Documento,c.mpnomc paciente,hcprccod cod_proc, m.prnomb as procedimiento, h51.hcprcest  estado, h51.hctvin51
from hosvital.hccom51  h51
inner join hosvital.capbas c on (c.mptdoc=h51.histipdoc and c.mpcedu=h51.hisckey)
inner join hosvital.maepro m on (m.prcodi= h51.hcprccod)
where h51.hcfchrord >= '2010-08-01 00:00:00' and h51.hcfchrord <= '2010-08-25 00:00:00'  and  h51.hcprcest= 'O'
order by h51.hcfchrord ;

select * from hosvital.hccom5 where hisckey='20033437' and hiscsec = 2;
select * from hosvital.hccom1 where hisckey='20033437' and hiscsec = 2; -- 2010-08-11	

select * from hosvital.maeate where facfch >= '2020-08-01'; --  where mpcedu = '20033437'; - mpptcodi
select * from hosvital.portar1 where ptcodi='146';
select * from hosvital.homproc;

select  * from hosvital.citmed1 where citced='20033437';
select  * from hosvital.citmed where citnum = 173749;

-- Aqui van todos

select h51.hcfchrord fecha_ordenado,h51.hiscsec folio, c.mptdoc tipodoc,c.mpcedu Documento,c.mpnomc paciente,h51.hcprccod cod_proc, m.prnomb as procedimiento, h51.hcprcest  estado, h51.hctvin51, h.homprocnt, h.homprovlr
from hosvital.hccom51  h51
inner join hosvital.maeate mae on (mae.mptdoc = h51.histipdoc and mae.mpcedu = h51.hisckey and mae.mactving = h51.hctvin51)
inner join hosvital.capbas c on (c.mptdoc=h51.histipdoc and c.mpcedu=h51.hisckey)
inner join hosvital.maepro m on (m.prcodi= h51.hcprccod)
inner join hosvital.portar1 p1 on (p1.ptcodi= mae.mpptcodi and p1.prcodi=h51.hcprccod )
inner join hosvital.homproc h on (h.prcodi=p1.prcodi and h.trfcod=p1.trfcod and h.homprocod=p1.prcodi)
where h51.hcfchrord >= '2010-08-01 00:00:00' and h51.hcfchrord <= '2010-08-25 00:00:00'  and  h51.hcprcest= 'O' and h51.hctvin51 <> 0
order by h51.hcfchrord ;

-- Ahora que no se hayan Facturado

select mae.mpnfac,h51.hcfchrord fecha_ordenado,h51.hiscsec folio, c.mptdoc tipodoc,c.mpcedu Documento,c.mpnomc paciente,h51.hcprccod cod_proc, m.prnomb as procedimiento,h51.hcprccns, h51.hcprcest  estado, h51.hctvin51, h.homprocnt, h.homprovlr
from hosvital.hccom51  h51
inner join hosvital.maeate mae on (mae.mptdoc = h51.histipdoc and mae.mpcedu = h51.hisckey and mae.mactving = h51.hctvin51 and mae.maestf not in ('1','10'))
inner join hosvital.capbas c on (c.mptdoc=h51.histipdoc and c.mpcedu=h51.hisckey)
inner join hosvital.maepro m on (m.prcodi= h51.hcprccod)
inner join hosvital.portar1 p1 on (p1.ptcodi= mae.mpptcodi and p1.prcodi=h51.hcprccod )
inner join hosvital.homproc h on (h.prcodi=p1.prcodi and h.trfcod=p1.trfcod and h.homprocod=p1.prcodi)
where h51.hcfchrord >= '2019-01-01 00:00:00' and h51.hcfchrord <= '2019-12-31 23:59:59'  and  h51.hcprcest= 'O' and h51.hctvin51 <> 0 and h51.hisckey='20183235' and h51.hiscsec=134 and mae.mpnfac =577620 and
              (mae.mpnfac, h51.hcprccod,hiscsec ) not in (select   mae2.mpnfac,mae2.prcodi, mae2.manumfol  from hosvital.maeate2 mae2 where mae2.mpnfac = mae.mpnfac and mae2.fcptpotrn ='F' and mae2.manumfol= h51.hiscsec and  mae2.maesanup <> 'S' ) -- and mae2.prcodi=m.prcodi)

order by h51.hcfchrord, h51.hisckey ;


select * from hosvital.maeate2 where mpnfac =577620;  and prcodi='912002';
select * from hosvital.maeate2 where mpnfac =577621 and prcodi='912002';
select * from hosvital.hccom51 where hisckey='20183235' and hiscsec = 134;


select * from hosvital.maeate2 where mpnfac in (577620,577621) and  fcptpotrn ='F' and maesanup <> 'S' and manumfol=134; 

-- facturo
/*
911005   	
911021   	
911021   	
911107   	
911107   	

*/
-- MAS OPTIMIZADO


select mae.mpnfac,h51.hcfchrord fecha_ordenado,h51.hiscsec folio, c.mptdoc tipodoc,c.mpcedu Documento,c.mpnomc paciente,h51.hcprccod cod_proc, m.prnomb as procedimiento,h51.hcprccns,  h51.hcprcest  estado, h51.hctvin51, h.homprocnt, h.homprovlr
from hosvital.hccom51  h51
inner join hosvital.maeate mae on (mae.mptdoc = h51.histipdoc and mae.mpcedu = h51.hisckey and mae.mactving = h51.hctvin51 and mae.maestf not in ('1','10'))
inner join hosvital.capbas c on (c.mptdoc=h51.histipdoc and c.mpcedu=h51.hisckey)
inner join hosvital.maepro m on (m.prcodi= h51.hcprccod)
inner join hosvital.portar1 p1 on (p1.ptcodi= mae.mpptcodi and p1.prcodi=h51.hcprccod )
inner join hosvital.homproc h on (h.prcodi=p1.prcodi and h.trfcod=p1.trfcod and h.homprocod=p1.prcodi)
where h51.hcfchrord >= '2019-01-01 00:00:00' and h51.hcfchrord <= '2019-12-31 23:59:59'  and  h51.hcprcest= 'O' and h51.hctvin51 <> 0 and h51.hisckey='20183235' and h51.hiscsec=134 and mae.mpnfac =577621 and
              (mae.mpnfac, h51.hcprccod,hiscsec ) not in (select   mae2.mpnfac,mae2.prcodi, mae2.manumfol  from hosvital.maeate2 mae2 where mae2.mpnfac = mae.mpnfac and mae2.fcptpotrn ='F' and mae2.manumfol= h51.hiscsec and  mae2.maesanup <> 'S' ) 
       and 
   h51.hcprccns = (select max(h511.hcprccns)  from hosvital.hccom51 h511 where h511.histipdoc=h51.histipdoc and h511.hisckey=h51.hisckey and h511.hiscsec= h51.hiscsec and h511.hctvin51= h51.hctvin51 and h511.hcprccod = h51.hcprccod)

order by h51.hcfchrord, h51.hisckey ;


-- GLOBAL

select mae.mpnfac,h51.hcfchrord fecha_ordenado,h51.hiscsec folio, c.mptdoc tipodoc,c.mpcedu Documento,c.mpnomc paciente,h51.hcprccod cod_proc, m.prnomb as procedimiento,h51.hcprccns,  h51.hcprcest  estado, h51.hctvin51, h.homprocnt, h.homprovlr
from hosvital.hccom51  h51
inner join hosvital.maeate mae on (mae.mptdoc = h51.histipdoc and mae.mpcedu = h51.hisckey and mae.mactving = h51.hctvin51 and mae.maestf not in ('1','10'))
inner join hosvital.capbas c on (c.mptdoc=h51.histipdoc and c.mpcedu=h51.hisckey)
inner join hosvital.maepro m on (m.prcodi= h51.hcprccod)
inner join hosvital.portar1 p1 on (p1.ptcodi= mae.mpptcodi and p1.prcodi=h51.hcprccod )
inner join hosvital.homproc h on (h.prcodi=p1.prcodi and h.trfcod=p1.trfcod and h.homprocod=p1.prcodi)
where h51.hcfchrord >= '2019-01-01 00:00:00' and h51.hcfchrord <= '2019-12-31 23:59:59'  and  h51.hcprcest= 'O' and h51.hctvin51 <> 0  and 
              (mae.mpnfac, h51.hcprccod,hiscsec ) not in (select   mae2.mpnfac,mae2.prcodi, mae2.manumfol  from hosvital.maeate2 mae2 where mae2.mpnfac = mae.mpnfac and mae2.fcptpotrn ='F' and mae2.manumfol= h51.hiscsec and  mae2.maesanup <> 'S' ) 
       and 
   h51.hcprccns = (select max(h511.hcprccns)  from hosvital.hccom51 h511 where h511.histipdoc=h51.histipdoc and h511.hisckey=h51.hisckey and h511.hiscsec= h51.hiscsec and h511.hctvin51= h51.hctvin51 and h511.hcprccod = h51.hcprccod)

order by h51.hcfchrord, h51.hisckey ;

--GLOBAL SI FACTURADOS

select * from hosvital.maeate2;

select mae.mpnfac,h51.hcfchrord fecha_ordenado,h51.hiscsec folio, c.mptdoc tipodoc,c.mpcedu Documento,c.mpnomc paciente,h51.hcprccod cod_proc, m.prnomb as procedimiento,h51.hcprccns,  h51.hcprcest  estado, h51.hctvin51, m2.macanpr, m2.mavatp
from hosvital.hccom51  h51
inner join hosvital.maeate mae on (mae.mptdoc = h51.histipdoc and mae.mpcedu = h51.hisckey and mae.mactving = h51.hctvin51 and mae.maestf not in ('1','10'))
inner join hosvital.capbas c on (c.mptdoc=h51.histipdoc and c.mpcedu=h51.hisckey)
inner join hosvital.maepro m on (m.prcodi= h51.hcprccod)
inner join hosvital.maeate2 m2 on (m2.matipdoc=mae.matipdoc and m2.mpnfac=mae.mpnfac and m2.prcodi= h51.hcprccod and m2.manumfol = h51.hiscsec)
where h51.hcfchrord >= '2019-01-01 00:00:00' and h51.hcfchrord <= '2019-12-31 23:59:59'  and  h51.hcprcest= 'O' and h51.hctvin51 <> 0  and 
              (mae.mpnfac, h51.hcprccod,hiscsec ) not in (select   mae2.mpnfac,mae2.prcodi, mae2.manumfol  from hosvital.maeate2 mae2 where mae2.mpnfac = mae.mpnfac and mae2.fcptpotrn ='F' and mae2.manumfol= h51.hiscsec and  mae2.maesanup <> 'S' ) 
       and 
   h51.hcprccns = (select max(h511.hcprccns)  from hosvital.hccom51 h511 where h511.histipdoc=h51.histipdoc and h511.hisckey=h51.hisckey and h511.hiscsec= h51.hiscsec and h511.hctvin51= h51.hctvin51 and h511.hcprccod = h51.hcprccod)

order by h51.hcfchrord, h51.hisckey ;


