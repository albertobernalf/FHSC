
select adm.AUSRID, adm.AUSRDSC,adm.ausrest, mae1.MMNOMM ,mae1.MMUSUARIO,mae1.mmestado,mae1.mmcodm
 from
 hosvital.admusr adm
inner join hosvital.maemed1  mae1 on (mae1.mmusuario = adm.ausrid)
where adm.ausresT='N' and mae1.mmestado=  'A';

-- Hay 484 Registros


update hosvital.maemed1 mae
set mae.mmestado= 'I'
where mae.mmcodm in ('AU270')  and mae.mmcodm in (select mae2.mmcodm
                                            		from hosvital.admusr adm
			inner join hosvital.maemed1  mae2 on (mae2.mmusuario = adm.ausrid)
			where adm.ausresT='N' and mae2.mmestado=  'A');

                                                 