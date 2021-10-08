select * from hosvital.dspfrmc where hisckey='686338' order by hiscsec;
select * from hosvital.dspfrmc1 where hisckey='686338' order by hiscsec;


select * from hosvital.frmsmns where hisckey='686338' order by hiscsec;
select * from hosvital.frmsmns1 where hisckey='686338' order by hiscsec;
select mpestc,mpestpac from hosvital.capbas where mpcedu = '686338'; -- mpestc
select mpestc,mpestpac from hosvital.capbas;
select *  from hosvital.capbas;
select * from hosvital.capbas where mpcedu = '686338';
select * from hosvital.capbas where mpcedu = '6338';
select * from hosvital.ingresos capbas where mpcedu = '686338';
select inginduf,count(*) from hosvital.ingresos capbas  -- esta en N
group by inginduf
; --  where mpcedu = '686338';

update hosvital.ingresos set  inginduf='N' where mpcedu = '686338';

select * from hosvital.ingresos  where mpcedu = '6338';

select * from hosvital.terceros where  trcnit like ('%686338');

select * from hosvital.terceros where  trcrazsoc like ('%PEDR%ANTONI%BARRIO%');

-- salida de imnventariuo

select * from hosvital.movinv4 where mvtodocpac   like ('%6338%'); 
-- 11928955	
-- 11929741	


select * from hosvital.movinv4 where docnro= 11928955;

select * from  hosvital.hccom1 where hisckey= '686338' order by hiscsec ;
select * from  hosvital.hccom1 where hisckey= '1012453555' order by hiscsec ;

select * from hosvital.dspfrmc where hisckey='1012453555' order by hiscsec;
select * from hosvital.dspfrmc1 where hisckey='1012453555' order by hiscsec;
select * from hosvital.ingresos capbas where mpcedu in ( '1012453555','686338');
select * from hosvital.capbas where mpcedu in ( '1012453555','686338');

update  hosvital.capbas
set mpnhic='686338', mpnumhcin= '686338'
 where mpcedu in ('686338');

select * from hosvital.maecaue;