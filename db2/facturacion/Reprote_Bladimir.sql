
select * from hosvital.maeemp3 where mennit='290';   --  ,tuco1 = regimen contributivo

select * from hosvital.maepac ;

select *from hosvital.ingresos;

select * from hosvital.maepab1 where mpdisp=1 order by mpcodp,mpnumc;


/*
CAMA
PACIENTE
DOCUMENTO
EDAD
EPS
DIAS DE ESTANCIA
RANGO COPAGO
*/

select mae1.mpnumc,cap.mptdoc,cap.mpcedu,cap.mpnomc,(i.ingfecadm - cap.mpfchn)/360 ,i.ingnit,'dias_estancia',mtucod, mtcodp
from hosvital.maepab1 mae1
inner join hosvital.ingresos i  on (i.mptdoc = mae1.mpudoc  and i.mpcedu =mae1.mpuced and i.ingcsc=mae1.mpctvin)
inner join hosvital.maepac maepac on (maepac.mptdoc = i.mptdoc and maepac.mpcedu = i.mpcedu and maepac.mennit=i.ingnit)
inner join hosvital.capbas cap on (cap.mptdoc = i.mptdoc and cap.mpcedu = i.mpcedu)
where   mae1.mpdisp=1 
order by mae1.mpcodp,mae1.mpnumc;

select * from hosvital.maepab1 where mpuced='5044870';
select * from hosvital.ingresos where mpcedu='5044870';
select * from hosvital.maepac where mpcedu='5044870';
select * from hosvital.capbas  where mpcedu='5044870';
