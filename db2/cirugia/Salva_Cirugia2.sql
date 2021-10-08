
select procircod,profsep, profec from hosvital.procir where profsep > '2020-04-19' order by  procircod;


-- Query de Exportacion

select concat(concat(concat(concat(concat(concat(concat(concat(concat(concat('INSERT INTO hosvital.cir_procir_bak  values (', procircod) ,','),''''), cast(profsep as character(10))),''''),','),''''), cast(profec as character(10))),''''),');')
 from hosvipru.procir 
where profsep >= '2020-06-12'  and profsep <= '2020-06-25'
order by  procircod;