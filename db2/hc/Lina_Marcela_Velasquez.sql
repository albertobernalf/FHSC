select * from hosvital.maeate2;
select * from hosvital.maeemp;

select emp.mennit,emp.menomb as contrato,m2.mpnfac factura,m2.prcodi codigo_proc,mae.prnomb procedimiento, m2.mavatp as valor
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac)
inner join hosvital.maepro mae on (mae.prcodi=m2.prcodi)
inner join hosvital.maeemp emp on (emp.mennit= m.mpmeni)
where m.mpmeni in ('AS0041','01EMCOSALUD','COL01','SS0021','CS0021','CAPITALCONT','CITAL SALUS','AS010','AS011','AS012') and m2.mafepr >= '2019-01-01 00:00:00' and m2.prcodi in ('372301') and  m2.fcptpotrn ='F' and m2.maesanup <>'S' and m.maestf not in ('1','10');


select emp.mennit,emp.menomb as contrato,m2.mpnfac factura,m2.prcodi codigo_proc,mae.prnomb procedimiento, m2.mavatp as valor
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac)
inner join hosvital.maepro mae on (mae.prcodi=m2.prcodi)
inner join hosvital.maeemp emp on (emp.mennit= m.mpmeni)
where m.mpmeni in ('92','41','155','002','UCI','FS0381','FS0380','FS0281','FS0280','FAMSUB20','FAMCONTR20') and m2.mafepr >= '2019-01-01 00:00:00' and m2.prcodi in ('378201') and  m2.fcptpotrn ='F' and m2.maesanup <>'S' and m.maestf not in ('1','10');

select emp.mennit,emp.menomb as contrato,m2.mpnfac factura,m2.prcodi codigo_proc,mae.prnomb procedimiento, m2.mavatp as valor
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac)
inner join hosvital.maepro mae on (mae.prcodi=m2.prcodi)
inner join hosvital.maeemp emp on (emp.mennit= m.mpmeni)
where m.mpmeni in ('92','41','155','002','UCI','FS0381','FS0380','FS0281','FS0280','FAMSUB20','FAMCONTR20')	 and m2.mafepr >= '2019-01-01 00:00:00' and m2.prcodi in ('378301') and  m2.fcptpotrn ='F' and m2.maesanup <>'S' and m.maestf not in ('1','10');

select emp.mennit,emp.menomb as contrato,m2.mpnfac factura,m2.prcodi codigo_proc,mae.prnomb procedimiento, m2.mavatp as valor
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac)
inner join hosvital.maepro mae on (mae.prcodi=m2.prcodi)
inner join hosvital.maeemp emp on (emp.mennit= m.mpmeni)
where m.mpmeni in ('NUEVAEPS','QUIRURGUICO','SS0110','010','011','012','013','014','023','09','2','860007373') and m2.mafepr >= '2019-01-01 00:00:00' and m2.prcodi in ('378001') and  m2.fcptpotrn ='F' and m2.maesanup <>'S' and m.maestf not in ('1','10');


select emp.mennit,emp.menomb as contrato,m2.mpnfac factura,m2.prcodi codigo_proc,mae.prnomb procedimiento, m2.mavatp as valor
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac)
inner join hosvital.maepro mae on (mae.prcodi=m2.prcodi)
inner join hosvital.maeemp emp on (emp.mennit= m.mpmeni)
where m.mpmeni in ('92','41','155','002','UCI','FS0381','FS0380','FS0281','FS0280','FAMSUB20','FAMCONTR20','AS0041','01EMCOSALUD','AS010','AS011','AS012')  and m2.mafepr >= '2019-01-01 00:00:00' and m2.prcodi in ('378501') and  m2.fcptpotrn ='F' and m2.maesanup <>'S' and m.maestf not in ('1','10');	

select emp.mennit,emp.menomb as contrato,m2.mpnfac factura,m2.prcodi codigo_proc,mae.prnomb procedimiento, m2.mavatp as valor
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac)
inner join hosvital.maepro mae on (mae.prcodi=m2.prcodi)
inner join hosvital.maeemp emp on (emp.mennit= m.mpmeni)
where m.mpmeni in ('92','41','155','002','UCI','FS0381','FS0380','FS0281','FS0280','FAMSUB20','FAMCONTR20') and m2.mafepr >= '2019-01-01 00:00:00' and m2.prcodi in ('378503','378901') and  m2.fcptpotrn ='F' and m2.maesanup <>'S' and m.maestf not in ('1','10');	

select emp.mennit,emp.menomb as contrato, m2.mpnfac factura,m2.prcodi codigo_proc,mae.prnomb procedimiento, m2.mavatp as valor
from hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac)
inner join hosvital.maepro mae on (mae.prcodi=m2.prcodi)
inner join hosvital.maeemp emp on (emp.mennit= m.mpmeni)
where m.mpmeni in ('NUEVAEPS','QUIRURGUICO','SS0110','010','011','012','013','014','023','09','2','860007373') and m2.mafepr >= '2019-01-01 00:00:00' and m2.prcodi in ('378901') and  m2.fcptpotrn ='F' and m2.maesanup <>'S' and m.maestf not in ('1','10');	