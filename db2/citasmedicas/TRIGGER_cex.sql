SELECT * FROM HOSVITAL.CITMED where citfec>= '2020-03-01' order by citfec;
select * from HOSVITAL.citmed1;
select * from HOSVITAL.consul;
select * from HOSVITAL.citmed2;
select * from HOSVITAL.maemed1;
select * from HOSVITAL.maeesp;


drop view vista_cex;


create view vista_cex  as
select c.citnum as cita, c.citfec as fecha,c.cithori as hora,consul.consdet as consultorio,esp.menome as especialidad,mae.mmnomm as medico, cap.mpnomc as paciente,
case when c.citestp='F' then 'Facturada'   when c.citestp='N' then 'Cancelada'  when c.citestp='C' then 'Confirmada'  when c.citestp='R' then 'Reservada'  when c.citestp='I' then 'Incumplida'  when c.citestp='C' then 'Confirmada'  end as estado_cta
from HOSVITAL.citmed c
inner join HOSVITAL.citmed1 c1 on (c1.citnum=c.citnum)
inner join HOSVITAL.citmed2 c2 on (c2.citnum=c1.citnum)
inner join HOSVITAL.capbas cap on (cap.mptdoc=c1.cittipdoc and  cap.mpcedu=c1.citced)
inner join HOSVITAL.consul consul on (consul.conscod=c.citcons)
inner join HOSVITAL.maemed1 mae on (mae.mmcodm=c2.mmcodm)
inner join HOSVITAL.maeesp esp on (esp.mecode=c2.mecode)
where c.citfec='2020-05-20' ;
--order by c.citcons,c.citfec,cithori;

-- El query dinamcio seria :


select c.citnum as cita, c.citfec as fecha,c.cithori as hora,consul.conscod as consultorio,esp.menome as especialidad,mae.mmnomm as medico, cap.mpnomc as paciente,
case when c.citestp='F' then 'Facturada' 
 when c.citestp='N' then 'Cancelada' 
 when c.citestp='C' then 'Confirmada' 
 when c.citestp='R' then 'Reservada' 
 when c.citestp='I' then 'Incumplida' 
 when c.citestp='C' then 'Confirmada'  end as estado_cta
from HOSVITAL.citmed c
inner join HOSVITAL.citmed1 c1 on (c1.citnum=c.citnum)
inner join HOSVITAL.citmed2 c2 on (c2.citnum=c1.citnum)
inner join HOSVITAL.capbas cap on (cap.mptdoc=c1.cittipdoc and  cap.mpcedu=c1.citced)
inner join HOSVITAL.consul consul on (consul.conscod=c.citcons)
inner join HOSVITAL.maemed1 mae on (mae.mmcodm=c2.mmcodm)
inner join HOSVITAL.maeesp esp on (esp.mecode=c2.mecode)
where c.citfec='2020-05-21' and  c.citestp in ('C','R') and (concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(consul.conscod,' '),  mae.mmnomm) ,' ') ,esp.menome),   ' ')  ,          cast( c.citfec as varchar(12))),' ')            ,c.cithori),' '),c.citestp),' '),cap.mpnomc)  ) = (select min (concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(consulx.conscod,' '),  maex.mmnomm) ,' ') ,espx.menome),   ' ')  ,           cast(cx.citfec as varchar(12))),' ')            ,cx.cithori),' '),cx.citestp),' ') ,capx.mpnomc)  )
												from HOSVITAL.citmed cx
												inner join HOSVITAL.citmed1 cx1 on (cx1.citnum=cx.citnum)
												inner join HOSVITAL.citmed2 cx2 on (cx2.citnum=cx1.citnum)
												inner join HOSVITAL.capbas capx on (capx.mptdoc=cx1.cittipdoc and  capx.mpcedu=cx1.citced)
												inner join HOSVITAL.consul consulx on (consulx.conscod=cx.citcons)
												inner join HOSVITAL.maemed1 maex on (maex.mmcodm=cx2.mmcodm)
												inner join HOSVITAL.maeesp espx on (espx.mecode=cx2.mecode)
												where cx.citfec='2020-05-21' and  cx.citestp in ('C','R')     )
order by c.citcons,c.citfec,cithori;

-- Creacion de la vista



drop view HOSVITAL.vista_cex;


create view HOSVITAL.vista_cex as
select c.citnum as cita, c.citfec as fecha,c.cithori as hora,consul.conscod as consultorio,esp.menome as especialidad,mae.mmnomm as medico, cap.mpnomc as paciente,
case when c.citestp='F' then 'Facturada'   when c.citestp='N' then 'Cancelada'  when c.citestp='C' then 'Confirmada'  when c.citestp='R' then 'Reservada'  when c.citestp='I' then 'Incumplida'  when c.citestp='C' then 'Confirmada'  end as estado_cta
from HOSVITAL.citmed c,HOSVITAL.citmed1 c1, HOSVITAL.citmed2 c2 , HOSVITAL.capbas cap , HOSVITAL.consul consul , HOSVITAL.maemed1 mae , HOSVITAL.maeesp esp 
where c.citfec='2020-05-21'  and c1.citnum=c.citnum and c2.citnum=c1.citnum and cap.mptdoc=c1.cittipdoc and  cap.mpcedu=c1.citced and consul.conscod=c.citcons and mae.mmcodm=c2.mmcodm  and esp.mecode=c2.mecode and  c.citestp in ('C','R')
;

