/*	
"documento": {
        "NITFacturador": "860007373",
        "prefijo": "FESC",
        "numeroDocumento": "662667",
        "tipoDocumento": 1,
        "subTipoDocumento": "01",
        "generaRepresentacionGrafica": true,
        "fechaEmision": "2021-07-15",
        "horaEmision": "13:30:10-05:00",
        "moneda": "COP",
        "unidadNegocio": "Empresa",
        "tipoOperacion": "10",
        "plantilla": "1",
        "notificaciones": [{
                "tipo": 1,
                "valor": ["recepcioncuentasmedicas@nuevaeps.com.co"]
            }
        ],
        "formaPago": {
            "tipoPago": 2,
            "codigoMedio": "1",
            "fechaVencimiento": "2021-08-14"
        }
    },
    "adquiriente": {
        "identificacion": "900156264",
        "tipoIdentificacion": 11,
        "razonSocial": "NUEVA EPS SA",
        "tipoRegimen": "49",
        "correo": "recepcioncuentasmedicas@nuevaeps.com.co",
        "tipoPersona": "1",
        "nombreSucursal": "NUEVA EPS SA",
        "responsabilidadesRUT": ["O-13"],
        "ubicacion": {
            "pais": "CO",
            "codigoMunicipio": "11001",
            "direccion": "CRA 85 K # 46A-66"
        }
    },
    "anticipos": [{
            "comprobante": "181639",
            "valorAnticipo": 260700.00,
            "valorAnticipoMoneda": "COP"
        }
    ],
    "totales": {
        "valorBruto": 11100519.00,
        "valorAnticipos": 260700.00,
        "valorTotalSinImpuestos": 11100519.00,
        "valorTotalConImpuestos": 11100519.00,
        "valorNeto": 10839819.00
    },


"detalles": [{
            "tipoDetalle": 1,
            "valorCodigoInterno": "5DSA01",
            "descripcion": "DERECHOS DE SALA DE OBSERVACION EN URGENCIAS COMPLEJIDAD ALTA
            ",
            "unidades": 1.00,
            "valorUnitarioBruto": 50221.00,
            "valorBruto": 50221.00,
            "valorBrutoMoneda": "COP",
            "codigoEstandar": "999",
            "unidadMedida": "04",
            "valorCodigoEstandar": "5DSA01",
            "tributos": [{
                    "id": "01",
                    "nombre": "01",
                    "esImpuesto": true,
                    "valorImporte": 0.00,
                    "valorBase": 50221.00,
                    "porcentaje": 0.00
                }
            ]
        }, {



--------------------------------------
----------------------------------------

*/

SELECT facfch, mactving, mpcedu FROM HOSVITAL.MAEATE WHERE MATIPDOC= 5 AND MPNFAC = 662667;
select * from hosvital.ingresos where mpcedu='20327644'	;
select * from hosvital.terceros where trccod='900156264';-- trctpoide,, trcmdcodd,, trcmdcodm,, trcmdcodb
select * from hosvital.maedmb;
select * from hosvital.maedmb1 where mdcodd=11 and mdcodm=1;
select * from hosvital.maedmb2 order by mdcodb;

select * from hosvital.tipter;
select * from hosvital.tipent;
select * from hosvital.tipent1;
select * from hosvital.tpocont;
select * from hosvital.tipdoc; -- tipcoddoc
select * from hosvital.maeemp where mennit='NUEVACONTRB21';

SELECT * FROM HOSVITAL.MAEATE WHERE MATIPDOC= 5 AND MPNFAC = 662667	;
select * from hosvital.abonos where mpcedu= '20327644';
select * from hosvital.abonos1 where abonum =181639;
select * from hosvital.abonos2 where abonum =181639;
select  * from hosvital.maeate4 where mpnfac = 	662667;

-- QUERY_01 FEC

