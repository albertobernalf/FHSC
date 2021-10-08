--328

--Jorge Riaño

--se aplica piperacilina tazobactam 2.25 gm iv a alas 6 am y hidrocortizona a50 m g iv a las 7 am el sistema no permite su registro se pasa correo a mesa de ayuda y a jefe luz marina

--Alexander Acevedo



select * from hosvital.frmsmns where hisckey = '17180128'  AND FSMMSRESO = '0001J01C';    -- 0001J01C       	


select * from hosvital.maesum1 where msnomg  like ('%TAZOBA%');
select * from hosvital.frmsmns1 where hisckey = '17180128'    ;  -- AND FSMMSRESO = '0001J01C';   

SELECT A.HISTIPDOC AS TIPODOC,A.HISCKEY AS DOCUMENTO,c.MPNOMC AS PACIENTE, A.HISCSEC AS FOLIO,m.msreso, m.msnomg as medicamento, A.FSmFhrReg REGISTRO,A.HCFcHrDsp Fecha_Despacho,A.HCSmAut aut,
b.ASFecPApl fecha_posible_aplicacion,
b.HCFhHrAp as fecha_aplica, b.HICtvIn1 ingreso
FROM HOSVITAL.FRMSMNS A , HOSVITAL.FRMSMNS1 B, HOSVITAL.CAPBAS C, hosvital.maesum1 m
WHERE A.HISCKEY = '17180128' AND A.HISCKEY= B.HISCKEY AND A.HISTIPDOC = B.HISTIPDOC and a.FSMMSRESO = m.msreso 
	AND a.FSMMSRESO = '0001J01C'   and  A.HISCSEC = B.HISCSEC and A.HISTIPDOC = C.MPTDOC AND A.HISCKEY = C.MPCEDU;

select * from hosvital.capbas;


SELECT A.HISTIPDOC AS TIPODOC,A.HISCKEY AS DOCUMENTO,c.MPNOMC AS PACIENTE, A.HISCSEC AS FOLIO,m.msreso, m.msnomg as medicamento, 
a.hisCanSum as cantidad,a.HCSmUndCd,a.HCFSVia,HCFSFrH,
A.FSmFhrReg REGISTRO,A.HCFcHrDsp Fecha_Despacho,
	case when  A.HCFcHrDsp = '0001-01-01 00:00:00.000000' then 0 else (TIMESTAMPDIFF(4, char(A.HCFcHrDsp -A.FSmFhrReg))) end as adespacho,
A.HCSmAut aut,b.ASFecPApl fecha_posible_aplicacion, 
b.HCFhHrAp as fecha_aplica, b.HICtvIn1 ingreso
FROM HOSVITAL.FRMSMNS A
inner join HOSVITAL.FRMSMNS1 B on (b.HISCKEY= a.HISCKEY AND b.HISTIPDOC = a.HISTIPDOC and b.hiscsec = a.hiscsec)
inner join HOSVITAL.CAPBAS C on (C.MPTDOC= A.HISTIPDOC and C.MPCEDU = A.HISCKEY  )
inner join hosvital.maesum1 m  on (m.msreso =  a.FSMMSRESO )
WHERE A.HISCKEY = '40432150'  and A.FSmFhrReg >= '2019-01-23 00:00:00' and  A.FSmFhrReg <= '2019-03-28 00:00:00'
order by a.hiscsec;

select * from HOSVITAL.FRMSMNS;

/* quiery de giovanny  */

SELECT A.HISTIPDOC AS TIPODOC,A.HISCKEY AS DOCUMENTO,c.MPNOMC AS PACIENTE,  b.HICtvIn1 ingreso, A.HISCSEC AS FOLIO,b.hcsumcns,m.msreso, m.msnomg as medicamento, 
a.hisCanSum as cantidad,a.HCSmUndCd,a.HCFSVia,HCFSFrH,
A.FSmFhrReg REGISTRO,
A.HCSmAut aut,b.ASFecPApl fecha_posible_aplicacion, 
b.HCFhHrAp as fecha_aplica
FROM HOSVITAL.FRMSMNS A
inner join HOSVITAL.FRMSMNS1 B on (b.HISCKEY= a.HISCKEY AND b.HISTIPDOC = a.HISTIPDOC and b.hiscsec = a.hiscsec  and b.mscodi = a.mscodi and b.msprac = a.msprac and b.msform=a.msform and b.cnccd=a.cnccd)
inner join HOSVITAL.CAPBAS C on (C.MPTDOC= A.HISTIPDOC and C.MPCEDU = A.HISCKEY  )
inner join hosvital.maesum1 m  on (m.msreso =  a.FSMMSRESO )
WHERE A.HISCKEY = '40432150'  and A.FSmFhrReg >= '2019-01-23 00:00:00' and  A.FSmFhrReg <= '2019-03-28 00:00:00'
order by a.hiscsec;

select * from hosvital.frmsmns where hisckey = '40432150' and hiscsec = 1221;
select * from hosvital.frmsmns1 where hisckey = '40432150' and hiscsec = 1221;