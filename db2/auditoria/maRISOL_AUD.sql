select * from hosvipru.audserv  where autcedu ='17032021' and autfolio =0 order by autfecsol;

select * from hosviPRU.audserv2 where doccod='AU7' AND autcsc = 26432;
select * from hosvipru.audserv3 where  doccod='AU7' AND autcsc = 26432;

select * from hosvipru.audserv1 where doccod='AU7' AND autcsc = 26432;

SELECT * FROM HOSVIPRU.MAEPRO WHERE PRCODI='808073';
SELECT * FROM HOSVIPRU.MAEPRO WHERE PRCODI='REF01';
--.BÑ?Ñ>>>ÑB	


create table hosvipru.usrdesencripta (ausrid character(10), documento character(20) , nombre character(100));

iNsert into hosvipru.usrdesencripta values ('.BÑ?Ñ>>>ÑB','1026255520','MARISOL GARZON');

SELECT * FROM hosvipru.usrdesencripta;

SELECT a.autfecsol fecha_solicitud, a.authorsol hora,cap.mptdoc tipo_doc,cap.mpcedu documento,cap.mpnomc paciente,a.autcsc consecutivo,a2.AUTSERVFCH as registro, A2.AUTSERVOBS observaciones, des.documento documento_usuario, des.nombre nombre_usuario
FROM hOSVIPRU.AUDSERV A
inner join hosvipru.audserv2 a2 on (a2.empcod=a.empcod and a2.doccod=a.doccod and a2.autcsc=a.autcsc)
inner join hosvipru.capbas cap on (cap.mptdoc = a.auttipdoc and cap.mpcedu = a.autcedu)
INNER JOIN hosvipru.usrdesencripta des on (des.ausrid = a2.autservusu)
WHERE A.EMPCOD='01' AND A.DOCCOD='AU7' and  a.autfecsol >= '2021-06-01';