SELECT '860007373' NitFacturador,'FESC' prefijo,m.mpnfac numeroDocumento,  'VACIO'   tipoDocumento, 'VACIO' subTipoDocumento,'true' generaRepresentacionGrafica, m.facfch fechaEmision, m.facfchhor  horaEmision,'COP' moneda,
'Empresa' unidadNegocio,'VACIO' tipoOperacion, 'VACIO' Plantilla,1 notif_Tipo, ter.trcemail notif_Valor,'VACIO' as pago_tipopago, 'VACIO' pago_codigomedio,(m.facfch + 30 days) pago_fechaVencimiento,
substring(maeemp.mecntr,1,9) adq_identificacion , case when tipdoc.tipcoddoc=1 then 11 end  adq_tipoIdentificacion, ter.trcrazsoc adq_razonSocial,  ter.trcregfis as  adq_tipoRegimen,  ter.trcemail adq_correo, 'VACIO'   adq_tipoPersona,   ter.trcrazsoc adq_nombreSucursal, ter.trcresfis  adq_responsabilidadesRUT,  'CO'  ubi_pais,  'VACIO' ubi_codigoMunicipio, ter.trcdir ubi_direccion,
m4.abonum  ant_comprobante, m4.afcvlrabo ant_valorAnticipo, 'COP'  ant_valorAnticipoMoneda,m.matotf tot_valorBruto, m.mavaab tot_valorAnticipos, m.matotf tot_valorTotalSinImpuestos,  m.matotf  tot_valorTotalConImpuestos, m.mavals  tot_valorNeto
FROM hosvital.maeate m
inner join hosvital.maeemp maeemp on (maeemp.mennit = m.mpmeni)
inner join hosvital.terceros ter on (ter.trccod=substring(maeemp.mecntr,1,9))
left join hosvital.maeate4 m4 on (m4.mpnfac = m.mpnfac)
left join hosvital.tipdoc tipdoc on (tipdoc.tipcoddoc = ter.trctpoide)
left join hosvital.tpocont tpocont on (tpocont.tcocod=ter.tcocod )
where m.mpnfac =662667;
--where m.facfch >= '2021-07-01';

-- QUERY_02 FEC

select * from hosvital.maeate2 where mpnfac = 662667 ORDER BY PRCODI;
select * from hosvital.maeate3 where mpnfac = 662667;
select * from hosvital.ressev where resnum = 662667;

SELECT  m2.macscp consec,'VACIO' as det_tipoDetalle, m2.prcodi det_valorCodigoInterno, maepro.prnomb det_descripcion,m2.macanpr  det_unidades, m2.mpinte det_valorUnitarioBruto, m2.mavatp det_valorBruto, 'COP' det_valorBrutoMoneda, 'VACIO' det_codigoEstandar, 'VACIO' det_unidadMedida,
m2.prcodi det_valorCodigoEstandar, 'VACIO' det_tributos_id,  'VACIO' det_tributos_nombre,  'true' det_tributos_esImpuesto, 'VACIO' det_tributos_valorImporte  , m2.mavatp det_tributos_valorBase,  'VACIO' det_tributos_porcentaje
FROM hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.fcptpotrn='F' and m2.maesanup<>'S')
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
where m.mpnfac =662667
UNION
SELECT  m3.macscs consec,'VACIO' as det_tipoDetalle, m3.msreso det_valorCodigoInterno, maesum1.msnomg det_descripcion,m3.macans  det_unidades, m3.mavalu det_valorUnitarioBruto, m3.mavats det_valorBruto, 'COP' det_valorBrutoMoneda, 'VACIO' det_codigoEstandar, 'VACIO' det_unidadMedida,
m3.msreso det_valorCodigoEstandar, 'VACIO' det_tributos_id,  'VACIO' det_tributos_nombre,  'true' det_tributos_esImpuesto, 'VACIO' det_tributos_valorImporte  , m3.mavats det_tributos_valorBase,  'VACIO' det_tributos_porcentaje
FROM hosvital.maeate m
inner join hosvital.maeate3 m3 on (m3.mpnfac=m.mpnfac and m3.fcstpotrn='F' and m3.maesanus<>'S')
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=m3.msreso)
where m.mpnfac =662667;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Como seria wel query en JSON 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Query 01	

