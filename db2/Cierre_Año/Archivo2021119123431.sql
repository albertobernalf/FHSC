SET SCHEMA HOSVITAL; --Cambiar Esquema
CREATE OR REPLACE PROCEDURE HOSVITAL.SP_INICIALIZAR_SALDOS (INOUT v_EMPCOD_IN   CHAR(2),  
                                                   INOUT v_AnioBase    SMALLINT,
                                                   INOUT v_AnioGene    SMALLINT, 
                                                   INOUT v_TipoCuentas CHAR(1)) --Cuentas Por Cobrar 'C' Cuentas por Pagar 'P')
LANGUAGE SQL
BEGIN
    DECLARE v_EMPCOD      CHAR(2);
	DECLARE v_Cntvig	  SMALLINT;
	DECLARE v_CntCod	  CHAR(20);
	DECLARE v_MCDpto	  CHAR(9);
	DECLARE v_NatCuenta   CHAR(1);
	DECLARE v_DC016C	  CHAR(20);
	DECLARE v_PrvCod	  CHAR(15);
	DECLARE v_HOPNoObl	  CHAR(15);
	DECLARE v_HOPTotCre	  DECIMAL(17,2);
	DECLARE v_HOPTotDeb	  DECIMAL(17,2);
	DECLARE v_CnUCod	  CHAR(3);
	DECLARE v_CnUSub	  CHAR(3);
	DECLARE v_VlrMov	  DECIMAL(17,2);
	DECLARE v_VAL_CUENTAS CHAR(1); /*Valida Cuentas Creadas en la tabla Cuentas*/
	DECLARE v_Creditos	  DECIMAL(17,2);
	DECLARE v_Debitos     DECIMAL(17,2);
	DECLARE v_ULTIMOID	  DECIMAL(18,0);
	DECLARE v_DetalleCntcod CHAR(1);

	/*HOJOBL*/
	DECLARE v_DOCCOD	 CHAR(3);			DECLARE v_HojNumObl	CHAR(15);
	DECLARE v_CLICOD	 CHAR(15);			DECLARE v_MENNIT	CHAR(13);
	DECLARE v_HojFchObl	 TIMESTAMP;			DECLARE v_HojVlrCuo	DECIMAL(17,2);
	DECLARE v_HojCuoIni	 DECIMAL(17,2);		DECLARE v_HojVlrObl	DECIMAL(17,2);
	DECLARE v_HojTotCre	 DECIMAL(17,2);		DECLARE v_HojTotDeb	DECIMAL(17,2); 
	DECLARE v_HojTipPag	 CHAR(3);			DECLARE v_HojTpPgDs	CHAR(30);
	DECLARE v_HojNumCuo	 INT;				DECLARE v_HojNroRem	INT;
	DECLARE v_HojFchRem	 DATE; 			    DECLARE v_HojNroRad	CHAR(20);
	DECLARE v_HojFchRad	 TIMESTAMP;			DECLARE v_HojTipGlo	CHAR(1);
	DECLARE v_HojStaGlo	 CHAR(1);			DECLARE v_HFchRecGl	DATE;
	DECLARE v_HjFchRadGl DATE;     		    DECLARE v_HjFCanObl	DATE;
	DECLARE v_HojVlrGlo	 DECIMAL(17,2);		DECLARE v_HOIndDev	CHAR(1);
	DECLARE v_HONoRadG	 CHAR(20);			DECLARE v_HojMaTipD	CHAR(2);
	DECLARE v_HojNroCas	 DECIMAL(15,0);		DECLARE v_HojCarRch	CHAR(1);
	DECLARE v_ConTip	 SMALLINT;			DECLARE v_ConCod	VARCHAR(20);
	DECLARE v_HojFchRch	 TIMESTAMP;			DECLARE v_HojUsrRch	CHAR(10);
	DECLARE v_HojIndFac	 CHAR(1);			DECLARE v_HojDocRes	CHAR(15);
	DECLARE v_HojNomRes	 CHAR(30);			DECLARE v_HojApeRes	CHAR(30);
	DECLARE v_HojCnsIng	 SMALLINT;			DECLARE v_HojEstHom	CHAR(1);
	DECLARE v_HojIndRec	 CHAR(1);			DECLARE v_HojPrf	CHAR(7);
	DECLARE v_HojFchRaR	 TIMESTAMP;			DECLARE v_HojNumRaR	CHAR(20);
	DECLARE v_HojUsuInf	 CHAR(10);			DECLARE v_HojFchInF	TIMESTAMP;
	DECLARE v_HojIndInF	 CHAR(1);			DECLARE v_HojOblClU	CHAR(10);
	DECLARE v_HojOblClF	 TIMESTAMP;			DECLARE v_HojOblClE	CHAR(3);
    
    /*HOJOBLPRV*/
	DECLARE v_CNCCOD	CHAR(9);		DECLARE v_CntSub	CHAR(9);
	DECLARE v_HOPFchObl	TIMESTAMP;		DECLARE v_HOPFchRad	TIMESTAMP; 
	DECLARE v_HOPTpPz	CHAR(3);		DECLARE v_HOPVlrCuo	DECIMAL(17,2);
	DECLARE v_HOPCuoIni	DECIMAL(17,2);	DECLARE v_HOPVlrObl	DECIMAL(17,2) ; 
	DECLARE v_HOPVlrMEx	DECIMAL(17,2);	DECLARE v_HOPMvTer	CHAR(1);
	DECLARE v_HojFchCan	DATE;		    DECLARE v_HOPEstAfPt CHAR(1);   
	DECLARE v_HojNroOC	DECIMAL(15,0);	DECLARE v_HojBasDes	DECIMAL(17,2);
	DECLARE v_HojDocOC	CHAR(3);		DECLARE v_HOPSedCau	CHAR(9);  
	DECLARE v_HOPDocCau	CHAR(3);		DECLARE v_HOPNroCau	DECIMAL(15,0);
	DECLARE v_HOPHom	CHAR(1);		DECLARE v_HojSedOc	CHAR(9); 
	DECLARE v_HOPCodCon	CHAR(13);	 	DECLARE v_HOPCodCoR	CHAR(13);
    SET v_VAL_CUENTAS = 'S';
    
    DECLARE GLOBAL TEMPORARY TABLE SESSION.v_T_PLANCUENTAS(CNTCOD_BASEP CHAR(20), CNTTRM CHAR(20)) ON COMMIT DELETE ROWS NOT LOGGED WITH REPLACE;
    CREATE INDEX SESSION.IND_v_T_PLANCUENTAS ON SESSION.v_T_PLANCUENTAS (CNTCOD_BASEP);
        
    DECLARE GLOBAL TEMPORARY TABLE SESSION.v_T_CNTCOD(CNTCOD_BASE CHAR(20), CNTCOD_GENE CHAR(20)) ON COMMIT DELETE ROWS NOT LOGGED WITH REPLACE;
    CREATE INDEX SESSION.IND_v_T_CNTCOD ON SESSION.v_T_CNTCOD (CNTCOD_BASE);
    
    DECLARE GLOBAL TEMPORARY TABLE  SESSION.v_T_MOVCXC(EMPCOD	 CHAR(2),		DOCCOD    CHAR(3),		MCDPTO    CHAR(9),
                                                       MVCXCNRO  DECIMAL(15,0), MCCCSC    DECIMAL(5,0), CNTVIG    DECIMAL(4,0),
                                                       MCCFCH    TIMESTAMP,		MVCXCMON  CHAR(3),		MVCXCTAS  DECIMAL(11,2),
                                                       MCCNUMOBL CHAR(15),	    CNTCOD    CHAR(20),  	MCCNAT    CHAR(1),
                                                       CLICOD    CHAR(15),		MENNIT    CHAR(13),     MCCVLR    DECIMAL(17,2),
                                                       CNUCOD    CHAR(3),		CNUSUB    CHAR(3),		CNCCOD    CHAR(9),
                                                       CNTSUB    CHAR(9),	    MCCCNC    CHAR(100),	MCCANU    CHAR(1),
                                                       MCCDOCFAC CHAR(3),       MVCCLIRCL CHAR(15),     MVCCNTRCL CHAR(20),
                                                       MOVPRF    CHAR(7)) ON COMMIT DELETE ROWS WITH REPLACE NOT LOGGED;
    CREATE UNIQUE INDEX SESSION.IND_v_MOVCXC ON SESSION.v_T_MOVCXC (EMPCOD, CLICOD, CntCod, CntVig, MCCNumObl, MCCDocFac);
    
    DECLARE GLOBAL TEMPORARY TABLE SESSION.v_T_MOVCXP(EMPCOD CHAR(2),		  DOCCOD CHAR(3),		  MCDPTO CHAR(9),
                                                      MVCXPNRO DECIMAL(15,0), MVCXPCSC DECIMAL(5,0),  CNTVIG DECIMAL(4,0), 
                                                      MVCXPFCH TIMESTAMP,	  MVCXPMB CHAR(3),	      MVCXPTC DECIMAL(11,2),
                                                      MVCXPNUOB CHAR(15),	  CNTCOD CHAR(20),	      PRVCOD CHAR(15), 
                                                      MVCXPNAT CHAR(1),		  MVCXPVAL DECIMAL(17,2), MVCXPVEX DECIMAL(17,2),
                                                      CNUCOD CHAR(3),         CNUSUB CHAR(3),		  CNCCOD CHAR(9),
                                                      CNTSUB CHAR(9),		  MVCXPCNC CHAR(100),	  MVCXPACT CHAR(1), 
                                                      MVCXPTER CHAR(1),		  FLJCAJCOD CHAR(4),	  FLJCAJCON CHAR(4)) ON COMMIT DELETE ROWS WITH REPLACE NOT LOGGED;
    CREATE UNIQUE INDEX SESSION.IND_v_T_MOVCXP ON SESSION.v_T_MOVCXP (EMPCOD, MCDpto, PrvCod, CntCod, CntVig, MvCxPNuOb);
    
    INSERT INTO SESSION.v_T_PLANCUENTAS
	SELECT CNTCOD, CNTTRM FROM CUENTAS WHERE EMPCOD = v_EMPCOD_IN AND CntVig = v_AnioGene ORDER BY CntCod;
    
   	IF EXISTS (SELECT * FROM TMPREP WHERE TMPREPPRC = 'VALIDA_CNTCOD_CXC') THEN
		UPDATE TMPREP
		SET TMPREPDAT = '0'
		WHERE TMPREPPRC = 'VALIDA_CNTCOD_CXC';
	ELSE
		SET v_ULTIMOID = (SELECT MAX(TMPREPID) + 1 FROM TMPREP);
		INSERT INTO TMPREP
		VALUES (v_ULTIMOID,'VALIDA_CNTCOD_CXC', '0');
	END IF;
	
	IF EXISTS (SELECT * FROM TMPREP WHERE TMPREPPRC = 'VALIDA_CNTCOD_CXP') THEN
		UPDATE TMPREP
		SET TMPREPDAT = '0'
		WHERE TMPREPPRC = 'VALIDA_CNTCOD_CXP';
	ELSE
		SET v_ULTIMOID = (SELECT MAX(TMPREPID) + 1 FROM TMPREP);
		INSERT INTO TMPREP
		VALUES (v_ULTIMOID, 'VALIDA_CNTCOD_CXP', '0');
	END IF;
	

     /*CUENTAS POR COBRAR*/
     IF(v_TipoCuentas = 'C') THEN
        FOR CUR_VALIDACUENTASC AS CUR_VALIDACUENTASC CURSOR FOR
            SELECT DISTINCT CNTCOD
            FROM HOJOBL
            WHERE EMPCOD = v_EMPCOD_IN AND CntVig = v_AnioBase
            GROUP BY CntCod
            HAVING (SUM(HojTotCre) - SUM(HojTotDeb)) <> 0
            DO
               SET v_CntCod = CNTCOD;

	INSERT INTO SESSION.v_T_CNTCOD (CNTCOD_BASE, CNTCOD_GENE)
	VALUES(v_CntCod, IFNULL((SELECT DC016C2 FROM DC016 WHERE DC016V1 = v_AnioBase AND DC016C1 = v_CNTCOD AND DC016TI = 1),v_CntCod));
	
	--SELECT DC016C2 INTO v_CntCod FROM DC016 WHERE DC016V1 = v_AnioBase AND DC016C1 = v_CNTCOD AND DC016TI = 1;
                
                	SELECT CntTrm INTO v_DetalleCntcod FROM SESSION.v_T_PLANCUENTAS WHERE CNTCOD_BASEP = v_CntCod FETCH FIRST 1 ROWS ONLY;
                
		IF (v_DetalleCntcod IS NULL OR v_DetalleCntcod = '') THEN
			UPDATE TMPREP
			SET TMPREPDAT = CONCAT('Debe crear la cuenta ',CONCAT(TRIM(v_CNTCOD), CONCAT(' para la Vigencia ', v_AnioBase)))
			WHERE TMPREPPRC = 'VALIDA_CNTCOD_CXC';
			SET v_VAL_CUENTAS = 'N';
		ELSE
                    		IF (v_DetalleCntcod <> 'D') THEN
    				UPDATE TMPREP
    				SET TMPREPDAT = CONCAT(CONCAT(CONCAT('Cuenta ',CONCAT(TRIM(v_CntCod), CONCAT(' no es de tipo Detalle para la Vigencia ', v_AnioGene))),' CNTTRM:'),v_DetalleCntcod)
    				WHERE TMPREPPRC = 'VALIDA_CNTCOD_CXC';
    				SET v_VAL_CUENTAS = 'N';
    			END IF;
		END IF;
        END FOR;
        /*MOVCXC Data del año a generar - Optimizado!*/
        INSERT INTO SESSION.v_T_MOVCXC
        SELECT * FROM MOVCXC WHERE EMPCOD = v_EMPCOD_IN AND CNTVIG = v_Cntvig ORDER BY  EMPCOD, CLICOD, CntCod, CntVig, MCCNumObl, MCCDocFac;
   
    
		IF(v_VAL_CUENTAS = 'S') THEN
			FOR CUR_CUENTASXCOBRAR AS CUR_CUENTASXCOBRAR CURSOR FOR
				SELECT *
				FROM HOJOBL
				WHERE EMPCOD = v_EMPCOD_IN AND CntVig = v_AnioBase
				GROUP BY EMPCOD,    HojNumObl, CLICOD,    CntVig,    CntCod,    MCDpto,    DOCCOD,    MENNIT,    CnUCod,    CnUSub,    HojFchObl, HojVlrCuo, HojCuoIni, 
						 HojVlrObl, HojTotCre, HojTotDeb, HojTipPag, HojTpPgDs, HojNumCuo, HojNroRem, HojFchRem, HojNroRad, HojFchRad, HojTipGlo, HojStaGlo, HFchRecGl, 
						 HjFchRadGl,HjFCanObl, HojVlrGlo, HOIndDev,  HONoRadG,  HojMaTipD, HojNroCas, HojCarRch, ConTip,    ConCod,	   HojFchRch, HojUsrRch, HojIndFac, 
						 HojDocRes, HojNomRes, HojApeRes, HojCnsIng, HojEstHom, HojIndRec, HojPrf,    HojFchRaR, HojNumRaR, HojUsuInf, HojFchInF, HojIndInF, HojOblClU, 
						 HojOblClF, HojOblClE
				HAVING (SUM(HojTotDeb) - SUM(HojTotCre)) <> 0
			DO
			SET (v_EMPCOD,    v_HojNumObl, v_CLICOD,    v_CntVig,    v_CntCod,    v_MCDpto,     v_DOCCOD, 
				 v_MENNIT,    v_CnUCod,    v_CnUSub,    v_HojFchObl, v_HojVlrCuo, v_HojCuoIni,  v_HojVlrObl, 
				 v_HojTotCre, v_HojTotDeb, v_HojTipPag, v_HojTpPgDs, v_HojNumCuo, v_HojNroRem,  v_HojFchRem, 
				 v_HojNroRad, v_HojFchRad, v_HojTipGlo, v_HojStaGlo, v_HFchRecGl, v_HjFchRadGl, v_HjFCanObl, 
				 v_HojVlrGlo, v_HOIndDev,  v_HONoRadG,  v_HojMaTipD, v_HojNroCas, v_HojCarRch,  v_ConTip,
				 v_ConCod,    v_HojFchRch, v_HojUsrRch, v_HojIndFac, v_HojDocRes, v_HojNomRes,  v_HojApeRes,
				 v_HojCnsIng, v_HojEstHom, v_HojIndRec, v_HojPrf,    v_HojFchRaR, v_HojNumRaR,  v_HojUsuInf,
				 v_HojFchInF, v_HojIndInF, v_HojOblClU, v_HojOblClF, v_HojOblClE) 
			=
				(EMPCOD,    HojNumObl, CLICOD,    CntVig,    CntCod,    MCDpto,     DOCCOD,
				 MENNIT,    CnUCod,    CnUSub,    HojFchObl, HojVlrCuo, HojCuoIni,  HojVlrObl,
				 HojTotCre, HojTotDeb, HojTipPag, HojTpPgDs, HojNumCuo, HojNroRem,  HojFchRem,
				 HojNroRad, HojFchRad, HojTipGlo, HojStaGlo, HFchRecGl, HjFchRadGl, HjFCanObl,
				 HojVlrGlo, HOIndDev,  HONoRadG,  HojMaTipD, HojNroCas, HojCarRch,  ConTip,
				 ConCod,    HojFchRch, HojUsrRch, HojIndFac, HojDocRes, HojNomRes,  HojApeRes,
				 HojCnsIng, HojEstHom, HojIndRec, HojPrf,    HojFchRaR, HojNumRaR,  HojUsuInf,
				 HojFchInF, HojIndInF, HojOblClU, HojOblClF, HojOblClE);
					
				
				SELECT CNTCOD_GENE INTO v_DC016C FROM SESSION.v_T_CNTCOD WHERE CNTCOD_BASE = v_CntCod;
				
				SELECT SUM(CASE WHEN MCCNat = 'C' THEN MCCVlr ELSE 0 END),
					   SUM(CASE WHEN MCCNat = 'D' THEN MCCVlr ELSE 0 END)
					   INTO v_Creditos, v_Debitos
				FROM SESSION.v_T_MOVCXC
				WHERE EMPCOD    = v_EMPCOD    AND CLICOD    = v_CLICOD AND  CntCod = v_CntCod AND CntVig = v_AnioGene AND
					  MCCNumObl = v_HojNumObl AND MCCDocFac = v_DOCCOD;
				
				/*Valida si Existe HOJOBL*/
				IF EXISTS ( SELECT 1
							FROM HOJOBL
							WHERE EMPCOD = v_EMPCOD AND HojNumObl = v_HojNumObl AND CLICOD = v_CLICOD AND CntVig = v_AnioGene AND
								  Cntcod = v_DC016C AND MCDpto = v_MCDpto AND DOCCOD = v_DOCCOD FETCH FIRST 1 ROWS ONLY) THEN
					UPDATE HOJOBL
					SET HojTotCre = (HojTotCre + IFNULL(v_Creditos,0)),
						HojTotDeb = (HojTotDeb + IFNULL(v_Debitos, 0))
					WHERE EMPCOD = v_EMPCOD AND HojNumObl = v_HojNumObl AND CLICOD = v_CLICOD AND CntVig = v_AnioGene AND 
						  Cntcod = v_CntCod AND MCDpto = v_MCDpto AND DOCCOD = v_DOCCOD;
				ELSE
					INSERT INTO HOJOBL
					VALUES (v_EMPCOD, v_HojNumObl, v_CLICOD, v_AnioGene, v_DC016C, v_MCDpto, v_DOCCOD, v_MENNIT, v_CnUCod, v_CnUSub, v_HojFchObl, v_HojVlrCuo, v_HojCuoIni, v_HojVlrObl, 
						   (v_HojTotCre + IFNULL(v_Creditos, 0)), (v_HojTotDeb + IFNULL(v_Debitos, 0)), v_HojTipPag, v_HojTpPgDs, v_HojNumCuo, v_HojNroRem, v_HojFchRem, v_HojNroRad, 
							v_HojFchRad, v_HojTipGlo, v_HojStaGlo, v_HFchRecGl, v_HjFchRadGl, v_HjFCanObl, v_HojVlrGlo, v_HOIndDev, v_HONoRadG, v_HojMaTipD, v_HojNroCas, v_HojCarRch, 
							v_ConTip, v_ConCod, v_HojFchRch, v_HojUsrRch, v_HojIndFac, v_HojDocRes, v_HojNomRes, v_HojApeRes, v_HojCnsIng, v_HojEstHom, v_HojIndRec, v_HojPrf, v_HojFchRaR,
							v_HojNumRaR, v_HojUsuInf, v_HojFchInF, v_HojIndInF, v_HojOblClU, v_HojOblClF, v_HojOblClE);
				END IF;
			END FOR;
		END IF;
    END IF;

    IF(v_TipoCuentas = 'P') THEN

	FOR CUR_VALIDACUENTASP AS CUR_VALIDACUENTASP CURSOR FOR
		SELECT DISTINCT CNTCOD
		FROM HOJOBLPRV
		WHERE EMPCOD = v_EMPCOD_IN AND CntVig = v_AnioBase
		GROUP BY CntCod
		HAVING (SUM(HOPTotCre) - SUM(HOPTotDeb)) <> 0
	DO
		SET v_CntCod = CNTCOD;

		INSERT INTO SESSION.v_T_CNTCOD (CNTCOD_BASE, CNTCOD_GENE)
		VALUES(v_CntCod, IFNULL((SELECT DC016C2 FROM DC016 WHERE DC016V1 = v_AnioBase AND DC016C1 = v_CNTCOD AND DC016TI = 1),v_CntCod));

		--SELECT DC016C2 INTO v_CntCod FROM DC016 WHERE DC016V1 = v_AnioBase AND DC016C1 = v_CNTCOD AND DC016TI = 1;
            
		SELECT CntTrm INTO v_DetalleCntcod FROM SESSION.v_T_PLANCUENTAS WHERE CNTCOD_BASEP = v_CntCod FETCH FIRST 1 ROWS ONLY;
            
		IF (v_DetalleCntcod IS NULL OR v_DetalleCntcod = '') THEN
			UPDATE TMPREP
			SET TMPREPDAT = CONCAT('Debe crear la cuenta ',CONCAT(TRIM(v_CNTCOD), CONCAT(' para la Vigencia ', v_AnioBase)))
			WHERE TMPREPPRC = 'VALIDA_CNTCOD_CXP';
			SET v_VAL_CUENTAS = 'N';
		ELSE
			IF (v_DetalleCntcod <> 'D') THEN
   				UPDATE TMPREP
   				SET TMPREPDAT = CONCAT(CONCAT(CONCAT('Cuenta ',CONCAT(TRIM(v_CntCod), CONCAT(' no es de tipo Detalle para la Vigencia ', v_AnioGene))),' CNTTRM:'),v_DetalleCntcod)
   				WHERE TMPREPPRC = 'VALIDA_CNTCOD_CXP';
    				SET v_VAL_CUENTAS = 'N';
    			END IF;
		END IF;
	END FOR;

	/*MOVCXP Data del año a generar - Optimizado!*/

	INSERT INTO SESSION.v_T_MOVCXP
	SELECT * FROM MOVCXP WHERE EMPCOD = v_EMPCOD_IN AND CNTVIG = v_Cntvig ORDER BY EMPCOD, MCDpto, PrvCod, CntCod, CntVig, MvCxPNuOb;
        
	IF(v_VAL_CUENTAS = 'S') THEN
		FOR CUR_CUENTASXPAGAR AS CUR_CUENTASXPAGAR CURSOR FOR
		SELECT *
		           FROM HOJOBLPRV
		           WHERE EMPCOD = v_EMPCOD_IN AND CntVig = v_AnioBase
		           GROUP BY EMPCOD,   PrvCod,    HOPNoObl,  MCDpto,    CntVig,    CntCod,    CnUCod,    CnUSub,   CNCCOD,    CntSub,     HOPFchObl, HOPFchRad, 
			HOPTpPz,  HOPVlrCuo, HOPCuoIni, HOPVlrObl, HOPVlrMEx, HOPTotCre, HOPTotDeb, HOPMvTer, HojFchCan, HOPEstAfPt, HojNroOC,  HojBasDes, 
			HojDocOC, HOPSedCau, HOPDocCau, HOPNroCau, HOPHom,    HojSedOc,  HOPCodCon, HOPCodCoR
			HAVING (SUM(HOPTotCre) - SUM(HOPTotDeb)) <> 0
		DO
			SET (v_EMPCOD,    v_PrvCod,     v_HOPNoObl, v_MCDpto,    v_CntVig,    v_CntCod,    v_CnUCod,    v_CnUSub,    v_CNCCOD,    v_CntSub, 
				v_HOPFchObl, v_HOPFchRad,  v_HOPTpPz,  v_HOPVlrCuo, v_HOPCuoIni, v_HOPVlrObl, v_HOPVlrMEx, v_HOPTotCre, v_HOPTotDeb, v_HOPMvTer,
				v_HojFchCan, v_HOPEstAfPt, v_HojNroOC, v_HojBasDes, v_HojDocOC,  v_HOPSedCau, v_HOPDocCau, v_HOPNroCau, v_HOPHom,    v_HojSedOc,
				v_HOPCodCon, v_HOPCodCoR)
			=   (EMPCOD,   PrvCod,    HOPNoObl,  MCDpto,    CntVig,    CntCod,    CnUCod,    CnUSub,   CNCCOD,    CntSub,     HOPFchObl, HOPFchRad, 
				HOPTpPz,  HOPVlrCuo, HOPCuoIni, HOPVlrObl, HOPVlrMEx, HOPTotCre, HOPTotDeb, HOPMvTer, HojFchCan, HOPEstAfPt, HojNroOC,  HojBasDes, 
				HojDocOC, HOPSedCau, HOPDocCau, HOPNroCau, HOPHom,    HojSedOc,  HOPCodCon, HOPCodCoR);
			
			SELECT CNTCOD_GENE INTO v_DC016C FROM SESSION.v_T_CNTCOD WHERE CNTCOD_BASE = v_CntCod ORDER BY CNTCOD_BASE;
				
			SELECT SUM(CASE WHEN MvCxPNat = 'C' THEN MvCxPVal ELSE 0 END),
				SUM(CASE WHEN MvCxPNat = 'D' THEN MvCxPVal ELSE 0 END)
				INTO v_Creditos, v_Debitos
			FROM SESSION.v_T_MOVCXP
			WHERE EMPCOD = v_EMPCOD AND MCDpto = v_MCDpto   AND PrvCod    = v_PrvCod   AND
				CntCod = v_DC016C AND CntVig = v_AnioGene AND MvCxPNuOb = v_HOPNoObl;
				
			/*Valida si Existe HOJOBLPRV*/
			
			IF EXISTS ( SELECT 1 FROM HOJOBLPRV
				WHERE EMPCOD = v_EMPCOD AND PrvCod = v_PrvCod AND HOPNoObl = v_HOPNoObl AND MCDpto = v_MCDpto AND 
					CntVig = v_AnioGene AND CntCod = v_DC016C FETCH FIRST 1 ROWS ONLY) THEN
				UPDATE HOJOBLPRV
				SET HOPTotCre = (HOPTotCre + IFNULL(v_Creditos,0)),
					HOPTotDeb = (HOPTotDeb + IFNULL(v_Debitos,0))
				WHERE EMPCOD = v_EMPCOD AND PrvCod = v_PrvCod AND HOPNoObl = v_HOPNoObl AND MCDpto = v_MCDpto AND 
									CntVig = v_AnioGene AND CntCod = v_DC016C;
				ELSE
					INSERT INTO HOJOBLPRV
					VALUES (v_EMPCOD, v_PrvCod, v_HOPNoObl, v_MCDpto, v_AnioGene, v_DC016C, v_CnUCod, v_CnUSub, v_CNCCOD, v_CntSub, v_HOPFchObl, v_HOPFchRad, v_HOPTpPz, v_HOPVlrCuo, 
							v_HOPCuoIni, v_HOPVlrObl, v_HOPVlrMEx, (IFNULL(v_HOPTotCre,0) + IFNULL(v_Creditos,0)), (IFNULL(v_HOPTotDeb,0) + IFNULL(v_Debitos,0)), v_HOPMvTer, 
							v_HojFchCan, v_HOPEstAfPt, v_HojNroOC, v_HojBasDes, v_HojDocOC, v_HOPSedCau, v_HOPDocCau, v_HOPNroCau, v_HOPHom, v_HojSedOc, v_HOPCodCon, v_HOPCodCoR);
			END IF;
		END FOR;
        	END IF;
        END IF;
END;

GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE HOSVITAL.SP_INICIALIZAR_SALDOS 
TO HOSVITAL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE HOSVITAL.SP_INICIALIZAR_SALDOS 
TO HVTCLI ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE HOSVITAL.SP_INICIALIZAR_SALDOS 
TO HVTFIN ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE HOSVITAL.SP_INICIALIZAR_SALDOS 
TO HVTSQL ; 
  
GRANT ALTER , EXECUTE   
ON SPECIFIC PROCEDURE HOSVITAL.SP_INICIALIZAR_SALDOS 
TO PROYECTO ;