select * from HOSVITAL.vista_cex order by consultorio,fecha, hora;

select count(*) from HOSVITAL.vista_cex ; -- 61


--Query dinamico 2



drop view HOSVITAL.vista_cex;


create view HOSVITAL.vista_cex as
select c.citnum as cita, c.citfec as fecha,c.cithori as hora,consul.conscod as consultorio,esp.menome as especialidad,mae.mmnomm as medico, cap.mpnomc as paciente,
case when c.citestp='F' then 'Facturada' 
when c.citestp='A' then 'Atendido' 
 when c.citestp='N' then 'Cancelada' 
 when c.citestp='R' then 'Reservada' 
 when c.citestp='I' then 'Incumplida' 
 when c.citestp='C' then 'Confirmada'  end as estado_cita,0 as pantalla, 0 as atendido
from HOSVITAL.citmed c
inner join HOSVITAL.citmed1 c1 on (c1.citnum=c.citnum)
inner join HOSVITAL.citmed2 c2 on (c2.citnum=c1.citnum)
inner join HOSVITAL.capbas cap on (cap.mptdoc=c1.cittipdoc and  cap.mpcedu=c1.citced)
inner join HOSVITAL.consul consul on (consul.conscod=c.citcons)
inner join HOSVITAL.maemed1 mae on (mae.mmcodm=c2.mmcodm)
inner join HOSVITAL.maeesp esp on (esp.mecode=c2.mecode)
where c.citfec>='2020-05-29' and  c.citestp in ('C','R') and (concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(consul.conscod,' '),  mae.mmnomm) ,' ') ,esp.menome),   ' ')  ,          cast( c.citfec as varchar(12))),' ')            ,c.cithori),' '),c.citestp),' '),cap.mpnomc)  ) = (select min( concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(consulx.conscod,' '),  maex.mmnomm) ,' ') ,espx.menome),   ' ')  ,           cast(cx.citfec as varchar(12))),' ')            ,cx.cithori),' '),cx.citestp),' ') ,capx.mpnomc)  )
												from HOSVITAL.citmed cx
												inner join HOSVITAL.citmed1 cx1 on (cx1.citnum=cx.citnum)
												inner join HOSVITAL.citmed2 cx2 on (cx2.citnum=cx1.citnum)
												inner join HOSVITAL.capbas capx on (capx.mptdoc=cx1.cittipdoc and  capx.mpcedu=cx1.citced)
												inner join HOSVITAL.consul consulx on (consulx.conscod=cx.citcons)
												inner join HOSVITAL.maemed1 maex on (maex.mmcodm=cx2.mmcodm)
												inner join HOSVITAL.maeesp espx on (espx.mecode=cx2.mecode)
												where cx.citfec>='2020-05-29' and  cx.citestp in ('C','R')   and capx.mptdoc=c1.cittipdoc and  capx.mpcedu=c1.citced


  );

select * from HOSVITAL.vista_cex order by fecha,CONSULTORIO, hora;

	

select citnum,citestp , citfec from HOSVITAL.citmed where CITFEC >= '2020-05-20' ORDER BY CITFEC;

select * from HOSVITAL.citmed1 where citnum= 547936;

-- DROP VIEW HOSVINEW.vista_cex;

select * from hosvinew.vista_cex2;

--  Generar SQL 
--  Versión:                   	V7R1M0 100423 
--  Generado en:              	01/06/20 09:44:22 
--  Base de datos relacional:       	S10B409T 
--  Opción de estándares:          	DB2 for i 
CREATE OR REPLACE TRIGGER HOSVINEW.vistacex2
	AFTER  INSERT ON HOSVINEW.CITMED
	FOR EACH ROW 
	MODE DB2SQL 
	SET OPTION  ALWBLK = *ALLREAD , 
	ALWCPYDTA = *OPTIMIZE , 
	COMMIT = *NONE , 
	DECRESULT = (31, 31, 00) , 
	DFTRDBCOL = *NONE , 
	DYNDFTCOL = *NO , 
	DYNUSRPRF = *USER , 
	SRTSEQ = *HEX   
	INSERT INTO HOSVINEW.VISTA_CEX2 ( CITA , LLAMADA , ATENDIDO ) 
SELECT CITNUM, 0,0 FROM HOSVINEW.CITMED ORDER BY HOSVINEW.CITMED.CITNUM DESC FETCH FIRST 1 ROW ONLY    ;





SELECT * FROM HOSVINEW.MAEMED1 WHERE MMNOMM LIKE ('%BERNAL%');
SELECT *  FROM HOSVINEW.MAEMED WHERE MMCODM='MG746';

SELECT * FROM HOSVINEW.CITMED WHERE CITFEC>= '2020-03-30' ORDER BY CITNUM; -- MG746	
SELECT COUNT(*) FROM HOSVINEW.VISTA_CEX2;  -- 54800909  -- 41162	
	

SELECT * FROM HOSVINEW.VISTA_CEX2;
SELECT * FROM HOSVINEW.CITMED WHERE  CITFEC >='2020-06-01';
DELETE FROM HOSVINEW.VISTA_CEX2 WHERE  CITA =  54800909	;