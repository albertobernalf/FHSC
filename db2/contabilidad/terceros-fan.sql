SELECT * FROM HOSVITAL.TERCEROS;
SELECT * FROM HOSVITAL.movcont2;


select ter.trccod as codigo,ter.trcrazsoc as nombre, ter.trcdir direccion,ter.trctlf telefono,ter.trcemail as mail, ter.trcnit nit, ter.trcregfis as regfiscal, ter.trcresfis as responfiscal, tip.tipentdsc as tipo_entidad 
from hosvital.terceros ter 
inner join hosvital.tipent tip on (tip.tipentcod=ter.trctipent);

select ter.trccod as codigo,ter.trcrazsoc as nombre, ter.trcdir direccion,ter.trctlf telefono,ter.trcemail as mail, ter.trcnit nit, ter.trcregfis as regfiscal, ter.trcresfis as responfiscal, tip.tipentdsc as tipo_entidad 
from hosvital.terceros ter 
inner join hosvital.tipent tip on (tip.tipentcod=ter.trctipent)
INNER JOIN HOSVITAL.MOVCONT2 mov on (mov.empcod='03' and mov.mvcanio>=2010 and mov.trccod= ter.trccod)
group by ter.trccod ,ter.trcrazsoc , ter.trcdir ,ter.trctlf ,ter.trcemail , ter.trcnit , ter.trcregfis , ter.trcresfis , tip.tipentdsc 
order by ter.trccod;


