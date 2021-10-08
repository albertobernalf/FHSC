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
            "descripcion": "DERECHOS DE SALA DE OBSERVACIÓN EN URGENCIAS COMPLEJIDAD ALTA
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

SELECT '860007373' NitFacturador,'FESC' prefijo,m.mpnfac numeroDocumento,  'VACIO'   tipoDocumento, 'VACIO' subTipoDocumento,'true' generaRepresentacionGrafica, m.facfch fechaEmision, 'VACIO'  horaEmision,'COP' moneda,
'Empresa' unidadNegocio,'VACIO' tipoOperacion, 'VACIO' Plantilla,1 notif_Tipo, ter.trcemail notif_Valor,'VACIO' as pago_tipopago, 'VACIO' pago_codigomedio,(m.facfch + 30 days) pago_fechaVencimiento,
substring(maeemp.mecntr,1,9) adq_identificacion , case when tipdoc.tipcoddoc=1 then 11 end  adq_tipoIdentificacion, ter.trcrazsoc adq_razonSocial,  case when tpocont.tcocod = 5 then 49 end as  adq_tipoRegimen,  ter.trcemail adq_correo, 'VACIO'   adq_tipoPersona,   ter.trcrazsoc adq_nombreSucursal, ter.trcresfis  adq_responsabilidadesRUT,  'CO'  ubi_pais,  'VACIO' ubi_codigoMunicipio, ter.trcdir ubi_direccion,
m4.abonum  ant_comprobante, m4.afcvlrabo ant_valorAnticipo, 'COP'  ant_valorAnticipoMoneda,m.matotf tot_valorBruto, m.mavaab tot_valorAnticipos, m.matotf tot_valorTotalSinImpuestos,  m.matotf  tot_valorTotalConImpuestos, m.mavals  tot_valorNeto
FROM hosvital.maeate m
inner join hosvital.maeemp maeemp on (maeemp.mennit = m.mpmeni)
inner join hosvital.terceros ter on (ter.trccod=substring(maeemp.mecntr,1,9))
left join hosvital.maeate4 m4 on (m4.mpnfac = m.mpnfac)
left join hosvital.tipdoc tipdoc on (tipdoc.tipcoddoc = ter.trctpoide)
left join hosvital.tpocont tpocont on (tpocont.tcocod=ter.tcocod )
where m.mpnfac =662667;

-- QUERY_02 FEC

select * from hosvital.maeate2 where mpnfac = 662667 ORDER BY PRCODI;
select * from hosvital.maeate3 where mpnfac = 662667;
select * from hosvital.ressev where resnum = 662667;

SELECT  m2.macscp,'VACIO' as det_tipoDetalle, m2.prcodi det_valorCodigoInterno, maepro.prnomb det_descripcion,m2.macanpr  det_unidades, m2.mpinte det_valorUnitarioBruto, m2.mavatp det_valorBruto, 'COP' det_valorBrutoMoneda, 'VACIO' det_codigoEstandar, 'VACIO' det_unidadMedida,
m2.prcodi det_valorCodigoEstandar, 'VACIO' det_tributos_id,  'VACIO' det_tributos_nombre,  'true' det_tributos_esImpuesto, 'VACIO' det_tributos_valorImporte  , m2.mavatp det_tributos_valorBase,  'VACIO' det_tributos_porcentaje
FROM hosvital.maeate m
inner join hosvital.maeate2 m2 on (m2.mpnfac=m.mpnfac and m2.fcptpotrn='F' and m2.maesanup<>'S')
inner join hosvital.maepro maepro on (maepro.prcodi=m2.prcodi)
where m.mpnfac =662667
UNION
SELECT  m3.macscs,'VACIO' as det_tipoDetalle, m3.msreso det_valorCodigoInterno, maesum1.msnomg det_descripcion,m3.macans  det_unidades, m3.mavalu det_valorUnitarioBruto, m3.mavats det_valorBruto, 'COP' det_valorBrutoMoneda, 'VACIO' det_codigoEstandar, 'VACIO' det_unidadMedida,
m3.msreso det_valorCodigoEstandar, 'VACIO' det_tributos_id,  'VACIO' det_tributos_nombre,  'true' det_tributos_esImpuesto, 'VACIO' det_tributos_valorImporte  , m3.mavats det_tributos_valorBase,  'VACIO' det_tributos_porcentaje
FROM hosvital.maeate m
inner join hosvital.maeate3 m3 on (m3.mpnfac=m.mpnfac and m3.fcstpotrn='F' and m3.maesanus<>'S')
inner join hosvital.maesum1 maesum1 on (maesum1.msreso=m3.msreso)
where m.mpnfac =662667;
