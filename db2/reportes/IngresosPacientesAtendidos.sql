-- Paciente facturdos
-- de todos losservicos

--servicio, pabellon, cama, especialidad,eps,cedula,nombre paciente, fecha de ingreso,
--por la fechade ingreso
--ingresos pacientes atendifosos

select * from hosvital.ingresos;  -- INGESMT
select * from hosvital.maepab;
select * from hosvital.maeemp;

select * from hosvital.maeate;


select case i.clapro when '1' THEN 'AMBULATORIO' when '2' then 'HOSPITALIZACION' when '3' THEN 'URGENCIAS' when '4' then 'TRATAMIENTO ESPECIAL' when '5' THEN 'URGENCIAS' end as servicio
, mp.mpnomp as pabellon,i.mpnumc as cama_ingreso, mm.faccodcam as cama_salida,mae.menome as especialidad_ingreso,m.menomb as contrato , c.mpnomc as paciente,
i.ingfecadm as ingreso from hosvital.capbas c inner join hosvital.ingresos i on (i.mptdoc=c.mptdoc and i.mpcedu=c.mpcedu) inner join hosvital.maepab mp on (mp.mpcodp=i.mpcodp)
inner join hosvital.maeemp m on (m.mennit=i.ingnit) left join hosvital.maeate mm on (mm.mptdoc=i.mptdoc and mm.mpcedu=i.mpcedu and mm.mactving = i.ingcsc) inner join hosvital.maeesp mae on (mae.mecode=i.ingesmt)
where i.ingfecadm >= '2019-01-01 00:00:00' and i.ingfecadm<= '3019-04-30 23:59:59' order by i.ingfecadm

/** Acotado **/

select case i.clapro when '1' THEN 'AMBULATORIO' when '2' then 'HOSPITALIZACION' when '3' THEN 'URGENCIAS' when '4' then 'TRATAMIENTO ESPECIAL' when '5' THEN 'URGENCIAS' end as servicio
, mp.mpnomp as pabellon,i.mpnumc as cama_ingreso, mm.faccodcam as cama_salida,mae.menome as especialidad_ingreso,m.menomb as contrato , c.mpnomc as paciente,
i.ingfecadm as ingreso from hosvital.capbas c inner join hosvital.ingresos i on (i.mptdoc=c.mptdoc and i.mpcedu=c.mpcedu) inner join hosvital.maepab mp on (mp.mpcodp=i.mpcodp)
inner join hosvital.maeemp m on (m.mennit=i.ingnit) left join hosvital.maeate mm on (mm.mptdoc=i.mptdoc and mm.mpcedu=i.mpcedu and mm.mactving = i.ingcsc) inner join hosvital.maeesp mae on (mae.mecode=i.ingesmt)
where i.ingfecadm >=? and i.ingfecadm<=? order by i.ingfecadm

/**********************/
