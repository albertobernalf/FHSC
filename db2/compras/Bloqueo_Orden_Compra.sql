select * from HOSVITAL.ENTRALM
where   ENTANRO in (45330 ,45600 );




UPDATE HOSVITAL.ENTRALM
SET ENTINDUSO='N',ENTUSUUSO=''
where entanro in (45330 ,45600 );