/*
Reciban un cordial y respetuoso saludo,

De la manera mas atenta me dirijo a ustedes con el fin de solicitar su valiosa colaboración generando informe de todo lo radicado por entidad, en la siguiente forma:

NUMERO FACTURA
NOMBRE USUARIO FACTURADO
TIPO ID
IDENTIFICACION
FECHA EGRESO   (DD/MM/AA)
FECHA FACTURA
FECHA RADICACION
VALOR BRUTO
COPAGO PCETE
CUOTA MODERADORA
NRO NOTA CREDITO
VALOR NC
VALORNETO
	



*/

select mavals from hosvital.maeate WHERE MPNFAC = 648514; -- VER ESTA FACTURA MAÑANA
select * from hosvital.maeemp where menomb like ('%NUE%EPS%');
select * from hosvital.admglo11;

select * from hosvital.maeate2;


SELECT * FROM HOSVITAL.movcxc where mccnumobl='656216'; -- Ojo mañana mirar esta factura

SELECT m.mpnfac factura,cap.mpnomc nombre_usuario,cap.mptdoc tipoDoc,cap.mpcedu identificacion,DATE(i.ingfecegr) egreso, m.facfch fecha_factura,adm11.aglfrdfac fecha_radicacion,m.matotf valor_bruto, m.mavpAu as copago, m.mavaab as moderadora,m.manrnotcr as nro_nota_cred,
(select mx.mccvlr  from hosvital.movcxc mx where mx.doccod='NCF' AND mx.mccnumobl =cast(m.mpnfac as varchar(10)))   valor_nc,m.mavals as valor_neto
from hosvital.maeate m
inner join hosvital.ingresos i on (i.mptdoc=m.mptdoc and i.mpcedu=m.mpcedu and i.ingcsc= m.mactving)
inner join hosvital.admglo11 adm11 on (adm11.mpnfac = m.mpnfac)
inner join hosvital.capbas cap on (cap.mptdoc =m.mptdoc and cap.mpcedu = m.mpcedu)
inner join hosvital.maeemp mae on (mae.mennit = m.mpmeni)
inner join hosvital.empress emp on (emp.mecntr= mae.mecntr)
where m.facfch>= '2021-01-01' and m.facfch <= '2021-06-30' and emp.mecntr ='900156264-2'
order by m.mpnfac;
