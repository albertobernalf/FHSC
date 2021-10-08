select * from hosvital.maeate where mpcedu= '6033909';

/*
F0250    	CONSULTA EXTERNA              	
F0252    	DIRECCION MEDICA              	
F0303    	UCI ADULTOS 4TO. PISO         	
F0311    	HOSPITALIZACION PAB 7° P NORTE	
F0408    	NEUROCIRUGIA                  	
F0501    	LABORATORIO CLINICO           	
F0603    	TERAPIA DE LENGUAJE           	
M0201    	CONSULTA EXTERNA              	
M0213    	CONSULTA NEUROCIRUGIA         	
M0301    	HOSPITALIZACION 7 NORTE       	
M0305    	UCI 4 PISO                    	
M0310    	MIOCARDIO                     	
M0501    	LAB CLINI Y UNID TRANSF       	
M0604    	TERAPIA LENGUAJE              	
M0801    	DIRECCION CIENTIFICA          	

*/

select * from hosvital.cencost where cnccod in ('F0250','F0252','F0303','F0311','F0408','F0501','F0603','M0310','M0201','M0801','M0305','M0301','M0213','M0501','M0604');

select * from hosvital.movinv4 where fchmvt >= '2019-07-01 00:00:00' AND MVTOCENCOS in ('F0250','F0252','F0303','F0311','F0408','F0501','F0603','M0310','M0201','M0801','M0305','M0301','M0213','M0501','M0604') ORDER BY MVTOCENCOS ;

/*
01	ISI	1150045	001      	1	0030MT01       	    	77  	2019-07-02 15:04:18.000000	S	1.00	               	F0250    	
01	ISI	1150045	001      	2	0262MT01       	    	77  	2019-07-02 15:04:18.000000	S	1.00	               	F0250    	
01	ISI	1150630	001      	1	0097PU01       	    	00  	2019-07-30 10:06:28.000000	S	10.00	               	F0250    	
01	ISI	1150639	001      	1	0023MQ08       	    	00  	2019-07-30 10:53:13.000000	S	10.00	               	F0250    	
01	ISI	1150639	001      	2	0010PU01       	    	00  	2019-07-30 10:53:13.000000	S	6.00	               	F0250    	
01	ISI	1150639	001      	3	0046MQ23       	    	00  	2019-07-30 10:53:13.000000	S	50.00	               	F0250    	
01	ISI	1150639	001      	4	0041PU01       	    	00  	2019-07-30 10:53:13.000000	S	100.00	               	F0250    	
01	ISI	1150639	001      	5	0048PU01       	    	00  	2019-07-30 10:53:13.000000	S	5.00	               	F0250    	
01	ISI	1150639	001      	6	0049PU01       	    	00  	2019-07-30 10:53:13.000000	S	1.00	               	F0250    	
01	ISI	1150639	001      	7	0005MQ31       	    	00  	2019-07-30 10:53:13.000000	S	200.00	               	F0250    	
01	ISI	1150639	001      	8	0009MQ37       	    	00  	2019-07-30 10:53:13.000000	S	10.00	               	F0250    	
01	ISI	1150639	001      	9	0018MQ60       	    	00  	2019-07-30 10:53:13.000000	S	2.00	               	F0250    	
01	ISI	1150639	001      	10	0097PU01       	    	00  	2019-07-30 10:53:13.000000	S	10.00	               	F0250    	
01	ISI	1150357	001      	1	0097PU01       	    	00  	2019-07-18 11:06:59.000000	S	5.00	               	F0252    	
01	ISI	1150357	001      	2	0028AC01       	    	00  	2019-07-18 11:06:59.000000	S	3.00	               	F0252    	

*/

