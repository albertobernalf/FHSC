

SELECT * FROM HOSVITAL.CAPBAS WHERE MPCEDU = '20858903';

set schema hosvital;

select * from hosvital.ingresos where mpcedu='20858903';
update  hosvital.ingresos set MPTDOC='CC' where mpcedu='20858903';

select * from hosvital.hccom where hisckey='20858903';
update hosvital.hccom set histipdoc='CC' where  histipdoc='CE' and hisckey='20858903';

select * from hosvital.hccom1 where hisckey='20858903';
update hosvital.hccom1 set histipdoc='CC' where  histipdoc='CE' and hisckey='20858903';

select * from hosvital.maepab1 where mpuced='20858903';
--update hosvital.maepab1 set mpudoc='CC' where mpuced='20858903';

select * from hosvital.DSPFRMC where hisckey='20858903';
update hosvital.DSPFRMC set histipdoc='CC' where histipdoc = 'CE' and  hisckey='20858903';

select * from hosvital.dspfrmc1 where hisckey='20858903';
update hosvital.dspfrmc1 set  histipdoc='CC'  where histipdoc='CE' and hisckey='20858903';

select * from hosvital.DSPFRMC11 where hisckey='20858903';

select * from hosvital.hccom1des where histipdoc='CE' and hisckey='20858903';
update hosvital.HCCOM1DES set  histipdoc='CC'  where  histipdoc='CE' and hisckey='20858903';

select * from hosvital.hccom33 where hisckey='20858903';
update hosvital.hccom33 set  histipdoc='CC'   where histipdoc='CE' and hisckey='20858903';

select * from hosvital.HCCOM44 where hisckey='20858903';

select * from hosvital.hccom5 where hisckey='20858903';
update hosvital.hccom5 set  histipdoc='CC'  where  histipdoc='CE' and hisckey='20858903';

select * from hosvital.hccom51 where hisckey='20858903';
update hosvital.hccom51 set  histipdoc='CC' where  histipdoc='CE' and hisckey='20858903';

select * from hosvital.hccom511 where hisckey='20858903';

select * from hosvital.hccom512 where hisckey='20858903';

select * from hosvital.hccom513 where hisckey='20858903';

select * from hosvital.hccom51r where hisckey='20858903';
update hosvital.hccom51r set histipdoc='CC'  where histipdoc='CE' and  hisckey='20858903';

select * from hosvital.hccom6 where hisckey='20858903';

select * from hosvital.hccom61 where hisckey='20858903';

select * from hosvital.hccom7 where hisckey='20858903';

select * from hosvital.hccom8 where hisckey='20858903';

select * from hosvital.hccom9 where hisckey='20858903';

select * from hosvital.hccomevos where hisckey='20858903';
update hosvital.hccomevos set histipdoc='CC'  where histipdoc='CE' and hisckey='20858903';


select * from hosvital.frmsmns where hisckey='20858903';
update hosvital.frmsmns set histipdoc='CC'  where histipdoc='CE' and hisckey='20858903';

select * from hosvital.frmsmns1 where hisckey='20858903';
update hosvital.frmsmns1 set histipdoc='CC'  where histipdoc='CE' and hisckey='20858903';

select * from hosvital.frmsmnsam where mpcedu='20858903';

select * from hosvital.frmsmnsc where hisckey='20858903'; -- Nop

select * from hosvital.maepab11 where mpcedu='20858903';
update hosvital.maepab11 set mptdoc='CC' where mptdoc='CE' and mpcedu='20858903';

select * from hosvital.capbas where mpcedu='20858903';
update hosvital.capbas set mptdoc='CC'  where mptdoc='CE' and mpcedu='20858903';

select * from hosvital.tmpfac where tfcedu='20858903';
update hosvital.tmpfac set tftdoc = 'CC' where tftdoc='CE' and tfcedu='20858903';

select * from hosvital.tmpfac1 where tfcedu='20858903';
update hosvital.tmpfac1 set tftdoc = 'CC' where   tftdoc='CE' and tfcedu='20858903';

select * from hosvital.tmpfac2 where tfcedu='20858903';
update hosvital.tmpfac2 set tftdoc = 'CC' where tftdoc='CE' and tfcedu='20858903';

select * from hosvital.tmpfac3 where tfcedu='20858903';
update hosvital.tmpfac3 set tftdoc = 'CC'  where tftdoc='CE' and tfcedu='20858903';

select * from hosvital.tmpfac4 where tfcedu='20858903';
update hosvital.tmpfac4 set tftdoc = 'CC' where tftdoc='CE' and tfcedu='20858903';

select * from hosvital.maepac where mpcedu='20858903';
update hosvital.maepac set mptdoc='CC'  where mptdoc='CE' and mpcedu='20858903';

select * from hosvital.abonos where mpcedu='20858903';
update hosvital.abonos set mptdoc='CC'  where mptdoc='CE' and mpcedu='20858903';

select * from hosvital.abonos1 where abonum = 166070;


select * from hosvital.citmed1 where citced='20858903';

update hosvital.citmed1 set cittipdoc='CC' where citced='20858903';

select * from hosvital.procir where mpcedu='20858903';
update hosvital.procir set mptdoc='CC' where mptdoc='CE' and mpcedu='20858903';