SELECT '"{Documento" : {"NitFacturador":',
'"860007373",' NitFacturador,'"Prefijo" : "FESC",' prefijo,'"numeroDocumento"  : '  ,concat(concat('"' ,m.mpnfac),'",') numeroDocumento,  '"TipoDocumento": 1 , '   tipoDocumento, '"subTipoDocumento": "01",' subTipoDocumento,'"generaRepresentacionGrafica" : true ,' generaRepresentacionGrafica, '"fechaEmision": ' ,concat(concat(concat('"',cast(m.facfch as varchar(10))) , '"'),',')  fechaEmision,'"horaEmision" : "00:00:00" ,' horaEmision,'"moneda" : "COP",' moneda,'"unidadNegocio" : "Empresa",' unidadNegocio,'"tipoOperacion": "10",' tipoOperacion, '"plantilla" : ,"1",' , '"notificaciones": [{ "tipo": 1,' as  notif_Tipo,    
 '"valor": [" ',concat( ter.trcemail,'"]} ],  "formaPago": { '   ) notif_Valor,    ' "tipoPago": 2, "codigoMedio": "1",' as pago_tipopago, '"fechaVencimiento": '   , concat(concat('"',cast((m.facfch + 30 days)  as varchar(10))),'" } },"adquiriente": { ') pago_fechaVencimiento,' "identificacion":', concat(concat('"',substring(maeemp.mecntr,1,9)),'",') adq_identificacion , '"tipoIdentificacion":' ,  concat(case when tipdoc.tipcoddoc=1 then 11 end,',')  adq_tipoIdentificacion,
 '"razonSocial":', concat(concat('"',ter.trcrazsoc),'",') adq_razonSocial,  '"tipoRegimen":',  concat(concat('"',case when tpocont.tcocod = 5 then 49 end),'",') as  adq_tipoRegimen, 
'"correo":',  concat(concat('"', ter.trcemail),'",')  adq_correo, '"tipoPersona": "1",'   adq_tipoPersona, ' "nombreSucursal":' , concat(concat('"', ter.trcrazsoc),'",') adq_nombreSucursal, 
concat(concat('"responsabilidadesRUT": ["', ter.trcresfis),  '"], "ubicacion": { "pais": "CO",  "codigoMunicipio": "11001",  ')  adq_responsabilidadesRUT, ' "direccion":',  concat(concat('"',ter.trcdir),'"') ubi_direccion, ' } }, "anticipos": [{comprobante":',
concat(concat('"',m4.abonum ),'",') ant_comprobante, ' "valorAnticipo":',  concat(m4.afcvlrabo,',') ant_valorAnticipo, '"valorAnticipoMoneda": "COP"'  ant_valorAnticipoMoneda,'}],"totales": {',
'"valorBruto":',    concat( m.matotf,',')  tot_valorBruto, '"valorAnticipos":',concat(m.mavaab,',')  tot_valorAnticipos,'"valorTotalSinImpuestos": ' ,concat( m.matotf,',') tot_valorTotalSinImpuestos, '"valorTotalConImpuestos":', concat(m.matotf,',')  tot_valorTotalConImpuestos,   '"valorNeto": ' , concat(m.mavals  ,'},"detalles": [{') tot_valorNeto
FROM hosvital.maeate m
inner join hosvital.maeemp maeemp on (maeemp.mennit = m.mpmeni)
inner join hosvital.terceros ter on (ter.trccod=substring(maeemp.mecntr,1,9))
left join hosvital.maeate4 m4 on (m4.mpnfac = m.mpnfac)
left join hosvital.tipdoc tipdoc on (tipdoc.tipcoddoc = ter.trctpoide)
left join hosvital.tpocont tpocont on (tpocont.tcocod=ter.tcocod )
where m.mpnfac =662667;

-- Query 02

