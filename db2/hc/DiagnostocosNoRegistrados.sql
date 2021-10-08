select count(*) from hosvital.hcdiagn;
select * from hosvital.hcdiagn;
select count(*) from hosvital.hccom1;

select * from hosvital.hccom1 
where hisfhorat >= '2019-05-01 00:00:00'  and fhcindesp  not in ('TR','EN') and (histipdoc,hisckey,hiscsec) not in (select histipdoc,hisckey,hiscsec from hosvital.hcdiagn) and 
		(histipdoc,hisckey,hiscsec) in (select histipdoc,hisckey,hiscsec from hosvital.hccom5)
order by hisckey,hiscsec;

SELECT * FROM HOSVITAL.TIPPROC; -- 2
select * from hosvital.hccom5; --

/*
-- Paciente : 1000220433  Folio 45 : Ordenado laboratorio e interconsultas, sin dx
                                            Folio 35 , 36 : Ordenados Procedimiento Qx

--Paciente :1000253528    Folio 56  Se formula Terapias hay interpretacion
	               Folio 75: Se formula Terapias hay interpretacion
	              Folio 90:   Se formula Terapias Oximetria hay interpretacion  
	              Folio 91:   Proced qX, hay interconsulta
	              Folio 92:   Proced No qX , laboratorios

-- Paciente : 1000283483      Folio 	12: Terapia Oximetria, Interpretacion
	                   Folio 14:  Formulacion de medicamentos e imagenex dx
                                                Folio 30: Tertapia de fonoaudilogia
                                                Folio 38: Terapia fisica integral
                                                Folio 69: ProcedNo Qx
	                  Folio 89: Terapia fisica integral

-- Paciente : 1016007132     Folio 3213: Terapia oximnetria, TERAPIA SODICA, TERAPIA RESPIRATORIA
	                  Folio 3243:    Registro de oximetria
	                  Folio 3244: TERAPIA, FORMULACION
                                               Folio 3265: Registro de oximetria. terapia integral
	                  Folio 3284: Registro de oximetria	

-- Hay que buscar las ordenes de laboratorio que no tengab dx
*/

-- mañana trabajar este query

select * from hosvital.hccom1 
where hisfhorat >= '2019-05-01 00:00:00'  and fhcindesp  not in ('TR','EN') and (histipdoc,hisckey,hiscsec) not in (select histipdoc,hisckey,hiscsec from hosvital.hcdiagn) and 
		(histipdoc,hisckey,hiscsec)  in (select a.histipdoc,a.hisckey,a.hiscsec
			                        from hosvital.hccom5 a ,hosvital.maepro m
			                        where a.hcprctip='2'  and     a.hcprccod = m.prcodi   and m.tpprcd=2 and   m. printres <> 'S'    )
order by hisckey,hiscsec;

/*
-- Paciente :  1000220433       Fol: 45 Hay laboratorios, interpretacion, interconsultas, examen fisico	
                       1000253528        Fol: 648 Evolucion soap, procedimientos qx 
                       1013649014      Fol : 32 : Hay motivos de consulta examen fisico,  formula medica , imagene dx  OPS , hay interconsultas, klaboratorios


	
*/
select * from hosvital.hccom5;
select * from hosvital.hccom5 where hisckey= '1013649014' and hiscsec = 32 and hcprctip=2;
select * from hosvital.hccom51 where hisckey= '1013649014' and hiscsec = 32 and hcprctpop=2 ; -- Estan Interpretados

-- Lo que hay que validar es el flag de diagnostico que No obliga a dar diagnostico cuando cierra el folio 


select * from hosvital.maepro where   prsta='S' and printres <> 'S' ;


select * from hosvital.maepro where prsta='S' and printres <> 'S' and tpprcd=2;

select * from hosvital.tipproc;

select * from hosvital.maepro where prsta='S' and  prdiagrsl='S' and tpprcd=2;  -- solo esta este proced  911028   	