select * from hosvital.descirmed where cedpac='20858903';
--update hosvital.descirmed set cedpac='20858903' where cedpac='20858903'; -- Nofunciona

select * from hosvital.intercn where hisckey='20858903';
update hosvital.intercn set histipdoc='CC'  where histipdoc='CE' and hisckey='20858903';

select * from hosvital.liquidos where hisckey='20858903';
update hosvital.liquidos set histipdoc='CC' where  histipdoc='CE' and hisckey='20858903';

select * from hosvital.liquidos1 where hisckey='20858903';
update hosvital.liquidos1 set histipdoc='CC'  where histipdoc='CE' and  hisckey='20858903';

select * from hosvital.hccom3des where hisckey='20858903';
update hosvital.hccom3des set histipdoc='CC' where histipdoc='CE' and hisckey='20858903';

select * from hosvital.hccom2des where hisckey='20858903';
update hosvital.hccom2des set histipdoc='CC'  where histipdoc='CE' and hisckey='20858903';

select * from hosvital.sgnvtlh where hisckey='20858903';
update hosvital.sgnvtlh set histipdoc='CC'  where histipdoc='CE' and hisckey='20858903';

select * from hosvital.incpac where incdocafi='20858903';

select * from hosvital.datsoat where mpcedu='20858903';

select * from hosvital.epiman where mpcedu='20858903';

select * from hosvital.epimandes where mpcedu='20858903';

select * from hosvital.movinv4 where mvtodocpac='20858903';
update hosvital.movinv4 set mvtotdocpac='CC' where mvtotdocpac= 'CE' and mvtodocpac='20858903';

select * from hosvital.refcref where mpcedu='20858903';
update hosvital.refcref set mptdoc='CC' where mptdoc= 'CE' and mpcedu='20858903';

select * from hosvital.Turqui where tuqpacid='20858903';
update hosvital.turqui set tuqtipdoc='CC' where tuqtipdoc='CE' and  tuqpacid='20858903';

select * from hosvital.mezclas;

select * from hosvital.citmed11 where citced='20858903';

select * from hosvital.ctrcopgo where mpcedu='20858903';

update  hosvital.ctrcopgo set mptdoc='CC' where mptdoc='CC' and mpcedu='20858903';

select * from hosvital.ctrlcitas where citced='20858903';

update  hosvital.ctrlcitasset cittipdoc='CC'  where cittipdoc='CE' and citced='20858903';

select * from hosvital.hcante  where hisckey='20858903';



select * from hosvital.doccongen where mpcedu='20858903';

select * from hosvital.hojagasto where hisckey='20858903';

select * from hosvital.kardex1 where movcodpac='20858903';
update hosvital.kardex1 set movtipdoc= 'CC'  where movtipdoc= 'CE' and movcodpac='20858903';

select * from hosvital.maeate where mpcedu='20858903';

update hosvital.maeate set mptdoc='CC' where mptdoc='CE' and mpcedu='20858903';

select * from hosvital.ctcmenp where ctnumid='20858903';

select * from hosvital.videodx where hisckey='20858903';

select * from hosvital.imaper where imaced='20858903';

select * from hosvital.imapronq where hisckey='20858903';
-- update hosvital.imapronq set hisckey='20858903' where hisckey='20858903';

select * from hosvital.imareqing where imadocpac='20858903';

select * from hosvital.maeing where mpcedu='20858903';

select * from hosvital.ingresomp where mpcedu='20858903';
update hosvital.ingresomp set mptdoc='CC' where mptdoc='CE' and mpcedu='20858903';

select * from hosvital.autratn where mpcedu='20858903';

select * from hosvital.hisdatusu where mpcedu='20858903';

select * from hosvital.temnit where tfcedu='20858903';
--update hosvital.temnit set tfcedu='20858903' where tfcedu='20858903';

select * from hosvital.tempro where tfcedu='20858903';
--update hosvital.tempro set tfcedu='20858903' where tfcedu='20858903';

select * from hosvital.temsum where tfcedu='20858903';
--update hosvital.temsum set tfcedu='20858903' where tfcedu='20858903';

select * from hosvital.monenf where hisckey='20858903';

select * from hosvital.monenf1 where hisckey='20858903';

select * from hosvital.hcdiagn where hisckey='20858903';
update hosvital.hcdiagn set histipdoc='CC' where histipdoc='CE' and hisckey='20858903';

select * from hosvital.hctriage where hisckey='20858903';

select * from hosvital.pacientes where cedulamsp='20858903';

select * from hosvital.rediatmp where rediced='20858903';

select * from hosvital.smovinv3 where smvtdocpac='20858903';
update hosvital.smovinv3 set smvttdocpac='CC' where smvttdocpac='CC' and smvtdocpac='20858903';

select * from hosvital.frmesqdef where hisckey='20858903';

select * from hosvital.frmsmhu where hisckey='20858903';

select * from hosvital.frmsmnsc  where hisckey='20858903';
update hosvital.frmsmnsc set histipdoc='CC'  where histipdoc='CC' and  hisckey='20858903';


select * from hosvital.cortfac where  tfcedu='20858903';

select * from hosvital.RslPrc1 where hcprccod='20858903';



