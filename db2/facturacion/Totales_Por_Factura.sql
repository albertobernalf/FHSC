/*

Año
Mes
Número de Factura
Identificación de Paciente
Nombre y Apellido Edad
Asegurador
Valor Total
*/

select year(m.facfch) ano, month(m.facfch) mes, m.mpnfac factura, cap.mpnomc paciente, (days(m.facfch) - days(cap.mpfchn) )/360 edad, mae.menomb aseguradora, m.mavals valor_total
from hosvital.maeate m
inner join hosvital.capbas cap on (cap.mptdoc=m.mptdoc and cap.mpcedu= m.mpcedu)
inner join hosvital.maeemp mae on (mae.mennit=m.mpmeni)
where m.facfch>= '2021-07-01' and m.facfch <= '2021-07-31'
order by m.mpnfac;