SELECT  '{"tipoDetalle": 1,',  '"valorCodigoInterno": ' ,concat(concat('"',m2.macscp),'",') consec, '  "valorCodigoInterno":' , concat(concat('"', m2.prcodi),'",') det_valorCodigoInterno, ' "descripcion":' , concat(concat('"',maepro.prnomb),'",') det_descripcion, '"unidades": ' ,concat(m2.macanpr,',')  det_unidades,' "valorUnitarioBruto":' , concat(substring(m2.mpinte ,1, (locate('.',m2.mpinte)+2)),',')                det_valorUnitarioBruto, '"valorBruto": ' ,concat(m2.mavatp,',') det_valorBruto, ' "valorBrutoMoneda": "COP",' det_valorBrutoMoneda, '  "codigoEstandar": "999", "unidadMedida": "04",' det_unidadMedida,'"valorCodigoEstandar": ' ,
concat(concat('"', m2.prcodi),'",') det_valorCodigoEstandar,    '   "tributos": [{  "id": "01",  "nombre": "01",  "esImpuesto": true,  "valorImporte": 0.00,  "valorBase": '   , concat(m2.mavatp,',') det_tributos_valorBase,  '  "porcentaje": 0.00          }] },' det_tributos_porcentaje
FROM hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.fcptpotrn='F' and m2.maesanup<>'S')
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
where m.mpnfac =662667
UNION
SELECT   '{"tipoDetalle": 1,',  '"valorCodigoInterno": ' ,    concat(concat('"', m3.macscs),'",') consec,'  "valorCodigoInterno":' ,  concat(concat('"',m3.msreso),'",') det_valorCodigoInterno, '"descripcion": ' , concat(concat('"', maesum1.msnomg),'",') det_descripcion,'"unidades": ' ,concat(m3.macans , ',') det_unidades,' "valorUnitarioBruto":',  concat(substring(m3.mavalu,1, (locate('.',m3.mavalu)+2)),',')                det_valorUnitarioBruto, '"valorBruto": ' ,concat(m3.mavats,',') det_valorBruto, ' "valorBrutoMoneda": "COP",' det_valorBrutoMoneda, '  "codigoEstandar": "999",    "unidadMedida": "04",' det_unidadMedida,'"valorCodigoEstandar": ' ,
concat(concat('"',m3.msreso),'",') det_valorCodigoEstandar,   ' "tributos": [{ "id": "01", "nombre": "01", "esImpuesto": true,  "valorImporte": 0.00, "valorBase": '           , concat(m3.mavats,',')  det_tributos_valorBase,  '  "porcentaje": 0.00         }] },' det_tributos_porcentaje
FROM hosvital.maeate m
inner join hosvital.maeate3 m3 on (m3.mpnfac=m.mpnfac and m3.fcstpotrn='F' and m3.maesanus<>'S')
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=m3.msreso)
where m.mpnfac =662667;

-- Query 03
-- El ultimo seria

--select '] } ]}' from 'X'

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- ULTIMA VERSION TODOS CONCATENADOS PARA FORMAR UN  SOLO JSON
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------


SELECT CONCAT(CONCAT(  CONCAT( CONCAT(  CONCAT( CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT( CONCAT(CONCAT( CONCAT(CONCAT(CONCAT(   CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(    CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT('"{Documento" : {"NitFacturador":',
'"860007373",'),'"Prefijo" : "FESC",'),'"numeroDocumento"  : ')  ,concat(concat('"' ,m.mpnfac),'",')),  '"TipoDocumento": 1 , ' ), '"subTipoDocumento": "01",'),'"generaRepresentacionGrafica" : true ,'), '"fechaEmision": ') ,concat(concat(concat('"',cast(m.facfch as varchar(10))) , '"'),',')),'"horaEmision" : "00:00:00" ,'),'"moneda" : "COP",'),'"unidadNegocio" : "Empresa",'),'"tipoOperacion": "10",' ) , '"plantilla" : ,"1",')     , '"notificaciones": [{ "tipo": 1,'),   
 '"valor": [" ')  ,concat( ter.trcemail,'"]} ],  "formaPago": { '   ) ),    ' "tipoPago": 2, "codigoMedio": "1",'), '"fechaVencimiento": ')   , concat(concat('"',cast((m.facfch + 30 days)  as varchar(10))),'" } },"adquiriente": { ')),' "identificacion":'), concat(concat('"',substring(maeemp.mecntr,1,9)),'",')) , '"tipoIdentificacion":'),  concat(case when tipdoc.tipcoddoc=1 then 11 end,',') ), '"razonSocial":' )   , concat(concat('"',ter.trcrazsoc),'",')) ,  '"tipoRegimen":'),  concat(concat('"',case when tpocont.tcocod = 5 then 49 end),'",')), '"correo":'),  concat(concat('"', ter.trcemail),'",')), '"tipoPersona": "1",' ), ' "nombreSucursal":' ), concat(concat('"', ter.trcrazsoc),'",'))  , 
