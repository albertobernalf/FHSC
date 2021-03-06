--  Generar SQL 
--  Versi?n:                   	V7R1M0 100423 
--  Generado en:              	12/07/21 09:04:48 
--  Base de datos relacional:       	IASP 
--  Opci?n de est?ndares:          	DB2 for i 
CREATE TRIGGER HOSVIPRU.TCONSULTORIOS 
	BEFORE INSERT ON HOSVIPRU.CONSUL 
	REFERENCING NEW AS MT2 
	FOR EACH ROW 
	MODE DB2ROW 
	SET OPTION  ALWBLK = *ALLREAD , 
	ALWCPYDTA = *OPTIMIZE , 
	COMMIT = *NONE , 
	DECRESULT = (31, 31, 00) , 
	DFTRDBCOL = *NONE , 
	DYNDFTCOL = *NO , 
	DYNUSRPRF = *USER , 
	SRTSEQ = *HEX   
	BEGIN ATOMIC 
INSERT INTO HOSVIPRU . CONSULL ( CONSCOD , CONSDET , ADICIONAL ) VALUES ( MT2 . CONSCOD , MT2 . CONSDET , 0 ) ; 
END  ;
