select mpcedu,mptdoc,mpnomc,mpestpac
 from capbas
where mpcedu in ('53331041','25465837','1072066213','10008357552','1021724952')

begin transaction;
update capbaS
set mpestpac='N'
where mpcedu in ('53331041','25465837','1072066213','10008357552','1021724952')
-- COMMIT

select mpcedu,ingcsc,desencriptar('.B:??>Ñ,:>') from ingresos
where mpcedu in ('1220415696')

select mpcedu,mptdoc,mpnomc,mpestpac
 from capbas
where mpcedu in ('1220415696')

-- usuario diego fernando gordillo

select mpcedu,ingcsc,desencriptar(ingusrreg) 
from ingresos
where mpcedu in ('1220415696')