concat(concat('"responsabilidadesRUT": ["', ter.trcresfis),  '"], "ubicacion": { "pais": "CO",  "codigoMunicipio": "11001",  '))  , ' "direccion":'),  concat(concat('"',ter.trcdir),'"') ), ' } }, "anticipos": [{comprobante":'),
concat(concat('"',m4.abonum ),'",') )  , ' "valorAnticipo":'),  concat(m4.afcvlrabo,',') ) , '"valorAnticipoMoneda": "COP"')  ,'}],"totales": {'),
'"valorBruto":') ,    concat( m.matotf,',')  ), '"valorAnticipos":')   ,  concat(m.mavaab,',')  ) ,'"valorTotalSinImpuestos": ') ,concat( m.matotf,',') ), '"valorTotalConImpuestos":'), concat(m.matotf,',')  ),   '"valorNeto": ') , concat(m.mavals  ,'},"detalles": [{') )
FROM hosvital.maeate m
inner join hosvital.maeemp maeemp on (maeemp.mennit = m.mpmeni)
inner join hosvital.terceros ter on (ter.trccod=substring(maeemp.mecntr,1,9))
left join hosvital.maeate4 m4 on (m4.mpnfac = m.mpnfac)
left join hosvital.tipdoc tipdoc on (tipdoc.tipcoddoc = ter.trctpoide)
left join hosvital.tpocont tpocont on (tpocont.tcocod=ter.tcocod )
where m.mpnfac =662667;

-- y el segundo query

SELECT CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT( CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(
'{"tipoDetalle": 1,',  '"valorCodigoInterno": ') ,concat(concat('"',m2.macscp),'",')), '  "valorCodigoInterno":') , concat(concat('"', m2.prcodi),'",')), ' "descripcion":') , concat(concat('"',maepro.prnomb),'",')), '"unidades": ') ,concat(m2.macanpr,',')  ),' "valorUnitarioBruto":') , concat(substring(m2.mpinte ,1, (locate('.',m2.mpinte)+2)),',') ), '"valorBruto": ' ) ,concat(m2.mavatp,',') ), ' "valorBrutoMoneda": "COP",' ), '  "codigoEstandar": "999", "unidadMedida": "04",' ),'"valorCodigoEstandar": ') ,
concat(concat('"', m2.prcodi),'",') ),    '   "tributos": [{  "id": "01",  "nombre": "01",  "esImpuesto": true,  "valorImporte": 0.00,  "valorBase": ')   , concat(m2.mavatp,',') ),  '  "porcentaje": 0.00          }] },' )
FROM hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.fcptpotrn='F' and m2.maesanup<>'S')
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
where m.mpnfac =662667
UNION
SELECT  CONCAT(CONCAT(CONCAT( CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT( CONCAT(  CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(
'{"tipoDetalle": 1,',  '"valorCodigoInterno": ') ,    concat(concat('"', m3.macscs),'",')),'  "valorCodigoInterno":') ,  concat(concat('"',m3.msreso),'",')) , '"descripcion": ') , concat(concat('"', maesum1.msnomg),'",')),'"unidades": ') ,concat(m3.macans , ',') ),' "valorUnitarioBruto":'),  concat(substring(m3.mavalu,1, (locate('.',m3.mavalu)+2)),',')  ), '"valorBruto": ') ,concat(m3.mavats,',') ), ' "valorBrutoMoneda": "COP",' ), '  "codigoEstandar": "999",    "unidadMedida": "04",' ),'"valorCodigoEstandar": ') ,
concat(concat('"',m3.msreso),'",') ),   ' "tributos": [{ "id": "01", "nombre": "01", "esImpuesto": true,  "valorImporte": 0.00, "valorBase": '  )         , concat(m3.mavats,',')  ),  '  "porcentaje": 0.00         }] },' )
FROM hosvital.maeate m
inner join hosvital.maeate3 m3 on (m3.mpnfac=m.mpnfac and m3.fcstpotrn='F' and m3.maesanus<>'S')
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=m3.msreso)
where m.mpnfac =662667;