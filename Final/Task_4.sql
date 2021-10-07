SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE TRIGGER FIX_NAME 
BEFORE INSERT
ON APPS
FOR EACH ROW
DECLARE
    AppId NUMBER;
    name VARCHAR2(10);
    Rdate DATE;
BEGIN
    AppId := :NEW.APP_ID;
    name := :NEW.APP_NAME;
    Rdate := :NEW.RELEASE_DATE;
    name := UPPER(name);
    INSERT INTO APPS VALUES(AppId, name, Rdate);
END;
/