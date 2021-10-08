select * from hosvital.ctrlcitas;
select * from hosvital.citmed;
select * from hosvital.citmed1; --  citnrocto , citced, cittipdoc
select * from hosvital.citmed2;
select * from hosvital.maeemp where menomb like ('%CAPITAL%'); -- MECNTR= 900298372-9    
select * from hosvital.capbas where mpcedu = '80912022';

select * from hosvital.maeemp where  mecntr ='900298372-9';


-- 1 Consulta


select C1.CITNUM,c.mpnom1,c.mpnom2,c.mpape1,c.mpape2,c.mptdoc,c.mpcedu,c.mptele, c.mptele1, CTRLC.CITFCHHRA,C1.CITFECSOL, C0.CITFEC,'860007373',maepro.prnomb,(C0.CITFEC  - CAST(CTRLC.CITFCHHRA AS DATE)), (C0.CITFEC - C1.CITFECSOL)
FROM hosvital.capbas c
inner join hosvital.citmed1 c1 on (c1.cittipdoc=c.mptdoc and c1.citced=c.mpcedu)
inner join hosvital.citmed c0 on (c0.citnum=c1.citnum)
inner join hosvital.ctrlcitas ctrlc on (ctrlc.citnum=c1.citnum and ctrlc.citcmbdto='RESERVADA')
inner join hosvital.maeemp mae on (mae. mennit=c1.citnrocto)
inner join hosvital.maepro maepro on (maepro.prcodi= c0.citpro and (maepro.prnomb like ('%PRIMERA%') or maepro.prnomb like ('%CONTRO%')))
WHERE C0.CITFEC >= '2021-07-01' AND C0.CITFEC <= '2021-07-31' AND mae.mecntr= '900298372-9' AND ctrlc.CITFCHHRA = (select max(ctrlc1.CITFCHHRA) from hosvital.ctrlcitas ctrlc1 where ctrlc1.citnum=ctrlc.citnum and ctrlc1.citcmbdto='RESERVADA')
order by c1.citnum;


-- Con este Excel se Pueden Sacar los Resumenes

-- Resumenes x Especialidad

select    maeesp.menome  ESPECIALIDAD, count(*) numCitasAsignadas,sum((C0.CITFEC  - CAST(CTRLC.CITFCHHRA AS DATE))),sum((C0.CITFEC - C1.CITFECSOL))    , sum((C0.CITFEC  - CAST(CTRLC.CITFCHHRA AS DATE)))/count(*)  , 	sum((C0.CITFEC - C1.CITFECSOL))/count(*)
FROM hosvital.capbas c
inner join hosvital.citmed1 c1 on (c1.cittipdoc=c.mptdoc and c1.citced=c.mpcedu)
inner join hosvital.citmed c0 on (c0.citnum=c1.citnum)
inner join hosvital.citmed2 c2 on (c2.citnum=c0.citnum)
inner join hosvital.maeesp maeesp on (maeesp.mecode = c2.mecode)
inner join hosvital.ctrlcitas ctrlc on (ctrlc.citnum=c1.citnum and ctrlc.citcmbdto='RESERVADA')
inner join hosvital.maeemp mae on (mae. mennit=c1.citnrocto)
inner join hosvital.maepro maepro on (maepro.prcodi= c0.citpro and (maepro.prnomb like ('%PRIMERA%') or maepro.prnomb like ('%CONTRO%')))
WHERE C0.CITFEC >= '2021-07-01' AND C0.CITFEC <= '2021-07-31' AND mae.mecntr= '900298372-9' AND ctrlc.CITFCHHRA = (select max(ctrlc1.CITFCHHRA) from hosvital.ctrlcitas ctrlc1 where ctrlc1.citnum=ctrlc.citnum and ctrlc1.citcmbdto='RESERVADA')
group by    maeesp.menome;





