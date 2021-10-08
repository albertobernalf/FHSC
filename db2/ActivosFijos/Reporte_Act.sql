select ac.acfcod AS CODIGO,ac.acfdsc as descripcion,ac.acfser as serial,ac.ubigeocod
 from hosvital.actfij ac 
where ac.actsed='001' and ac.acffchco>= '2001-01-01' AND ac.acffchco<= '2019-07-08'  and
   ac.acfdsc like ('%UPS') or   ac.acfdsc like ('%COMPÚTA%')

order by ac.acfdsc;

select * from   hosvital.actfij where acfcod = 'FMQ000005';
select * from hosvital.cencost where cnccod='890';