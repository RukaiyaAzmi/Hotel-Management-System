SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER offer_trigger
AFTER UPDATE OF roomRate ON RoomDetails
FOR EACH ROW 
WHEN (OLD.roomRate < NEW.roomRate) 
DECLARE 
   rate_diff number; 
BEGIN 
    rate_diff := :NEW.roomRate  - :OLD.roomRate; 
dbms_output.put_line('Old Room Rate: ' || :OLD.roomRate); 
dbms_output.put_line('New Room Rate: ' || :NEW.roomRate); 
dbms_output.put_line('Rate difference: ' || rate_diff); 
	
END; 
/ 