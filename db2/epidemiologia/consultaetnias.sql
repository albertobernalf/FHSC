select * from hosvital.etnias;
select * from hosvital.capbas;
select * from hosvital.maeocu order by mocodi;


select i.mptdoc, i.mpcedu, c.mpnomc,et.mpdscet etnia,ocu.modesc ocupacion, niv.NivEdDsc nivel_educativ
from hosvital.ingresos i 
inner join hosvital.capbas c on (c.mptdoc =  i.mptdoc and c.mpcedu =  i.mpcedu)
left join hosvital.maeocu ocu on (ocu.mocodi =  case when c.MOCodPri ='' then 0 else  c.MOCodPri end)
left join hosvital.etnias et on (et.mpcodet  =  case when c.mpcodetn= '' then '4' else  c.mpcodetn end )
left join hosvital.nivedu niv on (niv.NivEdCo =  c.MPNivEdu)
where i.ingfecadm >= '2020-09-01 00:00:00' and i.ingfecadm <= '2020-09-30 23:59:59' 
order by i.mptdoc,i.mpcedu;

--CC 	88272198       
-- cc 900532504      	
	

select * from hosvital.ingresos where ingfecadm >= '2020-09-01 00:00:00' and ingfecadm <= '2020-09-30 23:59:59' and  mpcedu >= '88272100' order by mptdoc,mpcedu;

select  mptdoc, mpcedu,  from hosvital.ingresos where ingfecadm >= '2020-09-01 00:00:00' and ingfecadm <= '2020-09-30 23:59:59' and  mpcedu >= '88272100' order by mptdoc,mpcedu;
select * from hosvital.capbas where mpcedu >= '88272100' order by mptdoc,mpcedu;

select mptdoc, mpcedu, mpnomc, MOCodPri, mpcodetn,MPNivEdu  from hosvital.capbas where mpcedu >= '88272198' order by mptdoc,mpcedu;

select mptdoc, mpcedu, mpnomc, MOCodPri, mpcodetn,MPNivEdu  from hosvital.capbas where mpcedu >= '900532504' order by mptdoc,mpcedu;

