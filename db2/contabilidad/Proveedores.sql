select * from  hosvital.proveedor1; -- prvcod, prvcon, prvcrgcon


select * from hosvital.terceros where trccod ='900165460';

select  t.trccod,t.trcrazsoc, t.trcemail, t.trcnit
from hosvital.terceros t
inner join hosvital.proveedor1 p on (p.prvcod = t.trccod)
where  t.trccod in ('900165460',
'900478503',
'830041488',
'800250382',
'800064971',
'900772150',
'20910721',
'830025281',
'900239540',
'860534045',
'890300234',
'900227871',
'900315454',
'860001942',
'900963642',
'860020309',
'805026666',
'860065795',
'900823156',
'830140047',
'830510758',
'860506831',
'830039229',
'830014588',
'900379030',
'860007336',
'860007336',
'860007336',
'900961620',
'79129960',
'800181579',
'890331949',
'900092123',
'900640136',
'800121151',
'830073068',
'830011670',
'830013234',
'900096193',
'830051760',
'828002423',
'860529890',
'901294352',
'823004940',
'900155107',
'800048014',
'800078522',
'800055542',
'860070958',
'899999327',
'860527377',
'19673622',
'900910454',
'900194982',
'900581838',
'830123164',
'830131869',
'901155076',
'900129575',
'800061357',
'900755773',
'811032919',
'800005014',
'900485365',
'900710022',
'901025545',
'860007218',
'901357140',
'901389081',
'900031064',
'890101815',
'900751920',
'830086759',
'860503565',
'830056202',
'830061856',
'900294380',
'800077635',
'830140380',
'830023819',
'900574807',
'830146016',
'20781506',
'830121176',
'900170805',
'830142523',
'804010334',
'900084847',
'830053755',
'860038579',
'830025149',
'860005114',
'900383361',
'900275035',
'900519323',
'80215611',
'830037946',
'830037946',
'901090750',
'900270461',
'860005396',
'830113035',
'890106527',
'830079375',
'900026143',
'860024141',
'860047163',
'17068260',
'79453283',
'805031223',
'830097029',
'811028445',
'900136603',
'811019499',
'800006583',
'900333306',
'900608408',
'900265297',
'900539662',
'900283067',
'900083977',
'900124455',
'800242106',
'901094828',
'811021765',
'830508200',
'900058196',
'811041784',
'805029546',
'860519267',
'830005771',
'900448208',
'900680808',
'900361174',
'830014193',
'830014193',
'900563107',
'52094553',
'860503326',
'800073587',
'900789717',
'900633240',
'830065332');