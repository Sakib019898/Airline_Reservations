SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER contact_update 
BEFORE DELETE OR INSERT OR UPDATE ON client 
FOR EACH ROW 
WHEN (NEW.ID > 0) 
DECLARE 
   ; 
BEGIN 
    
   dbms_output.put_line('Old contact: ' || :OLD.phone); 
   dbms_output.put_line('New contact: ' || :NEW.phone); 
    
END; 
/ 